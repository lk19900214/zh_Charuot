package com.zh.util;

import tk.mybatis.mapper.common.IdsMapper;
import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

/**
 * Created by webrx on 2017-09-22.
 */
public interface MyMapper<T> extends Mapper<T>, MySqlMapper<T>, IdsMapper<T> {
}
