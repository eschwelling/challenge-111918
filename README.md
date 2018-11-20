### README

#### Getting Started
1. From the command line, please enter the following to run the program:

`ruby challenge.rb`

2. Enter search terms to return any nodes that match the criteria

#### Notes

This program is written in ruby version 2.4.5. The program utilizes a recursive function to traverse the JSON in order to locate the nodes that contain the search terms. The returned results also include a count of matched nodes. Compound Selectors and Selector Chains are supported. I accessed the JSON using the ruby gem HTTParty and parsed the JSON utilizing the built-in ruby JSON module.

###### Sample return:

`{"results":[{"class":"CvarCheckbox","var":"r_allow_high_dpi"},{"class":"CvarCheckbox","var":"s_reverse"},{"class":"CvarCheckbox","var":"cl_download_maps"},{"class":"CvarCheckbox","var":"cl_download_models"},{"class":"CvarCheckbox","var":"cl_draw_net_graph"}],"count":5}`
