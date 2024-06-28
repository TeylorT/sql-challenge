-- List the employee number, last name, first name, sex, and salary of each employee
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
FROM
	employees e
	join salaries s on e.emp_no = s.emp_no
ORDER BY
	e.last_name ASC,
	s.salary DESC;

-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT
	e.first_name,
	e.last_name,
	e.hire_date
FROM
	employees e
WHERE
	EXTRACT(YEAR FROM e.hire_date)= '1986'
ORDER BY
	e.last_name ASC;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT
	dm.dept_no,
	d.dept_name,
	dm.emp_no,
	e.first_name,
	e.last_name
FROM
	dept_manager dm
	join departments d on dm.dept_no = d.dept_no
	join employees e on dm.emp_no = e.emp_no
ORDER BY
	e.last_name ASC;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT
	d.dept_no,
	de.emp_no,
	e.first_name,
	e.last_name,
	d.dept_name
FROM
	departments d
	join dept_emp de on d.dept_no = de.dept_no
	join employees e on de.emp_no = e.emp_no
ORDER BY
	e.last_name ASC;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B 
SELECT
	e.first_name,
	e.last_name,
	e.sex
FROM
	employees e
WHERE
	e.first_name = 'Hercules'
	and e.last_name like 'B%'
ORDER BY
	e.first_name ASC;

-- List each employee in the Sales department, including their employee number, last name, and first name
SELECT
	de.emp_no,
	de.dept_no,
	e.last_name,
	e.first_name
FROM
	dept_emp de
	join employees e on de.emp_no = e.emp_no
WHERE
	de.dept_no = 'd007'
ORDER BY
	e.last_name ASC;

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT
	de.emp_no,
	d.dept_name,
	e.last_name,
	e.first_name
FROM
	dept_emp de
	join employees e on de.emp_no = e.emp_no
	join departments d on de.dept_no = d.dept_no
WHERE
	de.dept_no = 'd007'
	or de.dept_no = 'd005'
ORDER BY
	e.last_name ASC;

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT
	e.last_name,
	count(e.emp_no) as num_last_name
FROM
	employees e
GROUP BY
	e.last_name
ORDER BY
	num_last_name DESC;