package cat.udl.eps.softarch.hello.repository;

import cat.udl.eps.softarch.hello.model.Test;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created by Angel on 13/04/2015.
 */

public interface TestRepository extends PagingAndSortingRepository<Test, Long> {

    // PagingAndSortingRepository provides:
    // exists(ID id), delete(T entity), findAll(Pageable), findAll(Sort), findOne(ID id), save(T entity),...
    // http://docs.spring.io/spring-data/commons/docs/current/api/org/springframework/data/repository/PagingAndSortingRepository.html

}
