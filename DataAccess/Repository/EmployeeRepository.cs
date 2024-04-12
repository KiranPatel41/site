using DataAccess.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repository
{
    public class EmployeeRepository : Repository<Employee>
    {
        private AppDbContext _context;
        public EmployeeRepository(AppDbContext context)
            : base(context)
        {
            _context = context;
        }

        public override Employee Update(Employee obj)
        {
            // obj.UpdatedOn = ServerDate.Now();
            return base.Update(obj);
        }
    }
}
