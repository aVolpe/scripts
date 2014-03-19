#!/usr/bin/env ruby
# encoding: utf-8

impact = Hash.new(0)

#$FOLDERS = Array["conf", "idp", "saf", "sas", "sigh", "soc", "conf/base" ]
$FOLDERS = Array["metaconfiguracion", "metapersona", "metafarmacia", "metastock", "metaasistencial", "metasocial", "metastock/base", "metasec", "sigh" ]
#$BASE_DIR = "/home/arturo/develop/facultad/stable"
$BASE_DIR = Dir.pwd
total = 0;
totalS = "Total"
char_per_line = 51
def get_name(name) 
	if name.strip! == "Arturo Volpe" then
		return "Arturo Volpe Torres"
	end
	if name.start_with? "Jorge" then
		return "Jorge Ramírez"
	end
	if name == "ovianconi" then
		return "Osmar Vianconi"
	end
	name
end

$FOLDERS.each{ |folder| 
	tmp = $BASE_DIR + "/" + folder
	Dir.chdir(tmp)

	current = Hash.new(0)
	current_total = 0
	IO.popen("git log --pretty=format:\"%an\" --shortstat #{ARGV.join(' ')}") do |f|
	  prev_line = ''
	  while line = f.gets
	    changes = /(\d+) insertions.*((\d+) deletions)?/.match(line)

	    if changes
	    	add = changes[1].to_i
	    	minus = 0
	    	if changes[2] 
	    		minus = changes[2].to_i
	    	end
	    	changes_commit = add + minus
			impact[prev_line] += changes_commit
			current[prev_line] += changes_commit
			total += changes_commit
			current_total += changes_commit
	    end

	    prev_line = get_name(line) # Nombres en la primera linea

	  end
	end
	puts "".ljust(char_per_line, "-")
	puts "Folder: #{folder}".ljust(char_per_line, "-")
	puts "".ljust(char_per_line, "-")
	current.sort_by { |a,i| -i }.each { |author, impactado|
		porcentaje = impactado * 100 / current_total
  		puts "#{author.strip.ljust(30)}: #{impactado.to_s.rjust(10)} L (#{porcentaje.to_s.rjust(3)}%)"
	}
	puts "#{totalS.ljust(30)}: #{current_total.to_s.rjust(10)} L (100%)"
	puts "".ljust(char_per_line, "-")
}
puts
puts "".ljust(char_per_line, "-")
puts "Summary".ljust(char_per_line, "-")
puts "".ljust(char_per_line, "-")

impact.sort_by { |a,i| -i }.each { |author, impactado|
	porcentaje = impactado * 100 / total
	puts "#{author.strip.ljust(30)}: #{impactado.to_s.rjust(10)} L (#{porcentaje.to_s.rjust(3)}%)"

}

puts "#{totalS.ljust(30)}: #{total.to_s.rjust(10)} L (100%)"
puts "".ljust(char_per_line, "-")


