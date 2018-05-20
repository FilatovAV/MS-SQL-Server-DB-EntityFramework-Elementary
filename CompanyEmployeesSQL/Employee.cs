namespace CompanyEmployeesSQL
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Runtime.CompilerServices;

    [Table("Employee")]
    public partial class Employee: INotifyPropertyChanged
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public int? Age { get; set; }

        public float? Salary { get; set; }

        public int DepartmentId { get; set; }

        public Department Department
        {get => m_Department; set {m_Department = value; OnPropertyChanged();}}
        private Department m_Department;

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(prop));
        }
    }
}
