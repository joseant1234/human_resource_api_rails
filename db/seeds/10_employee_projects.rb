employee_projects = [
  {id: 1, employee_id: 1, title: 'Project1', role: 'Developer', start_date: Date.today},
  {id: 2, employee_id: 1, title: 'Project2', role: 'Developer', start_date: Date.today, end_date: Date.today}]

EmployeeProject.create!(employee_projects)
