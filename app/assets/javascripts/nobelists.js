
visualize_nobelists = function(nobelists, $elem, options) {
  var results_canvas = $elem[0];

  var decades = pv.range(1890, 2010, 10);

  function print_date(date, dflt) { if (!date) return dflt; else return Date.parse(date, "%Y-%m-%d").format("%d %b %Y"); }
  function date_to_millis(date, dflt) { date = date || dflt; return Date.parse(date, "%Y-%m-%d").getTime(); }
  function birthdate_millis(n)  { return date_to_millis(n.birthdate, '1890-01-01') }
  function deathdate_millis(n)  { return date_to_millis(n.deathdate, '2010-01-01') }
  function nobel_year_millis(n) { return date_to_millis(null, n.nobel_year + '-01-01') }

  var w = options.width,
      h = options.height,
      r = w / 2,
      l = pv.Scale.linear(date_to_millis(null, '1890-01-01'), date_to_millis(null, '2010-01-01')).range(0, r);

  var vis = new pv.Panel()
          .canvas(results_canvas)
          .height(h).width(w);


  var pre_nobel = vis.add(pv.Wedge)
          .data(nobelists)
          .top(h/2)
          .left(w/2)
          .angle(2 * Math.PI / nobelists.length * 19/20)
          .innerRadius(function(n) { return l(birthdate_millis(n)) })
          .outerRadius(function(n) { return l(nobel_year_millis(n)) });

  pre_nobel.add(pv.Wedge)
          .innerRadius(function(n) { return l(nobel_year_millis(n))+5 })
          .outerRadius(function(n) { return l(deathdate_millis(n)) });

  pre_nobel.anchor("center").add(pv.Label)
          .textStyle("white")
          .text(function(n) { if (nobelists.length < 20) return n.name + " '" + n.nobel_year; else return '' });

  vis.add(pv.Label)
          .data(decades)
          .left(w/2)
          .top(function(d) { return r - l(date_to_millis(null, d + '-01-01')); })
          .textAlign("right")
          .textStyle("rgba(0, 0, 0, .3)")
          .text(function(d) { return d });

  vis.render();

  return $elem;
}
