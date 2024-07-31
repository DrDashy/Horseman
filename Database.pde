// Database library
import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;


public class Database {
    
    private Database _instance = null;
    private final String DATABASE_NAME = "game.db";
    private SQLite _db = null;
    
    public Database() {}
    
    public Database getInstance() {
        if (null == _instance) {
            _instance = new Database();
        }
        return _instance;
    }
    
    public SQLite getDbConnection() throws DatabaseException {
        if (null == _db) {
            // open database file
            _db = new SQLite(SKETCH_PAPPLET, DATABASE_NAME);
            if (!_db.connect()) {
                throw new DatabaseException("Database :: Cannot connect to the database.");
            }
            println("Connection successful");
        }
        return _db;  
    }
    
}

final Database database = new Database();
