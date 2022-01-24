# Silicon Maboneng Developer test
# Adventure Works Demo Application

This repo contains a simple ASP.NET MVC website that will be used to test the skill of the you the developer.
You will need Visual Studio Community to complete this task, it can be downloaded for free here

[Download Visual Studio Community](https://visualstudio.microsoft.com/vs/)

## Intro
The application is a simple demo of a sales system, that contains products, customers, and the sales of those products

This test will focus mainly on listing/editing these entities so that they can be easily managed 

## Structure of the solution

Everything is contained in 1 project, split up into Model View and Controller sections

- Model - Contains the database and model context
    - Database has the model mapping file that is used to connect directly to the Database
    - Extensions has classed that add functionality to these model classes
    - Global.cs can be used for global variables
- Controllers - Contains all the backend code that is used for the website Application
    - Home controller for start page
    - Products controller that will handle CRUD of Products
- Views - All the HTML files linked to the action methods in the Controllers
    - Home
    - Products
    - Shared - These are the views that are used to build up the page
        - _Layout.cshtml contains the HTML template for all the pages, with the Head and Body
        Styles and Scripts linked here

The rest of the solution contains everything else needed that do not fit into these categories
- App_start - Initialisation logic
- Content - Css and images
- Scripts - all the JS script libraries
- Fonts

## Instructions

The site has a product index page that loads all the data from the database in one request and then applies a client side script
that makes the table pageable and search able

Please create a new branch with your name or email and commit each Task Separately with the 'Task {number}' in the commit message

### Task 1 
Convert this page to be a server side table with paging, searching and ordering

This will mean you have to create an ajax method that can handle the data tables server side model that applies
to the DB queries via linq to entities, for example `products.Where(x => x.Name.Contains(Filter))`

Reference for data tables
https://datatables.net/examples/data_sources/server_side.html

I will look at the following exact features

1. Data table uses server side process with ajax and only load the items in the page requested not all the products
2. The data can be ordered by for all the columns
3. The global search for the table can be applied to the text columns

This functionality has to be implemented using code that is reusable and with OOP principals in mind
since the same backend method will be needed in task 2. 

That means that the object that is passed into the backend for data table server side processing has to be created with
reusability in mind

### Task 2
Add a new controller for Customers, and implement the index, create and edit pages 

Making sure the index page also uses a server side data table

Exact requirements will be

1. Index page with server side processing
2. Create Page that adds new companies
3. Edit page to edit existing companies

### Task 3

For this task you have to convert the home page into a dash boar that gives the user an overview of the system
This will require you to add charts and summarized data 

For charting please use [chart.js](https://www.chartjs.org)

The folowing are required

1. Pie chart of the top 5 selling products
2. Bar chart of product counts per category
3. Customer acquisition over time (When customers where added using the modified date field as your date time)

How the dashboard looks in this task is important along with the page being responsive to mobile using bootstrap 3

### Bonus Task

The Products contain a field `ThumbNailPhoto` that has a byte array of a image, in task 1 the table loads a default place holder image for this field
In this task there is a function stub in `Models.Database.Extensions.Product.cs` `GetThumbnailDataImage()`
Implement this function to convert the byte array so it can be put into the table to load the image
in a img tag

## Resources for the test

The home page of the site will contain links to documentation for ASP.NET MVC

- [Entity Framework Linq](https://www.entityframeworktutorial.net/querying-entity-graph-in-entity-framework.aspx)
- [Data Tables](https://datatables.net/)
- [Bootstrap 3](https://getbootstrap.com/docs/3.3/)
- [chart.js](https://www.chartjs.org/docs/latest/)