# Purpose Generation

In purposes.seed you will find a demo purpose tree.
Using this syntax you can model you purpose tree. Unfortunately,
this syntax won't work for the model that is automatically generated
from the yaml file. For this purpose there is a purpose_generator.rb
file that you can use to generate the appropriate format.
Simply execute `$ ruby purpose_generator.rb` to generate the appropriate
file. If you encounter any errors, your schema is most likely corrupt.

Things to note:
- every purpose needs the following attributes
  - name: a descriptive, identifying name (unique!)
  - children: embedded child purposes (optional)
- node names are ignored, only the name attribute is used
