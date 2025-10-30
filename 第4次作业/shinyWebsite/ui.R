library(shiny)
library(shinydashboard)
library(plotly)
library(timevis)
library(shinydashboardPlus)

dashboardPage(
  dashboardHeader(
    title = "Marcella (钟美玲)",
    titleWidth = 250
  ),
  
  dashboardSidebar(
    width = 250,
    sidebarMenu(
      menuItem("Profile", tabName = "profile", icon = icon("user")),
      menuItem("Experience", tabName = "professional", icon = icon("briefcase"),
               menuSubItem("Work", tabName = "work"),
               menuSubItem("Organizations", tabName = "organizations"),
               menuSubItem("Volunteer", tabName = "volunteer")),
      menuItem("Education", tabName = "education", icon = icon("graduation-cap")),
      menuItem("Projects", tabName = "projects", icon = icon("project-diagram")),
      menuItem("Skills", tabName = "skills", icon = icon("code")),
      menuItem("Honors and Awards", tabName = "honor", icon = icon("trophy")),
      menuItem("Data Visualization", tabName = "dataset_viz", icon = icon("chart-bar")),
      menuItem("Contact", tabName = "contact", icon = icon("envelope"))
    )
  ),
  
  dashboardBody(
    tags$head(
      tags$style(HTML('
        /* Make sidebar stay fixed while scrolling */
      .wrapper {overflow: visible !important;}
      
      .main-header {
        position: fixed;
        width: 100%;
      }
      
      .main-sidebar {
        position: fixed;
        height: 100vh;
        overflow-y: auto;
      }
      
      .content-wrapper {
        margin-top: 50px;
        margin-left: 250px;
      }
        /* General Styling */
        .main-header .logo {
          font-weight: bold;
          font-size: 18px;
        }
        .box {
          margin-bottom: 20px;
          border-radius: 8px;
          box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
        }
        
        .profile-card {
          background: white;
          border-radius: 10px;
          padding: 20px;
          margin-bottom: 20px;
          box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        
        .section-header {
          border-bottom: 1px solid #e0e0e0;
          padding-bottom: 10px;
          margin-bottom: 15px;
          color: #0a66c2;
        }
        
        .experience-item, .project-item, .education-item {
          border-left: 2px solid #0a66c2;
          padding-left: 15px;
          margin-bottom: 25px;
          position: relative;
        }
        
        .experience-item:before, .project-item:before, .education-item:before {
          content: "";
          position: absolute;
          width: 12px;
          height: 12px;
          border-radius: 50%;
          background: #0a66c2;
          left: -7px;
          top: 5px;
        }
        
        .item-header {
          display: flex;
          justify-content: space-between;
          margin-bottom: 5px;
        }
        
        .item-title {
          font-weight: 600;
          font-size: 18px;
          color: #333;
        }
        
        .item-subtitle {
          color: #666;
          font-size: 15px;
        }
        
        .item-date {
          color: #666;
          font-style: italic;
        }
        
        .item-description {
          margin-top: 10px;
          color: #333;
        }
        
        .skill-badge {
          display: inline-block;
          background: #e3f2fd;
          color: #1976d2;
          padding: 5px 10px;
          border-radius: 15px;
          margin: 3px;
          font-size: 14px;
        }
        
        .skill-category {
          margin-bottom: 15px;
        }
        
        .skill-category h4 {
          border-bottom: 1px solid #eee;
          padding-bottom: 5px;
          margin-bottom: 10px;
        }
        
        /* Banner Image */
        .banner-img {
          width: 100%;
          height: auto;
          border-radius: 8px;
          margin-bottom: 15px;
        }
        
        /* Progress Bars */
        .progress {
          height: 20px;
          margin-bottom: 10px;
          background-color: #f5f5f5;
          border-radius: 4px;
        }
        .progress-bar {
          background-color: #0a66c2;
        }
        
        /* Certificate Styling */
        .certificate-container {
          display: flex;
          flex-direction: column;
          align-items: center;
          gap: 15px;
          padding: 10px;
        }
        .certificate-img {
          max-width: 100%;
          height: auto;
          max-height: 200px;
          border: 1px solid #ddd;
          border-radius: 4px;
          object-fit: contain;
        }
        
        /* Responsive Design */
        @media (max-width: 768px) {
          .content-wrapper, .main-header .navbar {
            margin-left: 0 !important;
          }
          .certificate-img {
            max-height: 150px;
          }
          
          .carousel-indicators li{
            border: 1px solid #0a66c2 !important;
          }
          .carousel-indicators .active {
            background-color: #0a66c2 !important;
          }
          
          .content-wrapper {
            min-height: auto !important;
            height: auto !important;
            overflow-x: hidden;
            overflow-y: auto;
            padding-bottom: 30px;
          }
          
          .wrapper {
            height: auto !important;
          }
          
          .tab-content {
            height: auto !important;
            overflow-y: visible !important;
            overflow-x: hidden !important;
          }
      '))
    ),
    
    tabItems(
      # Profile Tab
      tabItem("profile",
              fluidRow(
                box(
                  width = 12,
                  title = NULL,
                  solidHeader = FALSE,
                  collapsible = FALSE,
                  HTML('<img src="banner.jpeg" class="banner-img" alt="Banner image">')
                ),
                box(
                  width = 12,
                  status = "primary",
                  solidHeader = TRUE,
                  div(style = "display: flex; align-items: flex-start;",  # Changed from flex-end to flex-start
                      div(
                        style = "margin-left: 20px; width: 220px; height: 220px; border-radius: 50%; border: 4px solid grey;
                 margin-right: 30px; overflow: hidden; background-color: white; flex-shrink: 0;",  # Added flex-shrink
                        img(src = "profile.jpg", alt = "Profile Picture", style = "width: 100%; height: 100%; object-fit: cover;")
                      ),
                      div(
                        style = "margin-left: -3px;",  # Added margin to push text right
                        h1("Marcella (钟美玲)"),
                        div(style = "height:10px;"),  # Increased space
                        h4(style = "line-height: 1.6; margin-bottom: 10px;",  # Added line-height and margin
                           "Learning at StudentsCatalyst | Data science and big data technology undergraduate"),
                        h4(style = "line-height: 1.6;",  # Added line-height
                           "2023 Shantou University Type C Scholarship Awardee | 2024 Guangdong Province Scholarship Awardee"),
                        tags$br(),
                        downloadButton("download_resume", "📄 Download My Resume", class = "btn btn-primary")
                        )
                  )
                ),
                
                valueBox(
                  value = "15+", 
                  subtitle = "Technical Skills", 
                  icon = icon("code"),
                  color = "yellow",
                  width = 4
                ),
                valueBox(
                  value = "500+", 
                  subtitle = "People Impacted", 
                  icon = icon("users"),
                  color = "red",
                  width = 4
                ),
                valueBox(
                  value = "5+", 
                  subtitle = "Awards Won", 
                  icon = icon("trophy"),
                  color = "blue",
                  width = 4
                ),
                
                box(
                  width = 8,
                  title = "About Me",
                  status = "success",
                  solidHeader = TRUE,
                  p("Hello! I’m a passionate and detail-oriented undergraduate majoring in Data Science and Big Data Technology at Shantou University. With strong interests in data analysis, business strategy, and communication, I enjoy applying technical knowledge to real-world challenges."),
                  p("I am a recipient of both the 2023 Shantou University Type C Scholarship and the 2024 Guangdong Province Scholarship, awarded for academic and extracurricular excellence."),
                  p("I have gained a variety of experiences through content creation, online tutoring, and leadership roles in student organizations. I take pride in being adaptable, curious, and eager to keep learning."),
                  fluidRow(
                    column(width = 12,
                           div(
                             class = "gallery-container",
                             shinydashboardPlus::carousel(
                               id = "profile_carousel",
                               width = "100%",
                               shinydashboardPlus::carouselItem(
                                 tags$img(src = "lingnan.jpeg", 
                                          style = "width:100%; max-height:300px; object-fit:contain; border-radius:8px;"),
                                 caption = "Lingnan Cup Award"
                               ),
                               shinydashboardPlus::carouselItem(
                                 tags$img(src = "ICCE.jpeg", 
                                          style = "width:100%; max-height:300px; object-fit:contain; border-radius:8px;"),
                                 caption = "Student Organization Event"
                               ),
                               shinydashboardPlus::carouselItem(
                                 tags$img(src = "bilibili-wordcloud.png", 
                                          style = "width:100%; max-height:300px; object-fit:contain; border-radius:8px;"),
                                 caption = "Data Science Project"
                               ),
                               shinydashboardPlus::carouselItem(
                                 tags$img(src = "EL.jpg", 
                                          style = "width:100%; max-height:300px; object-fit:contain; border-radius:8px;"),
                                 caption = "English Festival 2023 - English Lounge"
                               ),
                               shinydashboardPlus::carouselItem(
                                 tags$img(src = "extravaganza.jpg", 
                                          style = "width:100%; max-height:300px; object-fit:contain; border-radius:8px;"),
                                 caption = "Cultural Extravaganza 2024"
                               ),
                               shinydashboardPlus::carouselItem(
                                 tags$img(src = "booth.jpg", 
                                          style = "width:100%; max-height:300px; object-fit:contain; border-radius:8px;"),
                                 caption = "Indonesian Booth"
                               ),
                               shinydashboardPlus::carouselItem(
                                 tags$img(src = "honor.jpeg", 
                                          style = "width:100%; max-height:300px; object-fit:contain; border-radius:8px;"),
                                 caption = "Certificate of Honor"
                               ),
                               shinydashboardPlus::carouselItem(
                                 tags$img(src = "teach.jpeg", 
                                          style = "width:100%; max-height:300px; object-fit:contain; border-radius:8px;"),
                                 caption = "Me and My Students"
                               ),
                               shinydashboardPlus::carouselItem(
                                 tags$img(src = "AYO ID.png", 
                                          style = "width:100%; max-height:300px; object-fit:contain; border-radius:8px;"),
                                 caption = "ASEAN Youth Organization"
                               )
                             )
                           )
                    )
                  )
                ),
                
                box(
                  width = 4,
                  title = "Highlights",
                  status = "info",
                  solidHeader = TRUE,
                  h4(icon("trophy"), " Awards"),
                  p("
1st Place Winner – 第十一届岭南杯'守正创新'英语写作技能大赛 (Shantou University Campus Selection)"),
                  p("2024 Guangdong Province Scholarship"),
                  p("2023 Shantou University Type C Scholarship"),
                  div(style = "height:10px;"),
                  
                  h4(icon("users"), " Organizations"),
                  p("StudentsCatalyst"),
                  p("ASEAN Youth Organization Indonesia Chapter"),
                  p("AYO Academy"),
                  p("International Cultural and Communication Exchange (ICCE)"),
                  div(style = "height:10px;"),
                  
                  h4(icon("globe"), " Languages"),
                  p("Chinese (HSK 4 - 259/300)"),
                  p("English (Professional working proficiency)"),
                  p("Indonesian (Native)")
                )
              )
      ),
      
      # Experience Tab
      tabItem("work",
              fluidRow(
                box(
                  width = 12,
                  title = "Work Experience",
                  status = "primary",
                  solidHeader = TRUE,
                  
                  div(class = "experience-item",
                      div(class = "item-header",
                          div(
                            span(class = "item-title", "Online Tutor"),
                            span(class = "item-subtitle", "Lucky Mandarin English")
                          ),
                          span(class = "item-date", "Jul 2024 - Present")
                      ),
                      div(class = "item-description",
                          p("- Teaching Chinese and English"),
                          p("- Design and provide teaching materials for students"),
                          p("- Teach more than 50 students, from beginner to intermediate levels"),
                          img(src = "teach.jpeg", alt = "Me and My Students",style = "width: 50%; border-radius: 4px")
                      )
                  ),
                  
                  div(class = "experience-item",
                      div(class = "item-header",
                          div(
                            span(class = "item-title", "Student Assistant"),
                            span(class = "item-subtitle", "Shantou University")
                          ),
                          span(class = "item-date", "Nov 2024 - present")
                      ),
                      div(class = "item-description",
                          p("- Assist in the administrative affairs of the International College"),
                          p("- Assist in the teaching of the international College"),
                          p("- Complete other tasks assigned by the office"),
                          img(src = "ICCE.jpeg", alt = "ICCE",style = "width: 50%; border-radius: 4px")
                      ),
                      div(
                        span(class = "skill-badge", "Microsoft Excel"), 
                        span(class = "skill-badge", "Interpersonal Communication"),
                        span(class = "skill-badge", "Administration"),
                        span(class = "skill-badge", "Microsoft Office"),
                        span(class = "skill-badge", "Administrative Assistance")
                      )
                  )
                )
              )
      ),
      
      # Volunteer Tab (new)
      tabItem("volunteer",
              fluidRow(
                box(
                  width = 12,
                  title = "Volunteer Experience",
                  status = "primary",
                  solidHeader = TRUE,
                  
                  div(class = "experience-item",
                      div(class = "item-header",
                          div(
                            span(class = "item-title", "Volunteer of AYO Support UMKM 2024"),
                            span(class = "item-subtitle", "ASEAN Youth Organization")
                          ),
                          span(class = "item-date", "Oct 2024 - Nov 2024")
                      ),
                      div(class = "item-description",
                          p("- Analyzing SWOT of local businesses that are based in Kalimantan"),
                          p("- Help to improve social media presence of the brand"),
                          p("- Building strategies on digital marketing and branding of the brand"),
                          img(src = "UMKM.png", alt = "Me and My Students",style = "width: 50%; border-radius: 4px")
                      ),
                      div(
                        span(class = "skill-badge", "Group Dynamics"), 
                        span(class = "skill-badge", "SWOT Analysis"),
                        span(class = "skill-badge", "Branding"),
                        span(class = "skill-badge", "Digital Marketing"),
                        span(class = "skill-badge", "Social Media")
                      )
                  ),
                  div(class = "experience-item",
                      div(class = "item-header",
                          div(
                            span(class = "item-title", "Campaigner"),
                            span(class = "item-subtitle", "ASEAN Youth Organization")
                          ),
                          span(class = "item-date", "Oct 2024")
                      ),
                      div(class = "item-description",
                          p("- Upload campaigns about mental health on Instagram"),
                          p("- Raised awareness about mental health"),
                          img(src = "campaign.jpeg", alt = "Mental Health Campaign",style = "width: 50%; border-radius: 4px")
                      ),
                      div(
                        span(class = "skill-badge", "Communication"), 
                        span(class = "skill-badge", "Campaign"),
                        span(class = "skill-badge", "Social Media")
                      )
                  )
                )
              )
      ),
      
      # Organizations Tab (new)
      tabItem("organizations",
              fluidRow(
                box(
                  width = 12,
                  title = "Organizations",
                  status = "primary",
                  solidHeader = TRUE,
                  
                  div(class = "experience-item",
                      div(class = "item-header",
                          div(
                            span(class = "item-title", "Impact Officer"),
                            span(class = "item-subtitle", "ASEAN Youth Organization (Indonesia Chapter)")
                          ),
                          span(class = "item-date", "Apr 2025 - Present")
                      ),
                      div(class = "item-description",
                          p("- Works closely with program teams within the Country Chapter to integrate M&E activities into program design, implementation, and monitoring."),
                          p("- Develops and maintains a Theory of Change for assigned AYO Country Chapter programs and activities, ensuring alignment with the overall AYO strategic direction."),
                          p("- Conducts regular data quality checks and ensures data integrity throughout the M&E process."),
                          p("- Prepares M&E reports for internal and external stakeholders, including progress reports and program evaluations."),
                          p("- Collaborates with the Impact Manager to analyze program data and identify key findings to inform program improvement."),
                          p("- Supports the Impact Manager in representing AYO at relevant M&E events within the Country Chapter."),
                          p("- Stays up-to-date on developments in M&E methodologies and youth development issues relevant to the Country Chapter."),
                          p("- Performs other duties as assigned by the Impact Manager."),
                          img(src = "AYO ID.png", alt = "ASEAN Youth Organization Indonesia Chapter",style = "width: 100%; border-radius: 4px"),
                          div(
                            span(class = "skill-badge", "Monitoring & Evaluation (M&E)"), 
                            span(class = "skill-badge", "Theory of Change (ToC) Development"),
                            span(class = "skill-badge", "Program Design & Integration"),
                            span(class = "skill-badge", "Data Quality Assurance"),
                            span(class = "skill-badge", "Data Analysis & Visualization"),
                            span(class = "skill-badge", "Report Writing & Presentation"),
                            span(class = "skill-badge", "Logical Framework Analysis")
                          )
                      )
                  ),
                  
                  div(class = "experience-item",
                      div(class = "item-header",
                          div(
                            span(class = "item-title", "Social Media Cohort"),
                            span(class = "item-subtitle", "ASEAN Youth Organization Academy")
                          ),
                          span(class = "item-date", "Jan 2025 - Present")
                      ),
                      div(class = "item-description",
                          p("- Create the content and caption (LinkedIn and Instagram) for an information post or a marketing post a week."),
                          p("- Create the content for 1 Instagram Story a week."),
                          p("- Research on content ideas for both reels and posts and suggest them."),
                          p("- Communicate with Graphic Designer and Videographer to execute the post/reel content."),
                          img(src = "AYOA.jpeg", alt = "AYOA Team Excellence Impact Award of The Month.pngAYOA Team Excellence Impact Award of The Month",style = "width: 50%; border-radius: 4px"),
                          div(
                            span(class = "skill-badge", "Copywriting"), 
                            span(class = "skill-badge", "Marketing Copy"),
                            span(class = "skill-badge", "Promotional Copy"),
                            span(class = "skill-badge", "Cross-team Collaboration"),
                            span(class = "skill-badge", "Collaborative Work"),
                            span(class = "skill-badge", "Social Media")
                          )
                      )
                  ),
                  
                  div(class = "experience-item",
                      div(class = "item-header",
                          div(
                            span(class = "item-title", "Event Department of PPI Edufest 2025"),
                            span(class = "item-subtitle", "PPI Dunia")
                          ),
                          span(class = "item-date", "Dec 2024 - Present")
                      ),
                      div(class = "item-description",
                          p("- Designed event concepts and flow, including the theme, agenda, and other creative ideas."),
                          p("- Developed a detailed and well-structured event rundown."),
                          p("- Managed speakers, including scheduling, briefing, and handling their technical requirements."),
                          p("- Ensured smooth event execution and resolved technical issues during the event."),
                          p("- Collaborated with other divisions, such as Liaison Officers and Public Relations, to fulfill all event needs."),
                          div(
                            span(class = "skill-badge", "Event Planning"), 
                            span(class = "skill-badge", "Event Management"),
                            span(class = "skill-badge", "Attention to Detail")
                          )
                      )
                  ),
                  
                  div(class = "experience-item",
                      div(class = "item-header",
                          div(
                            span(class = "item-title", "Assistant and Secretary of Event Deparment at ICCE"),
                            span(class = "item-subtitle", "Shantou University")
                          ),
                          span(class = "item-date", "Aug 2024 - Present")
                      ),
                      div(class = "item-description",
                          p("- Assist the head and co-head of the event department."),
                          p("- Take minutes of event department's meeting."),
                          p("- Ensure that events that we held is going well."),
                          img(src = "ICCE.jpeg", alt = "ICCE",style = "width: 50%; border-radius: 4px"),
                          div(
                            span(class = "skill-badge", "Event Planning"), 
                            span(class = "skill-badge", "Event Management"),
                            span(class = "skill-badge", "Public Speaking")
                          )
                      )
                  )
                )
              )
      ),
      
      #Education Tab
      tabItem("education",
              fluidRow(
                box(
                  width = 12,
                  title = "Education",
                  status = "primary",
                  solidHeader = TRUE,
                  
                  # University Education
                  div(class = "education-item",
                      div(class = "item-header",
                          div(
                            span(class = "item-title", "Bachelor of Science in Data Science and Big Data Technology"),
                            span(class = "item-subtitle", "Shantou University")
                          ),
                          span(class = "item-date", "2023 - 2027 (Expected)")
                      ),
                      div(class = "item-description",
                          p("- 1st Place Winner – 第十一届岭南杯'守正创新'英语写作技能大赛 (Shantou University Campus Selection)"),
                          p("- Actively participated in various organizations and activities."),
                          p("- Relevant Coursework: Machine Learning, Data Mining, Statistical Analysis, Database Systems, Big Data Technologies")
                      ),
                      
                      # University Memories Carousel - now properly placed within university item
                      fluidRow(
                        column(width = 12,
                               div(
                                 class = "gallery-container",
                                 shinydashboardPlus::carousel(
                                   id = "uni_carousel",
                                   width = "100%",
                                   shinydashboardPlus::carouselItem(
                                     tags$img(src = "lingnan.jpeg", 
                                              style = "width:100%; max-height:300px; object-fit:contain; border-radius:8px;"),
                                     caption = "Lingnan Cup Award"
                                   ),
                                   shinydashboardPlus::carouselItem(
                                     tags$img(src = "ICCE.jpeg", 
                                              style = "width:100%; max-height:300px; object-fit:contain; border-radius:8px;"),
                                     caption = "Student Organization Event"
                                   ),
                                   shinydashboardPlus::carouselItem(
                                     tags$img(src = "bilibili-wordcloud.png", 
                                              style = "width:100%; max-height:300px; object-fit:contain; border-radius:8px;"),
                                     caption = "Data Science Project"
                                   ),
                                   shinydashboardPlus::carouselItem(
                                     tags$img(src = "EL.jpg", 
                                              style = "width:100%; max-height:300px; object-fit:contain; border-radius:8px;"),
                                     caption = "English Festival 2023 - English Lounge"
                                   ),
                                   shinydashboardPlus::carouselItem(
                                     tags$img(src = "extravaganza.jpg", 
                                              style = "width:100%; max-height:300px; object-fit:contain; border-radius:8px;"),
                                     caption = "Cultural Extravaganza 2024"
                                   ),
                                   shinydashboardPlus::carouselItem(
                                     tags$img(src = "booth.jpg", 
                                              style = "width:100%; max-height:300px; object-fit:contain; border-radius:8px;"),
                                     caption = "Indonesian Booth"
                                   ),
                                   shinydashboardPlus::carouselItem(
                                     tags$img(src = "honor.jpeg", 
                                              style = "width:100%; max-height:300px; object-fit:contain; border-radius:8px;"),
                                     caption = "Certificate of Honor"
                                   )
                                 )
                               )
                        )
                      )
                  ),  # This closes the university education-item
                  
                  # High School Education - now properly separated
                  div(class = "education-item",
                      div(class = "item-header",
                          div(
                            span(class = "item-title", "High School Diploma"),
                            span(class = "item-subtitle", "Fons Vitae 1 High School")
                          ),
                          span(class = "item-date", "2020 - 2023")
                      ),
                      div(class = "item-description",
                          p("- Specialized in Natural Sciences"),
                          p("- Participated in Business Plan Competition"),
                          p("- Became The Head of Division II of The Students Council")
                      ),
                      
                      # High School Memories Carousel
                      fluidRow(
                        column(width = 12,
                               div(
                                 class = "gallery-container",
                                 shinydashboardPlus::carousel(
                                   id = "hs_carousel",
                                   width = "100%",
                                   shinydashboardPlus::carouselItem(
                                     tags$img(src = "BINUS.jpeg", 
                                              style = "width:100%; max-height:300px; object-fit:contain; border-radius:8px;"),
                                     caption = "Business Plan Competition"
                                   ),
                                   shinydashboardPlus::carouselItem(
                                     tags$img(src = "secretary 2.jpeg", 
                                              style = "width:100%; max-height:300px; object-fit:contain; border-radius:8px;"),
                                     caption = "Secretary 2 of Student Council"
                                   )
                                 )
                               )
                        )
                      )
                  )  # This closes the high school education-item
                )  # closes the box
              )  # closes the fluidRow
      ),  # closes the tabItem
      
      # Projects Tab
      tabItem("projects",
              fluidRow(
                box(
                  width = 12,
                  title = "Projects",
                  status = "primary",
                  solidHeader = TRUE,
                  
                  div(class = "project-item",
                      div(class = "item-header",
                          div(
                            span(class = "item-title", "Bilibili Video Analysis Platform"),
                            span(class = "item-subtitle", "Shantou University")
                          ),
                          span(class = "item-date", "Jan 2024 - Present")
                      ),
                      div(class = "item-description",
                          p("- Developed a comprehensive analysis platform for Bilibili video content using Python and R"),
                          p("- Implemented NLP techniques to analyze video titles, comments, and tags"),
                          p("- Created interactive visualizations to track trends and popularity metrics"),
                          p("- Tools used: Python (Pandas, Scikit-learn), R (Shiny, ggplot2), MySQL"),
                          fluidRow(
                            column(6, img(src = "bilibili-wordcloud.png", alt = "Bilibili Word Cloud", style = "width: 100%; border-radius: 4px;")),
                            column(6, plotlyOutput("bilibiliTimeline"))
                          )
                      )
                  ),
                  
                  div(class = "project-item",
                      div(class = "item-header",
                          div(
                            span(class = "item-title", "Consultant | Halodoc"),
                            span(class = "item-subtitle", "StudentsCatalyst Batch 5 IdeAct")
                          ),
                          span(class = "item-date", "Jan - Apr 2025")
                      ),
                      div(class = "item-description",
                          p("- Collaborated with a team of 4 to solve a real-world business case for Halodoc."),
                          p("- Conducted user research and proposed strategic improvements to service delivery."),
                          p("- Presented recommendations in a consultant-style simulation, successfully solving the case."),
                          img(src = "SC.jpg", alt = "Final Presentation with Client", style="max-width: 75%")
                      )
                  )
                )
              )
      ),
      
      # Skills Tab
      tabItem("skills",
              fluidRow(
                box(
                  width = 12,
                  title = "Technical Skills",
                  status = "primary",
                  solidHeader = TRUE,
                  
                  div(class = "skill-category",
                      h4("Programming Languages"),
                      div(
                        span(class = "skill-badge", "R"), 
                        span(class = "skill-badge", "Python"),
                        span(class = "skill-badge", "C"),
                        span(class = "skill-badge", "Java")
                      )
                  ),
                  
                  div(class = "skill-category",
                      h4("Data Science & Analytics"),
                      div(
                        span(class = "skill-badge", "Data Visualization"),
                        span(class = "skill-badge", "NLP"),
                        span(class = "skill-badge", "Web Scraping")
                      )
                  ),
                  
                  div(class = "skill-category",
                      h4("Tools & Technologies"),
                      div(
                        span(class = "skill-badge", "Git/GitHub"),
                        span(class = "skill-badge", "Canva"),
                        span(class = "skill-badge", "Ms Office"),
                        span(class = "skill-badge", "Cap Cut")
                      )
                  ),
                  
                  div(class = "skill-category",
                      h4("Databases"),
                      div(
                        span(class = "skill-badge", "MySQL"),
                        span(class = "skill-badge", "PostgreSQL"),
                        span(class = "skill-badge", "MongoDB"),
                        span(class = "skill-badge", "SQLite")
                      )
                  )
                ),
                
                box(
                  width = 12,
                  title = "Language Proficiency",
                  status = "info",
                  solidHeader = TRUE,
                  
                  h4("Chinese: HSK 4 (259/300)"),
                  div(class = "progress", div(class = "progress-bar", style = "width: 86%")),
                  
                  h4("English: Professional working proficiency"),
                  div(class = "progress", div(class = "progress-bar", style = "width: 90%")),
                  
                  h4("Indonesian: Native"),
                  div(class = "progress", div(class = "progress-bar", style = "width: 100%"))
                ),
                
                box(
                  width = 12,
                  title = "Skills Visualization",
                  status = "success",
                  solidHeader = TRUE,
                  plotlyOutput("skillsRadar", height = "400px")
                )
              )
      ),
      
      # Honors and Awards Tab
      tabItem("honor",
              fluidRow(
                box(
                  width = 12,
                  title = "Honors and Awards",
                  status = "primary",
                  solidHeader = TRUE,
                  
                  div(class = "experience-item",
                      div(class = "item-header",
                          div(
                            span(class = "item-title", "1st Place Winner – 第十一届岭南杯“守正创新”英语写作技能大赛 (Shantou University Campus Selection)"),
                            span(class = "item-subtitle", "Shantou University")
                          ),
                          span(class = "item-date", "Apr 2025")
                      ),
                      div(class = "item-description",
                          p("Awarded first place in the campus-level selection round of the 11th Lingnan Cup 'Upholding Integrity and Innovation' English Writing Competition, demonstrating strong academic writing skills and creative expression in English."),
                          img(src = "competition-cert.jpg", alt = "1st Place Lingnan Cup School Selection", style = "max-width: 75%"),
                      )
                  ),
                  
                  div(class = "experience-item",
                      div(class = "item-header",
                          div(
                            span(class = "item-title", "Certificate of Honor — World Culture Festival 2024"),
                            span(class = "item-subtitle", "Shantou University")
                          ),
                          span(class = "item-date", "Nov 2024")
                      ),
                      div(class = "item-description",
                          p("Awarded for active contribution to the success of the third World Culture Festival, themed 'ChaoShan Sets Sail, Flying Globally,' organized by Shantou University International College. Represented Indonesia through a cultural booth featuring interactive mini games about Indonesia, traditional food (Indomie and sweet tea), and prizes for participants. Promoted Indonesian culture to an international audience through engaging and educational activities."),
                          img(src = "honor.jpeg", alt = "Certificate of Honor", style = "max-width: 75%"),
                      )
                  ),
                  
                  div(class = "experience-item",
                      div(class = "item-header",
                          div(
                            span(class = "item-title", "3rd place in START-UP 2.0 Digitech Foodpreneur Competition"),
                            span(class = "item-subtitle", "BINUS University")
                          ),
                          span(class = "item-date", "Sep 2022")
                      ),
                      div(class = "item-description",
                          p("Made a business plan about FnB innovation and technology"),
                          img(src = "BINUS.jpeg", alt = "BINUS Digitech Foodpreneur Competition", style = "max-width: 75%"),
                      )
                  )
                )
              )
      ),
      
      # Contact Tab
      tabItem("contact",
              fluidRow(
                box(
                  width = 6,
                  title = "Contact Information",
                  status = "primary",
                  solidHeader = TRUE,
                  
                  h4(icon("envelope"), " Email"),
                  p(HTML('<a href="mailto:marcellacung@gmail.com">marcellacung@gmail.com</a>')),
                  
                  h4(icon("linkedin"), " LinkedIn"),
                  p(HTML('<a href="https://www.linkedin.com/in/marcella-cung/" target="_blank">linkedin.com/in/marcella-cung</a>')),
                  
                  h4(icon("github"), " GitHub"),
                  p(HTML('<a href="https://github.com/marcellacung" target="_blank">github.com/marcellacung</a>')),
                  
                  h4(icon("twitter"), " Twitter"),
                  p(HTML('<a href="https://twitter.com/marcella_cung" target="_blank">@marcella_cung</a>')),
                  
                  h4(icon("instagram"), " Instagram"),
                  p(HTML('<a href="https://www.instagram.com/marcella_cung/" target="_blank">@marcella_cung</a>'))
                ),
                
                box(
                  width = 6,
                  title = "Send a Message",
                  status = "info",
                  solidHeader = TRUE,
                  
                  textInput("contactName", "Your Name", placeholder = "Enter your name"),
                  textInput("contactEmail", "Your Email", placeholder = "Enter your email"),
                  textInput("contactSubject", "Subject", placeholder = "Enter subject"),
                  textAreaInput("contactMessage", "Message", rows = 5, placeholder = "Type your message here"),
                  actionButton("sendMessage", "Send Message", icon = icon("paper-plane"), 
                               style = "background-color: #0a66c2; color: white;")
                )
              )
      ),
      
      # Dataset Visualization Tab (new)
      tabItem("dataset_viz",
              fluidRow(
                box(title = "Choose Dataset", width = 4, status = "primary",
                    selectInput("selected_dataset", "Select a dataset:",
                                choices = c("mtcars", "iris", "ToothGrowth", "airquality", "CO2"))
                ),
                box(title = "Dataset Preview", width = 8, status = "info",
                    DT::dataTableOutput("dataset_preview"))
              ),
              fluidRow(
                box(title = "Visualization Settings", width = 4, status = "primary",
                    uiOutput("xcol_ui"),
                    uiOutput("ycol_ui"),
                    selectInput("plot_type", "Plot Type", choices = c("Scatter", "Bar", "Line"))
                ),
                box(title = "Interactive Plot", width = 8, status = "success",
                    plotlyOutput("dataset_plot"))
              )
      )
      )
    )
  )