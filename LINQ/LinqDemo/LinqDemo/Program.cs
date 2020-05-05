using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;

namespace LinqDemo
{
    class Program
    {
        static void Main(string[] args)
        {
            employee[] emp =
            {
                new employee(){employeeid=1,firstname="John",lastname="Abraham",salary=1000000,joiningdate=new DateTime(01,1,13, 12,00,00),department="Banking"},
                new employee(){employeeid=2,firstname="Michael",lastname="Clarke",salary=800000,joiningdate=new DateTime(01,1,13,12,00,00),department="Insurance"},
                new employee(){employeeid=3,firstname="Roy",lastname="Thomas",salary=700000,joiningdate=new DateTime(01,2,13,12,00,00),department="Banking"},
                new employee(){employeeid=4,firstname="Tom",lastname="Jose",salary=600000,joiningdate=new DateTime(01,2,13,12,00,00),department="Insurance"},
                new employee(){employeeid=5,firstname="Jerry",lastname="Pinto",salary=650000,joiningdate=new DateTime(01,2,13,12,00,00),department="Insurance"},
                new employee(){employeeid=6,firstname="Philip",lastname="Mathew",salary=750000,joiningdate=new DateTime(01,1,13,12,00,00),department="Services"},
                new employee(){employeeid=7,firstname="Test Name1",lastname="123",salary=650000,joiningdate=new DateTime(01,1,13,12,00,00),department="Services"},
                new employee(){employeeid=8,firstname="Test Name2",lastname="Lname%",salary=600000,joiningdate=new DateTime(01,2,13,12,00,00),department="Insurance"}
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
            //32.
            //33.
            //34.
            //35.
            //36.
            //37.
            //38.

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
            var Employee = (from e in emp
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
            }
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
}
