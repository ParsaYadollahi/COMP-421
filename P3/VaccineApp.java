import java.sql.* ;
import java.util.Date;
import java.util.Scanner;  // Import the Scanner class

import java.time.LocalTime;
import java.util.Calendar;
import java.util.List;
import java.util.stream.Collectors;

class VaccineApp
{

    static boolean loop = true;
    public static void main ( String [ ] args ) throws SQLException
    {
      // Unique table names.  Either the user supplies a unique identifier as a command line argument, or the program makes one up.
        String tableName = "";
        int sqlCode=0;      // Variable to hold SQLCODE
        String sqlState="00000";  // Variable to hold SQLSTATE

        if ( args.length > 0 )
            tableName += args [ 0 ] ;
        else
          tableName += "exampletbl";

        // Register the driver.  You must register the driver before you can use it.
        try { DriverManager.registerDriver ( new com.ibm.db2.jcc.DB2Driver() ) ; }
        catch (Exception cnfe){ System.out.println("Class not found"); }

        // This is the url you must use for DB2.
        //Note: This url may not valid now !
        String url = "jdbc:db2://winter2021-comp421.cs.mcgill.ca:50000/cs421";

        //REMEMBER to remove your user id and password before submitting your code!!
        String your_userid = null;
        String your_password = null;
        //AS AN ALTERNATIVE, you can just set your password in the shell environment in the Unix (as shown below) and read it from there.
        //$  export SOCSPASSWD=yoursocspasswd
        if(your_userid == null && (your_userid = System.getenv("SOCSUSER")) == null)
        {
          System.err.println("Error!! do not have a password to connect to the database!");
          System.exit(1);
        }
        if(your_password == null && (your_password = System.getenv("SOCSPASSWD")) == null)
        {
          System.err.println("Error!! do not have a password to connect to the database!");
          System.exit(1);
        }
        Connection con = DriverManager.getConnection (url,your_userid,your_password) ;
        Statement statement = con.createStatement ( ) ;

        while(loop) {
          System.out.println("VaccineApp Main Menu");
          System.out.print(" \t1. Add a Person\n \t2. Assign a slot to a Person\n \t3. Enter Vaccination information\n \t4. Exit Application\n Please Enter Your Option:  ");
          Scanner optionScanner = new Scanner(System.in);  // Create a Scanner object
          String optionChosen = optionScanner.nextLine();  // Read user input

          if (optionChosen.equals("1") || optionChosen.equals("Add a Person")) addPerson(con, statement, sqlCode, sqlState);
          if (optionChosen.equals("2") || optionChosen.equals("Assign a slot to a Person")) assignSlot(con, statement, sqlCode, sqlState);
          if (optionChosen.equals("3") || optionChosen.equals("Enter Vaccination information")) vaccineInfo(con, statement, sqlCode, sqlState);
          if (optionChosen.equals("4") || optionChosen.equals("Exit Application")) exitProgram();
        }
      statement.close ( ) ;
      con.close ( ) ;
    }


