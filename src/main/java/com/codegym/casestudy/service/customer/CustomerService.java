package com.codegym.casestudy.service.customer;

import com.codegym.casestudy.entity.Customer;
import com.codegym.casestudy.repository.ICustomerRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import java.awt.print.Pageable;
import java.util.Optional;

@Service
@Transactional
public class CustomerService implements ICustomerService {
    @Autowired
    private ICustomerRepository customerRepository ;
    @Override  // findall hiển thị tất cả danh sách khách hàng
    public Iterable<Customer> findAll() {
        return customerRepository.findAll();
    }

    @Override
    public Optional<Customer> findByID(int id) {
        return customerRepository.findById(id);
    }

    @Override
    public Iterable<Customer> findAllbyStore(Customer customer) {
        return customerRepository.findAllByStore(customer);
    }

    public Page<Customer> findAllbyStore(String keyword, Pageable pageable){
        return customerRepository.findAllByStore(keyword,pageable);
    }

    @Override //hiển thị khách hàng qua ID
    public Optional<Customer> findById(int id) {
    return customerRepository.findById(id);
    }
    @Override // edit(save) khách hàng
    public void save(Customer customer) {
        customerRepository.save(customer);
    }
    @Override // edit (remove) khách hàng
    public void remove(int id) {
    customerRepository.deleteById(id);
    }

    public  Page<Customer> findAllByStore(Pageable pageable){
        return customerRepository.findAllByStore(pageable);
    }
}
