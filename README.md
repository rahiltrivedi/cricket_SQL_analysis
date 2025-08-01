# cricket_SQL_analysis

---

This project explores IPL cricket data using SQL to uncover performance insights, player stats, and rare feats. It leverages MySQL and structured queries to analyze match-level, ball-by-ball, and player-level data.

---

## 📁 Dataset

- Source: [Kaggle - IPL Dataset](https://www.kaggle.com/datasets/ramjidoolla/ipl-data-set)
- Files Used:
  - `matches.csv`
  - `deliveries.csv` *(trimmed to 34,000 rows for performance)*
  - `players.csv`

---

## 🧱 Schema Overview

Tables used:
- **matches** – Match-level metadata (teams, toss, result, etc.)
- **deliveries** – Ball-by-ball event data (runs, wickets, players)
- **players** – Player list (used for enrichment)

Imported via MySQL Workbench using *Table Data Import Wizard*, allowing automatic table creation from CSV headers.

---

## 📊 Query Categories

Queries are organized into separate files inside the `queries/` directory:

| File                          
|-------------------------------
| `matches_analysis.sql`        
| `deliveries_analysis.sql`     
| `players_analysis.sql`        
| `advanced_achievements.sql`   
| `rare_cricket_feats.sql`      

---

## 🚀 Example Insights

- Number of players scoring centuries per team
- Bowlers with 5-wicket hauls per team
- Players who scored a century and took a wicket in the same season
- Most ducks
- Fastest 50s and best strike rates (min 30 balls)

---

## 🛠️ Tools Used

- MySQL Workbench
- MySQL 8.0+
- Bash (for scripting)
- [Kaggle Dataset](https://www.kaggle.com/datasets/ramjidoolla/ipl-data-set)

---

## 📁 Project Structure

cricket-sql-analysis/
- ├── README.md
- ├── dataset/
- - │ ├── matches.csv
- - │ ├── deliveries.csv
- - │ └── players.csv
- ├── queries/
- - │ └── create_dashboard_and_tables.sql
- - │ ├── matches_analysis.sql
- - │ ├── deliveries_analysis.sql
- - │ ├── players_analysis.sql
- - │ ├── advanced_analysis.sql


---




