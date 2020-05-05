using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Security.Cryptography.X509Certificates;

namespace LinqDemo
{
    class Program
    {
        static void Main(string[] args)
        {
            employee[] emp =
            {
                new employee(){employeeid=1,firstname="John",lastname="Abraham",salary=1000000,joiningdate=new DateTime(2013,1,01, 12,00,00),department="Banking"},
                new employee(){employeeid=2,firstname="Michael",lastname="Clarke",salary=800000,joiningdate=new DateTime(2013,1,01,12,00,00),department="Insurance"},
                new employee(){employeeid=3,firstname="Roy",lastname="Thomas",salary=700000,joiningdate=new DateTime(2013,2,01,12,00,00),department="Banking"},
                new employee(){employeeid=4,firstname="Tom",lastname="Jose",salary=600000,joiningdate=new DateTime(2013,2,01,12,00,00),department="Insurance"},
                new employee(){employeeid=5,firstname="Jerry",lastname="Pinto",salary=650000,joiningdate=new DateTime(2013,2,01,12,00,00),department="Insurance"},
                new employee(){employeeid=6,firstname="Philip",lastname="Mathew",salary=750000,joiningdate=new DateTime(2013,1,01,12,00,00),department="Services"},
                new employee(){employeeid=7,firstname="Test Name1",lastname="123",salary=650000,joiningdate=new DateTime(2013,1,01,12,00,00),department="Services"},
                new employee(){employeeid=8,firstname="Test Name2",lastname="Lname%",salary=600000,joiningdate=new DateTime(2013,2,01,12,00,00),department="Insurance"}

            };

            incentives[] incentive =
            {

                new incentives() { employeerefid = 1, IncentiveDate = new DateTime(2013,2,01) , incentiveamount = 5000 },
                new incentives() { employeerefid = 2, IncentiveDate = new DateTime(2013,2,01) , incentiveamount = 3000 },
                new incentives() { employeerefid = 3, IncentiveDate = new DateTime(2013,2,01) , incentiveamount = 4000 },
                new incentives() { employeerefid = 1, IncentiveDate = new DateTime(2013,1,01) , incentiveamount = 4500 },
                new incentives() { employeerefid = 2, IncentiveDate = new DateTime(2013,1,01) , incentiveamount = 3500 },
  };
            //2. Select All in Employee

            /* var basicQuery = (from e in emp select e).ToList();
            foreach(var item in basicQuery)
            {
                Console.WriteLine($"Id={item.employeeid}, FirstName={item.firstname}, LastName={item.lastname},Salary={item.salary},JoinDate={item.joiningdate},Department={item.department}");
            }
            Console.ReadLine();  */

            //3. Select FirstName and Lastname

            /*var name = (from n in emp select n).ToList();
            foreach (var item in name)
            {
                Console.WriteLine($"FirstName={item.firstname}, LastName={item.lastname}");
            }
            Console.ReadLine();*/

            //4.First Name as Employee Name

            /* var name = (from n in emp select n).ToList();
            foreach (var item in name)
            {
                Console.WriteLine($"Employee Name={item.firstname}");
            }
            Console.ReadLine();*/

            //5.
            /* var Employee = from upper in emp
                            select new
                            {
                                EmployeeName = upper.firstname.ToUpper()
                            };
             foreach (var name in Employee)
             {
                 Console.WriteLine(name);
             }*/

            //6.
            /*var Employee = from upper in emp
                           select new
                           {
                               EmployeeName = upper.firstname.ToLower()
                           };
            foreach (var name in Employee)
            {
                Console.WriteLine(name);
            }*/

            //7.
            /*var uniqueDepartment = emp.Select(s => s.department).Distinct().ToList();
            foreach (var dept in uniqueDepartment)
            {
                Console.WriteLine(dept);
            }*/

            //8.
            /* var firstName = from fname in emp
                             select new
                             {
                                 Name = fname.firstname.Substring(0, 3)
                             };
             foreach (var name in firstName)
             {
                 Console.WriteLine(name);
             }*/

            //9.
            /*var firstName = emp.Where(s => s.employeeid == 1)
                   .Select(s => s.firstname.IndexOf('o'));
            foreach (var name in firstName)
            {
                Console.WriteLine(name);
            }*/

            //10.
            /*var firstName = emp.Select(s => s.firstname.Replace(" ",""));
            foreach (var name in firstName)
            {
                Console.WriteLine(name);
            }*/

            //12.
            /*            var firstName = emp.Select(s => s.firstname.Length);
                        foreach (var name in firstName)
                        {
                            Console.WriteLine(name);
                        }*/

            //13.
            /*var firstName = emp.Select(s => s.firstname.Replace('o', '$'));
            foreach (var name in firstName)
            {
                Console.WriteLine(name);
            }*/

            //14.
            /*var FullName = from names in emp
                               select new
                               {
                                   FullName = names.firstname + '_' + names.lastname
                               };
            foreach (var name in FullName)
            {
                Console.WriteLine(name);
            }*/

            //15.
            /*var joiningDetail = from joining in emp
                                select new
                                {
                                    joining.firstname,
                                    joining.joiningdate
                                };
            foreach (var detail in joiningDetail)
            {
                Console.WriteLine(detail);
            }*/

            //16.
            /*            var Employee = from e in emp orderby (e.firstname) ascending
                                       select new
                                       {
                                           e.employeeid, e.firstname, e.lastname, e.salary, e.joiningdate, e.department
                                       };
                        foreach (var name in Employee)
                        {
                            Console.WriteLine(name);
                        }*/

            //17.
            /*var Employee = from e in emp
                           orderby (e.firstname) descending
                           select new
                           {
                               e.employeeid,e.firstname, e.lastname,e.salary, e.joiningdate, e.department
                           };
            foreach (var name in Employee)
            {
                Console.WriteLine(name);
            }*/

            //18.
            /*var Employee = from e in emp
                           orderby (e.firstname), e.salary descending
                           select new
                           {
                               e.employeeid,e.firstname, e.lastname, e.salary, e.joiningdate, e.department
                           }
                        ;
            foreach (var name in Employee)
            {
                Console.WriteLine(name);
            }*/

            //19.
            /*var Employee = from e in emp where e.firstname == "John"
                           select new
                           {
                               e.employeeid,e.firstname,e.lastname,e.salary,e.joiningdate,e.department
                           };
            foreach (var name in Employee)
            {
                Console.WriteLine(name);
            }*/

            //20.
            /*var Employee = from e in emp
                           where e.firstname == "John"||e.firstname=="Roy"
                           select new
                           {
                               e.employeeid,
                               e.firstname,
                               e.lastname,
                               e.salary,
                               e.joiningdate,
                               e.department
                           };
            foreach (var name in Employee)
            {
                Console.WriteLine(name);
            }*/

            //21.
            /*var Employee = from e in emp
                           where (e.firstname != "John" || e.firstname != "Roy")
                           select new
                           {
                               e.employeeid,
                               e.firstname,
                               e.lastname,
                               e.salary,
                               e.joiningdate,
                               e.department
                           };
            foreach (var name in Employee)
            {
                Console.WriteLine(name);
            }*/

            //22.
            /*var Employee = from e in emp
                           where e.firstname.StartsWith("J")
                           select new
                           {
                               e.employeeid,
                               e.firstname,
                               e.lastname,
                               e.salary,
                               e.joiningdate,
                               e.department
                           };
            foreach (var name in Employee)
            {
                Console.WriteLine(name);
            }*/

            //23.
            /*var Employee = from e in emp
                           where e.firstname.Contains("o")
                           select new
                           {
                               e.employeeid,
                               e.firstname,
                               e.lastname,
                               e.salary,
                               e.joiningdate,
                               e.department
                           };
            foreach (var name in Employee)
            {
                Console.WriteLine(name);
            }*/

            //24.
            /*var Employee = from e in emp
                           where e.firstname.EndsWith("n")
                           select new
                           {
                               e.employeeid,
                               e.firstname,
                               e.lastname,
                               e.salary,
                               e.joiningdate,
                               e.department
                           };
            foreach (var name in Employee)
            {
                Console.WriteLine(name);
            }*/

            //25.
            /*var Employee = from e in emp
                           where e.firstname.EndsWith("n") && e.firstname.Length == 4
                           select new
                           {
                               e.employeeid,
                               e.firstname,
                               e.lastname,
                               e.salary,
                               e.joiningdate,
                               e.department
                           };
            foreach (var name in Employee)
            {
                Console.WriteLine(name);
            }*/

            //26.
            /*var Employee = from e in emp
                           where e.firstname.StartsWith("J") && e.firstname.Length == 4
                           select new
                           {
                               e.employeeid,
                               e.firstname,
                               e.lastname,
                               e.salary,
                               e.joiningdate,
                               e.department
                           };
            foreach (var name in Employee)
            {
                Console.WriteLine(name);
            }*/

            //27.
            /*var Employee = from e in emp
                           where e.salary > 600000
                           select new
                           {
                               e.employeeid,
                               e.firstname,
                               e.lastname,
                               e.salary,
                               e.joiningdate,
                               e.department
                           };
            foreach (var name in Employee)
            {
                Console.WriteLine(name);
            }*/

            //28.
            /*var Employee = from e in emp
                           where e.salary < 800000
                           select new
                           {
                               e.employeeid,
                               e.firstname,
                               e.lastname,
                               e.salary,
                               e.joiningdate,
                               e.department
                           };
            foreach (var name in Employee)
            {
                Console.WriteLine(name);
            }*/

            //29.
            /*var Employee = from e in emp
                           where e.salary > 500000 && e.salary < 800000
                           select new
                           {
                               e.employeeid,
                               e.firstname,
                               e.lastname,
                               e.salary,
                               e.joiningdate,
                               e.department
                           };
            foreach (var name in Employee)
            {
                Console.WriteLine(name);
            }*/

            //30.
            /*var Employee = from e in emp
                           where e.firstname == "John" || e.firstname == "Michael"
                           select new
                           {
                               e.employeeid,
                               e.firstname,
                               e.lastname,
                               e.salary,
                               e.joiningdate,
                               e.department
                           };
            foreach (var name in Employee)
            {
                Console.WriteLine(name);
            }*/

            //31.
            /*var Employee = from e in emp
                           where e.joiningdate.Year == 2013
                           select new
                           {
                               e.firstname
                           };
            foreach (var n in Employee)
            {
                Console.WriteLine(n.firstname);
            }*/

            //32.
            /*var Employee = from e in emp
                           where e.joiningdate.Month == 1
                           select new
                           {
                               e.firstname
                           };
            foreach (var n in Employee)
            {
                Console.WriteLine(n.firstname);
            }*/
            //33.

            /*var Employee = from e in emp where e.joiningdate < new DateTime(2013,01,31) 
                           select new
                           {
                               e.firstname,
                               e.joiningdate
                           };
            foreach (var n in Employee)
            {
                Console.WriteLine(n.firstname);
                Console.WriteLine(n.joiningdate);
            }*/
            //34.
            /*var Employee = from e in emp
                           where e.joiningdate > new DateTime(2013, 01, 31)
                           select new
                           {
                               e.firstname,
                               e.joiningdate
                           };
            foreach (var n in Employee)
            {
                Console.WriteLine(n.firstname);
                Console.WriteLine(n.joiningdate);
            }*/
            //35.
            /*var Employee = from e in emp
                           select new
                           {
                               e.firstname,
                               date=e.joiningdate.Date,
                               time=e.joiningdate.TimeOfDay
                           };
            foreach (var n in Employee)
            {
                Console.WriteLine(n.firstname);
                Console.WriteLine(n.date);
                Console.WriteLine(n.time);
            }*/
            //36.
            /*var Employee = from e in emp
                           select new
                           {
                               e.firstname,
                               date = e.joiningdate
                           };
            foreach (var n in Employee)
            {
                Console.WriteLine(n.date);

            }*/
            //37.
            /*var join = from e in emp
                       join i in incentive on e.employeeid equals i.employeerefid
                       
                       select new
                       {
                            days=e.joiningdate -i.IncentiveDate
                       };
            foreach (var item in join)
            {
                Console.WriteLine(item.days);
            }*/

            //39.
            /*var Employee = from e in emp
                           where e.lastname.EndsWith("%") 
                           select new
                           {
                               e.employeeid,
                               e.firstname,
                               e.lastname,
                               e.salary,
                               e.joiningdate,
                               e.department
                           };
            foreach (var name in Employee)
            {
                Console.WriteLine(name);
            }*/

            //40.
            /*var firstName = emp.Select(s => s.lastname.Replace("%", ""));
            foreach (var name in firstName)
            {
                Console.WriteLine(name);
            }*/

            //41.
            /*var Employee = from e in emp

                           group e by e.department into departments
                           select new
                           {
                               dep = departments.Key,
                               totalSalary = departments.Sum(x => x.salary)
                           };
            foreach(var dep in Employee)
            {
                Console.WriteLine(dep.dep);
                Console.WriteLine(dep.totalSalary);
            }*/

            //42.

            /*var Employee = (from e in emp
                           group e by e.department into departments
                           select new
                           {
                               dep = departments.Key,

                               totalSalary = departments.Sum(x => x.salary)
                           }).OrderBy(x=>x.totalSalary);
            foreach (var dep in Employee)
            {
                Console.WriteLine(dep.dep);
                Console.WriteLine(dep.totalSalary);
            }*/

            //43.
            /*var Employee = (from e in emp
                            group e by e.department into departments
                            select new
                            {
                                dep = departments.Key,
                                count=departments.Count(),
                                totalSalary = departments.Sum(x => x.salary)
                            }).OrderByDescending (x => x.totalSalary) ;
            foreach (var dep in Employee)
            {
                Console.WriteLine(dep.dep);
                Console.WriteLine(dep.totalSalary);
                Console.WriteLine(dep.count);
            }*/

            //44.
            /*var Employee = (from e in emp
                            group e by e.department into departments
                            select new
                            {
                                dep = departments.Key,
                                count=departments.Count(),
                                AvgSalary = departments.Average(x => x.salary),
                                totalSalary = departments.Sum(x => x.salary)
                            }).OrderByDescending (x => x.totalSalary) ;
            foreach (var dep in Employee)
            {
                Console.WriteLine(dep.dep);
                Console.WriteLine(dep.totalSalary);
                Console.WriteLine(dep.count);
                Console.WriteLine(dep.AvgSalary);
            }*/

            //45.
            /* var Employee = (from e in emp
                             group e by e.department into departments
                             select new
                             {
                                 dep=departments.Key,
                                 maxsal=departments.Max(x=>x.salary),
                             }).OrderBy(x => x.maxsal);
             foreach (var max in Employee) {
                 Console.WriteLine(max.dep);
                 Console.WriteLine(max.maxsal);
             }*/

            //46.
            /*var Employee = (from e in emp
                            group e by e.department into departments
                            select new
                            {
                                dep = departments.Key,
                                minsal = departments.Min(x => x.salary),
                            }).OrderBy(x => x.minsal);
            foreach (var min in Employee)
            {
                Console.WriteLine(min.dep);
                Console.WriteLine(min.minsal);
            }*/

            //47.
            /*var Employee = from e in emp

                           select new
                           {
                               year=e.joiningdate.Year,
                               month=e.joiningdate.Month
                           };
            foreach (var n in Employee)
            {
                Console.WriteLine(n.year);
                Console.WriteLine(n.month);
            }*/

            //48.
            /*var Employee = (from e in emp 
                            group e by e.department into departments
                            select new
                            {
                                dep = departments.Key,

                                totalSalary = departments.Sum(x => x.salary ) 

                            }).Where(x=>x.totalSalary>800000).OrderByDescending (x => x.totalSalary  )  ;
            foreach (var dep in Employee)
            {
                Console.WriteLine(dep.dep);
                Console.WriteLine(dep.totalSalary);
            }*/

            //49.
            /*var join = from e in emp
                       join i in incentive on e.employeeid equals i.employeerefid 

                       select new
                       {
                           name = e.firstname,
                           amount = i.incentiveamount
                       };
            foreach (var item in join)
            {
                Console.WriteLine(item.name);
                Console.WriteLine(item.amount);
            }*/

            //50.
            /*var join = (from e in emp
                       join i in incentive on e.employeeid equals i.employeerefid
                       select new
                       {
                           name=e.firstname,
                           amount=i.incentiveamount 
                       }).Where(x => x.amount > 3000);
            foreach (var item in join)
            {
                Console.WriteLine(item.name);
                Console.WriteLine(item.amount);
            }*/

            //51.
            /*var join = from e in emp
                       join i in incentive on e.employeeid equals i.employeerefid into empGroup
                       from i in empGroup.DefaultIfEmpty()
                       select new
                       {
                           name = e.firstname,
                           amount = i == null ? 0 : i.incentiveamount
                       };
            foreach (var item in join)
            {
                Console.WriteLine(item.name);
                Console.WriteLine(item.amount);
            }*/
            //52.
            /*var join = from e in emp
                       join i in incentive on e.employeeid equals i.employeerefid into empGroup
                       from i in empGroup.DefaultIfEmpty()
                       select new
                       {
                           name = e.firstname,
                           amount = i == null ? 0 : i.incentiveamount
                       };
            foreach (var item in join)
            {
                Console.WriteLine(item.name);
                Console.WriteLine(item.amount);
            }*/

            //54.
            /*var Employee = (from e in emp
                           select new
                           {
                               Salary = e.salary
                           }).OrderBy(x=>x.Salary).Take(2);
            foreach (var name in Employee)
            {
                Console.WriteLine(name);
            }*/

            //55.
            /*var Employee = (from e in emp
                            select new
                            {
                                Salary = e.salary
                            }).Take(5);
            foreach (var name in Employee)
            {
                Console.WriteLine(name);
            }*/

            //56.
            /*var Employee = emp.OrderByDescending(x=>x.salary).Select(x=>x.salary).Skip(1).First();
            Console.WriteLine(Employee);*/

            //58.
            /*var query = (from e in emp select new { name = e.firstname })
                .Union(from r in emp select new { name = r.lastname }).ToList();
            foreach (var item in query) {
                Console.WriteLine(item);
            }*/

            //60.
            /*var join = from i in incentive
                       join e in emp on i.employeerefid equals e.employeeid 
                       select new
                       {
                           name = e.firstname,
                           amount = i.incentiveamount
                       };
            foreach (var item in join)
            {
                Console.WriteLine(item.name);
                Console.WriteLine(item.amount);
            }*/

            //62.
            /*var Employee = from e in emp
                       from i in incentive  
                            select new
                            {
                                name = e.firstname,
                                incentive = i.incentiveamount
                            };

            foreach (var item in Employee)
            {
                Console.WriteLine(item.name);
                Console.WriteLine(item.incentive);
            }*/

            //63.
            /*var join = (from e in emp             
                        select new
                        {
                            salary = e.salary*0.15
                        });
            foreach (var item in join)
            {
                Console.WriteLine(item.salary );
            }*/

            //64.
            /*var Employee = from e in emp

                           group e by e.department into departments
                           select new
                           {
                               dep = departments.Key +" Dept",
                           };
            foreach (var dep in Employee)
            {
                Console.WriteLine(dep.dep);
            }*/
        }
    }
    class employee
    {
        public int employeeid;
        public string firstname;
        public string lastname;
        public int salary;
        public DateTime joiningdate;
        public string department;
    }
    class incentives
    {
        public int employeerefid;
        public DateTime IncentiveDate;
        public int incentiveamount;
    }
}
