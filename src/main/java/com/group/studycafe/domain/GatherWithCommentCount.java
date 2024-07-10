package com.group.studycafe.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GatherWithCommentCount {

    private Gather gather;
    private Long commentCount;

}