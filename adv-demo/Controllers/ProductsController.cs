using System;
using adv_demo.Models.Database;
using System.Data.Entity;
using System.Net;
using System.Threading.Tasks;
using System.Web.Mvc;
using System.Collections.Generic;
using System.Linq;
using adv_demo.Models;

namespace adv_demo.Controllers
{
    public class ProductsController : Controller
    {
        private readonly DemoEntities _db = new DemoEntities();

        // GET: Products
        public async Task<ActionResult> Index()
        {
            var products = _db.Products;

            return View(await products.ToListAsync());
        }
        //Get request for fetching data 
        [HttpGet]
        public ActionResult AjaxMethod(DataParams parameters)
        {
            int dbRecordCount = 0;

            var products = _db.Products.AsEnumerable();

            //Sorting    
            var sortColumnIndex = parameters.iSortCol_0;
            var sortDirection = parameters.sSortDir_0;

            if (sortColumnIndex == 3)
            {
                products = sortDirection == "asc" ? products.OrderBy(x => x.ProductNumber) : products.OrderByDescending(x => x.ProductNumber);
            }
            else if (sortColumnIndex == 4)
            {
                products = sortDirection == "asc" ? products.OrderBy(x => x.Color) : products.OrderByDescending(x => x.Color);
            }
            else if (sortColumnIndex == 5)
            {
                products = sortDirection == "asc" ? products.OrderBy(x => x.StandardCost) : products.OrderByDescending(x => x.StandardCost);
            }
            else if (sortColumnIndex == 6)
            {
                products = sortDirection == "asc" ? products.OrderBy(x => x.ListPrice) : products.OrderByDescending(x => x.ListPrice);
            }
            else if (sortColumnIndex == 7)
            {
                products = sortDirection == "asc" ? products.OrderBy(x => x.Size) : products.OrderByDescending(x => x.Size);
            }
            else if (sortColumnIndex == 8)
            {
                products = sortDirection == "asc" ? products.OrderBy(x => x.Weight) : products.OrderByDescending(x => x.Weight);
            }
            else if (sortColumnIndex == 9)
            {
                products = sortDirection == "asc" ? products.OrderBy(x => x.ModifiedDate) : products.OrderByDescending(x => x.ModifiedDate);
            }
            else if (sortColumnIndex == 10)
            {
                products = sortDirection == "asc" ? products.OrderBy(x => x.ProductCategory.Name) : products.OrderByDescending(x => x.ProductCategory.Name);
            }
            else if (sortColumnIndex == 11)
            {
                products = sortDirection == "asc" ? products.OrderBy(x => x.ProductModel.Name) : products.OrderByDescending(x => x.ProductModel.Name);
            }
            else
            {
                products = sortDirection == "asc" ? products.OrderBy(x => x.Name) : products.OrderByDescending(x => x.Name);
            }


            
            // searching
            if (!string.IsNullOrEmpty(parameters.sSearch))
            {
                products = products.Where(x => x.Name.ToLower().Contains(parameters.sSearch.ToLower())
                    || x.ProductNumber.ToLower().Contains(parameters.sSearch.ToLower())
                    || x.ProductCategory.Name.ToLower().Contains(parameters.sSearch.ToLower())
                    || x.ProductModel.Name.ToString().Contains(parameters.sSearch.ToLower())
                    || x.ModifiedDate.ToString("dd'/'MM'/'yyyy").ToLower().Contains(parameters.sSearch.ToLower())).ToList();
            }


            dbRecordCount = products.Count();

            //Paging     
            var displayResult = products.Skip(parameters.iDisplayStart).Take(parameters.iDisplayLength).ToList();

            //convert data into json format    
            return Json(new
            {
                parameters.sEcho,
                iTotalRecords = dbRecordCount,
                iTotalDisplayRecords = dbRecordCount,
                aaData = displayResult.Select(x => new {
                    x.Name,
                    x.ProductNumber,
                    x.Color,
                    x.StandardCost,
                    x.ListPrice,
                    x.Size,
                    x.Weight,
                    x.ThumbNailPhoto,
                    ModifiedDate = x.ModifiedDate.ToString("g"),
                    ProductCategory = x.ProductCategory.Name,
                    ProductModel = x.ProductModel.Name
                })
            }, JsonRequestBehavior.AllowGet);
        }
        // GET: Products/Create
        public ActionResult Create()
        {
            ViewBag.ProductCategoryID = new SelectList(_db.ProductCategories, "ProductCategoryID", "Name");
            ViewBag.ProductModelID = new SelectList(_db.ProductModels, "ProductModelID", "Name");
            return View();
        }

       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "ProductID,Name,ProductNumber,Color,StandardCost,ListPrice,Size,Weight,ProductCategoryID,ProductModelID,SellStartDate,SellEndDate,DiscontinuedDate,ModifiedDate")] Product product)
        {
            if (ModelState.IsValid)
            {
                product.rowguid = new Guid();
                _db.Products.Add(product);
                await _db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.ProductCategoryID = new SelectList(_db.ProductCategories, "ProductCategoryID", "Name", product.ProductCategoryID);
            ViewBag.ProductModelID = new SelectList(_db.ProductModels, "ProductModelID", "Name", product.ProductModelID);
            return View(product);
        }

        // GET: Products/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var product = await _db.Products.FindAsync(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.ProductCategoryID = new SelectList(_db.ProductCategories, "ProductCategoryID", "Name", product.ProductCategoryID);
            ViewBag.ProductModelID = new SelectList(_db.ProductModels, "ProductModelID", "Name", product.ProductModelID);
            return View(product);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "ProductID,Name,ProductNumber,Color, StandardCost,ListPrice,Size,Weight,ProductCategoryID,ProductModelID,SellStartDate,SellEndDate,DiscontinuedDate,ThumbNailPhoto,ThumbnailPhotoFileName,rowguid,ModifiedDate")] Product product)
        {
            if (ModelState.IsValid)
            {
                _db.Entry(product).State = EntityState.Modified;
                await _db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.ProductCategoryID = new SelectList(_db.ProductCategories, "ProductCategoryID", "Name", product.ProductCategoryID);
            ViewBag.ProductModelID = new SelectList(_db.ProductModels, "ProductModelID", "Name", product.ProductModelID);
            return View(product);
        }

        // GET: Products/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var product = await _db.Products.FindAsync(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // POST: Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            var product = await _db.Products.FindAsync(id);
            _db.Products.Remove(product);
            await _db.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                _db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
