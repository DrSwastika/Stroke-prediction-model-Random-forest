library(shiny)
library(readr)  # For reading the final model

# Load the final model
final_model <- readRDS("/cloud/project/final_model.rds")
# Define the UI
ui <- fluidPage(
  titlePanel("Stroke Prediction"),
  sidebarLayout(
    sidebarPanel(
      numericInput("age", "Age:", value = 50),
      numericInput("hypertension", "Hypertension (1 for yes, 0 for no):", value = 0),
      numericInput("heart_disease", "Heart Disease (1 for yes, 0 for no):", value = 0),
      radioButtons("ever_married", "Ever Married:", choices = c("Yes", "No"), selected = "Yes"),
      selectInput("work_type", "Work Type:", choices = c("Private", "Self-employed", "Govt_job", "children", "Never_worked")),
      selectInput("Residence_type", "Residence Type:", choices = c("Urban", "Rural")),
      selectInput("smoking_status", "Smoking Status:", choices = c("formerly smoked", "never smoked", "smokes", "Unknown")),
      numericInput("avg_glucose_level", "Average Glucose Level:", value = 100),
      numericInput("bmi", "BMI:", value = 28.5),
      radioButtons("gender", "Gender:", choices = c("Male", "Female", "Other"), selected = "Male"), actionButton("submit", "Submit")
    ),
    mainPanel(
      h3("Prediction Result:"),
      textOutput("prediction")
    )
  )
)
# Define the server logic
server <- function(input, output) {
  # Create a reactive expression for prediction
  prediction <- reactive({
    # Check if smoking_status input is provided
    if (is.null(input$smoking_status) || input$smoking_status == "") {
      return("Please select a smoking status.")
    }
    
    # Create a new data frame with user input
    new_data <- data.frame(
      age = input$age,
      hypertension = factor(input$hypertension, levels = c(0, 1)),
      heart_disease = factor(input$heart_disease, levels = c(0, 1)),
      ever_married = input$ever_married,
      work_type = input$work_type,
      Residence_type = input$Residence_type,
      avg_glucose_level = input$avg_glucose_level,
      bmi = input$bmi,
      smoking_status = factor(input$smoking_status, levels = c("formerly smoked", "never smoked", "smokes", "Unknown")),
      gender = input$gender
    )
    
    # Print out the input data
    print(new_data)
    
    # Make predictions using the final model
    prediction <- predict(final_model, new_data)
    
    # Print out the predictions
    print(prediction)
    
    # Return the prediction
    prediction
  })
  
  # Render the prediction
  output$prediction <- renderText({
    # Extract the prediction result
    result <- prediction()
    
    # If smoking_status input is missing, return error message
    if (is.character(result)) {
      return(result)
    }
    
    # Convert prediction to label
    prediction_label <- ifelse(result == "negative", "Negative", "Positive")
    
    # Return the prediction
    paste("Predicted Stroke Risk:", prediction_label)
  })
}

# Run the application
shinyApp(ui = ui, server = server)

