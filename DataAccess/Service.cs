using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess.Logic;
using DataAccess;
using DataAccess.Entities;

namespace DataAccess
{
    public class Service : IService
    {

       AdminLogic _Admin;
        public AdminLogic AdminMaster
        {
            get
            {
                if (_Admin == null)
                {
                    _Admin = new AdminLogic(new AppDbContext());
                }
                return _Admin;
            }

        }

        EmployeeLogic _Employee;
        public EmployeeLogic Employee
        {
            get
            {
                if (_Employee == null)
                {
                    _Employee = new EmployeeLogic(new AppDbContext());
                }
                return _Employee;
            }
        }
    }
}
