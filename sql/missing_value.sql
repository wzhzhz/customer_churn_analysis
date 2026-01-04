SELECT 
    -- Total rows 
    COUNT(*) AS TotalRows,

    -- ID / Text columns: NULL + Empty
    SUM(Customer_ID IS NULL) AS Customer_ID_Null_Count,
    SUM(TRIM(IFNULL(Customer_ID,'')) = '') AS Customer_ID_Empty_Count,

    SUM(Gender IS NULL) AS Gender_Null_Count,
    SUM(TRIM(IFNULL(Gender,'')) = '') AS Gender_Empty_Count,

    -- Numeric columns: only NULL matters 
    SUM(Age IS NULL) AS Age_Null_Count,
    SUM(Married IS NULL) AS Married_Null_Count,

    SUM(State IS NULL) AS State_Null_Count,
    SUM(TRIM(IFNULL(State,'')) = '') AS State_Empty_Count,

    SUM(Number_of_Referrals IS NULL) AS Number_of_Referrals_Null_Count,
    SUM(Tenure_in_Months IS NULL) AS Tenure_in_Months_Null_Count,

    SUM(Value_Deal IS NULL) AS Value_Deal_Null_Count,
    SUM(TRIM(IFNULL(Value_Deal,'')) = '') AS Value_Deal_Empty_Count,

    SUM(Phone_Service IS NULL) AS Phone_Service_Null_Count,
    SUM(TRIM(IFNULL(Phone_Service,'')) = '') AS Phone_Service_Empty_Count,

    SUM(Multiple_Lines IS NULL) AS Multiple_Lines_Null_Count,
    SUM(TRIM(IFNULL(Multiple_Lines,'')) = '') AS Multiple_Lines_Empty_Count,

    SUM(Internet_Service IS NULL) AS Internet_Service_Null_Count,
    SUM(TRIM(IFNULL(Internet_Service,'')) = '') AS Internet_Service_Empty_Count,

    SUM(Internet_Type IS NULL) AS Internet_Type_Null_Count,
    SUM(TRIM(IFNULL(Internet_Type,'')) = '') AS Internet_Type_Empty_Count,

    SUM(Online_Security IS NULL) AS Online_Security_Null_Count,
    SUM(TRIM(IFNULL(Online_Security,'')) = '') AS Online_Security_Empty_Count,

    SUM(Online_Backup IS NULL) AS Online_Backup_Null_Count,
    SUM(TRIM(IFNULL(Online_Backup,'')) = '') AS Online_Backup_Empty_Count,

    SUM(Device_Protection_Plan IS NULL) AS Device_Protection_Plan_Null_Count,
    SUM(TRIM(IFNULL(Device_Protection_Plan,'')) = '') AS Device_Protection_Plan_Empty_Count,

    SUM(Premium_Support IS NULL) AS Premium_Support_Null_Count,
    SUM(TRIM(IFNULL(Premium_Support,'')) = '') AS Premium_Support_Empty_Count,

    SUM(Streaming_TV IS NULL) AS Streaming_TV_Null_Count,
    SUM(TRIM(IFNULL(Streaming_TV,'')) = '') AS Streaming_TV_Empty_Count,

    SUM(Streaming_Movies IS NULL) AS Streaming_Movies_Null_Count,
    SUM(TRIM(IFNULL(Streaming_Movies,'')) = '') AS Streaming_Movies_Empty_Count,

    SUM(Streaming_Music IS NULL) AS Streaming_Music_Null_Count,
    SUM(TRIM(IFNULL(Streaming_Music,'')) = '') AS Streaming_Music_Empty_Count,

    SUM(Unlimited_Data IS NULL) AS Unlimited_Data_Null_Count,
    SUM(TRIM(IFNULL(Unlimited_Data,'')) = '') AS Unlimited_Data_Empty_Count,

    SUM(Contract IS NULL) AS Contract_Null_Count,
    SUM(TRIM(IFNULL(Contract,'')) = '') AS Contract_Empty_Count,

    SUM(Paperless_Billing IS NULL) AS Paperless_Billing_Null_Count,
    SUM(TRIM(IFNULL(Paperless_Billing,'')) = '') AS Paperless_Billing_Empty_Count,

    SUM(Payment_Method IS NULL) AS Payment_Method_Null_Count,
    SUM(TRIM(IFNULL(Payment_Method,'')) = '') AS Payment_Method_Empty_Count,

    -- Numeric money fields: NULL only
    SUM(Monthly_Charge IS NULL) AS Monthly_Charge_Null_Count,
    SUM(Total_Charges IS NULL) AS Total_Charges_Null_Count,
    SUM(Total_Refunds IS NULL) AS Total_Refunds_Null_Count,
    SUM(Total_Extra_Data_Charges IS NULL) AS Total_Extra_Data_Charges_Null_Count,
    SUM(Total_Long_Distance_Charges IS NULL) AS Total_Long_Distance_Charges_Null_Count,
    SUM(Total_Revenue IS NULL) AS Total_Revenue_Null_Count,

    -- Status / Category / Reason: NULL + Empty
    SUM(Customer_Status IS NULL) AS Customer_Status_Null_Count,
    SUM(TRIM(IFNULL(Customer_Status,'')) = '') AS Customer_Status_Empty_Count,

    SUM(Churn_Category IS NULL) AS Churn_Category_Null_Count,
    SUM(TRIM(IFNULL(Churn_Category,'')) = '') AS Churn_Category_Empty_Count,

    SUM(Churn_Reason IS NULL) AS Churn_Reason_Null_Count,
    SUM(TRIM(IFNULL(Churn_Reason,'')) = '') AS Churn_Reason_Empty_Count
