
## Enhancing Clinical Decision-Making with a Stroke Prediction Model using Random Forest in R

**Introduction:**

Stroke is a significant global health concern, ranking as the second leading cause of death worldwide, responsible for approximately 11% of total mortality according to the World Health Organization (WHO). This report presents an analysis aimed at developing and deploying a robust stroke prediction model using R. The dataset under investigation comprises clinical and demographic information collected from 5110 participants, with key features including age, gender, hypertension status, heart disease history, marital status, occupation type, residence type, average glucose level, body mass index (BMI), smoking status, and the target variable indicating stroke occurrence.

**Objective:**

The primary objective of this project is to construct a reliable stroke prediction model using patient data. Once developed and validated, this model will serve as a vital tool in clinical decision-making, facilitating the identification of individuals at high risk of stroke. Early intervention and prevention measures can then be implemented for such high-risk patients, potentially reducing stroke incidence and improving patient outcomes.

**Data Import and Pre-processing:**

The dataset was imported into R, and initial data cleaning tasks were performed to ensure data integrity. Missing values were addressed, and standardization of variable types was carried out to prepare the data for analysis. Notably, the 'bmi' column entries containing "N/A" were replaced with NA, and "Unknown" entries in the 'smoking_status' column were similarly handled. Furthermore, non-numeric values in the 'bmi' column were converted to numeric format, and missing values in the 'gender' column were imputed using the mode.

**Data Exploration:**

Exploratory data analysis was conducted to gain insights into the dataset's characteristics. Visualizations such as histograms, bar plots, and box plots were utilized to examine demographic and health-related factors. Key observations included the distribution of age, prevalence of hypertension, gender distribution, relationship between average glucose levels and stroke status, and the impact of smoking status on stroke prediction.

**Building Prediction Model:**

The dataset was split into training and test sets, and a predictive model was constructed using the random forest algorithm. A systematic approach to tuning model parameters was employed, aiming to optimize performance metrics such as accuracy and area under the receiver operating characteristic curve (AUC). The final model was integrated into a workflow, incorporating data preprocessing steps to ensure model robustness.

**Model Evaluation:**

Performance evaluation of the final model was conducted on the test set, assessing metrics including accuracy, AUC, and Brier score. The model demonstrated strong predictive capabilities, with high accuracy and AUC values indicating effective discrimination between positive and negative instances. The Brier score reflected the model's calibration accuracy, further enhancing its reliability.

**Deployment:**

The developed stroke prediction model was deployed as a user-friendly Shiny application, allowing clinicians and individuals to input relevant health data and receive predictions on stroke risk. The application provides a practical tool for assessing stroke risk quickly and efficiently, contributing to improved clinical decision-making and patient care.

**Conclusion:**

In conclusion, the analysis presented in this report demonstrates the successful development and deployment of a stroke prediction model using R. By leveraging machine learning techniques and comprehensive data analysis, we have created a valuable tool for identifying individuals at high risk of stroke and facilitating early intervention strategies. The deployed model holds promise for improving patient outcomes and advancing stroke prevention efforts in clinical settings.


***I'm thrilled to share my first GitHub project. I would be delighted to hear your thoughts and feedback on the project. I am especially interested in feedback on the interface's usability.*** 
***I've also included a supplementary file in the repository that contains all of the visualisations, model predictions, and a screenshot of the User Interface of the stroke prediction model along with the StrokeAlert Application.***
