package com.hellokoding.account.service;

import com.hellokoding.account.Models.Address;
import com.hellokoding.account.repository.AddressRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by dzni0816 on 02.12.2016.
 */
@Service
public class AddressServiceImpl implements AddressService{

    @Autowired
    AddressRepository addressRepository;

    @Override
    public void save(Address address) {
        addressRepository.save(address);
    }
}
