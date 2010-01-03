--
-- This file contains controlled vocabulary keys used by the CEWS county business economy dataset
-- 

DROP TABLE IF EXISTS ownership CASCADE;
DROP TABLE IF EXISTS size CASCADE;
DROP TABLE IF EXISTS naics CASCADE;
DROP TABLE IF EXISTS businesses CASCADE;


CREATE TABLE ownership(code INTEGER PRIMARY KEY, title TEXT);

COPY ownership(code, title) FROM stdin WITH DELIMITER AS E'\t';
0	Total Covered
1	Federal Government
2	State Government
3	Local Government
4	International Government
5	Private
8	Total Government
9	Total U.I. Covered (Excludes Federal Government)
\.


CREATE TABLE size(code INTEGER PRIMARY KEY, title TEXT);

COPY size(code, title) FROM stdin WITH DELIMITER AS E'\t';
0	No employees declared
1	Fewer 20 employees
2	20 to 49 employees
3	50 to 99 employees
4	100 to 249 employees
5	250 to 499 employees
6	500 to 999 employees
7	1000 to 1999 employees
8	2000 or more employees
\.


CREATE TABLE naics(code CHAR(6) PRIMARY KEY, title TEXT);

COPY naics(code, title) FROM stdin WITH DELIMITER AS E'\t';
10    	10 Total, all industries
101    	101 Goods-Producing
1011   	1011 Natural Resources and Mining
1	1 Agriculture and Forestry
11    	NAICS 11 Agriculture, forestry, fishing and hunting
111   	NAICS 111 Crop production
1111  	NAICS 1111 Oilseed and grain farming
11111 	NAICS 11111 Soybean farming
111110	NAICS 111110 Soybean farming
11112 	NAICS 11112 Oilseed, except soybean, farming
111120	NAICS 111120 Oilseed, except soybean, farming
11113 	NAICS 11113 Dry pea and bean farming
111130	NAICS 111130 Dry pea and bean farming
11114 	NAICS 11114 Wheat farming
111140	NAICS 111140 Wheat farming
11115 	NAICS 11115 Corn farming
111150	NAICS 111150 Corn farming
11116 	NAICS 11116 Rice farming
111160	NAICS 111160 Rice farming
11119 	NAICS 11119 Other grain farming
111191	NAICS 111191 Oilseed and grain combination farming
111199	NAICS 111199 All other grain farming
1112  	NAICS 1112 Vegetable and melon farming
11121 	NAICS 11121 Vegetable and melon farming
111211	NAICS 111211 Potato farming
111219	NAICS 111219 Other vegetable and melon farming
1113  	NAICS 1113 Fruit and tree nut farming
11131 	NAICS 11131 Orange groves
111310	NAICS 111310 Orange groves
11132 	NAICS 11132 Citrus, except orange, groves
111320	NAICS 111320 Citrus, except orange, groves
11133 	NAICS 11133 Noncitrus fruit and tree nut farming
111331	NAICS 111331 Apple orchards
111332	NAICS 111332 Grape vineyards
111333	NAICS 111333 Strawberry farming
111334	NAICS 111334 Berry, except strawberry, farming
111335	NAICS 111335 Tree nut farming
111336	NAICS 111336 Fruit and tree nut combination farming
111339	NAICS 111339 Other noncitrus fruit farming
1114  	NAICS 1114 Greenhouse and nursery production
11141 	NAICS 11141 Food crops grown under cover
111411	NAICS 111411 Mushroom production
111419	NAICS 111419 Other food crops grown under cover
11142 	NAICS 11142 Nursery and floriculture production
111421	NAICS 111421 Nursery and tree production
111422	NAICS 111422 Floriculture production
1119  	NAICS 1119 Other crop farming
11191 	NAICS 11191 Tobacco farming
111910	NAICS 111910 Tobacco farming
11192 	NAICS 11192 Cotton farming
111920	NAICS 111920 Cotton farming
11193 	NAICS 11193 Sugarcane farming
111930	NAICS 111930 Sugarcane farming
11194 	NAICS 11194 Hay farming
111940	NAICS 111940 Hay farming
11199 	NAICS 11199 All other crop farming
111991	NAICS 111991 Sugar beet farming
111992	NAICS 111992 Peanut farming
111998	NAICS 111998 All other miscellaneous crop farming
112   	NAICS 112 Animal production
1121  	NAICS 1121 Cattle ranching and farming
11211 	NAICS 11211 Beef cattle ranching, farming, and feedlots
112111	NAICS 112111 Beef cattle ranching and farming
112112	NAICS 112112 Cattle feedlots
11212 	NAICS 11212 Dairy cattle and milk production
112120	NAICS 112120 Dairy cattle and milk production
1122  	NAICS 1122 Hog and pig farming
11221 	NAICS 11221 Hog and pig farming
112210	NAICS 112210 Hog and pig farming
1123  	NAICS 1123 Poultry and egg production
11231 	NAICS 11231 Chicken egg production
112310	NAICS 112310 Chicken egg production
11232 	NAICS 11232 Broilers and meat type chicken production
112320	NAICS 112320 Broilers and meat type chicken production
11233 	NAICS 11233 Turkey production
112330	NAICS 112330 Turkey production
11234 	NAICS 11234 Poultry hatcheries
112340	NAICS 112340 Poultry hatcheries
11239 	NAICS 11239 Other poultry production
112390	NAICS 112390 Other poultry production
1124  	NAICS 1124 Sheep and goat farming
11241 	NAICS 11241 Sheep farming
112410	NAICS 112410 Sheep farming
11242 	NAICS 11242 Goat farming
112420	NAICS 112420 Goat farming
1125  	NAICS 1125 Aquaculture
11251 	NAICS 11251 Aquaculture
112511	NAICS 112511 Finfish farming and fish hatcheries
112512	NAICS 112512 Shellfish farming
112519	NAICS 112519 Other aquaculture
1129  	NAICS 1129 Other animal production
11291 	NAICS 11291 Apiculture
112910	NAICS 112910 Apiculture
11292 	NAICS 11292 Horses and other equine production
112920	NAICS 112920 Horses and other equine production
11293 	NAICS 11293 Fur-bearing animal and rabbit production
112930	NAICS 112930 Fur-bearing animal and rabbit production
11299 	NAICS 11299 All other animal production
112990	NAICS 112990 All other animal production
113   	NAICS 113 Forestry and logging
1131  	NAICS 1131 Timber tract operations
11311 	NAICS 11311 Timber tract operations
113110	NAICS 113110 Timber tract operations
1132  	NAICS 1132 Forest nursery and gathering forest products
11321 	NAICS 11321 Forest nursery and gathering forest products
113210	NAICS 113210 Forest nursery and gathering forest products
1133  	NAICS 1133 Logging
11331 	NAICS 11331 Logging
113310	NAICS 113310 Logging
114   	NAICS 114 Fishing, hunting and trapping
1141  	NAICS 1141 Fishing
11411 	NAICS 11411 Fishing
114111	NAICS 114111 Finfish fishing
114112	NAICS 114112 Shellfish fishing
114119	NAICS 114119 Other marine fishing
1142  	NAICS 1142 Hunting and trapping
11421 	NAICS 11421 Hunting and trapping
114210	NAICS 114210 Hunting and trapping
115   	NAICS 115 Agriculture and forestry support activities
1151  	NAICS 1151 Support activities for crop production
11511 	NAICS 11511 Support activities for crop production
115111	NAICS 115111 Cotton ginning
115112	NAICS 115112 Soil preparation, planting, and cultivating
115113	NAICS 115113 Crop harvesting, primarily by machine
115114	NAICS 115114 Other postharvest crop activities
115115	NAICS 115115 Farm labor contractors and crew leaders
115116	NAICS 115116 Farm management services
1152  	NAICS 1152 Support activities for animal production
11521 	NAICS 11521 Support activities for animal production
115210	NAICS 115210 Support activities for animal production
1153  	NAICS 1153 Support activities for forestry
11531 	NAICS 11531 Support activities for forestry
115310	NAICS 115310 Support activities for forestry
2	2 Mining, Utilities, Construction
21    	NAICS 21 Mining, quarrying, and oil and gas extraction
211   	NAICS 211 Oil and gas extraction
2111  	NAICS 2111 Oil and gas extraction
21111 	NAICS 21111 Oil and gas extraction
211111	NAICS 211111 Crude petroleum and natural gas extraction
211112	NAICS 211112 Natural gas liquid extraction
212   	NAICS 212 Mining, except oil and gas
2121  	NAICS 2121 Coal mining
21211 	NAICS 21211 Coal mining
212111	NAICS 212111 Bituminous coal and lignite surface mining
212112	NAICS 212112 Bituminous coal underground mining
212113	NAICS 212113 Anthracite mining
2122  	NAICS 2122 Metal ore mining
21221 	NAICS 21221 Iron ore mining
212210	NAICS 212210 Iron ore mining
21222 	NAICS 21222 Gold ore and silver ore mining
212221	NAICS 212221 Gold ore mining
212222	NAICS 212222 Silver ore mining
21223 	NAICS 21223 Copper, nickel, lead, and zinc mining
212231	NAICS 212231 Lead ore and zinc ore mining
212234	NAICS 212234 Copper ore and nickel ore mining
21229 	NAICS 21229 Other metal ore mining
212291	NAICS 212291 Uranium-radium-vanadium ore mining
212299	NAICS 212299 All other metal ore mining
2123  	NAICS 2123 Nonmetallic mineral mining and quarrying
21231 	NAICS 21231 Stone mining and quarrying
212311	NAICS 212311 Dimension stone mining and quarrying
212312	NAICS 212312 Crushed and broken limestone mining
212313	NAICS 212313 Crushed and broken granite mining
212319	NAICS 212319 Other crushed and broken stone mining
21232 	NAICS 21232 Sand, gravel, clay, and refractory mining
212321	NAICS 212321 Construction sand and gravel mining
212322	NAICS 212322 Industrial sand mining
212324	NAICS 212324 Kaolin and ball clay mining
212325	NAICS 212325 Clay, ceramic, and refractory minerals mining
21239 	NAICS 21239 Other nonmetallic mineral mining
212391	NAICS 212391 Potash, soda, and borate mineral mining
212392	NAICS 212392 Phosphate rock mining
212393	NAICS 212393 Other chemical and fertilizer mineral mining
212399	NAICS 212399 All other nonmetallic mineral mining
213   	NAICS 213 Support activities for mining
2131  	NAICS 2131 Support activities for mining
21311 	NAICS 21311 Support activities for mining
213111	NAICS 213111 Drilling oil and gas wells
213112	NAICS 213112 Support activities for oil and gas operations
213113	NAICS 213113 Support activities for coal mining
213114	NAICS 213114 Support activities for metal mining
213115	NAICS 213115 Support activities for nonmetallic minerals
22    	NAICS 22 Utilities
221   	NAICS 221 Utilities
2211  	NAICS 2211 Power generation and supply
22111 	NAICS 22111 Electric power generation
221111	NAICS 221111 Hydroelectric power generation
221112	NAICS 221112 Fossil fuel electric power generation
221113	NAICS 221113 Nuclear electric power generation
221119	NAICS 221119 Other electric power generation
22112 	NAICS 22112 Electric power transmission and distribution
221121	NAICS 221121 Electric bulk power transmission and control
221122	NAICS 221122 Electric power distribution
2212  	NAICS 2212 Natural gas distribution
22121 	NAICS 22121 Natural gas distribution
221210	NAICS 221210 Natural gas distribution
2213  	NAICS 2213 Water, sewage and other systems
22131 	NAICS 22131 Water supply and irrigation systems
221310	NAICS 221310 Water supply and irrigation systems
22132 	NAICS 22132 Sewage treatment facilities
221320	NAICS 221320 Sewage treatment facilities
22133 	NAICS 22133 Steam and air-conditioning supply
221330	NAICS 221330 Steam and air-conditioning supply
1012  	1012 Construction
23    	NAICS 23 Construction
236   	NAICS 236 Construction of buildings
2361  	NAICS 2361 Residential building construction
23611 	NAICS 23611 Residential building construction
236115	NAICS 236115 New single-family general contractors
236116	NAICS 236116 New multifamily general contractors
236117	NAICS 236117 New housing operative builders
236118	NAICS 236118 Residential remodelers
2362  	NAICS 2362 Nonresidential building construction
23621 	NAICS 23621 Industrial building construction
236210	NAICS 236210 Industrial building construction
23622 	NAICS 23622 Commercial building construction
236220	NAICS 236220 Commercial building construction
237   	NAICS 237 Heavy and civil engineering construction
2371  	NAICS 2371 Utility system construction
23711 	NAICS 23711 Water and sewer system construction
237110	NAICS 237110 Water and sewer system construction
23712 	NAICS 23712 Oil and gas pipeline construction
237120	NAICS 237120 Oil and gas pipeline construction
23713 	NAICS 23713 Power and communication system construction
237130	NAICS 237130 Power and communication system construction
2372  	NAICS 2372 Land subdivision
23721 	NAICS 23721 Land subdivision
237210	NAICS 237210 Land subdivision
2373  	NAICS 2373 Highway, street, and bridge construction
23731 	NAICS 23731 Highway, street, and bridge construction
237310	NAICS 237310 Highway, street, and bridge construction
2379  	NAICS 2379 Other heavy construction
23799 	NAICS 23799 Other heavy construction
237990	NAICS 237990 Other heavy construction
238   	NAICS 238 Specialty trade contractors
2381  	NAICS 2381 Building foundation and exterior contractors
23811 	NAICS 23811 Poured concrete structure contractors
238111	NAICS 238111 Residential poured foundation contractors
238112	NAICS 238112 Nonresidential poured foundation contractors
23812 	NAICS 23812 Steel and precast concrete contractors
238121	NAICS 238121 Residential structural steel contractors
238122	NAICS 238122 Nonresidential structural steel contractors
23813 	NAICS 23813 Framing contractors
238131	NAICS 238131 Residential framing contractors
238132	NAICS 238132 Nonresidential framing contractors
23814 	NAICS 23814 Masonry contractors
238141	NAICS 238141 Residential masonry contractors
238142	NAICS 238142 Nonresidential masonry contractors
23815 	NAICS 23815 Glass and glazing contractors
238151	NAICS 238151 Residential glass and glazing contractors
238152	NAICS 238152 Nonresidential glass and glazing contractors
23816 	NAICS 23816 Roofing contractors
238161	NAICS 238161 Residential roofing contractors
238162	NAICS 238162 Nonresidential roofing contractors
23817 	NAICS 23817 Siding contractors
238171	NAICS 238171 Residential siding contractors
238172	NAICS 238172 Nonresidential siding contractors
23819 	NAICS 23819 Other building exterior contractors
238191	NAICS 238191 Other residential exterior contractors
238192	NAICS 238192 Other nonresidential exterior contractors
2382  	NAICS 2382 Building equipment contractors
23821 	NAICS 23821 Electrical and wiring contractors
238211	NAICS 238211 Residential electrical contractors
238212	NAICS 238212 Nonresidential electrical contractors
23822 	NAICS 23822 Plumbing and HVAC contractors
238221	NAICS 238221 Residential plumbing and HVAC contractors
238222	NAICS 238222 Nonresidential plumbing and HVAC contractors
23829 	NAICS 23829 Other building equipment contractors
238291	NAICS 238291 Other residential building equipment contractors
238292	NAICS 238292 Other nonresidential building equipment contractors
2383  	NAICS 2383 Building finishing contractors
23831 	NAICS 23831 Drywall and insulation contractors
238311	NAICS 238311 Residential drywall contractors
238312	NAICS 238312 Nonresidential drywall contractors
23832 	NAICS 23832 Painting and wall covering contractors
238321	NAICS 238321 Residential painting contractors
238322	NAICS 238322 Nonresidential painting contractors
23833 	NAICS 23833 Flooring contractors
238331	NAICS 238331 Residential flooring contractors
238332	NAICS 238332 Nonresidential flooring contractors
23834 	NAICS 23834 Tile and terrazzo contractors
238341	NAICS 238341 Residential tile and terrazzo contractors
238342	NAICS 238342 Nonresidential tile and terrazzo contractors
23835 	NAICS 23835 Finish carpentry contractors
238351	NAICS 238351 Residential finish carpentry contractors
238352	NAICS 238352 Nonresidential finish carpentry contractors
23839 	NAICS 23839 Other building finishing contractors
238391	NAICS 238391 Other residential finishing contractors
238392	NAICS 238392 Other nonresidential finishing contractors
2389  	NAICS 2389 Other specialty trade contractors
23891 	NAICS 23891 Site preparation contractors
238911	NAICS 238911 Residential site preparation contractors
238912	NAICS 238912 Nonresidential site preparation contractors
23899 	NAICS 23899 All other specialty trade contractors
238991	NAICS 238991 All other residential trade contractors
238992	NAICS 238992 All other nonresidential trade contractors
1013  	1013 Manufacturing
3	3 Manufacturing
31 	31 Food Manufacturing
311   	NAICS 311 Food manufacturing
3111  	NAICS 3111 Animal food manufacturing
31111 	NAICS 31111 Animal food manufacturing
311111	NAICS 311111 Dog and cat food manufacturing
311119	NAICS 311119 Other animal food manufacturing
3112  	NAICS 3112 Grain and oilseed milling
31121 	NAICS 31121 Flour milling and malt manufacturing
311211	NAICS 311211 Flour milling
311212	NAICS 311212 Rice milling
311213	NAICS 311213 Malt manufacturing
31122 	NAICS 31122 Starch and vegetable oil manufacturing
311221	NAICS 311221 Wet corn milling
311222	NAICS 311222 Soybean processing
311223	NAICS 311223 Other oilseed processing
311225	NAICS 311225 Fats and oils refining and blending
31123 	NAICS 31123 Breakfast cereal manufacturing
311230	NAICS 311230 Breakfast cereal manufacturing
3113  	NAICS 3113 Sugar and confectionery product manufacturing
31131 	NAICS 31131 Sugar manufacturing
311311	NAICS 311311 Sugarcane mills
311312	NAICS 311312 Cane sugar refining
311313	NAICS 311313 Beet sugar manufacturing
31132 	NAICS 31132 Confectionery manufacturing from cacao beans
311320	NAICS 311320 Confectionery manufacturing from cacao beans
31133 	NAICS 31133 Confectionery mfg. from purchased chocolate
311330	NAICS 311330 Confectionery mfg. from purchased chocolate
31134 	NAICS 31134 Nonchocolate confectionery manufacturing
311340	NAICS 311340 Nonchocolate confectionery manufacturing
3114  	NAICS 3114 Fruit and vegetable preserving and specialty
31141 	NAICS 31141 Frozen food manufacturing
311411	NAICS 311411 Frozen fruit and vegetable manufacturing
311412	NAICS 311412 Frozen specialty food manufacturing
31142 	NAICS 31142 Fruit and vegetable canning and drying
311421	NAICS 311421 Fruit and vegetable canning
311422	NAICS 311422 Specialty canning
311423	NAICS 311423 Dried and dehydrated food manufacturing
3115  	NAICS 3115 Dairy product manufacturing
31151 	NAICS 31151 Dairy product, except frozen, manufacturing
311511	NAICS 311511 Fluid milk manufacturing
311512	NAICS 311512 Creamery butter manufacturing
311513	NAICS 311513 Cheese manufacturing
311514	NAICS 311514 Dry, condensed, and evaporated dairy products
31152 	NAICS 31152 Ice cream and frozen dessert manufacturing
311520	NAICS 311520 Ice cream and frozen dessert manufacturing
3116  	NAICS 3116 Animal slaughtering and processing
31161 	NAICS 31161 Animal slaughtering and processing
311611	NAICS 311611 Animal, except poultry, slaughtering
311612	NAICS 311612 Meat processed from carcasses
311613	NAICS 311613 Rendering and meat byproduct processing
311615	NAICS 311615 Poultry processing
3117  	NAICS 3117 Seafood product preparation and packaging
31171 	NAICS 31171 Seafood product preparation and packaging
311711	NAICS 311711 Seafood canning
311712	NAICS 311712 Fresh and frozen seafood processing
3118  	NAICS 3118 Bakeries and tortilla manufacturing
31181 	NAICS 31181 Bread and bakery product manufacturing
311811	NAICS 311811 Retail bakeries
311812	NAICS 311812 Commercial bakeries
311813	NAICS 311813 Frozen cakes and other pastries manufacturing
31182 	NAICS 31182 Cookie, cracker, and pasta manufacturing
311821	NAICS 311821 Cookie and cracker manufacturing
311822	NAICS 311822 Mixes and dough made from purchased flour
311823	NAICS 311823 Dry pasta manufacturing
31183 	NAICS 31183 Tortilla manufacturing
311830	NAICS 311830 Tortilla manufacturing
3119  	NAICS 3119 Other food manufacturing
31191 	NAICS 31191 Snack food manufacturing
311911	NAICS 311911 Roasted nuts and peanut butter manufacturing
311919	NAICS 311919 Other snack food manufacturing
31192 	NAICS 31192 Coffee and tea manufacturing
311920	NAICS 311920 Coffee and tea manufacturing
31193 	NAICS 31193 Flavoring syrup and concentrate manufacturing
311930	NAICS 311930 Flavoring syrup and concentrate manufacturing
31194 	NAICS 31194 Seasoning and dressing manufacturing
311941	NAICS 311941 Mayonnaise, dressing, and sauce manufacturing
311942	NAICS 311942 Spice and extract manufacturing
31199 	NAICS 31199 All other food manufacturing
311991	NAICS 311991 Perishable prepared food manufacturing
311999	NAICS 311999 All other miscellaneous food manufacturing
312   	NAICS 312 Beverage and tobacco product manufacturing
3121  	NAICS 3121 Beverage manufacturing
31211 	NAICS 31211 Soft drink and ice manufacturing
312111	NAICS 312111 Soft drink manufacturing
312112	NAICS 312112 Bottled water manufacturing
312113	NAICS 312113 Ice manufacturing
31212 	NAICS 31212 Breweries
312120	NAICS 312120 Breweries
31213 	NAICS 31213 Wineries
312130	NAICS 312130 Wineries
31214 	NAICS 31214 Distilleries
312140	NAICS 312140 Distilleries
3122  	NAICS 3122 Tobacco manufacturing
31221 	NAICS 31221 Tobacco stemming and redrying
312210	NAICS 312210 Tobacco stemming and redrying
31222 	NAICS 31222 Tobacco product manufacturing
312221	NAICS 312221 Cigarette manufacturing
312229	NAICS 312229 Other tobacco product manufacturing
313   	NAICS 313 Textile mills
3131  	NAICS 3131 Fiber, yarn, and thread mills
31311 	NAICS 31311 Fiber, yarn, and thread mills
313111	NAICS 313111 Yarn spinning mills
313112	NAICS 313112 Yarn texturizing and twisting mills
313113	NAICS 313113 Thread mills
3132  	NAICS 3132 Fabric mills
31321 	NAICS 31321 Broadwoven fabric mills
313210	NAICS 313210 Broadwoven fabric mills
31322 	NAICS 31322 Narrow fabric mills and schiffli embroidery
313221	NAICS 313221 Narrow fabric mills
313222	NAICS 313222 Schiffli machine embroidery
31323 	NAICS 31323 Nonwoven fabric mills
313230	NAICS 313230 Nonwoven fabric mills
31324 	NAICS 31324 Knit fabric mills
313241	NAICS 313241 Weft knit fabric mills
313249	NAICS 313249 Other knit fabric and lace mills
3133  	NAICS 3133 Textile and fabric finishing mills
31331 	NAICS 31331 Textile and fabric finishing mills
313311	NAICS 313311 Broadwoven fabric finishing mills
313312	NAICS 313312 Other textile and fabric finishing mills
31332 	NAICS 31332 Fabric coating mills
313320	NAICS 313320 Fabric coating mills
314   	NAICS 314 Textile product mills
3141  	NAICS 3141 Textile furnishings mills
31411 	NAICS 31411 Carpet and rug mills
314110	NAICS 314110 Carpet and rug mills
31412 	NAICS 31412 Curtain and linen mills
314121	NAICS 314121 Curtain and drapery mills
314129	NAICS 314129 Other household textile product mills
3149  	NAICS 3149 Other textile product mills
31491 	NAICS 31491 Textile bag and canvas mills
314911	NAICS 314911 Textile bag mills
314912	NAICS 314912 Canvas and related product mills
31499 	NAICS 31499 All other textile product mills
314991	NAICS 314991 Rope, cordage, and twine mills
314992	NAICS 314992 Tire cord and tire fabric mills
314999	NAICS 314999 All other miscellaneous textile product mills
315   	NAICS 315 Apparel manufacturing
3151  	NAICS 3151 Apparel knitting mills
31511 	NAICS 31511 Hosiery and sock mills
315111	NAICS 315111 Sheer hosiery mills
315119	NAICS 315119 Other hosiery and sock mills
31519 	NAICS 31519 Other apparel knitting mills
315191	NAICS 315191 Outerwear knitting mills
315192	NAICS 315192 Underwear and nightwear knitting mills
3152  	NAICS 3152 Cut and sew apparel manufacturing
31521 	NAICS 31521 Cut and sew apparel contractors
315211	NAICS 315211 Men's and boys apparel contractors
315212	NAICS 315212 Women's, girls, infants apparel contractors
31522 	NAICS 31522 Men's and boys' cut and sew apparel mfg
315221	NAICS 315221 Men's and boys' underwear and nightwear mfg
315222	NAICS 315222 Men's and boys' suit, coat, and overcoat mfg
315223	NAICS 315223 Men's and boys' shirt, except work shirt, mfg
315224	NAICS 315224 Men's and boys' pants, except work pants, mfg
315225	NAICS 315225 Men's and boys' work clothing manufacturing
315228	NAICS 315228 Other men's and boys' outerwear manufacturing
31523 	NAICS 31523 Women's and girls cut and sew apparel mfg
315231	NAICS 315231 Women's and girls lingerie and nightwear mfg
315232	NAICS 315232 Women's and girls blouse and shirt mfg
315233	NAICS 315233 Women's and girls dress manufacturing
315234	NAICS 315234 Women's and girls suit, coat, and skirt mfg
315239	NAICS 315239 Other women's and girls outerwear mfg
31529 	NAICS 31529 Other cut and sew apparel manufacturing
315291	NAICS 315291 Infants' cut and sew apparel manufacturing
315292	NAICS 315292 Fur and leather apparel manufacturing
315299	NAICS 315299 All other cut and sew apparel manufacturing
3159  	NAICS 3159 Accessories and other apparel manufacturing
31599 	NAICS 31599 Accessories and other apparel manufacturing
315991	NAICS 315991 Hat, cap, and millinery manufacturing
315992	NAICS 315992 Glove and mitten manufacturing
315993	NAICS 315993 Men's and boys' neckwear manufacturing
315999	NAICS 315999 All other accessory and apparel manufacturing
316   	NAICS 316 Leather and allied product manufacturing
3161  	NAICS 3161 Leather and hide tanning and finishing
31611 	NAICS 31611 Leather and hide tanning and finishing
316110	NAICS 316110 Leather and hide tanning and finishing
3162  	NAICS 3162 Footwear manufacturing
31621 	NAICS 31621 Footwear manufacturing
316211	NAICS 316211 Rubber and plastics footwear manufacturing
316212	NAICS 316212 House slipper manufacturing
316213	NAICS 316213 Men's nonathletic footwear manufacturing
316214	NAICS 316214 Women's nonathletic footwear manufacturing
316219	NAICS 316219 Other footwear manufacturing
3169  	NAICS 3169 Other leather product manufacturing
31699 	NAICS 31699 Other leather product manufacturing
316991	NAICS 316991 Luggage manufacturing
316992	NAICS 316992 Women's handbag and purse manufacturing
316993	NAICS 316993 Other personal leather good manufacturing
316999	NAICS 316999 All other leather and allied good mfg.
32	32 Wood product manufacturing
321   	NAICS 321 Wood product manufacturing
3211  	NAICS 3211 Sawmills and wood preservation
32111 	NAICS 32111 Sawmills and wood preservation
321113	NAICS 321113 Sawmills
321114	NAICS 321114 Wood preservation
3212  	NAICS 3212 Plywood and engineered wood product mfg.
32121 	NAICS 32121 Plywood and engineered wood product mfg.
321211	NAICS 321211 Hardwood veneer and plywood manufacturing
321212	NAICS 321212 Softwood veneer and plywood manufacturing
321213	NAICS 321213 Engineered wood member manufacturing
321214	NAICS 321214 Truss manufacturing
321219	NAICS 321219 Reconstituted wood product manufacturing
3219  	NAICS 3219 Other wood product manufacturing
32191 	NAICS 32191 Millwork
321911	NAICS 321911 Wood window and door manufacturing
321912	NAICS 321912 Cut stock, resawing lumber, and planing
321918	NAICS 321918 Other millwork, including flooring
32192 	NAICS 32192 Wood container and pallet manufacturing
321920	NAICS 321920 Wood container and pallet manufacturing
32199 	NAICS 32199 All other wood product manufacturing
321991	NAICS 321991 Manufactured home, mobile home, manufacturing
321992	NAICS 321992 Prefabricated wood building manufacturing
321999	NAICS 321999 Miscellaneous wood product manufacturing
322   	NAICS 322 Paper manufacturing
3221  	NAICS 3221 Pulp, paper, and paperboard mills
32211 	NAICS 32211 Pulp mills
322110	NAICS 322110 Pulp mills
32212 	NAICS 32212 Paper mills
322121	NAICS 322121 Paper, except newsprint, mills
322122	NAICS 322122 Newsprint mills
32213 	NAICS 32213 Paperboard mills
322130	NAICS 322130 Paperboard mills
3222  	NAICS 3222 Converted paper product manufacturing
32221 	NAICS 32221 Paperboard container manufacturing
322211	NAICS 322211 Corrugated and solid fiber box manufacturing
322212	NAICS 322212 Folding paperboard box manufacturing
322213	NAICS 322213 Setup paperboard box manufacturing
322214	NAICS 322214 Fiber can, tube, and drum manufacturing
322215	NAICS 322215 Nonfolding sanitary food container mfg.
32222 	NAICS 32222 Paper bag and coated and treated paper mfg.
322221	NAICS 322221 Coated and laminated packaging paper mfg.
322222	NAICS 322222 Coated and laminated paper manufacturing
322223	NAICS 322223 Coated paper bag and pouch manufacturing
322224	NAICS 322224 Uncoated paper and multiwall bag mfg.
322225	NAICS 322225 Flexible packaging foil manufacturing
322226	NAICS 322226 Surface-coated paperboard manufacturing
32223 	NAICS 32223 Stationery product manufacturing
322231	NAICS 322231 Die-cut paper office supplies manufacturing
322232	NAICS 322232 Envelope manufacturing
322233	NAICS 322233 Stationery and related product manufacturing
32229 	NAICS 32229 Other converted paper product manufacturing
322291	NAICS 322291 Sanitary paper product manufacturing
322299	NAICS 322299 All other converted paper product mfg.
323   	NAICS 323 Printing and related support activities
3231  	NAICS 3231 Printing and related support activities
32311 	NAICS 32311 Printing
323110	NAICS 323110 Commercial lithographic printing
323111	NAICS 323111 Commercial gravure printing
323112	NAICS 323112 Commercial flexographic printing
323113	NAICS 323113 Commercial screen printing
323114	NAICS 323114 Quick printing
323115	NAICS 323115 Digital printing
323116	NAICS 323116 Manifold business forms printing
323117	NAICS 323117 Books printing
323118	NAICS 323118 Blankbook and looseleaf binder manufacturing
323119	NAICS 323119 Other commercial printing
32312 	NAICS 32312 Support activities for printing
323121	NAICS 323121 Tradebinding and related work
323122	NAICS 323122 Prepress services
324   	NAICS 324 Petroleum and coal products manufacturing
3241  	NAICS 3241 Petroleum and coal products manufacturing
32411 	NAICS 32411 Petroleum refineries
324110	NAICS 324110 Petroleum refineries
32412 	NAICS 32412 Asphalt paving and roofing materials mfg.
324121	NAICS 324121 Asphalt paving mixture and block mfg.
324122	NAICS 324122 Asphalt shingle and coating materials mfg.
32419 	NAICS 32419 Other petroleum and coal products mfg.
324191	NAICS 324191 Petroleum lubricating oil and grease mfg.
324199	NAICS 324199 All other petroleum and coal products mfg.
325   	NAICS 325 Chemical manufacturing
3251  	NAICS 3251 Basic chemical manufacturing
32511 	NAICS 32511 Petrochemical manufacturing
325110	NAICS 325110 Petrochemical manufacturing
32512 	NAICS 32512 Industrial gas manufacturing
325120	NAICS 325120 Industrial gas manufacturing
32513 	NAICS 32513 Synthetic dye and pigment manufacturing
325131	NAICS 325131 Inorganic dye and pigment manufacturing
325132	NAICS 325132 Synthetic organic dye and pigment mfg.
32518 	NAICS 32518 Other basic inorganic chemical manufacturing
325181	NAICS 325181 Alkalies and chlorine manufacturing
325182	NAICS 325182 Carbon black manufacturing
325188	NAICS 325188 All other basic inorganic chemical mfg.
32519 	NAICS 32519 Other basic organic chemical manufacturing
325191	NAICS 325191 Gum and wood chemical manufacturing
325192	NAICS 325192 Cyclic crude and intermediate manufacturing
325193	NAICS 325193 Ethyl alcohol manufacturing
325199	NAICS 325199 All other basic organic chemical mfg.
3252  	NAICS 3252 Resin, rubber, and artificial fibers mfg.
32521 	NAICS 32521 Resin and synthetic rubber manufacturing
325211	NAICS 325211 Plastics material and resin manufacturing
325212	NAICS 325212 Synthetic rubber manufacturing
32522 	NAICS 32522 Artificial fibers and filaments manufacturing
325221	NAICS 325221 Cellulosic organic fiber manufacturing
325222	NAICS 325222 Noncellulosic organic fiber manufacturing
3253  	NAICS 3253 Agricultural chemical manufacturing
32531 	NAICS 32531 Fertilizer manufacturing
325311	NAICS 325311 Nitrogenous fertilizer manufacturing
325312	NAICS 325312 Phosphatic fertilizer manufacturing
325314	NAICS 325314 Fertilizer, mixing only, manufacturing
32532 	NAICS 32532 Pesticide and other ag. chemical mfg.
325320	NAICS 325320 Pesticide and other ag. chemical mfg.
3254  	NAICS 3254 Pharmaceutical and medicine manufacturing
32541 	NAICS 32541 Pharmaceutical and medicine manufacturing
325411	NAICS 325411 Medicinal and botanical manufacturing
325412	NAICS 325412 Pharmaceutical preparation manufacturing
325413	NAICS 325413 In-vitro diagnostic substance manufacturing
325414	NAICS 325414 Other biological product manufacturing
3255  	NAICS 3255 Paint, coating, and adhesive manufacturing
32551 	NAICS 32551 Paint and coating manufacturing
325510	NAICS 325510 Paint and coating manufacturing
32552 	NAICS 32552 Adhesive manufacturing
325520	NAICS 325520 Adhesive manufacturing
3256  	NAICS 3256 Soap, cleaning compound, and toiletry mfg.
32561 	NAICS 32561 Soap and cleaning compound manufacturing
325611	NAICS 325611 Soap and other detergent manufacturing
325612	NAICS 325612 Polish and other sanitation good mfg.
325613	NAICS 325613 Surface active agent manufacturing
32562 	NAICS 32562 Toilet preparation manufacturing
325620	NAICS 325620 Toilet preparation manufacturing
3259  	NAICS 3259 Other chemical product and preparation mfg.
32591 	NAICS 32591 Printing ink manufacturing
325910	NAICS 325910 Printing ink manufacturing
32592 	NAICS 32592 Explosives manufacturing
325920	NAICS 325920 Explosives manufacturing
32599 	NAICS 32599 All other chemical preparation manufacturing
325991	NAICS 325991 Custom compounding of purchased resins
325992	NAICS 325992 Photographic film and chemical manufacturing
325998	NAICS 325998 Other miscellaneous chemical product mfg.
326   	NAICS 326 Plastics and rubber products manufacturing
3261  	NAICS 3261 Plastics product manufacturing
32611 	NAICS 32611 Plastics packaging materials, film and sheet
326111	NAICS 326111 Plastics bag and pouch manufacturing
326112	NAICS 326112 Plastics packaging film and sheet mfg.
326113	NAICS 326113 Nonpackaging plastics film and sheet mfg.
32612 	NAICS 32612 Plastics pipe, fittings, and profile shapes
326121	NAICS 326121 Unlaminated plastics profile shape mfg.
326122	NAICS 326122 Plastics pipe and pipe fitting manufacturing
32613 	NAICS 32613 Laminated plastics plate, sheet, and shapes
326130	NAICS 326130 Laminated plastics plate, sheet, and shapes
32614 	NAICS 32614 Polystyrene foam product manufacturing
326140	NAICS 326140 Polystyrene foam product manufacturing
32615 	NAICS 32615 Urethane and other foam product manufacturing
326150	NAICS 326150 Urethane and other foam product manufacturing
32616 	NAICS 32616 Plastics bottle manufacturing
326160	NAICS 326160 Plastics bottle manufacturing
32619 	NAICS 32619 Other plastics product manufacturing
326191	NAICS 326191 Plastics plumbing fixture manufacturing
326192	NAICS 326192 Resilient floor covering manufacturing
326199	NAICS 326199 All other plastics product manufacturing
3262  	NAICS 3262 Rubber product manufacturing
32621 	NAICS 32621 Tire manufacturing
326211	NAICS 326211 Tire manufacturing, except retreading
326212	NAICS 326212 Tire retreading
32622 	NAICS 32622 Rubber and plastics hose and belting mfg.
326220	NAICS 326220 Rubber and plastics hose and belting mfg.
32629 	NAICS 32629 Other rubber product manufacturing
326291	NAICS 326291 Rubber product mfg. for mechanical use
326299	NAICS 326299 All other rubber product manufacturing
327   	NAICS 327 Nonmetallic mineral product manufacturing
3271  	NAICS 3271 Clay product and refractory manufacturing
32711 	NAICS 32711 Pottery, ceramics, and plumbing fixture mfg.
327111	NAICS 327111 Vitreous china plumbing fixture manufacturing
327112	NAICS 327112 Vitreous china and earthenware articles mfg.
327113	NAICS 327113 Porcelain electrical supply manufacturing
32712 	NAICS 32712 Clay building material and refractories mfg.
327121	NAICS 327121 Brick and structural clay tile manufacturing
327122	NAICS 327122 Ceramic wall and floor tile manufacturing
327123	NAICS 327123 Other structural clay product manufacturing
327124	NAICS 327124 Clay refractory manufacturing
327125	NAICS 327125 Nonclay refractory manufacturing
3272  	NAICS 3272 Glass and glass product manufacturing
32721 	NAICS 32721 Glass and glass product manufacturing
327211	NAICS 327211 Flat glass manufacturing
327212	NAICS 327212 Other pressed and blown glass and glassware
327213	NAICS 327213 Glass container manufacturing
327215	NAICS 327215 Glass product mfg. made of purchased glass
3273  	NAICS 3273 Cement and concrete product manufacturing
32731 	NAICS 32731 Cement manufacturing
327310	NAICS 327310 Cement manufacturing
32732 	NAICS 32732 Ready-mix concrete manufacturing
327320	NAICS 327320 Ready-mix concrete manufacturing
32733 	NAICS 32733 Concrete pipe, brick, and block manufacturing
327331	NAICS 327331 Concrete block and brick manufacturing
327332	NAICS 327332 Concrete pipe manufacturing
32739 	NAICS 32739 Other concrete product manufacturing
327390	NAICS 327390 Other concrete product manufacturing
3274  	NAICS 3274 Lime and gypsum product manufacturing
32741 	NAICS 32741 Lime manufacturing
327410	NAICS 327410 Lime manufacturing
32742 	NAICS 32742 Gypsum product manufacturing
327420	NAICS 327420 Gypsum product manufacturing
3279  	NAICS 3279 Other nonmetallic mineral products
32791 	NAICS 32791 Abrasive product manufacturing
327910	NAICS 327910 Abrasive product manufacturing
32799 	NAICS 32799 All other nonmetallic mineral products mfg.
327991	NAICS 327991 Cut stone and stone product manufacturing
327992	NAICS 327992 Ground or treated minerals and earths mfg.
327993	NAICS 327993 Mineral wool manufacturing
327999	NAICS 327999 Miscellaneous nonmetallic mineral products
33	33 Primary metal manufacturing
331   	NAICS 331 Primary metal manufacturing
3311  	NAICS 3311 Iron and steel mills and ferroalloy mfg.
33111 	NAICS 33111 Iron and steel mills and ferroalloy mfg.
331111	NAICS 331111 Iron and steel mills
331112	NAICS 331112 Ferroalloy and related product manufacturing
3312  	NAICS 3312 Steel product mfg. from purchased steel
33121 	NAICS 33121 Iron, steel pipe and tube from purchase steel
331210	NAICS 331210 Iron, steel pipe and tube from purchase steel
33122 	NAICS 33122 Rolling and drawing of purchased steel
331221	NAICS 331221 Rolled steel shape manufacturing
331222	NAICS 331222 Steel wire drawing
3313  	NAICS 3313 Alumina and aluminum production
33131 	NAICS 33131 Alumina and aluminum production
331311	NAICS 331311 Alumina refining
331312	NAICS 331312 Primary aluminum production
331314	NAICS 331314 Secondary smelting and alloying of aluminum
331315	NAICS 331315 Aluminum sheet, plate, and foil manufacturing
331316	NAICS 331316 Aluminum extruded product manufacturing
331319	NAICS 331319 Other aluminum rolling and drawing
3314  	NAICS 3314 Other nonferrous metal production
33141 	NAICS 33141 Other nonferrous metal production
331411	NAICS 331411 Primary smelting and refining of copper
331419	NAICS 331419 Primary nonferrous metal, except Cu and Al
33142 	NAICS 33142 Rolled, drawn, extruded, and alloyed copper
331421	NAICS 331421 Copper rolling, drawing, and extruding
331422	NAICS 331422 Copper wire, except mechanical, drawing
331423	NAICS 331423 Secondary processing of copper
33149 	NAICS 33149 Nonferrous metal, except Cu and Al, shaping
331491	NAICS 331491 Nonferrous metal, except Cu and Al, shaping
331492	NAICS 331492 Secondary processing of other nonferrous
3315  	NAICS 3315 Foundries
33151 	NAICS 33151 Ferrous metal foundries
331511	NAICS 331511 Iron foundries
331512	NAICS 331512 Steel investment foundries
331513	NAICS 331513 Steel foundries, except investment
33152 	NAICS 33152 Nonferrous metal foundries
331521	NAICS 331521 Aluminum die-casting foundries
331522	NAICS 331522 Nonferrous, except Al, die-casting foundries
331524	NAICS 331524 Aluminum foundries, except die-casting
331525	NAICS 331525 Copper foundries, except die-casting
331528	NAICS 331528 Other nonferrous foundries, exc. die-casting
332   	NAICS 332 Fabricated metal product manufacturing
3321  	NAICS 3321 Forging and stamping
33211 	NAICS 33211 Forging and stamping
332111	NAICS 332111 Iron and steel forging
332112	NAICS 332112 Nonferrous forging
332114	NAICS 332114 Custom roll forming
332115	NAICS 332115 Crown and closure manufacturing
332116	NAICS 332116 Metal stamping
332117	NAICS 332117 Powder metallurgy part manufacturing
3322  	NAICS 3322 Cutlery and handtool manufacturing
33221 	NAICS 33221 Cutlery and handtool manufacturing
332211	NAICS 332211 Cutlery and flatware, except precious, mfg.
332212	NAICS 332212 Hand and edge tool manufacturing
332213	NAICS 332213 Saw blade and handsaw manufacturing
332214	NAICS 332214 Kitchen utensil, pot, and pan manufacturing
3323  	NAICS 3323 Architectural and structural metals mfg.
33231 	NAICS 33231 Plate work and fabricated structural products
332311	NAICS 332311 Prefabricated metal buildings and components
332312	NAICS 332312 Fabricated structural metal manufacturing
332313	NAICS 332313 Plate work manufacturing
33232 	NAICS 33232 Ornamental and architectural metal products
332321	NAICS 332321 Metal window and door manufacturing
332322	NAICS 332322 Sheet metal work manufacturing
332323	NAICS 332323 Ornamental and architectural metal work mfg.
3324  	NAICS 3324 Boiler, tank, and shipping container mfg.
33241 	NAICS 33241 Power boiler and heat exchanger manufacturing
332410	NAICS 332410 Power boiler and heat exchanger manufacturing
33242 	NAICS 33242 Metal tank, heavy gauge, manufacturing
332420	NAICS 332420 Metal tank, heavy gauge, manufacturing
33243 	NAICS 33243 Metal can, box, and other container mfg.
332431	NAICS 332431 Metal can manufacturing
332439	NAICS 332439 Other metal container manufacturing
3325  	NAICS 3325 Hardware manufacturing
33251 	NAICS 33251 Hardware manufacturing
332510	NAICS 332510 Hardware manufacturing
3326  	NAICS 3326 Spring and wire product manufacturing
33261 	NAICS 33261 Spring and wire product manufacturing
332611	NAICS 332611 Spring, heavy gauge, manufacturing
332612	NAICS 332612 Spring, light gauge, manufacturing
332618	NAICS 332618 Other fabricated wire product manufacturing
3327  	NAICS 3327 Machine shops and threaded product mfg.
33271 	NAICS 33271 Machine shops
332710	NAICS 332710 Machine shops
33272 	NAICS 33272 Turned product and screw, nut, and bolt mfg.
332721	NAICS 332721 Precision turned product manufacturing
332722	NAICS 332722 Bolt, nut, screw, rivet, and washer mfg.
3328  	NAICS 3328 Coating, engraving, and heat treating metals
33281 	NAICS 33281 Coating, engraving, and heat treating metals
332811	NAICS 332811 Metal heat treating
332812	NAICS 332812 Metal coating and nonprecious engraving
332813	NAICS 332813 Electroplating, anodizing, and coloring metal
3329  	NAICS 3329 Other fabricated metal product manufacturing
33291 	NAICS 33291 Metal valve manufacturing
332911	NAICS 332911 Industrial valve manufacturing
332912	NAICS 332912 Fluid power valve and hose fitting mfg.
332913	NAICS 332913 Plumbing fixture fitting and trim mfg.
332919	NAICS 332919 Other metal valve and pipe fitting mfg.
33299 	NAICS 33299 All other fabricated metal product mfg.
332991	NAICS 332991 Ball and roller bearing manufacturing
332992	NAICS 332992 Small arms ammunition manufacturing
332993	NAICS 332993 Ammunition, except small arms, manufacturing
332994	NAICS 332994 Small arms manufacturing
332995	NAICS 332995 Other ordnance and accessories manufacturing
332996	NAICS 332996 Fabricated pipe and pipe fitting mfg.
332997	NAICS 332997 Industrial pattern manufacturing
332998	NAICS 332998 Enameled iron and metal sanitary ware mfg.
332999	NAICS 332999 Miscellaneous fabricated metal product mfg.
333   	NAICS 333 Machinery manufacturing
3331  	NAICS 3331 Ag., construction, and mining machinery mfg.
33311 	NAICS 33311 Agricultural implement manufacturing
333111	NAICS 333111 Farm machinery and equipment manufacturing
333112	NAICS 333112 Lawn and garden equipment manufacturing
33312 	NAICS 33312 Construction machinery manufacturing
333120	NAICS 333120 Construction machinery manufacturing
33313 	NAICS 33313 Mining and oil and gas field machinery mfg.
333131	NAICS 333131 Mining machinery and equipment manufacturing
333132	NAICS 333132 Oil and gas field machinery and equipment
3332  	NAICS 3332 Industrial machinery manufacturing
33321 	NAICS 33321 Sawmill and woodworking machinery
333210	NAICS 333210 Sawmill and woodworking machinery
33322 	NAICS 33322 Plastics and rubber industry machinery
333220	NAICS 333220 Plastics and rubber industry machinery
33329 	NAICS 33329 Other industrial machinery manufacturing
333291	NAICS 333291 Paper industry machinery manufacturing
333292	NAICS 333292 Textile machinery manufacturing
333293	NAICS 333293 Printing machinery and equipment mfg.
333294	NAICS 333294 Food product machinery manufacturing
333295	NAICS 333295 Semiconductor machinery manufacturing
333298	NAICS 333298 All other industrial machinery manufacturing
3333  	NAICS 3333 Commercial and service industry machinery
33331 	NAICS 33331 Commercial and service industry machinery
333311	NAICS 333311 Automatic vending machine manufacturing
333312	NAICS 333312 Commercial laundry and drycleaning machinery
333313	NAICS 333313 Office machinery manufacturing
333314	NAICS 333314 Optical instrument and lens manufacturing
333315	NAICS 333315 Photographic and photocopying equipment mfg.
333319	NAICS 333319 Other commercial and service machinery mfg.
3334  	NAICS 3334 HVAC and commercial refrigeration equipment
33341 	NAICS 33341 HVAC and commercial refrigeration equipment
333411	NAICS 333411 Air purification equipment manufacturing
333412	NAICS 333412 Industrial and commercial fan and blower mfg.
333414	NAICS 333414 Heating equipment, except warm air furnaces
333415	NAICS 333415 AC, refrigeration, and forced air heating
3335  	NAICS 3335 Metalworking machinery manufacturing
33351 	NAICS 33351 Metalworking machinery manufacturing
333511	NAICS 333511 Industrial mold manufacturing
333512	NAICS 333512 Metal cutting machine tool manufacturing
333513	NAICS 333513 Metal forming machine tool manufacturing
333514	NAICS 333514 Special tool, die, jig, and fixture mfg.
333515	NAICS 333515 Cutting tool and machine tool accessory mfg.
333516	NAICS 333516 Rolling mill machinery and equipment mfg.
333518	NAICS 333518 Other metalworking machinery manufacturing
3336  	NAICS 3336 Turbine and power transmission equipment mfg.
33361 	NAICS 33361 Turbine and power transmission equipment mfg.
333611	NAICS 333611 Turbine and turbine generator set units mfg.
333612	NAICS 333612 Speed changer, drive, and gear manufacturing
333613	NAICS 333613 Mechanical power transmission equipment mfg.
333618	NAICS 333618 Other engine equipment manufacturing
3339  	NAICS 3339 Other general purpose machinery manufacturing
33391 	NAICS 33391 Pump and compressor manufacturing
333911	NAICS 333911 Pump and pumping equipment manufacturing
333912	NAICS 333912 Air and gas compressor manufacturing
333913	NAICS 333913 Measuring and dispensing pump manufacturing
33392 	NAICS 33392 Material handling equipment manufacturing
333921	NAICS 333921 Elevator and moving stairway manufacturing
333922	NAICS 333922 Conveyor and conveying equipment mfg.
333923	NAICS 333923 Overhead cranes, hoists, and monorail systems
333924	NAICS 333924 Industrial truck, trailer, and stacker mfg.
33399 	NAICS 33399 All other general purpose machinery mfg.
333991	NAICS 333991 Power-driven handtool manufacturing
333992	NAICS 333992 Welding and soldering equipment manufacturing
333993	NAICS 333993 Packaging machinery manufacturing
333994	NAICS 333994 Industrial process furnace and oven mfg.
333995	NAICS 333995 Fluid power cylinder and actuator mfg.
333996	NAICS 333996 Fluid power pump and motor manufacturing
333997	NAICS 333997 Scale and balance manufacturing
333999	NAICS 333999 Miscellaneous general purpose machinery mfg.
334   	NAICS 334 Computer and electronic product manufacturing
3341  	NAICS 3341 Computer and peripheral equipment mfg.
33411 	NAICS 33411 Computer and peripheral equipment mfg.
334111	NAICS 334111 Electronic computer manufacturing
334112	NAICS 334112 Computer storage device manufacturing
334113	NAICS 334113 Computer terminal manufacturing
334119	NAICS 334119 Other computer peripheral equipment mfg.
3342  	NAICS 3342 Communications equipment manufacturing
33421 	NAICS 33421 Telephone apparatus manufacturing
334210	NAICS 334210 Telephone apparatus manufacturing
33422 	NAICS 33422 Broadcast and wireless communications equip.
334220	NAICS 334220 Broadcast and wireless communications equip.
33429 	NAICS 33429 Other communications equipment manufacturing
334290	NAICS 334290 Other communications equipment manufacturing
3343  	NAICS 3343 Audio and video equipment manufacturing
33431 	NAICS 33431 Audio and video equipment manufacturing
334310	NAICS 334310 Audio and video equipment manufacturing
3344  	NAICS 3344 Semiconductor and electronic component mfg.
33441 	NAICS 33441 Semiconductor and electronic component mfg.
334411	NAICS 334411 Electron tube manufacturing
334412	NAICS 334412 Bare printed circuit board manufacturing
334413	NAICS 334413 Semiconductors and related device mfg.
334414	NAICS 334414 Electronic capacitor manufacturing
334415	NAICS 334415 Electronic resistor manufacturing
334416	NAICS 334416 Electronic coils, transformers, and inductors
334417	NAICS 334417 Electronic connector manufacturing
334418	NAICS 334418 Printed circuit assembly manufacturing
334419	NAICS 334419 Other electronic component manufacturing
3345  	NAICS 3345 Electronic instrument manufacturing
33451 	NAICS 33451 Electronic instrument manufacturing
334510	NAICS 334510 Electromedical apparatus manufacturing
334511	NAICS 334511 Search, detection, and navigation instruments
334512	NAICS 334512 Automatic environmental control manufacturing
334513	NAICS 334513 Industrial process variable instruments
334514	NAICS 334514 Totalizing fluid meters and counting devices
334515	NAICS 334515 Electricity and signal testing instruments
334516	NAICS 334516 Analytical laboratory instrument mfg.
334517	NAICS 334517 Irradiation apparatus manufacturing
334518	NAICS 334518 Watch, clock, and part manufacturing
334519	NAICS 334519 Other measuring and controlling device mfg.
3346  	NAICS 3346 Magnetic media manufacturing and reproducing
33461 	NAICS 33461 Magnetic media manufacturing and reproducing
334611	NAICS 334611 Software reproducing
334612	NAICS 334612 Audio and video media reproduction
334613	NAICS 334613 Magnetic and optical recording media mfg.
335   	NAICS 335 Electrical equipment and appliance mfg.
3351  	NAICS 3351 Electric lighting equipment manufacturing
33511 	NAICS 33511 Electric lamp bulb and part manufacturing
335110	NAICS 335110 Electric lamp bulb and part manufacturing
33512 	NAICS 33512 Lighting fixture manufacturing
335121	NAICS 335121 Residential electric lighting fixture mfg.
335122	NAICS 335122 Nonresidential electric lighting fixture mfg.
335129	NAICS 335129 Other lighting equipment manufacturing
3352  	NAICS 3352 Household appliance manufacturing
33521 	NAICS 33521 Small electrical appliance manufacturing
335211	NAICS 335211 Electric housewares and household fan mfg.
335212	NAICS 335212 Household vacuum cleaner manufacturing
33522 	NAICS 33522 Major appliance manufacturing
335221	NAICS 335221 Household cooking appliance manufacturing
335222	NAICS 335222 Household refrigerator and home freezer mfg.
335224	NAICS 335224 Household laundry equipment manufacturing
335228	NAICS 335228 Other major household appliance manufacturing
3353  	NAICS 3353 Electrical equipment manufacturing
33531 	NAICS 33531 Electrical equipment manufacturing
335311	NAICS 335311 Electric power and specialty transformer mfg.
335312	NAICS 335312 Motor and generator manufacturing
335313	NAICS 335313 Switchgear and switchboard apparatus mfg.
335314	NAICS 335314 Relay and industrial control manufacturing
3359  	NAICS 3359 Other electrical equipment and component mfg.
33591 	NAICS 33591 Battery manufacturing
335911	NAICS 335911 Storage battery manufacturing
335912	NAICS 335912 Primary battery manufacturing
33592 	NAICS 33592 Communication and energy wire and cable mfg.
335921	NAICS 335921 Fiber optic cable manufacturing
335929	NAICS 335929 Other communication and energy wire mfg.
33593 	NAICS 33593 Wiring device manufacturing
335931	NAICS 335931 Current-carrying wiring device manufacturing
335932	NAICS 335932 Noncurrent-carrying wiring device mfg.
33599 	NAICS 33599 Other electrical equipment and component mfg.
335991	NAICS 335991 Carbon and graphite product manufacturing
335999	NAICS 335999 Miscellaneous electrical equipment mfg.
336   	NAICS 336 Transportation equipment manufacturing
3361  	NAICS 3361 Motor vehicle manufacturing
33611 	NAICS 33611 Automobile and light truck manufacturing
336111	NAICS 336111 Automobile manufacturing
336112	NAICS 336112 Light truck and utility vehicle manufacturing
33612 	NAICS 33612 Heavy duty truck manufacturing
336120	NAICS 336120 Heavy duty truck manufacturing
3362  	NAICS 3362 Motor vehicle body and trailer manufacturing
33621 	NAICS 33621 Motor vehicle body and trailer manufacturing
336211	NAICS 336211 Motor vehicle body manufacturing
336212	NAICS 336212 Truck trailer manufacturing
336213	NAICS 336213 Motor home manufacturing
336214	NAICS 336214 Travel trailer and camper manufacturing
3363  	NAICS 3363 Motor vehicle parts manufacturing
33631 	NAICS 33631 Motor vehicle gasoline engine and parts mfg.
336311	NAICS 336311 Carburetor, piston, ring, and valve mfg.
336312	NAICS 336312 Gasoline engine and engine parts mfg.
33632 	NAICS 33632 Motor vehicle electric equipment
336321	NAICS 336321 Vehicular lighting equipment manufacturing
336322	NAICS 336322 Other motor vehicle electric equipment mfg.
33633 	NAICS 33633 Motor vehicle steering and suspension parts
336330	NAICS 336330 Motor vehicle steering and suspension parts
33634 	NAICS 33634 Motor vehicle brake system manufacturing
336340	NAICS 336340 Motor vehicle brake system manufacturing
33635 	NAICS 33635 Motor vehicle power train components mfg.
336350	NAICS 336350 Motor vehicle power train components mfg.
33636 	NAICS 33636 Motor vehicle seating and interior trim mfg.
336360	NAICS 336360 Motor vehicle seating and interior trim mfg.
33637 	NAICS 33637 Motor vehicle metal stamping
336370	NAICS 336370 Motor vehicle metal stamping
33639 	NAICS 33639 Other motor vehicle parts manufacturing
336391	NAICS 336391 Motor vehicle air-conditioning manufacturing
336399	NAICS 336399 All other motor vehicle parts manufacturing
3364  	NAICS 3364 Aerospace product and parts manufacturing
33641 	NAICS 33641 Aerospace product and parts manufacturing
336411	NAICS 336411 Aircraft manufacturing
336412	NAICS 336412 Aircraft engine and engine parts mfg.
336413	NAICS 336413 Other aircraft parts and equipment
336414	NAICS 336414 Guided missile and space vehicle mfg.
336415	NAICS 336415 Space vehicle propulsion units and parts mfg.
336419	NAICS 336419 Other guided missile and space vehicle parts
3365  	NAICS 3365 Railroad rolling stock manufacturing
33651 	NAICS 33651 Railroad rolling stock manufacturing
336510	NAICS 336510 Railroad rolling stock manufacturing
3366  	NAICS 3366 Ship and boat building
33661 	NAICS 33661 Ship and boat building
336611	NAICS 336611 Ship building and repairing
336612	NAICS 336612 Boat building
3369  	NAICS 3369 Other transportation equipment manufacturing
33699 	NAICS 33699 Other transportation equipment manufacturing
336991	NAICS 336991 Motorcycle, bicycle, and parts manufacturing
336992	NAICS 336992 Military armored vehicles and tank parts mfg.
336999	NAICS 336999 All other transportation equipment mfg.
337   	NAICS 337 Furniture and related product manufacturing
3371  	NAICS 3371 Household and institutional furniture mfg.
33711 	NAICS 33711 Wood kitchen cabinet and countertop mfg.
337110	NAICS 337110 Wood kitchen cabinet and countertop mfg.
33712 	NAICS 33712 Other household and institutional furniture
337121	NAICS 337121 Upholstered household furniture manufacturing
337122	NAICS 337122 Nonupholstered wood household furniture mfg.
337124	NAICS 337124 Metal household furniture manufacturing
337125	NAICS 337125 Household furniture, exc. wood or metal, mfg.
337127	NAICS 337127 Institutional furniture manufacturing
337129	NAICS 337129 Wood TV, radio, and sewing machine housings
3372  	NAICS 3372 Office furniture and fixtures manufacturing
33721 	NAICS 33721 Office furniture and fixtures manufacturing
337211	NAICS 337211 Wood office furniture manufacturing
337212	NAICS 337212 Custom architectural woodwork and millwork
337214	NAICS 337214 Office furniture, except wood, manufacturing
337215	NAICS 337215 Showcases, partitions, shelving, and lockers
3379  	NAICS 3379 Other furniture related product manufacturing
33791 	NAICS 33791 Mattress manufacturing
337910	NAICS 337910 Mattress manufacturing
33792 	NAICS 33792 Blind and shade manufacturing
337920	NAICS 337920 Blind and shade manufacturing
339   	NAICS 339 Miscellaneous manufacturing
3391  	NAICS 3391 Medical equipment and supplies manufacturing
33911 	NAICS 33911 Medical equipment and supplies manufacturing
339111	NAICS02 339111 Laboratory apparatus and furniture mfg.
339112	NAICS 339112 Surgical and medical instrument manufacturing
339113	NAICS 339113 Surgical appliance and supplies manufacturing
339114	NAICS 339114 Dental equipment and supplies manufacturing
339115	NAICS 339115 Ophthalmic goods manufacturing
339116	NAICS 339116 Dental laboratories
3399  	NAICS 3399 Other miscellaneous manufacturing
33991 	NAICS 33991 Jewelry and silverware manufacturing
339911	NAICS 339911 Jewelry, except costume, manufacturing
339912	NAICS 339912 Silverware and hollowware manufacturing
339913	NAICS 339913 Jewelers' material and lapidary work mfg.
339914	NAICS 339914 Costume jewelry and novelty manufacturing
33992 	NAICS 33992 Sporting and athletic goods manufacturing
339920	NAICS 339920 Sporting and athletic goods manufacturing
33993 	NAICS 33993 Doll, toy, and game manufacturing
339931	NAICS 339931 Doll and stuffed toy manufacturing
339932	NAICS 339932 Game, toy, and children's vehicle mfg.
33994 	NAICS 33994 Office supplies, except paper, manufacturing
339941	NAICS 339941 Pen and mechanical pencil manufacturing
339942	NAICS 339942 Lead pencil and art good manufacturing
339943	NAICS 339943 Marking device manufacturing
339944	NAICS 339944 Carbon paper and inked ribbon manufacturing
33995 	NAICS 33995 Sign manufacturing
339950	NAICS 339950 Sign manufacturing
33999 	NAICS 33999 All other miscellaneous manufacturing
339991	NAICS 339991 Gasket, packing, and sealing device mfg.
339992	NAICS 339992 Musical instrument manufacturing
339993	NAICS 339993 Fastener, button, needle, and pin mfg.
339994	NAICS 339994 Broom, brush, and mop manufacturing
339995	NAICS 339995 Burial casket manufacturing
339999	NAICS 339999 All other miscellaneous manufacturing
4  	4 Trade, Transportation, Utilities
42    	NAICS 42 Wholesale trade
423   	NAICS 423 Merchant wholesalers, durable goods
4231  	NAICS 4231 Motor vehicle and parts merchant wholesalers
42311 	NAICS 42311 Motor vehicle merchant wholesalers
423110	NAICS 423110 Motor vehicle merchant wholesalers
42312 	NAICS 42312 New motor vehicle parts merchant wholesalers
423120	NAICS 423120 New motor vehicle parts merchant wholesalers
42313 	NAICS 42313 Tire and tube merchant wholesalers
423130	NAICS 423130 Tire and tube merchant wholesalers
42314 	NAICS 42314 Used motor vehicle parts merchant wholesalers
423140	NAICS 423140 Used motor vehicle parts merchant wholesalers
4232  	NAICS 4232 Furniture and furnishing merchant wholesalers
42321 	NAICS 42321 Furniture merchant wholesalers
423210	NAICS 423210 Furniture merchant wholesalers
42322 	NAICS 42322 Home furnishing merchant wholesalers
423220	NAICS 423220 Home furnishing merchant wholesalers
4233  	NAICS 4233 Lumber and const. supply merchant wholesalers
42331 	NAICS 42331 Lumber and wood merchant wholesalers
423310	NAICS 423310 Lumber and wood merchant wholesalers
42332 	NAICS 42332 Masonry material merchant wholesalers
423320	NAICS 423320 Masonry material merchant wholesalers
42333 	NAICS 42333 Roofing and siding merchant wholesalers
423330	NAICS 423330 Roofing and siding merchant wholesalers
42339 	NAICS 42339 Other const. material merchant wholesalers
423390	NAICS 423390 Other const. material merchant wholesalers
4234  	NAICS 4234 Commercial equip. merchant wholesalers
42341 	NAICS 42341 Photographic equip. merchant wholesalers
423410	NAICS 423410 Photographic equip. merchant wholesalers
42342 	NAICS 42342 Office equipment merchant wholesalers
423420	NAICS 423420 Office equipment merchant wholesalers
42343 	NAICS 42343 Computer and software merchant wholesalers
423430	NAICS 423430 Computer and software merchant wholesalers
42344 	NAICS 42344 Other commercial equip. merchant wholesalers
423440	NAICS 423440 Other commercial equip. merchant wholesalers
42345 	NAICS 42345 Medical equipment merchant wholesalers
423450	NAICS 423450 Medical equipment merchant wholesalers
42346 	NAICS 42346 Ophthalmic goods merchant wholesalers
423460	NAICS 423460 Ophthalmic goods merchant wholesalers
42349 	NAICS 42349 Other professional equip. merchant wholesalers
423490	NAICS 423490 Other professional equip. merchant wholesalers
4235  	NAICS 4235 Metal and mineral merchant wholesalers
42351 	NAICS 42351 Metal merchant wholesalers
423510	NAICS 423510 Metal merchant wholesalers
42352 	NAICS 42352 Coal and other mineral merchant wholesalers
423520	NAICS 423520 Coal and other mineral merchant wholesalers
4236  	NAICS 4236 Electric goods merchant wholesalers
42361 	NAICS 42361 Elec. equip. and wiring merchant wholesalers
423610	NAICS 423610 Elec. equip. and wiring merchant wholesalers
42362 	NAICS 42362 Electric appliance merchant wholesalers
423620	NAICS 423620 Electric appliance merchant wholesalers
42369 	NAICS 42369 Other electronic parts merchant wholesalers
423690	NAICS 423690 Other electronic parts merchant wholesalers
4237  	NAICS 4237 Hardware and plumbing merchant wholesalers
42371 	NAICS 42371 Hardware merchant wholesalers
423710	NAICS 423710 Hardware merchant wholesalers
42372 	NAICS 42372 Plumbing equip. merchant wholesalers
423720	NAICS 423720 Plumbing equip. merchant wholesalers
42373 	NAICS 42373 HVAC equip. merchant wholesalers
423730	NAICS 423730 HVAC equip. merchant wholesalers
42374 	NAICS 42374 Refrigeration equip. merchant wholesalers
423740	NAICS 423740 Refrigeration equip. merchant wholesalers
4238  	NAICS 4238 Machinery and supply merchant wholesalers
42381 	NAICS 42381 Construction equipment merchant wholesalers
423810	NAICS 423810 Construction equipment merchant wholesalers
42382 	NAICS 42382 Farm and garden equip. merchant wholesalers
423820	NAICS 423820 Farm and garden equip. merchant wholesalers
42383 	NAICS 42383 Industrial machinery merchant wholesalers
423830	NAICS 423830 Industrial machinery merchant wholesalers
42384 	NAICS 42384 Industrial supplies merchant wholesalers
423840	NAICS 423840 Industrial supplies merchant wholesalers
42385 	NAICS 42385 Service estab. equip. merchant wholesalers
423850	NAICS 423850 Service estab. equip. merchant wholesalers
42386 	NAICS 42386 Other transport. goods merchant wholesalers
423860	NAICS 423860 Other transport. goods merchant wholesalers
4239  	NAICS 4239 Misc. durable goods merchant wholesalers
42391 	NAICS 42391 Sporting goods merchant wholesalers
423910	NAICS 423910 Sporting goods merchant wholesalers
42392 	NAICS 42392 Toy and hobby goods merchant wholesalers
423920	NAICS 423920 Toy and hobby goods merchant wholesalers
42393 	NAICS 42393 Recyclable material merchant wholesalers
423930	NAICS 423930 Recyclable material merchant wholesalers
42394 	NAICS 42394 Jewelry merchant wholesalers
423940	NAICS 423940 Jewelry merchant wholesalers
42399 	NAICS 42399 All other durable goods merchant wholesalers
423990	NAICS 423990 All other durable goods merchant wholesalers
424   	NAICS 424 Merchant wholesalers, nondurable goods
4241  	NAICS 4241 Paper and paper product merchant wholesalers
42411 	NAICS 42411 Printing and writing paper merch. whls.
424110	NAICS 424110 Printing and writing paper merch. whls.
42412 	NAICS 42412 Office supplies merchant wholesalers
424120	NAICS 424120 Office supplies merchant wholesalers
42413 	NAICS 42413 Industrial paper merchant wholesalers
424130	NAICS 424130 Industrial paper merchant wholesalers
4242  	NAICS 4242 Druggists' goods merchant wholesalers
42421 	NAICS 42421 Druggists' goods merchant wholesalers
424210	NAICS 424210 Druggists' goods merchant wholesalers
4243  	NAICS 4243 Apparel and piece goods merchant wholesalers
42431 	NAICS 42431 Piece goods merchant wholesalers
424310	NAICS 424310 Piece goods merchant wholesalers
42432 	NAICS 42432 Men's and boys' clothing merchant wholesalers
424320	NAICS 424320 Men's and boys' clothing merchant wholesalers
42433 	NAICS 42433 Women's and children's clothing merch. whls.
424330	NAICS 424330 Women's and children's clothing merch. whls.
42434 	NAICS 42434 Footwear merchant wholesalers
424340	NAICS 424340 Footwear merchant wholesalers
4244  	NAICS 4244 Grocery and related product wholesalers
42441 	NAICS 42441 General line grocery merchant wholesalers
424410	NAICS 424410 General line grocery merchant wholesalers
42442 	NAICS 42442 Packaged frozen food merchant wholesalers
424420	NAICS 424420 Packaged frozen food merchant wholesalers
42443 	NAICS 42443 Dairy product merchant wholesalers
424430	NAICS 424430 Dairy product merchant wholesalers
42444 	NAICS 42444 Poultry product merchant wholesalers
424440	NAICS 424440 Poultry product merchant wholesalers
42445 	NAICS 42445 Confectionery merchant wholesalers
424450	NAICS 424450 Confectionery merchant wholesalers
42446 	NAICS 42446 Fish and seafood merchant wholesalers
424460	NAICS 424460 Fish and seafood merchant wholesalers
42447 	NAICS 42447 Meat and meat product merchant wholesalers
424470	NAICS 424470 Meat and meat product merchant wholesalers
42448 	NAICS 42448 Fruit and vegetable merchant wholesalers
424480	NAICS 424480 Fruit and vegetable merchant wholesalers
42449 	NAICS 42449 Other grocery product merchant wholesalers
424490	NAICS 424490 Other grocery product merchant wholesalers
4245  	NAICS 4245 Farm product raw material merch. whls.
42451 	NAICS 42451 Grain and field bean merchant wholesalers
424510	NAICS 424510 Grain and field bean merchant wholesalers
42452 	NAICS 42452 Livestock merchant wholesalers
424520	NAICS 424520 Livestock merchant wholesalers
42459 	NAICS 42459 Other farm product raw material merch. whls.
424590	NAICS 424590 Other farm product raw material merch. whls.
4246  	NAICS 4246 Chemical merchant wholesalers
42461 	NAICS 42461 Plastics materials merchant wholesalers
424610	NAICS 424610 Plastics materials merchant wholesalers
42469 	NAICS 42469 Other chemicals merchant wholesalers
424690	NAICS 424690 Other chemicals merchant wholesalers
4247  	NAICS 4247 Petroleum merchant wholesalers
42471 	NAICS 42471 Petroleum bulk stations and terminals
424710	NAICS 424710 Petroleum bulk stations and terminals
42472 	NAICS 42472 Other petroleum merchant wholesalers
424720	NAICS 424720 Other petroleum merchant wholesalers
4248  	NAICS 4248 Alcoholic beverage merchant wholesalers
42481 	NAICS 42481 Beer and ale merchant wholesalers
424810	NAICS 424810 Beer and ale merchant wholesalers
42482 	NAICS 42482 Wine and spirit merchant wholesalers
424820	NAICS 424820 Wine and spirit merchant wholesalers
4249  	NAICS 4249 Misc. nondurable goods merchant wholesalers
42491 	NAICS 42491 Farm supplies merchant wholesalers
424910	NAICS 424910 Farm supplies merchant wholesalers
42492 	NAICS 42492 Book and periodical merchant wholesalers
424920	NAICS 424920 Book and periodical merchant wholesalers
42493 	NAICS 42493 Nursery and florist merchant wholesalers
424930	NAICS 424930 Nursery and florist merchant wholesalers
42494 	NAICS 42494 Tobacco and tobacco product merch. whls.
424940	NAICS 424940 Tobacco and tobacco product merch. whls.
42495 	NAICS 42495 Paint and supplies merchant wholesalers
424950	NAICS 424950 Paint and supplies merchant wholesalers
42499 	NAICS 42499 Other nondurable goods merchant wholesalers
424990	NAICS 424990 Other nondurable goods merchant wholesalers
425   	NAICS 425 Electronic markets and agents and brokers
4251  	NAICS 4251 Electronic markets and agents and brokers
42511 	NAICS 42511 Business to business electronic markets
425110	NAICS 425110 Business to business electronic markets
42512 	NAICS 42512 Wholesale trade agents and brokers
425120	NAICS 425120 Wholesale trade agents and brokers
44	44 Retail merchandise, specialties
441   	NAICS 441 Motor vehicle and parts dealers
4411  	NAICS 4411 Automobile dealers
44111 	NAICS 44111 New car dealers
441110	NAICS 441110 New car dealers
44112 	NAICS 44112 Used car dealers
441120	NAICS 441120 Used car dealers
4412  	NAICS 4412 Other motor vehicle dealers
44121 	NAICS 44121 Recreational vehicle dealers
441210	NAICS 441210 Recreational vehicle dealers
44122 	NAICS 44122 Motorcycle, boat, and other vehicle dealers
441221	NAICS 441221 Motorcycle, ATV, personal watercraft dealers
441222	NAICS 441222 Boat dealers
441229	NAICS 441229 All other motor vehicle dealers
4413  	NAICS 4413 Auto parts, accessories, and tire stores
44131 	NAICS 44131 Automotive parts and accessories stores
441310	NAICS 441310 Automotive parts and accessories stores
44132 	NAICS 44132 Tire dealers
441320	NAICS 441320 Tire dealers
442   	NAICS 442 Furniture and home furnishings stores
4421  	NAICS 4421 Furniture stores
44211 	NAICS 44211 Furniture stores
442110	NAICS 442110 Furniture stores
4422  	NAICS 4422 Home furnishings stores
44221 	NAICS 44221 Floor covering stores
442210	NAICS 442210 Floor covering stores
44229 	NAICS 44229 Other home furnishings stores
442291	NAICS 442291 Window treatment stores
442299	NAICS 442299 All other home furnishings stores
443   	NAICS 443 Electronics and appliance stores
4431  	NAICS 4431 Electronics and appliance stores
44311 	NAICS 44311 Appliance, TV, and other electronics stores
443111	NAICS 443111 Household appliance stores
443112	NAICS 443112 Radio, TV, and other electronics stores
44312 	NAICS 44312 Computer and software stores
443120	NAICS 443120 Computer and software stores
44313 	NAICS 44313 Camera and photographic supplies stores
443130	NAICS 443130 Camera and photographic supplies stores
444   	NAICS 444 Building material and garden supply stores
4441  	NAICS 4441 Building material and supplies dealers
44411 	NAICS 44411 Home centers
444110	NAICS 444110 Home centers
44412 	NAICS 44412 Paint and wallpaper stores
444120	NAICS 444120 Paint and wallpaper stores
44413 	NAICS 44413 Hardware stores
444130	NAICS 444130 Hardware stores
44419 	NAICS 44419 Other building material dealers
444190	NAICS 444190 Other building material dealers
4442  	NAICS 4442 Lawn and garden equipment and supplies stores
44421 	NAICS 44421 Outdoor power equipment stores
444210	NAICS 444210 Outdoor power equipment stores
44422 	NAICS 44422 Nursery, garden, and farm supply stores
444220	NAICS 444220 Nursery, garden, and farm supply stores
445   	NAICS 445 Food and beverage stores
4451  	NAICS 4451 Grocery stores
44511 	NAICS 44511 Supermarkets and other grocery stores
445110	NAICS 445110 Supermarkets and other grocery stores
44512 	NAICS 44512 Convenience stores
445120	NAICS 445120 Convenience stores
4452  	NAICS 4452 Specialty food stores
44521 	NAICS 44521 Meat markets
445210	NAICS 445210 Meat markets
44522 	NAICS 44522 Fish and seafood markets
445220	NAICS 445220 Fish and seafood markets
44523 	NAICS 44523 Fruit and vegetable markets
445230	NAICS 445230 Fruit and vegetable markets
44529 	NAICS 44529 Other specialty food stores
445291	NAICS 445291 Baked goods stores
445292	NAICS 445292 Confectionery and nut stores
445299	NAICS 445299 All other specialty food stores
4453  	NAICS 4453 Beer, wine, and liquor stores
44531 	NAICS 44531 Beer, wine, and liquor stores
445310	NAICS 445310 Beer, wine, and liquor stores
446   	NAICS 446 Health and personal care stores
4461  	NAICS 4461 Health and personal care stores
44611 	NAICS 44611 Pharmacies and drug stores
446110	NAICS 446110 Pharmacies and drug stores
44612 	NAICS 44612 Cosmetic and beauty supply stores
446120	NAICS 446120 Cosmetic and beauty supply stores
44613 	NAICS 44613 Optical goods stores
446130	NAICS 446130 Optical goods stores
44619 	NAICS 44619 Other health and personal care stores
446191	NAICS 446191 Food, health, supplement stores
446199	NAICS 446199 All other health and personal care stores
447   	NAICS 447 Gasoline stations
4471  	NAICS 4471 Gasoline stations
44711 	NAICS 44711 Gasoline stations with convenience stores
447110	NAICS 447110 Gasoline stations with convenience stores
44719 	NAICS 44719 Other gasoline stations
447190	NAICS 447190 Other gasoline stations
448   	NAICS 448 Clothing and clothing accessories stores
4481  	NAICS 4481 Clothing stores
44811 	NAICS 44811 Men's clothing stores
448110	NAICS 448110 Men's clothing stores
44812 	NAICS 44812 Women's clothing stores
448120	NAICS 448120 Women's clothing stores
44813 	NAICS 44813 Children's and infants' clothing stores
448130	NAICS 448130 Children's and infants' clothing stores
44814 	NAICS 44814 Family clothing stores
448140	NAICS 448140 Family clothing stores
44815 	NAICS 44815 Clothing accessories stores
448150	NAICS 448150 Clothing accessories stores
44819 	NAICS 44819 Other clothing stores
448190	NAICS 448190 Other clothing stores
4482  	NAICS 4482 Shoe stores
44821 	NAICS 44821 Shoe stores
448210	NAICS 448210 Shoe stores
4483  	NAICS 4483 Jewelry, luggage, and leather goods stores
44831 	NAICS 44831 Jewelry stores
448310	NAICS 448310 Jewelry stores
44832 	NAICS 44832 Luggage and leather goods stores
448320	NAICS 448320 Luggage and leather goods stores
45	45 Retail merchandise, general dealers
451   	NAICS 451 Sporting goods, hobby, book and music stores
4511  	NAICS 4511 Sporting goods and musical instrument stores
45111 	NAICS 45111 Sporting goods stores
451110	NAICS 451110 Sporting goods stores
45112 	NAICS 45112 Hobby, toy, and game stores
451120	NAICS 451120 Hobby, toy, and game stores
45113 	NAICS 45113 Sewing, needlework, and piece goods stores
451130	NAICS 451130 Sewing, needlework, and piece goods stores
45114 	NAICS 45114 Musical instrument and supplies stores
451140	NAICS 451140 Musical instrument and supplies stores
4512  	NAICS 4512 Book, periodical, and music stores
45121 	NAICS 45121 Book stores and news dealers
451211	NAICS 451211 Book stores
451212	NAICS 451212 News dealers and newsstands
45122 	NAICS 45122 Precorded tape, CD, and record stores
451220	NAICS 451220 Precorded tape, CD, and record stores
452   	NAICS 452 General merchandise stores
4521  	NAICS 4521 Department stores
45211 	NAICS 45211 Department stores
452111	NAICS 452111 Department stores, except discount
452112	NAICS 452112 Discount department stores
4529  	NAICS 4529 Other general merchandise stores
45291 	NAICS 45291 Warehouse clubs and supercenters
452910	NAICS 452910 Warehouse clubs and supercenters
45299 	NAICS 45299 All other general merchandise stores
452990	NAICS 452990 All other general merchandise stores
453   	NAICS 453 Miscellaneous store retailers
4531  	NAICS 4531 Florists
45311 	NAICS 45311 Florists
453110	NAICS 453110 Florists
4532  	NAICS 4532 Office supplies, stationery, and gift stores
45321 	NAICS 45321 Office supplies and stationery stores
453210	NAICS 453210 Office supplies and stationery stores
45322 	NAICS 45322 Gift, novelty, and souvenir stores
453220	NAICS 453220 Gift, novelty, and souvenir stores
4533  	NAICS 4533 Used merchandise stores
45331 	NAICS 45331 Used merchandise stores
453310	NAICS 453310 Used merchandise stores
4539  	NAICS 4539 Other miscellaneous store retailers
45391 	NAICS 45391 Pet and pet supplies stores
453910	NAICS 453910 Pet and pet supplies stores
45392 	NAICS 45392 Art dealers
453920	NAICS 453920 Art dealers
45393 	NAICS 45393 Manufactured, mobile, home dealers
453930	NAICS 453930 Manufactured, mobile, home dealers
45399 	NAICS 45399 All other miscellaneous store retailers
453991	NAICS 453991 Tobacco stores
453998	NAICS 453998 Store retailers not specified elsewhere
454   	NAICS 454 Nonstore retailers
4541  	NAICS 4541 Electronic shopping and mail-order houses
45411 	NAICS 45411 Electronic shopping and mail-order houses
454111	NAICS 454111 Electronic shopping
454112	NAICS 454112 Electronic auctions
454113	NAICS 454113 Mail-order houses
4542  	NAICS 4542 Vending machine operators
45421 	NAICS 45421 Vending machine operators
454210	NAICS 454210 Vending machine operators
4543  	NAICS 4543 Direct selling establishments
45431 	NAICS 45431 Fuel dealers
454311	NAICS 454311 Heating oil dealers
454312	NAICS 454312 Liquefied petroleum gas, bottled gas, dealers
454319	NAICS 454319 Other fuel dealers
45439 	NAICS 45439 Other direct selling establishments
454390	NAICS 454390 Other direct selling establishments
48	48 Transportation
481   	NAICS 481 Air transportation
4811  	NAICS 4811 Scheduled air transportation
48111 	NAICS 48111 Scheduled air transportation
481111	NAICS 481111 Scheduled passenger air transportation
481112	NAICS 481112 Scheduled freight air transportation
4812  	NAICS 4812 Nonscheduled air transportation
48121 	NAICS 48121 Nonscheduled air transportation
481211	NAICS 481211 Nonscheduled air passenger chartering
481212	NAICS 481212 Nonscheduled air freight chartering
481219	NAICS 481219 Other nonscheduled air transportation
482   	NAICS 482 Rail transportation
4821  	NAICS 4821 Rail transportation
48211 	NAICS 48211 Rail transportation
482111	NAICS 482111 Line-haul railroads
482112	NAICS 482112 Short line railroads
483   	NAICS 483 Water transportation
4831  	NAICS 4831 Sea, coastal, and Great Lakes transportation
48311 	NAICS 48311 Sea, coastal, and Great Lakes transportation
483111	NAICS 483111 Deep sea freight transportation
483112	NAICS 483112 Deep sea passenger transportation
483113	NAICS 483113 Coastal and Great Lakes freight transport.
483114	NAICS 483114 Coastal and Great Lakes passenger transport.
4832  	NAICS 4832 Inland water transportation
48321 	NAICS 48321 Inland water transportation
483211	NAICS 483211 Inland water freight transportation
483212	NAICS 483212 Inland water passenger transportation
484   	NAICS 484 Truck transportation
4841  	NAICS 4841 General freight trucking
48411 	NAICS 48411 General freight trucking, local
484110	NAICS 484110 General freight trucking, local
48412 	NAICS 48412 General freight trucking, long-distance
484121	NAICS 484121 General freight trucking, long-distance TL
484122	NAICS 484122 General freight trucking, long-distance LTL
4842  	NAICS 4842 Specialized freight trucking
48421 	NAICS 48421 Used household and office goods moving
484210	NAICS 484210 Used household and office goods moving
48422 	NAICS 48422 Other specialized trucking, local
484220	NAICS 484220 Other specialized trucking, local
48423 	NAICS 48423 Other specialized trucking, long-distance
484230	NAICS 484230 Other specialized trucking, long-distance
485   	NAICS 485 Transit and ground passenger transportation
4851  	NAICS 4851 Urban transit systems
48511 	NAICS 48511 Urban transit systems
485111	NAICS 485111 Mixed mode transit systems
485112	NAICS 485112 Commuter rail systems
485113	NAICS 485113 Bus and other motor vehicle transit systems
485119	NAICS 485119 Other urban transit systems
4852  	NAICS 4852 Interurban and rural bus transportation
48521 	NAICS 48521 Interurban and rural bus transportation
485210	NAICS 485210 Interurban and rural bus transportation
4853  	NAICS 4853 Taxi and limousine service
48531 	NAICS 48531 Taxi service
485310	NAICS 485310 Taxi service
48532 	NAICS 48532 Limousine service
485320	NAICS 485320 Limousine service
4854  	NAICS 4854 School and employee bus transportation
48541 	NAICS 48541 School and employee bus transportation
485410	NAICS 485410 School and employee bus transportation
4855  	NAICS 4855 Charter bus industry
48551 	NAICS 48551 Charter bus industry
485510	NAICS 485510 Charter bus industry
4859  	NAICS 4859 Other ground passenger transportation
48599 	NAICS 48599 Other ground passenger transportation
485991	NAICS 485991 Special needs transportation
485999	NAICS 485999 All other ground passenger transportation
486   	NAICS 486 Pipeline transportation
4861  	NAICS 4861 Pipeline transportation of crude oil
48611 	NAICS 48611 Pipeline transportation of crude oil
486110	NAICS 486110 Pipeline transportation of crude oil
4862  	NAICS 4862 Pipeline transportation of natural gas
48621 	NAICS 48621 Pipeline transportation of natural gas
486210	NAICS 486210 Pipeline transportation of natural gas
4869  	NAICS 4869 Other pipeline transportation
48691 	NAICS 48691 Refined petroleum product pipeline transport.
486910	NAICS 486910 Refined petroleum product pipeline transport.
48699 	NAICS 48699 All other pipeline transportation
486990	NAICS 486990 All other pipeline transportation
487   	NAICS 487 Scenic and sightseeing transportation
4871  	NAICS 4871 Scenic and sightseeing transportation, land
48711 	NAICS 48711 Scenic and sightseeing transportation, land
487110	NAICS 487110 Scenic and sightseeing transportation, land
4872  	NAICS 4872 Scenic and sightseeing transportation, water
48721 	NAICS 48721 Scenic and sightseeing transportation, water
487210	NAICS 487210 Scenic and sightseeing transportation, water
4879  	NAICS 4879 Scenic and sightseeing transportation, other
48799 	NAICS 48799 Scenic and sightseeing transportation, other
487990	NAICS 487990 Scenic and sightseeing transportation, other
488   	NAICS 488 Support activities for transportation
4881  	NAICS 4881 Support activities for air transportation
48811 	NAICS 48811 Airport operations
488111	NAICS 488111 Air traffic control
488119	NAICS 488119 Other airport operations
48819 	NAICS 48819 Other support activities for air transport.
488190	NAICS 488190 Other support activities for air transport.
4882  	NAICS 4882 Support activities for rail transportation
48821 	NAICS 48821 Support activities for rail transportation
488210	NAICS 488210 Support activities for rail transportation
4883  	NAICS 4883 Support activities for water transportation
48831 	NAICS 48831 Port and harbor operations
488310	NAICS 488310 Port and harbor operations
48832 	NAICS 48832 Marine cargo handling
488320	NAICS 488320 Marine cargo handling
48833 	NAICS 48833 Navigational services to shipping
488330	NAICS 488330 Navigational services to shipping
48839 	NAICS 48839 Other support activities for water transport.
488390	NAICS 488390 Other support activities for water transport.
4884  	NAICS 4884 Support activities for road transportation
48841 	NAICS 48841 Motor vehicle towing
488410	NAICS 488410 Motor vehicle towing
48849 	NAICS 48849 Other support activities for road transport.
488490	NAICS 488490 Other support activities for road transport.
4885  	NAICS 4885 Freight transportation arrangement
48851 	NAICS 48851 Freight transportation arrangement
488510	NAICS 488510 Freight transportation arrangement
4889  	NAICS 4889 Other support activities for transportation
48899 	NAICS 48899 Other support activities for transportation
488991	NAICS 488991 Packing and crating
488999	NAICS 488999 All other support activities for transport.
49	49 Logistics and warehousing
491   	NAICS 491 Postal service
4911  	NAICS 4911 Postal service
49111 	NAICS 49111 Postal service
491110	NAICS 491110 Postal service
492   	NAICS 492 Couriers and messengers
4921  	NAICS 4921 Couriers and express delivery services
49211 	NAICS 49211 Couriers and express delivery services
492110	NAICS 492110 Couriers and express delivery services
4922  	NAICS 4922 Local messengers and local delivery
49221 	NAICS 49221 Local messengers and local delivery
492210	NAICS 492210 Local messengers and local delivery
493   	NAICS 493 Warehousing and storage
4931  	NAICS 4931 Warehousing and storage
49311 	NAICS 49311 General warehousing and storage
493110	NAICS 493110 General warehousing and storage
49312 	NAICS 49312 Refrigerated warehousing and storage
493120	NAICS 493120 Refrigerated warehousing and storage
49313 	NAICS 49313 Farm product warehousing and storage
493130	NAICS 493130 Farm product warehousing and storage
49319 	NAICS 49319 Other warehousing and storage
493190	NAICS 493190 Other warehousing and storage
5	5 Information Services
51    	NAICS 51 Information
511   	NAICS 511 Publishing industries, except Internet
5111  	NAICS 5111 Newspaper, book, and directory publishers
51111 	NAICS 51111 Newspaper publishers
511110	NAICS 511110 Newspaper publishers
51112 	NAICS 51112 Periodical publishers
511120	NAICS 511120 Periodical publishers
51113 	NAICS 51113 Book publishers
511130	NAICS 511130 Book publishers
51114 	NAICS 51114 Directory and mailing list publishers
511140	NAICS 511140 Directory and mailing list publishers
51119 	NAICS 51119 Other publishers
511191	NAICS 511191 Greeting card publishers
511199	NAICS 511199 All other publishers
5112  	NAICS 5112 Software publishers
51121 	NAICS 51121 Software publishers
511210	NAICS 511210 Software publishers
512   	NAICS 512 Motion picture and sound recording industries
5121  	NAICS 5121 Motion picture and video industries
51211 	NAICS 51211 Motion picture and video production
512110	NAICS 512110 Motion picture and video production
51212 	NAICS 51212 Motion picture and video distribution
512120	NAICS 512120 Motion picture and video distribution
51213 	NAICS 51213 Motion picture and video exhibition
512131	NAICS 512131 Motion picture theaters, except drive-ins
512132	NAICS 512132 Drive-in motion picture theaters
51219 	NAICS 51219 Postproduction and other related industries
512191	NAICS 512191 Teleproduction and postproduction services
512199	NAICS 512199 Other motion picture and video industries
5122  	NAICS 5122 Sound recording industries
51221 	NAICS 51221 Record production
512210	NAICS 512210 Record production
51222 	NAICS 51222 Integrated record production and distribution
512220	NAICS 512220 Integrated record production and distribution
51223 	NAICS 51223 Music publishers
512230	NAICS 512230 Music publishers
51224 	NAICS 51224 Sound recording studios
512240	NAICS 512240 Sound recording studios
51229 	NAICS 51229 Other sound recording industries
512290	NAICS 512290 Other sound recording industries
515   	NAICS 515 Broadcasting, except Internet
5151  	NAICS 5151 Radio and television broadcasting
51511 	NAICS 51511 Radio broadcasting
515111	NAICS 515111 Radio networks
515112	NAICS 515112 Radio stations
51512 	NAICS 51512 Television broadcasting
515120	NAICS 515120 Television broadcasting
5152  	NAICS 5152 Cable and other subscription programming
51521 	NAICS 51521 Cable and other subscription programming
515210	NAICS 515210 Cable and other subscription programming
516   	NAICS02 516 Internet publishing and broadcasting
5161  	NAICS02 5161 Internet publishing and broadcasting
51611 	NAICS02 51611 Internet publishing and broadcasting
516110	NAICS02 516110 Internet publishing and broadcasting
517   	NAICS 517 Telecommunications
5171  	NAICS 5171 Wired telecommunications carriers
51711 	NAICS 51711 Wired telecommunications carriers
517110	NAICS 517110 Wired telecommunications carriers
5172  	NAICS 5172 Wireless telecommunications carriers
51721 	NAICS 51721 Wireless telecommunications carriers
517210	NAICS 517210 Wireless telecommunications carriers
517211	NAICS02 517211 Paging
517212	NAICS02 517212 Cellular and other wireless carriers
5173  	NAICS02 5173 Telecommunications resellers
51731 	NAICS02 51731 Telecommunications resellers
517310	NAICS02 517310 Telecommunications resellers
5174  	NAICS 5174 Satellite telecommunications
51741 	NAICS 51741 Satellite telecommunications
517410	NAICS 517410 Satellite telecommunications
5175  	NAICS02 5175 Cable and other program distribution
51751 	NAICS02 51751 Cable and other program distribution
517510	NAICS02 517510 Cable and other program distribution
5179  	NAICS 5179 Other telecommunications
51791 	NAICS 51791 Other telecommunications
517910	NAICS02 517910 Other telecommunications
517911	NAICS 517911 Telecommunications resellers
517919	NAICS 517919 All other telecommunications
518   	NAICS 518 Data processing, hosting and related services
5181  	NAICS02 5181 ISPs and web search portals
51811 	NAICS02 51811 ISPs and web search portals
518111	NAICS02 518111 Internet service providers
518112	NAICS02 518112 Web search portals
5182  	NAICS 5182 Data processing, hosting and related services
51821 	NAICS 51821 Data processing, hosting and related services
518210	NAICS 518210 Data processing, hosting and related services
519   	NAICS 519 Other information services
5191  	NAICS 5191 Other information services
51911 	NAICS 51911 News syndicates
519110	NAICS 519110 News syndicates
51912 	NAICS 51912 Libraries and archives
519120	NAICS 519120 Libraries and archives
51913 	NAICS 51913 Internet publishing and web search portals
519130	NAICS 519130 Internet publishing and web search portals
51919 	NAICS 51919 All other information services
519190	NAICS 519190 All other information services
1023  	1023 Financial Activities
52    	NAICS 52 Finance and insurance
521   	NAICS 521 Monetary authorities - central bank
5211  	NAICS 5211 Monetary authorities - central bank
52111 	NAICS 52111 Monetary authorities - central bank
521110	NAICS 521110 Monetary authorities - central bank
522   	NAICS 522 Credit intermediation and related activities
5221  	NAICS 5221 Depository credit intermediation
52211 	NAICS 52211 Commercial banking
522110	NAICS 522110 Commercial banking
52212 	NAICS 52212 Savings institutions
522120	NAICS 522120 Savings institutions
52213 	NAICS 52213 Credit unions
522130	NAICS 522130 Credit unions
52219 	NAICS 52219 Other depository credit intermediation
522190	NAICS 522190 Other depository credit intermediation
5222  	NAICS 5222 Nondepository credit intermediation
52221 	NAICS 52221 Credit card issuing
522210	NAICS 522210 Credit card issuing
52222 	NAICS 52222 Sales financing
522220	NAICS 522220 Sales financing
52229 	NAICS 52229 Other nondepository credit intermediation
522291	NAICS 522291 Consumer lending
522292	NAICS 522292 Real estate credit
522293	NAICS 522293 International trade financing
522294	NAICS 522294 Secondary market financing
522298	NAICS 522298 All other nondepository credit intermediation
5223  	NAICS 5223 Activities related to credit intermediation
52231 	NAICS 52231 Mortgage and nonmortgage loan brokers
522310	NAICS 522310 Mortgage and nonmortgage loan brokers
52232 	NAICS 52232 Financial transaction processing and clearing
522320	NAICS 522320 Financial transaction processing and clearing
52239 	NAICS 52239 Other credit intermediation activities
522390	NAICS 522390 Other credit intermediation activities
523   	NAICS 523 Securities, commodity contracts, investments
5231  	NAICS 5231 Securities and commodity contracts brokerage
52311 	NAICS 52311 Investment banking and securities dealing
523110	NAICS 523110 Investment banking and securities dealing
52312 	NAICS 52312 Securities brokerage
523120	NAICS 523120 Securities brokerage
52313 	NAICS 52313 Commodity contracts dealing
523130	NAICS 523130 Commodity contracts dealing
52314 	NAICS 52314 Commodity contracts brokerage
523140	NAICS 523140 Commodity contracts brokerage
5232  	NAICS 5232 Securities and commodity exchanges
52321 	NAICS 52321 Securities and commodity exchanges
523210	NAICS 523210 Securities and commodity exchanges
5239  	NAICS 5239 Other financial investment activities
52391 	NAICS 52391 Miscellaneous intermediation
523910	NAICS 523910 Miscellaneous intermediation
52392 	NAICS 52392 Portfolio management
523920	NAICS 523920 Portfolio management
52393 	NAICS 52393 Investment advice
523930	NAICS 523930 Investment advice
52399 	NAICS 52399 All other financial investment activities
523991	NAICS 523991 Trust, fiduciary, and custody activities
523999	NAICS 523999 Miscellaneous financial investment activities
524   	NAICS 524 Insurance carriers and related activities
5241  	NAICS 5241 Insurance carriers
52411 	NAICS 52411 Direct life and health insurance carriers
524113	NAICS 524113 Direct life insurance carriers
524114	NAICS 524114 Direct health and medical insurance carriers
52412 	NAICS 52412 Direct insurers, except life and health
524126	NAICS 524126 Direct property and casualty insurers
524127	NAICS 524127 Direct title insurance carriers
524128	NAICS 524128 Other direct insurance carriers
52413 	NAICS 52413 Reinsurance carriers
524130	NAICS 524130 Reinsurance carriers
5242  	NAICS 5242 Insurance agencies and brokerages
52421 	NAICS 52421 Insurance agencies and brokerages
524210	NAICS 524210 Insurance agencies and brokerages
52429 	NAICS 52429 Other insurance related activities
524291	NAICS 524291 Claims adjusting
524292	NAICS 524292 Third party administration of insurance funds
524298	NAICS 524298 All other insurance related activities
525   	NAICS 525 Funds, trusts, and other financial vehicles
5251  	NAICS 5251 Insurance and employee benefit funds
52511 	NAICS 52511 Pension funds
525110	NAICS 525110 Pension funds
52512 	NAICS 52512 Health and welfare funds
525120	NAICS 525120 Health and welfare funds
52519 	NAICS 52519 Other insurance funds
525190	NAICS 525190 Other insurance funds
5259  	NAICS 5259 Other investment pools and funds
52591 	NAICS 52591 Open-end investment funds
525910	NAICS 525910 Open-end investment funds
52592 	NAICS 52592 Trusts, estates, and agency accounts
525920	NAICS 525920 Trusts, estates, and agency accounts
52593 	NAICS02 52593 Real estate investment trusts
525930	NAICS02 525930 Real estate investment trusts
52599 	NAICS 52599 Other financial vehicles
525990	NAICS 525990 Other financial vehicles
53    	NAICS 53 Real estate and rental and leasing
531   	NAICS 531 Real estate
5311  	NAICS 5311 Lessors of real estate
53111 	NAICS 53111 Lessors of residential buildings
531110	NAICS 531110 Lessors of residential buildings
53112 	NAICS 53112 Lessors of nonresidential buildings
531120	NAICS 531120 Lessors of nonresidential buildings
53113 	NAICS 53113 Miniwarehouse and self-storage unit operators
531130	NAICS 531130 Miniwarehouse and self-storage unit operators
53119 	NAICS 53119 Lessors of other real estate property
531190	NAICS 531190 Lessors of other real estate property
5312  	NAICS 5312 Offices of real estate agents and brokers
53121 	NAICS 53121 Offices of real estate agents and brokers
531210	NAICS 531210 Offices of real estate agents and brokers
5313  	NAICS 5313 Activities related to real estate
53131 	NAICS 53131 Real estate property managers
531311	NAICS 531311 Residential property managers
531312	NAICS 531312 Nonresidential property managers
53132 	NAICS 53132 Offices of real estate appraisers
531320	NAICS 531320 Offices of real estate appraisers
53139 	NAICS 53139 Other activities related to real estate
531390	NAICS 531390 Other activities related to real estate
532   	NAICS 532 Rental and leasing services
5321  	NAICS 5321 Automotive equipment rental and leasing
53211 	NAICS 53211 Passenger car rental and leasing
532111	NAICS 532111 Passenger car rental
532112	NAICS 532112 Passenger car leasing
53212 	NAICS 53212 Truck, trailer, and RV rental and leasing
532120	NAICS 532120 Truck, trailer, and RV rental and leasing
5322  	NAICS 5322 Consumer goods rental
53221 	NAICS 53221 Consumer electronics and appliances rental
532210	NAICS 532210 Consumer electronics and appliances rental
53222 	NAICS 53222 Formal wear and costume rental
532220	NAICS 532220 Formal wear and costume rental
53223 	NAICS 53223 Video tape and disc rental
532230	NAICS 532230 Video tape and disc rental
53229 	NAICS 53229 Other consumer goods rental
532291	NAICS 532291 Home health equipment rental
532292	NAICS 532292 Recreational goods rental
532299	NAICS 532299 All other consumer goods rental
5323  	NAICS 5323 General rental centers
53231 	NAICS 53231 General rental centers
532310	NAICS 532310 General rental centers
5324  	NAICS 5324 Machinery and equipment rental and leasing
53241 	NAICS 53241 Heavy machinery rental and leasing
532411	NAICS 532411 Transportation equipment rental and leasing
532412	NAICS 532412 Other heavy machinery rental and leasing
53242 	NAICS 53242 Office equipment rental and leasing
532420	NAICS 532420 Office equipment rental and leasing
53249 	NAICS 53249 Other machinery rental and leasing
532490	NAICS 532490 Other machinery rental and leasing
533   	NAICS 533 Lessors of nonfinancial intangible assets
5331  	NAICS 5331 Lessors of nonfinancial intangible assets
53311 	NAICS 53311 Lessors of nonfinancial intangible assets
533110	NAICS 533110 Lessors of nonfinancial intangible assets
1024  	1024 Professional and Business Services
54    	NAICS 54 Professional and technical services
541   	NAICS 541 Professional and Technical Services
5411  	NAICS 5411 Legal services
54111 	NAICS 54111 Offices of lawyers
541110	NAICS 541110 Offices of lawyers
54119 	NAICS 54119 Other legal services
541191	NAICS 541191 Title abstract and settlement offices
541199	NAICS 541199 All other legal services
5412  	NAICS 5412 Accounting and bookkeeping services
54121 	NAICS 54121 Accounting and bookkeeping services
541211	NAICS 541211 Offices of certified public accountants
541213	NAICS 541213 Tax preparation services
541214	NAICS 541214 Payroll services
541219	NAICS 541219 Other accounting services
5413  	NAICS 5413 Architectural and engineering services
54131 	NAICS 54131 Architectural services
541310	NAICS 541310 Architectural services
54132 	NAICS 54132 Landscape architectural services
541320	NAICS 541320 Landscape architectural services
54133 	NAICS 54133 Engineering services
541330	NAICS 541330 Engineering services
54134 	NAICS 54134 Drafting services
541340	NAICS 541340 Drafting services
54135 	NAICS 54135 Building inspection services
541350	NAICS 541350 Building inspection services
54136 	NAICS 54136 Geophysical surveying and mapping services
541360	NAICS 541360 Geophysical surveying and mapping services
54137 	NAICS 54137 Other surveying and mapping services
541370	NAICS 541370 Other surveying and mapping services
54138 	NAICS 54138 Testing laboratories
541380	NAICS 541380 Testing laboratories
5414  	NAICS 5414 Specialized design services
54141 	NAICS 54141 Interior design services
541410	NAICS 541410 Interior design services
54142 	NAICS 54142 Industrial design services
541420	NAICS 541420 Industrial design services
54143 	NAICS 54143 Graphic design services
541430	NAICS 541430 Graphic design services
54149 	NAICS 54149 Other specialized design services
541490	NAICS 541490 Other specialized design services
5415  	NAICS 5415 Computer systems design and related services
54151 	NAICS 54151 Computer systems design and related services
541511	NAICS 541511 Custom computer programming services
541512	NAICS 541512 Computer systems design services
541513	NAICS 541513 Computer facilities management services
541519	NAICS 541519 Other computer related services
5416  	NAICS 5416 Management and technical consulting services
54161 	NAICS 54161 Management consulting services
541611	NAICS 541611 Administrative management consulting services
541612	NAICS 541612 Human resources consulting services
541613	NAICS 541613 Marketing consulting services
541614	NAICS 541614 Process and logistics consulting services
541618	NAICS 541618 Other management consulting services
54162 	NAICS 54162 Environmental consulting services
541620	NAICS 541620 Environmental consulting services
54169 	NAICS 54169 Other technical consulting services
541690	NAICS 541690 Other technical consulting services
5417  	NAICS 5417 Scientific research and development services
54171 	NAICS 54171 Physical, engineering and biological research
541710	NAICS02 541710 Physical, engineering and biological research
541711	NAICS 541711 Research and development in biotechnology
541712	NAICS 541712 Other physical and biological research
54172 	NAICS 54172 Social science and humanities research
541720	NAICS 541720 Social science and humanities research
5418  	NAICS 5418 Advertising, PR, and related services
54181 	NAICS 54181 Advertising agencies
541810	NAICS 541810 Advertising agencies
54182 	NAICS 54182 Public relations agencies
541820	NAICS 541820 Public relations agencies
54183 	NAICS 54183 Media buying agencies
541830	NAICS 541830 Media buying agencies
54184 	NAICS 54184 Media representatives
541840	NAICS 541840 Media representatives
54185 	NAICS 54185 Display advertising
541850	NAICS 541850 Display advertising
54186 	NAICS 54186 Direct mail advertising
541860	NAICS 541860 Direct mail advertising
54187 	NAICS 54187 Advertising material distribution services
541870	NAICS 541870 Advertising material distribution services
54189 	NAICS 54189 Other services related to advertising
541890	NAICS 541890 Other services related to advertising
5419  	NAICS 5419 Other professional and technical services
54191 	NAICS 54191 Marketing research and public opinion polling
541910	NAICS 541910 Marketing research and public opinion polling
54192 	NAICS 54192 Photographic services
541921	NAICS 541921 Photography studios, portrait
541922	NAICS 541922 Commercial photography
54193 	NAICS 54193 Translation and interpretation services
541930	NAICS 541930 Translation and interpretation services
54194 	NAICS 54194 Veterinary services
541940	NAICS 541940 Veterinary services
54199 	NAICS 54199 All other professional and technical services
541990	NAICS 541990 All other professional and technical services
55    	NAICS 55 Management of companies and enterprises
551   	NAICS 551 Management of companies and enterprises
5511  	NAICS 5511 Management of companies and enterprises
55111 	NAICS 55111 Management of companies and enterprises
551111	NAICS 551111 Offices of bank holding companies
551112	NAICS 551112 Offices of other holding companies
551114	NAICS 551114 Managing offices
56    	NAICS 56 Administrative and waste services
561   	NAICS 561 Administrative and support services
5611  	NAICS 5611 Office administrative services
56111 	NAICS 56111 Office administrative services
561110	NAICS 561110 Office administrative services
5612  	NAICS 5612 Facilities support services
56121 	NAICS 56121 Facilities support services
561210	NAICS 561210 Facilities support services
5613  	NAICS 5613 Employment services
56131 	NAICS 56131 Employment placement and executive search
561310	NAICS02 561310 Employment placement agencies
561311	NAICS 561311 Employment placement agencies
561312	NAICS 561312 Executive search services
56132 	NAICS 56132 Temporary help services
561320	NAICS 561320 Temporary help services
56133 	NAICS 56133 Professional employer organizations
561330	NAICS 561330 Professional employer organizations
5614  	NAICS 5614 Business support services
56141 	NAICS 56141 Document preparation services
561410	NAICS 561410 Document preparation services
56142 	NAICS 56142 Telephone call centers
561421	NAICS 561421 Telephone answering services
561422	NAICS 561422 Telemarketing and other contact centers
56143 	NAICS 56143 Business service centers
561431	NAICS 561431 Private mail centers
561439	NAICS 561439 Other business service centers
56144 	NAICS 56144 Collection agencies
561440	NAICS 561440 Collection agencies
56145 	NAICS 56145 Credit bureaus
561450	NAICS 561450 Credit bureaus
56149 	NAICS 56149 Other business support services
561491	NAICS 561491 Repossession services
561492	NAICS 561492 Court reporting and stenotype services
561499	NAICS 561499 All other business support services
5615  	NAICS 5615 Travel arrangement and reservation services
56151 	NAICS 56151 Travel agencies
561510	NAICS 561510 Travel agencies
56152 	NAICS 56152 Tour operators
561520	NAICS 561520 Tour operators
56159 	NAICS 56159 Other travel arrangement services
561591	NAICS 561591 Convention and visitors bureaus
561599	NAICS 561599 All other travel arrangement services
5616  	NAICS 5616 Investigation and security services
56161 	NAICS 56161 Security and armored car services
561611	NAICS 561611 Investigation services
561612	NAICS 561612 Security guards and patrol services
561613	NAICS 561613 Armored car services
56162 	NAICS 56162 Security systems services
561621	NAICS 561621 Security systems services, except locksmiths
561622	NAICS 561622 Locksmiths
5617  	NAICS 5617 Services to buildings and dwellings
56171 	NAICS 56171 Exterminating and pest control services
561710	NAICS 561710 Exterminating and pest control services
56172 	NAICS 56172 Janitorial services
561720	NAICS 561720 Janitorial services
56173 	NAICS 56173 Landscaping services
561730	NAICS 561730 Landscaping services
56174 	NAICS 56174 Carpet and upholstery cleaning services
561740	NAICS 561740 Carpet and upholstery cleaning services
56179 	NAICS 56179 Other services to buildings and dwellings
561790	NAICS 561790 Other services to buildings and dwellings
5619  	NAICS 5619 Other support services
56191 	NAICS 56191 Packaging and labeling services
561910	NAICS 561910 Packaging and labeling services
56192 	NAICS 56192 Convention and trade show organizers
561920	NAICS 561920 Convention and trade show organizers
56199 	NAICS 56199 All other support services
561990	NAICS 561990 All other support services
562   	NAICS 562 Waste management and remediation services
5621  	NAICS 5621 Waste collection
56211 	NAICS 56211 Waste collection
562111	NAICS 562111 Solid waste collection
562112	NAICS 562112 Hazardous waste collection
562119	NAICS 562119 Other waste collection
5622  	NAICS 5622 Waste treatment and disposal
56221 	NAICS 56221 Waste treatment and disposal
562211	NAICS 562211 Hazardous waste treatment and disposal
562212	NAICS 562212 Solid waste landfill
562213	NAICS 562213 Solid waste combustors and incinerators
562219	NAICS 562219 Other nonhazardous waste disposal
5629  	NAICS 5629 Remediation and other waste services
56291 	NAICS 56291 Remediation services
562910	NAICS 562910 Remediation services
56292 	NAICS 56292 Materials recovery facilities
562920	NAICS 562920 Materials recovery facilities
56299 	NAICS 56299 All other waste management services
562991	NAICS 562991 Septic tank and related services
562998	NAICS 562998 Miscellaneous waste management services
6	6 Education and Health Services
61    	NAICS 61 Educational services
611   	NAICS 611 Educational services
6111  	NAICS 6111 Elementary and secondary schools
61111 	NAICS 61111 Elementary and secondary schools
611110	NAICS 611110 Elementary and secondary schools
6112  	NAICS 6112 Junior colleges
61121 	NAICS 61121 Junior colleges
611210	NAICS 611210 Junior colleges
6113  	NAICS 6113 Colleges and universities
61131 	NAICS 61131 Colleges and universities
611310	NAICS 611310 Colleges and universities
6114  	NAICS 6114 Business, computer and management training
61141 	NAICS 61141 Business and secretarial schools
611410	NAICS 611410 Business and secretarial schools
61142 	NAICS 61142 Computer training
611420	NAICS 611420 Computer training
61143 	NAICS 61143 Management training
611430	NAICS 611430 Management training
6115  	NAICS 6115 Technical and trade schools
61151 	NAICS 61151 Technical and trade schools
611511	NAICS 611511 Cosmetology and barber schools
611512	NAICS 611512 Flight training
611513	NAICS 611513 Apprenticeship training
611519	NAICS 611519 Other technical and trade schools
6116  	NAICS 6116 Other schools and instruction
61161 	NAICS 61161 Fine arts schools
611610	NAICS 611610 Fine arts schools
61162 	NAICS 61162 Sports and recreation instruction
611620	NAICS 611620 Sports and recreation instruction
61163 	NAICS 61163 Language schools
611630	NAICS 611630 Language schools
61169 	NAICS 61169 All other schools and instruction
611691	NAICS 611691 Exam preparation and tutoring
611692	NAICS 611692 Automobile driving schools
611699	NAICS 611699 Miscellaneous schools and instruction
6117  	NAICS 6117 Educational support services
61171 	NAICS 61171 Educational support services
611710	NAICS 611710 Educational support services
62    	NAICS 62 Health care and social assistance
621   	NAICS 621 Ambulatory health care services
6211  	NAICS 6211 Offices of physicians
62111 	NAICS 62111 Offices of physicians
621111	NAICS 621111 Offices of physicians, except mental health
621112	NAICS 621112 Offices of mental health physicians
6212  	NAICS 6212 Offices of dentists
62121 	NAICS 62121 Offices of dentists
621210	NAICS 621210 Offices of dentists
6213  	NAICS 6213 Offices of other health practitioners
62131 	NAICS 62131 Offices of chiropractors
621310	NAICS 621310 Offices of chiropractors
62132 	NAICS 62132 Offices of optometrists
621320	NAICS 621320 Offices of optometrists
62133 	NAICS 62133 Offices of mental health practitioners
621330	NAICS 621330 Offices of mental health practitioners
62134 	NAICS 62134 Offices of specialty therapists
621340	NAICS 621340 Offices of specialty therapists
62139 	NAICS 62139 Offices of all other health practitioners
621391	NAICS 621391 Offices of podiatrists
621399	NAICS 621399 Offices of miscellaneous health practitioners
6214  	NAICS 6214 Outpatient care centers
62141 	NAICS 62141 Family planning centers
621410	NAICS 621410 Family planning centers
62142 	NAICS 62142 Outpatient mental health centers
621420	NAICS 621420 Outpatient mental health centers
62149 	NAICS 62149 Other outpatient care centers
621491	NAICS 621491 HMO medical centers
621492	NAICS 621492 Kidney dialysis centers
621493	NAICS 621493 Freestanding emergency medical centers
621498	NAICS 621498 All other outpatient care centers
6215  	NAICS 6215 Medical and diagnostic laboratories
62151 	NAICS 62151 Medical and diagnostic laboratories
621511	NAICS 621511 Medical laboratories
621512	NAICS 621512 Diagnostic imaging centers
6216  	NAICS 6216 Home health care services
62161 	NAICS 62161 Home health care services
621610	NAICS 621610 Home health care services
6219  	NAICS 6219 Other ambulatory health care services
62191 	NAICS 62191 Ambulance services
621910	NAICS 621910 Ambulance services
62199 	NAICS 62199 All other ambulatory health care services
621991	NAICS 621991 Blood and organ banks
621999	NAICS 621999 Miscellaneous ambulatory health care services
622   	NAICS 622 Hospitals
6221  	NAICS 6221 General medical and surgical hospitals
62211 	NAICS 62211 General medical and surgical hospitals
622110	NAICS 622110 General medical and surgical hospitals
6222  	NAICS 6222 Psychiatric and substance abuse hospitals
62221 	NAICS 62221 Psychiatric and substance abuse hospitals
622210	NAICS 622210 Psychiatric and substance abuse hospitals
6223  	NAICS 6223 Other hospitals
62231 	NAICS 62231 Other hospitals
622310	NAICS 622310 Other hospitals
623   	NAICS 623 Nursing and residential care facilities
6231  	NAICS 6231 Nursing care facilities
62311 	NAICS 62311 Nursing care facilities
623110	NAICS 623110 Nursing care facilities
6232  	NAICS 6232 Residential mental health facilities
62321 	NAICS 62321 Residential mental retardation facilities
623210	NAICS 623210 Residential mental retardation facilities
62322 	NAICS 62322 Residential mental and substance abuse care
623220	NAICS 623220 Residential mental and substance abuse care
6233  	NAICS 6233 Community care facilities for the elderly
62331 	NAICS 62331 Community care facilities for the elderly
623311	NAICS 623311 Continuing care retirement communities
623312	NAICS 623312 Homes for the elderly
6239  	NAICS 6239 Other residential care facilities
62399 	NAICS 62399 Other residential care facilities
623990	NAICS 623990 Other residential care facilities
624   	NAICS 624 Social assistance
6241  	NAICS 6241 Individual and family services
62411 	NAICS 62411 Child and youth services
624110	NAICS 624110 Child and youth services
62412 	NAICS 62412 Services for the elderly and disabled
624120	NAICS 624120 Services for the elderly and disabled
62419 	NAICS 62419 Other individual and family services
624190	NAICS 624190 Other individual and family services
6242  	NAICS 6242 Emergency and other relief services
62421 	NAICS 62421 Community food services
624210	NAICS 624210 Community food services
62422 	NAICS 62422 Community housing services
624221	NAICS 624221 Temporary shelters
624229	NAICS 624229 Other community housing services
62423 	NAICS 62423 Emergency and other relief services
624230	NAICS 624230 Emergency and other relief services
6243  	NAICS 6243 Vocational rehabilitation services
62431 	NAICS 62431 Vocational rehabilitation services
624310	NAICS 624310 Vocational rehabilitation services
6244  	NAICS 6244 Child day care services
62441 	NAICS 62441 Child day care services
624410	NAICS 624410 Child day care services
7  	7 Leisure and Hospitality
71    	NAICS 71 Arts, entertainment, and recreation
711   	NAICS 711 Performing arts and spectator sports
7111  	NAICS 7111 Performing arts companies
71111 	NAICS 71111 Theater companies and dinner theaters
711110	NAICS 711110 Theater companies and dinner theaters
71112 	NAICS 71112 Dance companies
711120	NAICS 711120 Dance companies
71113 	NAICS 71113 Musical groups and artists
711130	NAICS 711130 Musical groups and artists
71119 	NAICS 71119 Other performing arts companies
711190	NAICS 711190 Other performing arts companies
7112  	NAICS 7112 Spectator sports
71121 	NAICS 71121 Spectator sports
711211	NAICS 711211 Sports teams and clubs
711212	NAICS 711212 Racetracks
711219	NAICS 711219 Other spectator sports
7113  	NAICS 7113 Promoters of performing arts and sports
71131 	NAICS 71131 Promoters with facilities
711310	NAICS 711310 Promoters with facilities
71132 	NAICS 71132 Promoters without facilities
711320	NAICS 711320 Promoters without facilities
7114  	NAICS 7114 Agents and managers for public figures
71141 	NAICS 71141 Agents and managers for public figures
711410	NAICS 711410 Agents and managers for public figures
7115  	NAICS 7115 Independent artists, writers, and performers
71151 	NAICS 71151 Independent artists, writers, and performers
711510	NAICS 711510 Independent artists, writers, and performers
712   	NAICS 712 Museums, historical sites, zoos, and parks
7121  	NAICS 7121 Museums, historical sites, zoos, and parks
71211 	NAICS 71211 Museums
712110	NAICS 712110 Museums
71212 	NAICS 71212 Historical sites
712120	NAICS 712120 Historical sites
71213 	NAICS 71213 Zoos and botanical gardens
712130	NAICS 712130 Zoos and botanical gardens
71219 	NAICS 71219 Nature parks and other similar institutions
712190	NAICS 712190 Nature parks and other similar institutions
713   	NAICS 713 Amusements, gambling, and recreation
7131  	NAICS 7131 Amusement parks and arcades
71311 	NAICS 71311 Amusement and theme parks
713110	NAICS 713110 Amusement and theme parks
71312 	NAICS 71312 Amusement arcades
713120	NAICS 713120 Amusement arcades
7132  	NAICS 7132 Gambling industries
71321 	NAICS 71321 Casinos, except casino hotels
713210	NAICS 713210 Casinos, except casino hotels
71329 	NAICS 71329 Other gambling industries
713290	NAICS 713290 Other gambling industries
7139  	NAICS 7139 Other amusement and recreation industries
71391 	NAICS 71391 Golf courses and country clubs
713910	NAICS 713910 Golf courses and country clubs
71392 	NAICS 71392 Skiing facilities
713920	NAICS 713920 Skiing facilities
71393 	NAICS 71393 Marinas
713930	NAICS 713930 Marinas
71394 	NAICS 71394 Fitness and recreational sports centers
713940	NAICS 713940 Fitness and recreational sports centers
71395 	NAICS 71395 Bowling centers
713950	NAICS 713950 Bowling centers
71399 	NAICS 71399 All other amusement and recreation industries
713990	NAICS 713990 All other amusement and recreation industries
72    	NAICS 72 Accommodation and food services
721   	NAICS 721 Accommodation
7211  	NAICS 7211 Traveler accommodation
72111 	NAICS 72111 Hotels and motels, except casino hotels
721110	NAICS 721110 Hotels and motels, except casino hotels
72112 	NAICS 72112 Casino hotels
721120	NAICS 721120 Casino hotels
72119 	NAICS 72119 Other traveler accommodation
721191	NAICS 721191 Bed-and-breakfast inns
721199	NAICS 721199 All other traveler accommodation
7212  	NAICS 7212 RV parks and recreational camps
72121 	NAICS 72121 RV parks and recreational camps
721211	NAICS 721211 RV parks and campgrounds
721214	NAICS 721214 Recreational and vacation camps
7213  	NAICS 7213 Rooming and boarding houses
72131 	NAICS 72131 Rooming and boarding houses
721310	NAICS 721310 Rooming and boarding houses
722   	NAICS 722 Food services and drinking places
7221  	NAICS 7221 Full-service restaurants
72211 	NAICS 72211 Full-service restaurants
722110	NAICS 722110 Full-service restaurants
7222  	NAICS 7222 Limited-service eating places
72221 	NAICS 72221 Limited-service eating places
722211	NAICS 722211 Limited-service restaurants
722212	NAICS 722212 Cafeterias, grill buffets, and buffets
722213	NAICS 722213 Snack and nonalcoholic beverage bars
7223  	NAICS 7223 Special food services
72231 	NAICS 72231 Food service contractors
722310	NAICS 722310 Food service contractors
72232 	NAICS 72232 Caterers
722320	NAICS 722320 Caterers
72233 	NAICS 72233 Mobile food services
722330	NAICS 722330 Mobile food services
7224  	NAICS 7224 Drinking places, alcoholic beverages
72241 	NAICS 72241 Drinking places, alcoholic beverages
722410	NAICS 722410 Drinking places, alcoholic beverages
8	8 General Services
81    	NAICS 81 Other services, except public administration
811   	NAICS 811 Repair and maintenance
8111  	NAICS 8111 Automotive repair and maintenance
81111 	NAICS 81111 Automotive mechanical and electrical repair
811111	NAICS 811111 General automotive repair
811112	NAICS 811112 Automotive exhaust system repair
811113	NAICS 811113 Automotive transmission repair
811118	NAICS 811118 Other automotive mechanical and elec. repair
81112 	NAICS 81112 Automotive body, interior, and glass repair
811121	NAICS 811121 Automotive body and interior repair
811122	NAICS 811122 Automotive glass replacement shops
81119 	NAICS 81119 Other automotive repair and maintenance
811191	NAICS 811191 Automotive oil change and lubrication shops
811192	NAICS 811192 Car washes
811198	NAICS 811198 All other automotive repair and maintenance
8112  	NAICS 8112 Electronic equipment repair and maintenance
81121 	NAICS 81121 Electronic equipment repair and maintenance
811211	NAICS 811211 Consumer electronics repair and maintenance
811212	NAICS 811212 Computer and office machine repair
811213	NAICS 811213 Communication equipment repair
811219	NAICS 811219 Other electronic equipment repair
8113  	NAICS 8113 Commercial machinery repair and maintenance
81131 	NAICS 81131 Commercial machinery repair and maintenance
811310	NAICS 811310 Commercial machinery repair and maintenance
8114  	NAICS 8114 Household goods repair and maintenance
81141 	NAICS 81141 Home and garden equip. and appliance repair
811411	NAICS 811411 Home and garden equipment repair
811412	NAICS 811412 Appliance repair and maintenance
81142 	NAICS 81142 Reupholstery and furniture repair
811420	NAICS 811420 Reupholstery and furniture repair
81143 	NAICS 81143 Footwear and leather goods repair
811430	NAICS 811430 Footwear and leather goods repair
81149 	NAICS 81149 Other household goods repair and maintenance
811490	NAICS 811490 Other household goods repair and maintenance
812   	NAICS 812 Personal and laundry services
8121  	NAICS 8121 Personal care services
81211 	NAICS 81211 Hair, nail, and skin care services
812111	NAICS 812111 Barber shops
812112	NAICS 812112 Beauty salons
812113	NAICS 812113 Nail salons
81219 	NAICS 81219 Other personal care services
812191	NAICS 812191 Diet and weight reducing centers
812199	NAICS 812199 Other personal care services
8122  	NAICS 8122 Death care services
81221 	NAICS 81221 Funeral homes and funeral services
812210	NAICS 812210 Funeral homes and funeral services
81222 	NAICS 81222 Cemeteries and crematories
812220	NAICS 812220 Cemeteries and crematories
8123  	NAICS 8123 Drycleaning and laundry services
81231 	NAICS 81231 Coin-operated laundries and drycleaners
812310	NAICS 812310 Coin-operated laundries and drycleaners
81232 	NAICS 81232 Drycleaning and laundry services
812320	NAICS 812320 Drycleaning and laundry services
81233 	NAICS 81233 Linen and uniform supply
812331	NAICS 812331 Linen supply
812332	NAICS 812332 Industrial launderers
8129  	NAICS 8129 Other personal services
81291 	NAICS 81291 Pet care, except veterinary, services
812910	NAICS 812910 Pet care, except veterinary, services
81292 	NAICS 81292 Photofinishing
812921	NAICS 812921 Photofinishing laboratories, except one-hour
812922	NAICS 812922 One-hour photofinishing
81293 	NAICS 81293 Parking lots and garages
812930	NAICS 812930 Parking lots and garages
81299 	NAICS 81299 All other personal services
812990	NAICS 812990 All other personal services
813   	NAICS 813 Membership associations and organizations
8131  	NAICS 8131 Religious organizations
81311 	NAICS 81311 Religious organizations
813110	NAICS 813110 Religious organizations
8132  	NAICS 8132 Grantmaking and giving services
81321 	NAICS 81321 Grantmaking and giving services
813211	NAICS 813211 Grantmaking foundations
813212	NAICS 813212 Voluntary health organizations
813219	NAICS 813219 Other grantmaking and giving services
8133  	NAICS 8133 Social advocacy organizations
81331 	NAICS 81331 Social advocacy organizations
813311	NAICS 813311 Human rights organizations
813312	NAICS 813312 Environment and conservation organizations
813319	NAICS 813319 Other social advocacy organizations
8134  	NAICS 8134 Civic and social organizations
81341 	NAICS 81341 Civic and social organizations
813410	NAICS 813410 Civic and social organizations
8139  	NAICS 8139 Professional and similar organizations
81391 	NAICS 81391 Business associations
813910	NAICS 813910 Business associations
81392 	NAICS 81392 Professional organizations
813920	NAICS 813920 Professional organizations
81393 	NAICS 81393 Labor unions and similar labor organizations
813930	NAICS 813930 Labor unions and similar labor organizations
81394 	NAICS 81394 Political organizations
813940	NAICS 813940 Political organizations
81399 	NAICS 81399 Other similar organizations
813990	NAICS 813990 Other similar organizations
814   	NAICS 814 Private households
8141  	NAICS 8141 Private households
81411 	NAICS 81411 Private households
814110	NAICS 814110 Private households
1028  	1028 Public Administration
9	Public Administration
92    	NAICS 92 Public Administration
921   	NAICS 921 Executive, legislative and general government
9211  	NAICS 9211 Executive, legislative and general government
92111 	NAICS 92111 Executive offices
921110	NAICS 921110 Executive offices
92112 	NAICS 92112 Legislative bodies
921120	NAICS 921120 Legislative bodies
92113 	NAICS 92113 Public finance activities
921130	NAICS 921130 Public finance activities
92114 	NAICS 92114 Executive and legislative offices, combined
921140	NAICS 921140 Executive and legislative offices, combined
92115 	NAICS 92115 Tribal governments
921150	NAICS 921150 Tribal governments
92119 	NAICS 92119 Other general government support
921190	NAICS 921190 Other general government support
922   	NAICS 922 Justice, public order, and safety activities
9221  	NAICS 9221 Justice, public order, and safety activities
92211 	NAICS 92211 Courts
922110	NAICS 922110 Courts
92212 	NAICS 92212 Police protection
922120	NAICS 922120 Police protection
92213 	NAICS 92213 Legal counsel and prosecution
922130	NAICS 922130 Legal counsel and prosecution
92214 	NAICS 92214 Correctional institutions
922140	NAICS 922140 Correctional institutions
92215 	NAICS 92215 Parole offices and probation offices
922150	NAICS 922150 Parole offices and probation offices
92216 	NAICS 92216 Fire protection
922160	NAICS 922160 Fire protection
92219 	NAICS 92219 Other justice and safety activities
922190	NAICS 922190 Other justice and safety activities
923   	NAICS 923 Administration of human resource programs
9231  	NAICS 9231 Administration of human resource programs
92311 	NAICS 92311 Administration of education programs
923110	NAICS 923110 Administration of education programs
92312 	NAICS 92312 Administration of public health programs
923120	NAICS 923120 Administration of public health programs
92313 	NAICS 92313 Other human resource programs administration
923130	NAICS 923130 Other human resource programs administration
92314 	NAICS 92314 Administration of veterans' affairs
923140	NAICS 923140 Administration of veterans' affairs
924   	NAICS 924 Administration of environmental programs
9241  	NAICS 9241 Administration of environmental programs
92411 	NAICS 92411 Air, water, and waste program administration
924110	NAICS 924110 Air, water, and waste program administration
92412 	NAICS 92412 Administration of conservation programs
924120	NAICS 924120 Administration of conservation programs
925   	NAICS 925 Community and housing program administration
9251  	NAICS 9251 Community and housing program administration
92511 	NAICS 92511 Administration of housing programs
925110	NAICS 925110 Administration of housing programs
92512 	NAICS 92512 Urban and rural development administration
925120	NAICS 925120 Urban and rural development administration
926   	NAICS 926 Administration of economic programs
9261  	NAICS 9261 Administration of economic programs
92611 	NAICS 92611 Administration of general economic programs
926110	NAICS 926110 Administration of general economic programs
92612 	NAICS 92612 Transportation program administration
926120	NAICS 926120 Transportation program administration
92613 	NAICS 92613 Utility regulation and administration
926130	NAICS 926130 Utility regulation and administration
92614 	NAICS 92614 Agricultural market and commodity regulation
926140	NAICS 926140 Agricultural market and commodity regulation
92615 	NAICS 92615 Licensing and regulating commercial sectors
926150	NAICS 926150 Licensing and regulating commercial sectors
927   	NAICS 927 Space research and technology
9271  	NAICS 9271 Space research and technology
92711 	NAICS 92711 Space research and technology
927110	NAICS 927110 Space research and technology
928   	NAICS 928 National security and international affairs
9281  	NAICS 9281 National security and international affairs
92811 	NAICS 92811 National security
928110	NAICS 928110 National security
92812 	NAICS 92812 International affairs
928120	NAICS 928120 International affairs
1029   	1029 Unclassified
99    	NAICS 99 Unclassified
999   	NAICS 999 Unclassified
9999  	NAICS 9999 Unclassified
99999 	NAICS 99999 Unclassified
999999	NAICS 999999 Unclassified
\.

-- Add column with complete nesting to NAICS for display
ALTER TABLE naics ADD COLUMN display_title TEXT[];
UPDATE naics SET display_title = 
  (SELECT array_agg(substring(other.title from E'\[0-9]+ (.*)')) FROM
    (SELECT ancestor.title FROM naics ancestor 
     WHERE naics.code like ancestor.code || '%' ORDER BY length(code)) AS other);


-- 
-- US Bureau of Labor Statistics' Quarterly Census of Employment & Wages county-level data, 1990-2008
--
-- Expanded for faceting: one line per establishment 
--
-- See http://www.bls.gov/cew/ for more information
--

CREATE TABLE businesses(id SERIAL PRIMARY KEY, area CHAR(5), size INTEGER, ownership INTEGER, naics CHAR(6), 
                        year INTEGER, aggregation INTEGER,
                        disclosure CHAR, employment INTEGER, wages BIGINT, taxable_wages BIGINT, 
                        contributions INTEGER, weekly_wage INTEGER, annual_pay BIGINT,
												city CHAR(5));

-- used to choose a weighted city; included here for performance reasons
ALTER TABLE businesses ADD COLUMN city_rand DOUBLE PRECISION DEFAULT random();
