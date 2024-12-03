package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Petition;


public class PetitionDao {
	private static String dburl = "jdbc:mariadb://localhost:3306/team?useSSL=false";
	private static String dbUser = "root";
	private static String dbpasswd = "0000";
	
	public int addPetition(String category, String title, String writer, String writerId, String problem, String solution, String effect) {
		// TODO Auto-generated method stub
				int insertCount = 0;
				
				Connection conn = null;
				PreparedStatement ps = null;
				
				try {
					Class.forName("org.mariadb.jdbc.Driver");
					conn = DriverManager.getConnection(dburl, dbUser, dbpasswd);
					String sql = "insert into petition(category,title,writer,writerid,problem,solution,effect,agree,isAns) values(?,?,?,?,?,?,?,?,?)";
					ps = conn.prepareStatement(sql);
					ps.setString(1, category);
					ps.setString(2, title);
					ps.setString(3, writer);
					ps.setString(4, writerId);
					ps.setString(5, problem);
					ps.setString(6, solution);
					ps.setString(7, effect);
					ps.setInt(8,0);
					ps.setInt(9,0);

					insertCount = ps.executeUpdate();
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
	public int upAgree(int id) {
		// TODO Auto-generated method stub
				int insertCount = 0;
				
				Connection conn = null;
				PreparedStatement ps = null;
				
				try {
					Class.forName("org.mariadb.jdbc.Driver");
					conn = DriverManager.getConnection(dburl, dbUser, dbpasswd);
					String sql = "UPDATE petition SET agree = agree + 1 WHERE id = ?";
					ps = conn.prepareStatement(sql);
					ps.setInt(1, id);
					
					insertCount = ps.executeUpdate();
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
	
	public List<Petition>getPet(){
		List<Petition> list = new ArrayList<>();

		try {
			Class.forName("org.mariadb.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String sql = "select id,DATE_FORMAT(date,'%Y.%m.%d'), category, title, writer, writerid, problem, solution, effect, agree, isAns from petition where isAns=0 order by date desc;";
		try (Connection conn = DriverManager.getConnection(dburl, dbUser, dbpasswd);
				PreparedStatement ps = conn.prepareStatement(sql)) {

			try (ResultSet rs = ps.executeQuery()) {

				while (rs.next()) {
					int id = rs.getInt(1);
					String date = rs.getString(2);
					String category = rs.getString(3);
					String title = rs.getString(4);
					String writer = rs.getString(5);
					String writerid = rs.getString(6);
					String problem = rs.getString(7);
					String solution = rs.getString(8);
					String effect = rs.getString(9);
					int agree = rs.getInt(10);
					int isAns = rs.getInt(11);
					
					Petition pet = new Petition(id,agree,isAns,writer,writerid,problem,solution,effect,date,title,category);
					list.add(pet);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	public List<Petition>getAnsPet(){
		List<Petition> list = new ArrayList<>();

		try {
			Class.forName("org.mariadb.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String sql = "select id,DATE_FORMAT(date,'%Y.%m.%d'), category, title, writer, writerid, problem, solution, effect, agree, isAns from petition where isAns=1 order by date desc;";
		try (Connection conn = DriverManager.getConnection(dburl, dbUser, dbpasswd);
				PreparedStatement ps = conn.prepareStatement(sql)) {

			try (ResultSet rs = ps.executeQuery()) {

				while (rs.next()) {
					int id = rs.getInt(1);
					String date = rs.getString(2);
					String category = rs.getString(3);
					String title = rs.getString(4);
					String writer = rs.getString(5);
					String writerid = rs.getString(6);
					String problem = rs.getString(7);
					String solution = rs.getString(8);
					String effect = rs.getString(9);
					int agree = rs.getInt(10);
					int isAns = rs.getInt(11);
					
					Petition pet = new Petition(id,agree,isAns,writer,writerid,problem,solution,effect,date,title,category);
					list.add(pet);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	public List<Petition>getRejPet(){
		List<Petition> list = new ArrayList<>();

		try {
			Class.forName("org.mariadb.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String sql = "select id,DATE_FORMAT(date,'%Y.%m.%d'), category, title, writer, writerid, problem, solution, effect, agree, isAns from petition where isAns=2 order by date desc;";
		try (Connection conn = DriverManager.getConnection(dburl, dbUser, dbpasswd);
				PreparedStatement ps = conn.prepareStatement(sql)) {

			try (ResultSet rs = ps.executeQuery()) {

				while (rs.next()) {
					int id = rs.getInt(1);
					String date = rs.getString(2);
					String category = rs.getString(3);
					String title = rs.getString(4);
					String writer = rs.getString(5);
					String writerid = rs.getString(6);
					String problem = rs.getString(7);
					String solution = rs.getString(8);
					String effect = rs.getString(9);
					int agree = rs.getInt(10);
					int isAns = rs.getInt(11);
					
					Petition pet = new Petition(id,agree,isAns,writer,writerid,problem,solution,effect,date,title,category);
					list.add(pet);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	public List<Petition> getTopPet(){
		List<Petition> list = new ArrayList<>();

		try {
			Class.forName("org.mariadb.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String sql = "select id,DATE_FORMAT(date,'%Y.%m.%d'), category, title, writer, writerid, problem, solution, effect, agree, isAns from petition where isAns in (0,1) order by agree desc, date desc;";
		try (Connection conn = DriverManager.getConnection(dburl, dbUser, dbpasswd);
				PreparedStatement ps = conn.prepareStatement(sql)) {

			try (ResultSet rs = ps.executeQuery()) {

				while (rs.next()) {
					int id = rs.getInt(1);
					String date = rs.getString(2);
					String category = rs.getString(3);
					String title = rs.getString(4);
					String writer = rs.getString(5);
					String writerid = rs.getString(6);
					String problem = rs.getString(7);
					String solution = rs.getString(8);
					String effect = rs.getString(9);
					int agree = rs.getInt(10);
					int isAns = rs.getInt(11);
					
					Petition pet = new Petition(id,agree,isAns,writer,writerid,problem,solution,effect,date,title,category);
					list.add(pet);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}

	public List<Petition> getTopNoAnsPet(){
		List<Petition> list = new ArrayList<>();

		try {
			Class.forName("org.mariadb.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String sql = "select id,DATE_FORMAT(date,'%Y.%m.%d'), category, title, writer, writerid, problem, solution, effect, agree, isAns from petition where isAns = 0 order by agree desc, date desc;";
		try (Connection conn = DriverManager.getConnection(dburl, dbUser, dbpasswd);
			 PreparedStatement ps = conn.prepareStatement(sql)) {

			try (ResultSet rs = ps.executeQuery()) {

				while (rs.next()) {
					int id = rs.getInt(1);
					String date = rs.getString(2);
					String category = rs.getString(3);
					String title = rs.getString(4);
					String writer = rs.getString(5);
					String writerid = rs.getString(6);
					String problem = rs.getString(7);
					String solution = rs.getString(8);
					String effect = rs.getString(9);
					int agree = rs.getInt(10);
					int isAns = rs.getInt(11);

					Petition pet = new Petition(id,agree,isAns,writer,writerid,problem,solution,effect,date,title,category);
					list.add(pet);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}


	
	public List<Petition> getAnsTopPet(){
		List<Petition> list = new ArrayList<>();

		try {
			Class.forName("org.mariadb.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String sql = "select id,DATE_FORMAT(date,'%Y.%m.%d'), category, title, writer, writerid, problem, solution, effect, agree, isAns from petition where isAns = 1 order by agree desc, date desc;";
		try (Connection conn = DriverManager.getConnection(dburl, dbUser, dbpasswd);
				PreparedStatement ps = conn.prepareStatement(sql)) {

			try (ResultSet rs = ps.executeQuery()) {

				while (rs.next()) {
					int id = rs.getInt(1);
					String date = rs.getString(2);
					String category = rs.getString(3);
					String title = rs.getString(4);
					String writer = rs.getString(5);
					String writerid = rs.getString(6);
					String problem = rs.getString(7);
					String solution = rs.getString(8);
					String effect = rs.getString(9);
					int agree = rs.getInt(10);
					int isAns = rs.getInt(11);
					
					Petition pet = new Petition(id,agree,isAns,writer,writerid,problem,solution,effect,date,title,category);
					list.add(pet);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	public Petition getPetbyId(int id){
		Petition pet = new Petition();
		try {
			Class.forName("org.mariadb.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String sql = "select id,DATE_FORMAT(date,'%Y.%m.%d'), category, title, writer, writerid, problem, solution, effect, agree, isAns from petition where id =?;";
		try (Connection conn = DriverManager.getConnection(dburl, dbUser, dbpasswd);
				PreparedStatement ps = conn.prepareStatement(sql)) {
			
			ps.setInt(1,id);
			try (ResultSet rs = ps.executeQuery()) {

				while (rs.next()) {
					String date = rs.getString(2);
					String category = rs.getString(3);
					String title = rs.getString(4);
					String writer = rs.getString(5);
					String writerid = rs.getString(6);
					String problem = rs.getString(7);
					String solution = rs.getString(8);
					String effect = rs.getString(9);
					int agree = rs.getInt(10);
					int isAns = rs.getInt(11);
					
					Petition tmp = new Petition(id,agree,isAns,writer,writerid,problem,solution,effect,date,title,category);
					pet = tmp;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return pet;
	}
	public List<Petition>getPetByCategory(String category){
		List<Petition> list = new ArrayList<>();

		try {
			Class.forName("org.mariadb.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String sql = "select id,DATE_FORMAT(date,'%Y.%m.%d'), category, title, writer, writerid, problem, solution, effect, agree, isAns from petition where category=? and isAns=0 order by date desc;";
		try (Connection conn = DriverManager.getConnection(dburl, dbUser, dbpasswd);
				PreparedStatement ps = conn.prepareStatement(sql)) {
			
			ps.setString(1,category);
			
			try (ResultSet rs = ps.executeQuery()) {

				while (rs.next()) {
					int id = rs.getInt(1);
					String date = rs.getString(2);
					String title = rs.getString(4);
					String writer = rs.getString(5);
					String writerid = rs.getString(6);
					String problem = rs.getString(7);
					String solution = rs.getString(8);
					String effect = rs.getString(9);
					int agree = rs.getInt(10);
					int isAns = rs.getInt(11);
					
					Petition pet = new Petition(id,agree,isAns,writer,writerid,problem,solution,effect,date,title,category);
					list.add(pet);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	public List<Petition>getAnsPetByCategory(String category){
		List<Petition> list = new ArrayList<>();

		try {
			Class.forName("org.mariadb.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String sql = "select id,DATE_FORMAT(date,'%Y.%m.%d'), category, title, writer, writerid, problem, solution, effect, agree, isAns from petition where isAns =1 and category=? order by date desc;";
		try (Connection conn = DriverManager.getConnection(dburl, dbUser, dbpasswd);
				PreparedStatement ps = conn.prepareStatement(sql)) {
			
			ps.setString(1,category);
			
			try (ResultSet rs = ps.executeQuery()) {

				while (rs.next()) {
					int id = rs.getInt(1);
					String date = rs.getString(2);
					String title = rs.getString(4);
					String writer = rs.getString(5);
					String writerid = rs.getString(6);
					String problem = rs.getString(7);
					String solution = rs.getString(8);
					String effect = rs.getString(9);
					int agree = rs.getInt(10);
					int isAns = rs.getInt(11);
					
					Petition pet = new Petition(id,agree,isAns,writer,writerid,problem,solution,effect,date,title,category);
					list.add(pet);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}

	public boolean deletePetition(String petitionId) {
		String sql = "DELETE FROM petition WHERE id = ?";

		try {
			try (Connection conn = DriverManager.getConnection(dburl, dbUser, dbpasswd);
				 PreparedStatement ps = conn.prepareStatement(sql)) {
				ps.setInt(1, Integer.parseInt(petitionId));
				int rowsAffected = ps.executeUpdate();
				return rowsAffected > 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean rejPetition(int petid) {
		String sql = "UPDATE petition SET isAns = 2 WHERE id = ?";

		try (Connection conn = DriverManager.getConnection(dburl, dbUser, dbpasswd);
			 PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, petid);
			int updateCount = ps.executeUpdate();
			return updateCount > 0;

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public int PetitionCount(){
		int postCount = 0;

		try (Connection conn = DriverManager.getConnection(dburl, dbUser, dbpasswd)) {
			String sql = "SELECT COUNT(*) FROM petition";

			try (PreparedStatement stmt = conn.prepareStatement(sql);
				 ResultSet rs = stmt.executeQuery()) {

				if (rs.next()) {
					postCount = rs.getInt(1); // 첫 번째 컬럼이 게시글 개수
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return postCount;
	}
}
