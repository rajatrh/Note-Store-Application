using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebsiteCollegeLatest.classes
{
    
    public class profile
    {
        public string name { get; set; }
        public string profilepicpath { get; set; }
        public Int64 id { get; set; }

        profile()
        { 
        }
        public profile(string n, string ppp, Int64 id)
        {
            this.name = n;
            this.profilepicpath = ppp;
            this.id = id;
        }
    }
}