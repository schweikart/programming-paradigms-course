import java.util.List;

public interface Company {
    /*@
      @ pure
      @*/
    public List<Employee> getEmployees();
    /*@
      @ requires !employee.isEmployed();
      @ requires !getEmployees().contains(employee);
      @
      @ ensures employee.isEmployed();
      @ ensures getEmployees().contains(employee);
      @ ensures (\forall Employee e; !employee.equals(e);
      @     getEmployees().contains(e) <==> \old(getEmployees()).contains(e));
      @*/
    public void hire(Employee employee);

    /*@
      @ requires employee.isEmployed();
      @ requires getEmployees().contains(employee);
      @
      @ ensures !employee.isEmployed();
      @ ensures !getEmployees().contains(employee);
      @ ensures (\forall Employee e; !employee.equals(e);
      @    getEmployees().contains(e) <==> \old(getEmployees()).contains(e));
      @*/
    public void fire(Employee employee);
}
