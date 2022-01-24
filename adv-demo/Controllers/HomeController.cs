using adv_demo.Models.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace adv_demo.Controllers
{
    public class HomeController : Controller
    {
        private readonly DemoEntities _db = new DemoEntities();

        public ActionResult Index()
        {
            PieChart();
            BarChart();
            LineChart();

            return View();
        }

        public void PieChart()
        {
            Dictionary<string, int> productSalesQuantity = new Dictionary<string, int>();
           // declaring and initializing... 
            int numProductsToView = 5; //The number of products we want to display

            var products = _db.Products;
            var sales = _db.SalesOrderDetails;

            foreach (var p in products)
            {

                int numberSold = 0;

                var itemList = sales.Where(x => x.ProductID == p.ProductID);

                foreach (var i in itemList)
                {
                    numberSold += i.OrderQty;
                }

                productSalesQuantity.Add(p.Name, numberSold);
            }

            var sortedResult = productSalesQuantity.OrderByDescending(x => x.Value).Select(x => new
            {
                x.Key,
                x.Value
            }).ToDictionary(x => x.Key, y => y.Value);

            ViewBag.TopProducts = Newtonsoft.Json.JsonConvert.SerializeObject(sortedResult.Keys.ToList().Take(numProductsToView));
            ViewBag.ProductSales = Newtonsoft.Json.JsonConvert.SerializeObject(sortedResult.Values.ToList().Take(numProductsToView));
        }

        public void BarChart()
        {
            Dictionary<string, int> ProductsPerCategory = new Dictionary<string, int>();

            var categories = _db.ProductCategories;
            var products = _db.Products;

            foreach (var c in categories)
            {
                int numberOfProducts = 0;

                numberOfProducts = products.Where(x => x.ProductCategoryID == c.ProductCategoryID).Count();

                ProductsPerCategory.Add(c.Name, numberOfProducts);
            }

            ViewBag.Categories = Newtonsoft.Json.JsonConvert.SerializeObject(ProductsPerCategory.Keys.ToList());
            ViewBag.CategoryCount = Newtonsoft.Json.JsonConvert.SerializeObject(ProductsPerCategory.Values.ToList());
        }

        public void LineChart()
        {
            Dictionary<string, int> numberAddedOnDate = new Dictionary<string, int>();

            var datesAdded = _db.Customers.Select(x => x.ModifiedDate).Distinct().OrderBy(x => System.Data.Entity.DbFunctions.TruncateTime(x));

            foreach (var d in datesAdded)
            {
                try
                {
                    numberAddedOnDate.Add(d.Date.ToString("dd/MMM/yyyy"), _db.Customers.Where(x => x.ModifiedDate == d.Date).Count());
                }
                catch (ArgumentException)
                {
                    numberAddedOnDate[d.Date.ToString("dd/MMM/yyyy")] += 1;
                }
            }

            ViewBag.Dates = Newtonsoft.Json.JsonConvert.SerializeObject(numberAddedOnDate.Keys.ToList());
            ViewBag.AddedCounts = Newtonsoft.Json.JsonConvert.SerializeObject(numberAddedOnDate.Values.ToList());
        }
    }
}