    public static void addPerson(Connection con, Statement statement, int sqlCode, String sqlState) {
      // Inserting Data into the table - Add a person
      System.out.println("Please entre the relevant information:\n");
      System.out.println("\thinsurnum VARCHAR(50) NOT NULL");
      System.out.println("\tname VARCHAR(50)");
      System.out.println("\tgender VARCHAR(50) NOT NULL,");
      System.out.println("\tbirthdate DATE NOT NULL,");
      System.out.println("\tphone VARCHAR(50) NOT NULL,");
      System.out.println("\tcity VARCHAR(50) NOT NULL,");
      System.out.println("\tpostalcode VARCHAR(50) NOT NULL,");
      System.out.println("\tstreetaddr VARCHAR(50) NOT NULL,");
      System.out.println("\tregdate DATE NOT NULL,");
      System.out.println("\tcname VARCHAR(50) NOT NULL,");

      Scanner hinsurnumScanner = new Scanner(System.in);
      String hinsurnumDetails = hinsurnumScanner.nextLine();

      Scanner nameScanner = new Scanner(System.in);
      String nameDetails = nameScanner.nextLine();

      Scanner genderScanner = new Scanner(System.in);
      String genderDetails = genderScanner.nextLine();

      Scanner birthdateScanner = new Scanner(System.in);
      String birthdateDetails = birthdateScanner.nextLine();

      Scanner phoneScanner = new Scanner(System.in);
      String phoneDetails = phoneScanner.nextLine();

      Scanner cityScanner = new Scanner(System.in);
      String cityDetails = cityScanner.nextLine();

      Scanner postalcodeScanner = new Scanner(System.in);
      String postalcodeDetails = postalcodeScanner.nextLine();

      Scanner streetaddrScanner = new Scanner(System.in);
      String streetaddrDetails = streetaddrScanner.nextLine();

      Scanner regdateScanner = new Scanner(System.in);
      String regdateDetails = regdateScanner.nextLine();

      Scanner cnameScanner = new Scanner(System.in);
      String cnameDetails = cnameScanner.nextLine();

      String modifyResidentAnswer = "N";
      try
      {
        String hinsurnumQuery = "SELECT hinsurnum FROM resident" + " WHERE hinsurnum = " + hinsurnumDetails;
        System.out.println (hinsurnumQuery) ;
        java.sql.ResultSet rs = statement.executeQuery ( hinsurnumQuery );

        while (rs.next())
        {
          int hinsurnumQueryOutput = rs.getInt (1) ;
          System.out.println ("The resident with Health Insurance number " + hinsurnumQueryOutput + " already exists, modify their information with the current info? (Y/N)");
          Scanner modifyResidentAnswerScanner = new Scanner(System.in);
          modifyResidentAnswer = modifyResidentAnswerScanner.nextLine();
        }
      }
      catch (SQLException e)
      {
        sqlCode = e.getErrorCode(); // Get SQLCODE
        sqlState = e.getSQLState(); // Get SQLSTATE

        // Your code to handle errors comes here;
        // something more meaningful than a print would be good
        System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
        System.out.println(e);
      }
      if (modifyResidentAnswer.equals("Y")){
        try
        {
          String updateSQL = "UPDATE resident SET hinsurnum = '"+hinsurnumDetails+"', name = '"+nameDetails+"', gender = '"+genderDetails+"', birthdate = '"+birthdateDetails+"', phone = '"+phoneDetails+"', city = '"+cityDetails+"', postalcode = '"+postalcodeDetails+"', streetaddr = '"+streetaddrDetails+"', regdate = '"+regdateDetails+"', cname = '"+cnameDetails+"' WHERE hinsurnum='"+hinsurnumDetails+"'";
          System.out.println(updateSQL);
          statement.executeUpdate(updateSQL);
        }
        catch (SQLException e)
        {
          sqlCode = e.getErrorCode(); // Get SQLCODE
          sqlState = e.getSQLState(); // Get SQLSTATE

          // Your code to handle errors comes here;
          // something more meaningful than a print would be good
          System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
          System.out.println(e);
        }
      } else {
        try
        {
            // New Resident
            String insertSQL = "INSERT INTO resident VALUES ( '"+hinsurnumDetails+"', '"+nameDetails+"', '"+genderDetails+"', '"+birthdateDetails+"', '"+phoneDetails+"', '"+cityDetails+"', '"+postalcodeDetails+"', '"+streetaddrDetails+"', '"+regdateDetails+"', '"+cnameDetails+"')" ;
            System.out.println(insertSQL);
            statement.executeUpdate ( insertSQL ) ;
        }
        catch (SQLException e)
        {
          sqlCode = e.getErrorCode(); // Get SQLCODE
          sqlState = e.getSQLState(); // Get SQLSTATE

          // Your code to handle errors comes here;
          // something more meaningful than a print would be good
          System.out.println("Error on Insert query");
          System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
          System.out.println(e);
        }
      }
    }




