# 1. Write a program to check whether a year (integer) entered by the user is a leap year or not? 

year = as.integer(readline(prompt="Enter a year: "))
if((year %% 4) == 0) {
  if((year %% 100) == 0) {
    if((year %% 400) == 0) {
      print(paste(year,"is a leap year"))
    } else {
      print(paste(year,"is not a leap year"))
    }
  } else {
    print(paste(year,"is a leap year"))
  }
} else {
  print(paste(year,"is not a leap year"))
}



#2. Write an R program to find the sum of natural numbers without formula using the if-else statement
#   and the while loop. 

# take input from the user
num = as.integer(readline(prompt = "Enter a number: "))
if(num < 0) {
  print("Enter a positive number")
} else {
  sum = 0
  # use while loop to iterate until zero
  while(num > 0) {
    sum = sum + num
    num = num - 1
  }
  print(paste("The sum is", sum))
}


#3. Write a program that prints the grades of the students according to the marks obtained. The grading
#   of the marks should be as follows. 

grade = as.integer(readline(prompt="Enter grade: "))
if(grade >= 800) {
  print(paste("A+"))
} else if (grade >= 700 & grade <= 799){
  print(paste("A"))
} else if (grade >= 500 & grade <= 699){
  print(paste("B+"))
} else if (grade >= 400 & grade <= 499){
  print(paste("B"))
} else if (grade >= 150 & grade <= 399){
  print(paste("C"))
} else {
  print(paste("D"))
}

# 4. Write an R program to make a simple calculator that can add, subtract, multiply and divide using switch cases and functions. 
add <- function(x, y) {
  return(x + y)
}
subtract <- function(x, y) {
  return(x - y)
}
multiply <- function(x, y) {
  return(x * y)
}
divide <- function(x, y) {
  return(x / y)
}
# take input from the user
print("Select operation.")
print("1.Add")
print("2.Subtract")
print("3.Multiply")
print("4.Divide")
choice = as.integer(readline(prompt="Enter choice[1/2/3/4]: "))
num1 = as.integer(readline(prompt="Enter first number: "))
num2 = as.integer(readline(prompt="Enter second number: "))
operator <- switch(choice,"+","-","*","/")
result <- switch(choice, add(num1, num2), subtract(num1, num2), multiply(num1, num2), divide(num1, num2))
print(paste(num1, operator, num2, "=", result))

#5 

install.packages(c("cowplot", "googleway","ggplot2","ggrepel","ggspatial","libwgeom","sf","rnaturalearth","rnaturalearthdata"))
library("ggplot2")


library("sf")


theme_set(theme_bw())

library("rnaturalearth")
library("rnaturalearthdata")

world <- ne_countries(scale = "medium", returnclass = "sf")
class(world)


#Basic plotting
ggplot(data = world) +
  geom_sf()

#title, subtitle
ggplot(data = world) +
  geom_sf() +
  xlab("Longitude") + ylab("Latitude") +
  ggtitle("World Map", subtitle = paste0("(",length(unique(world$name)),"countries"))

#Map color - geom_sf
ggplot(data = world) +
  geom_sf(color = "black", fill = "lightblue")



#Map better color
ggplot(data = world) +
  geom_sf(aes(fill = pop_est)) +
  scale_fill_viridis_c(option = "plasma", trans = "sqrt")



#or
ggplot(data = world)+
  geom_sf()+
  coord_sf(xlim=c(5.73,49.44),ylim=c(6.53,50.19),expand = FALSE)



#scale bar and north arrow 
library("ggspatial") #vcd #ggsn #prettYmaper 

ggplot(data = world)+
  geom_sf()+
  annotation_scale(location = "bl", width_hint = 0.5)+
  annotation_north_arrow(location = "bl",which_north ="true",
                         pad_x = unit(0.75,"in"), pad_y = unit(0.5,"in"),
                         style = north_arrow_fancy_orienteering)+
  coord_sf(xlim=c(5.73,49.44),ylim=c(6.53,50.19))


#plot mexico map with names
ggplot(data = world)+
  geom_sf()+
  geom_text(data = world_points, aes(x=X,y=Y, label=name),
            color = "black", fontface="bold",check_overlap = FALSE)+
  annotate(geom="text",x=-90,y=26, label ="gulf of mexico",
           fontface="italic", color="blue", size =6)+
  coord_sf(xlim=c(5.73,49.44),ylim=c(6.53,50.19))





#plot mexico map with names with arrow and scale (combination)
ggplot(data = world)+
  geom_sf()+
  geom_text(data = world_points, aes(x=X,y=Y, label=name),
            color = "black", fontface="bold",check_overlap = FALSE)+
  annotate(geom="text",x=-90,y=26, label ="gulf of mexico",
           fontface="italic", color="blue", size =6)+
  annotation_scale(location = "bl", width_hint = 0.5)+
  annotation_north_arrow(location = "bl",which_north ="true",
                         pad_x = unit(0.1,"in"), pad_y = unit(0.1,"in"),
                         style = north_arrow_nautical)+
  coord_sf(xlim=c(5.73,49.44),ylim=c(6.53,50.19),expand=FALSE)+
  xlab("Longitude")+
  ylab("Latitude")+
  ggtitle("Map of gulf of mexico")+
  theme(panel.grid.major = element_line(color = grey(0.5),
                                        linetype = "dashed",size = 0.5),
        panel.background = element_rect(fill="aliceblue"))





#################################################
library(ggplot2)
(gworld <- ggplot(data = world)+
    geom_sf(aes(fill = region_wb))+
    geom_rect(xmin = 5.73, xmax = 49.44, ymin = 6.53, ymax = 50.19,
              fill = NA, color = " Black", size = 1.5)+
    scale_fill_viridis_d(option = "plasma")+
    theme(panel.background = element_rect(fill = "azure"),
          panel.border = element_rect(fill = NA)))

(ggulf <- ggplot(data = world)+
    geom_sf(aes(fill = region_wb))+
    annotate(geom="text",x=-90,y=26, label ="gulf of mexico",
             fontface="italic", color="blue", size =6)+
    coord_sf(xlim=c(5.73,49.44),ylim=c(6.53,50.19),expand = FALSE) +
    
    scale_fill_viridis_d(option="RdBu"))
