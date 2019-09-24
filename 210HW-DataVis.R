library(tidyverse)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data=mpg)

## 3.2.4 Exercises

#  1. Nothing happens when you just run ggplot(data=mpg) on my end. But I believe there should be a display of data.
#  2. There are 11 columns and 234 rows.
#  3. drv
    #f is front-wheel drive, r is rear wheel drive, 4 is 4wd
?mpg
#  4.
    ggplot(data = mpg) + 
      geom_point(mapping = aes(x = cyl, y =hwy))
#  5. 
    ggplot(data = mpg) + 
      geom_point(mapping = aes(x = class, y =drv))
    
    #This plot is not useful because it is wrong. There is missing data and comparing class to drive is somewhat insignificant.
 
## 3.3
    ggplot(data = mpg) + 
      geom_point(mapping = aes(x = displ, y = hwy, color = class))
    
   # 1. ggplot(data = mpg) + 
    geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))
    
    #the code should be: 
    ggplot(data = mpg) + #PLUS has to come at the end of the first line. Not beginning of the one below it.
      geom_point(mapping = aes(x = displ, y = hwy), color = "blue")
  # 2. Categorical - model, trans, fl, class
    #Continuous - displ, year, cyl, drv, cty, hwy
  # 3. Mapping variables to continuous data seems to work better than mapping to catergorical.
  # 4. Mapping the same variable to multiple aesthetics makes them stand out clearer.
  # 5. 
    ?geom_point
    #stroke outlines a specific variable.
  # 6. Mapping to something other than a variable will highlight that specific condition ( <5 will highlight items less than 5).
    
# 3.5.1
  # 1. Not sure!
  # 2. 
    ggplot(data = mpg) + 
    geom_point(mapping = aes(x = drv, y = cyl))
  # 3. 
    ggplot(data = mpg) + 
      geom_point(mapping = aes(x = displ, y = hwy)) +
      facet_grid(drv ~ .) #facets in columns
    
    ggplot(data = mpg) + 
      geom_point(mapping = aes(x = displ, y = hwy)) +
      facet_grid(. ~ cyl) #facets in rows
  # 4.
    ggplot(data = mpg) + 
      geom_point(mapping = aes(x = displ, y = hwy)) + 
      facet_wrap(~ class, nrow = 2) #facet in this case organizes the data and makes it easier to review on a case by case basis.
    #With larger data sets, it may be easier to use color instead of facets, so that the data doesn't overwhelm across lots of small graphs.
  
  # 5. 
    ?facet_wrap
    #nrow is the number of rows. ncol is the number of columns. 
    ?facet_grid
    #facet_grid does not have arguments because the function uses discrete data.
    
  # 6. You should put the variable with more unique levels in the columns because columns have the capcity for more information to be displayed at once (usually).
    
## 3.6.1
    # 1. geom_smooth will present a line; geom_boxplot; geom_histogram; geom_area.
    # 2. I predicted a dot chart with a trend line.
    ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
      geom_point() + 
      geom_smooth(se = FALSE)
      # There are 3 lines that match the trends of the drv data.
    # 3. FALSE on the show legend function will fail to display the legend in a graph. 
    # 4. SE is the standard error computation.
    # 5. ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
    ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
      geom_point() + 
      geom_smooth()
    
    ggplot() + 
      geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) + 
      geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))
    # Both of these graphs are the same! One is more redundant.
    
## 3.7
    demo <- tribble(
      ~cut,         ~freq,
      "Fair",       1610,
      "Good",       4906,
      "Very Good",  12082,
      "Premium",    13791,
      "Ideal",      21551
    )
    # this overrides the data.
    
    ggplot(data = demo) +
      geom_bar(mapping = aes(x = cut, y = freq), stat = "identity")
    
## 3.7.1
    # 1. Geom_pointrange. 
    ggplot(diamonds) +
      geom_pointrange(aes(cut, depth, ymin = depth, ymax = depth))
    # 2. Geom_col does not alter the graph. Geom_Bar creates two variables and creates a graph along the y-axis.
    # 3. 
    # 4. stat_smooth() computes the standard deviation of the graph and places data along the y-axis.
    # 5. 
    
## 3.8.1 
      # 1. The data is too discrete and seems as though it should actually overlap instead of stack.
      # 2. Height and width control jittering.
      # 3. geom_count is a variation of geom_point (?)
      # 4. 
    ggplot(data = mpg, mapping = aes(x = class, y = displ)) + 
      geom_boxplot(aes(colour = drv))
    
## 3.9 
    # 1. 
    ggplot(mpg, aes(factor(1), fill = factor(cyl))) +
      geom_bar(width = 1) +
      coord_polar(theta = 'y')
    # 2. labs() controls the labelling for data.
    # 3. 
    # 4. There is a positive correlation, abline is a slope, fixed postions the data in a static way.
     
    
    
    