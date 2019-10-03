# . is any character
9.11 # 9k11 9011

# | is a or character
flood|fire # gives strings where either flood or fire is present
flood|earthquake|hurricane|coldfire # more also possible
^[Gg]ood|[Bb]ad # not just literals but also real expresions, here ^reffers only to the "good" part, bad ban bea anywhere in the text
^([Gg]ood|[Bb]ad) # now for both starting at the start of the sentance

# The question mark ? indicates that the indicated expression is optional
[Gg]eorge( [Ww]\.)? [Bb]ush # will match "George W. Bush" and "george bush"
# To specify metacharacter true form we use the escape character \
#\.

# The * and + signs are metacharacters used to indicate repetition; * means “any number, including none, of the item” and + means “at least one of the item”
(.*) # looks for any character repeated any number of times between paranthesis
[0-9]+ (.*)[0-9]+ # will match for at least one number, followed by space and anthing number of characters and space and at least one number
^s(.*)s # will take maximum number of characters between s and s
                
# curly brackets let us specify the minimum and maximum number of matches of an expression
[Bb]ush( +[^ ]+ +){1,5} debate # bush followed by at least one space, then at least one not space, and at least one space (1-5 times) and debate
#m,n means at least m but not more than n matches
#m means exactly m matches
#m, means at least m matches

# remember \
+([a-zA-Z]+) +\1 + # \1 refferes to what the reg expression was 
        
        