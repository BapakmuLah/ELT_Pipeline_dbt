
Medallion Architecture terdiri dari 3 Layer penting:
1. **Bronze Layer** -> Berisi data-data mentah yg diambil dari berbagai sumber dan disimpan ke dalam Data Lakehouse (Delta Lake)
2. **Silver Layer** -> Berisi data-data yg sudah dibersihkan dan sudah di transformasikan dan siap untuk dianalisis lanjutan
3. **Gold Layer** -> Berisi data-data yg sudah diolah lebih lanjut (aggregated, curated, dan business-ready, Machine Learning Prediction), biasanya sudah disesuaikan dengan kebutuhan bisnis (reporting, dashboard, analytics), serta siap langsung digunakan oleh end-user (BI tools, data analyst, data scientist) tanpa perlu transformasi tambahan lagi
