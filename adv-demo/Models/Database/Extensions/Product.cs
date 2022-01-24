using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Hosting;

namespace adv_demo.Models.Database
{
    public partial class Product
    {
        /// <summary>
        /// Convert byte file to base64 data URI Scheme string that can be loaded into html <img/> tag
        /// https://en.wikipedia.org/wiki/Data_URI_scheme#Syntax
        /// </summary>
        /// <returns></returns>
        public string GetThumbnailDataImage()
        {
            throw new NotImplementedException();
        }
    }
}