using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CarPoint.com.DAL
{
    interface IRepository<T> where T : class
    {
        T Add(T svm);
        T Get(int id);
        IEnumerable<T> GetAll();
        T Update(T svm);
        bool Remove(int id);
        bool Remove(T svm);
    }//i
}//ns