package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Reply;

public class ReplyDao {
	private static String dburl = "jdbc:mariadb://localhost:3306/team?useSSL=false";
	private static String dbUser = "root";
	private static String dbpasswd = "0000";
	
	public int addReply(int ref, String writer, String writerId, String content) {
		// TODO Auto-generated method stub
				int insertCount = 0;
				
				Connection conn = null;
				PreparedStatement ps = null;
				
				try {
					Class.forName("org.mariadb.jdbc.Driver");
					conn = DriverManager.getConnection(dburl, dbUser, dbpasswd);
					String sql = "insert into reply(ref,writer,writerid,content) values(?,?,?,?)";
					ps = conn.prepareStatement(sql);
					ps.setInt(1, ref);
					ps.setString(2, writer);
					ps.setString(3, writerId);
					ps.setString(4, content);
					
					insertCount = ps.executeUpdate();
					if(writerId.equals("2020")) {
						updateIsAnsForPetition(ref);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					if (ps != null) {
						try {
							ps.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
					if (conn != null) {
						try {
							conn.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
				}
				return insertCount;
	}

	public int updateIsAnsForPetition(int ref) {
		int updateCount = 0;
		String sql = "UPDATE petition SET isAns = 1, title = CONCAT('[답변완료] ', title) WHERE id = ? AND title NOT LIKE '[답변완료]%' AND isAns != 2";


		try (Connection conn = DriverManager.getConnection(dburl, dbUser, dbpasswd);
			 PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, ref);
			updateCount = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return updateCount;
	}




	public List<Reply>getReplyByRef(int ref){
		List<Reply> list = new ArrayList<>();

		try {
			Class.forName("org.mariadb.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String sql = "select id,DATE_FORMAT(date,'%Y.%m.%d'), ref, writer, writerid, content from reply where ref = ? order by date desc;";
		try (Connection conn = DriverManager.getConnection(dburl, dbUser, dbpasswd);
				PreparedStatement ps = conn.prepareStatement(sql)) {
			
			ps.setInt(1, ref);
			try (ResultSet rs = ps.executeQuery()) {

				while (rs.next()) {
					int id = rs.getInt(1);
					String date = rs.getString(2);
					String writer = rs.getString(4);
					String writerid = rs.getString(5);
					String content = rs.getString(6);
					
					Reply reply = new Reply(id,ref,writer,writerid,date,content);
					list.add(reply);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
}
