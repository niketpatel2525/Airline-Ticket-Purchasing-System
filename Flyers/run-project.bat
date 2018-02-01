cd C:\Tomcat\webapps\Flyers\WEB-INF\classes

javac -classpath ".;C:\Tomcat\lib\servlet-api.jar;C:\Tomcat\lib\jsp-api.jar;C:\Tomcat\lib\catalina.jar;C:\Tomcat\webapps\Flyers\jar\gson-2.3.1.jar;C:\Tomcat\webapps\Flyers\jar\mongo-java-driver-3.2.2.jar;C:\Tomcat\webapps\Flyers\jar\mysql-connector-java-5.1.44-bin.jar;C:\Tomcat\webapps\Flyers\jar\itextpdf-5.4.0.jar;C:\Tomcat\webapps\Flyers\jar\java-mail-1.4.4.jar;" controller/AjaxUtility.java  controller/CheckPromo.java controller/DownloadDailySalesPDF.java  controller/DownloadPDF.java controller/DownloadSalesPDF.java controller/FlightSearch.java controller/FlightServlet.java controller/Registration.java model/Error.java model/MongoDBDataStoreUtilities.java model/MySqlDataStoreUtilities.java  pojo/Aircraft.java pojo/Airline.java pojo/DailySale.java pojo/Flight.java pojo/FlightList.java pojo/FlightSchedule.java pojo/Offer.java pojo/Passanger.java pojo/Review.java pojo/Route.java pojo/Sales.java pojo/Transaction.java pojo/User.java controller/DealMatches.java controller/Help.java

cd C:\Tomcat\bin
catalina.bat run
