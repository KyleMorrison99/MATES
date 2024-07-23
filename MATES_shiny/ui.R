pacman::p_load(shiny,
               shinydashboard,
               shinythemes,
               shinyjs,
               rsconnect)

# Define UI
ui <- fluidPage(
  useShinyjs(),  
  theme = shinytheme("darkly"),
  tags$head(
    tags$style(HTML('
      .correct {
        color: green;
        font-weight: bold;
      }
      .incorrect {
        color: red;
        font-weight: bold;
      }
      .btn-custom.btn-selected {
  background-color: #444444; /* Highlight color for selected button */
  color: #FFFFFF; /* White text color */
}

      /* Custom font styling */
      body, h1, h2, h3, h4, h5, h6, p {
        font-family: "Arial", sans-serif;
        color: #EAEAEA; /* Light grey text color */
        font-size: 18px; /* Increase font size */
      }
      
      /* Set consistent heading sizes */
      h1 {
        font-size: 32px;
        font-weight: bold;
      }
      h2 {
        font-size: 28px;
        font-weight: bold.
      }
      h3 {
        font-size: 24px;
        font-weight: bold.
      }
      h4 {
        font-size: 20px;
        font-weight: bold.
      }
      h5 {
        font-size: 18px;
        font-weight: bold.
      }
      h6 {
        font-size: 16px;
        font-weight: bold.
      }

      /* Set the height and width of the body and html to fill the viewport */
      html, body {
        height: 100%;
        width: 100%;
        margin: 0;
        padding: 0;
      }
     
      /* Set sidebar to a fixed width, adjust as necessary */
      .sidebar-panel-custom {
        display: flex;
        flex-direction: column;
        width: 500px; /* Adjust this value as needed */
      }
      
      /* Add spacing between buttons in Key Documents */
      .sidebar-panel-custom .btn-custom {
        margin-bottom: 10px; /* Adjust the value as needed */
      }

      /* Set sidebar to a fixed width, adjust as necessary */
      .sidebar-panel-custom1 {
        display: flex;
        margin-top: 263px; /* Adjust the value as needed */
        flex-direction: column;
        width: 600px; /* Adjust this value as needed */
      }
      
      /* Navbar styles */
      .navbar-nav > li > a {
        font-family: "Arial", sans-serif;
        font-weight: bold;
        color: #EAEAEA; /* Light grey text color */
      }
      .navbar-nav > li > a:hover {
        color: #FFFFFF; /* White text color on hover */
      }
      
      .navbar {
        min-height: 20px; /* Adjust this value as needed */
      }
      .navbar-nav > li > a, .navbar-brand {
        padding-top: 10px; /* Adjust this value as needed */
        padding-bottom: 10px; /* Adjust this value as needed */
      }
      .navbar .navbar-header {
        float: none;
        text-align: center;
        width: 100%;
      }
      .navbar .navbar-header .navbar-brand {
        float: none;
      }

      /* Button styles */
      .btn-custom {
        background-color: #222222; /* Dark background color */
        color: #EAEAEA; /* Light grey text color */
        border: none;
      }
      .btn-custom:hover {
        background-color: #1a1a1a; /* Slightly lighter dark color on hover */
        color: #FFFFFF; /* White text color on hover */
      }
      .btn-selected {
        background-color: #444444; /* Highlight color for selected button */
        color: #FFFFFF; /* White text color */
      }

      /* Footer styles */
      .footer {
        background-color: #333333;
        color: #EAEAEA;
        text-align: left;
        padding: 10px;
        position: fixed;
        bottom: 0;
        width: 100%;
      }

      /* Spacing between items */
      .mates-item {
        margin-bottom: 40px;
      }

      /* Larger text input */
      .form-control {
        height: 150px;
        font-size: 18px;
      }

      /* Collapsible panel styles */
      .panel {
        margin-bottom: 20px;
        border: 1px solid #444;
        border-radius: 4px;
        box-shadow: none;
      }
      .panel-heading {
        padding: 10px 15px;
        border-bottom: 1px solid transparent;
        border-top-left-radius: 3px;
        border-top-right-radius: 3px;
        cursor: pointer;
        display: flex;
        justify-content: space-between;
        align-items: center;
      }
      .panel-title {
        flex-grow: 1;
        font-size: 20px;
        font-weight: bold.;
      }
      .panel-body {
        padding: 15px;
        position: relative;
      }
      .btn-submit {
        position: absolute;
        bottom: 15px;
        right: 15px;
      }
      .result-box {
        margin-left: 15px;
        font-weight: bold;
      }
      .explanation-box {
        border-left: 2px solid #444;
        padding-left: 15px;
        margin-top: 15px;
        color: #CCCCCC;
      }

      /* Navbar right-aligned text */
      .navbar-right {
        float: right !important;
      }
      .navbar-right > li {
        padding-top: 10px;
        padding-bottom: 10px;
        font-size: 16px;
        font-weight: bold;
        color: #EAEAEA;
      }
    ')
    ),
    navbarPage("",
               tabPanel("Home",
                        div(class = "content-area",
                            sidebarLayout(
                              position = "right",
                              sidebarPanel(
                                class = "sidebar-panel-custom",
                                div(class = "panel panel-default",
                                    div(class = "panel-heading",
                                        h3(class = "panel-title", "Key Documents"),
                                        tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#documents", 
                                                    span(class = "glyphicon glyphicon-chevron-up"))
                                    ),
                                    div(id = "documents", class = "panel-collapse collapse in",
                                        div(class = "panel-body",
                                            downloadButton("downloadMATES", "Download MATES Checklist", class = "btn-custom"),
                                            downloadButton("downloadPRISMA", "Download PRISMA Statement", class = "btn-custom"),
                                            downloadButton("downloadGUIDE", "Download Explanation & Elaboration", class = "btn-custom")
                                        )
                                    )
                                )
                              ),
                              mainPanel(
                                class = "main-panel-custom",
                                h1("MATES: Meta-analysis Appraisal Tool for Environmental Sciences"),
                                tags$br(),
                                h3("MATES is a community-developed appraisal tool designed to evaluate the reporting quality of meta-analyses. It consists of 14 appraisal items proposed and assessed by the meta-analysis community within environmental sciences. The assessment with MATES is binary, indicating whether each item is present in the manuscript."),
                                h3("The primary users of MATES are researchers, editors, and reviewers who aim to assess the reporting quality of meta-analyses. Although MATES was primarily developed by environmental scientists, it is applicable across various disciplines where meta-analysis is employed."),
                                tags$br(),
                                h2("The MATES Shiny app contains four primary sections:"),
                                tags$ul(
                                  tags$li(h3("An about page describing the use case for MATES and the community-driven development process.")),
                                  tags$li(h3("Multiple translations of MATES including French, Spanish, Portuguese, Italian, Simplified and Traditional Chinese, Japanese, Russian, and Polish.")),
                                  tags$li(h3("A training tool for MATES to improve the repeatability of appraisal outcomes.")),
                                  tags$li(h3("An application tool for MATES to use in applying the tool for your own appraisal."))
                                )
                              )
                              
                            )
                        )
               ),
               tabPanel("About", "This panel is intentionally left blank"),
               tabPanel("Translations",
                        div(class = "content-area",
                            mainPanel(
                              class = "main-panel-custom",
                              h1("MATES Translations"),
                              h3(style = "font-size: 20px; color: #CCCCCC; margin-bottom: 30px;", 
                                 HTML('Several translations of the MATES checklist are available. These have been translated by kind volunteers and are freely available below. If you are interested in translating a MATES checklist or other document, please email the lead author at <a href="mailto:kyle.morrison@unsw.edu.au">kyle.morrison@unsw.edu.au</a>.')
                              ),
                              h2("MATES Translation Links"),
                              div(class = "translation-links",
                                  tags$style(HTML('
          .translation-links a {
            display: block;
            font-size: 20px; /* Increase font size */
            margin: 10px 0; /* Add space between links */
            text-decoration: none; /* Remove underline */
            color: #00BFFF; /* Link color */
          }
          .translation-links a:hover {
            color: #FFFFFF; /* White text color on hover */
          }
        ')),
                                  a(href = "#", "Chinese (Simplified) Checklist"),
                                  a(href = "#", "Chinese (Traditional) Checklist"),
                                  a(href = "#", "French Checklist"),
                                  a(href = "#", "Japanese Checklist"),
                                  a(href = "#", "Italian Checklist"),
                                  a(href = "#", "Polish Checklist"),
                                  a(href = "#", "Russian Checklist"),
                                  a(href = "#", "Spanish Checklist")
                              )
                            )
                        )
               ),
               tabPanel("Trainer",
                        div(class = "content-area",
                            sidebarLayout(
                              position = "right",
                              sidebarPanel(
                                class = "sidebar-panel-custom1",
                                width = 4,  # Increase this value to make the sidebar wider
                                div(class = "panel panel-default",
                                    div(class = "panel-heading",
                                        h3(class = "panel-title", "Glossary"),
                                        tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#glossaryTable", 
                                                    span(class = "glyphicon glyphicon-chevron-down"))
                                    ),
                                    div(id = "glossaryTable", class = "panel-collapse collapse",
                                        div(class = "panel-body",
                                            tags$style(HTML('
                  table {
                      width: 100%;
                      border-collapse: collapse;
                  }
                  th, td {
                      border: 1px solid #ffffff;  /* White table lines */
                      text-align: left;
                      padding: 8px;
                  }
                  th {
                      font-weight: bold;
                  }
              ')),
                                            tableOutput("glossary")
                                        )
                                    )
                                )
                              ),
                              mainPanel(
                                class = "main-panel-custom",
                                width = 8,  # Increase this value to make the sidebar wider
                                
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
                                div(class = "mates-item panel panel-default",
                                    div(class = "panel-heading",
                                        h3(class = "panel-title", "MATES checklist introduction"),
                                        tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#checklistIntro", 
                                                    span(class = "glyphicon glyphicon-chevron-up"))
                                    ),
                                    div(id = "checklistIntro", class = "panel-collapse collapse in",
                                        div(class = "panel-body",
                                            p("The MATES checklist provides a point-by-point appraisal of the reporting of methodological items in meta-analyses. To apply MATES to a meta-analysis, check whether each of the following items is present. Some MATES items have ‘Not Applicable’ criteria if a previous question needs to be reported or, a particular caveat makes an item not appropriate for assessment. For any studies that include multiple separate meta-analyses, complete the reporting appraisal for the first analysis (i.e., the analysis that comes first in the study being appraised). Please read the glossary of terms at the end of the checklist.")
                                        )
                                    )
                                ),
                                h1("Meta-analysis Appraisal Tool for Environmental Sciences (MATES) checklist"),
                                
                                # MATES items with collapsible panels
                                div(class = "mates-item panel panel-default",
                                    div(class = "panel-heading",
                                        h3(class = "panel-title", "MATES item 1: Effect size statistic formula reporting"),
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
                                                actionButton("yes1", "Yes", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("no1", "No", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("na1", "Not Applicable", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("submit1", "Check Answer", class = "btn-custom btn-submit")
                                            ),
                                            tags$br(),
                                            div(textOutput("result1"), class = "result-box"),
                                            textAreaInput("comment1", "Comment:", "", width = "75%"),
                                            uiOutput("explanationBox1")
                                        )
                                    )
                                ),
                                div(class = "mates-item panel panel-default",
                                    div(class = "panel-heading",
                                        h3(class = "panel-title", "MATES item 2: Model type reporting"),
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
                                                actionButton("yes2", "Yes", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("no2", "No", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("submit2", "Check Answer", class = "btn-custom btn-submit")
                                            ),
                                            tags$br(),
                                            div(textOutput("result2"), class = "result-box"),
                                            textAreaInput("comment2", "Comment:", "", width = "75%"),
                                            uiOutput("explanationBox2")
                                        )
                                    )
                                ),
                                div(class = "mates-item panel panel-default",
                                    div(class = "panel-heading",
                                        h3(class = "panel-title", "MATES item 3: Effect size dependence (non-independence) reporting"),
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
                                                actionButton("yes3", "Yes", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("no3", "No", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("na3", "Not Applicable", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("submit3", "Check Answer", class = "btn-custom btn-submit")
                                            ),
                                            tags$br(),
                                            div(textOutput("result3"), class = "result-box"),
                                            textAreaInput("comment3", "Comment:", "", width = "75%"),
                                            uiOutput("explanationBox3")
                                        )
                                    )
                                ),
                                div(class = "mates-item panel panel-default",
                                    div(class = "panel-heading",
                                        h3(class = "panel-title", "MATES item 4: Software reporting"),
                                        tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item4", 
                                                    span(class = "glyphicon glyphicon-up"))
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
                                                actionButton("yes4", "Yes", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("no4", "No", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("submit4", "Check Answer", class = "btn-custom btn-submit")
                                            ),
                                            tags$br(),
                                            div(textOutput("result4"), class = "result-box"),
                                            textAreaInput("comment4", "Comment:", "", width = "75%"),
                                            uiOutput("explanationBox4")
                                        )
                                    )
                                ),
                                div(class = "mates-item panel panel-default",
                                    div(class = "panel-heading",
                                        h3(class = "panel-title", "MATES item 5: Number of included primary studies reporting"),
                                        tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item5", 
                                                    span(class = "glyphicon glyphicon-up"))
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
                                                actionButton("yes5", "Yes", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("no5", "No", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("submit5", "Check Answer", class = "btn-custom btn-submit")
                                            ),
                                            tags$br(),
                                            div(textOutput("result5"), class = "result-box"),
                                            textAreaInput("comment5", "Comment:", "", width = "75%"),
                                            uiOutput("explanationBox5")
                                        )
                                    )
                                ),
                                div(class = "mates-item panel panel-default",
                                    div(class = "panel-heading",
                                        h3(class = "panel-title", "MATES item 6: Number of included effect sizes reporting"),
                                        tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item6", 
                                                    span(class = "glyphicon glyphicon-up"))
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
                                                actionButton("yes6", "Yes", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("no6", "No", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("submit6", "Check Answer", class = "btn-custom btn-submit")
                                            ),
                                            tags$br(),
                                            div(textOutput("result6"), class = "result-box"),
                                            textAreaInput("comment6", "Comment:", "", width = "75%"),
                                            uiOutput("explanationBox6")
                                        )
                                    )
                                ),
                                div(class = "mates-item panel panel-default",
                                    div(class = "panel-heading",
                                        h3(class = "panel-title", "MATES item 7: Pooled mean effect reporting"),
                                        tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item7", 
                                                    span(class = "glyphicon glyphicon-up"))
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
                                                actionButton("yes7", "Yes", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("no7", "No", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("submit7", "Check Answer", class = "btn-custom btn-submit")
                                            ),
                                            tags$br(),
                                            div(textOutput("result7"), class = "result-box"),
                                            textAreaInput("comment7", "Comment:", "", width = "75%"),
                                            uiOutput("explanationBox7")
                                        )
                                    )
                                ),
                                div(class = "mates-item panel panel-default",
                                    div(class = "panel-heading",
                                        h3(class = "panel-title", "MATES item 8: Effect size weighting strategy reporting"),
                                        tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item8", 
                                                    span(class = "glyphicon glyphicon-up"))
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
                                                actionButton("yes8", "Yes", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("no8", "No", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("na8", "Not Applicable", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("submit8", "Check Answer", class = "btn-custom btn-submit")
                                            ),
                                            tags$br(),
                                            div(textOutput("result8"), class = "result-box"),
                                            textAreaInput("comment8", "Comment:", "", width = "75%"),
                                            uiOutput("explanationBox8")
                                        )
                                    )
                                ),
                                div(class = "mates-item panel panel-default",
                                    div(class = "panel-heading",
                                        h3(class = "panel-title", "MATES item 9: Heterogeneity reporting"),
                                        tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item9", 
                                                    span(class = "glyphicon glyphicon-up"))
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
                                                actionButton("yes9", "Yes", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("no9", "No", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("na9", "Not Applicable", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("submit9", "Check Answer", class = "btn-custom btn-submit")
                                            ),
                                            tags$br(),
                                            div(textOutput("result9"), class = "result-box"),
                                            textAreaInput("comment9", "Comment:", "", width = "75%"),
                                            uiOutput("explanationBox9")
                                        )
                                    )
                                ),
                                div(class = "mates-item panel panel-default",
                                    div(class = "panel-heading",
                                        h3(class = "panel-title", "MATES item 10: Publication bias reporting"),
                                        tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item10", 
                                                    span(class = "glyphicon glyphicon-up"))
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
                                                actionButton("yes10", "Yes", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("no10", "No", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("na10", "Not Applicable", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("submit10", "Check Answer", class = "btn-custom btn-submit")
                                            ),
                                            tags$br(),
                                            div(textOutput("result10"), class = "result-box"),
                                            textAreaInput("comment10", "Comment:", "", width = "75%"),
                                            uiOutput("explanationBox10")
                                        )
                                    )
                                ),
                                div(class = "mates-item panel panel-default",
                                    div(class = "panel-heading",
                                        h3(class = "panel-title", "MATES item 11: Sensitivity analysis reporting"),
                                        tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item11", 
                                                    span(class = "glyphicon glyphicon-up"))
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
                                                actionButton("yes11", "Yes", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("no11", "No", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("submit11", "Check Answer", class = "btn-custom btn-submit")
                                            ),
                                            tags$br(),
                                            div(textOutput("result11"), class = "result-box"),
                                            textAreaInput("comment11", "Comment:", "", width = "75%"),
                                            uiOutput("explanationBox11")
                                        )
                                    )
                                ),
                                div(class = "mates-item panel panel-default",
                                    div(class = "panel-heading",
                                        h3(class = "panel-title", "MATES item 12: Code reporting"),
                                        tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item12", 
                                                    span(class = "glyphicon glyphicon-up"))
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
                                                actionButton("yes12", "Yes", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("no12", "No", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("na12", "Not Applicable", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("submit12", "Check Answer", class = "btn-custom btn-submit")
                                            ),
                                            tags$br(),
                                            div(textOutput("result12"), class = "result-box"),
                                            textAreaInput("comment12", "Comment:", "", width = "75%"),
                                            uiOutput("explanationBox12")
                                        )
                                    )
                                ),
                                div(class = "mates-item panel panel-default",
                                    div(class = "panel-heading",
                                        h3(class = "panel-title", "MATES item 13: Data reporting/archiving"),
                                        tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item13", 
                                                    span(class = "glyphicon glyphicon-up"))
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
                                                actionButton("yes13", "Yes", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("no13", "No", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("submit13", "Check Answer", class = "btn-custom btn-submit")
                                            ),
                                            tags$br(),
                                            div(textOutput("result13"), class = "result-box"),
                                            textAreaInput("comment13", "Comment:", "", width = "75%"),
                                            uiOutput("explanationBox13")
                                        )
                                    )
                                ),
                                div(class = "mates-item panel panel-default",
                                    div(class = "panel-heading",
                                        h3(class = "panel-title", "MATES item 14: Variable description reporting"),
                                        tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item14", 
                                                    span(class = "glyphicon glyphicon-up"))
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
                                                actionButton("yes14", "Yes", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("no14", "No", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("submit14", "Check Answer", class = "btn-custom btn-submit")
                                            ),
                                            tags$br(),
                                            div(textOutput("result14"), class = "result-box"),
                                            textAreaInput("comment14", "Comment:", "", width = "75%"),
                                            uiOutput("explanationBox14")
                                        )
                                    )
                                )
                              )
                            )
                        )
               ),
               tabPanel("Apply",
                        div(class = "content-area",
                            sidebarLayout(
                              position = "right",
                              sidebarPanel(
                                class = "sidebar-panel-custom1",
                                div(class = "panel panel-default",
                                    div(class = "panel-heading",
                                        h3(class = "panel-title", "Glossary"),
                                        tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#glossaryTableApply", 
                                                    span(class = "glyphicon glyphicon-chevron-down"))
                                    ),
                                    div(id = "glossaryTableApply", class = "panel-collapse collapse",
                                        div(class = "panel-body",
                                            tableOutput("glossaryApply")
                                        )
                                    )
                                )
                              ),
                              mainPanel(
                                class = "main-panel-custom",
                                h1("Meta-analysis Appraisal Tool for Environmental Sciences (MATES) Apply"),
                                p("Here you can apply the MATES checklist to your own studies."),
                                textAreaInput("study_name", "Study Name:", "", width = "50%"),
                                textAreaInput("study_id", "Study Identifier:", "", width = "25%"),
                                h1("Meta-analysis Appraisal Tool for Environmental Sciences (MATES) checklist"),
                                # MATES items with collapsible panels
                                div(class = "mates-item panel panel-default",
                                    div(class = "panel-heading",
                                        h3(class = "panel-title", "MATES item 1: Effect size statistic formula reporting"),
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
                                                actionButton("yes1Apply", "Yes", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("no1Apply", "No", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("na1Apply", "Not Applicable", class = "btn-custom", onclick = "toggleSelected(this)")
                                            ),
                                            tags$br(),
                                            textAreaInput("comment1Apply", "Comment:", "", width = "75%")
                                        )
                                    )
                                ),
                                div(class = "mates-item panel panel-default",
                                    div(class = "panel-heading",
                                        h3(class = "panel-title", "MATES item 2: Model type reporting"),
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
                                                actionButton("yes2Apply", "Yes", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("no2Apply", "No", class = "btn-custom", onclick = "toggleSelected(this)")
                                            ),
                                            tags$br(),
                                            textAreaInput("comment2Apply", "Comment:", "", width = "75%")
                                        )
                                    )
                                ),
                                div(class = "mates-item panel panel-default",
                                    div(class = "panel-heading",
                                        h3(class = "panel-title", "MATES item 3: Effect size dependence (non-independence) reporting"),
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
                                                actionButton("yes3Apply", "Yes", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("no3Apply", "No", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("na3Apply", "Not Applicable", class = "btn-custom", onclick = "toggleSelected(this)")
                                            ),
                                            tags$br(),
                                            textAreaInput("comment3Apply", "Comment:", "", width = "75%")
                                        )
                                    )
                                ),
                                div(class = "mates-item panel panel-default",
                                    div(class = "panel-heading",
                                        h3(class = "panel-title", "MATES item 4: Software reporting"),
                                        tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item4Apply", 
                                                    span(class = "glyphicon glyphicon-up"))
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
                                                actionButton("yes4Apply", "Yes", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("no4Apply", "No", class = "btn-custom", onclick = "toggleSelected(this)")
                                            ),
                                            tags$br(),
                                            textAreaInput("comment4Apply", "Comment:", "", width = "75%")
                                        )
                                    )
                                ),
                                div(class = "mates-item panel panel-default",
                                    div(class = "panel-heading",
                                        h3(class = "panel-title", "MATES item 5: Number of included primary studies reporting"),
                                        tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item5Apply", 
                                                    span(class = "glyphicon glyphicon-up"))
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
                                                actionButton("yes5Apply", "Yes", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("no5Apply", "No", class = "btn-custom", onclick = "toggleSelected(this)")
                                            ),
                                            tags$br(),
                                            textAreaInput("comment5Apply", "Comment:", "", width = "75%")
                                        )
                                    )
                                ),
                                div(class = "mates-item panel panel-default",
                                    div(class = "panel-heading",
                                        h3(class = "panel-title", "MATES item 6: Number of included effect sizes reporting"),
                                        tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item6Apply", 
                                                    span(class = "glyphicon glyphicon-up"))
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
                                                actionButton("yes6Apply", "Yes", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("no6Apply", "No", class = "btn-custom", onclick = "toggleSelected(this)")
                                            ),
                                            tags$br(),
                                            textAreaInput("comment6Apply", "Comment:", "", width = "75%")
                                        )
                                    )
                                ),
                                div(class = "mates-item panel panel-default",
                                    div(class = "panel-heading",
                                        h3(class = "panel-title", "MATES item 7: Pooled mean effect reporting"),
                                        tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item7Apply", 
                                                    span(class = "glyphicon glyphicon-up"))
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
                                                actionButton("yes7Apply", "Yes", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("no7Apply", "No", class = "btn-custom", onclick = "toggleSelected(this)")
                                            ),
                                            tags$br(),
                                            textAreaInput("comment7Apply", "Comment:", "", width = "75%")
                                        )
                                    )
                                ),
                                div(class = "mates-item panel panel-default",
                                    div(class = "panel-heading",
                                        h3(class = "panel-title", "MATES item 8: Effect size weighting strategy reporting"),
                                        tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item8Apply", 
                                                    span(class = "glyphicon glyphicon-up"))
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
                                                actionButton("yes8Apply", "Yes", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("no8Apply", "No", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("na8Apply", "Not Applicable", class = "btn-custom", onclick = "toggleSelected(this)")
                                            ),
                                            tags$br(),
                                            textAreaInput("comment8Apply", "Comment:", "", width = "75%")
                                        )
                                    )
                                ),
                                div(class = "mates-item panel panel-default",
                                    div(class = "panel-heading",
                                        h3(class = "panel-title", "MATES item 9: Heterogeneity reporting"),
                                        tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item9Apply", 
                                                    span(class = "glyphicon glyphicon-up"))
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
                                                actionButton("yes9Apply", "Yes", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("no9Apply", "No", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("na9Apply", "Not Applicable", class = "btn-custom", onclick = "toggleSelected(this)")
                                            ),
                                            tags$br(),
                                            textAreaInput("comment9Apply", "Comment:", "", width = "75%")
                                        )
                                    )
                                ),
                                div(class = "mates-item panel panel-default",
                                    div(class = "panel-heading",
                                        h3(class = "panel-title", "MATES item 10: Publication bias reporting"),
                                        tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item10Apply", 
                                                    span(class = "glyphicon glyphicon-up"))
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
                                                actionButton("yes10Apply", "Yes", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("no10Apply", "No", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("na10Apply", "Not Applicable", class = "btn-custom", onclick = "toggleSelected(this)")
                                            ),
                                            tags$br(),
                                            textAreaInput("comment10Apply", "Comment:", "", width = "75%")
                                        )
                                    )
                                ),
                                div(class = "mates-item panel panel-default",
                                    div(class = "panel-heading",
                                        h3(class = "panel-title", "MATES item 11: Sensitivity analysis reporting"),
                                        tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item11Apply", 
                                                    span(class = "glyphicon glyphicon-up"))
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
                                                actionButton("yes11Apply", "Yes", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("no11Apply", "No", class = "btn-custom", onclick = "toggleSelected(this)")
                                            ),
                                            tags$br(),
                                            textAreaInput("comment11Apply", "Comment:", "", width = "75%")
                                        )
                                    )
                                ),
                                div(class = "mates-item panel panel-default",
                                    div(class = "panel-heading",
                                        h3(class = "panel-title", "MATES item 12: Code reporting"),
                                        tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item12Apply", 
                                                    span(class = "glyphicon glyphicon-up"))
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
                                                actionButton("yes12Apply", "Yes", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("no12Apply", "No", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("na12Apply", "Not Applicable", class = "btn-custom", onclick = "toggleSelected(this)")
                                            ),
                                            tags$br(),
                                            textAreaInput("comment12Apply", "Comment:", "", width = "75%")
                                        )
                                    )
                                ),
                                div(class = "mates-item panel panel-default",
                                    div(class = "panel-heading",
                                        h3(class = "panel-title", "MATES item 13: Data reporting/archiving"),
                                        tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item13Apply", 
                                                    span(class = "glyphicon glyphicon-up"))
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
                                                actionButton("yes13Apply", "Yes", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("no13Apply", "No", class = "btn-custom", onclick = "toggleSelected(this)")
                                            ),
                                            tags$br(),
                                            textAreaInput("comment13Apply", "Comment:", "", width = "75%")
                                        )
                                    )
                                ),
                                div(class = "mates-item panel panel-default",
                                    div(class = "panel-heading",
                                        h3(class = "panel-title", "MATES item 14: Variable description reporting"),
                                        tags$button(type = "button", class = "btn btn-default btn-xs", 'data-toggle' = "collapse", 'data-target' = "#item14Apply", 
                                                    span(class = "glyphicon glyphicon-up"))
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
                                                actionButton("yes14Apply", "Yes", class = "btn-custom", onclick = "toggleSelected(this)"),
                                                actionButton("no14Apply", "No", class = "btn-custom", onclick = "toggleSelected(this)")
                                            ),
                                            tags$br(),
                                            textAreaInput("comment14Apply", "Comment:", "", width = "75%")
                                        )
                                    )
                                ),
                                textAreaInput("filename", "Enter the name of the file:", value = "MATES_appraisal", width = "25%"), # Add this line
                                downloadButton("downloadCSV", "Download CSV", class = " .btn-custom.btn-selected"), # Add this line
                                actionButton("reset_button", "Reset All Answers", class = "btn-custom btn-danger") # Add this line
                              )
                            )
                        )
               )
    )))

