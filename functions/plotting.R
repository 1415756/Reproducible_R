# function for making a graph 

plot_beak_flipper_figure <- function(beak_and_flipper_data){
  beak_and_flipper_data %>% 
    ggplot(beak_and_flipper_data, aes(x = culmen_length_mm, y = flipper_length_mm, color = species)) +
    geom_point(size = 2, alpha = 0.4) + scale_color_manual(values = c("darkorange","purple","cyan4")) +
    labs(title = "Scatterplot of Culmen Length vs flipper length", 
         x = "Culmen Length (mm)", 
         y = "Flipper Length (mm)",
         color = "Species") +
    theme_minimal() + theme(plot.title = element_text(size = 12))
  
  
}
# function for saving as a png file 
save_beak_flipper_plot_png <- function(beak_and_flipper_data, 
                                  filename, size, res, scaling){
  agg_png(filename, width   =  size, 
          height  =  size, 
          units   =  "cm", 
          res     =  res, 
          scaling =  scaling)
  beak_flipper_bar_graph <- plot_beak_flipper_figure(beak_and_flipper_data)
  print(beak_flipper_bar_graph )
  dev.off()
}

#function for saving as a svg file 
save_beak_flipper_plot_svg <- function(beak_and_flipper_data, 
                                  filename, size, scaling){
  size_inches = size/2.54
  svglite(filename, width   = size_inches, 
          height  = size_inches, 
          scaling = scaling)
  beak_flipper_bar_graph <- plot_beak_flipper_figure(beak_and_flipper_data)
print(beak_flipper_bar_graph )
dev.off()
}
