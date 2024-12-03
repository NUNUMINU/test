package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.User;

public class UserDao {
	private static String dburl = "jdbc:mariadb://localhost:3306/team?useSSL=false";
	private static String dbUser = "root";
	private static String dbpasswd = "0000";

	public User getUserByIdPw(String id,String pw){
		User user = new User();

		try {
			Class.forName("org.mariadb.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String sql = "select name from user where id = ? and passwd = ?;";
		try (Connection conn = DriverManager.getConnection(dburl, dbUser, dbpasswd);
				PreparedStatement ps = conn.prepareStatement(sql)) {
			
			ps.setString(1, id);
			ps.setString(2, pw);
			try (ResultSet rs = ps.executeQuery()) {

				while (rs.next()) {
					String name = rs.getString(1);
					user.setId(id);
					user.setPw(pw);
					user.setName(name);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return user;
	}

}