FROM customer_data;





CREATE TABLE clean_churn AS
SELECT
  Customer_ID,
  NULLIF(TRIM(Gender), '') AS Gender,
  Age,
  Married,
  NULLIF(TRIM(State), '') AS State,
  Number_of_Referrals,
  Tenure_in_Months,

  COALESCE(NULLIF(TRIM(Value_Deal), ''), 'None') AS Value_Deal,

  NULLIF(TRIM(Phone_Service), '') AS Phone_Service,
  COALESCE(NULLIF(TRIM(Multiple_Lines), ''), 'No') AS Multiple_Lines,

  NULLIF(TRIM(Internet_Service), '') AS Internet_Service,
  COALESCE(NULLIF(TRIM(Internet_Type), ''), 'None') AS Internet_Type,

  COALESCE(NULLIF(TRIM(Online_Security), ''), 'No') AS Online_Security,
  COALESCE(NULLIF(TRIM(Online_Backup), ''), 'No') AS Online_Backup,
  COALESCE(NULLIF(TRIM(Device_Protection_Plan), ''), 'No') AS Device_Protection_Plan,
  COALESCE(NULLIF(TRIM(Premium_Support), ''), 'No') AS Premium_Support,
  COALESCE(NULLIF(TRIM(Streaming_TV), ''), 'No') AS Streaming_TV,
  COALESCE(NULLIF(TRIM(Streaming_Movies), ''), 'No') AS Streaming_Movies,
  COALESCE(NULLIF(TRIM(Streaming_Music), ''), 'No') AS Streaming_Music,
  COALESCE(NULLIF(TRIM(Unlimited_Data), ''), 'No') AS Unlimited_Data,

  NULLIF(TRIM(Contract), '') AS Contract,
  NULLIF(TRIM(Paperless_Billing), '') AS Paperless_Billing,
  NULLIF(TRIM(Payment_Method), '') AS Payment_Method,

  Monthly_Charge,
  Total_Charges,
  Total_Refunds,
  Total_Extra_Data_Charges,
  Total_Long_Distance_Charges,
  Total_Revenue,

  NULLIF(TRIM(Customer_Status), '') AS Customer_Status,

  COALESCE(NULLIF(TRIM(Churn_Category), ''), 'Others') AS Churn_Category,
  COALESCE(NULLIF(TRIM(Churn_Reason), ''), 'Others') AS Churn_Reason
FROM customer_data;

