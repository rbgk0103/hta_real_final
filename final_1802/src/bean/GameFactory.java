package bean;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class GameFactory {
	private static SqlSessionFactory factory;
	
	static {
		try {
			Reader r = Resources.getResourceAsReader("ord_mybatis_config.xml");
			factory = new SqlSessionFactoryBuilder().build(r);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static SqlSessionFactory getFatory() {
		return factory;
	}
}
