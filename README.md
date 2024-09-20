# Overview - 
This SAP ABAP program demonstrates various interactive ALV (ABAP List Viewer) display techniques. 
It also allows the user to select between a Classical Report, an ALV Grid Display, and a Pop-up display, based on employee data stored in a custom table ZPS_EMP_DATA.

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

# Output is here-

![image](https://github.com/user-attachments/assets/0755bece-47ad-44e4-85e6-994053968372)

* on choosing classical Report-
  
![image](https://github.com/user-attachments/assets/da34621d-bdfc-46f8-a988-3be82c49fb54)

* On choosing ALV Grid -

  ![image](https://github.com/user-attachments/assets/8afcf01a-ad2d-4e15-b073-32ad9ee4a0c6)

  - we can add row here through Add row icon and edit a new detail ( i have shown new data in 2nd pic)-

    <img width="509" alt="{F4976FAB-9548-4DD7-B150-5C000586F58C}" src="https://github.com/user-attachments/assets/2730c1df-ad67-4ffc-a99a-466a3df87de4">

    <img width="488" alt="image" src="https://github.com/user-attachments/assets/92f8fafb-61aa-4d85-89f2-b213c9b06555">

- Also, in 2nd pic I've shown that we can save that new data as well and it will directly be saved in our database custom table.

  <img width="829" alt="{AB716BAF-E9E9-44D2-A5CD-387DA431D8B8}" src="https://github.com/user-attachments/assets/fbf143da-805d-4101-96de-d119874b3a68">

  - we can delete any row from, the Delete row icon and it will be deleted from our custom database table and when we save the update it will reflect in our database table.
 
    <img width="504" alt="{7C55EACD-3253-4118-8B84-9AA827189FFD}" src="https://github.com/user-attachments/assets/a8fbc7b0-f946-4c16-91f7-e59f36e4005f">

    <img width="861" alt="{4AC88AA1-CBBC-4FF2-8AAA-658E512552A7}" src="https://github.com/user-attachments/assets/1c2d4440-9017-4727-b348-4532956d50c6">


  * To display data in Pop-up format -
 
    ![image](https://github.com/user-attachments/assets/3168a8dd-6234-4360-bb0d-b90ce6365668)










   

