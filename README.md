# Shiny Interactive Personal Dashboard

[![R](https://img.shields.io/badge/R-276DC3?style=for-the-badge&logo=r&logoColor=white)](https://www.r-project.org/)
[![Shiny](https://img.shields.io/badge/Shiny-1E65B2?style=for-the-badge&logo=r&logoColor=white)](https://shiny.posit.co/)
[![Plotly](https://img.shields.io/badge/Plotly-3F4F75?style=for-the-badge&logo=plotly&logoColor=white)](https://plotly.com/r/)

An interactive personal dashboard built with R Shiny that showcases professional portfolio, dynamic resume with interactive visualizations, and data exploration capabilities using public datasets.

## 📋 Table of Contents
- [Features](#-features)
- [Live Demo](#-live-demo)
- [Screenshots](#-screenshots)
- [Installation](#-installation)
- [Usage](#-usage)
- [Project Structure](#-project-structure)
- [Technical Stack](#-technical-stack)
- [Course Requirements](#-course-requirements)
- [Challenges & Solutions](#-challenges--solutions)
- [License](#-license)

## ✨ Features

### 🎯 Core Functionality
- **Interactive Personal Profile** - Engaging introduction with carousel and value boxes
- **Professional Resume** - Multi-section formal resume for job applications
- **Data Visualization Module** - Interactive plots using datasets from Rdatasets repository

### 📊 Interactive Visualizations
- **Skills Radar Chart** - Plotly-based radar chart for technical skills assessment
- **Progress Bars** - Language proficiency and skill level indicators
- **Dynamic Plots** - Scatter, bar, and line charts with customizable parameters
- **Data Tables** - Interactive data preview and exploration

### 🎨 UI/UX Features
- **Responsive Design** - Mobile-friendly dashboard layout
- **Multi-page Navigation** - Organized sidebar menu with 8+ sections
- **PDF Export** - Downloadable resume functionality
- **Custom Styling** - Enhanced CSS for improved visual hierarchy

## 🚀 Live Demo

[View Live Application on ShinyApps.io](https://your-username.shinyapps.io/your-app-name/)

*Note: Replace with your actual ShinyApps.io URL*

## 📸 Screenshots

### Dashboard Overview
![Profile Page](www/images/profile-screenshot.png)

### Skills Visualization
![Skills Radar Chart](www/images/skills-radar.png)

### Data Exploration Module
![Data Visualization](www/images/data-viz-module.png)

## 🛠️ Installation

### Prerequisites
- R (version 4.0 or higher)
- RStudio (recommended)

### Required R Packages
```r
install.packages(c(
  "shiny",
  "shinydashboard",
  "shinydashboardPlus",
  "plotly",
  "DT",
  "ggplot2",
  "dplyr"
))
```

### Running the Application
```r
# Method 1: Using RStudio
# Open app.R and click "Run App"

# Method 2: From R console
shiny::runApp("path/to/your/repository")

# Method 3: Specific port
shiny::runApp("path/to/your/repository", port = 8080)
```

## 💻 Usage

### Navigation Structure
```
Dashboard Sections:
├── Profile (Introduction & Overview)
├── Experience
│   ├── Work Experience
│   ├── Organizations
│   └── Volunteer Work
├── Education
├── Projects
├── Skills (with Radar Chart)
├── Honors and Awards
├── Data Visualization
└── Contact
```

### Data Visualization Module
1. Select a dataset from the Rdatasets collection
2. Choose X and Y variables from dropdown menus
3. Select plot type (Scatter, Bar, or Line)
4. Interactive plot automatically updates

## 📁 Project Structure

```
shiny-interactive-dashboard/
├── app.R                 # Main Shiny application file
├── README.md            # Project documentation
├── www/                 # Web resources directory
│   ├── style.css        # Custom CSS styling
│   ├── marcella_resume.pdf    # Downloadable resume
│   └── images/          # Images and screenshots
│       ├── profile.jpg
│       ├── skills-radar.png
│       └── data-viz-module.png
├── data/                # Additional data files (if any)
└── documentation/       # Project reports and documentation
    └── 数据可视化-第5次作业.docx  # Course assignment report
```

## 🛠️ Technical Stack

| Technology | Purpose |
|------------|---------|
| **R Shiny** | Core web application framework |
| **shinydashboard** | Dashboard layout and UI components |
| **Plotly** | Interactive charts and visualizations |
| **DT** | Interactive data tables |
| **ggplot2** | Static graphics foundation |
| **HTML/CSS** | Custom styling and responsive design |

## 📚 Course Requirements

This project fulfills all requirements for the Data Visualization Course Assignment:

### ✅ Mandatory Sections
- [x] Personal introduction page (informal)
- [x] Formal resume with interactive charts
- [x] Data visualization using datasets from [Rdatasets](https://vincentarelbundock.github.io/Rdatasets/articles/data.html)

### ✅ Interactive Elements
- [x] Skills radar chart
- [x] Dynamic data visualization
- [x] Multi-page navigation
- [x] Responsive design

## 🎯 Challenges & Solutions

### 🔧 Technical Challenges Overcome

| Challenge | Solution |
|-----------|----------|
| Responsive layout conflicts | Custom CSS with `position: fixed` and media queries |
| Dynamic column name matching | Used `get()` with `names()` for reactive UI updates |
| Carousel navigation issues | Unique IDs and proper Bootstrap configuration |
| Scroll bar inconsistencies | CSS adjustments for `overflow-y: auto` and height management |
| Multi-language interface | Unified English labels across all components |

### Code Example: Skills Radar Chart
```r
output$skillsRadar <- renderPlotly({
  skills <- data.frame(
    Skill = c("R", "Python", "Data Viz", "Web Scraping", "NLP", "ML", "Communication"),
    Score = c(9, 8, 8, 7, 7, 7, 9)
  )
  
  plot_ly(type = 'scatterpolar', r = skills$Score, theta = skills$Skill,
          fill = 'toself', mode = 'markers') %>%
    layout(polar = list(radialaxis = list(visible = TRUE, range = c(0,10))),
           showlegend = FALSE)
})
```

## 👨‍💻 Author

**MARCELLA**  
- Student ID: 2023952001  
- Course: Data Visualization  
- Date: May 2025  

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Course instructors for the project guidelines
- [Rdatasets](https://vincentarelbundock.github.io/Rdatasets/) for provided datasets
- Shiny and R communities for extensive documentation and support

---

<div align="center">
  
**⭐ If you find this project useful, please give it a star!**

</div>
```
