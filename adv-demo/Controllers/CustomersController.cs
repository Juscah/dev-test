using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using adv_demo.Models;
using adv_demo.Models.Database;

namespace adv_demo.Controllers
{
    public class CustomersController : Controller
    {
        private DemoEntities db = new DemoEntities();

        // GET: Customers
        public ActionResult Index()
        {
            return View(db.Customers.ToList());
        }
        public ActionResult AjaxMethod(DataParams parameters)
        {
            int dbRecordCount = 0;

            var customers = db.Customers.AsEnumerable();

            //Sorting    
            var sortColumnIndex = parameters.iSortCol_0;
            var sortDirection = parameters.sSortDir_0;

            if (sortColumnIndex == 3)
            {
                customers = sortDirection == "asc" ? customers.OrderBy(x => x.CustomerID) : customers.OrderByDescending(x => x.CustomerID);
            }
            else if (sortColumnIndex == 4)
            {
                customers = sortDirection == "asc" ? customers.OrderBy(x => x.NameStyle) : customers.OrderByDescending(x => x.NameStyle);
            }
            else if (sortColumnIndex == 5)
            {
                customers = sortDirection == "asc" ? customers.OrderBy(x => x.Title) : customers.OrderByDescending(x => x.Title);
            }
            else if (sortColumnIndex == 6)
            {
                customers = sortDirection == "asc" ? customers.OrderBy(x => x.FirstName) : customers.OrderByDescending(x => x.FirstName);
            }
            else if (sortColumnIndex == 7)
            {
                customers = sortDirection == "asc" ? customers.OrderBy(x => x.MiddleName) : customers.OrderByDescending(x => x.MiddleName);
            }
            else if (sortColumnIndex == 8)
            {
                customers = sortDirection == "asc" ? customers.OrderBy(x => x.LastName) : customers.OrderByDescending(x => x.LastName);
            }
            else if (sortColumnIndex == 9)
            {
                customers = sortDirection == "asc" ? customers.OrderBy(x => x.Suffix) : customers.OrderByDescending(x => x.Suffix);
            }
            else if (sortColumnIndex == 10)
            {
                customers = sortDirection == "asc" ? customers.OrderBy(x => x.CompanyName) : customers.OrderByDescending(x => x.CompanyName);
            }
            else if (sortColumnIndex == 11)
            {
                customers = sortDirection == "asc" ? customers.OrderBy(x => x.SalesPerson) : customers.OrderByDescending(x => x.SalesPerson);
            }
            else if (sortColumnIndex == 12)
            {
                customers = sortDirection == "asc" ? customers.OrderBy(x => x.EmailAddress) : customers.OrderByDescending(x => x.EmailAddress);
            }
            else if (sortColumnIndex == 13)
            {
                customers = sortDirection == "asc" ? customers.OrderBy(x => x.Phone) : customers.OrderByDescending(x => x.Phone);
            }
            else if (sortColumnIndex == 14)
            {
                customers = sortDirection == "asc" ? customers.OrderBy(x => x.PasswordHash) : customers.OrderByDescending(x => x.PasswordHash);
            }
            else if (sortColumnIndex == 15)
            {
                customers = sortDirection == "asc" ? customers.OrderBy(x => x.PasswordSalt) : customers.OrderByDescending(x => x.PasswordSalt);
            }
            else if (sortColumnIndex == 16)
            {
                customers = sortDirection == "asc" ? customers.OrderBy(x => x.rowguid) : customers.OrderByDescending(x => x.rowguid);
            }
            else
            {
                customers = sortDirection == "asc" ? customers.OrderBy(x => x.ModifiedDate) : customers.OrderByDescending(x => x.ModifiedDate);
            }




            if (!string.IsNullOrEmpty(parameters.sSearch))
            {
                customers = customers.Where(x => x.NameStyle.ToString().ToLower().Contains(parameters.sSearch.ToLower())
                    || x.CustomerID.ToString().ToLower().Contains(parameters.sSearch.ToLower())
                    || x.FirstName.ToLower().Contains(parameters.sSearch.ToLower())
                
                    || x.LastName.ToLower().Contains(parameters.sSearch.ToLower())
               
                    || x.CompanyName.ToLower().Contains(parameters.sSearch.ToLower())
             
                    || x.EmailAddress.ToLower().Contains(parameters.sSearch.ToLower())
                    || x.Phone.ToLower().Contains(parameters.sSearch.ToLower())
                    || x.ModifiedDate.ToString("dd'/'MM'/'yyyy").ToLower().Contains(parameters.sSearch.ToLower())).ToList();
            }


            dbRecordCount = customers.Count();

            //Paging     
            var displayResult = customers.Skip(parameters.iDisplayStart).Take(parameters.iDisplayLength).ToList();

            //convert data into json format    
            return Json(new
            {
                parameters.sEcho,
                iTotalRecords = dbRecordCount,
                iTotalDisplayRecords = dbRecordCount,
                aaData = displayResult.Select(x => new {
                    x.CustomerID,
                    x.NameStyle,
                    x.Title,
                    x.FirstName,
                    x.MiddleName,
                    x.LastName,
                    x.Suffix,
                    x.CompanyName,
                    x.SalesPerson,
                    x.EmailAddress,
                    x.Phone,
                    x.PasswordHash,
                    x.PasswordSalt,
                    x.rowguid,
                    ModifiedDate = x.ModifiedDate.ToString("g"),
                  
                })
            }, JsonRequestBehavior.AllowGet);
        }
        // GET: Customers/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            return View(customer);
        }

        // GET: Customers/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Customers/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CustomerID,NameStyle,Title,FirstName,MiddleName,LastName,Suffix,CompanyName,SalesPerson,EmailAddress,Phone,PasswordHash,PasswordSalt,rowguid,ModifiedDate")] Customer customer)
        {
            if (ModelState.IsValid)
            {
                db.Customers.Add(customer);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(customer);
        }

        // GET: Customers/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            return View(customer);
        }

        // POST: Customers/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CustomerID,NameStyle,Title,FirstName,MiddleName,LastName,Suffix,CompanyName,SalesPerson,EmailAddress,Phone,PasswordHash,PasswordSalt,rowguid,ModifiedDate")] Customer customer)
        {
            if (ModelState.IsValid)
            {
                db.Entry(customer).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(customer);
        }

        // GET: Customers/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            return View(customer);
        }

        // POST: Customers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Customer customer = db.Customers.Find(id);
            db.Customers.Remove(customer);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
