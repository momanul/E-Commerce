using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CarPoint.com.DAL.VM
{
    public class VMCategoryInfo
    {
        public long ID { get; set; }
        public Nullable<long> ParentCatID { get; set; }
        public string Name { get; set; }
        public Nullable<int> DisplayOrder { get; set; }
        public Nullable<bool> IsActive { get; set; }
    }
}