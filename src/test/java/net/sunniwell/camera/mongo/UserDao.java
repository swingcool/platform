package net.sunniwell.camera.mongo;

import java.util.List;

import net.sunniwell.camera.model.User;

/**
 * @author 763915703@qq.com
 * @date 创建时间：2017年4月24日 下午3:53:52
 * @version 1.0
 * @since
 * @description
 */
public interface UserDao {
	/**
	 * 查询所有数据
	 * 
	 * @return
	 */
	List<User> findAll();

	/**
	 * 用于分页查询
	 * 
	 * @param skip
	 *            (第一个坐标为0)
	 * @param limit
	 * @return
	 */
	List<User> findList(int skip, int limit);

	/**
	 * 保存用户
	 * 
	 * @param user
	 */
	void store(User user);

	/**
	 * 根据id查询
	 * 
	 * @param id
	 * @return
	 */
	User findOne(String id);

	/**
	 * 根据用户名查询
	 * 
	 * @param username
	 * @return
	 */
	User findOneByUsername(String username);

	/**
	 * 更新
	 * 
	 * @param user
	 */
	void updateFirst(User user);

	/**
	 * 删除
	 * 
	 * @param ids
	 */
	void delete(String... ids);
}
