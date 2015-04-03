package cat.udl.eps.softarch.hello.repository;

import cat.udl.eps.softarch.hello.model.Measure;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * Created by Angel on 27/03/2015.
 */

public interface MeasureRepository extends PagingAndSortingRepository<Measure, Long> {

    // PagingAndSortingRepository provides:
    // exists(ID id), delete(T entity), findAll(Pageable), findAll(Sort), findOne(ID id), save(T entity),...
    // http://docs.spring.io/spring-data/commons/docs/current/api/org/springframework/data/repository/PagingAndSortingRepository.html

}


