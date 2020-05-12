using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HospitalManagement.Models
{
    public class HospitalContext:DbContext { 
        public HospitalContext(DbContextOptions<HospitalContext> options):base(options){}
    
        public DbSet<Department> Departments { get; set; }
        public DbSet<Doctor> Doctors { get; set; }
        public DbSet<Assistant> Assistants { get; set; }
        public DbSet<Medicin> Medicins { get; set; }
        public DbSet<Patient> Patients { get; set; }
        public DbSet<Visit> Visits { get; set; }
        public DbSet<Prescription> Prescriptions { get; set; }
        public DbSet<PrescriptionDetail> PrescriptionDetails { get; set; }
        public DbSet<vPrescription> vPrescriptions { get; set; }
        public DbSet<vVisit> vVisits { get; set; }
    }
}
