package com.taraszka.bookexchange.repository;

import com.taraszka.bookexchange.entity.Book;
import com.taraszka.bookexchange.entity.Transactions;
import com.taraszka.bookexchange.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface TransactionsRepository extends JpaRepository<Transactions, Long> {



    @Query("select t from Transactions t where t.owner = ?1 AND t.status = ?2")
    List<Transactions> findAllByUser(User owner, int status);

    @Query("select t from Transactions t where t.contractor = ?1 AND t.status = ?2")
    List<Transactions> findAllByContractor(User contractor, int status);

    @Transactional
    @Modifying
    @Query("update Transactions t set t.status= ?2 where t.id = ?1")
    void UpdateStatusWhereTransacionIdIs(long transactionId, int status);

    @Transactional
    @Modifying
    @Query("update Transactions t set t.contractorBook = ?2 where t.id = ?1")
    void UpdateContractorBookIdWhereTransacionIdIs(long transactionId, Book bookId);
}
