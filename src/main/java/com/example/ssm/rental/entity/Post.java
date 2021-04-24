package com.example.ssm.rental.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.example.ssm.rental.common.base.BaseEntity;
import lombok.Data;

/**
 * 文章
 *
 * @author 言曌
 * @date 2021/4/23 12:16 下午
 */
@Data
@TableName("t_post")
public class Post extends BaseEntity {

    /**
     * 标题
     */
    private String title;

    /**
     * 内容
     */
    private String content;

    /**
     * 摘要
     */
    private String summary;

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 文章类型，求租
     * @see com.example.ssm.rental.common.enums.PostTypeEnum
     */
    private String postType;

    /**
     * 用户
     */
    @TableField(exist = false)
    private User user;
}
