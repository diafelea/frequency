package personal.frequency.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import personal.frequency.dao.CurrencyConverterDAO;
import personal.frequency.model.CurrencyConverter;
import personal.frequency.service.CurrencyConverterService;
import personal.frequency.utils.JSONUtils;
import personal.frequency.utils.URLUtils;

@Service
public class CurrencyConverterServiceImpl implements CurrencyConverterService {
	private static final String CONVERSION_SERVICE_URL = "http://api.fixer.io/latest?base=";

	@Autowired
	private CurrencyConverterDAO currencyConverterDAO;
	
	@Override
	public double getConversionRate(String fromCurrency, String toCurrency) {
		Map<String, Double> rates = getRates(fromCurrency);
		double rate = rates.get(toCurrency);
		return rate;
	}

	private Map<String, Double> getRates(String fromCurrency) {
		String url = CONVERSION_SERVICE_URL + fromCurrency;
		String result = URLUtils.httpGet(url);
		Map<String, Double> rates = (HashMap<String, Double>)JSONUtils.mapJSON(result.substring(result.lastIndexOf("{")));
		return rates;
	}

	public Set<String> getCurrencies(String fromCurrency) {
		Map<String, Double> rates = getRates(fromCurrency);
		return rates.keySet();
	}
	
	public void saveSearchResults(CurrencyConverter currencyConverter) {
		currencyConverter.setUsername(currencyConverter.getUsername());
		currencyConverterDAO.save(currencyConverter);
	}

	public List<CurrencyConverter> getConversionResults(String username) {
		return currencyConverterDAO.getConversionResultsByUser(username);
	}
}
