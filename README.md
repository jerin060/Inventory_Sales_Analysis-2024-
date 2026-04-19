# Inventory_Sales_Analysis-2024-
# Textile Inventory & Sales Analysis — MySQL

## Overview
A complete MIS database project simulating the operations of a 
Bangladeshi textile weaving company. Covers 12 months of sales 
data with seasonal festival patterns (Eid ul-Fitr, Eid ul-Adha, 
Winter peak) and 10 SQL analyses for management reporting.

## Database Structure
| Table | Records | Description |
|-------|---------|-------------|
| suppliers | 5 | Vendor master data |
| products | 12 | Yarn, fabric, dye, accessories |
| inventory | 12 | Current warehouse stock |
| sales | 200+ | Full year transactions |

## Key Analyses Performed
- Monthly revenue trend with seasonal patterns
- Festival vs normal season comparison
- Low stock alerts with shortage quantity
- Top products and buyer rankings
- Month-over-month growth rate (CTE + self JOIN)
- Slow-moving inventory detection
- Supplier reconciliation report
- Product performance scorecard (RANK window function)
- Data exception and anomaly detection

## Tools Used
- MySQL 8.0 + MySQL Workbench
- Microsoft Excel (for output formatting)
- Power BI (dashboard)

## Key Findings
- March (Eid ul-Fitr) was the highest revenue month — 3x July
- Grey Fabric + Cotton Yarn = 45%+ of annual revenue
- 4 products currently below reorder level

## How to Run
1. Open MySQL Workbench
2. Run `schema/01_create_tables.sql`
3. Run `data/02_insert_data.sql`
4. Run any query from the `queries/` folder
