# Textile Inventory & Sales Analysis — Key Findings
**Project:** MySQL MIS Database Analysis  
**Data Period:** January 2024 – December 2024  
**Database:** textile_mis  
**Tables:** suppliers, products, inventory, sales  

---

## Database Overview

| Table | Records | Description |
|-------|---------|-------------|
| suppliers | 5 | Vendor master data |
| products | 12 | Yarn, fabric, dye, accessories |
| inventory | 12 | Current warehouse stock levels |
| sales | 200+ | Full year transactions |

---

## Finding 1 — Seasonal Revenue Pattern

Eid ul-Fitr season (March–April) was the strongest revenue period of the year.
March alone recorded nearly **3× the revenue of July**, the slowest month.

| Season | Months | Revenue Level | Notes |
|--------|--------|---------------|-------|
| Eid ul-Fitr Peak | March – April | Highest | Biggest festival, new clothing demand |
| Eid ul-Adha Peak | June | High | Second major Eid, fabric surge |
| Normal Season | Jan, Feb, May, Sep, Oct | Moderate | Steady baseline demand |
| Winter Peak | November – December | High | Heavy fabric, year-end bulk orders |
| Summer Slowdown | July – August | Lowest | Monsoon season, factory slowdown |

**Business implication:** Production and inventory should be ramped up in February and October — one month before each peak — to avoid stockouts during high-demand periods.

---

## Finding 2 — Top Revenue Products

Grey Fabric 120 GSM and Cotton Yarn 20/1 were the top two products across all seasons.

| Rank | Product | Category | Revenue Share |
|------|---------|----------|---------------|
| 1 | Grey Fabric 120 GSM | Fabric | ~28% |
| 2 | Cotton Yarn 20/1 | Yarn | ~18% |
| 3 | Twill Fabric 200 GSM | Fabric | ~14% |
| 4 | Polyester Yarn 30/1 | Yarn | ~11% |
| 5 | Viscose Yarn 40/1 | Yarn | ~7% |

Together, Grey Fabric and Cotton Yarn account for over **45% of annual revenue**.

**Business implication:** These two products must never fall below reorder level. A stockout of either would directly impact nearly half of total revenue.

---

## Finding 3 — Top Buyers

Delta Fabrics and Star Fashion Ltd dominated purchases throughout the year.

| Rank | Buyer | Approx. Share | Risk Level |
|------|-------|---------------|------------|
| 1 | Star Fashion Ltd | ~22% | High dependency |
| 2 | Delta Fabrics | ~20% | High dependency |
| 3 | Rahim Garments | ~19% | Moderate |
| 4 | Neon Textiles | ~21% | Moderate |
| 5 | Bengal Weavers | ~18% | Moderate |

**Business implication:** Top two buyers together represent ~42% of revenue. If either reduces orders, it creates a significant revenue gap. The company should actively develop new buyer relationships to reduce this concentration risk.

---

## Finding 4 — Winter vs Eid Comparison

Winter peak (Nov–Dec) showed more sustained revenue than Eid ul-Adha (June alone).

- Eid ul-Adha: 1 month of peak demand
- Winter peak: 2 months of elevated demand with higher average order values
- Heavy fabrics (Twill 200 GSM) saw their strongest sales in November–December

**Business implication:** Winter is actually more valuable than Eid ul-Adha when measured over the full period. Stock planning for heavy fabrics should prioritize October restocking.

---

## Finding 5 — Summer Slowdown Impact

July–August saw transaction volume drop approximately **65%** compared to peak months.

- Average monthly transactions in July–August: ~10 per month
- Average monthly transactions in March–April: ~28 per month
- Revenue in July was the lowest single month of the year

**Business implication:** The slowdown window is the best time to run inventory audits, identify slow-moving stock, perform warehouse reorganization, and negotiate supplier contracts for the upcoming peak seasons.

---

## Finding 6 — Low Stock Alerts (as of latest inventory update)

Four products are currently below their reorder level and require immediate action:

| Product | Current Stock | Reorder Level | Shortage | Urgency |
|---------|--------------|---------------|----------|---------|
| Vat Dye Black | 50 KG | 80 KG | 30 KG | Critical |
| Shuttle (Wooden) | 430 pcs | 500 pcs | 70 pcs | High |
| Reactive Dye Red | 95 KG | 100 KG | 5 KG | Medium |
| Viscose Yarn 40/1 | 290 KG | 300 KG | 10 KG | Medium |

**Business implication:** Vat Dye Black is most critical — it is 37% below reorder level and is used in high-demand fabric production. Order must be placed with Bengal Dye Chemicals immediately.

---

## Finding 7 — Category Revenue Breakdown

| Category | Revenue Share | Trend |
|----------|---------------|-------|
| Fabric | ~42% | Peaks in Eid and Winter |
| Yarn | ~36% | Consistent year-round |
| Dye & Chemical | ~14% | Follows fabric production cycle |
| Accessories | ~8% | Stable, low value |

**Business implication:** Fabric is the highest revenue category but most sensitive to seasonal swings. Yarn provides the most stable year-round income base.

---

## Finding 8 — Data Quality

The exception report (Query 10) checks whether `quantity_sold × unit_price = total_amount` for every transaction. In this dataset all records passed validation — no discrepancies found.

**Business implication:** In a real company this query should run automatically every week. Even a small data entry error in total_amount can cause incorrect revenue reporting to management.

---

## Recommendations Summary

1. **Restock immediately** — Vat Dye Black and Reactive Dye Red before next Eid season
2. **Pre-season buildup** — Increase Grey Fabric and Cotton Yarn stock in February and October
3. **Slowdown strategy** — Use July–August for clearance sales on accessories and warehouse cleanup
4. **Buyer diversification** — Reduce dependency on top 2 buyers by onboarding 2–3 new buyers
5. **Automate alerts** — Schedule the low stock alert query to run every Monday morning
6. **Data discipline** — Run the exception report weekly to catch data entry errors early

---

## SQL Concepts Used in This Project

| Concept | Used In |
|---------|---------|
| GROUP BY + aggregation | Monthly revenue, category breakdown |
| CASE WHEN | Seasonal labeling, stock health status |
| INNER JOIN | Products + sales, products + inventory |
| LEFT JOIN | Slow-moving items, supplier reconciliation |
| Subquery in FROM | Top buyer per month, supplier recon |
| CTE (WITH clause) | Month-over-month growth |
| RANK() OVER() | Product performance scorecard |
| HAVING | Slow-moving items filter |
| DATEDIFF() | Days since last sale |
| COALESCE() | Replace NULL with 0 in reports |
| ABS() | Discrepancy detection |

---

*Report generated from textile_mis MySQL database | github.com/yourusername/textile-mis-sql*