    public static void assignSlot(Connection con, Statement statement, int sqlCode, String sqlState) {
      // Inserting Data into the table - Add a person
      System.out.println("Please entre the relevant information:\n");
      System.out.println("\tSocial Insurance Number");

      System.out.println("\tslotnum INTEGER NOT NULL");
      System.out.println("\tvtime TIME NOT NULL");
      System.out.println("\tvdate VARCHAR(50) NOT NULL,");
      System.out.println("\tlname VARCHAR(50) NOT NULL,");


      Scanner hinsurnumScanner = new Scanner(System.in);
      String hinsurnumDetails = hinsurnumScanner.nextLine();

      Scanner slotNumScanner = new Scanner(System.in);
      String slotNumDetails = slotNumScanner.nextLine();

      Scanner vtimeScanner = new Scanner(System.in);
      String vtimeDetails = vtimeScanner.nextLine();

      Scanner vdateScanner = new Scanner(System.in);
      String vdateDetails = vdateScanner.nextLine();

      Scanner lnameScanner = new Scanner(System.in);
      String lnameDetails = lnameScanner.nextLine();

      // String slotNumDetails = "";
      // String vtimeDetails = "";
      // String vdateDetails = "";
      // String lnameDetails = "";

      try {
        // Check if slot already taken
        String isAllocatedSlot = "SELECT hinsurnum FROM slot WHERE vtime = '" + vtimeDetails + "' AND slotnum = '" + slotNumDetails + "' AND vdate = '" + vdateDetails + "' AND lname = '" + lnameDetails + "';";
        System.out.println(isAllocatedSlot);
        java.sql.ResultSet rsisAllocatedSlot = statement.executeQuery ( isAllocatedSlot );
        while (rsisAllocatedSlot.next()) {
          String ouput = rsisAllocatedSlot.getString(1);
          if (ouput != null && !ouput.equals("NULL")) {
            System.out.println("This slot is already taken");
            statement.close ( ) ;
            con.close ( ) ;
            return;
          }
        }

        // Number of doses taken
        String numDoesesQuery = "SELECT COUNT(*) FROM slot WHERE hinsurnum = " + hinsurnumDetails;
        java.sql.ResultSet rsNumDoses = statement.executeQuery ( numDoesesQuery );
        int numDosesTaken = 0;
        while (rsNumDoses.next())
        {
          numDosesTaken = rsNumDoses.getInt(1);
          System.out.println(numDosesTaken);
        }


        // Get their vaccine
        String vnameQuery = "SELECT vname FROM slot WHERE hinsurnum = " + hinsurnumDetails;
        java.sql.ResultSet rsvName = statement.executeQuery ( vnameQuery );
        String vnameTaken = "";
        while (rsvName.next()) vnameTaken = rsvName.getString(1);

        boolean hasTakenVaccine = false;
        // Wait period and doses needed
        String numDoesesNeededQuery = "SELECT waitperiod, doses FROM vaccine WHERE vname = \'" + vnameTaken + "\'";
        java.sql.ResultSet rsNumDosesNeeded = statement.executeQuery ( numDoesesNeededQuery );
        int numDoesesNeeded = 0;
        int waitPeriodNeeded = 0;
        while (rsNumDosesNeeded.next()) {
          hasTakenVaccine = true;
          numDoesesNeeded = rsNumDosesNeeded.getInt(2);
          waitPeriodNeeded = rsNumDosesNeeded.getInt(1);
        }

        if (numDoesesNeeded - numDosesTaken == 0 && vnameTaken != ""){
          System.out.println("Does not need any more doses!");
          statement.close () ;
          con.close () ;
          return;
        }


        // Get the last time they took their dose
        java.sql.Date today = new java.sql.Date(new Date().getTime());


        String lastDoseQuery = "SELECT vdate FROM slot WHERE hinsurnum = " + hinsurnumDetails + " ORDER BY vdate ASC";
        java.sql.ResultSet rslastDoseQuery = statement.executeQuery ( lastDoseQuery );

        // If they have never taken a doses, there is no waittime
        java.sql.Date lastvdate = new java.sql.Date(new Date(-999999).getTime());
        while ( rslastDoseQuery.next() ) {
          // want the earliest date before today
          if (rslastDoseQuery.getDate(1).before(today)){
            lastvdate = rslastDoseQuery.getDate(1);
          }
          System.out.println("Today = " + today + "  lastvdate = " + lastvdate);
        }

        String openSlotsQuery = "SELECT * FROM slot WHERE hinsurnum IS NULL ORDER BY vdate";
        java.sql.ResultSet rsOpenSlots = statement.executeQuery ( openSlotsQuery );
        java.sql.Date vdateOpenSlot = today; // Find the next open slot

        String vnameOpenSlot = "";
        while (rsOpenSlots.next()) {
          vdateOpenSlot = rsOpenSlots.getDate(3);
          vnameOpenSlot = rsOpenSlots.getString(8);
          // if the slot is in the future and if the slot fits within the wait period
          if (today.before(vdateOpenSlot) && addDays(lastvdate, waitPeriodNeeded).before(vdateOpenSlot)) {
            // Check if they have the same vaccine
            if (hasTakenVaccine == false) {
              slotNumDetails = rsOpenSlots.getString(1);
              vdateDetails = rsOpenSlots.getString(3);
              lnameDetails = rsOpenSlots.getString(4);
              vtimeDetails = rsOpenSlots.getString(2);
              break;
            }
            // Already vaccine allocated to slot
            else if (vnameOpenSlot.equals(vnameTaken) && hasTakenVaccine == true) {
              slotNumDetails = rsOpenSlots.getString(1);
              vdateDetails = rsOpenSlots.getString(3);
              lnameDetails = rsOpenSlots.getString(4);
              vtimeDetails = rsOpenSlots.getString(2);
              break;
            }
          }
        }

        String updateSQL = "UPDATE slot SET hinsurnum = '"+hinsurnumDetails+"', asgndate = '"+today+"' WHERE slotnum='"+slotNumDetails+"' AND vdate='"+vdateDetails+"' AND lname = '"+lnameDetails+"' AND vtime = '"+vtimeDetails+"'";
        System.out.println(updateSQL);
        statement.executeUpdate(updateSQL);
      }
      catch (SQLException e)
      {
        sqlCode = e.getErrorCode(); // Get SQLCODE
        sqlState = e.getSQLState(); // Get SQLSTATE

        // Your code to handle errors comes here;
        // something more meaningful than a print would be good
        System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
        System.out.println(e);
      }
    }

