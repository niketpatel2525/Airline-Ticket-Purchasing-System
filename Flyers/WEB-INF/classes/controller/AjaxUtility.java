package controller;

import java.util.HashMap;
import java.util.Map;

import model.MySqlDataStoreUtilities;

public class AjaxUtility {
	public StringBuffer readdata(String searchId) {
		StringBuffer sb = new StringBuffer();
		MySqlDataStoreUtilities msdsu = new MySqlDataStoreUtilities();

		HashMap<String, String> products = msdsu.getAjaxData(searchId);

		for (Map.Entry<String, String> product : products.entrySet()) {
			String name = product.getKey();
			String link = product.getValue();
			sb.append("<result>");
			sb.append("<name>" + name + "</name>");
			sb.append("<link>" + link + "</link>");
			sb.append("</result>");
		}
		//System.out.println(sb.toString());
		return sb;
	}
}
