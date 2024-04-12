using DataAccess.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repository
{
    public class AdminRepository : Repository<AdminMaster>
    {
        private AppDbContext _context;
        public AdminRepository(AppDbContext context)
            : base(context)
        {
            _context = context;
        }

        public override AdminMaster Update(AdminMaster obj)
        {
            // obj.UpdatedOn = ServerDate.Now();
            return base.Update(obj);
        }
    }
}
