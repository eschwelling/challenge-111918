require 'httparty'
require 'rubygems'
require 'pry'
require 'json'

raw_json = HTTParty.get("https://raw.githubusercontent.com/jdolan/quetoo/master/src/cgame/default/ui/settings/SystemViewController.json")

parsed_json = JSON.parse(raw_json)

puts "Please enter your search term:" + "\n" + ">>"

@input = gets.chomp
@matches = []
@input_selector_type = "class"
@view_name = ""
@additional_selector = ""
@input_arr = []

if @input[0] == "#"
  @input = @input[1..-1]
  @input_selector_type = "identifier"
end

if @input[0] == "."
  @input = @input[1..-1]
  @input_selector_type = "classNames"
end

if @input[0] != "." && @input.include?(".")
  @input_arr = @input.split(" .")
  @view_name = @input_arr[0]
  @additional_selector = @input_arr[1]
end

if @input[0] != "." && @input.include?("#")
  @input_arr = @input.split("#")
  @view_name = @input_arr[0]
  @additional_selector = @input_arr[1]
end


def search_node(node)
  if node.include?(@input_selector_type)
    if node[@input_selector_type] == @view_name && node["control"]["class"] == @additional_selector
      @matches << node

    elsif node[@input_selector_type] == @view_name && node["control"]["identifier"] == @additional_selector
      @matches << node

    elsif node[@input_selector_type] == @input || node[@input_selector_type].include?(@input)
      @matches << node
    end
  end

  if node.include?("contentView")
    search_node(node["contentView"])
  end

  if node.include?("control")
    search_node(node["control"])
  end

  if node.include?("subviews")
    node["subviews"].each do |subview_node|
      search_node(subview_node)
    end
  end
end

search_node(parsed_json)

@output = {results: @matches, count: @matches.length}

puts @output.to_json
