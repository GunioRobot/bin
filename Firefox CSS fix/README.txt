Firefox has some issues with dark themes,
so if you have problems with web forms and controls became unreadable when using this theme try this fix.

The path where firefox store its files vary on different linux distributions.
Try "/usr/lib/firefox/res/" or "/opt/mozilla/lib/firefox/res/".

Do the following steps in a terminal:

1. Backup your original form.css file:
sudo mv /usr/lib/firefox/res/forms.css /usr/lib/firefox/res/forms_backup.css

2. Replace it with the provided forms.css
sudo mv ~/.themes/"themeofyourchoice"/forms.css /usr/lib/firefox/res/forms.css

3. Then you need to edit html.css:
sudo gedit /usr/lib/firefox/res/html.css

Around line 60, change:

body {
  display: block;
  margin: 8px;
}

To:

body {
  background-color: white;
  color: black;
  display: block;
  margin: 8px;
}

Save the file, then restart Firefox, and you should have standard colours.

