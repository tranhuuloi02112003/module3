package service;

import model.Customer;
import resources.CustomerResourcesImpl;
import resources.ICustomerResources;

import java.util.List;

public class CustomerServiceImpl implements ICustomerService{
    ICustomerResources iCustomerResources= new CustomerResourcesImpl();
    @Override
    public List<Customer> findAll() {
        return iCustomerResources.finAll();
    }

    @Override
    public void save(Customer customer) {
        iCustomerResources.save(customer);
    }

    @Override
    public Customer findById(String id) {
        return iCustomerResources.findById(id);
    }

    @Override
    public void update(String id) {
        iCustomerResources.update(id);
    }

    @Override
    public void remove(String id) {
        iCustomerResources.remove(id);
    }
}
