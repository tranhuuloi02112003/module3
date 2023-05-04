package resources;

import model.Customer;

import java.util.List;

public class CustomerResourcesImpl implements ICustomerResources{
    private static List<Customer> customerList;
    static {
        customerList.add(new Customer("1","Loi","Loi@gmail.com","Quang nam"));
        customerList.add(new Customer("2","Nhi","Nhi@gmail.com","Binh Dinh"));
        customerList.add(new Customer("3","Nam","Nam@gmail.com","Dak Lak"));
    }
    @Override
    public List<Customer> finAll() {
        return customerList;
    }

    @Override
    public void save(Customer customer) {
        customerList.add(customer);
    }

    @Override
    public Customer findById(String id) {
        for (Customer customer:customerList) {
            if (customer.getId().equals(id)){
                return customer;
            }
        }
        return null;
    }

    @Override
    public void update(String id) {
        for (Customer customer:customerList) {

        }
    }

    @Override
    public void remove(String id) {

    }
}
