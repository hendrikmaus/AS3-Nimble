#Nimble Layout Class

##Description
Nimble is a very simple class, built to achieve fluid layouts in Flash applications real quick.
It was created for http://diploma.aidentailor.net during my flash-as3-hype-time ;)

##How to use:
Create an object to hold any of the following parameters and pass that object to the Nimble class constructor.

```
- alignment: (string) "TOP_LEFT","TOP","TOP_RIGHT","LEFT","MIDDLE","RIGHT","BOTTOM_LEFT","BOTTOM","BOTTOM_RIGHT"
					  default: "MIDDLE"
					
- margin: 	 (number) default: 0
```

##Example:

```actionscript
new Nimble(displayObject, {alignment: "TOP_LEFT", margin: 20});
```

For another example see the attached project.
