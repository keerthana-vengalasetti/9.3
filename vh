
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class DeleteRecord {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/college";
        String user = "root";
        String password = "root";

        Scanner sc = new Scanner(System.in);

        try {
            // Connect to the database
            Connection con = DriverManager.getConnection(
                url, user, password
            );

            System.out.println("Database connected successfully!");

            // Get student ID
            System.out.print("Enter Student ID to delete: ");
            int id = sc.nextInt();

            // SQL delete query
            String sql = "DELETE FROM student WHERE id = ?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            // Execute delete query
            int rows = ps.executeUpdate();

            if (rows > 0) {
                System.out.println("Record deleted successfully!");
            } else {
                System.out.println("Record not found.");
            }

            // Close resources
            ps.close();
            con.close();

        } catch (SQLException e) {
            System.out.println("Database error: " + e.getMessage());
        }

        sc.close();
    }
}
