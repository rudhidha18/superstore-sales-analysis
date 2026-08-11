Superstore Sales & Profitability Analysis

Business Question:

Where is the company losing money despite having sales, and what's driving it?

Summary of Findings:

The Tables sub-category is the only product line with an overall loss (–$64,083). 
Digging deeper, the real driver is discount level, company-wide: profit stays healthy through 20% discount, turns negative at 21–30%, and becomes severe at 30%+ discount (–$793,527 across the business). This pattern holds across every sub-category — but Tables is the only one pushed into overall negative profit, because it lacks the profit cushion at low-discount sales that other categories have. A regression model confirmed discount as the strongest negative driver of profit, consistent with the SQL and exploratory analysis.

Recommendation: 

Tighten discount policy above 30% company wide, and review Tables' baseline pricing/margins specifically.

Tools Used:

SQL (SQLite) · Python (pandas, numpy, matplotlib, seaborn, scikit-learn) · Tableau Public · AI-assisted workflow (used for query/code drafting and debugging, verified manually at each step) · Git/GitHub

Process:
1. Explored raw data with SQL - found Tables as the only sub-category with negative total profit
2. Cleaned and analyzed in Python (pandas) — confirmed the SQL finding independently, then broke profit down by sub-category × discount band, revealing the pattern is company-wide, not Tables-specific
3. Visualized key relationships with matplotlib/seaborn (profit by discount band, discount vs profit scatter, sub-category × discount-band heatmap)
4. Built a linear regression model to predict Profit from order features (sales, discount, quantity, category, region), validated with an 80/20 train/test split — R² = 0.39, MAE = $60.36, RMSE = $141.62. Discount emerged as the strongest negative coefficient, confirming the SQL/EDA findings mathematically
5. Built an interactive Tableau dashboard for stakeholder-facing exploration 

Dashboard on Tableau Public:

https://public.tableau.com/views/SuperstoreProfitAnalysis_17864751152920/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link

How AI Was Used (and Verified):

AI tools were used throughout to speed up SQL query drafting, pandas/matplotlib boilerplate, and debugging (e.g., diagnosing an import error where column headers weren't detected during CSV import, and a JSON corruption issue when a notebook wasn't saved before committing). Every AI-suggested query or code block was run and checked against expected results before being trusted for example, SQL and pandas results for "profit by sub-category" were independently cross checked against each other and matched exactly, confirming the analysis wasn't dependent on either tool alone.

Key Files
- sql/exploration.sql : SQL exploration queries (region/sub-category/discount-band profit analysis)
- notebooks/01_cleaning_and_eda.ipynb : data cleaning, exploratory analysis, and visualizations
- notebooks/02_regression_model.ipynb : regression model: train/test split, evaluation, feature importance
- dashboards/ : Tableau workbook file
- images/ : chart and dashboard screenshots