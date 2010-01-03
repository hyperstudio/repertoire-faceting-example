#!/usr/bin/ruby

# script to munge US BPL CEWS data in ENB format and regurgitate, one line per business

SAMPLE = 0.01                # fraction of original records to output

#    Identifier fields
#        1/3     Survey Prefix  *DISCARDED
#        4/8     Area Code
AREA      = 0
#        9/9     Datatype Code  *DISCARDED
#        10/10   Size Code
SIZE      = 1
#        11/11   Ownership Code
OWNERSHIP = 2
#        12/17   NAICS Industry Code
NAICS     = 3
#        18/21   Year
YEAR      = 4
#        22/23   Aggregation Level
AGGR      = 5
# ....
#    Annual Fields
#      372/372 Status/Disclosure Code
DISCLOSURE     = 6
#      373/380 Annual Average Number of Establishments
ESTABLISHMENTS = 7
#      381/389 Annual Average Employment
EMPLOYMENT = 8
#      390/404 Total Annual Wages 
#      405/419 Taxable Annual Wages 
#      420/432 Annual Contributions 
#      433/440 Average Weekly Wage 
#      441/449 Average Annual Pay

OMIT_NAICS = [ /^10.*$/,    # identifies bls-specific naics summary codes
               /^\d+-\d+.*$/ 
]       

STDOUT.puts <<-SQL
COPY businesses(area, size, ownership, naics, year, aggregation, disclosure,
          employment, wages, taxable_wages, 
          contributions, weekly_wage, annual_pay) FROM stdin WITH DELIMITER AS E'\\t';
SQL
  
WARN_THRESHOLD = -1

stack = []

# output the item on the top of the stack, expanding as necessary
def regurgitate(stack)
  top    = stack.pop
  topest = top[ESTABLISHMENTS]
  
  STDERR.puts "\nWarning: CEWS #{top[NAICS]} total was off by #{topest} for area #{top[AREA]} in #{top[YEAR]}" if topest < WARN_THRESHOLD
  
  if topest > 0
    top.delete_at(ESTABLISHMENTS)
    topest.times do |i| 
      STDOUT.puts(top.join("\t")) if rand < SAMPLE
    end
  end
end

id = 0
ARGF.each do |line|
  id += 1
  
  # we care about all the fields except survey prefix & datatype  
  fields = line.unpack('@3a5xa1a1a6a4a2@371a1a8a9a15a15a13a8a9').each { |f| f.strip! }
  fieldsest = fields[ESTABLISHMENTS] = fields[ESTABLISHMENTS].to_i

  # skip to next record for BLS-only categories
  next if OMIT_NAICS.any? { |on| on.match fields[NAICS] }
  
  # when switching NAICS categories, empty the stack
  until stack.empty? || (fields[NAICS] =~ /^#{stack.last[NAICS]}/ && fields[OWNERSHIP] == stack.last[OWNERSHIP])
    regurgitate(stack)
  end
  
  # as each subcategory is encountered, subtract it from the cumulative total on the stack
  stack.last[ESTABLISHMENTS] -= fields[ESTABLISHMENTS]  unless stack.empty?
  stack << fields
  
  STDERR.print '.' if id % 1000 == 0
end

# when done processing input, spit the rest out
regurgitate(stack) until stack.empty?

STDOUT.puts <<-SQL
\\.
SQL

STDERR.puts