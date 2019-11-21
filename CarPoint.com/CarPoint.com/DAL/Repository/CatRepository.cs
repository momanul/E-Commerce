using CarPoint.com.DAL.Models;
using CarPoint.com.DAL.VM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CarPoint.com.DAL
{
    public class CatRepository : IRepository<VMCategoryInfo>
    {
        IDBTest04Entities db = new IDBTest04Entities();

        public VMCategoryInfo Add(VMCategoryInfo svm)
        {
            Category category = new Category();
            category.ParentCatID = svm.ParentCatID;
            category.Name = svm.Name;
            category.DisplayOrder = svm.DisplayOrder;
            category.IsActive = svm.IsActive;
            db.Category.Add(category);
            db.SaveChanges();
            svm.ID = category.ID;
            return svm;
        }

        public VMCategoryInfo Get(int id)
        {
            VMCategoryInfo SingleCategory = db.Category.Select(s => new VMCategoryInfo
            {
                ID = s.ID,
                ParentCatID = s.ParentCatID,
                Name = s.Name,
                DisplayOrder = s.DisplayOrder,
                IsActive = s.IsActive
            }).Where(q => q.ID == id).FirstOrDefault();
            return SingleCategory;
        }

        public IEnumerable<VMCategoryInfo> GetAll()
        {
            IEnumerable<VMCategoryInfo> data = db.Category.Select(s => new VMCategoryInfo
            {
                ID = s.ID,
                ParentCatID = s.ParentCatID,
                Name = s.Name,
                DisplayOrder = s.DisplayOrder,
                IsActive = s.IsActive
            });
            return data;
        }

        public bool Remove(int id)
        {
            Category c = db.Category.Find(id);
            db.Category.Remove(c);
            db.SaveChanges();
            return true;
        }

        public bool Remove(VMCategoryInfo svm)
        {
            Category c = db.Category.Find(svm.ID);
            db.Category.Remove(c);
            db.SaveChanges();
            return true;
        }

        public VMCategoryInfo Update(VMCategoryInfo svm)
        {
            Category category = db.Category.Find(svm.ID);
            category.ParentCatID = svm.ParentCatID;
            category.Name = svm.Name;
            category.DisplayOrder = svm.DisplayOrder;
            category.IsActive = svm.IsActive;
            db.Entry(category).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return svm;

        }
        public IQueryable<VMCategoryInfo> GetSelectItem(long id)
        {
            IQueryable<VMCategoryInfo> cat;
            // get first category ID from database if nothing is passed in 
            if (id < 0)
            {

                 id = (from s in db.Category
                              select s).FirstOrDefault().ID;
                
            }
            
                cat = db.Category.Select(s => new VMCategoryInfo
                {
                    ID = s.ID,
                    ParentCatID = s.ParentCatID,
                    Name = s.Name,
                    DisplayOrder = s.DisplayOrder,
                    IsActive = s.IsActive
                }).Where(q => q.ID == id);
            
            return cat;
        }
    }//c
}//ns