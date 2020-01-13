using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebsiteCollegeLatest.classes
{
  

    public class messages
    {
       public string from { get; set; }
       public Int64 fromid { get; set; }
       public int countm { get; set; }
       public string msg { get; set; }
       public DateTime time { get; set; }

        public messages(string name, Int64 id, Int16 c)
        {
            this.from = name;
            this.fromid = id;
            this.countm = c;
        }
        public messages(string msg, DateTime d)
        {
            this.msg = msg;
            this.time = d;
        }
    }
}