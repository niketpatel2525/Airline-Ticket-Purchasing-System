package controller;

import java.util.ArrayList;
import java.util.List;

import model.MySqlDataStoreUtilities;

import java.util.HashMap;
import java.io.*;
import java.util.*;

import pojo.Route;


public class DealMatches implements java.io.Serializable {

	HashMap<String, Route> selectedRoutes;

	HashMap<String, Route> routesMap;

	ArrayList<Object> routes;

	ArrayList<String> tweets = new ArrayList<String>();

	public ArrayList<String> getTweets()
	{
		return tweets;
	}

	public HashMap<String, Route> getSelectedRoutesFromTweets()
	{
		try{

		}
		catch(Exception e)
		{
			e.printStackTrace();
		}


		selectedRoutes = new HashMap<String, Route>();
		MySqlDataStoreUtilities msdsu = new  MySqlDataStoreUtilities();
		routes = msdsu.getRoutesFromMySQL();


		routesMap = (HashMap<String, Route>)routes.get(0);
		System.out.println("Routes:"+routesMap);

		tweets = new ArrayList<String>();

		String line=null;

		try
		{
			for(Map.Entry<String, Route> entry: routesMap.entrySet())
			{
				if(selectedRoutes.size()<2 && !selectedRoutes.containsKey(entry.getKey()))
				{
					BufferedReader reader = new BufferedReader(new FileReader(new File("C:\\Tomcat\\webapps\\Flyers\\DealMatches.txt")));

					line = reader.readLine();
					String line2 ;
					if(line==null)
					{

					}

					else
					{
						do{
							line2 = line.toUpperCase();
							if (line2.contains(entry.getKey()) || (line2.contains(entry.getValue().getAirport()) 	&& line2.contains(entry.getValue().getDestination())))
							{
								tweets.add(line);
								selectedRoutes.put(entry.getKey(), entry.getValue());
								System.out.println("Key: " + entry.getKey());
								System.out.println("Tweet: " + line2);
								System.out.println("Route: " + entry.getKey());
								break;
							}

						}while ((line=reader.readLine()) != null);
					}

				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		System.out.println(selectedRoutes);
		return selectedRoutes;

	}

	public static void main(String args[]){

		DealMatches dm = new DealMatches();

		dm.getSelectedRoutesFromTweets();


	}

}
