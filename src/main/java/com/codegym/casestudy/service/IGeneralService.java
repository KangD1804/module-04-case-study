package com.codegym.casestudy.service;

import java.util.Optional;

public interface IGeneralService <T>{
    Iterable<T> findAll();
    Optional<T> findByID(int id);
    void save(T t);
    void remove(int id);
}
