package personal.frequency.dao;

import java.util.List;

import personal.frequency.model.CurrencyConverter;

public interface CurrencyConverterDAO {

	public void save(CurrencyConverter currencyConverter);
	
	public List<CurrencyConverter> getConversionResultsByUser(Integer userId);
}