# Define server logic
server <- function(input, output, session) {
  # Define download handlers
  output$downloadMATES <- downloadHandler(
    filename = function() {
      "MATES_Checklist_english.pdf"
    },
    content = function(file) {
      file.copy("MATES_Analysis/MATES_shiny/MATES_checklist.pdf", file)
    }
  )
  
  output$downloadPRISMA <- downloadHandler(
    filename = function() {
      "PRISMA_Statement.pdf"
    },
    content = function(file) {
      file.copy("www/PRISMA_Statement.pdf", file)
    },
    contentType = "application/pdf"
  )
  
  output$downloadGUIDE <- downloadHandler(
    filename = function() {
      "Explanation_and_Elaboration.pdf"
    },
    content = function(file) {
      file.copy("www/Explanation_and_Elaboration.pdf", file)
    },
    contentType = "application/pdf"
  )
  
  # Observe the study button and open the selected study link
  observeEvent(input$study_button, {
    url <- switch(input$study_selector,
                  study1 = "https://github.com/Yefeng0920/ALAN_MEL/tree/main/data",
                  study2 = "https://example.com/study2",
                  study3 = "https://example.com/study3",
                  study4 = "https://example.com/study4",
                  study5 = "https://example.com/study5")
    shinyjs::runjs(sprintf("window.open('%s', '_blank')", url))
  })
  
  # Define correct answers for each study
  correct_answers <- list(
    study1 = list(
      item1 = "yes",
      item2 = "yes",
      item3 = "yes",
      item4 = "yes",
      item5 = "yes",
      item6 = "yes",
      item7 = "yes",
      item8 = "yes",
      item9 = "yes",
      item10 = "yes",
      item11 = "yes",
      item12 = "yes",
      item13 = "yes",
      item14 = "yes"
    ),
    study2 = list(
      item1 = "no",
      item2 = "no",
      item3 = "no",
      item4 = "no",
      item5 = "no",
      item6 = "no",
      item7 = "no",
      item8 = "no",
      item9 = "no",
      item10 = "no",
      item11 = "no",
      item12 = "no",
      item13 = "no",
      item14 = "no"
    ),
    study3 = list(
      item1 = "na",
      item2 = "na",
      item3 = "na",
      item4 = "na",
      item5 = "na",
      item6 = "na",
      item7 = "na",
      item8 = "na",
      item9 = "na",
      item10 = "na",
      item11 = "na",
      item12 = "na",
      item13 = "na",
      item14 = "na"
    ),
    study4 = list(
      item1 = "yes",
      item2 = "no",
      item3 = "yes",
      item4 = "no",
      item5 = "yes",
      item6 = "no",
      item7 = "yes",
      item8 = "no",
      item9 = "yes",
      item10 = "no",
      item11 = "yes",
      item12 = "no",
      item13 = "yes",
      item14 = "no"
    ),
    study5 = list(
      item1 = "no",
      item2 = "yes",
      item3 = "no",
      item4 = "yes",
      item5 = "no",
      item6 = "yes",
      item7 = "no",
      item8 = "yes",
      item9 = "no",
      item10 = "yes",
      item11 = "no",
      item12 = "yes",
      item13 = "no",
      item14 = "yes"
    )
  )
  
  # Explanation for each incorrect answer for each study
  explanations <- list(
    study1 = list(
      item1 = "The correct answer is 'Yes' because the authors reported the formula or reference for the formula for the effect size statistic/measure used.",
      item2 = "The correct answer is 'Yes' because the authors reported the type of the meta-analytic/meta-regression model used.",
      item3 = "The correct answer is 'Yes' because the authors reported whether there is dependence of effect size estimates.",
      item4 = "The correct answer is 'Yes' because the authors reported the name or reference to the software or programming language used to conduct the analysis.",
      item5 = "The correct answer is 'Yes' because the authors reported the total number of primary studies included in the meta-analysis.",
      item6 = "The correct answer is 'Yes' because the authors reported the total number of effect size estimates synthesized in the meta-analysis.",
      item7 = "The correct answer is 'Yes' because the authors reported the pooled mean effect of the meta-analysis/meta-regression.",
      item8 = "The correct answer is 'Yes' because the authors reported the strategy used to assign weights of effect size estimates.",
      item9 = "The correct answer is 'Yes' because the authors reported an assessment of heterogeneity between effect size estimates.",
      item10 = "The correct answer is 'Yes' because the authors reported a statistical or graphical assessment of publication bias.",
      item11 = "The correct answer is 'Yes' because the authors reported a sensitivity analysis in addition to the publication bias assessment.",
      item12 = "The correct answer is 'Yes' because the authors reported any relevant code used to conduct the analysis.",
      item13 = "The correct answer is 'Yes' because the authors reported the raw data extracted from each eligible primary study.",
      item14 = "The correct answer is 'Yes' because the authors reported descriptions of the variables extracted from each eligible study primary study."
    ),
    study2 = list(
      item1 = "The correct answer is 'No' because the authors did not report the formula or reference for the formula for the effect size statistic/measure used.",
      item2 = "The correct answer is 'No' because the authors did not report the type of the meta-analytic/meta-regression model used.",
      item3 = "The correct answer is 'No' because the authors did not report whether there is dependence of effect size estimates.",
      item4 = "The correct answer is 'No' because the authors did not report the name or reference to the software or programming language used to conduct the analysis.",
      item5 = "The correct answer is 'No' because the authors did not report the total number of primary studies included in the meta-analysis.",
      item6 = "The correct answer is 'No' because the authors did not report the total number of effect size estimates synthesized in the meta-analysis.",
      item7 = "The correct answer is 'No' because the authors did not report the pooled mean effect of the meta-analysis/meta-regression.",
      item8 = "The correct answer is 'No' because the authors did not report the strategy used to assign weights of effect size estimates.",
      item9 = "The correct answer is 'No' because the authors did not report an assessment of heterogeneity between effect size estimates.",
      item10 = "The correct answer is 'No' because the authors did not report a statistical or graphical assessment of publication bias.",
      item11 = "The correct answer is 'No' because the authors did not report a sensitivity analysis in addition to the publication bias assessment.",
      item12 = "The correct answer is 'No' because the authors did not report any relevant code used to conduct the analysis.",
      item13 = "The correct answer is 'No' because the authors did not report the raw data extracted from each eligible primary study.",
      item14 = "The correct answer is 'No' because the authors did not report descriptions of the variables extracted from each eligible study primary study."
    ),
    study3 = list(
      item1 = "The correct answer is 'Not Applicable' because the authors conducted an arms-based meta-analysis or extracted the effect sizes directly from the included primary studies.",
      item2 = "The correct answer is 'Not Applicable' because the authors conducted an arms-based meta-analysis or extracted the effect sizes directly from the included primary studies.",
      item3 = "The correct answer is 'Not Applicable' because the authors extracted one effect size per each primary study.",
      item4 = "The correct answer is 'Not Applicable' because the authors conducted an arms-based meta-analysis or extracted the effect sizes directly from the included primary studies.",
      item5 = "The correct answer is 'Not Applicable' because the authors conducted an arms-based meta-analysis or extracted the effect sizes directly from the included primary studies.",
      item6 = "The correct answer is 'Not Applicable' because the authors conducted an arms-based meta-analysis or extracted the effect sizes directly from the included primary studies.",
      item7 = "The correct answer is 'Not Applicable' because the authors conducted an arms-based meta-analysis or extracted the effect sizes directly from the included primary studies.",
      item8 = "The correct answer is 'Not Applicable' because the authors conducted an arms-based meta-analysis or extracted the effect sizes directly from the included primary studies.",
      item9 = "The correct answer is 'Not Applicable' because the authors conducted an arms-based meta-analysis or extracted the effect sizes directly from the included primary studies.",
      item10 = "The correct answer is 'Not Applicable' because the authors conducted an arms-based meta-analysis or extracted the effect sizes directly from the included primary studies.",
      item11 = "The correct answer is 'Not Applicable' because the authors conducted an arms-based meta-analysis or extracted the effect sizes directly from the included primary studies.",
      item12 = "The correct answer is 'Not Applicable' because the authors conducted an arms-based meta-analysis or extracted the effect sizes directly from the included primary studies.",
      item13 = "The correct answer is 'Not Applicable' because the authors conducted an arms-based meta-analysis or extracted the effect sizes directly from the included primary studies.",
      item14 = "The correct answer is 'Not Applicable' because the authors conducted an arms-based meta-analysis or extracted the effect sizes directly from the included primary studies."
    ),
    study4 = list(
      item1 = "The correct answer is 'Yes' because the authors reported the formula or reference for the formula for the effect size statistic/measure used.",
      item2 = "The correct answer is 'No' because the authors did not report the type of the meta-analytic/meta-regression model used.",
      item3 = "The correct answer is 'Yes' because the authors reported whether there is dependence of effect size estimates.",
      item4 = "The correct answer is 'No' because the authors did not report the name or reference to the software or programming language used to conduct the analysis.",
      item5 = "The correct answer is 'Yes' because the authors reported the total number of primary studies included in the meta-analysis.",
      item6 = "The correct answer is 'No' because the authors did not report the total number of effect size estimates synthesized in the meta-analysis.",
      item7 = "The correct answer is 'Yes' because the authors reported the pooled mean effect of the meta-analysis/meta-regression.",
      item8 = "The correct answer is 'No' because the authors did not report the strategy used to assign weights of effect size estimates.",
      item9 = "The correct answer is 'Yes' because the authors reported an assessment of heterogeneity between effect size estimates.",
      item10 = "The correct answer is 'No' because the authors did not report a statistical or graphical assessment of publication bias.",
      item11 = "The correct answer is 'Yes' because the authors reported a sensitivity analysis in addition to the publication bias assessment.",
      item12 = "The correct answer is 'No' because the authors did not report any relevant code used to conduct the analysis.",
      item13 = "The correct answer is 'Yes' because the authors reported the raw data extracted from each eligible primary study.",
      item14 = "The correct answer is 'No' because the authors did not report descriptions of the variables extracted from each eligible study primary study."
    ),
    study5 = list(
      item1 = "The correct answer is 'No' because the authors did not report the formula or reference for the formula for the effect size statistic/measure used.",
      item2 = "The correct answer is 'Yes' because the authors reported the type of the meta-analytic/meta-regression model used.",
      item3 = "The correct answer is 'No' because the authors did not report whether there is dependence of effect size estimates.",
      item4 = "The correct answer is 'Yes' because the authors reported the name or reference to the software or programming language used to conduct the analysis.",
      item5 = "The correct answer is 'No' because the authors did not report the total number of primary studies included in the meta-analysis.",
      item6 = "The correct answer is 'Yes' because the authors reported the total number of effect size estimates synthesized in the meta-analysis.",
      item7 = "The correct answer is 'No' because the authors did not report the pooled mean effect of the meta-analysis/meta-regression.",
      item8 = "The correct answer is 'Yes' because the authors reported the strategy used to assign weights of effect size estimates.",
      item9 = "The correct answer is 'No' because the authors did not report an assessment of heterogeneity between effect size estimates.",
      item10 = "The correct answer is 'Yes' because the authors reported a statistical or graphical assessment of publication bias.",
      item11 = "The correct answer is 'No' because the authors did not report a sensitivity analysis in addition to the publication bias assessment.",
      item12 = "The correct answer is 'Yes' because the authors reported any relevant code used to conduct the analysis.",
      item13 = "The correct answer is 'No' because the authors did not report the raw data extracted from each eligible primary study.",
      item14 = "The correct answer is 'Yes' because the authors reported descriptions of the variables extracted from each eligible study primary study."
    )
  )
  
  # Check answers and provide feedback
  check_answer <- function(study, item, input_value) {
    if (input_value == correct_answers[[study]][[item]]) { 
      return(list(text = "Correct", class = "correct"))
    } else {
      return(list(text = "Incorrect", class = "incorrect"))
    }
  }
  
  observeEvent(input$submit1, {
    answer <- ifelse(input$yes1 == 1, "yes", ifelse(input$no1 == 1, "no", "na"))
    result <- check_answer(input$study_selector, "item1", answer)
    output$result1 <- renderText({ result$text })
    shinyjs::toggleClass(id = "result1", class = result$class)
    output$explanationBox1 <- renderUI({
      div(class = "explanation-box",
          h4("Explanation:"),
          p(explanations[[input$study_selector]][["item1"]])
      )
    })
  })
  
  observeEvent(input$submit2, {
    answer <- ifelse(input$yes2 == 1, "yes", "no")
    result <- check_answer(input$study_selector, "item2", answer)
    output$result2 <- renderText({ result$text })
    shinyjs::toggleClass(id = "result2", class = result$class)
    output$explanationBox2 <- renderUI({
      div(class = "explanation-box",
          h4("Explanation:"),
          p(explanations[[input$study_selector]][["item2"]])
      )
    })
  })
  
  observeEvent(input$submit3, {
    answer <- ifelse(input$yes3 == 1, "yes", ifelse(input$no3 == 1, "no", "na"))
    result <- check_answer(input$study_selector, "item3", answer)
    output$result3 <- renderText({ result$text })
    shinyjs::toggleClass(id = "result3", class = result$class)
    output$explanationBox3 <- renderUI({
      div(class = "explanation-box",
          h4("Explanation:"),
          p(explanations[[input$study_selector]][["item3"]])
      )
    })
  })
  
  observeEvent(input$submit4, {
    answer <- ifelse(input$yes4 == 1, "yes", "no")
    result <- check_answer(input$study_selector, "item4", answer)
    output$result4 <- renderText({ result$text })
    shinyjs::toggleClass(id = "result4", class = result$class)
    output$explanationBox4 <- renderUI({
      div(class = "explanation-box",
          h4("Explanation:"),
          p(explanations[[input$study_selector]][["item4"]])
      )
    })
  })
  
  observeEvent(input$submit5, {
    answer <- ifelse(input$yes5 == 1, "yes", "no")
    result <- check_answer(input$study_selector, "item5", answer)
    output$result5 <- renderText({ result$text })
    shinyjs::toggleClass(id = "result5", class = result$class)
    output$explanationBox5 <- renderUI({
      div(class = "explanation-box",
          h4("Explanation:"),
          p(explanations[[input$study_selector]][["item5"]])
      )
    })
  })
  
  observeEvent(input$submit6, {
    answer <- ifelse(input$yes6 == 1, "yes", "no")
    result <- check_answer(input$study_selector, "item6", answer)
    output$result6 <- renderText({ result$text })
    shinyjs::toggleClass(id = "result6", class = result$class)
    output$explanationBox6 <- renderUI({
      div(class = "explanation-box",
          h4("Explanation:"),
          p(explanations[[input$study_selector]][["item6"]])
      )
    })
  })
  
  observeEvent(input$submit7, {
    answer <- ifelse(input$yes7 == 1, "yes", "no")
    result <- check_answer(input$study_selector, "item7", answer)
    output$result7 <- renderText({ result$text })
    shinyjs::toggleClass(id = "result7", class = result$class)
    output$explanationBox7 <- renderUI({
      div(class = "explanation-box",
          h4("Explanation:"),
          p(explanations[[input$study_selector]][["item7"]])
      )
    })
  })
  
  observeEvent(input$submit8, {
    answer <- ifelse(input$yes8 == 1, "yes", ifelse(input$no8 == 1, "no", "na"))
    result <- check_answer(input$study_selector, "item8", answer)
    output$result8 <- renderText({ result$text })
    shinyjs::toggleClass(id = "result8", class = result$class)
    output$explanationBox8 <- renderUI({
      div(class = "explanation-box",
          h4("Explanation:"),
          p(explanations[[input$study_selector]][["item8"]])
      )
    })
  })
  
  observeEvent(input$submit9, {
    answer <- ifelse(input$yes9 == 1, "yes", ifelse(input$no9 == 1, "no", "na"))
    result <- check_answer(input$study_selector, "item9", answer)
    output$result9 <- renderText({ result$text })
    shinyjs::toggleClass(id = "result9", class = result$class)
    output$explanationBox9 <- renderUI({
      div(class = "explanation-box",
          h4("Explanation:"),
          p(explanations[[input$study_selector]][["item9"]])
      )
    })
  })
  
  observeEvent(input$submit10, {
    answer <- ifelse(input$yes10 == 1, "yes", ifelse(input$no10 == 1, "no", "na"))
    result <- check_answer(input$study_selector, "item10", answer)
    output$result10 <- renderText({ result$text })
    shinyjs::toggleClass(id = "result10", class = result$class)
    output$explanationBox10 <- renderUI({
      div(class = "explanation-box",
          h4("Explanation:"),
          p(explanations[[input$study_selector]][["item10"]])
      )
    })
  })
  
  observeEvent(input$submit11, {
    answer <- ifelse(input$yes11 == 1, "yes", "no")
    result <- check_answer(input$study_selector, "item11", answer)
    output$result11 <- renderText({ result$text })
    shinyjs::toggleClass(id = "result11", class = result$class)
    output$explanationBox11 <- renderUI({
      div(class = "explanation-box",
          h4("Explanation:"),
          p(explanations[[input$study_selector]][["item11"]])
      )
    })
  })
  
  observeEvent(input$submit12, {
    answer <- ifelse(input$yes12 == 1, "yes", ifelse(input$no12 == 1, "no", "na"))
    result <- check_answer(input$study_selector, "item12", answer)
    output$result12 <- renderText({ result$text })
    shinyjs::toggleClass(id = "result12", class = result$class)
    output$explanationBox12 <- renderUI({
      div(class = "explanation-box",
          h4("Explanation:"),
          p(explanations[[input$study_selector]][["item12"]])
      )
    })
  })
  
  observeEvent(input$submit13, {
    answer <- ifelse(input$yes13 == 1, "yes", "no")
    result <- check_answer(input$study_selector, "item13", answer)
    output$result13 <- renderText({ result$text })
    shinyjs::toggleClass(id = "result13", class = result$class)
    output$explanationBox13 <- renderUI({
      div(class = "explanation-box",
          h4("Explanation:"),
          p(explanations[[input$study_selector]][["item13"]])
      )
    })
  })
  
  observeEvent(input$submit14, {
    answer <- ifelse(input$yes14 == 1, "yes", ifelse(input$no14 == 1, "no", "na"))
    result <- check_answer(input$study_selector, "item14", answer)
    output$result14 <- renderText({ result$text })
    shinyjs::toggleClass(id = "result14", class = result$class)
    output$explanationBox14 <- renderUI({
      div(class = "explanation-box",
          h4("Explanation:"),
          p(explanations[[input$study_selector]][["item14"]])
      )
    })
  })
  
  glossary_data <- data.frame(
    Term = c("Effect size statistic", "Model type", "Effect size dependence", "Software", "Primary studies", "Effect size estimates", "Pooled mean effect", "Effect size weighting strategy", "Heterogeneity", "Publication bias", "Sensitivity analysis", "Code", "Data", "Variable description"),
    Definition = c("The effect size statistic is a measure used to quantify the strength of the relationship between two variables.",
                   "The type of model used in the meta-analysis (e.g., fixed, random, or multi-level models).",
                   "Refers to the dependence or independence of effect size estimates in the meta-analysis.",
                   "The software or programming language used to conduct the meta-analysis.",
                   "The total number of primary studies included in the meta-analysis.",
                   "The total number of effect size estimates included in the meta-analysis.",
                   "The pooled mean effect of the meta-analysis.",
                   "The strategy used to assign weights to effect size estimates.",
                   "An assessment of heterogeneity between effect size estimates.",
                   "An assessment of publication bias in the meta-analysis.",
                   "A sensitivity analysis or subset analysis conducted in the meta-analysis.",
                   "The relevant code used to conduct the meta-analysis.",
                   "The raw data extracted from each eligible primary study.",
                   "Descriptions of the variables extracted from each eligible study.")
  )
  
  # Render glossary table
  output$glossary <- renderTable({
    glossary_data
  })
  
  output$glossaryApply <- renderTable({
    glossary_data
  })
  
  # Reactive values to store the state of the last clicked button for each item
  responses <- reactiveValues(
    item1 = "None Selected",
    item2 = "None Selected",
    item3 = "None Selected",
    item4 = "None Selected",
    item5 = "None Selected",
    item6 = "None Selected",
    item7 = "None Selected",
    item8 = "None Selected",
    item9 = "None Selected",
    item10 = "None Selected",
    item11 = "None Selected",
    item12 = "None Selected",
    item13 = "None Selected",
    item14 = "None Selected"
  )
  
  # Update responses based on button clicks
  observeEvent(input$yes1Apply, { responses$item1 <- "Yes" })
  observeEvent(input$no1Apply, { responses$item1 <- "No" })
  observeEvent(input$na1Apply, { responses$item1 <- "Not Applicable" })
  
  observeEvent(input$yes2Apply, { responses$item2 <- "Yes" })
  observeEvent(input$no2Apply, { responses$item2 <- "No" })
  
  observeEvent(input$yes3Apply, { responses$item3 <- "Yes" })
  observeEvent(input$no3Apply, { responses$item3 <- "No" })
  observeEvent(input$na3Apply, { responses$item3 <- "Not Applicable" })
  
  observeEvent(input$yes4Apply, { responses$item4 <- "Yes" })
  observeEvent(input$no4Apply, { responses$item4 <- "No" })
  
  observeEvent(input$yes5Apply, { responses$item5 <- "Yes" })
  observeEvent(input$no5Apply, { responses$item5 <- "No" })
  
  observeEvent(input$yes6Apply, { responses$item6 <- "Yes" })
  observeEvent(input$no6Apply, { responses$item6 <- "No" })
  
  observeEvent(input$yes7Apply, { responses$item7 <- "Yes" })
  observeEvent(input$no7Apply, { responses$item7 <- "No" })
  
  observeEvent(input$yes8Apply, { responses$item8 <- "Yes" })
  observeEvent(input$no8Apply, { responses$item8 <- "No" })
  observeEvent(input$na8Apply, { responses$item8 <- "Not Applicable" })
  
  observeEvent(input$yes9Apply, { responses$item9 <- "Yes" })
  observeEvent(input$no9Apply, { responses$item9 <- "No" })
  observeEvent(input$na9Apply, { responses$item9 <- "Not Applicable" })
  
  observeEvent(input$yes10Apply, { responses$item10 <- "Yes" })
  observeEvent(input$no10Apply, { responses$item10 <- "No" })
  observeEvent(input$na10Apply, { responses$item10 <- "Not Applicable" })
  
  observeEvent(input$yes11Apply, { responses$item11 <- "Yes" })
  observeEvent(input$no11Apply, { responses$item11 <- "No" })
  
  observeEvent(input$yes12Apply, { responses$item12 <- "Yes" })
  observeEvent(input$no12Apply, { responses$item12 <- "No" })
  observeEvent(input$na12Apply, { responses$item12 <- "Not Applicable" })
  
  observeEvent(input$yes13Apply, { responses$item13 <- "Yes" })
  observeEvent(input$no13Apply, { responses$item13 <- "No" })
  
  observeEvent(input$yes14Apply, { responses$item14 <- "Yes" })
  observeEvent(input$no14Apply, { responses$item14 <- "No" })
  
  # Define download handler to create a CSV file from user inputs
  output$downloadCSV <- downloadHandler(
    filename = function() {
      paste0(input$filename, ".csv")
    },
    content = function(file) {
      appraisal_data <- data.frame(
        Study_Name = input$study_name,
        Study_ID = input$study_id,
        Item_1_Response = responses$item1,
        Item_1_Comment = input$comment1Apply,
        Item_2_Response = responses$item2,
        Item_2_Comment = input$comment2Apply,
        Item_3_Response = responses$item3,
        Item_3_Comment = input$comment3Apply,
        Item_4_Response = responses$item4,
        Item_4_Comment = input$comment4Apply,
        Item_5_Response = responses$item5,
        Item_5_Comment = input$comment5Apply,
        Item_6_Response = responses$item6,
        Item_6_Comment = input$comment6Apply,
        Item_7_Response = responses$item7,
        Item_7_Comment = input$comment7Apply,
        Item_8_Response = responses$item8,
        Item_8_Comment = input$comment8Apply,
        Item_9_Response = responses$item9,
        Item_9_Comment = input$comment9Apply,
        Item_10_Response = responses$item10,
        Item_10_Comment = input$comment10Apply,
        Item_11_Response = responses$item11,
        Item_11_Comment = input$comment11Apply,
        Item_12_Response = responses$item12,
        Item_12_Comment = input$comment12Apply,
        Item_13_Response = responses$item13,
        Item_13_Comment = input$comment13Apply,
        Item_14_Response = responses$item14,
        Item_14_Comment = input$comment14Apply
      )
      write.csv(appraisal_data, file, row.names = FALSE)
    }
  )
  
  # Reset button logic
  observeEvent(input$reset_button, {
    shinyjs::runjs("window.scrollTo(0, 0);")
    updateTextAreaInput(session, "study_name", value = "")
    updateTextAreaInput(session, "study_id", value = "")
    updateTextAreaInput(session, "filename", value = "MATES_appraisal")
    updateTextAreaInput(session, "comment1Apply", value = "")
    updateTextAreaInput(session, "comment2Apply", value = "")
    updateTextAreaInput(session, "comment3Apply", value = "")
    updateTextAreaInput(session, "comment4Apply", value = "")
    updateTextAreaInput(session, "comment5Apply", value = "")
    updateTextAreaInput(session, "comment6Apply", value = "")
    updateTextAreaInput(session, "comment7Apply", value = "")
    updateTextAreaInput(session, "comment8Apply", value = "")
    updateTextAreaInput(session, "comment9Apply", value = "")
    updateTextAreaInput(session, "comment10Apply", value = "")
    updateTextAreaInput(session, "comment11Apply", value = "")
    updateTextAreaInput(session, "comment12Apply", value = "")
    updateTextAreaInput(session, "comment13Apply", value = "")
    updateTextAreaInput(session, "comment14Apply", value = "")
    responses$item1 <- "None Selected"
    responses$item2 <- "None Selected"
    responses$item3 <- "None Selected"
    responses$item4 <- "None Selected"
    responses$item5 <- "None Selected"
    responses$item6 <- "None Selected"
    responses$item7 <- "None Selected"
    responses$item8 <- "None Selected"
    responses$item9 <- "None Selected"
    responses$item10 <- "None Selected"
    responses$item11 <- "None Selected"
    responses$item12 <- "None Selected"
    responses$item13 <- "None Selected"
    responses$item14 <- "None Selected"
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
