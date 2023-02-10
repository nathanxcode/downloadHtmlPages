require "http"
require "pathname"

system("cls") || system("clear")
puts "\n"
puts "\n"
puts "\n"
puts "==================================================="
puts "================Download html pages================"
puts "==================================================="
puts "\n"
puts "Current directory: #{Dir.pwd}"
puts "\n"
puts "\n"
puts "\n"

code = 0

while code != 200 || code != 1 || code != 301

    puts "URL(https://example.com): "
    url = gets.chomp.to_s
    if url == "exit"
        code = 1
        break
    end

    if url.include?("https://www.")
        url
    else
        url = "https://www.#{url}"
    end

    p url

    puts "Download path: (empty to current dir)"
   
    path = gets.chomp.to_s

    puts "File name: "
    file_name = gets.chomp.to_s

    res = HTTP.get(url)
    
    pass_code = [200, 301]
    if pass_code.include?(res.code)
        html = File.new("#{path}#{file_name}.html", 'w+')
        html << res
        puts "Pagina html baixada com sucesso!"
        break
    else
        puts "Url invalida"
    end

end

