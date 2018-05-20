using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace CompanyEmployeesSQL
{
    public class Service
    {
        public Model1 modelDB { get; set; }
        MainWindow WinMainWindow;

        public Service(System.Windows.Window mWindow)
        {
            modelDB = new Model1();
            modelDB.Employee.Load();
            modelDB.Department.Load();
            if (mWindow.GetType() == typeof(MainWindow))
            { WinMainWindow = (MainWindow)mWindow; }
        }

        /// <summary>
        /// Сохранить изменения
        /// </summary>
        public void SaveDB()
        {
            modelDB.SaveChanges();
        }

        /// <summary>
        /// Удалить департамент
        /// </summary>
        /// <param name="dep"></param>
        public void RemoveDepartment(Department dep)
        {
            if (dep == null) { return; }
            modelDB.Department.Remove(dep);
        }

        /// <summary>
        /// Открыть окно редактирования сотрудников
        /// </summary>
        public void OpenDepartmentsEdit()
        {
            WinEditDepartments wed = new WinEditDepartments(this) { Owner = WinMainWindow };
            wed.ShowDialog();
            SaveDB();
        }

        /// <summary>
        /// Изменение департамента для сотрудника
        /// </summary>
        /// <param name="emps"></param>
        /// <param name="dep"></param>
        public void DepartmentSet(IEnumerable<Employee> emps, Department dep)
        {
            if (dep == null) { return; }
            if (emps == null) { return; }
            foreach (Employee item in emps)
            {
                item.Department = dep;
                item.DepartmentId = dep.Id;
            }
            modelDB.SaveChanges();
            WinMainWindow.CbDepartmentSet.SelectedItem = null;
        }
        /// <summary>
        /// Удалить сотрудника
        /// </summary>
        /// <param name="employees"></param>
        public void RemoveEmployee(IEnumerable<Employee> employees)
        {
            modelDB.Employee.RemoveRange(employees);
        }

        /// <summary>
        /// Добавить сотрудника
        /// </summary>
        /// <param name="dep"></param>
        public void AddNewEmployee(Department dep)
        {
            if (dep==null)
            {
                if (modelDB.Department.Local.Count==0) { return; }
                dep = modelDB.Department.Local.FirstOrDefault();
            }

            Employee empl = new Employee { Name = "Новый сотрудник", Age = 00, Salary = 00, DepartmentId = dep.Id };
            modelDB.Employee.Add(empl);
        }
        /// <summary>
        /// Добавить департамент
        /// </summary>
        /// <param name="inx"></param>
        public void AddNewDepartment(int inx)
        {
            Department d = new Department { DepartmentName = $"Новый-{inx}" };
            this.modelDB.Department.Add(d);
            this.SaveDB();
        }
    }
}
