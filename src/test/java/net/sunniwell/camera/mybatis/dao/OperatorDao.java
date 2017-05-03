package net.sunniwell.camera.mybatis.dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import net.sunniwell.camera.mybatis.db.DBAccess;
import net.sunniwell.camera.mybatis.model.Operator;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;

/**
 * @author 763915703@qq.com
 * @date 创建时间：2017年4月26日 下午3:14:13
 * @version 1.0
 * @since
 * @description
 */
public class OperatorDao {
	private static Logger logger = Logger.getLogger(OperatorDao.class);

	/**
	 * 
	 * @Title: findAll
	 * @Description: 查询所有对象
	 * @param 设定文件
	 * @return void 返回类型
	 * @throws
	 */
	public void findOperatorList() {
		DBAccess db = new DBAccess();
		SqlSession sqlSession = null;
		List<Operator> operatorlist = new ArrayList<Operator>();
		try {
			sqlSession = db.getSqlSession();
			// 通过SqlSession执行SQL语句
			operatorlist = sqlSession.selectList("Operator.findOperatorList");
			if (operatorlist != null && operatorlist.size() > 0) {
				for (Operator operator : operatorlist) {
					logger.info("username=== " + operator.getUsername());
					logger.info("password=== " + operator.getPassword());
					logger.info("==========");
				}
			} else {
				logger.info("There is no operators.".trim());
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (sqlSession != null) {
				sqlSession.close();
			}
		}
	}

	/**
	 * 
	 * @Title: findOperatorListByUsername
	 * @Description: 根据条件查询
	 * @param 设定文件
	 * @return void 返回类型
	 * @throws
	 */
	public void findOperatorListByUsername() {
		DBAccess db = new DBAccess();
		SqlSession sqlSession = null;
		List<Operator> operatorlist = new ArrayList<Operator>();
		try {
			sqlSession = db.getSqlSession();
			Operator oper = new Operator();
			oper.setUsername("admin");
			// 通过SqlSession执行SQL语句
			operatorlist = sqlSession.selectList("Operator.findOperatorByUsername", oper);
			if (operatorlist != null && operatorlist.size() > 0) {
				for (Operator operator : operatorlist) {
					logger.info("username=== " + operator.getUsername());
					logger.info("password=== " + operator.getPassword());
					logger.info("==========");
				}
			} else {
				logger.info("There is no operators.".trim());
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (sqlSession != null) {
				sqlSession.close();
			}
		}
	}

	/**
	 * 
	 * @Title: insertOperator
	 * @Description: 往数据库插入数据
	 * @param 设定文件
	 * @return void 返回类型
	 * @throws
	 */
	public void insertOperator() {
		DBAccess db = new DBAccess();
		SqlSession sqlSession = null;
		try {
			sqlSession = db.getSqlSession();
			for (int i = 1; i < 1000; i++) {
				Operator oper = new Operator();
				oper.setId(i);
				oper.setUsername("admin" + i);
				oper.setAdministrator((i % 2) == 0);
				oper.setPassword("admin" + i);
				// 通过SqlSession执行SQL语句
				int result = sqlSession.insert("Operator.insertOperator", oper);
				// 需要显示的提交
				sqlSession.commit();
				if (result == 1) {
					logger.info("insert data success......");
				} else {
					logger.info("insert data failed......");
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (sqlSession != null) {
				sqlSession.close();
			}
		}
	}

	/**
	 * 
	 * @Title: deleteOne
	 * @Description: 根据ID删除数据
	 * @param 设定文件
	 * @return void 返回类型
	 * @throws
	 */
	public void deleteOne() {
		DBAccess db = new DBAccess();
		SqlSession sqlSession = null;
		try {
			sqlSession = db.getSqlSession();
			// 通过SqlSession执行SQL语句
			int delete = sqlSession.delete("Operator.deleteOne", 0);
			// 需要显示的提交
			sqlSession.commit();
			if (delete == 1) {
				logger.info("delete data success......");
			} else {
				logger.info("delete data failed......");
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (sqlSession != null) {
				sqlSession.close();
			}
		}

	}

	/**
	 * 
	 * @Title: updateOperator
	 * @Description: 修改数据
	 * @param 设定文件
	 * @return void 返回类型
	 * @throws
	 */
	public void updateOperator() {
		DBAccess db = new DBAccess();
		SqlSession sqlSession = null;
		try {
			sqlSession = db.getSqlSession();
			Operator oper = new Operator();
			oper.setId(1);
			oper.setUsername("admin1");
			oper.setAdministrator(true);
			oper.setPassword("admin1");
			// 通过SqlSession执行SQL语句
			int update = sqlSession.update("Operator.updateOperator", oper);
			sqlSession.commit();
			logger.info("update success is " + update);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (sqlSession != null) {
				sqlSession.close();
			}
		}
	}

	/**
	 * 
	 * @Title: batchInsertOperator 
	 * @Description: 实现批量插入
	 * @param     设定文件 
	 * @return void    返回类型 
	 * @throws
	 */
	public void batchInsertOperator() {
		DBAccess db = new DBAccess();
		SqlSession sqlSession = null;
		try {
			sqlSession = db.getSqlSession();
			List<Operator> list = new ArrayList<Operator>();
			for(int i = 1000 ; i<1010 ; i++ ){
				Operator oper = new Operator();
				oper.setId(i);
				oper.setUsername("admin"+i);
				oper.setAdministrator(true);
				oper.setPassword("admin"+i);
				list.add(oper);
			}
			// 通过SqlSession执行SQL语句
			int update = sqlSession.insert("Operator.batchInsertOperator", list);
			sqlSession.commit();
			logger.info("update success is " + update);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (sqlSession != null) {
				sqlSession.close();
			}
		}
	}
	
	/**
	 * 
	 * @Title: findById 
	 * @Description: 根据ID查询对象
	 * @param     设定文件 
	 * @return void    返回类型 
	 * @throws
	 */
	public void findById(){
		DBAccess db = new DBAccess();
		SqlSession sqlSession = null;
		try {
			sqlSession = db.getSqlSession();
			// 通过SqlSession执行SQL语句
			Operator object = sqlSession.selectOne("Operator.findById", 1001);
			//int update = sqlSession.insert("Operator.batchInsertOperator", list);
			if(object!=null){
				logger.info("update success is " + object.getUsername());
//				int delete = sqlSession.delete("Operator.deleteOne", object.getId());
//				sqlSession.commit();
//				logger.info("delete success ? " + delete);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (sqlSession != null) {
				sqlSession.close();
			}
		}
	}
	

	/**
	 * 
	 * @Title: deleteByIdLE 
	 * @Description: 批量删除
	 * @param     设定文件 
	 * @return void    返回类型 
	 * @throws
	 */
	public void deleteByIdLE(){
		DBAccess db = new DBAccess();
		SqlSession sqlSession = null;
		try {
			sqlSession = db.getSqlSession();
			// 通过SqlSession执行SQL语句
			int delete = sqlSession.delete("Operator.deleteByIdLE", 1001);
			logger.info("delete success is " + delete);
			sqlSession.commit();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (sqlSession != null) {
				sqlSession.close();
			}
		}
	}
	public static void main(String[] args) {
		OperatorDao dao = new OperatorDao();
		// dao.findOperatorList();
		// dao.findOperatorListByUsername();
		// dao.insertOperator();
		// dao.updateOperator();
		// dao.deleteOne();
//		dao.batchInsertOperator();
//		dao.findById();
		dao.deleteByIdLE();
	}

}
