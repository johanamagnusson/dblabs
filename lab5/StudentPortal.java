/* This is the driving engine of the program. It parses the command-line
 * arguments and calls the appropriate methods in the other classes.
 *
 * You should edit this file in two ways:
 * 1) Insert your database username and password in the proper places.
 * 2) Implement the three functions getInformation, registerStudent
 *    and unregisterStudent.
 */
import java.sql.*; // JDBC stuff.
import java.util.Properties;
import java.util.Scanner;
import java.util.*;
import java.io.*;  // Reading user input.


public class StudentPortal
{
    /* TODO Here you should put your database name, username and password */
    static final String USERNAME = "tda357_014";
    static final String PASSWORD = "cetac";

    /* Print command usage.
     * /!\ you don't need to change this function! */
    public static void usage () {
        System.out.println("Usage:");
        System.out.println("    i[nformation]");
        System.out.println("    r[egister] <course>");
        System.out.println("    u[nregister] <course>");
        System.out.println("    q[uit]");
    }

    /* main: parses the input commands.
     * /!\ You don't need to change this function! */
    public static void main(String[] args) throws Exception
    {
        Locale.setDefault(Locale.US);
        try {
            Class.forName("org.postgresql.Driver");
            String url = "jdbc:postgresql://ate.ita.chalmers.se/";
            Properties props = new Properties();
            props.setProperty("user",USERNAME);
            props.setProperty("password",PASSWORD);
            Connection conn = DriverManager.getConnection(url, props);

            String student = args[0]; // This is the identifier for the student.

            Console console = System.console();
	    // In Eclipse. System.console() returns null due to a bug 
        // (https://bugs.eclipse.org/bugs/show_bug.cgi?id=122429)
	    // In that case, use the following line instead:
	    // BufferedReader console = new BufferedReader(new InputStreamReader(System.in));
            usage();
            System.out.println("Welcome!");
            while(true) {
	        System.out.print("? > ");
                String mode = console.readLine();
                String[] cmd = mode.split(" +");
                cmd[0] = cmd[0].toLowerCase();
                if ("information".startsWith(cmd[0]) && cmd.length == 1) {
                    /* Information mode */
                    getInformation(conn, student);
                } else if ("register".startsWith(cmd[0]) && cmd.length == 2) {
                    /* Register student mode */
                    registerStudent(conn, student, cmd[1]);
                } else if ("unregister".startsWith(cmd[0]) && cmd.length == 2) {
                    /* Unregister student mode */
                    unregisterStudent(conn, student, cmd[1]);
                } else if ("quit".startsWith(cmd[0])) {
                    break;
                } else usage();
            }
            System.out.println("Goodbye!");
            conn.close();
        } catch (SQLException e) {
            System.err.println(e);
            System.exit(2);
        }
    }

    /* Given a student identification number, ths function should print
     * - the name of the student, the students national identification number
     *   and their issued login name (something similar to a CID)
     * - the programme and branch (if any) that the student is following.
     * - the courses that the student has read, along with the grade.
     * - the courses that the student is registered to. (queue position if the student is waiting for the course)
     * - the number of mandatory courses that the student has yet to read.
     * - whether or not the student fulfills the requirements for graduation
     */
    static void getInformation(Connection conn, String student) throws SQLException
    {
        PreparedStatement following = conn.prepareStatement
            ("SELECT * FROM StudentsFollowing WHERE StudentsFollowing.\"Person Number\" = ?");
        following.setString(1, student);
        
        PreparedStatement courses = conn.prepareStatement
            ("SELECT * FROM FinishedCourses WHERE FinishedCourses.\"Person Number\" = ?");
        courses.setString(1, student);

        PreparedStatement registrations = conn.prepareStatement
            ("SELECT code, name, personnr, \"Waiting Status\", placeinlist FROM " + 
             "Registrations LEFT JOIN WaitingFor ON personnr = student AND course = code " + 
             "WHERE Registrations.personnr = ?");
        registrations.setString(1, student);

        PreparedStatement gradPath = conn.prepareStatement
            ("SELECT * FROM PathToGraduation WHERE PathToGraduation.\"Person number\" = ?");
        gradPath.setString(1, student);

        ResultSet rsFollowing = following.executeQuery();
        ResultSet rsCourses = courses.executeQuery();
        ResultSet rsRegistrations = registrations.executeQuery();
        ResultSet rsGradPath = gradPath.executeQuery();

        rsFollowing.next();
        rsGradPath.next();

        System.out.println("Information for student " + student);
        System.out.println("-------------------------------------");
        System.out.println("Name: " + rsFollowing.getString("Student Name"));
        System.out.println("Student ID: " + rsFollowing.getString("Student ID"));
        System.out.println("Program: " + rsFollowing.getString("Program"));
        System.out.println("Branch: " + rsFollowing.getString("Branch"));
        System.out.println("");
        System.out.println("Read courses (name (code), credits: grade)");
        while (rsCourses.next()) {
            System.out.println(String.format(" %s (%s), %.1fp: %s", 
                    rsCourses.getString("Course Name"),
                    rsCourses.getString("Course Code"),
                    rsCourses.getFloat("Credits"),
                    rsCourses.getString("GRADE")));
        }
        System.out.println("");
        System.out.println("Registered courses (name (code): status)");
        while (rsRegistrations.next()) {
            String status = rsRegistrations.getString("Waiting Status");
            System.out.print(String.format(" %s (%s): %s",
                    rsRegistrations.getString("name"),
                    rsRegistrations.getString("code"),
                    status));
            if (status.equals("waiting")) {
                System.out.println(String.format(" as nr %d",
                        rsRegistrations.getInt("placeinlist")));
            } else {
                System.out.println("");
            }
        }
        System.out.println("");
        System.out.println("Seminar courses taken: " + rsGradPath.getInt("Number of Seminar"));
        System.out.println("Math credits taken: " + rsGradPath.getFloat("Mathematical credits"));
        System.out.println("Research credits taken: " + rsGradPath.getFloat("Research credits"));
        System.out.println("Total credits taken: " + rsGradPath.getFloat("Total credits"));
        System.out.println("Fulfills the requirements for graduation: " + rsGradPath.getString("Can graduate"));
        System.out.println("-------------------------------------");
        System.out.println("");

    }

    /* Register: Given a student id number and a course code, this function
     * should try to register the student for that course.
     */
    static void registerStudent(Connection conn, String student, String course)
    throws SQLException
    {
        // TODO: Your implementation here
        PreparedStatement register = conn.prepareStatement
            ("INSERT INTO Registrations (code, personnr) VALUES (?, ?)");
        register.setString(1, course);
        register.setString(2, student);

        try {
            register.executeUpdate();
        } catch (SQLException se) {
            String SQLState = se.getSQLState();
            if (SQLState.equals("23505")) {
                System.out.println("Student already ");
            }
            System.out.println(se.getSQLState() + se);
        }



    }

    /* Unregister: Given a student id number and a course code, this function
     * should unregister the student from that course.
     */
    static void unregisterStudent(Connection conn, String student, String course)
    throws SQLException
    {
        // TODO: Your implementation here
    }
}
