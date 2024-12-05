# Superstore-Sales-Analysis

### Step1: ASK 
## KPIs to include:
•	Total Revenue
•	Daily, Weekly, and Monthly Sales Trends
•	Sales by Product Category
•	Sales by Location (City, Region, or Store)
•	Total Units Sold

## Step2: Prepare data 
I got superstore sales dataset from kaggle (https://www.kaggle.com/datasets/rohitsahoo/sales-forecasting)
This Dataset include 9800 rows and 18 columns
1. Understand the Dataset
The dataset appears to track sales, including customer, product, and shipping details. Key columns include:
Order Details: Order_ID, Order_Date, Ship_Date, Ship_Mode
Customer Details: Customer_ID, Customer_Name, Segment
Geographical Information: Country, City, State, Region, Postal Code
Product Details: Product_ID, Category, Sub-Category, Product_Name
Sales Metrics: Sales
--I uploaded this dataset in google BiqQuery.

# validate column contents
Total Rows: 9800
This indicates that this dataset contains 9800 rows in total.
Unique Orders: 4922
Unique Customers: 793

# check for Null Values
there is no null values

### Identify Inconsistencies
*1.Category of product:*   *Total Product:1849*
*Office Supplies
*Furniture
*Technology
*2.Sub-Category*
17 items:
Art,Paper,Binders,Chairs,Phones,Envelopes,Furnishings,Tables,Fasteners,Machines,Accessories,Storage and Supplies
*3.region*
*Central	
*East
*West
*South
*4.country* : United States
*5.How many cities we deliver products*: 529 cities
*6.segment of customer*   *Total of Customers:793*
*Consumer
*Corporate
*Home Office
*-- there is no duplicate in rows*
## Step3: Process(clean data)
Add 2 column:Month,year 
## step4 : Analyze

*1.Total revenue
2261536.7826999$
*2.Total Sales by Year(2015,2016,2017,2018)
2018: 722052.01919999823$
2017 : 600192.550000002$
2015: 479856.20810000092$
2016: 459436.0054000$
*3. Total Sales by month in each year to find out top months base on sales:
2015:                       
| month | total_sales |            
|-------|-------------|
| 9     | 81623.5268  |
| 11    | 77907.6607  |
| 12    | 68167.0585  |
| 3     | 55205.797   |
| 6     | 34322.9356  |
| 7     | 33781.543   |
| 10    | 31453.393   |
| 4     | 27906.855   |
| 8     | 27117.5365  |
| 5     | 23644.303   |
| 1     | 14205.707   |
| 2     | 4519.892    |

2016:
| month | total_sales |
|-------|-------------|
| 11    | 75249.4     |
| 12    | 74543.6     |
| 9     | 63133.61    |
| 8     | 36818.34    |
| 4     | 34154.47    |
| 3     | 32339.32    |
| 10    | 31011.74    |
| 5     | 29959.53    |
| 7     | 28608.26    |
| 6     | 23599.37    |
| 1     | 18066.96    |
| 2     | 11951.41    |

2017:
| month | total_sales        |  
|-------|--------------------|
| 12    | 95739.121000000043 |  
| 11    | 79066.495800000048 |  
| 9     | 69193.390899999926 |  
| 10    | 59583.032999999996 |  
| 5     | 56656.91           |  
| 3     | 51165.06           |  
| 6     | 39724.49           | 
| 4     | 38679.77           | 
| 7     | 38320.782999999996 | 
| 8     | 30542.200299999997 | 
| 2     | 22978.815000000002 |  
| 1     | 18542.490999999995 |  

2018:
| month | total_sales        |   |
|-------|--------------------|---|
| 11    | 117938.15499999998 |   |
| 9     | 86152.89           |   |
| 12    | 83030.388799999942 |   |
| 10    | 77448.131199999931 |   |
| 8     | 62837.847999999976 |   |
| 3     | 58863.412800000013 |   |
| 6     | 48190.727699999974 |   |
| 7     | 44825.10399999997  |   |
| 5     | 43825.98           |   |
| 1     | 43476.473999999987 |   |
| 4     | 35541.910099999986 |   |
| 2     | 19920.997400000011 |   |

I did visualize Total sales by month in each year : 


![Total sales by month (2015-2018)](https://github.com/user-attachments/assets/1c6d6de6-9e9a-40a8-8efd-5d8a68d7f1ea)

*4. Total Sales by day of each day and i upload the table of special day's calender in tableau:
This Table show the special days ,i made other years in different sheet of excel and uploaded into tableau to recognize in these days we had better sales or not.

| Date       | special's day             |
|------------|---------------------------|       
| 1/1/2018   | New Year's Day            |
| 1/15/2018  | martin Luther king Jr.day |
| 2/14/2018  | Valentine's day           |
| 2/19/2018  | President's day           |
| 4/1/2018   | Easter Sunday             |
| 4/2/2018   | Easter Monday             |
| 4/17/2018  | Tax Day                   |
| 5/13/2018  | Mother's day              |
| 5/28/2018  | Memorial day              |
| 6/14/2018  | Flag day                  |
| 6/17/2018  | Father's day              |
| 7/4/2018   | Independence day          |
| 9/3/2018   | Labour Day                |
| 10/8/2018  | Columbus day              |
| 10/31/2018 | Halloween                 |
| 11/6/2018  | Election day              |
| 11/12/2018 | veterans Day's day off    |
| 11/22/2018 | Thanksgiving day          |
| 11/23/2018 | Black Friday              |
| 12/24/2018 | Christmas Eve             |
| 12/25/2018 | Christmas Day             |
| 12/26/2018 | Boxing Day                |
| 12/31/2018 | New Year's Eve            |

![daily sales in 2015,2016,2017,2018](https://github.com/user-attachments/assets/6bdb0767-abb9-4f03-806d-5b4ac71239fe)


*5. Total Sales base on Product in 3 different categories of each year as different colour:

![Total sales base on product in 3 different Categories](https://github.com/user-attachments/assets/e0c7661c-c98b-4088-82cd-c0f534de22c1)

*6. Total Product of each segment

| Segment     | total_product |
|-------------|---------------|
| Home Office | 1092          |
| Corporate   | 1432          |
| Consumer    | 1700          |

*7. Total Product of each Category

| Category        | f0_  |
|-----------------|------|
| Furniture       | 375  |
| Office Supplies | 1082 |
| Technology      | 404  |

*8. Products contribution of Total sales (%) in each year:

![image](https://github.com/user-attachments/assets/b6b7a600-64cd-41bb-a007-e9288256b180)

*9.Total sales by segment

| segment     | Total_sales |
|-------------|-------------|
| Home Office | 424982.2    |
| Corporate   | 688494.1    |
| Consumer    | 1148061     |

*10. Total sales base on cities in different categories in 2015-2018:

# Top 10 Cities base on Total sales:

| city          | region  | state        | total_sales        |   |
|---------------|---------|--------------|--------------------|---|
| New York City | East    | New York     | 252462.5           |   |
| Los Angeles   | West    | California   | 173420.18099999981 |   |
| Seattle       | West    | Washington   | 116106.32199999993 |   |
| San Francisco | West    | California   | 109041.11999999984 |   |
| Philadelphia  | East    | Pennsylvania | 108841.74899999995 |   |
| Houston       | Central | Texas        | 63956.142799999987 |   |
| Chicago       | Central | Illinois     | 47820.132999999965 |   |
| San Diego     | West    | California   | 47521.028999999995 |   |
| Detroit       | Central | Michigan     | 42446.94400000001  |   |
| Jacksonville  | South   | Florida      | 39133.327999999994 |   |

![image](https://github.com/user-attachments/assets/dba5b722-d0d3-4f0e-baa2-024374658c5c)


*11. Top 20 Customers in different segment by different Categories:

| customer_name   | segment     | order_date | city          | product_name                                                                  | category        | sub_category | Total_sales |
|----------------------|-------------|------------|---------------|-------------------------------------------------------------------------------|-----------------|--------------|-------------|
| Sean Miller  | Home Office | 3/18/2015  | Jacksonville  | Cisco TelePresence System EX90 Videoconferencing Unit                         | Technology      | Machines     | 22638.48    |
| Tamara Chand | Corporate   | 10/2/2017  | Lafayette     | Canon imageCLASS 2200 Advanced Copier                                         | Technology      | Copiers      | 17499.95    |
| Raymond Buch | Consumer    | 3/23/2018  | Seattle       | Canon imageCLASS 2200 Advanced Copier                                         | Technology      | Copiers      | 13999.96    |
| Tom Ashbrook | Home Office | 10/22/2018 | New York City | Canon imageCLASS 2200 Advanced Copier                                         | Technology      | Copiers      | 11199.97    |
| Hunter Lopez | Consumer    | 11/17/2018 | Newark        | Canon imageCLASS 2200 Advanced Copier                                         | Technology      | Copiers      | 10499.97    |
| Adrian Barto | Consumer    | 12/17/2017 | Detroit       | GBC Ibimaster 500 Manual ProClick Binding System                              | Office Supplies | Binders      | 9892.74     |
| Sanjit Chand | Consumer    | 9/23/2015  | Minneapolis   | Ibico EPK-21 Electric Binding System                                          | Office Supplies | Binders      | 9449.95     |
| Bill Shonely | Corporate   | 4/16/2017  | Lakewood      | 3D Systems Cube Printer, 2nd Generation, Magenta                              | Technology      | Machines     | 9099.93     |
| Sanjit Engle | Consumer    | 2/2/2017   | Arlington     | HP Designjet T520 Inkjet Large Format Printer - 24" Color                     | Technology      | Machines     | 8749.95     |
| Christopher Conant| Consume| 5/23/2017  | Philadelphia  | Canon imageCLASS 2200 Advanced Copier                                         | Technology      | Copiers      |8399.976     |
| Ken Lonsdale | Consumer    | 7/25/2015  | San Francisco | High Speed Automatic Electric Letter Opener                                   | Office Supplies | Supplies     | 8187.65     |
| Becky Martin | Consumer    | 9/8/2015   | San Antonio   | Lexmark MX611dhe Monochrome Laser Printer                                     | Technology      | Machines     | 8159.952    |
| Grant Thornton| Corporate  | 11/4/2018  | Burlington    | Cubify CubeX 3D Printer Triple Head Print                                     | Technology      | Machines     | 7999.98     |
| Tom Boeckenhauer | Consumer| 12/14/2015 | New York City | HP Designjet T520 Inkjet Large Format Printer - 24" Color                     | Technology      | Machines     | 6999.96     |
| Christopher  | Consumer    | 3/16/2016  |   Atlanta    | Fellowes PB500 Electric Punch Plastic Comb Binding Machine with Manual   Bind |Office Supplies  |  Binders     | 6354.95     |
| Andy Reiter  | Consumer    | 1/16/2018  | Jackson       | GBC DocuBind P400 Electric Binding System                                     | Office Supplies | Binders      | 5443.96     |
| Daniel Raglin| Home Office | 10/4/2017  | Providence    | Hewlett Packard LaserJet 3310 Copier                                          | Technology      | Copiers      | 5399.91     |
| Todd Sumrall | Corporate   | 10/5/2018  | New York City | 3D Systems Cube Printer, 2nd Generation, Magenta                              | Technology      | Machines     | 5199.96     |
| Jane Waco    | Corporate   | 10/13/2018 | Sacramento    | Fellowes PB500 Electric Punch Plastic Comb Binding Machine with Manual   Bind | Office Supplies | Binders      | 5083.96     |

![Top 10 customers in different segment by different Categories](https://github.com/user-attachments/assets/b153cd5a-24b4-4a06-a8fb-0d57318fcf92)

*12. Top 10 Customers in different cities 

| City          | Customer_Name | year | Total_sales |
|---------------|---------------|------|-------------|
| Jacksonville  | Sean Miller   | 2015 | 23661.228   |
| Lafayette     | Tamara Chand  | 2017 | 18336.74    |
| Seattle       | Raymond Buch  | 2018 | 14052.48    |
| New York City | Tom Ashbrook  | 2018 | 13723.498   |
| San Antonio   | Becky Martin  | 2015 | 10539.896   |
| Newark        | Hunter Lopez  | 2018 | 10499.97    |
| Minneapolis   | Sanjit Chand  | 2015 | 9900.19     |
| Detroit       | Adrian Barton | 2017 | 9892.74     |
| Lakewood      | Bill Shonely  | 2017 | 9135.19     |

*13. Category Sales Trends by Month and Year (2015-2018)
![Category Sales Trends by Month and Year (2015-2018)](https://github.com/user-attachments/assets/581079e5-fe16-4ab8-a8c7-1a02167c0c40)

*Total sales by Categories in each year: Find out each year which category was the most popular*

| Year | Category        | total_sales |
|------|-----------------|-------------|
| 2015 | Technology      | 173865.5    |
| 2015 | Furniture       | 156477.9    |
| 2015 | Office Supplies | 149512.8    |
| 2016 | Furniture       | 164053.9    |
| 2016 | Technology      | 162257.7    |
| 2016 | Office Supplies | 133124.4    |
| 2017 | Technology      | 221961.9    |
| 2017 | Furniture       | 195813      |
| 2017 | Office Supplies | 182417.6    |
| 2018 | Technology      | 269370.7    |
| 2018 | Office Supplies | 240367.5    |
| 2018 | Furniture       | 212313.8    |


*14. Customer Last Purchase Analysis: Months Since Last Purchase and Churn Status (as of December 31, 2018)
I just put here for 20 rows,

| Customer_Name     | last_purchase_date | months_since_last_purchase | customer_status |
|-------------------|--------------------|----------------------------|-----------------|
| Paul Prost        | 9/24/2018          | 3                          | Active          |
| Guy Phonely       | 11/26/2016         | 25                         | Churned         |
| Sung Shariari     | 9/1/2018           | 3                          | Active          |
| Patrick O'Donnell | 12/30/2018         | 0                          | Active          |
| Pamela Stobb      | 9/14/2018          | 3                          | Active          |
| George Zrebassa   | 7/26/2018          | 5                          | Active          |
| Frank Gastineau   | 11/26/2018         | 1                          | Active          |
| Carol Triggs      | 9/25/2018          | 3                          | Active          |
| Denny Blanton     | 6/26/2018          | 6                          | Active          |
| Scott Cohen       | 6/26/2018          | 6                          | Active          |
| Alejandro Grove   | 3/27/2018          | 9                          | Churned         |
| Brian Dahlen      | 9/24/2018          | 3                          | Active          |
| Fred McMath       | 8/7/2018           | 4                          | Active          |
| Doug O'Connell    | 12/4/2018          | 0                          | Active          |
| Michael Paige     | 10/19/2018         | 2                          | Active          |
| Alex Russell      | 9/10/2018          | 3                          | Active          |
| Jennifer Braxton  | 12/23/2018         | 0                          | Active          |
| Ben Ferrer        | 12/14/2018         | 0                          | Active          |
| Bart Pistole      | 12/13/2018         | 0                          | Active          |

The Bar Chart in Tableau:

![Churned Customers](https://github.com/user-attachments/assets/dabfa97e-f6ee-4c04-ac0b-200ebf938e75)

*Monthly Churned rate trend:*

![Monthly Churn rate trends](https://github.com/user-attachments/assets/8a0fcd48-31c5-4de4-8ce8-7056bebded75)

*15. Regional Sales Distribution in 2015/2016/2017/2018: Top Cities in Central, East, South, and West Regions


![Total sales in different region (2015-2018)](https://github.com/user-attachments/assets/5328b237-3284-410e-96ae-73d8f6c18170)

*16. Contribution of Product(%) in 2018,2017

| product_name                                                | year | Category        | product_sales | contribution_to_sales |
|-------------------------------------------------------------|------|-----------------|---------------|-----------------------|
| Canon imageCLASS 2200 Advanced Copier                       | 2018 | Technology      | 35699.898     | 4.94%                 |
| Martin Yale Chadless Opener Electric   Letter Opener        | 2018 | Office Supplies | 11825.902     | 1.64%                 |
| GBC DocuBind TL300 Electric Binding   System                | 2018 | Office Supplies | 10943.278     | 1.52%                 |
| Samsung Galaxy Mega 6.3                                     | 2018 | Technology      | 9239.78       | 1.28%                 |
| Hewlett Packard LaserJet 3310 Copier                        | 2018 | Technology      | 9239.846      | 1.28%                 |
---------------------------------------------------------------------------------------------------------------------------------
| Canon imageCLASS 2200 Advanced Copier                       | 2017 | Technology      | 25899.926     | 4.32%                 |
| GBC Ibimaster 500 Manual ProClick Binding   System          | 2017 | Office Supplies | 12860.562     | 2.14%                 |
| 3D Systems Cube Printer, 2nd Generation,   Magenta          | 2017 | Technology      | 9099.93       | 1.52%                 |
| High Speed Automatic Electric Letter   Opener               | 2017 | Office Supplies | 8842.662      | 1.47%                 |
| HP Designjet T520 Inkjet Large Format   Printer - 24" Color | 2017 | Technology      | 8749.95       | 1.46%                 |


*17. top contributors to total sales based on the Pareto Principle (80/20 Rule)

| product_name                                                                  | total_sales | contribution_percentage | cumulative_contribution |
|-------------------------------------------------------------------------------|-------------|-------------------------|-------------------------|
| Canon imageCLASS 2200 Advanced Copier                                         | 61599.824   | 2.72                    | 2.72                    |
| Fellowes PB500 Electric Punch Plastic   Comb Binding Machine with Manual Bind | 27453.384   | 1.21                    | 3.93                    |
| Cisco TelePresence System EX90   Videoconferencing Unit                       | 22638.48    | 1                       | 4.93                    |
| HON 5400 Series Task Chairs for Big and   Tall                                | 21870.576   | 0.97                    | 5.9                     |
| GBC DocuBind TL300 Electric Binding   System                                  | 19823.479   | 0.88                    | 6.78                    |
| GBC Ibimaster 500 Manual ProClick Binding   System                            | 19024.5     | 0.84                    | 7.62                    |
| Hewlett Packard LaserJet 3310 Copier                                          | 18839.686   | 0.83                    | 8.45                    |
| HP Designjet T520 Inkjet Large Format   Printer - 24" Color                   | 18374.895   | 0.81                    | 9.26                    |
| GBC DocuBind P400 Electric Binding System                                     | 17965.068   | 0.79                    | 10.05                   |
| High Speed Automatic Electric Letter   Opener                                 | 17030.312   | 0.75                    | 10.8                    |
| Lexmark MX611dhe Monochrome Laser Printer                                     | 16829.901   | 0.74                    | 11.54                   |
| Martin Yale Chadless Opener Electric   Letter Opener                          | 16656.2     | 0.74                    | 12.28                   |
| Ibico EPK-21 Electric Binding System                                          | 15875.916   | 0.7                     | 12.98                   |
| Riverside Palais Royal Lawyers Bookcase,   Royale Cherry Finish               | 15610.9656  | 0.69                    | 13.67                   |
| 3D Systems Cube Printer, 2nd Generation,   Magenta                            | 14299.89    | 0.63                    | 14.3                    |
| Samsung Galaxy Mega 6.3                                                       | 13943.668   | 0.62                    | 14.92                   |
| Apple iPhone 5                                                                | 12996.6     | 0.57                    | 15.49                   |
| Bretford Rectangular Conference Table   Tops                                  | 12995.2915  | 0.57                    | 16.06                   |
| Global Troy Executive Leather Low-Back   Tilter                               | 12975.382   | 0.57                    | 16.63                   |
| SAFCO Arco Folding Chair                                                      | 11572.78    | 0.51                    | 17.14                   |


--insight:
*product_name:"Canon imageCLASS 2200 Advanced Copier."
*total_sales: $61,599.82.
  This indicates how much money this product has contributed to the overall sales during the specified period
*The percentage of the total sales contributed by this product: 2.72%.
*Formula: Contribution Percentage} =( total_sales of product\total sales of all products) * 100*
For example:
Contribution Percentage =(61599.824 /Total Sales) × 100
*This indicates that this product accounts for 2.72% of the total sales revenue.*
*cumulative_contribution:
The running total of the contribution percentages up to this product in a descending order of sales: 2.72%.
If this product is the first in the sorted list (i.e., the highest sales), the cumulative_contribution is the same as its contribution_percentage.
As you go down the list, the cumulative_contribution increases by adding the contribution_percentage of subsequent products.

*What This Means for Analysis:*
This product contributes 2.72% of total sales, which is significant or negligible depending on your overall sales distribution.
The cumulative contribution (2.72%) tells you where this product stands in terms of its impact. 
If your goal is to identify the top 20% products driving 80% of sales (Pareto Principle), this product would be included only if the cumulative contribution is ≤80%.

*18. purchase frequency for each customer

| customer_id | customer_name       | total_sales        | purchase_frequency |
|-------------|---------------------|--------------------|--------------------|
| WB-21850    | William Brown       | 6129.7100000000009 | 35                 |
| PP-18955    | Paul Prost          | 7252.608           | 34                 |
| MA-17560    | Matt Abelman        | 4299.161000000001  | 34                 |
| JL-15835    | John Lee            | 9576.3430000000026 | 33                 |
| CK-12205    | Chloris Kastensmidt | 3154.8550000000005 | 32                 |
| JD-15895    | Jonathan Doherty    | 7610.864           | 32                 |
| SV-20365    | Seth Vernon         | 11470.950000000003 | 32                 |
| EP-13915    | Emily Phan          | 5478.0608          | 31                 |
| ZC-21910    | Zuschuss Carroll    | 8025.7070000000012 | 31                 |
| AP-10915    | Arthur Prichep      | 3323.5559999999996 | 31                 |

*Top Customers by Purchase Frequency*
--William Brown (WB-21850) has the highest purchase frequency with 35 transactions: This indicates a very frequent buyer who likely makes smaller, consistent purchases.
Despite the highest frequency, his total sales ($6,129.71) are not the highest, meaning he may purchase lower-cost items more frequently.
--Paul Prost (PP-18955) and Matt Abelman (MA-17560) follow closely with 34 transactions each:
Paul Prost has generated the highest total sales in this table with $7,252.61, indicating he might purchase higher-priced items compared to others.
