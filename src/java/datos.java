package net.javaguides.postgresql.tutorial;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class InsertRecordExample {
    private final String url = "jdbc:postgresql://localhost/5432/OlimpiadasG5 ";
    private final String user = "postgres";
    private final String password = "root";
