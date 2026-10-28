# Portfolio Case Studies — Thiago Andrade

These case studies follow the Google Data Analytics portfolio checklist: **Introduction, Problems, Solutions (with alternatives and trade-offs), Conclusion, and Next Steps**. Descriptions reflect public project files and do not invent measured impact.

## 01 — COVID-19 Exploration | SQL + Tableau

**Introduction.** Explore differences in pandemic cases, deaths and vaccination indicators across places and dates.

**Problems.** How can analysts compare rates while accounting for geography, population, time and the source's data definitions?

**Analysis and solutions.** SQL queries include global totals, aggregations, joins between deaths and vaccinations, CTEs, a rolling vaccination sum and a view for visualization. A [Tableau dashboard](https://public.tableau.com/app/profile/thiago.de.andrade/viz/CovidDashboard2020-2021_17883771424160/Painel1) provides geographic and temporal exploration.

**Alternatives.** A static report is easier to audit but less interactive; an interactive dashboard supports exploration but requires validation of filters, data freshness and rate denominators.

**Conclusion.** The project demonstrates analytics-to-visualization workflow; numerical effects on public policy or health outcomes are not claimed.

**Next steps.** Document source/version, add validation queries and an indicator glossary, then compare cohort/geographic filters.

**Evidence:** [SQL](./COVID%20Data%20Exploration%20Portfolio%20Project.sql) · [Tableau](https://public.tableau.com/app/profile/thiago.de.andrade/viz/CovidDashboard2020-2021_17883771424160/Painel1).

## 02 — Nashville Housing | SQL Data Cleaning

**Introduction.** Prepare a real-estate dataset for more consistent analysis.

**Problems.** Unstandardized dates, partially missing property addresses, combined address fields, inconsistent Y/N labels and possible duplicate records.

**Analysis and solutions.** The published SQL script converts dates, fills missing property addresses using a self-join, splits addresses into components, standardizes Y/N through CASE and identifies duplicates using ROW_NUMBER.

**Alternatives.** Editing original tables is immediate but risks irreversible changes; a staging or derived transformation table improves traceability and reversibility.

**Conclusion.** The source script identifies candidate duplicates but does **not** show deletion of those records. It also includes destructive DROP COLUMN statements; run only on a safe copy.

**Next steps.** Use transaction-safe staging, measure row counts and missingness before/after, add test assertions, document data provenance and produce a QA report.

**Evidence:** [SQL script](./Data%20Cleaning%20Portfolio%20Project%20Queries.sql).

## 03 — Movie Industry | Python Data Exploration

**Introduction.** Investigate the relationships between film budgets, gross revenue and other dataset attributes.

**Problems.** Missing values, heterogeneous data types and risk of confusing statistical associations with causes.

**Analysis and solutions.** The published notebook/script uses pandas and NumPy for data inspection, transformations and correlations; Matplotlib and Seaborn for scatter plots, a fitted visual trend and correlation heatmaps.

**Alternatives.** Pearson highlights linear association, while Spearman can test rank relationships; segmenting by release period or film type can reveal changes in the observed patterns.

**Conclusion.** The project demonstrates an exploratory workflow, not a causal model or proof that budget alone determines financial performance.

**Next steps.** Provide the source dataset and environment instructions, report missingness effects, compare correlation methods and add a concise findings section with actual computed values.

**Evidence:** [Jupyter notebook](./Movie_Correlation_In_Python_Jupyter.ipynb) · [Python script](./movie_correlation_in_python.py).

## New R case study

**[Brazilian E-Commerce — Olist (R, ggplot2, Quarto)](https://github.com/ThiagoSQA/olist-r-analytics/blob/main/CASE_STUDY.md)** addresses monthly GMV, geography, delivery timeliness and customer satisfaction, with explicit metric definitions and caveats.

## About / Contact

**Thiago Sousa Quadros de Andrade** — Computer Science undergraduate at UNIJORGE, Salvador, Brazil; expected 2027.2. Volunteer data-analysis experience with Excel, Power BI, monthly performance indicators and communication to nontechnical stakeholders.

- [GitHub](https://github.com/ThiagoSQA) · [LinkedIn](https://www.linkedin.com/in/thiago-quadros-29a4562ba/) · [Portfolio website](https://thiagosqa.github.io/ThiagoAndrade.github.io/)
- **Google Data Analytics Professional Certificate:** seventh individual course reported completed; the full certificate is not represented as completed. [Course credential](https://coursera.org/share/f0b50e0d909e341d663500c5433461b0).
