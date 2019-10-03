# ^i think # ^ reffers to the beggining of a line
# morning$ # $ reffers to the end of the line
# [Bb][Uu][Ss][Hh] # brackets indicate which character should be mached so in this example BuSh and BUSH and bUsH woul match
# ^[Ii] am # you can combine: star of the line begins either with I or i and then am
# ^[0-9][a-zA-Z] # you can specify ranges
# [^?.]$ # ^ also negates meaning not ? or . in this example