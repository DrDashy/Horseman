class Profil {
    
    // Database
    private int _id = -1;
    private String _name;
    private int _maxLevelUnlocked;
    
    // Other
    
    /***** CONSTRUCTOR *****/
    
    /**
     * Constructor, set a Profil object with values in database based on the name.
     *
     * @param name : represent the field <b>name</b> from the table <b>profil</b> in the database
     *
     * @exception GameException : Game cannot process further
     */
    Profil(String name) throws GameException {
        getProfilByName(name);
    }
    
    /***** GETTER *****/
    
    public int getMaxLevelUnlocked() {
        return _maxLevelUnlocked;
    }
    
    /***** METHOD *****/
    
    /**
     * Retreive Profil from database and set values.
     *
     * @param profilName : represent the field <b>name</b> from the table <b>profil</b> in the database
     *
     * @exception GameException : Game cannot process further
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    private void getProfilByName(String profilName) throws GameException {
        SQLite dbConnect = null;
        try {
            dbConnect = database.getInstance().getDbConnection();
        } catch (DatabaseException e) {
            println(e.getMessage());
            throw new GameException("Profil :: Unable to get the database connection instance.");
        }
        dbConnect.query(
            (
                "SELECT id, name, maxLevelUnlocked " +
                "FROM profil " + 
                "WHERE name='%s';"
            ), profilName
        );
        while (dbConnect.next())
        {
            _id = dbConnect.getInt("id");
            _name = dbConnect.getString("name");
            _maxLevelUnlocked = dbConnect.getInt("maxLevelUnlocked");
        }
        if (-1 == _id) {
            throw new GameException("Profil :: Profil named '" + profilName + "' not initialize properly.");
        }
    }
    
}
