package bean;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// DBConnection 클래스를 대체한다
public class FinalFactory {
	/* 필드 */
	private static SqlSessionFactory factory;

	static {
		try {
			Reader r = Resources.getResourceAsReader("mybatis_config.xml");
			factory = new SqlSessionFactoryBuilder().build(r);

		} catch (IOException e) {
			e.printStackTrace();
		}
	} // End of static {}

	public static SqlSessionFactory getFactory() {
		return factory;
	}

} // End of class
