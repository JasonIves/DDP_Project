library(shiny)

shinyUI(pageWithSidebar(
     headerPanel('US Household Income Level by Characteristic - 2013'),
     sidebarPanel(
          h4('Parameters'),
          uiOutput('categories'),
          uiOutput('characteristics'),
          numericInput("userVal", "Add income marker at:", value = NULL, min = 0, max = NA),
          checkboxGroupInput("addLines", label = NULL, choices = c("View Mean", "View Median")),
          h4('Axis Behavior'),
          checkboxInput("yAxisBhv", "Lock Y-Axis", value = TRUE),
          uiOutput('ySlider')
     ),
     mainPanel(
          tabsetPanel(
               tabPanel("Plot", plotOutput("t", height = "600")),
               tabPanel("Documentation", HTML("
<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">
<html>
<head>
                                              <meta http-equiv=\"content-type\" content=\"text/html; charset=windows-1252\"/>
                                              <title></title>
                                              <style type=\"text/css\">
                                              @page { margin: 0.79in }
                                              p { margin-bottom: 0.1in; color: #000000; line-height: 120% }
                                              h1 { margin-bottom: 0.08in; color: #000000 }
                                              h1.western { font-family: \"Liberation Sans\", sans-serif; font-size: 18pt }
                                              h1.cjk { font-family: \"Microsoft YaHei\"; font-size: 18pt }
                                              h1.ctl { font-family: \"Mangal\"; font-size: 18pt }
                                              h2 { color: #000000 }
                                              h2.western { font-family: \"Liberation Sans\", sans-serif; font-size: 16pt }
                                              h2.cjk { font-family: \"Microsoft YaHei\"; font-size: 16pt }
                                              h2.ctl { font-family: \"Mangal\"; font-size: 16pt }
                                              h4.western { font-family: \"Liberation Sans\", sans-serif; font-size: 13pt; font-style: italic }
                                              h4.cjk { font-family: \"Microsoft YaHei\"; font-size: 13pt; font-style: italic }
                                              h4.ctl { font-family: \"Mangal\"; font-size: 13pt; font-style: italic }
                                              a:link { so-language: en-US }
                                              </style>
                                              </head>
                                              <body lang=\"en-US\" text=\"#000000\" dir=\"ltr\">
                                              <p align=\"center\" style=\"margin-top: 0.17in; margin-bottom: 0.08in; line-height: 100%; page-break-after: avoid\">
                                              <font face=\"Liberation Sans, sans-serif\"><font size=\"6\" style=\"font-size: 28pt\"><b>Documentation</b></font></font></p>
                                              <p align=\"center\" style=\"margin-top: 0.04in; margin-bottom: 0.08in; line-height: 100%; page-break-after: avoid\">
                                              <font face=\"Liberation Sans, sans-serif\"><font size=\"5\" style=\"font-size: 18pt\">US
                                              Household Income Level by Characteristic - 2013</font></font></p>
                                              <p style=\"margin-bottom: 0in; line-height: 100%\"><br/>
                                              
                                              </p>
                                              <p style=\"margin-bottom: 0in; line-height: 100%\"><br/>
                                              
                                              </p>
                                              <h1 class=\"western\">User Guide</h1>
                                              <p>This application provides an easy to use set of tools for viewing
                                              household income data for households in the United States, across a
                                              wide variety of characteristics.</p>
                                              <p>There are three main parts to the app screen.</p>
                                              <h2 class=\"western\">The Sidebar</h2>
                                              <p>The controls found here can be used to configure the plot found on
                                              the 'Plot' panel.</p>
                                              <p><font face=\"Liberation Sans, sans-serif\"><font size=\"4\" style=\"font-size: 14pt\"><b>Parameters</b></font></font></p>
                                              <p>The first section houses a variety of parameters that can be used
                                              to fine-tune the data contained in the plot.</p>
                                              <h4 class=\"western\" style=\"margin-left: 0.5in; page-break-before: auto; page-break-after: avoid\">
                                              Choose a category</h4>
                                              <p style=\"margin-left: 0.5in; line-height: 120%; page-break-before: auto; page-break-after: auto\">
                                              Set a general category for the type of data you want to exame, each
                                              of which has it's own more refined set of characteristics.</p>
                                              <h4 class=\"western\" style=\"margin-left: 0.5in; page-break-before: auto; page-break-after: avoid\">
                                              Choose a characteristics</h4>
                                              <p style=\"margin-left: 0.5in; line-height: 120%; page-break-before: auto; page-break-after: auto\">
                                              Indicate the specific characteristic that you want to view a
                                              breakdown of income data for. These characteristics are dependent on
                                              what category is chosen.</p>
                                              <h4 class=\"western\" style=\"margin-left: 0.5in; page-break-before: auto; page-break-after: avoid\">
                                              Add income marker at</h4>
                                              <p style=\"margin-left: 0.5in; line-height: 120%; page-break-before: auto; page-break-after: auto\">
                                              Define a custom income marker to be viewed on the plot. This can be
                                              used to help highlight a particular income point or reference a mean
                                              or median from one plot on another plot. Entries into this field
                                              should be numeric, without symbols.</p>
                                              <h4 class=\"western\" style=\"margin-left: 0.5in; page-break-before: auto; page-break-after: avoid\">
                                              View Mean</h4>
                                              <p style=\"margin-left: 0.5in; margin-top: 0.08in; margin-bottom: 0.08in\">
                                              This toggle can be used to display or remove the mean household
                                              income for the characteristic chosen.</p>
                                              <h4 class=\"western\" style=\"margin-left: 0.5in; page-break-before: auto; page-break-after: avoid\">
                                              View Median</h4>
                                              <p style=\"margin-left: 0.5in; margin-top: 0.08in; margin-bottom: 0.08in; line-height: 120%\">
                                              This toggle can be used to display or remove the median household
                                              income for the characteristic chosen.</p>
                                              <p style=\"margin-top: 0.08in; margin-bottom: 0.08in; line-height: 120%\">
                                              <font face=\"Liberation Sans, sans-serif\"><font size=\"4\" style=\"font-size: 14pt\"><b>Axis
                                              Behavior</b></font></font></p>
                                              <p>The 'Axis Behavior' section of the Sidebar allows the user to
                                              control the Y-Axis.</p>
                                              <h4 class=\"western\" style=\"margin-left: 0.5in; page-break-before: auto; page-break-after: avoid\">
                                              Lock Y-Axis</h4>
                                              <p style=\"margin-left: 0.5in; line-height: 120%; page-break-before: auto; page-break-after: auto\">
                                              This toggle is used to lock and unlock the Y-Axis range. When locked
                                              the axis will be locked with a range of 0 to 8000. When unlocked, the
                                              'Set Y-Axis Limit' tool becomes available.</p>
                                              <h4 class=\"western\" style=\"margin-left: 0.5in; page-break-before: auto; page-break-after: avoid\">
                                              Set Y-Axis Limit</h4>
                                              <p style=\"margin-left: 0.5in; line-height: 120%; page-break-before: auto; page-break-after: auto\">
                                              This tool is used to scale the unlocked Y-Axis to the user
                                              preference, anywhere between 0 and 8000. This can be useful for
                                              seeing more detail on plots that have a low total number of
                                              households.</p>
                                              <h2 class=\"western\">The 'Plot' tab</h2>
                                              <p>The plot tab is where the plot defined by the currently selected
                                              parameters and axis behaviors is displayed. This plot will update
                                              whenever a parameter or behavior is modified.</p>
                                              <h2 class=\"western\">The 'Documentation' tab</h2>
                                              <p style=\"margin-bottom: 0in; line-height: 100%\">The documentation
                                              tab contains a brief user guide as well as reference documentation
                                              for the app.</p>
                                              <p style=\"border-top: none; border-bottom: 1px solid #000000; border-left: none; border-right: none; padding-top: 0in; padding-bottom: 0.03in; padding-left: 0in; padding-right: 0in\">
                                              <br/>
                                              <br/>
                                              
                                              </p>
                                              <h1 class=\"western\">References</h1>
                                              <p><font color=\"#000000\">The original data for this app can be found
                                              here in the 'All Races' data set found here:
                                              <a href=\"https://www.census.gov/hhes/www/cpstables/032014/hhinc/hinc01_000.htm\">https://www.census.gov/hhes/www/cpstables/032014/hhinc/hinc01_000.htm</a></font></p>
                                              <p>Source: U.S. Census Bureau, Current Population Survey, 2014 Annual
                                              Social and Economic Supplement</p>
                                              <p style=\"margin-top: 0.17in; margin-bottom: 0.08in; line-height: 100%; page-break-after: avoid\">
                                              <font face=\"Liberation Sans, sans-serif\"><font size=\"4\" style=\"font-size: 14pt\">Relevant
                                              Data Notes (from source):</font></font></p>
                                              <ul>
                                              <li/>
                                              <p><font color=\"#000000\">Data are based on the CPS ASEC sample
                                              of 68,000 addresses, see footnote
                                              (<a href=\"https://www.census.gov/hhes/www/cpstables/032014/hfootnotes.htm\">https://www.census.gov/hhes/www/cpstables/032014/hfootnotes.htm</a>).</font></p>
                                              <li/>
                                              <p>Numbers are in thousands.</p>
                                              <li/>
                                              <p>Households as of March of the following year.</p>
                                              <li/>
                                              <p>Median income is calculated using $2,500 income intervals.</p>
                                              <li/>
                                              <p>Medians falling in the upper open-ended interval are
                                              plugged with &quot;$250,000&quot;.</p>
                                              </ul>
                                              </body>
                                              </html>")
                        )
               )
          )
     )
)