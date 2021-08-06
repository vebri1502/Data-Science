library(plumber)
library(C50)

model <- readRDS('API/Posapp_model.rds')

#* Plot a histogram of the gross horsepower
#* @png
#* @get /plothp

function(){
  hist(rnorm(10))
}

#* Menampilkan hasil prediksi
#* @param capital_price Harga Market
#* @param actual_cap Kapitalisasi sebenarnya
#* @param total_transactions Total Transaksi
#* @post /hitung
#* 

function(capital_price, actual_cap, total_transactions){
  newdata <- data.frame(capital_price = as.numeric(capital_price), actual_cap = as.numeric(actual_cap), total_transactions = as.numeric(total_transactions))
  predict(model, newdata, type = "prob")
} 
