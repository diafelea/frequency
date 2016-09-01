package personal.frequency.model;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "currencyConverter", catalog = "frequency")
public class CurrencyConverter {

	private Integer id;
	private String fromCurrency;
	private String toCurrency;
	@NotNull(message = "Add the amount to convert")
	private BigDecimal amountToConvert;
	private BigDecimal convertedAmount;
	private Date date;
	private Integer userId;
	private Map<String, Double> rates;

	public CurrencyConverter() {
		if (date == null) {
			date = new Date();
		}
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID", unique = true, nullable = false)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "FROM_CURRENCY")
	public String getFromCurrency() {
		return fromCurrency;
	}

	public void setFromCurrency(String fromCurrency) {
		this.fromCurrency = fromCurrency;
	}

	@Column(name = "TO_CURRENCY")
	public String getToCurrency() {
		return toCurrency;
	}

	public void setToCurrency(String toCurrency) {
		this.toCurrency = toCurrency;
	}

	@Column(name = "AMOUNT_TO_CONVERT")
	public BigDecimal getAmountToConvert() {
		return amountToConvert;
	}

	public void setAmountToConvert(BigDecimal amountToConvert) {
		this.amountToConvert = amountToConvert;
	}

	@Column(name = "CONVERTED_AMOUNT")
	public BigDecimal getConvertedAmount() {
		return convertedAmount;
	}

	public void setConvertedAmount(BigDecimal convertedAmount) {
		this.convertedAmount = convertedAmount;
	}

	@Column(name = "DATE")
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Column(name = "USER_ID")
	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	@Transient
	public Map<String, Double> getRates() {
		return rates;
	}

	public void setRates(Map<String, Double> rates) {
		this.rates = rates;
	}

	@Override
	public String toString() {
		return "CurrencyConverter [id=" + id + ", fromCurrency=" + fromCurrency + ", toCurrency=" + toCurrency + ", amountToConvert=" + amountToConvert + ", convertedAmount=" + convertedAmount + ", date=" + date + ", rates=" + rates + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((date == null) ? 0 : date.hashCode());
		result = prime * result + ((fromCurrency == null) ? 0 : fromCurrency.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((toCurrency == null) ? 0 : toCurrency.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CurrencyConverter other = (CurrencyConverter)obj;
		if (date == null) {
			if (other.date != null)
				return false;
		} else if (!date.equals(other.date))
			return false;
		if (fromCurrency == null) {
			if (other.fromCurrency != null)
				return false;
		} else if (!fromCurrency.equals(other.fromCurrency))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (toCurrency == null) {
			if (other.toCurrency != null)
				return false;
		} else if (!toCurrency.equals(other.toCurrency))
			return false;
		return true;
	}

}
