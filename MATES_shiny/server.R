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
        p(
          "This application was developed by ",
          a("Kyle Morrison", href = "mailto:kyle.morrison@unsw.edu.au"), 
          ". The full source code for this application is available via the ", 
          a("KyleMorrison99", href = "https://github.com/KyleMorrison99/MATES"), 
          " GitHub repository."
        )
      )
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
  
  
  
  observeEvent(input$instruction_button, {
    showModal(modalDialog(
      title = "PRISMA_gallery instructions",
      easyClose = TRUE,
      footer = modalButton("Close"),
      size = "l",  # This makes the modal larger
      div(
        h4("Familiarise yourself with the checklist"),
        p("Review the MATES checklist items and the provided glossary of terms."),  
        hr(),
        h4("Select a study"),
        p("Choose a study from the drop down menu and click 'Go to Study' to be taken to the open access publication."),
        hr(),
        h4("Appraise the meta-analysis"),
        p("Carefully read the study and select an option for each MATES item: 'Yes' (the item is provided in the study), 'No' (the item is not provided in the study), or in some cases 'Not Applicable' (this item is not suitable for this study)."),
        hr(),
        h4("Check your appriasal results"),
        p("Click the 'Check Answer' button in each box to reveal whether your appraisal answer is correct, along with an explanation."),
        hr(),
        h4("Complete and Reset"),
        p("After completing all appraisal items, press the 'Reset All Answers' button at the bottom of the page to clear your answers and either start to apply the tool to the next study or move to the 'Apply' tab. Note: This button refreshes the shiny app and will return you to the home page.")
        
      )
    ))
    
  })
  
  
  observeEvent(input$instruction_button1, {
    showModal(modalDialog(
      title = "Apply tool instructions",
      easyClose = TRUE,
      footer = modalButton("Close"),
      size = "l",  # This makes the modal larger
      div(
        h4("Familiarise yourself with the checklist"),
        p("Review the MATES checklist items and the provided glossary of terms."),  
        hr(),
        h4("Enter the study title and a unique study identifier"),
        p("Enter the study title and a unique study identifier into the appropriate text input box."),
        hr(),
        h4("Appraise the meta-analysis"),
        p("Carefully read the study and select an option for each MATES item: 'Yes' (the item is provided in the study), 'No' (the item is not provided in the study), or in some cases 'Not Applicable' (this item is not suitable for this study)."),
        hr(),
        h4("Complete, Save & Reset"),
        p("After completing all appraisal items, enter the name which you want the file to be saved as and click the 'Download All Answers' button. Once saved clickt the 'Rest All answers button' to reset and apply MATES on another study."),
      )
    ))
    
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
                  Benke_2024 = "https://pdf.sciencedirectassets.com/271763/1-s2.0-S0160412024X00057/1-s2.0-S0160412024003659/main.pdf?X-Amz-Security-Token=IQoJb3JpZ2luX2VjENv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJGMEQCIB5QxuxHLB7z7C1MAoCurWZ2frafWMM4wTNK6HxGqDrSAiA3MVsayK6S71PhVTD%2FaYkF4Tvq1HjyhZv9iFloxgMY7yq8BQjj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAUaDDA1OTAwMzU0Njg2NSIMp2eFe%2BBqiZbWKALjKpAFWnYtZItV1pAnq4JJj%2Fk7se89GSs%2F%2FEtu%2B4bAubVieOuxhDIQ2AijLI7aH3juarXzswkwi36Ln2Ecxa4oezwh%2Fr3%2FT9m11K0MESZVcX%2B6nROiM0xiiLd1fZbWXAj0pILdLzcj5j1u0qILf7ldOha80%2F%2B1kV7vA35O6w5scc4W1LrnjABsDo6tnTuGhl6cG6ep5niNkiIcgH6UMTIqQzExQ1IeAl87KmkxP%2FxzImIDztfSkCyTixpnIm2hMmBHrdsrrKENW4armfJ5fDnAcgYTuKHWWKgwYvRTxCVtROIYI%2BxUEa4dDcLMfrLuFqgrBJl%2BtibF1hUPVBdMtJCYBjSfOnkVqqp4lbaJ4FA4S0nI8e6oqlwQvC2wStr%2BPFDYO6rOxwu5rqmxhAmTzmRe8XCyMVvCzjj%2BlToXjIdE6Z%2FUkEYGFTMcUVDLlhkzoDHdu2uGzutnNbSCOvydIcWgPoUniCl55jDOMyQP1%2FE24ORB%2FpwwxqFAvvSleGs2pMzRcPJ9AfZWftn9Bhd67oyMJAmbXjxUo6eXnc4ag8E0uveNmQuCsZZiG535Brxe5PmTHrBt5DgVy6iDz6n4%2BbdYMjahGSpaLG9romGwy5aVbX%2FDWR5VvYHvd5Hhh4rRRHED%2FwKeQ%2BHJzrtpUofragdvbeQzIIaSU0B1wk5CSvq7Jlek19rOhaUtz63c06qlGY1LnMpc%2F4jaqjzmgb9MT%2BrqaHoU%2Fh7C9I57hknbVq3OyJLiX8f7c5ekMR9e9E6ysIie7ODCX9ovSbpeaOf8YvWsXQ39Q514MDksoja3p0zPcn31nR1Qd3l%2BrgDNbeRvZYA15Zum0NWWhb%2BP4DbBvzAMQZlu8gLSPYrw0vCECCaX8Idslz4wpcyvtgY6sgFWH%2F2OSh637Dy0f1B7wSrHn01EKjbOhoojy6ryyjG%2FJxCD4C5x4N5K6vPKq6MrP19jkfMqPezMlqbAQmGvdf0Ygyx8cDjJO33%2FMrMn5KIBU0PElBdbOoRAJ1GcI9pjh6MDyw%2BMjxMMlnQmRhOGXtiKdm%2Btcx6v%2F%2B5G9AT3I9OLW8N9eNxsQZgTC4AUv%2F83RV1Kx8MqIw7MfSQ%2FBRbDu2dG35nGiJbUTXy3i7M0FxHjF89H&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240826T032412Z&X-Amz-SignedHeaders=host&X-Amz-Expires=300&X-Amz-Credential=ASIAQ3PHCVTYZGI223W6%2F20240826%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=5964dfdbeba1e8905331ad465d67d9acec026078e8b19391eea5293ffd52044e&hash=143b95f15ba25ad429f83ff347e7dbe883b00618498917b3dc3a329282fe8acd&host=68042c943591013ac2b2430a89b270f6af2c76d8dfd086a07176afe7c76c2c61&pii=S0160412024003659&tid=spdf-36a02957-a867-4305-a8e0-bc8076301a23&sid=dfe53e5c42060143aa5a9b85a4458a23848egxrqa&type=client&tsoh=d3d3LnNjaWVuY2VkaXJlY3QuY29t&ua=01105b065b55025350&rr=8b90b521acc8a947&cc=au",
                  Ellis_2024 = "https://ehp.niehs.nih.gov/doi/epdf/10.1289/EHP12678",
                  Liang_2024 = "https://pdf.sciencedirectassets.com/271833/1-s2.0-S0269749124X00056/1-s2.0-S0269749124003257/main.pdf?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIGhOfP%2Fo08BQzPzq0fgHEhMpybQwE72fFwFAEQwOXP7cAiEAwF3BTL4glCq1BbtuRKa2F8ktqqtMHq%2B1tykZt%2BO%2BGtwqvAUI5f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAFGgwwNTkwMDM1NDY4NjUiDEODGTWsbGJYbyNaIyqQBeGnElSiXJRqVQvoMGVe4lDgF0PkwTOsLGcS9E74s4nMMSBdVvJ6QxbLaWebegkr3EmYgVYWHv3JL7oBzq%2FEyj6pomwxYYO%2BzzApEFOdmDtgOdOHaDlbhyLHsHPPbzOhM9Wa72K5qKICVi6OKOAoNsPY0f%2B509%2F8JO9Uq%2B%2Bkfjn4%2Bsh0sK6%2BPfjsJQZ%2F83ENLDwWRTq0iZR84hpcbXjjk4TRzciHoKRjmtf9YxEQJ1WLPs%2FjMr8O%2BzF64QcwsQWYBjnpOgZkolrJtkEIu2%2FS7wMDwvOZo2J2MeCqwCkOM2zXvg6L0vd4btDl%2FlINzW3ASOimyn%2F40VfkdqXuoE65Gu6xh3To5VNRlW1bkEVcI5h5ucbfIs0GFLe7Nxt2d1XFPdUOBFnwrJkMb93Z%2B8muWo0eZ64LZISOY5LTSDTYlbjows%2BrfQvkY%2BtpfOvg9Qe7l2IS5ykm%2BGLd1BQ1KY67w3ysrDkfpiTV%2Fmkh76O5En%2BIPzz1Sdc8jIela332MR9DxjcjxPCkUJuc65cEeIMnMY8yItK5a2Wme96kxmznRZUXUunuhUujg6awJfo5J4MbY0ggXlS7EVhP9VCBR7mvhs%2Byvg%2BDvP4KoHRALqXMXzT8rpmonQ9GDOst9BR19opxhI27BTEPtAHgb3jh8fFM7qkmt4tE%2FigjR6VlNtu1h1p%2BrwUl%2FDNA7gP1gRqM%2F9WprfC6uDGmjIGW8GYRkIZ63QDo0jPDZYLgm1qo4GS%2FIP%2BDOOpg3sqedwx1%2BEgPC423BcBgupBkacwlW6OfsTgG%2B02FWukxx2dV%2B20f%2FMtPoT9HNwfN%2B4BifC9v3IHWQ7v2X3%2FvgqP6RLt5tsadcKD9CGVJLhOFE69P0gKRn4wZe8pKMJeBsLYGOrEBp9zpqDKA%2F01jd6zybTXq4y5EMwhKj9Y%2B%2FxizIH3307Mq1ZoZeK54zk80GOP%2FQIDvQ2kHG9SZhOmed1%2B%2FE00QM4Yr8k8brENIhF7ltLfhtgL%2Fl7i3sO7gMs47B6wh75Fs6F5yuBTOWrMb3O76kKaaSRraI1%2FXiVIerVfAG%2FYUcliqNvxpGj%2BYQFOgzQ4yFWv5a54%2ByltbnQYR0hVc7B1tb5HKHqS44%2BmZKA9AcMMun9nd&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240826T044541Z&X-Amz-SignedHeaders=host&X-Amz-Expires=300&X-Amz-Credential=ASIAQ3PHCVTYXO5RMHSU%2F20240826%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=df2f201dcc5b7df97546bf78b6e72c39fb3df6a4e07eac6ec1a4e594d8174535&hash=6d98dcf2c64d8bdcdad182a7bc328aaf1cfc616b4d2e3915c0497cf6e3b3b22d&host=68042c943591013ac2b2430a89b270f6af2c76d8dfd086a07176afe7c76c2c61&pii=S0269749124003257&tid=spdf-dd3cde6a-3f03-42f1-ad0a-d569a7cc78b8&sid=dfe53e5c42060143aa5a9b85a4458a23848egxrqa&type=client&tsoh=d3d3LnNjaWVuY2VkaXJlY3QuY29t&ua=01105b065b54520555&rr=8b912c7e182ca89e&cc=au",
                  Oneill_2024 = "https://pdf.sciencedirectassets.com/272394/1-s2.0-S0013935123X00310/1-s2.0-S0013935123025550/main.pdf?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIGhOfP%2Fo08BQzPzq0fgHEhMpybQwE72fFwFAEQwOXP7cAiEAwF3BTL4glCq1BbtuRKa2F8ktqqtMHq%2B1tykZt%2BO%2BGtwqvAUI5f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAFGgwwNTkwMDM1NDY4NjUiDEODGTWsbGJYbyNaIyqQBeGnElSiXJRqVQvoMGVe4lDgF0PkwTOsLGcS9E74s4nMMSBdVvJ6QxbLaWebegkr3EmYgVYWHv3JL7oBzq%2FEyj6pomwxYYO%2BzzApEFOdmDtgOdOHaDlbhyLHsHPPbzOhM9Wa72K5qKICVi6OKOAoNsPY0f%2B509%2F8JO9Uq%2B%2Bkfjn4%2Bsh0sK6%2BPfjsJQZ%2F83ENLDwWRTq0iZR84hpcbXjjk4TRzciHoKRjmtf9YxEQJ1WLPs%2FjMr8O%2BzF64QcwsQWYBjnpOgZkolrJtkEIu2%2FS7wMDwvOZo2J2MeCqwCkOM2zXvg6L0vd4btDl%2FlINzW3ASOimyn%2F40VfkdqXuoE65Gu6xh3To5VNRlW1bkEVcI5h5ucbfIs0GFLe7Nxt2d1XFPdUOBFnwrJkMb93Z%2B8muWo0eZ64LZISOY5LTSDTYlbjows%2BrfQvkY%2BtpfOvg9Qe7l2IS5ykm%2BGLd1BQ1KY67w3ysrDkfpiTV%2Fmkh76O5En%2BIPzz1Sdc8jIela332MR9DxjcjxPCkUJuc65cEeIMnMY8yItK5a2Wme96kxmznRZUXUunuhUujg6awJfo5J4MbY0ggXlS7EVhP9VCBR7mvhs%2Byvg%2BDvP4KoHRALqXMXzT8rpmonQ9GDOst9BR19opxhI27BTEPtAHgb3jh8fFM7qkmt4tE%2FigjR6VlNtu1h1p%2BrwUl%2FDNA7gP1gRqM%2F9WprfC6uDGmjIGW8GYRkIZ63QDo0jPDZYLgm1qo4GS%2FIP%2BDOOpg3sqedwx1%2BEgPC423BcBgupBkacwlW6OfsTgG%2B02FWukxx2dV%2B20f%2FMtPoT9HNwfN%2B4BifC9v3IHWQ7v2X3%2FvgqP6RLt5tsadcKD9CGVJLhOFE69P0gKRn4wZe8pKMJeBsLYGOrEBp9zpqDKA%2F01jd6zybTXq4y5EMwhKj9Y%2B%2FxizIH3307Mq1ZoZeK54zk80GOP%2FQIDvQ2kHG9SZhOmed1%2B%2FE00QM4Yr8k8brENIhF7ltLfhtgL%2Fl7i3sO7gMs47B6wh75Fs6F5yuBTOWrMb3O76kKaaSRraI1%2FXiVIerVfAG%2FYUcliqNvxpGj%2BYQFOgzQ4yFWv5a54%2ByltbnQYR0hVc7B1tb5HKHqS44%2BmZKA9AcMMun9nd&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240826T050916Z&X-Amz-SignedHeaders=host&X-Amz-Expires=300&X-Amz-Credential=ASIAQ3PHCVTYXO5RMHSU%2F20240826%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=de54ad5c2d24a17fae18fb14d44c8ee18f81e03cb4ebef2415c69b3f30b58c37&hash=8690cd5e84a38ceb6e4b7a941119631ee942e1539e9b79cbbbb1134f0ac0c6fe&host=68042c943591013ac2b2430a89b270f6af2c76d8dfd086a07176afe7c76c2c61&pii=S0013935123025550&tid=spdf-8433a950-8a79-43d8-be84-d35e64fc3323&sid=dfe53e5c42060143aa5a9b85a4458a23848egxrqa&type=client&tsoh=d3d3LnNjaWVuY2VkaXJlY3QuY29t&ua=01105b065b54540052&rr=8b914f090fc95d32&cc=au",
                  Yu_2024 = "https://pdf.sciencedirectassets.com/271800/1-s2.0-S0048969724X00054/1-s2.0-S0048969724026494/main.pdf?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJGMEQCIG4hB3Ae5bfLZYOB7FGJNmSVTIuQkfrz%2Bf8o6bLN0jDXAiARKKiJ%2Busgk7DYIbnJbKpmsTjpO0o046JXphN%2FDa8FFiq8BQjn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAUaDDA1OTAwMzU0Njg2NSIMoS21ypEcUjysS6SkKpAFpWuqRSeZo5JwE9seCHbFxpUPVCY4iW25%2BnsRGGTQtDokFRD9NeWoexXzL4jVPDl%2F1%2BeD%2BJ%2BFtwF3e0rS7c84KBCxtNraxaHetrghYlr9IKKMTZT8rdg0K%2Fi6EC7vzB333N7ZA3txK3Ht8MJeosAMNhFA3W9wTjdVY1Tt3EbmG%2Fhh%2B56eHI8Wm9Ujmv7t1F%2F1KMM8vXs0XttXy6xVj%2FD2aVrcFNMzH8d%2BCZjfZ%2FqzYaLD9m6%2BXaTao5SSX8d428KDWRTFjhCTq2K%2F8SiBdKcGOxgBomrIiA5btxNZw9OnE4pY8ctG%2BpD90gIAo8kevWj15ypXqnl%2FB7IBAe9QUTc6yv7%2FXAzOtmdlp0H%2F9omFOs45NcdB4XTjUM1XRqqw5%2BRec4z%2BuYcMgGMKcK59%2Btb7hvH7bE%2B2igDy5Z10r1YOK6NzW7Akn8y8C%2FswogQWyX7%2Bk%2BCh1343bq6LI3FczfoIJG2wDWIX%2BvyOTPsgpfpMmt%2BEBDkuRmxXLUDrotRs1t%2FdtwzLEgJvs6XDYYD3P5bUp82fXvrvnSZmpEnZxXKobraYDDBioKWklippmHJOv1XHgh9D2xWnr1UsYYfpCvwyWBj7ElNt%2Fd4IBCxLTzZLTS7GQVsgOYYFGt6amHfsKlTONJYUIhVR6QLi7Qj0MN4k4j5WV1uxsVz5LIUhi0IzMBI9v6%2BU3%2Bj5a35i6hKccFMk9B%2BW%2FgW2KlE4ugbQ754JvK8SN40tMpmy1fnCM3l%2BQD3oiIMc2Odh7FunRT6FEPxbwNdnQi%2FTsVGsBzdKRzBf9TxCz09B1gCiEfuttqgCStWrwRIODs1nZJ9s2zfbeWWFR3%2BLxMf3CDEMxl5vch2aP3bIA2HFPmKP31nQpDiJ3Rowo6OwtgY6sgFPdXwnqjiwWx7L8I3M%2Bn4p6URTOj3J7LdWTHYxI%2FdaQU4moOu6tbm3XlEOfkrg3sXpcRfiYjC6wIPqlchL3yiyV%2F8RhMl51FWHU7KDN8za4lnayaUGnZnRzj5c6paQGLgiWWSaJgmxKuC7%2F23B0xUbbLkJ%2FgsR9C04lyI9YowkYIeGkFq7UZYgPeqtqVSHwEsddpfh2xQJgx%2BedQNy10HO59dqsV94so5e714xt2epIUWR&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240826T054529Z&X-Amz-SignedHeaders=host&X-Amz-Expires=300&X-Amz-Credential=ASIAQ3PHCVTY6AKYQB7J%2F20240826%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=391b18219f86f3bd0eb3b4145e6a141bc571a3d011b0a53aa03e1992dbf57079&hash=28a0c47737aa785980642722e3fb8223a5f19d6d6e5649ca4aebf7deae760a8b&host=68042c943591013ac2b2430a89b270f6af2c76d8dfd086a07176afe7c76c2c61&pii=S0048969724026494&tid=spdf-21ece32f-24d6-4e13-b610-9169f8affeb1&sid=dfe53e5c42060143aa5a9b85a4458a23848egxrqa&type=client&tsoh=d3d3LnNjaWVuY2VkaXJlY3QuY29t&ua=01105b065b54585253&rr=8b918415b9b1a95c&cc=au")
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
    Benke_2024 = list(
      item1 = "no",
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
    Ellis_2024 = list(
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
      item14 = "no"
    ),
    Liang_2024 = list(
      item1 = "yes",
      item2 = "yes",
      item3 = "no",
      item4 = "yes",
      item5 = "yes",
      item6 = "no",
      item7 = "yes",
      item8 = "no",
      item9 = "yes",
      item10 = "yes",
      item11 = "yes",
      item12 = "no",
      item13 = "no",
      item14 = "no"
    ),
    oneill_2024 = list(
      item1 = "yes",
      item2 = "yes",
      item3 = "no",
      item4 = "yes",
      item5 = "yes",
      item6 = "no",
      item7 = "yes",
      item8 = "no",
      item9 = "yes",
      item10 = "yes",
      item11 = "yes",
      item12 = "no",
      item13 = "no",
      item14 = "no"
    ),
    Yu_2024 = list(
      item1 = "yes",
      item2 = "yes",
      item3 = "no",
      item4 = "yes",
      item5 = "no",
      item6 = "no",
      item7 = "yes",
      item8 = "no",
      item9 = "no",
      item10 = "yes",
      item11 = "no",
      item12 = "no",
      item13 = "no",
      item14 = "no"
    )
  )
  
  # Explanation for each incorrect answer for each study
  explanations <- list(
    Benke_2024 = list(
      item1 = "The correct answer is 'No'. Although the authors report the effect size used they do not report the formula.",
      item2 = "The correct answer is 'Yes'. The authors report the model type within Section 3.7",
      item3 = "The correct answer is 'No'. Despite having multiple effect sizes per study the authors do not report the dependency of data.",
      item4 = "The correct answer is 'Yes'. The authors report the software used to conduct the analysis within Section 3.7.",
      item5 = "The correct answer is 'Yes'. The authors report the number of included studies in Figure 1.",
      item6 = "The correct answer is 'No'. The authors do not report the number of effect size estimates.",
      item7 = "The correct answer is 'Yes'. The authors report the pooled mean effect in Section 4.4.",
      item8 = "The correct answer is 'No'. The authors do not report the weighting strategy used for effect size estimates.",
      item9 = "The correct answer is 'Yes'. The authors report an assessment of heterogeneity in Section 4.4.",
      item10 = "The correct answer is 'Not Applicable'. The authors do not report an assessment of publication bias because there is too few studies.",
      item11 = "The correct answer is 'No'. The authors do not report a sensitivity analysis to investigate robustness of results.",
      item12 = "The correct answer is 'No'. The authors use a point and click software which can also produce syntax.",
      item13 = "The correct answer is 'Yes'. The authors report the raw data within Supplementary file 5.",
      item14 = "The correct answer is 'No'. Although the authors provide headings for the reported data they do not provide any variable descriptions."
    ),
    Ellis_2024 = list(
      item1 = "The correct answer is 'Yes'. The authors report the effect size statistic formula in Section: Data preparation.",
      item2 = "The correct answer is 'Yes'. The authors report the model type used in Section: Meta-analytical model",
      item3 = "The correct answer is 'Yes'. The authors report the dependency of effect size estimates in Section: Meta-analytical model",
      item4 = "The correct answer is 'Yes'. The authors report the software/programming language in Section: Meta-analytical model.",
      item5 = "The correct answer is 'Yes'. The authors report the number of included studies in Figure 1.",
      item6 = "The correct answer is 'Yes'. The authors report the number of included effect size estimates in Figure 1.",
      item7 = "The correct answer is 'Yes'. The authors report the pooled mean effect in Section: Summary of Meta-Analysis Results.",
      item8 = "The correct answer is 'Yes'. The authors report the weighting strategy used for effect size estimates in Section: Meta-analytical model.",
      item9 = "The correct answer is 'Yes'. The authors report an assessment of heterogeneity in Table 3 ",
      item10 = "The correct answer is 'Yes'. The authors report an assessment of publication bias in the Section: Publication bias results.",
      item11 = "The correct answer is 'Yes'. The authors report a sensitivity analysis in Section: Sensitivity meta-analyses results.",
      item12 = "The correct answer is 'Yes'. The authors report the code used to conduct the analysis in an external GitHub repository.",
      item13 = "The correct answer is 'Yes'. The authors report the raw data extracted from each primary study in an external GitHub repository.",
      item14 = "The correct answer is 'No'. The authors do not report the variable descriptions for data extracted from the primary studies."
    ),
    Liang_2024 = list(
      item1 = "The correct answer is 'Yes'. The authors report relevant references for the effect sizes estimates used in Section 2.5.",
      item2 = "The correct answer is 'Yes'. The authors report the model type used in Section 2.6.",
      item3 = "The correct answer is 'No'. Despite having multiple effect sizes per study the authors do not report the dependency of data.",
      item4 = "The correct answer is 'Yes'. The authors report the software/programming language used in Section 2.6.",
      item5 = "The correct answer is 'Yes'. The authors report the number of included studies in Figure 1.",
      item6 = "The correct answer is 'No'. The authors do not report the number of effect size estimates.",
      item7 = "The correct answer is 'Yes'. The authors report the pooled mean effect size estimates for each subgroup analysis.",
      tem8 = "The correct answer is 'No'. The authors do not report the weighting strategy used for effect size estimates.",
      item9 = "The correct answer is 'Yes'. The authors report an assessment of heterogeneity in Section 3.2.",
      item10 = "The correct answer is 'Yes'. The authors report an assessment of publication bias in the Section:3.2.2.",
      item11 = "The correct answer is 'Yes'. The authors report a sensitivity analysis in Section 3.4",
      item12 = "The correct answer is 'No'. The authors do not report the code used to conduct the analysis.",
      item13 = "The correct answer is 'No'. The authors do not report the raw data to calculate effect size estimates.",
      item14 = "The correct answer is 'No'. The authors do not report the variable descriptions for the extracted data"
    ),
    oneill_2024 = list(
      item1 = "The correct answer is 'Yes'.The authors report the effect size statistic formula in Section 2.4.",
      item2 = "The correct answer is 'Yes'. The authors report the model type used in Section 2.4.",
      item3 = "The correct answer is 'No'. Despite having multiple effect sizes per study the authors do not report the dependency of data.",
      item4 = "The correct answer is 'Yes'. The authors report the software/programming language used in Section 2.4.",
      item5 = "The correct answer is 'Yes'. The authors report the number of included studies in Figure 1.",
      item6 = "The correct answer is 'No'. The authors do not report the number of effect size estimates.",
      item7 = "The correct answer is 'Yes'. The authors report the pooled mean effect size estimates for each subgroup analysis in Section 3.2.1.",
      item8 = "The correct answer is 'No'. The authors do not report the weighting strategy used for effect size estimates.",
      item9 = "The correct answer is 'Yes'. The authors report an assessment of heterogeneity in suplementary material 1.",
      item10 = "The correct answer is 'No' because the authors did not report a statistical or graphical assessment of publication bias.",
      item11 = "The correct answer is 'Yes'. The authors report a sensitivity analysis in Section: 3.2.3.",
      item12 = "The correct answer is 'No' because the authors did not report any relevant code used to conduct the analysis.",
      item13 = "The correct answer is 'No'. The authors do not report the raw data to calculate effect size estimates.",
      item14 = "The correct answer is 'No'. The authors do not report the variable descriptions for the extracted data"
    ),
    Yu_2024 = list(
      item1 = "The correct answer is 'Yes'.The authors report the effect size statistic formula in Section 2.3.1.",
      item2 = "The correct answer is 'Yes'. The authors report the model type used in Section 2.4.",
      item3 = "The correct answer is 'No'. Despite having multiple effect sizes per study the authors do not report the dependency of data.",
      item4 = "The correct answer is 'Yes'. The authors report the software/programming language used in Section 2.3.1.",
      item5 = "The correct answer is 'Yes'. The authors do not report the number of primary studies.",
      item6 = "The correct answer is 'No'. The authors do not report the number of effect size estimates.",
      item7 = "The correct answer is 'Yes'. The authors report the pooled mean effect size estimates for each subgroup analysis in Section 3.1.",
      item8 = "The correct answer is 'No'. The authors do not report the weighting strategy used for effect size estimates.",
      item9 = "The correct answer is 'No'. The authors do not report an assessment of heterogeneity.",
      item10 = "The correct answer is 'Yes'. The authors do not report an assessment of publication bias.",
      item11 = "The correct answer is 'No'. The authors do not report a sensitivity analysis.",
      item12 = "The correct answer is 'No'. The authors do not report the code used to conduct the analysis.",
      item13 = "The correct answer is 'No'. The authors do not report the raw data to calculate effect size estimates.",
      item14 = "The correct answer is 'No'. The authors do not report the variable descriptions for the extracted data"
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
        Item_14_Comment = input$comment14Apply,
        Overall_Comment = input$overall_comment
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
    updateTextAreaInput(session, "overall_comment", value = "")
    
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

# shinyApp(ui = ui,server = server)