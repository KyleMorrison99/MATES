# Define server logic required to show the modal dialog
server <- function(input, output, session) {
  
  observeEvent(input$aboutButton1, {
    showModal(modalDialog(
      title = "About & Citation Info",
      easyClose = TRUE,
      footer = modalButton("Close"),
      size = "l",  # This makes the modal larger
      div(
        h3("Citation Information"),
        p("Citation here: This document is intentionally blank."),
        downloadButton("downloadBib", "Download citation (.bib)", class = "btn btn-secondary"),
        downloadButton("downloadRis", "Download citation (.ris)", class = "btn btn-secondary"),
        hr(),
        h3("Found a problem?"),
        p(a("Please submit an issue on the GitHub repository!", href = "https://github.com/KyleMorrison99/MATES")),
        hr(),
        h3("About"),
        p("This application was developed by ", 
          a("Kyle Morrison", href = "mailto:kyle.morrison@unsw.edu.au"), 
          ". The full source code for this application is available via the ", 
          a("KyleMorrison99", href = "https://github.com/KyleMorrison99/MATES"), 
          " GitHub repository."))
    ))
  })
  
  observeEvent(input$aboutButton2, {
    showModal(modalDialog(
      title = "About & Citation Info",
      easyClose = TRUE,
      footer = modalButton("Close"),
      size = "l",  # This makes the modal larger
      div(
        h3("Citation Information"),
        p("Citation here: This document is intentionally blank."),
        downloadButton("downloadBib", "Download citation (.bib)", class = "btn btn-secondary"),
        downloadButton("downloadRis", "Download citation (.ris)", class = "btn btn-secondary"),
        hr(),
        h3("Found a problem?"),
        p(a("Please submit an issue on the GitHub repository!", href = "https://github.com/KyleMorrison99/MATES")),
        hr(),
        h3("About"),
        p("This application was developed by ", 
          a("Kyle Morrison", href = "mailto:kyle.morrison@unsw.edu.au"), 
          ". The full source code for this application is available via the ", 
          a("KyleMorrison99", href = "https://github.com/KyleMorrison99/MATES"), 
          " GitHub repository.")      )
    ))
  })
  
  observeEvent(input$aboutButton3, {
    showModal(modalDialog(
      title = "About & Citation Info",
      easyClose = TRUE,
      footer = modalButton("Close"),
      size = "l",  # This makes the modal larger
      div(
        h3("Citation Information"),
        p("Citation here: This document is intentionally blank."),
        downloadButton("downloadBib", "Download citation (.bib)", class = "btn btn-secondary"),
        downloadButton("downloadRis", "Download citation (.ris)", class = "btn btn-secondary"),
        hr(),
        h3("Found a problem?"),
        p(a("Please submit an issue on the GitHub repository!", href = "https://github.com/KyleMorrison99/MATES")),
        hr(),
        h3("About"),
        p("This application was developed by ", 
          a("Kyle Morrison", href = "mailto:kyle.morrison@unsw.edu.au"), 
          ". The full source code for this application is available via the ", 
          a("KyleMorrison99", href = "https://github.com/KyleMorrison99/MATES"), 
          " GitHub repository.")      )
    ))
  })
  
  
  
  observeEvent(input$downloadMATES, {
    shinyjs::runjs("window.open('https://unsw-my.sharepoint.com/:w:/g/personal/z5393783_ad_unsw_edu_au/ESmqk4Q5Lp9BqX0LOU_36CMBAnAidx45JMPG_BTG6aboyg?e=L4v8ud', '_blank');")
  })
  
  # Observe the PRISMA button and open the PRISMA Statement link
  observeEvent(input$downloadMATESstatement, {
    shinyjs::runjs("window.open('https://unsw-my.sharepoint.com/:w:/g/personal/z5393783_ad_unsw_edu_au/EQ6Dn9z-3y9Dq6h14RDqjcQB4b0J21oVNXy5Gnb79uXAOQ?e=fvfYq7', '_blank');")
  })
  
  # Link for Portuguese Checklist
  observeEvent(input$portugueseChecklist, {
    shinyjs::runjs("window.open('https://unsw-my.sharepoint.com/:w:/g/personal/z5393783_ad_unsw_edu_au/Ef7KhIAFw5dPvL6rylDcKGABplOHD1dnfHuNUuZBI_Ak_w?e=TR8BJc', '_blank');")
  })
  
  # Link for Chinese (Simplified) Checklist
  observeEvent(input$chineseSimplifiedChecklist, {
    shinyjs::runjs("window.open('https://unsw-my.sharepoint.com/:w:/g/personal/z5393783_ad_unsw_edu_au/EYI8DYeiy3xEmHqIowTQPdEBBH2wnUM7TmVlH_BRA8_-nA?e=Gr2yxr', '_blank');")
  })
  
  # Link for Chinese (Traditional) Checklist
  observeEvent(input$chineseTraditionalChecklist, {
    shinyjs::runjs("window.open('https://unsw-my.sharepoint.com/:w:/g/personal/z5393783_ad_unsw_edu_au/EVbnEe_VhxxMiJi4RV0OaBABau4-QofPj71nfMhgWgJC7g?e=s8Nj6E', '_blank');")
  })
  
  # Link for French Checklist
  observeEvent(input$frenchChecklist, {
    shinyjs::runjs("window.open('https://unsw-my.sharepoint.com/:w:/g/personal/z5393783_ad_unsw_edu_au/EZr3I_X5fkNKsPjoYwqdYzgBAApOrNuCDy8b2Zz7VyYLKA?e=XpIwxf', '_blank');")
  })
  
  # Link for Japanese Checklist
  observeEvent(input$japaneseChecklist, {
    shinyjs::runjs("window.open('https://unsw-my.sharepoint.com/:w:/g/personal/z5393783_ad_unsw_edu_au/EbGM5bkOwQJMovRLjjBfZxYBRBLukJqv2GwXPgtAqWcb0Q?e=cKgjri', '_blank');")
  })
  
  # Link for Italian Checklist
  observeEvent(input$italianChecklist, {
    shinyjs::runjs("window.open('https://unsw-my.sharepoint.com/:w:/g/personal/z5393783_ad_unsw_edu_au/EbVNaNPkkbtAk75feDNQtnUB-BA5gmqh40RbGR1y8x49Pg?e=vAZR9B', '_blank');")
  })
  
  # Link for Polish Checklist
  observeEvent(input$polishChecklist, {
    shinyjs::runjs("window.open('https://unsw-my.sharepoint.com/:w:/g/personal/z5393783_ad_unsw_edu_au/EWj6tTNtq45Fr0-IWuNvp3QB0uwaUtO2vmqMWMq8P_53Gw?e=8HPgBN', '_blank');")
  })
  
  # Link for Russian Checklist
  observeEvent(input$russianChecklist, {
    shinyjs::runjs("window.open('https://unsw-my.sharepoint.com/:w:/g/personal/z5393783_ad_unsw_edu_au/ETU2LEiLngNDjUaCgLKBVpYBINJ52wV2qzqDFex-GSLsGA?e=4QcZsQ', '_blank');")
  })
  
  # Link for Spanish Checklist
  observeEvent(input$spanishChecklist, {
    shinyjs::runjs("window.open('https://unsw-my.sharepoint.com/:w:/g/personal/z5393783_ad_unsw_edu_au/EfZ0dKG_Et5Hlygd8XJ8RJsBvgdN9E5jLMfhs_lbL888Lg?e=zanfD2', '_blank');")
  })
  
  
  observeEvent(input$workshop1, {
    showModal(modalDialog(
      title = "Workshop 1",
      size = "l",
      HTML("This document is intentionally blank.
      ")
    ))
  })
  
  observeEvent(input$survey, {
    showModal(modalDialog(
      title = "Survey",
      size = "l",
      HTML("This document is intentionally blank.
      ")
    ))
  })
  
  observeEvent(input$workshop2, {
    showModal(modalDialog(
      title = "Workshop 2",
      size = "l",
      HTML("This document is intentionally blank.
      " )
    ))
  })
  
  observeEvent(input$task, {
    showModal(modalDialog(
      title = "Task",
      size = "l",
      HTML("This document is intentionally blank.
      ")
    ))
  })
  
  observeEvent(input$workshop3, {
    showModal(modalDialog(
      title = "Workshop 3",
      size = "l",
      HTML("This document is intentionally blank.
      ")
    ))
  }) 
  
  
  # Observe the study button and open the selected study link
  observeEvent(input$study_button, {
    url <- switch(input$study_selector,
                  study1 = "https://example.com/study1",
                  study2 = "https://example.com/study2",
                  study3 = "https://example.com/study3",
                  study4 = "https://example.com/study4",
                  study5 = "https://example.com/study5")
    shinyjs::runjs(sprintf("window.open('%s', '_blank')", url))
  })
  
  
  glossary_data <- data.frame(
    Term = c("Arms-based network meta-analysis", "Code", "Effect size statistic/measure", "Graphical user interface (GUI)", "Meta-analysis", 
             "Meta-data", "Meta-regression", "Heterogeneity", "Model structure", "Moderator", "Pooled mean effect", "Primary study", 
             "Publication bias test", "Sensitivity analysis", "Software", "Statistical dependency (non-independence)", "Weighting strategy"),
    Definition = c(
      "A network meta-analysis that does not contrast a control and treatment group but instead assesses the impacts of treatments directly against each other (e.g., the number of successes of an intervention).",
      "The set of instructions written in a programming language. Typically, code will contain the instructions of how the analysis was conducted.",
      "A measurement of the effect of an intervention or an exposure. Usually measured as a comparison between two groups or an association between two variables. Some common examples in environmental sciences include lnRR, Hedge’s g, Cohen’s d, odds ratio, risk ratio, and Zr.",
      "A software that allows the user to use clickable icons and menus. Some common examples of GUI software include Comprehensive Meta-analysis Software. Note that some software such as Stata and SPSS use a GUI but can also create syntax or a coding log that can be used to report the options selected, whereas software such as Comprehensive Meta-Analysis does not have such an option to report syntax.",
      "A statistical method used to aggregate weighted effect size estimates from multiple studies on a similar topic, to give an estimated pooled (overall) effect size and error.",
      "Meta-data is information that describes the content and the structure of the data.",
      "A model that uses a weighted regression to examine the effects of moderators (i.e., independent variables) on the meta-analytic effect size estimate.",
      "An indication of the consistency among effect size estimates that is not explained by sampling error. Common measures of heterogeneity in meta-analysis include absolute measures such as tau2 (a variance component) or relative measures such as I2.",
      "The assumptions and specification of effects in a statistical model. Common examples of model structures include random-effects models, mixed-effect models, and generalized linear models.",
      "A factor that may explain variation among effect size estimates. Moderators are equivalent to independent variables or predictors in linear models.",
      "A single summary estimate that represents the combined results of multiple primary studies on a particular outcome or effect.",
      "The individual empirical research paper that contributes original research to the meta-analysis.",
      "A set of statistical approaches to detect the tendency for a subset of studies to be more likely to be published and included in the meta-analysis than others.",
      "A set of alternative statistical analyses to test the robustness of the meta-analysis results. In meta-analysis, these commonly include leaving one or more points/studies out from the analysis or using an alternative effect size or model.",
      "The program (or programming language) that is used to conduct the analysis. In the case of meta-analysis in environmental sciences, some common examples include code-based software (e.g., R) or GUI-based software (e.g., SPSS, Stata, Comprehensive Meta-Analysis software).",
      "The condition when two variables are linked with each other. A common source of dependency in meta-analysis is due to multiple effect sizes being extracted from an individual study.",
      "The approach taken to account for the uncertainty in the effect size estimates. Typically, meta-analysis models are weighted so that more precise effects have a greater influence on the pooled effect size estimate. Common weights used in meta-analysis include the sampling variance or sampling error of effect size estimates."
    )
  )
  
  # Render glossary table
  output$glossary1 <- renderTable({
    glossary_data
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
  
  observeEvent(input$reset_button_test, {
    shinyjs::runjs("window.scrollTo(0, 0);")
    shinyjs::js$resetPage()
  })
  
  # Render glossary table
  output$glossary2 <- renderTable({
    glossary_data
  })
  
  
  # Initialize responses
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
  
  # Render selected buttons
  output$selectedButtons <- renderText({
    paste("Item 1 selected:", responses$item1,
          "\nItem 2 selected:", responses$item2,
          "\nItem 3 selected:", responses$item3,
          "\nItem 4 selected:", responses$item4,
          "\nItem 5 selected:", responses$item5,
          "\nItem 6 selected:", responses$item6,
          "\nItem 7 selected:", responses$item7,
          "\nItem 8 selected:", responses$item8,
          "\nItem 9 selected:", responses$item9,
          "\nItem 10 selected:", responses$item10,
          "\nItem 11 selected:", responses$item11,
          "\nItem 12 selected:", responses$item12,
          "\nItem 13 selected:", responses$item13,
          "\nItem 14 selected:", responses$item14)
  })
  
  
  # Download handler to create a CSV file from user inputs
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
    shinyjs::runjs("resetSelections();")
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
    
    # Reset reactive values
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

shinyApp(ui, server)