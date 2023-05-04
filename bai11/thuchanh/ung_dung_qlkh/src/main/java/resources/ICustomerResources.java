package resources;

import model.Customer;

import java.util.List;

public interface ICustomerResources {
    List<Customer> finAll();

    void save(Customer customer);

    Customer findById(String id);

    void update(String id);

    void remove(String id);
}
