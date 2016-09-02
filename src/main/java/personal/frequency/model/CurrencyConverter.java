package personal.frequency.model;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.springframework.util.StringUtils;

import personal.frequency.utils.DateUtils;

@Entity
@Table(name = "currencyConverter", catalog = "frequency")
public class CurrencyConverter {

	private Integer id;
	private String fromCurrency;
	private String toCurrency;
	@NotNull(message = "Add the amount to convert")
	@Min(value=1, message="Amount must be positive")
	private BigDecimal amountToConvert;
	private BigDecimal convertedAmount;
	private String date;
	private Date searchDate;
	private String username;
	private Map<String, Double> rates;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "fromcurrency")
	public String getFromCurrency() {
		return fromCurrency;
	}

	public void setFromCurrency(String fromCurrency) {
		this.fromCurrency = fromCurrency;
	}

	@Column(name = "tocurrency")
	public String getToCurrency() {
		return toCurrency;
	}

	public void setToCurrency(String toCurrency) {
		this.toCurrency = toCurrency;
	}

	@Column(name = "amountoconvert")
	public BigDecimal getAmountToConvert() {
		return amountToConvert;
	}

	public void setAmountToConvert(BigDecimal amountToConvert) {
		this.amountToConvert = amountToConvert;
	}

	@Column(name = "convertedamount")
	public BigDecimal getConvertedAmount() {
		return convertedAmount;
	}

	public void setConvertedAmount(BigDecimal convertedAmount) {
		this.convertedAmount = convertedAmount;
	}

	@Column(name = "date")
	public String getDate() {
		if (!StringUtils.hasText(date)) {
			date = new SimpleDateFormat(DateUtils.DATE_FORMAT_LONG).format(Calendar.getInstance().getTime());
		}
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Column(name = "searchdate")
	public Date getSearchDate() {
		return searchDate;
	}

	public void setSearchDate(Date searchDate) {
		this.searchDate = searchDate;
	}

	@Column(name = "username")
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
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
		return "CurrencyConverter [id=" + id + ", fromCurrency=" + fromCurrency + ", toCurrency=" + toCurrency + ", amountToConvert=" + amountToConvert + ", convertedAmount=" + convertedAmount + ", date=" + date + ", username=" + username + ", rates=" + rates + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((convertedAmount == null) ? 0 : convertedAmount.hashCode());
		result = prime * result + ((fromCurrency == null) ? 0 : fromCurrency.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((toCurrency == null) ? 0 : toCurrency.hashCode());
		result = prime * result + ((username == null) ? 0 : username.hashCode());
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
		if (convertedAmount == null) {
			if (other.convertedAmount != null)
				return false;
		} else if (!convertedAmount.equals(other.convertedAmount))
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
		if (username == null) {
			if (other.username != null)
				return false;
		} else if (!username.equals(other.username))
			return false;
		return true;
	}

}
