package personal.frequency.service;

import java.util.List;
import java.util.Set;

import personal.frequency.model.CurrencyConverter;

public interface CurrencyConverterService {

	public double getConversionRate(String fromCurrency, String toCurrency, String date);
	
	public Set<String> getCurrencies(String fromCurrency);
	
	public void saveSearchResults(CurrencyConverter currencyConverter);

	public List<CurrencyConverter> getConversionResults(String username);
}
