package com.codegym.casestudy.repository;

import com.codegym.casestudy.entity.Customer;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.awt.print.Pageable;
import java.util.Optional;

@Repository
public interface ICustomerRepository<Pageable> extends PagingAndSortingRepository<Customer, Integer> {
    Iterable<Customer> findAllByStore(Customer customer);
    Page<Customer> findAllByStore(String store, Pageable pageable);
    Page<Customer> findAllByStore(Pageable pageable);

    Page<Customer> findAll (Pageable  pageable);

    void deleteById(int id);

    void save(Customer customer);

    Optional<Customer> findById(int id);

    Iterable<Customer> findAll();
}
