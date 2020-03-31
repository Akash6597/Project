using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace School.Models
{
    public class SchoolContext:DbContext
    {
        public SchoolContext(DbContextOptions<SchoolContext> options) : base(options)
        {
        }
        public DbSet<EnquiryDetail> EnquiryDetails { get; set; }

        public DbSet<FeesDetail> FeesDetails { get; set; }

        public DbSet<ParentDetail> ParentDetails { get; set; }

        public DbSet<StudentDetail> StudentDetails { get; set; }

        public DbSet<StdDetail> StdDetails { get; set; }
    }
}
