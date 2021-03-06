library(jamesclient)
library(groeivoorspeller)
library(grid)

file <- file.path(path.package("jamesclient"), "testdata", "client3.json")
p <- james::convert_bds_ind(file)


yname <- "hgt"
current.visit <- 3
target.visit <- 9
current.week <- p@ga
vpn <- chartbox::get_viewport("NJAA", yname)
g <- groeivoorspeller:::create.visit.lines(yname = yname, dnr = "smocc", design = "A",
                        tx = function(x) x * 12,
                        visits = c(current.visit, target.visit),
                        week = current.week,
                        vpn = vpn,
                        chart = g)
curves <- graph.persons(target = p, yname = "hgt",
                   matches = NULL,
                   visit1 = 3, visit2 = 0)

g <- setGrob(gTree = g,
             gPath = gPath(yname, "modules", "data"),
             newGrob = curves)
grid.draw(g)
