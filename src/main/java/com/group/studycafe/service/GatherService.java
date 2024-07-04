package com.group.studycafe.service;

import com.group.studycafe.domain.Gather;
import com.group.studycafe.repository.GatherRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class GatherService {

    private final GatherRepository gatherRepository;

    public Page<Gather> findAll(Pageable pageable) {
        return gatherRepository.findAll(pageable);
    }
    public Gather findById(Long id) {
        gatherRepository.incrementViewCount(id); // 조회수 증가
        return gatherRepository.findById(id).orElse(null);
    }
    public Gather save(Gather gather) {
        return gatherRepository.save(gather);
    }
    public void delete(Gather gather) {
        gatherRepository.delete(gather);
    }
    public Page<Gather> searchGathers(String keyword, Pageable pageable) {
        return gatherRepository.searchGather(keyword, pageable);
    }
}
