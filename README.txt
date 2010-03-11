Nimble Layout Framework v0.2
----------------------------

Author 		Aiden Tailor
Twitter 	@aidentailor
Mail 		aidentailor@googlemail.com
Web			aidentailor.net
Blog		blog.aidentailor.net


MIT License
-----------

Copyright (c) 2010 Aiden Tailor
Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.


Description
-----------
Nimble is built to achieve fluid layouts in Flash applications real quick.


How to use:
-----------	

Create an object to hold any of the following parameters and pass that object to the Nimble class constructor.

- alignment: (string) "TOP_LEFT","TOP","TOP_RIGHT","LEFT","MIDDLE","RIGHT","BOTTOM_LEFT","BOTTOM","BOTTOM_RIGHT"
					  default: "MIDDLE"
					
- margin: 	 (number) default: 0


Example:
--------

new Nimble(displayObject, {alignment: "TOP_LEFT", margin: 20});

For another example see the attached project.