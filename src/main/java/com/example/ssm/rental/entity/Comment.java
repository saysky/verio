package com.example.ssm.rental.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.example.ssm.rental.common.base.BaseEntity;
import lombok.Data;

/**
 * 评论
 *
 * @author 言曌
 * @date 2021/4/23 12:16 下午
 */
@Data
@TableName("t_comment")
public class Comment extends BaseEntity {

    /**
     * 内容
     */
    private String content;

    /**
     * 留言用户ID
     */
    private Long userId;

    /**
     * 文章用户ID
     */
    private Long postUserId;

    /**
     * 文章ID
     */
    private Long postId;

    @TableField(exist = false)
    private Post post;

    @TableField(exist = false)
    private User user;
}
