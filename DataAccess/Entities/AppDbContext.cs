namespace DataAccess.Entities
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class AppDbContext : DbContext
    {
        public AppDbContext()
            : base("name=AppDbContext")
        {
        }

        public virtual DbSet<AdminMaster> AdminMasters { get; set; }
        public virtual DbSet<Employee> Employees { get; set; }
       

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AdminMaster>()
                .Property(e => e.AdminLoginId)
                .HasPrecision(18, 0);

            modelBuilder.Entity<AdminMaster>()
                .Property(e => e.IsAddedBy)
                .HasPrecision(18, 0);

            modelBuilder.Entity<AdminMaster>()
                .Property(e => e.IsUpdatedBy)
                .HasPrecision(18, 0);

            modelBuilder.Entity<AdminMaster>()
                .Property(e => e.IsDeletedBy)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Employee>()
                .Property(e => e.EmployeId)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Employee>()
                .Property(e => e.UserId)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Employee>()
                .Property(e => e.IsAddedBy)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Employee>()
                .Property(e => e.IsUpdatedBy)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Employee>()
                .Property(e => e.IsDeletedBy)
                .HasPrecision(18, 0);

          
        }
    }
}
