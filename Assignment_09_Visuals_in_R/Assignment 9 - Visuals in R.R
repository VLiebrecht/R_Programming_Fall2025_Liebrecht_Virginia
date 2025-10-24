# Chose to use the iris dataset because it is small enough to manage but has great diversity across variables.
data("iris")

#I like creating custom color palettes, all colors from HTMLcolorcodes
Iris_colors <- c("#C9A9A6","#9C7A97", "#1B263B")

#Base R visualizations
#scatterplot of length by width of sepals
plot(iris$Sepal.Length, iris$Sepal.Width,
                main = "Base R: Iris Sepal Length vs. Width",
                xlab = "Sepal Length (cm)",
                ylab = "Sepal Width (cm)",
                col = Iris_colors[as.numeric(iris$Species)],
                pch = 20)
legend(x = 4.2, y = 4.3, #Creating a legend to distiquish the color associated with the species
       legend = levels(iris$Species), 
       col = Iris_colors, 
       pch = 20, 
       title = "Species", #referenced r-graph-gallery to fine tune legend
       cex = 0.7,
       inset = 0.02,
       box.lty = 1)

##Boxplot by species
boxplot(Sepal.Length ~ Species, data= iris,
        main = "Base R: Sepal Length by Species",
        xlab = "Species",
        ylab = "Sepal Length",
        col = Iris_colors)

#Lattice Graphics
library(lattice)

##conditional scatter plot
xyplot(Petal.Length ~ Petal.Width | Species, 
       data = iris,
       grid = TRUE,
       pch = 16, 
       cex = 0.8,
       alpha = 0.7,
       main = "Lattice: Petal Length vs. Width by Species",
       xlab = "Petal Width (cm)",
       ylab = "Petal Length (cm)"
       )

##Box-and-whisker plot
bwplot(Petal.Length ~ Species,
       data = iris,
       main = "Lattice: Petal Length by Species",
       xlab = "Species",
       ylab = "Petal Length (cm)",
       fill = Iris_colors)

#ggplot2
library(ggplot2)

#Scatterplot with smoothing
ggplot(iris, aes(Petal.Length, Petal.Width, color = factor(Species)))+
  geom_point(size = 2)+
  geom_smooth(method = "lm", color = "black", se= FALSE)+
  scale_color_manual(values = Iris_colors)+
  labs(title = "ggplot2: Petal Length vs. Width by Species",
       x= "Petal Length (cm)", 
       y= "Petal Width (cm)")

#Faceted histogram
ggplot(iris, aes(Sepal.Length, fill = Species))+
  geom_histogram(binwidth = 1, color = "black")+
  facet_wrap(~Species)+
  scale_fill_manual(values = Iris_colors)+
  labs(title = "ggplot2: Sepal Length Distribution by Species",
       x = "Sepal Length (cm)",
       y = "Count")
