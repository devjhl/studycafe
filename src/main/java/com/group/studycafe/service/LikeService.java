package com.group.studycafe.service;

import com.group.studycafe.domain.Gather;
import com.group.studycafe.domain.Like;
import com.group.studycafe.repository.GatherRepository;
import com.group.studycafe.repository.LikeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.transaction.annotation.Transactional;

@Service
public class LikeService {

    @Autowired
    private LikeRepository likeRepository;

    @Autowired
    private GatherRepository gatherRepository;

    public boolean userHasLiked(Long gatherId, String username) {
        return likeRepository.findByGatherIdAndUsername(gatherId, username).isPresent();
    }

    @Transactional
    public int likeGather(Long gatherId, String username) {
        if (!userHasLiked(gatherId, username)) {
            Gather gather = gatherRepository.findById(gatherId).orElseThrow(() -> new IllegalArgumentException("Invalid gather Id:" + gatherId));
            Like like = new Like();
            like.setGather(gather);
            like.setUsername(username);
            likeRepository.save(like);

            gather.setLikes(gather.getLikes() + 1);
            gatherRepository.save(gather);
        }
        return gatherRepository.findById(gatherId).get().getLikes();
    }

    @Transactional
    public int unlikeGather(Long gatherId, String username) {
        if (userHasLiked(gatherId, username)) {
            likeRepository.deleteByGatherIdAndUsername(gatherId, username);

            Gather gather = gatherRepository.findById(gatherId).orElseThrow(() -> new IllegalArgumentException("Invalid gather Id:" + gatherId));
            gather.setLikes(gather.getLikes() - 1);
            gatherRepository.save(gather);
        }
        return gatherRepository.findById(gatherId).get().getLikes();
    }

    public int getLikesCount(Long gatherId) {
        return gatherRepository.findById(gatherId).map(Gather::getLikes).orElse(0);
    }
}
