package net.sunniwell.camera.mybatis.db;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * @author 763915703@qq.com
 * @date 创建时间：2017年4月26日 下午3:13:50
 * @version 1.0
 * @since
 * @description
 */
public class DBAccess {

	public SqlSession getSqlSession() throws IOException {
		String sqlFile = "mybatis/mybatis-config.xml";
		InputStream inputStream = Resources.getResourceAsStream(sqlFile);
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession sqlSession = sqlSessionFactory.openSession();
		return sqlSession;
	}

	public static void main(String[] args) {
		DBAccess db = new DBAccess();
		SqlSession sqlSession = null;
		try {
			sqlSession = db.getSqlSession();
			System.out.println("ssssssssss"+sqlSession);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (sqlSession != null) {
				sqlSession.close();
			}
		}
	}

}
