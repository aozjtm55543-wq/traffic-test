package com.traffictest.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(indexes = {
    @Index(name = "idx_hashtag_name", columnList = "name"),
    @Index(name = "idx_hashtag_board_id", columnList = "board_id")
})
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class HashTag extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    @Setter
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "board_id")
    private Board board;
}
