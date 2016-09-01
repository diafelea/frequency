package personal.frequency.controller;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Set;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import personal.frequency.model.CurrencyConverter;
import personal.frequency.service.CurrencyConverterService;

@Controller
public class CurrencyConverterController {

	@Autowired
	private CurrencyConverterService currencyConverterService;

	private static final String BASE_CURRENCY = "EUR";

	@RequestMapping(value = "/currencyConverter", method = RequestMethod.GET)
	public ModelAndView about() {
		ModelAndView model = new ModelAndView("currencyConverter", "CurrencyConverter", new CurrencyConverter());
		model.addObject("currencies", getCurrencies());
		return model;
	}

	@RequestMapping(value = "/convert", method = RequestMethod.POST)
	public ModelAndView convert(@Valid @ModelAttribute CurrencyConverter currencyConverter, BindingResult bindingResult) throws Exception {
		ModelAndView model = new ModelAndView("currencyConverter");
		BigDecimal rate = new BigDecimal(currencyConverterService.getConversionRate(currencyConverter.getFromCurrency(), currencyConverter.getToCurrency())).setScale(4, RoundingMode.HALF_UP);

		currencyConverter.setConvertedAmount(currencyConverter.getAmountToConvert().multiply(rate).setScale(4, RoundingMode.HALF_UP));
		currencyConverterService.saveSearchResults(currencyConverter);
		
		model.addObject("currencies", getCurrencies());
		model.addObject("results", currencyConverterService.getConversionResults(1)); // TODO
		model.addObject("CurrencyConverter", currencyConverter);
		return model;
	}

	private Set<String> getCurrencies() {
		return currencyConverterService.getCurrencies(BASE_CURRENCY);
	}

}
