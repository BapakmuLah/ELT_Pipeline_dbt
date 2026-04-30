Folder Silver ini berisi tentang data/table yg sudah dibersihkan dan sesuai format nya. ada 2 tahap yg dilakukan didalam silver Folder :
1. Staging Layer -> Membersihkan data dan mengecek kualitas data (dbt tests) , seperti Handling Null Values, Handling Duplicates, Fix column Data Types, fix name of column.
2. Intermediate Layer -> Menggabungkan tabel-tabel staging untuk membentuk dataset yang lebih kaya konteks bisnis.
