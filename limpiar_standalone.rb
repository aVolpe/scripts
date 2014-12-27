#!/usr/bin/ruby
#
# Elimina todos los archivos deployados y los archivos temporales
# de varias instalaciones de JBOSS.
# USO:
# 	Modificar para incluir la ubicacion de las instalaciones y
#	los deploys que no se desean eliminar.
#	ruby ~/scripts/limpiar_standalone.rb

require 'fileutils'



$HOME_DIRECTORY = Array["/home/avolpe/develop/servidores/jboss-as-7.1.1.Final/standalone/deployments"]
$INTACTOS = Array["pos"]

$JBOSS_PROCESS_ID = `ps -eF | grep jboss | grep server | tr -s " " | cut -d " " -f2 | xargs kill -9`
puts "Servidor parado"


$HOME_DIRECTORY.each { | directory |
	puts "Cambiando directorio a #{directory}"
	puts "Eliminar archivos."
	puts "\tOmitiendo archivos que empiezan con #{$INTACTOS}"
	Dir.chdir(directory)
	Dir.foreach(directory) { | file | 
		if (file == "." || file == "..")
			next
		end
		match = false
		
		$INTACTOS.each { | intacto |
			if (file.match(/^#{intacto}/)) then
				match = true
			end
		}
		if (not match)
			if (File::directory?(file))
				FileUtils.rm_rf(file)
				puts "\t\tEliminando directorio: #{file}"
			else
				File.delete(file);
				puts "\t\tEliminando archivo: #{file}"
			end
		else
			puts "\t\tOmitiendo #{file}"
		end
	}

	tmp = Dir.pwd + "/../tmp"
	if (File::directory?(tmp))
		Dir.chdir(tmp)
		puts "Cambiando a #{Dir.pwd}"
		puts "Eliminando datos temporales"
		FileUtils.rm_rf(Dir.pwd)
	else
		puts "Temporales limpios"
	end

}


