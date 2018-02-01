package model;

public class Error {
	public static final int SUCCESS = 100;
	public static final int NO_DATA = 404;
	public static final int SQL_NOT_RUNNING = 101;
	public static final int FAIL = 401;
	public static final int MONGO_NOT_RUNNING = 102;
	public static final int ILLEGAL_ACCESS = 501;

	public static String getErrorCode(int r) {
		switch (r) {
		case 100:
			return "SUCCESS";
		case 404:
			return "No Data Available";
		case 101:
			return "SQL Server not Running";
		case 401:
			return "Operation Failed";
		case 102:
			return "MongoDB server not Running";
		case 501:
			return "Illegal Access. Login First to access information";
		default:
			return "NO ERROR";
		}
	}

}
