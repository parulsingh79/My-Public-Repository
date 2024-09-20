# Overview - 
This SAP ABAP program demonstrates various interactive ALV (ABAP List Viewer) display techniques. 
It allows the user to select between a Classical Report, an ALV Grid Display, and a Pop-up display, based on employee data stored in a custom table ZPS_EMP_DATA.

# Key Features
* Classical Report: Displays employee data using WRITE statements.
* ALV Grid Display: Displays employee data using ALV Grid with editable columns.
* Pop-up Display: Displays employee data in a pop-up table using REUSE_ALV_POPUP_TO_SELECT.
* Date Format Function: Calls custom function ZPS_DATE_FORMAT to format and display dates in the report.

# Function Module Used
* A custom Function Module ( ZPS_DATE_FORMAT ) to display date in DD-'Month'-YYYY format.
  
  ![image](https://github.com/user-attachments/assets/fbf8d1f8-3a38-4cfa-bd00-0a3963678889)

  ![image](https://github.com/user-attachments/assets/744597e1-2b73-4863-b2af-106d0126dcf4)

  ![image](https://github.com/user-attachments/assets/9abdd549-427f-4361-aa57-58b74a156d54)


* A standard Function Module ( REUSE_ALV_GRID_DISPLAY ) to display data in grid format.
  
  <img width="441" alt="{928305B8-8138-4D99-A317-58AFA6DF16F7}" src="https://github.com/user-attachments/assets/6eb1b346-f187-4ad5-8009-6671f44943b3">

  ![image](https://github.com/user-attachments/assets/5167e146-f10d-4813-96f2-06a343cf6765)


* A standard Function Module ( REUSE_ALV_POPUP_TO_SELECT ) to display data in POP-UP format.

  <img width="421" alt="{158A93DD-E071-46CB-BE83-8830142D1791}" src="https://github.com/user-attachments/assets/5432b787-eb1f-472e-96ee-3d3c3e92c41e">


  <img width="658" alt="{E79E6507-E8D1-4647-AAB5-8F1DD917CEFD}" src="https://github.com/user-attachments/assets/ce8eeb4e-851f-496b-a4e3-a9d2f0a943fe">

  * A standard Function Module ( REUSE_ALV_COMMENTARY_WRITE ) to display the header section for the ALV report.

    ![image](https://github.com/user-attachments/assets/892006d0-7ce1-4bfc-8467-0b6873c5b7b1)

    ![image](https://github.com/user-attachments/assets/10e40448-33b1-4fb4-8cfb-828c20ddbb3b)

# Logic for 'SAVE' , 'DELETE' a row and 'ADD' a row is here-

  ![image](https://github.com/user-attachments/assets/900a0ffe-eb41-4c03-83d8-c48e7389db24)

  ![image](https://github.com/user-attachments/assets/94a3c077-1e77-475b-98e7-794524c92ca2)




   

