   M S B A M L   `   `   `  ����N  JCompanyEmployeesSQL, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:CompanyEmployeesSQLCompanyEmployeesSQL  5   	   $    CompanyEmployeesSQL.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   3local!clr-namespace:CompanyEmployeesSQL     5   	     � Title$7  1MS SQL Server DB + EntityFramework 6.2 Elementary��5   	   $	��360��6C   $	��560��6P   $	��300��6\   $	��400��6l      WindowBackgroundBrush#��[  5	   	   .��5
      �  � ColumnDefinitions 5   
   �� 5      $	��75* �6   �� 5      $	��25* �6   .+�5   
   &   System.Windows.Controls.DataGrid  -   5          Name$ 
DgEmployee��5      $��10,38,10,10q�6'      AutoGenerateColumns .  $   HorizontalScrollBarVisibility$ Disabled=�6X      Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ Имя��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$	 45* 6K      MinWidth$ 15Q�6W   	   
IsReadOnly	 .  1  +System.Windows.Controls.DataGridBoundColumn
   Binding
 62   �� *Name+6e     5      $ 
Отдел��6%   $	 25* 6b   	 . 
 64   �� *Department.DepartmentName+6n     5      $ Зарплата��6%   $	 15* 6R   	 .  
 67   �� *Salary+6^     5      $ Возраст��6%   $	 10* 6N   	 .  
 66   �� *Age+6Z   5      �� 5   
   -   5         ��Name$ BtnDepartmentsEdit��5      $��Отделы��6-   $��23��6>   $��	0,10,10,0q�6J   $	��Top=�6]   $��1��6u   �� 5   
   -   5        $ BtnAddNewEmployee��5      $��Добавить��6,   $��	0,0,10,38q�6?   $��23��6R   $��Bottom=�6^   $��1��6y   �� 5   
   -   5        $ BtnRemoveEmployee��5      $��Удалить��6,   $��	0,0,10,10q�6>   $��23��6Q   $��Bottom=�6]   $��1��6x   �� 5   
   -   5        $ BtnSelectDepartment��5      $��Указать отдел��5      $��23��5      $��	0,38,10,0q�5      $	��Top=�5      $��1��5      $y�Hidden=�5       �� 5!   
   -   5         ��Name$ CbDepartmentSet��5!      $��23��5"      $	��Top=�5#      $��151,10,10,0q�5$       �� DisplayMemberPath$ DepartmentName��5%      ��5&      �� 5'       �� 
TargetType" ��6   .�5(      ��  �� Property � {� �� Value . 6E   �� 5)       � ��# [  63    �� Triggers 5*      �� 5+       �� Binding 6&   ��  �� ElementName$ 
DgEmployee�� �� Path$ SelectedIndex� �� Value -16k   .a�5,      ��  � {� .  6N   5-      5/      51      �� 53   
   $
��Left=�6   $��23��6/   $��	10,10,0,0q�6;   $
��Wrap=�6N   $+��%Переместить в отдел:��6b   $	��Top=�6~   $	��136��6�   54      55      