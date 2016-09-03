package personal.frequency.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import personal.frequency.dao.CurrencyConverterDAO;
import personal.frequency.model.CurrencyConverter;
import personal.frequency.service.CurrencyConverterService;
import personal.frequency.utils.DateUtils;
import personal.frequency.utils.JSONUtils;
import personal.frequency.utils.URLUtils;

@Service
public class CurrencyConverterServiceImpl implements CurrencyConverterService {
	private static final String CONVERSION_SERVICE_URL = "http://api.fixer.io/latest?base=";
	private static final String ADD_DATE_PARAM = "&date=";

	@Autowired
	private CurrencyConverterDAO currencyConverterDAO;

	@Override
	public double getConversionRate(String fromCurrency, String toCurrency, String date) {
		Map<String, Double> rates = getRates(fromCurrency, date);
		double rate = 1;
		if (rates.containsKey(toCurrency)) {
			rate = rates.get(toCurrency);
		}
		return rate;
	}

	@SuppressWarnings("unchecked")
	private Map<String, Double> getRates(String fromCurrency, String date) {
		String formattedDate = formatDateForWsCall(date);
		String url = CONVERSION_SERVICE_URL + fromCurrency + ADD_DATE_PARAM + formattedDate;
		String result = URLUtils.httpGet(url);
		Map<String, Double> rates = (HashMap<String, Double>)JSONUtils.mapJSON(result.substring(result.lastIndexOf("{")));
		return rates;
	}

	private String formatDateForWsCall(String date) {
		if (!StringUtils.hasText(date)) {
			return DateUtils.getDateNowFormatted(DateUtils.DATE_FORMAT_SIMPLE);
		}
		Date thedate = new Date();
		try {
			thedate = new SimpleDateFormat(DateUtils.DATE_FORMAT_LONG).parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		String formattedDate = DateUtils.getDateFormatted(thedate, DateUtils.DATE_FORMAT_SIMPLE);
		return formattedDate;
	}

	@SuppressWarnings("unchecked")
	private Map<String, Double> getRates(String fromCurrency) {
		String url = CONVERSION_SERVICE_URL + fromCurrency;
		String result = URLUtils.httpGet(url);
		return (HashMap<String, Double>)JSONUtils.mapJSON(result.substring(result.lastIndexOf("{")));
	}

	public Set<String> getCurrencies(String fromCurrency) {
		Map<String, Double> rates = getRates(fromCurrency);
		return rates.keySet();
	}

	public void saveSearchResults(CurrencyConverter currencyConverter) {
		currencyConverter.setUsername(currencyConverter.getUsername());
		currencyConverter.setSearchDate(Calendar.getInstance().getTime());
		if (!StringUtils.hasText(currencyConverter.getDate())) {
			currencyConverter.setDate(new SimpleDateFormat(DateUtils.DATE_FORMAT_LONG).format(Calendar.getInstance().getTime()));
		}
		currencyConverterDAO.save(currencyConverter);
	}

	public List<CurrencyConverter> getConversionResults(String username) {
		return currencyConverterDAO.getConversionResultsByUser(username);
	}

}