    public static void vaccineInfo(Connection con, Statement statement, int sqlCode, String sqlState) {

      System.out.println("Please entre the relevant information:\n");
      System.out.println("\tslotnum INTEGER NOT NULL");
      System.out.println("\tvtime TIME NOT NULL");
      System.out.println("\tvdate VARCHAR(50) NOT NULL,");
      System.out.println("\tlname VARCHAR(50),");
      System.out.println("\tcnlnumber VARCHAR(50),");
      System.out.println("\tvialnumber INTEGER,");
      System.out.println("\tbatchnumber INTEGER,");
      System.out.println("\tvname VARCHAR(50),");
      System.out.println("\thinsurnum VARCHAR(50),");
      System.out.println("\tasgndate DATE,");

      Scanner slotNumScanner = new Scanner(System.in);
      String slotNumDetails = slotNumScanner.nextLine();

      Scanner vtimeScanner = new Scanner(System.in);
      String vtimeDetails = vtimeScanner.nextLine();

      Scanner vdateScanner = new Scanner(System.in);
      String vdateDetails = vdateScanner.nextLine();

      Scanner lnameScanner = new Scanner(System.in);
      String lnameDetails = lnameScanner.nextLine();

      Scanner cnlnumberScanner = new Scanner(System.in);
      String cnlnumberDetails = cnlnumberScanner.nextLine();

      Scanner vialnumberScanner = new Scanner(System.in);
      String vialnumberDetails = vialnumberScanner.nextLine();

      Scanner batchnumberScanner = new Scanner(System.in);
      String batchnumberDetails = batchnumberScanner.nextLine();

      Scanner vnameScanner = new Scanner(System.in);
      String vnameDetails = vnameScanner.nextLine();

      Scanner hinsurnumScanner = new Scanner(System.in);
      String hinsurnumDetails = hinsurnumScanner.nextLine();

      Date today = new Date(Calendar.getInstance().getTime().getTime());

      try {

        String vaccineNameForHIN = "SELECT vname, vdate FROM SLOT WHERE hinsurnum = " + hinsurnumDetails;
        java.sql.ResultSet vaccineSlotsRS = statement.executeQuery(vaccineNameForHIN);
        System.out.println(vaccineNameForHIN);


        String vname = "";
        while (vaccineSlotsRS.next()){
          String vnameTemp = vaccineSlotsRS.getString(1);

          if (vnameTemp != null && !vnameTemp.equals("NULL")) {
            vname = vnameTemp;
          }
        }

        // Query nurseassignment for specific date and location
        String checkNurseAssignmentsQuery = "SELECT * FROM nurseassignments WHERE vdate='" + vdateDetails + "' AND lname = '" + lnameDetails + "' AND cnlnumber= '" + cnlnumberDetails + "';";
        java.sql.ResultSet nurseAssignmentsRC = statement.executeQuery(checkNurseAssignmentsQuery);
        System.out.println(checkNurseAssignmentsQuery);

         if(nurseAssignmentsRC.next()) {
            if (vname.equals("")) {
              // Never been vaccinated so can allocated whatever
              String updateSQL = "UPDATE slot SET cnlnumber = " + cnlnumberDetails + ", vialnumber='" + vialnumberDetails  + "', batchnumber= '" + batchnumberDetails   + "', vname='" + vnameDetails  + "' WHERE lname = '"+ lnameDetails + "' AND vdate = '" + vdateDetails + "' AND slotnum = '" + slotNumDetails + "';";
              System.out.println(updateSQL);
              statement.executeUpdate(updateSQL);
              System.out.println("No vaccine - CASE 1");
            } else {
              if (vname.equals(vnameDetails)) {
                  // Check if resident has been vaccinated by that vname before
                  String updateSQL = "UPDATE slot SET cnlnumber = " + cnlnumberDetails + ", vialnumber='" + vialnumberDetails  + "', batchnumber= '" + batchnumberDetails  + "', vname='" + vnameDetails  + "' WHERE lname = '"+ lnameDetails + "' AND vdate = '" + vdateDetails + "' AND slotnum = '" + slotNumDetails+ "';";
                  System.out.println(updateSQL);
                  statement.executeUpdate(updateSQL);
                  System.out.println("Good vaccine - CASE 2");
              } else {
                  System.out.println("ERROR: The Resident has been vaccinated with a different Vaccine");
              }
            }
          } else {
            System.out.println("ERROR: The assigned nurse has not been assigned to the input Location during that Date.");
          }
        }
        catch (SQLException e)
        {
          sqlCode = e.getErrorCode(); // Get SQLCODE
          sqlState = e.getSQLState(); // Get SQLSTATE

          // Your code to handle errors comes here;
          // something more meaningful than a print would be good
          System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
          System.out.println(e);
        }
      }


      public static void exitProgram() {
        System.out.println("Program has been terminated");
        loop = false;
    }

    public static Date addDays(Date date, int days) {
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        c.add(Calendar.DATE, days);
        return new java.sql.Date(c.getTimeInMillis());
    }
}
