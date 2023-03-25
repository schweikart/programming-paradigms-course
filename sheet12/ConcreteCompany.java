import java.util.LinkedList;
import java.util.List;

public class ConcreteCompany implements Company {
    private List<Employee> employees = new LinkedList<>();

    @Override
    public List<Employee> getEmployees() {
        return List.copyOf(employees);
    }

    @Override
    public void hire(Employee employee) {
        assert !employee.isEmployed() : "Can not hire an already employed person";
        assert !getEmployees().contains(employee) : "Can not hire an employee twice";
        List<Employee> oldEmployees = getEmployees();

        employees.add(employee);
        employee.hire();

        assert employee.isEmployed() : "Employee must be employed after hiring";
        assert getEmployees().contains(employee) : "Employee must be contained in employee list after hiring";
        assert getEmployees().containsAll(oldEmployees) : "Employees may not be lost in hiring";
        for (var newEmp : getEmployees()) {
            if (!employee.equals(newEmp)) {
                assert oldEmployees.contains(newEmp) : "All other employees must have already been employees before hiring a new one";
            }
        }
    }

    @Override
    public void fire(Employee employee) {
        assert employee.isEmployed() : "Can not fire an employee that is not employed!";
        assert getEmployees().contains(employee) : "Can not fire an employee that is not employed!";
        List<Employee> oldEmployees = getEmployees();

        employees.remove(employee);
        employee.fire();

        assert !getEmployees().contains(employee) : "Fired employee may not be part of the company any more!";
        assert !employee.isEmployed() : "Fired employee may not be employed any more!";
        assert oldEmployees.containsAll(getEmployees()) : "No new employees should appear while firing someone!";
        for (var oldEmp : getEmployees()) {
            if (!oldEmp.equals(employee)) {
                assert getEmployees().contains(oldEmp) : "No one else should be fired!";
            }
        }
    }
}
