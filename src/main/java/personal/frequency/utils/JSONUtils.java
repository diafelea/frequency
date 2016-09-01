package personal.frequency.utils;

import java.io.IOException;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;


public class JSONUtils {

	public static Object mapJSON(String jsonString) {
		ObjectMapper mapper = new ObjectMapper();
		Object Object = null;
		try {
			Object = mapper.readValue(jsonString, Object.class);
		} catch (JsonParseException e) {
			System.out.println("JsonParseException " + e);
		} catch (JsonMappingException e) {
			System.out.println("JsonMappingException " + e);
		} catch (IOException e) {
			System.out.println("IOException " + e);
		}
		return Object;
	}
	
}
