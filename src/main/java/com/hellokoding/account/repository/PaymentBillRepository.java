package com.hellokoding.account.repository;

import com.hellokoding.account.Models.Paymentbill;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by Admin on 02.12.2016.
 */
public interface PaymentBillRepository extends JpaRepository<Paymentbill, Long> {
//
//    @Query("select b from Paymentbill b, Payment p, So so, Customer cus where b.pBId = p.PBId and p.SOId = so.sOId and so.customerId = cus.customerId")
//    public List<Paymentbill> findBillByCustomer(@Param("customer") String customer);
}
