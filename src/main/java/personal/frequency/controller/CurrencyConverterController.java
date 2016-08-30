package personal.frequency.controller;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import personal.frequency.model.CurrencyConverter;
import webservicex.currencyconvertor.schemas.v1.Currency;

@Controller
public class CurrencyConverterController {

	@RequestMapping(value = "/currencyConverter", method = RequestMethod.GET)
	public ModelAndView about() {
		ModelAndView model = new ModelAndView("currencyConverter", "CurrencyConverter", new CurrencyConverter());
		model.addObject("currencies", Currency.values());
		return model;
	}
	
	@RequestMapping(value = "/convert", method = RequestMethod.POST)
	public ModelAndView convert(/*@Valid*/ @ModelAttribute CurrencyConverter currencyConverter, BindingResult bindingResult) {
		ModelAndView model = new ModelAndView("currencyConverter");
		model.addObject("fromCurrency", currencyConverter.getFromCurrency());
		model.addObject("toCurrency", currencyConverter.getToCurrency());
		model.addObject("currencies", Currency.values());
		model.addObject("CurrencyConverter", currencyConverter);
		model.addObject("amountToConvert", currencyConverter.getAmountToConvert());
		model.addObject("convertedAmount", 20);
		return model;
	}
	
}
