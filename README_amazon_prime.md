# Amazon Prime Content Analysis & Dashboard

An end-to-end data analytics project exploring Amazon Prime's content library to uncover trends in ratings, genres, popularity, and content strategy — using SQL, Python, and Power BI.

---

## 📌 Project Overview

Amazon Prime hosts thousands of movies and TV shows. This project answers key business questions a content strategy team would care about — which genres perform best, how content volume has grown over time, and what drives higher IMDb ratings.

| Detail | Info |
|---|---|
| **Domain** | Media & Entertainment |
| **Tools** | SQL · Python · Power BI |
| **Dataset** | Amazon Prime titles + credits (IMDb scores, TMDB popularity, genres, cast) |
| **Type** | Exploratory Data Analysis + Interactive Dashboard |

---

## 🎯 Business Questions Answered

- Do Movies or TV Shows perform better on average?
- Which genres consistently earn the highest IMDb scores?
- How has content volume grown year over year?
- Does runtime affect audience ratings?
- Which titles and genres drive the most platform popularity?

---

## 🗂 Repository Structure

```
amazon-prime-analysis/
│
├── amazon_prime_eda.ipynb          # Python EDA — cleaning, analysis, visualizations
├── amazon_prime_sql.sql            # SQL queries for business-level analysis
├── Amazon prime dashboard.pbix     # Power BI interactive dashboard
├── Amazon Prime Dashboard Image.png # Dashboard preview
├── titles.csv                      # Main dataset — titles, ratings, genres
├── credits.csv                     # Cast and crew data
└── README.md
```

---

## 🛠 Tools & Technologies

| Tool | Purpose |
|---|---|
| **SQL** | Data querying, aggregation, filtering, joins |
| **Python (Pandas, Matplotlib, Seaborn)** | Data cleaning, EDA, visual analysis |
| **Power BI (DAX, Power Query)** | Interactive dashboard with slicers and KPIs |

---

## 📊 Analysis Performed

### 🐍 Python EDA
- Null value treatment and data type corrections
- Distribution of IMDb scores across content types
- Genre-level average ratings using groupby aggregations
- Content volume trend by release year
- Correlation between runtime and IMDb score
- TMDB popularity analysis for top-performing titles

### 🗄 SQL Analysis
- Movies vs TV Shows — count, average IMDb score, average votes
- Top 10 genres by average rating (filtered to genres with ≥20 titles)
- Content release trend by decade
- Age certification breakdown
- Top 20 titles by TMDB popularity score

### 📈 Power BI Dashboard
- KPI cards: Total Titles, Avg IMDb Score, Avg Popularity
- Content type split (Movies vs TV Shows) — donut chart
- Genre performance — horizontal bar chart
- Content growth over time — area chart
- Top titles by popularity — table with conditional formatting
- Slicers: Content Type, Genre, Age Certification, Release Year

---

## 📸 Dashboard Preview

![Amazon Prime Dashboard](Amazon%20Prime%20Dashboard%20Image.png)

---

## 💡 Key Insights

- **TV Shows outperform Movies** in average TMDB popularity, suggesting binge-worthy series drive more engagement
- **Drama and Documentary** genres consistently score highest on IMDb
- **Content growth surged post-2015**, with recent titles making up the majority of the library
- **Longer runtime movies (>100 min)** tend to have marginally higher ratings — suggesting audience patience for quality films
- **Top 10 titles by popularity** are dominated by recent releases, indicating recency bias in discovery

---

## ⚙️ How to Run

**Python Notebook**
```bash
pip install pandas numpy matplotlib seaborn
jupyter notebook amazon_prime_eda.ipynb
```

**SQL**
Load `titles.csv` and `credits.csv` into any SQL environment (MySQL / PostgreSQL / SQLite) and run `amazon_prime_sql.sql`.

**Power BI**
Open `Amazon prime dashboard.pbix` in Power BI Desktop. Refresh data source paths if prompted.

---

## 📬 Connect

- 🔗 [LinkedIn](https://www.linkedin.com/in/divyanka-choudhary-64b217259)
- 📁 [My GitHub Portfolio](https://github.com/Divyankachoudhary)

---

*If you found this project useful, consider giving it a ⭐*
