# A quick documentation on SCSS and Fonts
**SCSS : Syntactically Awesome Style Sheet** is the superset of CSS. SCSS is the more advanced version of CSS. SCSS was designed by Hampton Catlin and was developed by Chris Eppstein and Natalie Weizenbaum. Due to its advanced features it is often termed as Sassy CSS. SCSS have file extension of .scss.
## Advantage of SCSS over CSS
- **SCSS is more expressive** We can compress several lines of code in SASS syntax into much less number of lines of SCSS. In SCSS, the standard lines can also be compressed when I’m doing something complicated and can be expanded again for reference.
- **It encourages proper nesting of rules** If you use the comma operator at a high level, it increases the file size of the final CSS. This can result in making the code really hard to perform overriding of rules.
- **SCSS allows the user to write better inline documentation** SASS is flexible with comments, but any good developer will prefer inline documentation which is available in SCSS. Inline documentation makes the lines of code self explanatory.
- **Integrating existing CSS tools and CSS codebase is much easier** Syntax highlighting widely used CSS tool and is supported in SCSS. SCSS allows you use the existing code, and help improve its internal structure without altering the external behavior of the code. <br/>
Additionally, SCSS allows us to declare and define variables, which finally helps us to normalize the code and reduce the redundancy. For example, <br/>
  - Instead of repeating #ff0000 many times in your CSS file, in SCSS, we can just set $red: #ff0000 once and use it as many times as we want.
  - SCSS also supports the use of custom functions which accept parameters and are used to prevent unused repetitions.These functions are known as mixins.
  - We can also inherit the properties of one selector into other selector by making use of extensions.
  - SCSS allows us to do math using operators. We can perform simple calculations inside our code for better output.

## Differences between CSS and SCSS
- SCSS contains all the features of CSS and contains more features that are not present in CSS which makes it a good choice for developers to use it.
- SCSS is full of advanced features.
- SCSS offers variables, you can shorten your code by using variables. It is a great advantage over conventional CSS. 

## Convert SCSS to CSS
- Use online compilers or VSCode Live Sass Compiler extension!

## Adding external fonts
- Specify font file in the url function.
```css
 @font-face {
  font-family: myFont;
  src: url("font.woff");
}
a {
  font-family: myFont;
}
```