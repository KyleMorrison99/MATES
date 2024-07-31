pacman::p_load(shiny,
               shinydashboard,
               shinythemes,
               shinyjs)

# Load required libraries for Shiny, ShinyJS, and themes
ui <- fluidPage(
  useShinyjs(), 
  extendShinyjs(text = "shinyjs.resetPage = function() { location.reload(); }", functions = c("resetPage")), # Enable ShinyJS for JavaScript functionalities
  theme = shinytheme("cosmo"),  # Apply the "cosmo" theme from shinythemes
  
  # Custom CSS styles
  tags$head(
    tags$style(HTML('
 .correct {
    color: green;
    font-weight: bold;
    font-size: 1.5em; /* Adjust the size as needed */
}
.incorrect {
    color: red;
    font-weight: bold;
    font-size: 1.5em; /* Adjust the size as needed */
}

      .btn-custom.btn-selected {
        background-color: #444444; /* Highlight color for selected button */
        color: #FFFFFF; /* White text color */
      }
      
      /* Custom font styling for different HTML elements */
      body, h1, h2, h3, h4, h5, h6, p {
        font-family: "Arial", sans-serif;
        color: #000000; /* Black text color */
      }
 
      /* Set the height and width of the body and html to fill the viewport */
      html, body {
        height: 100%;
        width: 100%;
        margin: 0;
        padding: 0;
      }

.center-container {
  position: absolute;
  top: 150px; /* Adjust this value as needed to set the fixed distance from the top */
  left: 50%;
  transform: translateX(-50%);
  padding: 0 8vw;
  margin-bottom: 20px; /* Add some space at the bottom for visual separation */
  width: 100%;
}

/* Styles for centered and bottom rows */
.centered-row, .bottom-row {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  margin-bottom: 20px;
}

/* Button styling with fixed width and height */
.centered-button, .translation-button {
  margin: 10px 30px; /* Adjusted margin to set buttons a bit more apart */
  font-size: 24px;
  width: 300px; /* Fixed width for all buttons */
  height: 100px; /* Increased height for taller buttons */
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center; /* Center text alignment */
  line-height: normal; /* Ensure normal line height for text wrapping */
}

/* Additional margin for the bottom row */
.bottom-row {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
}

      /* Styles for translation links and buttons */
      .translation-links {
        display: flex;
        flex-direction: column;
        align-items: center;
      }

     .translation-button {
    border: none;
    cursor: pointer;
    font-size: 30px; /* Increase font size */
    padding: 15px 30px; /* Increase padding */
   height: 250px;
        width: 350px;
}


      /* Hover effect for translation buttons */
      .translation-button:hover {
        border: 3px solid red;
        background-color: #333333;
      }

      /* Top button styling with adjusted margins */
      .top-button {
        margin: 10px 40px; /* Adjusted margin for the top buttons */
        font-size: 30px;
      }
    
      /* Button styles for custom buttons */
      .btn-custom {
        background-color: #222222; /* Dark background color */
        color: #EAEAEA; /* Light grey text color */
        border: none;
      }
      .btn-custom:hover {
        border: 3px solid red;
        background-color: #333333;
      }
      
      /* Footer styles for positioning and appearance */
      .footer {
        background-color: #333333;
        color: #EAEAEA;
        text-align: left;
        padding: 10px;
        position: fixed;
        bottom: 0;
        width: 100%;
      }
 
      /* Collapsible panel styles */
      .panel {
        margin-bottom: 20px;
        border: 1px solid #444;
        border-radius: 4px;
      }

      /* Custom panel heading styles */
      .panel-heading-custom {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: black;
        color: white;
      }

      /* Custom panel title styles */
      .panel-title-custom {
        font-size: 1.75em;
        font-weight: bold;
      }

      /* Panel body padding */
      .panel-body {
        padding: 15px;
        position: relative;
      }

      /* Submit button positioning and hover effect */
      .btn-submit {
        position: absolute;
        bottom: 15px;
        right: 15px;
      }
      .btn-submit:hover {
        border: 3px solid red;
        background-color: #333333; 
      }
 .btn-custom.selected {
border: 3px solid black;
        background-color:#32CD32;
      }
    "
      /* Result box styling */
      .result-box {
        margin-left: 15px;
        font-weight: bold;
      }

      /* Explanation box styling */
      .explanation-box {
        border-left: 2px solid #444444;
        padding-left: 15px;
        margin-top: 15px;
        color: #CCCCCC;
      }

      /* Navbar styles for dark background and white text */
      .navbar {
        background-color: black !important;
      }
      .navbar-brand, .navbar-nav > li > a {
        color: white !important;
      }

      /* Heading styles with custom font and size */
      h1, h2, h3, p {
        font-family: "Trebuchet MS", Helvetica, sans-serif;
      }
      h1 {
        font-size: 2.5em;
        text-decoration: underline;
      }
      h2 {
        font-size: 2em;
        text-decoration: underline;
      }
      h3 {
        font-size: 1.75em;
      }
      p {
        font-size: 1.25em; /* Larger and more appealing */
        line-height: 1.5;
      }

      /* Footer font and style adjustments */
      .footer {
        font-family: "Trebuchet MS", Helvetica, sans-serif;
        font-weight: bold;
        background-color: #f8f9fa;
        padding: 10px 0;
        width: 100%;
        position: fixed;
        text-align: center;
        border-top: 1px solid #e7e7e7;
      }
      .footer .btn {
        font-weight: normal;
        margin-left: 10px;
        background-color: black;
        color: white;
        border: none;
      }
      .footer .btn:hover {
        background-color: #333333;
        border: 3px solid red;
      }
      .main-panel h1, .main-panel h3, .main-panel ul li h3 {
  line-height: 1.6;
}

      /* Sidebar panel button styles */
      .sidebar-panel .btn {
        display: block;
        width: 100%;
        margin-bottom: 10px;
        text-align: left;
        background-color: black;
        color: white;
        border: none;
      }
      .sidebar-panel .btn:hover {
        background-color: #333333;
        border: 3px solid red;
      }

      /* Main panel padding */
      .main-panel {
        padding: 20px;
      }

      /* Content area margin */
      .content-area {
        margin: 20px;
      }

      /* Duplicate panel heading styles removed */
      .center-container {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 100vh;
        padding: 0 0vw;
      }
    .centered-row {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    margin-bottom: 10px; /* Reduced bottom margin to move up */
}
.top-button {
    height: 300px;
    width: 350px;
    white-space: normal;
    margin: 10px 30px;
    font-size: 30px; /* Increase font size */
}
.bottom-row {
    margin-top: 10px; /* Reduced top margin to move up */
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
}
      .bottom-button {
        height: 300px;
        width: 350px;
        white-space: normal;
    font-size: 30px; /* Increase font size */
        margin: 0 30px;
      }
      .shiny-button:hover {
        border: 3px solid red;
        background-color: #333333;
      }
    ')),
    tags$script(HTML("
      function toggleCheckbox(button, group) {
          var buttons = document.getElementsByClassName(group);
          for (var i = 0; i < buttons.length; i++) {
              buttons[i].classList.remove('selected');
          }
          button.classList.add('selected');
      }
      function resetSelections() {
          var groups = ['group1', 'group2', 'group3', 'group4', 'group5', 'group6', 'group7', 'group8', 'group9', 'group10', 'group11', 'group12', 'group13', 'group14'];
          groups.forEach(function(group) {
              var buttons = document.getElementsByClassName(group);
              for (var i = 0; i < buttons.length; i++) {
                  buttons[i].classList.remove('selected');
              }
          });
      }
    
    "))
  )
,
navbarPage("", 
           tabPanel("Home",
                    div(class = "content-area",
                        sidebarLayout(
                          position = "right",
                          sidebarPanel( 
                            class = "sidebar-panel",
                            div(id = "documents",
                                h1("Key Documents"),
                                actionButton("downloadMATES", "MATES Checklist", class = "btn-custom"),
                                actionButton("downloadMATESstatement", "MATES Statement", class = "btn-custom")
                            )
                          ),
                          mainPanel(
                            class = "main-panel",
                            h1("MATES: Meta-analysis Appraisal Tool for Environmental Sciences"),
                            h3("MATES is an appraisal tool designed to evaluate the reporting quality of meta-analyses in environmental sciences. The checklist consists of 14 appraisal items developed using a community-driven Delphi-like method."),
                            h3("The primary target users of MATES are researchers, editors, and reviewers who are interested in assessing the reporting quality of meta-analyses in a repeatable and efficient manner. While MATES was developed primarily by the environmental science community, we propose that the checklist is widely applicable to other scientific disciplines."),
                            tags$br(),
                            h1("The MATES Shiny app includes the following sections:"),
                            tags$ul(
                              tags$li(h2("Development"),
                                      tags$ul(
                                        tags$li(h3("A detailed description of the steps within the community-driven Delphi-like process."))
                                      )
                              ),
                              tags$li(h2("Translations"),
                                      tags$ul(
                                        tags$li(h3("Translations of the MATES checklist into multiple languages, including French, Spanish, Portuguese, Italian, Simplified and Traditional Chinese, Japanese, Russian, and Polish."))
                                      )
                              ),
                              tags$li(h2("Trainer"),
                                      tags$ul(
                                        tags$li(h3("A dedicated training tool to benchmark your appraisal results and increase the accuracy of your appraisal outcomes."))
                                      )
                              ),
                              tags$li(h2("Apply"),
                                      tags$ul(
                                        tags$li(h3("A dedicated application tool to apply MATES for your own appraisal, including an option to save outcomes in a .csv format."))
                                      
                              )
                            )
                          )
                        )
                    )
           ),
           tags$footer(
             div(class = "footer",
                 h3(
                   "Email: ", 
                   a("kyle.morrison@unsw.edu.au", href = "mailto:kyle.morrison@unsw.edu.au"), 
                   " | GitHub:", 
                   a("KyleMorrison99", href = "https://github.com/KyleMorrison99/MATES")
                 ),
                 actionButton("aboutButton1", "About & Citation Info", class = "btn btn-primary")
             ))
           ),
             tabPanel("Development",
                      h3("Here we provide details on the community-driven Delphi-like methodology that was used to develop the MATES checklist."),
                      h3("The methodology consists of three separate workshops, a survey involving the community, and an implementation task."),
                      h3("For specific details, please click the appropriate box below!"),
                      div(class = "center-container",
                       div(class = "centered-row",
                              actionButton("workshop1", HTML("<b><u>Workshop 1</u></b><br>Develop initial items"), 
                                           class = "top-button shiny-button"),
                              actionButton("survey", HTML("<b><u>Survey</u></b><br>Evaluate initial items"), 
                                           class = "top-button shiny-button"),
                              actionButton("workshop2", HTML("<b><u>Workshop 2</u></b><br>Interpret survey results"), 
                                           class = "top-button shiny-button")
                          ),
                          div(class = "bottom-row",
                              actionButton("task", HTML("<b><u>Task</u></b><br>Measure inter-rater reliability and usability"), 
                                           class = "bottom-button shiny-button"),
                              actionButton("workshop3", HTML("<b><u>Workshop 3</u></b><br>Interpret task results and feedback"), 
                                           class = "bottom-button shiny-button")
                          )
                      ),
                      tags$footer(
                        div(class = "footer",
                            h3(
                              "Email: ", 
                              a("kyle.morrison@unsw.edu.au", href = "mailto:kyle.morrison@unsw.edu.au"), 
                              " | GitHub:", 
                              a("KyleMorrison99", href = "https://github.com/KyleMorrison99/MATES")
                            ),
                            actionButton("aboutButton2", "About & Citation Info", class = "btn btn-primary")
                        ))
             ),
             tabPanel("Translations",
                      h1("MATES: Meta-analysis Appraisal Tool for Environmental Sciences checklist translations"),
                      h3("MATES has been translated into several languages to increase accessibility of the tool."),
                      h3("To access the translated checklist of your choice select the appropiate button below."),
                      h3("If you are interested in tranlating a MATES checklist into a language of youe choice please contact", a("kyle.morrison@unsw.edu.au", href = "mailto:kyle.morrison@unsw.edu.au"), "."),
                      
                      div(class = "center-container",
      div(class = "centered-row",
          actionButton("portugueseChecklist", "Portuguese Checklist", class = "translation-button"),
          actionButton("chineseSimplifiedChecklist", HTML("Chinese (Simplified)<br>Checklist"), class = "translation-button"),
          actionButton("chineseTraditionalChecklist", HTML("Chinese (Traditional)<br>Checklist"), class = "translation-button")
          
      ),
      div(class = "bottom-row",
          actionButton("frenchChecklist", "French Checklist", class = "translation-button"),
          actionButton("japaneseChecklist", "Japanese Checklist", class = "translation-button"),
          actionButton("italianChecklist", "Italian Checklist", class = "translation-button")
      ),
      div(class = "bottom-row",
          actionButton("polishChecklist", "Polish Checklist", class = "translation-button"),
          actionButton("russianChecklist", "Russian Checklist", class = "translation-button"),
          actionButton("spanishChecklist", "Spanish Checklist", class = "translation-button")
      )
  
),
tags$footer(
  div(class = "footer",
      h3(
        "Email:", 
        a("kyle.morrison@unsw.edu.au", href = "mailto:kyle.morrison@unsw.edu.au"), 
        " | GitHub:", 
        a("KyleMorrison99", href = "https://github.com/KyleMorrison99/MATES")
      ),
      actionButton("aboutButton3", "About & Citation Info", class = "btn btn-primary")
  ))
),
             tabPanel("Trainer",
                      div(class = "content-area",
                          sidebarLayout(
                            position = "right",
                            sidebarPanel(
                              width = 3,
                              class = "sidebar-panel",
                              div(id = "glossary-docs",
                                  h3("Glossary"),
                                  tableOutput("glossary1")
                              )
                            ),
                            mainPanel(
                              width = 9,
                              class = "main-panel",
                              h1("Meta-analysis Appraisal Tool for Environmental Sciences (MATES) trainer"),
                              p("Here we provide a training tool to help users increase accuracy and repeatability of their appraisal outcomes."),
                              p("Below we provide five meta-analyses which we have assessed as a group deemed as a 'gold standard', in which you can compare appraisal results against."),
                              div(style = "display: flex; align-items: center;",
                                  selectInput("study_selector", "Select a study:", 
                                              choices = list(
                                                "Study 1" = "study1",
                                                "Study 2" = "study2",
                                                "Study 3" = "study3",
                                                "Study 4" = "study4",
                                                "Study 5" = "study5"
                                              )),
                                  actionButton("study_button", "Go to Study", class = "btn-custom")
                              ),
                              div(class = "panel panel-default",
                                  div(class = "panel-heading panel-heading-custom",
                                      h3(class = "panel-title panel-title-custom", "MATES checklist introduction"),
                                      tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#checklistIntro", 
                                                  span(class = "glyphicon glyphicon-chevron-up"))
                                  ),
                                  div(id = "checklistIntro", class = "panel-collapse collapse in",
                                      div(class = "panel-body",
                                          p("The MATES checklist provides a point-by-point appraisal of the reporting of methodological items in meta-analyses. To apply MATES to a meta-analysis, check whether each of the following items is present. Some MATES items have ‘Not Applicable’ criteria if a previous question needs to be reported or, a particular caveat makes an item not appropriate for assessment. For any studies that include multiple separate meta-analyses, complete the reporting appraisal for the first analysis (i.e., the analysis that comes first in the study being appraised). Please read the glossary of terms at the end of the checklist.")
                                      )
                                  )
                              ),
                              
                              div(class = "panel panel-default",
                                  div(class = "panel-heading panel-heading-custom",
                                      h3(class = "panel-title panel-title-custom", "MATES item 1: Effect size statistic formula reporting"),
                                      tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item1", 
                                                  span(class = "glyphicon glyphicon-chevron-up"))
                                  ),
                                  div(id = "item1", class = "panel-collapse collapse in",
                                      div(class = "panel-body",
                                          p(tags$u("Question")),
                                          p("Do the authors report the formula (or reference for formula) for the effect size statistic/measure used (e.g., Zr, Hedge’s g, Cohen’s d, or lnRR) in the manuscript or supplementary material?"),
                                          p(tags$u("Criteria for ‘Yes’")),
                                          p("The authors have reported the formula (or reference for the formula) for the effect size statistic/measure used in the manuscript or supplementary material."),
                                          p(tags$u("Criteria for ‘No’")),
                                          p("The authors have not reported the formula (or reference for the formula) for the effect size statistic/measure used in the manuscript or supplementary material."),
                                          p(tags$u("Criteria for ‘Not Applicable’")),
                                          p("The authors conducted an arms-based meta-analysis or extracted the effect sizes directly from the included primary studies."),
                                          tags$br(),
                                          div(style = "display: flex; align-items: center; gap: 10px;",
                                              actionButton("yes1", "Yes", class = "btn-custom group1", onclick = "toggleCheckbox(this, 'group1')"),
                                              actionButton("no1", "No", class = "btn-custom group1", onclick = "toggleCheckbox(this, 'group1')"),
                                              actionButton("na1", "Not Applicable", class = "btn-custom group1", onclick = "toggleCheckbox(this, 'group1')"),
                                              div(style = "margin-left: auto;", actionButton("submit1", "Check Answer", class = "btn-custom btn-submit"))
                                          ),
                                          tags$br(),
                                          div(textOutput("result1"), class = "result-box"),
                                          uiOutput("explanationBox1")
                                      )
                                  )
                              ),
                              
                              div(class = "panel panel-default",
                                  div(class = "panel-heading panel-heading-custom",
                                      h3(class = "panel-title panel-title-custom", "MATES item 2: Model type reporting"),
                                      tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item2", 
                                                  span(class = "glyphicon glyphicon-chevron-up"))
                                  ),
                                  div(id = "item2", class = "panel-collapse collapse in",
                                      div(class = "panel-body",
                                          p(tags$u("Question")),
                                          p("Do the authors report the type of the meta-analytic/meta-regression model (e.g., fixed, random, or multi-level models), either descriptively or in statistical notation in the manuscript or supplementary material?"),
                                          p(tags$u("Criteria for ‘Yes’")),
                                          p("The authors have reported the type of the meta-analytic/meta-regression model, either descriptively or in statistical notation in the manuscript or supplementary material."),
                                          p(tags$u("Criteria for ‘No’")),
                                          p("The authors have not reported the type of the meta-analytic/meta-regression model, either descriptively or in statistical notation in the manuscript or supplementary material."),
                                          tags$br(),
                                          div(style = "display: flex; align-items: center; gap: 10px;",
                                              actionButton("yes2", "Yes", class = "btn-custom group2", onclick = "toggleCheckbox(this, 'group2')"),
                                              actionButton("no2", "No", class = "btn-custom group2", onclick = "toggleCheckbox(this, 'group2')"),
                                              div(style = "margin-left: auto;", actionButton("submit2", "Check Answer", class = "btn-custom btn-submit"))
                                          ),
                                          tags$br(),
                                          div(textOutput("result2"), class = "result-box"),
                                          uiOutput("explanationBox2")
                                      )
                                  )
                              ),
                              
                              div(class = "panel panel-default",
                                  div(class = "panel-heading panel-heading-custom",
                                      h3(class = "panel-title panel-title-custom", "MATES item 3: Effect size dependence (non-independence) reporting"),
                                      tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item3", 
                                                  span(class = "glyphicon glyphicon-chevron-up"))
                                  ),
                                  div(id = "item3", class = "panel-collapse collapse in",
                                      div(class = "panel-body",
                                          p(tags$u("Question")),
                                          p("Do the authors report the dependence (e.g., multiplicity or, repeated measure) of effect size estimates (e.g., acknowledge multiple effect sizes were taken from a single study) in the manuscript or supplementary material?"),
                                          p(tags$u("Criteria for ‘Yes’")),
                                          p("The authors have reported whether there is dependence of effect size estimates in the manuscript or supplementary material. Alternatively, the authors may report effect size estimates are assumed to be independent."),
                                          p(tags$u("Criteria for ‘No’")),
                                          p("The authors have not reported whether there is dependence of effect size estimates in the manuscript or supplementary material."),
                                          p(tags$u("Criteria for ‘Not Applicable’")),
                                          p("The authors extracted one effect size per each primary study."),
                                          tags$br(),
                                          div(style = "display: flex; align-items: center; gap: 10px;",
                                              actionButton("yes3", "Yes", class = "btn-custom group3", onclick = "toggleCheckbox(this, 'group3')"),
                                              actionButton("no3", "No", class = "btn-custom group3", onclick = "toggleCheckbox(this, 'group3')"),
                                              actionButton("na3", "Not Applicable", class = "btn-custom group3", onclick = "toggleCheckbox(this, 'group3')"),
                                              div(style = "margin-left: auto;", actionButton("submit3", "Check Answer", class = "btn-custom btn-submit"))
                                          ),
                                          tags$br(),
                                          div(textOutput("result3"), class = "result-box"),
                                          uiOutput("explanationBox3")
                                      )
                                  )
                              ),
                              
                              div(class = "panel panel-default",
                                  div(class = "panel-heading panel-heading-custom",
                                      h3(class = "panel-title panel-title-custom", "MATES item 4: Software reporting"),
                                      tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item4", 
                                                  span(class = "glyphicon glyphicon-chevron-up"))
                                  ),
                                  div(id = "item4", class = "panel-collapse collapse in",
                                      div(class = "panel-body",
                                          p(tags$u("Question")),
                                          p("Do the authors report the name, or a reference to the software or programming language used to conduct the analysis (i.e., used to conduct the computations, statistical models, and inferences comprising the meta-analysis) in the manuscript or supplementary material?"),
                                          p(tags$u("Criteria for ‘Yes’")),
                                          p("The authors have reported the name, or a reference to the software or programming language used to conduct the analysis in the manuscript or supplementary material."),
                                          p(tags$u("Criteria for ‘No’")),
                                          p("The authors have not reported the name, or a reference to the software or programming language used to conduct the analysis in the manuscript or supplementary material."),
                                          tags$br(),
                                          div(style = "display: flex; align-items: center; gap: 10px;",
                                              actionButton("yes4", "Yes", class = "btn-custom group4", onclick = "toggleCheckbox(this, 'group4')"),
                                              actionButton("no4", "No", class = "btn-custom group4", onclick = "toggleCheckbox(this, 'group4')"),
                                              div(style = "margin-left: auto;", actionButton("submit4", "Check Answer", class = "btn-custom btn-submit"))
                                          ),
                                          tags$br(),
                                          div(textOutput("result4"), class = "result-box"),
                                          uiOutput("explanationBox4")
                                      )
                                  )
                              ),
                              
                              div(class = "panel panel-default",
                                  div(class = "panel-heading panel-heading-custom",
                                      h3(class = "panel-title panel-title-custom", "MATES item 5: Number of included primary studies reporting"),
                                      tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item5", 
                                                  span(class = "glyphicon glyphicon-chevron-up"))
                                  ),
                                  div(id = "item5", class = "panel-collapse collapse in",
                                      div(class = "panel-body",
                                          p(tags$u("Question")),
                                          p("Do the authors report the total number of primary studies (i.e., separate individual articles) included in the meta-analysis in the manuscript or supplementary material?"),
                                          p(tags$u("Criteria for ‘Yes’")),
                                          p("The authors have reported the total number of primary studies synthesised in the meta-analysis in the manuscript or supplementary material. The total number of studies can be stated in a screening flowchart (e.g., PRISMA flowchart), or the authors can state the number of studies per subgroup analysis."),
                                          p(tags$u("Criteria for ‘No’")),
                                          p("The authors have not reported the total number of primary studies synthesised in the meta-analysis in the manuscript or supplementary material. The total number of studies cannot be inferred by counting from a forest plot, or from a provided dataset."),
                                          tags$br(),
                                          div(style = "display: flex; align-items: center; gap: 10px;",
                                              actionButton("yes5", "Yes", class = "btn-custom group5", onclick = "toggleCheckbox(this, 'group5')"),
                                              actionButton("no5", "No", class = "btn-custom group5", onclick = "toggleCheckbox(this, 'group5')"),
                                              div(style = "margin-left: auto;", actionButton("submit5", "Check Answer", class = "btn-custom btn-submit"))
                                          ),
                                          tags$br(),
                                          div(textOutput("result5"), class = "result-box"),
                                          uiOutput("explanationBox5")
                                      )
                                  )
                              ),
                              
                              div(class = "panel panel-default",
                                  div(class = "panel-heading panel-heading-custom",
                                      h3(class = "panel-title panel-title-custom", "MATES item 6: Number of included effect sizes reporting"),
                                      tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item6", 
                                                  span(class = "glyphicon glyphicon-chevron-up"))
                                  ),
                                  div(id = "item6", class = "panel-collapse collapse in",
                                      div(class = "panel-body",
                                          p(tags$u("Question")),
                                          p("Do the authors report the total number of effect size estimates synthesised in the meta-analysis in the manuscript or supplementary material?"),
                                          p(tags$u("Criteria for ‘Yes’")),
                                          p("The authors have reported the total number of effect sizes estimates synthesised in the meta-analysis in the manuscript or supplementary material."),
                                          p(tags$u("Criteria for ‘No’")),
                                          p("The authors have not reported the total number of effect sizes synthesised in the meta-analysis in the manuscript or supplementary material. Alternatively, the total number of effect sizes can only be inferred by counting."),
                                          tags$br(),
                                          div(style = "display: flex; align-items: center; gap: 10px;",
                                              actionButton("yes6", "Yes", class = "btn-custom group6", onclick = "toggleCheckbox(this, 'group6')"),
                                              actionButton("no6", "No", class = "btn-custom group6", onclick = "toggleCheckbox(this, 'group6')"),
                                              div(style = "margin-left: auto;", actionButton("submit6", "Check Answer", class = "btn-custom btn-submit"))
                                          ),
                                          tags$br(),
                                          uiOutput("explanationBox6")
                                      )
                                  )
                              ),
                              
                              div(class = "panel panel-default",
                                  div(class = "panel-heading panel-heading-custom",
                                      h3(class = "panel-title panel-title-custom", "MATES item 7: Pooled mean effect reporting"),
                                      tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item7", 
                                                  span(class = "glyphicon glyphicon-chevron-up"))
                                  ),
                                  div(id = "item7", class = "panel-collapse collapse in",
                                      div(class = "panel-body",
                                          p(tags$u("Question")),
                                          p("Do the authors report the pooled mean effect of the meta-analysis/meta-regression using a plot, table or within text in the manuscript or supplementary material?"),
                                          p(tags$u("Criteria for ‘Yes’")),
                                          p("The authors reported the pooled mean effect of the meta-analysis/meta-regression in the text, or within a plot or table in the manuscript or supplementary material. The study may have reported a pooled mean effect for each subgroup analysis."),
                                          p(tags$u("Criteria for ‘No’")),
                                          p("The authors have not reported the pooled mean effect of the meta-analysis/meta-regression in the text, or within a plot or table in the manuscript or supplementary material."),
                                          tags$br(),
                                          div(style = "display: flex; align-items: center; gap: 10px;",
                                              actionButton("yes7", "Yes", class = "btn-custom group7", onclick = "toggleCheckbox(this, 'group7')"),
                                              actionButton("no7", "No", class = "btn-custom group7", onclick = "toggleCheckbox(this, 'group7')"),
                                              div(style = "margin-left: auto;", actionButton("submit7", "Check Answer", class = "btn-custom btn-submit"))
                                          ),
                                          tags$br(),
                                          div(textOutput("result7"), class = "result-box"),
                                          uiOutput("explanationBox7")
                                      )
                                  )
                              ),
                              
                              div(class = "panel panel-default",
                                  div(class = "panel-heading panel-heading-custom",
                                      h3(class = "panel-title panel-title-custom", "MATES item 8: Effect size weighting strategy reporting"),
                                      tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item8", 
                                                  span(class = "glyphicon glyphicon-chevron-up"))
                                  ),
                                  div(id = "item8", class = "panel-collapse collapse in",
                                      div(class = "panel-body",
                                          p(tags$u("Question")),
                                          p("Do the authors report the strategy used to assign weights (e.g., the sampling variance, sampling error or equivalent ) of effect size estimates in the manuscript or supplementary material?"),
                                          p(tags$u("Criteria for ‘Yes’")),
                                          p("The authors have reported the strategy used to assign weights of effect size estimates in the manuscript or supplementary material. The authors must report the weighting strategy and not solely the weights of each study."),
                                          p(tags$u("Criteria for ‘No’")),
                                          p("The authors have not reported the strategy used to assign weights of effect size estimates in the manuscript or supplementary material."),
                                          p(tags$u("Criteria for ‘Not Applicable’")),
                                          p("The authors have conducted a meta-analysis without weights (i.e., unweighted meta-analysis)."),
                                          tags$br(),
                                          div(style = "display: flex; align-items: center; gap: 10px;",
                                              actionButton("yes8", "Yes", class = "btn-custom group8", onclick = "toggleCheckbox(this, 'group8')"),
                                              actionButton("no8", "No", class = "btn-custom group8", onclick = "toggleCheckbox(this, 'group8')"),
                                              actionButton("na8", "Not Applicable", class = "btn-custom group8", onclick = "toggleCheckbox(this, 'group8')"),
                                              div(style = "margin-left: auto;", actionButton("submit8", "Check Answer", class = "btn-custom btn-submit"))
                                          ),
                                          tags$br(),
                                          div(textOutput("result8"), class = "result-box"),
                                          uiOutput("explanationBox8")
                                      )
                                  )
                              ),
                              
                              div(class = "panel panel-default",
                                  div(class = "panel-heading panel-heading-custom",
                                      h3(class = "panel-title panel-title-custom", "MATES item 9: Heterogeneity reporting"),
                                      tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item9", 
                                                  span(class = "glyphicon glyphicon-chevron-up"))
                                  ),
                                  div(id = "item9", class = "panel-collapse collapse in",
                                      div(class = "panel-body",
                                          p(tags$u("Question")),
                                          p("Do the authors report an assessment of heterogeneity (e.g., I2, tau2, 𝜎2 or, Q-statistic) between effect size estimates for the primary or first analysis in the manuscript or supplementary material?"),
                                          p(tags$u("Criteria for ‘Yes’")),
                                          p("The authors have reported an assessment of heterogeneity between effect size estimates for the primary or first analysis in the manuscript or supplementary material."),
                                          p(tags$u("Criteria for ‘No’")),
                                          p("The authors have not reported an assessment of heterogeneity between effect size estimates for the primary or first analysis in the manuscript or supplementary material."),
                                          p(tags$u("Criteria for ‘Not Applicable’")),
                                          p("The study has stated that the analysis is unweighted."),
                                          tags$br(),
                                          div(style = "display: flex; align-items: center; gap: 10px;",
                                              actionButton("yes9", "Yes", class = "btn-custom group9", onclick = "toggleCheckbox(this, 'group9')"),
                                              actionButton("no9", "No", class = "btn-custom group9", onclick = "toggleCheckbox(this, 'group9')"),
                                              actionButton("na9", "Not Applicable", class = "btn-custom group9", onclick = "toggleCheckbox(this, 'group9')"),
                                              div(style = "margin-left: auto;", actionButton("submit9", "Check Answer", class = "btn-custom btn-submit"))
                                          ),
                                          tags$br(),
                                          div(textOutput("result9"), class = "result-box"),
                                          uiOutput("explanationBox9")
                                      )
                                  )
                              ),
                              
                              div(class = "panel panel-default",
                                  div(class = "panel-heading panel-heading-custom",
                                      h3(class = "panel-title panel-title-custom", "MATES item 10: Publication bias reporting"),
                                      tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item10", 
                                                  span(class = "glyphicon glyphicon-chevron-up"))
                                  ),
                                  div(id = "item10", class = "panel-collapse collapse in",
                                      div(class = "panel-body",
                                          p(tags$u("Question")),
                                          p("Do the authors report a statistical or graphical assessment of publication bias in the manuscript or supplementary material?"),
                                          p(tags$u("Criteria for ‘Yes’")),
                                          p("The authors have reported a statistical or graphical assessment of publication bias in the manuscript or supplementary material."),
                                          p(tags$u("Criteria for ‘No’")),
                                          p("The authors have not reported a statistical or graphical assessment of publication bias in the manuscript or supplementary material."),
                                          p(tags$u("Criteria for ‘Not Applicable’")),
                                          p("The authors report that an assessment of publication bias cannot be conducted."),
                                          tags$br(),
                                          div(style = "display: flex; align-items: center; gap: 10px;",
                                              actionButton("yes10", "Yes", class = "btn-custom group10", onclick = "toggleCheckbox(this, 'group10')"),
                                              actionButton("no10", "No", class = "btn-custom group10", onclick = "toggleCheckbox(this, 'group10')"),
                                              actionButton("na10", "Not Applicable", class = "btn-custom group10", onclick = "toggleCheckbox(this, 'group10')"),
                                              div(style = "margin-left: auto;", actionButton("submit10", "Check Answer", class = "btn-custom btn-submit"))
                                          ),
                                          tags$br(),
                                          div(textOutput("result10"), class = "result-box"),
                                          uiOutput("explanationBox10")
                                      )
                                  )
                              ),
                              
                              div(class = "panel panel-default",
                                  div(class = "panel-heading panel-heading-custom",
                                      h3(class = "panel-title panel-title-custom", "MATES item 11: Sensitivity analysis reporting"),
                                      tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item11", 
                                                  span(class = "glyphicon glyphicon-chevron-up"))
                                  ),
                                  div(id = "item11", class = "panel-collapse collapse in",
                                      div(class = "panel-body",
                                          p(tags$u("Question")),
                                          p("Do the authors report a sensitivity analysis or subset analysis in addition to the publication bias assessment (e.g., leave-one-out analysis, use of alternative model or within-study risk of bias assessment) in the manuscript or supplementary material?"),
                                          p(tags$u("Criteria for ‘Yes’")),
                                          p("The authors reported a sensitivity analysis in addition to the publication bias assessment in the manuscript or supplementary material."),
                                          p(tags$u("Criteria for ‘No’")),
                                          p("The authors have not reported a sensitivity analysis in addition to the publication bias assessment in the manuscript or supplementary material."),
                                          tags$br(),
                                          div(style = "display: flex; align-items: center; gap: 10px;",
                                              actionButton("yes11", "Yes", class = "btn-custom group11", onclick = "toggleCheckbox(this, 'group11')"),
                                              actionButton("no11", "No", class = "btn-custom group11", onclick = "toggleCheckbox(this, 'group11')"),
                                              div(style = "margin-left: auto;", actionButton("submit11", "Check Answer", class = "btn-custom btn-submit"))
                                          ),
                                          tags$br(),
                                          div(textOutput("result11"), class = "result-box"),
                                          uiOutput("explanationBox11")
                                      )
                                  )
                              ),
                              
                              div(class = "panel panel-default",
                                  div(class = "panel-heading panel-heading-custom",
                                      h3(class = "panel-title panel-title-custom", "MATES item 12: Code reporting"),
                                      tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item12", 
                                                  span(class = "glyphicon glyphicon-chevron-up"))
                                  ),
                                  div(id = "item12", class = "panel-collapse collapse in",
                                      div(class = "panel-body",
                                          p(tags$u("Question")),
                                          p("Do the authors report any relevant code used to conduct the analysis (i.e., used to conduct the computations, statistical models, and inferences comprising the meta-analysis) in the manuscript, supplementary material, or external repository?"),
                                          p(tags$u("Criteria for ‘Yes’")),
                                          p("The authors have reported any relevant code used to conduct the analysis in the manuscript, supplementary material, or external repository. Common examples of software used to perform meta-analysis, which can generate code or syntax, include R, Python, SPSS, and STATA."),
                                          p(tags$u("Criteria for ‘No’")),
                                          p("The authors have not reported any relevant code used to conduct the analysis in the manuscript, supplementary material, or external repository. Common examples of software used to perform meta-analysis, which can generate code or syntax, include R, Python, SPSS, and STATA."),
                                          p(tags$u("Criteria for ‘Not Applicable’")),
                                          p("The authors have used a GUI/click based software that does not produce a code or syntax (e.g., comprehensive meta-analysis software). Alternatively, the authors have not reported the software used to conduct the analysis (i.e., ‘No’ to MATES item 4)."),
                                          tags$br(),
                                          div(style = "display: flex; align-items: center; gap: 10px;",
                                              actionButton("yes12", "Yes", class = "btn-custom group12", onclick = "toggleCheckbox(this, 'group12')"),
                                              actionButton("no12", "No", class = "btn-custom group12", onclick = "toggleCheckbox(this, 'group12')"),
                                              actionButton("na12", "Not Applicable", class = "btn-custom group12", onclick = "toggleCheckbox(this, 'group12')"),
                                              div(style = "margin-left: auto;", actionButton("submit12", "Check Answer", class = "btn-custom btn-submit"))
                                          ),
                                          tags$br(),
                                          div(textOutput("result12"), class = "result-box"),
                                          uiOutput("explanationBox12")
                                      )
                                  )
                              ),
                              
                              div(class = "panel panel-default",
                                  div(class = "panel-heading panel-heading-custom",
                                      h3(class = "panel-title panel-title-custom", "MATES item 13: Data reporting/archiving"),
                                      tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item13", 
                                                  span(class = "glyphicon glyphicon-chevron-up"))
                                  ),
                                  div(id = "item13", class = "panel-collapse collapse in",
                                      div(class = "panel-body",
                                          p(tags$u("Question")),
                                          p("Do the authors report the raw data (i.e., used to calculate effect sizes and conduct the meta-analysis) extracted from each eligible primary study (i.e., research paper) in the manuscript, supplementary material, or external repository?"),
                                          p(tags$u("Criteria for ‘Yes’")),
                                          p("The authors have reported the raw data extracted from each eligible primary in the manuscript, supplementary material, or external repository. Alternatively, the authors may state that the raw data is sensitive and cannot be shared."),
                                          p(tags$u("Criteria for ‘No’")),
                                          p("The authors have not reported raw the data extracted from each eligible primary study the manuscript, supplementary material, or external repository. Alternatively, the authors may state the raw data is available upon request."),
                                          tags$br(),
                                          div(style = "display: flex; align-items: center; gap: 10px;",
                                              actionButton("yes13", "Yes", class = "btn-custom group13", onclick = "toggleCheckbox(this, 'group13')"),
                                              actionButton("no13", "No", class = "btn-custom group13", onclick = "toggleCheckbox(this, 'group13')"),
                                              div(style = "margin-left: auto;", actionButton("submit13", "Check Answer", class = "btn-custom btn-submit"))
                                          ),
                                          tags$br(),
                                          div(textOutput("result13"), class = "result-box"),
                                          uiOutput("explanationBox13")
                                      )
                                  )
                              ),
                              
                              div(class = "panel panel-default",
                                  div(class = "panel-heading panel-heading-custom",
                                      h3(class = "panel-title panel-title-custom", "MATES item 14: Variable description reporting"),
                                      tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item14", 
                                                  span(class = "glyphicon glyphicon-chevron-up"))
                                  ),
                                  div(id = "item14", class = "panel-collapse collapse in",
                                      div(class = "panel-body",
                                          p(tags$u("Question")),
                                          p("Do the authors report descriptions of the variables extracted (i.e., meta-data or columns in dataset) from each eligible study primary study (i.e., research paper) in the manuscript, supplementary material, or external repository?"),
                                          p(tags$u("Criteria for ‘Yes’")),
                                          p("The authors have reported descriptions of the variables extracted from each eligible study primary study in the manuscript, supplementary material, or external repository."),
                                          p(tags$u("Criteria for ‘No’")),
                                          p("The authors have not reported descriptions of the variables extracted from each eligible study primary study in the manuscript, supplementary material, or external repository."),
                                          p(tags$u("Criteria for ‘Not Applicable’")),
                                          p("The authors have reported that the data cannot be provided because the data is sensitive."),
                                          tags$br(),
                                          div(style = "display: flex; align-items: center; gap: 10px;",
                                              actionButton("yes14", "Yes", class = "btn-custom group14", onclick = "toggleCheckbox(this, 'group14')"),
                                              actionButton("no14", "No", class = "btn-custom group14", onclick = "toggleCheckbox(this, 'group14')"),
                                              div(style = "margin-left: auto;", actionButton("submit14", "Check Answer", class = "btn-custom btn-submit"))
                                          ),
                                          tags$br(),
                                          div(textOutput("result14"), class = "result-box"),
                                          uiOutput("explanationBox14")
                                      )
                                  )
                              
                              
                                  ),
                                  div(id = "Reset", class = "panel-collapse collapse in",
                                      div(class = "panel-body",
                                          actionButton("reset_button_test", "Reset All Answers", class = "btn-custom btn-danger")
                                      )

                            ))
                          )
                      )
                      ),
                      
             tabPanel("Apply",
                      div(class = "content-area",
                          div(class = "content-area",
                              sidebarLayout(
                                position = "right",
                                sidebarPanel(
                                  width = 3,
                                  class = "sidebar-panel",
                                  div(id = "glossary-docs",
                                      h3("Glossary"),
                                      tableOutput("glossary2")
                                  )
                                ),
                                mainPanel(
                                  width = 9,
                                  class = "main-panel-custom",
                                  h1("Meta-analysis Appraisal Tool for Environmental Sciences (MATES) Apply"),
                                  p("Here you can apply the MATES checklist to your own studies."),
                                  textAreaInput("study_name", "Study Name:", "", width = "50%"),
                                  textAreaInput("study_id", "Study Identifier:", "", width = "50%"),
                                  
                                  div(class = "panel panel-default",
                                      div(class = "panel-heading panel-heading-custom",
                                          h3(class = "panel-title panel-title-custom", "MATES checklist introduction"),
                                          tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#checklistIntro2", 
                                                      span(class = "glyphicon glyphicon-chevron-up"))
                                      ),
                                      div(id = "checklistIntro2", class = "panel-collapse collapse in",
                                          div(class = "panel-body",
                                              p("The MATES checklist provides a point-by-point appraisal of the reporting of methodological items in meta-analyses. To apply MATES to a meta-analysis, check whether each of the following items is present. Some MATES items have ‘Not Applicable’ criteria if a previous question needs to be reported or, a particular caveat makes an item not appropriate for assessment. For any studies that include multiple separate meta-analyses, complete the reporting appraisal for the first analysis (i.e., the analysis that comes first in the study being appraised). Please read the glossary of terms at the end of the checklist.")
                                          )
                                      )
                                  ),
                                  # MATES items
                                  div(class = "panel panel-default",
                                      div(class = "panel-heading panel-heading-custom",
                                          h3(class = "panel-title panel-title-custom", "MATES item 1: Effect size statistic formula reporting"),
                                          tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item1Apply", 
                                                      span(class = "glyphicon glyphicon-chevron-up"))
                                      ),
                                      div(id = "item1Apply", class = "panel-collapse collapse in",
                                          div(class = "panel-body",
                                              p(tags$u("Question")),
                                              p("Do the authors report the formula (or reference for formula) for the effect size statistic/measure used (e.g., Zr, Hedge’s g, Cohen’s d, or lnRR) in the manuscript or supplementary material?"),
                                              p(tags$u("Criteria for ‘Yes’")),
                                              p("The authors have reported the formula (or reference for the formula) for the effect size statistic/measure used in the manuscript or supplementary material."),
                                              p(tags$u("Criteria for ‘No’")),
                                              p("The authors have not reported the formula (or reference for the formula) for the effect size statistic/measure used in the manuscript or supplementary material."),
                                              p(tags$u("Criteria for ‘Not Applicable’")),
                                              p("The authors conducted an arms-based meta-analysis or extracted the effect sizes directly from the included primary studies."),
                                              tags$br(),
                                              div(style = "display: flex; align-items: center; gap: 10px;",
                                                  actionButton("yes1Apply", "Yes", class = "btn-custom group1", onclick = "toggleCheckbox(this, 'group1')"),
                                                  actionButton("no1Apply", "No", class = "btn-custom group1", onclick = "toggleCheckbox(this, 'group1')"),
                                                  actionButton("na1Apply", "Not Applicable", class = "btn-custom group1", onclick = "toggleCheckbox(this, 'group1')")
                                              ),
                                              tags$br(),
                                              textAreaInput("comment1Apply", "Comment:", "", width = "75%")
                                          )
                                      )
                                  ),
                                  
                                  # Repeat similar structure for each MATES item
                                  div(class = "panel panel-default",
                                      div(class = "panel-heading panel-heading-custom",
                                          h3(class = "panel-title panel-title-custom", "MATES item 2: Model type reporting"),
                                          tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item2Apply", 
                                                      span(class = "glyphicon glyphicon-chevron-up"))
                                      ),
                                      div(id = "item2Apply", class = "panel-collapse collapse in",
                                          div(class = "panel-body",
                                              p(tags$u("Question")),
                                              p("Do the authors report the type of the meta-analytic/meta-regression model (e.g., fixed, random, or multi-level models), either descriptively or in statistical notation in the manuscript or supplementary material?"),
                                              p(tags$u("Criteria for ‘Yes’")),
                                              p("The authors have reported the type of the meta-analytic/meta-regression model, either descriptively or in statistical notation in the manuscript or supplementary material."),
                                              p(tags$u("Criteria for ‘No’")),
                                              p("The authors have not reported the type of the meta-analytic/meta-regression model, either descriptively or in statistical notation in the manuscript or supplementary material."),
                                              tags$br(),
                                              div(style = "display: flex; align-items: center; gap: 10px;",
                                                  actionButton("yes2Apply", "Yes", class = "btn-custom group2", onclick = "toggleCheckbox(this, 'group2')"),
                                                  actionButton("no2Apply", "No", class = "btn-custom group2", onclick = "toggleCheckbox(this, 'group2')")
                                              ),
                                              tags$br(),
                                              textAreaInput("comment2Apply", "Comment:", "", width = "75%")
                                          )
                                      )
                                  ),
                                  
                                  div(class = "panel panel-default",
                                      div(class = "panel-heading panel-heading-custom",
                                          h3(class = "panel-title panel-title-custom", "MATES item 3: Effect size dependence (non-independence) reporting"),
                                          tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item3Apply", 
                                                      span(class = "glyphicon glyphicon-chevron-up"))
                                      ),
                                      div(id = "item3Apply", class = "panel-collapse collapse in",
                                          div(class = "panel-body",
                                              p(tags$u("Question")),
                                              p("Do the authors report the dependence (e.g., multiplicity or, repeated measure) of effect size estimates (e.g., acknowledge multiple effect sizes were taken from a single study) in the manuscript or supplementary material?"),
                                              p(tags$u("Criteria for ‘Yes’")),
                                              p("The authors have reported whether there is dependence of effect size estimates in the manuscript or supplementary material. Alternatively, the authors may report effect size estimates are assumed to be independent."),
                                              p(tags$u("Criteria for ‘No’")),
                                              p("The authors have not reported whether there is dependence of effect size estimates in the manuscript or supplementary material."),
                                              p(tags$u("Criteria for ‘Not Applicable’")),
                                              p("The authors extracted one effect size per each primary study."),
                                              tags$br(),
                                              div(style = "display: flex; align-items: center; gap: 10px;",
                                                  actionButton("yes3Apply", "Yes", class = "btn-custom group3", onclick = "toggleCheckbox(this, 'group3')"),
                                                  actionButton("no3Apply", "No", class = "btn-custom group3", onclick = "toggleCheckbox(this, 'group3')"),
                                                  actionButton("na3Apply", "Not Applicable", class = "btn-custom group3", onclick = "toggleCheckbox(this, 'group3')")
                                              ),
                                              tags$br(),
                                              textAreaInput("comment3Apply", "Comment:", "", width = "75%")
                                          )
                                      )
                                  ),
                                  
                                  div(class = "panel panel-default",
                                      div(class = "panel-heading panel-heading-custom",
                                          h3(class = "panel-title panel-title-custom", "MATES item 4: Software/reporting tools"),
                                          tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item4Apply", 
                                                      span(class = "glyphicon glyphicon-chevron-up"))
                                      ),
                                      div(id = "item4Apply", class = "panel-collapse collapse in",
                                          div(class = "panel-body",
                                              p(tags$u("Question")),
                                              p("Do the authors report the name, or a reference to the software or programming language used to conduct the analysis (i.e., used to conduct the computations, statistical models, and inferences comprising the meta-analysis) in the manuscript or supplementary material?"),
                                              p(tags$u("Criteria for ‘Yes’")),
                                              p("The authors have reported the name, or a reference to the software or programming language used to conduct the analysis in the manuscript or supplementary material."),
                                              p(tags$u("Criteria for ‘No’")),
                                              p("The authors have not reported the name, or a reference to the software or programming language used to conduct the analysis in the manuscript or supplementary material."),
                                              tags$br(),
                                              div(style = "display: flex; align-items: center; gap: 10px;",
                                                  actionButton("yes4Apply", "Yes", class = "btn-custom group4", onclick = "toggleCheckbox(this, 'group4')"),
                                                  actionButton("no4Apply", "No", class = "btn-custom group4", onclick = "toggleCheckbox(this, 'group4')")
                                              ),
                                              tags$br(),
                                              textAreaInput("comment4Apply", "Comment:", "", width = "75%")
                                          )
                                      )
                                  ),
                                  
                                  div(class = "panel panel-default",
                                      div(class = "panel-heading panel-heading-custom",
                                          h3(class = "panel-title panel-title-custom", "MATES item 5: Number of included primary studies reporting"),
                                          tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item5Apply", 
                                                      span(class = "glyphicon glyphicon-chevron-up"))
                                      ),
                                      div(id = "item5Apply", class = "panel-collapse collapse in",
                                          div(class = "panel-body",
                                              p(tags$u("Question")),
                                              p("Do the authors report the total number of primary studies (i.e., separate individual articles) included in the meta-analysis in the manuscript or supplementary material?"),
                                              p(tags$u("Criteria for ‘Yes’")),
                                              p("The authors have reported the total number of primary studies synthesised in the meta-analysis in the manuscript or supplementary material. The total number of studies can be stated in a screening flowchart (e.g., PRISMA flowchart), or the authors can state the number of studies per subgroup analysis."),
                                              p(tags$u("Criteria for ‘No’")),
                                              p("The authors have not reported the total number of primary studies synthesised in the meta-analysis in the manuscript or supplementary material. The total number of studies cannot be inferred by counting from a forest plot, or from a provided dataset."),
                                              tags$br(),
                                              div(style = "display: flex; align-items: center; gap: 10px;",
                                                  actionButton("yes5Apply", "Yes", class = "btn-custom group5", onclick = "toggleCheckbox(this, 'group5')"),
                                                  actionButton("no5Apply", "No", class = "btn-custom group5", onclick = "toggleCheckbox(this, 'group5')")
                                              ),
                                              tags$br(),
                                              textAreaInput("comment5Apply", "Comment:", "", width = "75%")
                                          )
                                      )
                                  ),
                                  
                                  div(class = "panel panel-default",
                                      div(class = "panel-heading panel-heading-custom",
                                          h3(class = "panel-title panel-title-custom", "MATES item 6: Number of included effect sizes reporting"),
                                          tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item6Apply", 
                                                      span(class = "glyphicon glyphicon-chevron-up"))
                                      ),
                                      div(id = "item6Apply", class = "panel-collapse collapse in",
                                          div(class = "panel-body",
                                              p(tags$u("Question")),
                                              p("Do the authors report the total number of effect size estimates synthesised in the meta-analysis in the manuscript or supplementary material?"),
                                              p(tags$u("Criteria for ‘Yes’")),
                                              p("The authors have reported the total number of effect sizes estimates synthesised in the meta-analysis in the manuscript or supplementary material."),
                                              p(tags$u("Criteria for ‘No’")),
                                              p("The authors have not reported the total number of effect sizes synthesised in the meta-analysis in the manuscript or supplementary material. Alternatively, the total number of effect sizes can only be inferred by counting."),
                                              tags$br(),
                                              div(style = "display: flex; align-items: center; gap: 10px;",
                                                  actionButton("yes6Apply", "Yes", class = "btn-custom group6", onclick = "toggleCheckbox(this, 'group6')"),
                                                  actionButton("no6Apply", "No", class = "btn-custom group6", onclick = "toggleCheckbox(this, 'group6')")
                                              ),
                                              tags$br(),
                                              textAreaInput("comment6Apply", "Comment:", "", width = "75%")
                                          )
                                      )
                                  ),
                                  
                                  div(class = "panel panel-default",
                                      div(class = "panel-heading panel-heading-custom",
                                          h3(class = "panel-title panel-title-custom", "MATES item 7: Pooled mean effect reporting"),
                                          tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item7Apply", 
                                                      span(class = "glyphicon glyphicon-chevron-up"))
                                      ),
                                      div(id = "item7Apply", class = "panel-collapse collapse in",
                                          div(class = "panel-body",
                                              p(tags$u("Question")),
                                              p("Do the authors report the pooled mean effect of the meta-analysis/meta-regression using a plot, table or within text in the manuscript or supplementary material?"),
                                              p(tags$u("Criteria for ‘Yes’")),
                                              p("The authors reported the pooled mean effect of the meta-analysis/meta-regression in the text, or within a plot or table in the manuscript or supplementary material. The study may have reported a pooled mean effect for each subgroup analysis."),
                                              p(tags$u("Criteria for ‘No’")),
                                              p("The authors have not reported the pooled mean effect of the meta-analysis/meta-regression in the text, or within a plot or table in the manuscript or supplementary material."),
                                              tags$br(),
                                              div(style = "display: flex; align-items: center; gap: 10px;",
                                                  actionButton("yes7Apply", "Yes", class = "btn-custom group7", onclick = "toggleCheckbox(this, 'group7')"),
                                                  actionButton("no7Apply", "No", class = "btn-custom group7", onclick = "toggleCheckbox(this, 'group7')")
                                              ),
                                              tags$br(),
                                              textAreaInput("comment7Apply", "Comment:", "", width = "75%")
                                          )
                                      )
                                  ),
                                  
                                  div(class = "panel panel-default",
                                      div(class = "panel-heading panel-heading-custom",
                                          h3(class = "panel-title panel-title-custom", "MATES item 8: Effect size weighting strategy reporting"),
                                          tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item8Apply", 
                                                      span(class = "glyphicon glyphicon-chevron-up"))
                                      ),
                                      div(id = "item8Apply", class = "panel-collapse collapse in",
                                          div(class = "panel-body",
                                              p(tags$u("Question")),
                                              p("Do the authors report the strategy used to assign weights (e.g., the sampling variance, sampling error or equivalent ) of effect size estimates in the manuscript or supplementary material?"),
                                              p(tags$u("Criteria for ‘Yes’")),
                                              p("The authors have reported the strategy used to assign weights of effect size estimates in the manuscript or supplementary material. The authors must report the weighting strategy and not solely the weights of each study."),
                                              p(tags$u("Criteria for ‘No’")),
                                              p("The authors have not reported the strategy used to assign weights of effect size estimates in the manuscript or supplementary material."),
                                              p(tags$u("Criteria for ‘Not Applicable’")),
                                              p("The authors have conducted a meta-analysis without weights (i.e., unweighted meta-analysis)."),
                                              tags$br(),
                                              div(style = "display: flex; align-items: center; gap: 10px;",
                                                  actionButton("yes8Apply", "Yes", class = "btn-custom group8", onclick = "toggleCheckbox(this, 'group8')"),
                                                  actionButton("no8Apply", "No", class = "btn-custom group8", onclick = "toggleCheckbox(this, 'group8')"),
                                                  actionButton("na8Apply", "Not Applicable", class = "btn-custom group8", onclick = "toggleCheckbox(this, 'group8')")
                                              ),
                                              tags$br(),
                                              textAreaInput("comment8Apply", "Comment:", "", width = "75%")
                                          )
                                      )
                                  ),
                                  
                                  div(class = "panel panel-default",
                                      div(class = "panel-heading panel-heading-custom",
                                          h3(class = "panel-title panel-title-custom", "MATES item 9: Heterogeneity reporting"),
                                          tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item9Apply", 
                                                      span(class = "glyphicon glyphicon-chevron-up"))
                                      ),
                                      div(id = "item9Apply", class = "panel-collapse collapse in",
                                          div(class = "panel-body",
                                              p(tags$u("Question")),
                                              p("Do the authors report an assessment of heterogeneity (e.g., I2, tau2, 𝜎2 or, Q-statistic) between effect size estimates for the primary or first analysis in the manuscript or supplementary material?"),
                                              p(tags$u("Criteria for ‘Yes’")),
                                              p("The authors have reported an assessment of heterogeneity between effect size estimates for the primary or first analysis in the manuscript or supplementary material."),
                                              p(tags$u("Criteria for ‘No’")),
                                              p("The authors have not reported an assessment of heterogeneity between effect size estimates for the primary or first analysis in the manuscript or supplementary material."),
                                              p(tags$u("Criteria for ‘Not Applicable’")),
                                              p("The study has stated that the analysis is unweighted."),
                                              tags$br(),
                                              div(style = "display: flex; align-items: center; gap: 10px;",
                                                  actionButton("yes9Apply", "Yes", class = "btn-custom group9", onclick = "toggleCheckbox(this, 'group9')"),
                                                  actionButton("no9Apply", "No", class = "btn-custom group9", onclick = "toggleCheckbox(this, 'group9')"),
                                                  actionButton("na9Apply", "Not Applicable", class = "btn-custom group9", onclick = "toggleCheckbox(this, 'group9')")
                                              ),
                                              tags$br(),
                                              textAreaInput("comment9Apply", "Comment:", "", width = "75%")
                                          )
                                      )
                                  ),
                                  
                                  div(class = "panel panel-default",
                                      div(class = "panel-heading panel-heading-custom",
                                          h3(class = "panel-title panel-title-custom", "MATES item 10: Publication bias reporting"),
                                          tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item10Apply", 
                                                      span(class = "glyphicon glyphicon-chevron-up"))
                                      ),
                                      div(id = "item10Apply", class = "panel-collapse collapse in",
                                          div(class = "panel-body",
                                              p(tags$u("Question")),
                                              p("Do the authors report a statistical or graphical assessment of publication bias in the manuscript or supplementary material?"),
                                              p(tags$u("Criteria for ‘Yes’")),
                                              p("The authors have reported a statistical or graphical assessment of publication bias in the manuscript or supplementary material."),
                                              p(tags$u("Criteria for ‘No’")),
                                              p("The authors have not reported a statistical or graphical assessment of publication bias in the manuscript or supplementary material."),
                                              p(tags$u("Criteria for ‘Not Applicable’")),
                                              p("The authors report that an assessment of publication bias cannot be conducted."),
                                              tags$br(),
                                              div(style = "display: flex; align-items: center; gap: 10px;",
                                                  actionButton("yes10Apply", "Yes", class = "btn-custom group10", onclick = "toggleCheckbox(this, 'group10')"),
                                                  actionButton("no10Apply", "No", class = "btn-custom group10", onclick = "toggleCheckbox(this, 'group10')"),
                                                  actionButton("na10Apply", "Not Applicable", class = "btn-custom group10", onclick = "toggleCheckbox(this, 'group10')")
                                              ),
                                              tags$br(),
                                              textAreaInput("comment10Apply", "Comment:", "", width = "75%")
                                          )
                                      )
                                  ),
                                  
                                  div(class = "panel panel-default",
                                      div(class = "panel-heading panel-heading-custom",
                                          h3(class = "panel-title panel-title-custom", "MATES item 11: Sensitivity analysis reporting"),
                                          tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item11Apply", 
                                                      span(class = "glyphicon glyphicon-chevron-up"))
                                      ),
                                      div(id = "item11Apply", class = "panel-collapse collapse in",
                                          div(class = "panel-body",
                                              p(tags$u("Question")),
                                              p("Do the authors report a sensitivity analysis or subset analysis in addition to the publication bias assessment (e.g., leave-one-out analysis, use of alternative model or within-study risk of bias assessment) in the manuscript or supplementary material?"),
                                              p(tags$u("Criteria for ‘Yes’")),
                                              p("The authors reported a sensitivity analysis in addition to the publication bias assessment in the manuscript or supplementary material."),
                                              p(tags$u("Criteria for ‘No’")),
                                              p("The authors have not reported a sensitivity analysis in addition to the publication bias assessment in the manuscript or supplementary material."),
                                              tags$br(),
                                              div(style = "display: flex; align-items: center; gap: 10px;",
                                                  actionButton("yes11Apply", "Yes", class = "btn-custom group11", onclick = "toggleCheckbox(this, 'group11')"),
                                                  actionButton("no11Apply", "No", class = "btn-custom group11", onclick = "toggleCheckbox(this, 'group11')")
                                              ),
                                              tags$br(),
                                              textAreaInput("comment11Apply", "Comment:", "", width = "75%")
                                          )
                                      )
                                  ),
                                  
                                  div(class = "panel panel-default",
                                      div(class = "panel-heading panel-heading-custom",
                                          h3(class = "panel-title panel-title-custom", "MATES item 12: Code reporting"),
                                          tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item12Apply", 
                                                      span(class = "glyphicon glyphicon-chevron-up"))
                                      ),
                                      div(id = "item12Apply", class = "panel-collapse collapse in",
                                          div(class = "panel-body",
                                              p(tags$u("Question")),
                                              p("Do the authors report any relevant code used to conduct the analysis (i.e., used to conduct the computations, statistical models, and inferences comprising the meta-analysis) in the manuscript, supplementary material, or external repository?"),
                                              p(tags$u("Criteria for ‘Yes’")),
                                              p("The authors have reported any relevant code used to conduct the analysis in the manuscript, supplementary material, or external repository. Common examples of software used to perform meta-analysis, which can generate code or syntax, include R, Python, SPSS, and STATA."),
                                              p(tags$u("Criteria for ‘No’")),
                                              p("The authors have not reported any relevant code used to conduct the analysis in the manuscript, supplementary material, or external repository. Common examples of software used to perform meta-analysis, which can generate code or syntax, include R, Python, SPSS, and STATA."),
                                              p(tags$u("Criteria for ‘Not Applicable’")),
                                              p("The authors have used a GUI/click based software that does not produce a code or syntax (e.g., comprehensive meta-analysis software). Alternatively, the authors have not reported the software used to conduct the analysis (i.e., ‘No’ to MATES item 4)."),
                                              tags$br(),
                                              div(style = "display: flex; align-items: center; gap: 10px;",
                                                  actionButton("yes12Apply", "Yes", class = "btn-custom group12", onclick = "toggleCheckbox(this, 'group12')"),
                                                  actionButton("no12Apply", "No", class = "btn-custom group12", onclick = "toggleCheckbox(this, 'group12')"),
                                                  actionButton("na12Apply", "Not Applicable", class = "btn-custom group12", onclick = "toggleCheckbox(this, 'group12')")
                                              ),
                                              tags$br(),
                                              textAreaInput("comment12Apply", "Comment:", "", width = "75%")
                                          )
                                      )
                                  ),
                                  
                                  div(class = "panel panel-default",
                                      div(class = "panel-heading panel-heading-custom",
                                          h3(class = "panel-title panel-title-custom", "MATES item 13: Data reporting/archiving"),
                                          tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item13Apply", 
                                                      span(class = "glyphicon glyphicon-chevron-up"))
                                      ),
                                      div(id = "item13Apply", class = "panel-collapse collapse in",
                                          div(class = "panel-body",
                                              p(tags$u("Question")),
                                              p("Do the authors report the raw data (i.e., used to calculate effect sizes and conduct the meta-analysis) extracted from each eligible primary study (i.e., research paper) in the manuscript, supplementary material, or external repository?"),
                                              p(tags$u("Criteria for ‘Yes’")),
                                              p("The authors have reported the raw data extracted from each eligible primary in the manuscript, supplementary material, or external repository. Alternatively, the authors may state that the raw data is sensitive and cannot be shared."),
                                              p(tags$u("Criteria for ‘No’")),
                                              p("The authors have not reported raw the data extracted from each eligible primary study the manuscript, supplementary material, or external repository. Alternatively, the authors may state the raw data is available upon request."),
                                              tags$br(),
                                              div(style = "display: flex; align-items: center; gap: 10px;",
                                                  actionButton("yes13Apply", "Yes", class = "btn-custom group13", onclick = "toggleCheckbox(this, 'group13')"),
                                                  actionButton("no13Apply", "No", class = "btn-custom group13", onclick = "toggleCheckbox(this, 'group13')")
                                              ),
                                              tags$br(),
                                              textAreaInput("comment13Apply", "Comment:", "", width = "75%")
                                          )
                                      )
                                  ),
                                  
                                  div(class = "panel panel-default",
                                      div(class = "panel-heading panel-heading-custom",
                                          h3(class = "panel-title panel-title-custom", "MATES item 14: Variable description reporting"),
                                          tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item14Apply", 
                                                      span(class = "glyphicon glyphicon-chevron-up"))
                                      ),
                                      div(id = "item14Apply", class = "panel-collapse collapse in",
                                          div(class = "panel-body",
                                              p(tags$u("Question")),
                                              p("Do the authors report descriptions of the variables extracted (i.e., meta-data or columns in dataset) from each eligible study primary study (i.e., research paper) in the manuscript, supplementary material, or external repository?"),
                                              p(tags$u("Criteria for ‘Yes’")),
                                              p("The authors have reported descriptions of the variables extracted from each eligible study primary study in the manuscript, supplementary material, or external repository."),
                                              p(tags$u("Criteria for ‘No’")),
                                              p("The authors have not reported descriptions of the variables extracted from each eligible study primary study in the manuscript, supplementary material, or external repository."),
                                              p(tags$u("Criteria for ‘Not Applicable’")),
                                              p("The authors have reported that the data cannot be provided because the data is sensitive."),
                                              tags$br(),
                                              div(style = "display: flex; align-items: center; gap: 10px;",
                                                  actionButton("yes14Apply", "Yes", class = "btn-custom group14", onclick = "toggleCheckbox(this, 'group14')"),
                                                  actionButton("no14Apply", "No", class = "btn-custom group14", onclick = "toggleCheckbox(this, 'group14')")
                                              ),
                                              tags$br(),
                                              textAreaInput("comment14Apply", "Comment:", "", width = "75%")
                                          )
                                      )
                                  ),
                                  
                                  # File operations
                                  div(class = "panel panel-default",
                                      div(class = "panel-heading panel-heading-custom",
                                          h3(class = "panel-title panel-title-custom", "Download & Reset"),
                                          tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#Download", 
                                                      span(class = "glyphicon glyphicon-chevron-up"))
                                      ),
                                      div(id = "Download", class = "panel-collapse collapse in",
                                          div(class = "panel-body",
                                              textAreaInput("filename", "Enter the name of the file:", value = "MATES_appraisal", width = "25%"),
                                              downloadButton("downloadCSV", "Download CSV", class = "btn-custom btn-selected"),
                                              actionButton("reset_button", "Reset All Answers", class = "btn-custom btn-danger")
                                          )
                                  )
                                )
                              )
                          )
                      )
             )
  )))


