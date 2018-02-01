package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;

import com.mongodb.AggregationOutput;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;

import pojo.Review;

public class MongoDBDataStoreUtilities {
	MongoClient mongo;
	String URL = "localhost";
	int port = 27017;
	DBCollection flyersReviews;
	DB db;

	public MongoDBDataStoreUtilities() {
		try {
			mongo = new MongoClient(URL, port);
			db = mongo.getDB("flyers");
			flyersReviews = db.getCollection("flyersReviews");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public HashMap<Integer, LinkedHashMap<String, Integer>> findTopCountry() {
		HashMap<Integer, LinkedHashMap<String, Integer>> finalresult = new HashMap<Integer, LinkedHashMap<String, Integer>>();
		LinkedHashMap<String, Integer> result = new LinkedHashMap<String, Integer>();
		try {
			if (mongo == null) {
				finalresult.put(Error.MONGO_NOT_RUNNING, null);
				return finalresult;
			}
			DBObject groupfield = new BasicDBObject("_id", 0);
			groupfield.put("_id", "$country");
			groupfield.put("count", new BasicDBObject("$sum", 1));
			DBObject group = new BasicDBObject("$group", groupfield);

			DBObject sort = new BasicDBObject();
			sort.put("count", -1);
			sort.put("_id", 1);
			DBObject orderby = new BasicDBObject("$sort", sort);

			DBObject limit = new BasicDBObject("$limit", 5);

			AggregationOutput output = flyersReviews.aggregate(group, orderby, limit);

			for (final DBObject rs : output.results()) {
				result.put(rs.get("_id").toString(), Integer.parseInt((rs.get("count").toString())));
			}
			System.out.println(result);
			if (result.size() > 0) {
				finalresult.put(Error.SUCCESS, result);
			} else {
				finalresult.put(Error.NO_DATA, result);
			}
		} catch (Exception e) {
			finalresult.put(Error.NO_DATA, null);
		}
		return finalresult;

	}

	public HashMap<Integer, LinkedHashMap<String, Float>> findLowestAirline() {
		HashMap<Integer, LinkedHashMap<String, Float>> finalresult = new HashMap<Integer, LinkedHashMap<String, Float>>();
		LinkedHashMap<String, Float> result = new LinkedHashMap<String, Float>();
		try {
			if (mongo == null) {
				finalresult.put(Error.MONGO_NOT_RUNNING, null);
				return finalresult;
			}
			DBObject groupfield = new BasicDBObject("_id", 0);
			groupfield.put("_id", "$airline");
			groupfield.put("average", new BasicDBObject("$avg", "$rating"));
			DBObject group = new BasicDBObject("$group", groupfield);

			DBObject sort = new BasicDBObject();
			sort.put("average", 1);
			DBObject orderby = new BasicDBObject("$sort", sort);

			DBObject limit = new BasicDBObject("$limit", 5);

			AggregationOutput output = flyersReviews.aggregate(group, orderby, limit);

			for (final DBObject rs : output.results()) {
				result.put(rs.get("_id").toString(), Float.parseFloat(rs.get("average").toString()));
			}
			System.out.println(result);
			if (result.size() > 0) {
				finalresult.put(Error.SUCCESS, result);
			} else {
				finalresult.put(Error.NO_DATA, result);
			}
		} catch (Exception e) {
			finalresult.put(Error.NO_DATA, null);
		}
		return finalresult;

	}

	public HashMap<Integer, LinkedHashMap<String, Float>> findTopAirline() {
		HashMap<Integer, LinkedHashMap<String, Float>> finalresult = new HashMap<Integer, LinkedHashMap<String, Float>>();
		LinkedHashMap<String, Float> result = new LinkedHashMap<String, Float>();
		try {
			if (mongo == null) {
				finalresult.put(Error.MONGO_NOT_RUNNING, null);
				return finalresult;
			}
			DBObject groupfield = new BasicDBObject("_id", 0);
			groupfield.put("_id", "$airline");
			groupfield.put("average", new BasicDBObject("$avg", "$rating"));
			DBObject group = new BasicDBObject("$group", groupfield);

			DBObject sort = new BasicDBObject();
			sort.put("average", -1);
			DBObject orderby = new BasicDBObject("$sort", sort);

			DBObject limit = new BasicDBObject("$limit", 5);

			AggregationOutput output = flyersReviews.aggregate(group, orderby, limit);

			for (final DBObject rs : output.results()) {
				result.put(rs.get("_id").toString(), Float.parseFloat(rs.get("average").toString()));
			}
			System.out.println(result);
			if (result.size() > 0) {
				finalresult.put(Error.SUCCESS, result);
			} else {
				finalresult.put(Error.NO_DATA, result);
			}
		} catch (Exception e) {
			finalresult.put(Error.NO_DATA, null);
		}
		return finalresult;

	}

	public HashMap<Integer, ArrayList<Review>> readReview(String airlinename) {
		HashMap<Integer, ArrayList<Review>> result = new HashMap<Integer, ArrayList<Review>>();
		ArrayList<Review> review = new ArrayList<Review>();
		if (mongo == null) {
			result.put(Error.MONGO_NOT_RUNNING, null);
			return result;
		}
		BasicDBObject obj = new BasicDBObject();
		obj.put("airline", airlinename);
		DBCursor cursor = flyersReviews.find(obj);
		Review r = null;
		while (cursor.hasNext()) {
			BasicDBObject data = (BasicDBObject) cursor.next();
			String airline = data.getString("airline");
			String name = data.getString("name");
			String fdate = data.getString("fdate");
			String route = data.getString("route");
			String country = data.getString("country");
			String rev = data.getString("review");
			int rating = Integer.parseInt(data.getString("rating"));
			long date = data.getLong("date");
			r = new Review(airline, name, fdate, route, country, rev, rating, date);
			review.add(r);

		}
		if (review.size() > 0) {
			result.put(Error.SUCCESS, review);
		} else {
			result.put(Error.NO_DATA, review);
		}

		return result;
	}

	public int storeReview(Review r) {
		BasicDBObject doc = new BasicDBObject();
		doc.append("airline", r.getAirline()).append("name", r.getName()).append("fdate", r.getFdate())
				.append("route", r.getRoute()).append("country", r.getCountry()).append("review", r.getReview())
				.append("rating", r.getRating()).append("date", r.getDate());

		if (mongo == null) {
			return Error.MONGO_NOT_RUNNING;
		}
		flyersReviews.insert(doc);
		return Error.SUCCESS;
	}
}
