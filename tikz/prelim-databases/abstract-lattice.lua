\begin{luacode}

function make_clip()
	tex.print(string.format("\\clip (0,%f) -- (%f,0) -- (0,%f) -- (%f, 0) -- cycle;", -height, width, height, -width))
end

function draw_lattice()
	tex.print(string.format("\\draw[draw=none, fill=cLightGrey, fill opacity=.4] (0,%f) -- (%f,0) -- (0,%f) -- (%f, 0) -- cycle;", -height, width, height, -width))
end

function draw_cq(x, y, colour, label)
	tex.print(string.format("\\begin{scope}[xshift=%f cm, yshift=%f cm]", x, y+height))
	tex.print(string.format("\\draw[draw=%s, fill=%s, fill opacity=.4] (0,%f) -- (%f,0) -- (0,%f) -- (%f, 0) -- cycle;", colour, colour, -height, width, height, -width))
	tex.print(string.format("\\node[circle, fill=%s, minimum size=4pt, outer sep=1pt] (%s) at (0,%f) {};", colour, label, -height))
	tex.print("\\end{scope}")
end

function draw_db(x, y, colour, label)
	tex.print(string.format("\\node[circle, fill=%s, minimum size=2.5pt, outer sep=1pt] (%s) at (%f,%f) {};", colour, label, x, y))
end

\end{luacode}