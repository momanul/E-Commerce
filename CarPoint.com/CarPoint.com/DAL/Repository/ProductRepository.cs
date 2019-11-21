
using CarPoint.com.DAL.Models;
using CarPoint.com.DAL.VM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CarPoint.com.DAL
{
    public class ProductRepository : IRepository<VMProductInfo>
    {
        IDBTest04Entities db = new IDBTest04Entities();
        public VMProductInfo Add(VMProductInfo svm)
        {
            Product product = new Product();
            product.CategoryID = svm.CategoryID;
            product.Brand = svm.Brand;
            product.Name = svm.Name;
            product.Details = svm.Details;
            product.Price = svm.Price;
            product.StockQuantity = svm.StockQuantity;
            product.IsFavorite = svm.IsFavorite;
            product.IsActive = svm.IsActive;

            db.Product.Add(product);
            db.SaveChanges();
            svm.ID = product.ID;

            return svm;
        }

        public VMProductInfo Get(int id)
        {
            VMProductInfo SingleProduct = db.Product.Select(s => new VMProductInfo
            {
                ID = s.ID,
                CategoryID = s.CategoryID,
                Brand = s.Brand,
                Name = s.Name,
                Details = s.Details,
                Price = s.Price,
                StockQuantity = s.StockQuantity,
                IsFavorite = s.IsFavorite,
                IsActive = s.IsActive
            }).Where(q => q.ID == id).FirstOrDefault();
            return SingleProduct;
        }

        public IEnumerable<VMProductInfo> GetAll()
        {
            IEnumerable<VMProductInfo> data = db.Product.Select(s => new VMProductInfo
            {
                ID = s.ID,
                CategoryID = s.CategoryID,
                Brand = s.Brand,
                Name = s.Name,
                Details = s.Details,
                Price = s.Price,
                StockQuantity = s.StockQuantity,
                IsFavorite = s.IsFavorite,
                IsActive = s.IsActive
            });
            return data;
        }

        public bool Remove(int id)
        {
            Product p = db.Product.Find(id);
            db.Product.Remove(p);
            db.SaveChanges();
            return true;
        }

        public bool Remove(VMProductInfo svm)
        {
            Product p = db.Product.Find(svm.ID);
            db.Product.Remove(p);
            db.SaveChanges();
            return true;
        }

        public VMProductInfo Update(VMProductInfo svm)
        {
            Product product = db.Product.Find(svm.ID);
            product.CategoryID = svm.CategoryID;
            product.Brand = svm.Brand;
            product.Name = svm.Name;
            product.Details = svm.Details;
            product.Price = svm.Price;
            product.StockQuantity = svm.StockQuantity;
            product.IsFavorite = svm.IsFavorite;
            product.IsActive = svm.IsActive;

            db.Entry(product).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return svm;
        }
        public IEnumerable<VMProductDetails> ProductDetails()
        {
            var pd = from p in db.Product
                     join Img in db.ProductMG
                     on p.ID equals Img.ProductID
                     select new { p.ID, p.Brand, p.CategoryID, p.Name,
                     p.Price, p.StockQuantity, p.IsFavorite, p.IsActive,
                     p.Details, Img.ImgPath, Img.ThumbnailPath};
            List<VMProductDetails> productDetails = new List<VMProductDetails>();
            foreach (var item in pd)
            {
                VMProductDetails data = new VMProductDetails();
                data.ID = item.ID;
                data.CategoryID = item.CategoryID;
                data.Brand = item.Brand;
                data.Name = item.Name;
                data.Details = item.Details;
                data.Price = item.Price;
                data.StockQuantity = item.StockQuantity;
                data.ImgPath = item.ImgPath;
                data.ThumbnailPath = item.ThumbnailPath;
                data.IsFavorite = item.IsFavorite;
                data.IsActive = item.IsActive;
                productDetails.Add(data);
            }
            return productDetails;
        }
        public IEnumerable<VMProductDetails> ProductDetailWithCategory(int CategoryID)
        {
            var pd = from p in db.Product
                     join Img in db.ProductMG
                     on p.ID equals Img.ProductID
                     where p.CategoryID == CategoryID
                     select new
                     {
                         p.ID,
                         p.Brand,
                         p.CategoryID,
                         p.Name,
                         p.Price,
                         p.StockQuantity,
                         p.IsFavorite,
                         p.IsActive,
                         p.Details,
                         Img.ImgPath,
                         Img.ThumbnailPath
                     };
            List<VMProductDetails> productDetailWithCategory = new List<VMProductDetails>();
            foreach (var item in pd)
            {
                VMProductDetails data = new VMProductDetails();
                data.ID = item.ID;
                data.CategoryID = item.CategoryID;
                data.Brand = item.Brand;
                data.Name = item.Name;
                data.Details = item.Details;
                data.Price = item.Price;
                data.StockQuantity = item.StockQuantity;
                data.ImgPath = item.ImgPath;
                data.ThumbnailPath = item.ThumbnailPath;
                data.IsFavorite = item.IsFavorite;
                data.IsActive = item.IsActive;
                productDetailWithCategory.Add(data);
            }
            return productDetailWithCategory;
           }
        }//c
}//ns