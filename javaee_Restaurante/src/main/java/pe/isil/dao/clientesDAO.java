package pe.isil.dao;

import pe.isil.util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import static pe.isil.util.DatabaseUtil.getConnection;

public class clientesDAO {
    public static clientes createclientes(clientes clientes){
        try (Connection connection = DatabaseUtil.getConnection()) {
            String sql = "INSERT INTO clientes (id_cli,dni_cli,nom_cli,ape_cli,ruc_cli,tel_cli) values (?,?,?,?,?,?) ";
            try(PreparedStatement statement = connection.prepareStatement(sql)){
                statement.setInt(1, clientes.getid_cli());
                statement.setInt(2, clientes.getdni_cli());
                statement.setDouble(3, clientes.getnom_cli());
                statement.setString(4, clientes.getape_cli());
                statement.setString(5, clientes.getruc_cli());
                statement.setString(5, clientes.gettel_cli());
                int id = statement.executeUpdate();
                clientes.setid_cli(id);
                return clientes;
            }
        } catch (Exception exception) {
            throw new RuntimeException(exception);
        }
    }

    public static List<clientes> findAllclientes(){
        List<clientes> clientes = new ArrayList<>();
        try (Connection connection = getConnection()) {
            String sql = "SELECT * FROM clientes ";
            try(Statement statement = connection.createStatement()){
                try(ResultSet resultSet = statement.executeQuery(sql)){
                    while(resultSet.next()){
                        clientes user = getclientes(resultSet);
                        clientes.add(user);
                    }
                }
            }
        } catch (Exception exception) {
            throw new RuntimeException(exception);
        }
        return clientes;
    }
}
