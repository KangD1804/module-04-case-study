package com.codegym.casestudy.service.customer;

import com.codegym.casestudy.entity.Customer;
import com.codegym.casestudy.service.IGeneralService;
import org.springframework.data.domain.Page;

import java.awt.print.Pageable;
import java.util.Optional;

public interface ICustomerService extends  IGeneralService<Customer> {
    Iterable<Customer> findAllbyStore(Customer customer);

    Optional<Customer> findById(int id);

   Page<Customer> findAllbyStore(String keyword, Pageable pageable);

   Page<Customer> findAllByStore(Pageable pageable);
}