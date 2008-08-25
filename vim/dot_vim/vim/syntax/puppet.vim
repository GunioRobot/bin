<!DOCTYPE html
    PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
 <title>/trunk/ext/vim/puppet.vim - puppet - Trac</title><link rel="start" href="/trac/puppet/wiki" /><link rel="search" href="/trac/puppet/search" /><link rel="help" href="/trac/puppet/wiki/TracGuide" /><link rel="stylesheet" href="/tracdocs/css/trac.css" type="text/css" /><link rel="stylesheet" href="/tracdocs/css/code.css" type="text/css" /><link rel="stylesheet" href="/tracdocs/css/browser.css" type="text/css" /><link rel="icon" href="https://reductivelabs.com/favicon.ico" type="image/x-icon" /><link rel="shortcut icon" href="https://reductivelabs.com/favicon.ico" type="image/x-icon" /><link rel="up" href="/trac/puppet/browser/trunk/ext/vim" title="Parent directory" /><link rel="alternate" href="/trac/puppet/browser/trunk/ext/vim/puppet.vim?format=raw" title="Original Format" type="text/plain" /><style type="text/css">/* --------------------------------------------------------------------------------
	Black Value: #000;
	White Value; #fff;
	Body Copy Color: #320;
	Reductive Labs Plum: #717;
	Reductive Labs Amber: #DA3;
	Reductive Labs Burnt Amber: #850;
	Pale Yellow Accent: #fbf7c9;
   -------------------------------------------------------------------------------- */


/* --------------------------------------------------------------------------------
	Globals
   -------------------------------------------------------------------------------- */
* {margin: 0; padding: 0;}
body {font: 0.8125em Helvetica, Arial, sans-serif; 
			line-height: 1; 
			color: #000;
			margin: 0; 
			padding: 0;}
a {text-decoration: none;}
a img {border: none;}

ul, ol { list-style: none; }

#masthead a, 
	#navbar a, 
	#banners a, 
	a.button, 
	#main h1 a, 
	.title a:link, 
	.title a:visited, 
	.byline a:link, 
	.byline a:visited {border-bottom-width: 0;}
	
#main h1 a:hover, 
	.title a:hover, 
	.byline a:hover {border-bottom-width: 1px;}


h1 {margin: 0; padding: 0;}

div {margin: 0; padding: 0;}
h1 {font: bold 18pt Helvetica, Arial, sans-serif; 
			text-align: left; 
			color: #000; }
h2 { font: 1.7em Helvetica, Arial, sans-serif; 
			text-align: center; 
			color: #000;
			background: none;}
h2 a {color: #000;}
h2 a:hover {color: #000;}
h2 em {font-style: normal;}
h3 {font: 1.3em Helvetica, Arial, sans-serif; 
			color: #000; 
			padding-bottom: 3em; 
			text-align: left;}
h4 {font: bold 1.0em Helvetica, Arial, sans-serif; color: #717; text-transform: uppercase;}
h5 {font: bold 0.7em Helvetica, Arial, sans-serif; color: #000;}

blockquote, pre {padding: 0.25em 40px;}

pre, code {font: 1.05em Courier, monospace;}
pre {line-height: 1.5em;}
pre strong {font-size: 1em; font-weight: bold;}
pre code {font-size: 1em; line-height: 1.5em;}

caption {padding: 0.75em; font: 1.5em Helvetica, Arial, sans-serif;
			border: 1px solid #B2B2B2; border-width: 1px 0 2px;
			background: #EEE;}

th {
	background: #fbf7c9;
}
td {
	padding: 10px;
}

/* --------------------------------------------------------------------------------
	Masthead / Logo
   -------------------------------------------------------------------------------- */

#masthead { position: absolute;
			z-index: 11; 
			top: 0px; 
			left: 28px;
			padding-top: 10px;
		}
#masthead img {
			background: transparent; 
			position: absolute;
			top: 0px;}
			
#masthead a:hover {background: #000; }

#masthead.raised { top: -165px; }
#masthead.raised:hover { top: -165px; }


.column {float: left;}

/* --------------------------------------------------------------------------------
   Top Navigation
   -------------------------------------------------------------------------------- */

#navbar { 		z-index: 2;
			padding: 2px 0 0 210px;
			background: transparent url(http://puppet.reductivelabs.com/images/top-background-amber.png) 0px 0px repeat-x;
			overflow: hidden;
			position: relative
			display: block;
			clear: both;
			font: 16px Helvetica, Arial, sans-serif; }
			
#navbar ul {text-align: center;
			width: 100%; }
			
#navbar li {float: left;
			padding: 0px 15px 0px 15px;}
							
#navbar li a {display: block; 
			padding: 9px 7px 11px 7px;			
			background: none; 
			color: #960;
			}
	
#navbar #feed {background: none;}
#navbar a:hover,
	.start #navbar #start a,
	.about #navbar #about a,
	.support #navbar #support a,
	.download #navbar #download a,
	.feed #navbar #feed a {
			color: #000;
			padding: 9px 7px 10px 7px;		
			background: #fff url(http://puppet.reductivelabs.com/images/top-background-white.gif) 0px -4px repeat-x;
			}

#navbar li a.selected {
			color: #000;
			padding: 9px 7px 10px 7px;
			background: #fff url(http://puppet.reductivelabs.com/images/top-background-white.gif) 0px -4px repeat-x;
			}
	


/* --------------------------------------------------------------------------------
   Main Body Content
   -------------------------------------------------------------------------------- */

#bd { padding: 0 10% 0 10%; }
#main {
	padding-left: 220px;
}

#content {		background: transparent;
	 		float: none;
			position: relative;
			display: inline;
}


#content a:link, 
#content a:visited {
			text-decoration: none;
			color: #717; 
			border-bottom: 1px solid #DA3;}

#content a:hover {
			text-decoration: none;
			color: #DA3;
			border-bottom: 1px solid #717; }
			
#content h1 {margin: .75em 0 0 0;
			border: thin solid white;
}
#content h2 {margin: 1em 0 .5em 0;}
#content h3 {margin: .5em 0 .5em 0;
		padding: .7em 0 0 0; }
#content h4 {margin: 1.5em 0 .5em 0;}
#content p {margin: .5em 0 1em 0;
	line-height: 1.25em; }

#content hr {margin: 1.5em 0 1.5em 0px;}
			
#content blockquote { margin: 2em 4em 1em 2em;
			font: italic 1.05em Helvetica, Arial, sans-serif;
			background: transparent url(http://puppet.reductivelabs.com/images/quote_wh.gif) 15px -1px no-repeat;}
			
#content .title {font: 1.8em;  margin-bottom: 0.5em;}

#content li { margin-bottom: 0px;
			border: none;
			padding-left: 25px;
			padding-top: 2px;
			padding-bottom: 2px;
			line-height: 1.25em;
			background: transparent url(http://puppet.reductivelabs.com/images/diamond-gray.gif) 15px 5px no-repeat;}
			
#content img {
			border-top: thin solid #ddd;
			border-left: thin solid #ddd;			
			border-right: thin solid #444;
			border-bottom: thin solid #444;
			float: right;
}
#content img.float.left {
			margin: 15px 15px 15px 0px;	
			float: left;
}

#content img.float.right {
			margin: 15px 0px 15px 15px;	
			float: right;
}

/* --------------------------------------------------------------------------------
   Right Side Navigation
   -------------------------------------------------------------------------------- */

#sidebar { 		float: none;
			z-index: 3;
			width: 12%; 
			padding-left: 5px;
			padding-right: 10px;
			padding-bottom: 50px;
			position: absolute;
			right: 0;
			top: 35px;
			background: #fbf7c9; }
			
#sidebar div { padding: 5px 0.5em; 
		background: #fbf7c9;}
#sidebar div.first { padding-top: 0; }
#sidebar li {   padding: 1px 0 3px 22px;
		font: .9em Helvetica, Arial, sans-serif;
		background: url(http://puppet.reductivelabs.com/images/diamond-gray.gif) 15px .33em no-repeat;}

#sidebar li a:link, 
	#sidebar li a:visited { color: #AA6E03; }

#sidebar li a:hover { color: #717;}
			
#sidebar h1 { font: italic bold .9em Helvetica, Arial, sans-serif; 
			color: #000; 
			border-bottom: 1px solid #DA3; 
			padding-bottom: 23px; 
			padding-top: 23px; 
			text-transform: uppercase;  
			letter-spacing: 2; 
			text-align: center;}
	
#sidebar h3 { font: bold .9em Helvetica, Arial, sans-serif; 
			text-transform: uppercase; 
			color: #717; 
			padding-bottom: 4px;}

#topiclist { border: 0px; font: 1em Helvetica, Arial, sans-serif;}
#topiclist a {border: 0px; font: 1em Helvetica, Arial, sans-serif;}

#partners p { text-align: center; 
			border-top: 1px solid #DA3;
			padding-top: 25px;}
#partners a { border-bottom: 0px;}
/* --------------------------------------------------------------------------------
   Brand Bug
   -------------------------------------------------------------------------------- */

#brandbug { 		background: transparent;
			position: absolute;
			top: 250px; 
			left: 55px;
			}
			
/* --------------------------------------------------------------------------------
   Footer
   -------------------------------------------------------------------------------- */
#foot { clear: both;
			display: inline;
			width: 100%;
			float: left;
			position: relative;
			background: transparent url(http://puppet.reductivelabs.com/images/bottom-background-amber.gif) 0px -3px repeat-x;
			padding: none;
			margin: none;
			display: block;
			bottom: 0px;
			}
		
#foot a {	font: 10pt Helvetica, Arial, sans-serif;
			color: #850;
			padding: none;
			margin: none;
			border: none;}

#foot a:hover { color: #fee; 
			background: none;
			padding: none;
			margin: none;
			border:none; }

#foot p {	font: 10pt Helvetica, Arial, sans-serif; 
			padding: 9px 5px 13px 180px;
			letter-spacing: 2px;
			}

/* --------------------------------------------------------------------------------
			Special stuff added EXCLUSIVELY for TRAC
   -------------------------------------------------------------------------------- */

#mainnav {
				z-index: 8;
				padding: none;
				position: absolute;
				left: 0px;
				right: 0px;
				top: 23px;
				border: none;
				color: #fee;
				width: 100%;
				background: transparent url(http://puppet.reductivelabs.com/images/black-gradient.png) 0px 0px repeat-x;
				}
#mainnav li {
				background: url(http://puppet.reductivelabs.com/images/black-gradient.png) 0px -2px repeat-x;
				}

#mainnav :link {
				color: #ddd;
				font: 10pt Helvetica, Arial, sans-serif; 
				}
#mainnav :visited {
				color: #ddd;
				font: 10pt Helvetica, Arial, sans-serif; 
				}

#mainnav a:hover {
				color: #fff;
				font: 10pt Helvetica, Arial, sans-serif; 
				background: #000 url(http://puppet.reductivelabs.com/images/chrome-gradient.png) 0px 0px repeat-x;
				}

#mainnav.nav {
				color: #fee;
				font: 10pt Helvetica, Arial, sans-serif;
				}

#mainnav a {
				color: #fee;
				font: 10pt Helvetica, Arial, sans-serif; 
				}

#ctxtnav {
				z-index: 8;
				font: 13pt Helvetica, Arial, sans-serif;
				position: absolute;
				right: 0px;
				left: 185px;
				top: 50px;
				padding: 3px 0px 4px 0px;
				background: transparent url(http://puppet.reductivelabs.com/images/short-background-amber-dark.png) 0px -2px repeat-x;
				color: #777;	
				border: none;
				}

#ctxtnav ul {
				text-align: left;
				border: none;
				}

#metanav {
				color: #777;	
				font: 13pt Helvetica, Arial, sans-serif;
				z-index: 9;
				position: absolute;
				right: 0px;
				top: 54px;
				background: none;
				border: none;
				top-padding: 2px;
				}

#ctxtnav li {
				color: #000;			
				}
				
#metanav :link,
#ctxtnav :link {
				color: #eef;
				text-decoration: none;
				border: none;
				background: none;
				}

#metanav :visited,
#ctxtnav :visited {
				color: #DA3;
				text-decoration: none;
				border: none;
				background: none;
				}

#metanav a:hover,
#ctxtnav a:hover {
				color: #000;
				text-decoration: none;
				border: none;
				background: none;
				}

#foot p
{
				border: none;
				font: 8pt Helvetica, Arial, sans-serif;
				color: #000;
				}

#foot p.left a {
				font: 7pt Helvetica, Arial, sans-serif;
				color: #717;
				}

#foot p.right a {
				font: 7pt Helvetica, Arial, sans-serif;
				color: #717;
				}

#foot p.left {
				float: left;
				margin-left: 1em;
				padding: 5px 1em;
				border: none;
				font: 7pt Helvetica, Arial, sans-serif;
				}

#foot p.right {
				float: right;
				margin-left: 1em;
				padding: 5px 1em;
				border: none;
				font: 7pt Helvetica, Arial, sans-serif;
				}

#info { background: #000;}

#content tr { border: none; }
#content tr.odd { background: #fff; }
#content tr td.report { text-align: center; }
#content tr.even { background: #fbf7c9; }

#content em { color: #850; 
			border-bottom: none; }
#content h2 { background: none; 
			  text-align: left;}
#content div.roadmap li { background: none; }

#content dl dt.wiki { 		padding-right: 0px;
				margin-right: 0px;
				border-bottom: none; }

li.roadmap { background: none; }

div.wiki { padding: 0 0 0 0;
				width: auto;
				font: 10pt Helvetica, Arial, sans-serif; }
div.timeline {
		padding: 0 0 0 0;
		font: 10pt Helvetica, Arial, sans-serif;}
div.roadmap { padding: 0 0 0 0; 
				font: 10pt Helvetica, Arial, sans-serif; }
div.report { padding: 0 0 0 0; 
				font: 10pt Helvetica, Arial, sans-serif;}
div.search { padding: 0 0 0 0; 
				font: 10pt Helvetica, Arial, sans-serif;}
div.ticket { padding: 0 0 0 0; 
				font: 10pt Helvetica, Arial, sans-serif;}
div.query {  padding: 0 0 0 0; 
				font: 10pt Helvetica, Arial, sans-serif;}

div.settings { padding: 0 0 0 0; 
				font: 10pt Helvetica, Arial, sans-serif;}
div.about { padding: 0 0 0 0; 
				font: 10pt Helvetica, Arial, sans-serif; }
div.milestone { padding: 0 0 0 0;
				font: 10pt Helvetica, Arial, sans-serif; }
div.report { padding: 0px 0px 0px 0px; 
				margin: 0px 0px 0px 0px;
				font: 10pt Helvetica, Arial, sans-serif; }
div.help { padding: 0px 0px 0px 0px; 
				font: 10pt Helvetica, Arial, sans-serif; }
div.changeset { padding: 0px 0px 0px 0px; 
				font: 10pt Helvetica, Arial, sans-serif; }
div.info { font: 10pt Helvetica, Arial, sans-serif; 	}

#altlinks {
			clear: both;
			background: #fbf7c9;
			border: thin solid black;
			display: inline;
			position: relative;
			width: 10%;
			text-align: center;
}
#altlinks h3 {
			padding-bottom: 10px;
			text-align: center;
}

#content table.listing {
				border: thick solid white;
				margin-right: 10px;
				margin-left: 10px;
}

#content table.listing.tickets {
				margin: 0px 0px 0px 0px;
}

table.listing thead th {
				font: 10pt Helvetica, Arial, sans-serif;
				border: none;
				font-size: 11px;
				color: #fff;
				padding: 2px .5em;
				vertical-align: bottom;
				background-color: #516;
				}
				
#content table.listing th a { font: 10pt Helvetica, Arial, sans-serif;
				border: none; 
				color: #fff; }

#content table.listing th { text-align: center; 
				margin: none;
				padding: none;}

#content table.listing td,
#content table.listing tr a { font: 10pt Helvetica, Arial, sans-serif;
	 			border: none; }

#content dt a:link, 
#content dt a:visited {	border: none; }

#content dt a:hover { border: none; }
#mainnav .active :link, #mainnav .active :visited {
				background: #fff url(http://puppet.reductivelabs.com/images/top-background-white.gif) 0px -5px repeat-x;
				border-top: none;
				top-padding: 1px;
				border-right: 1px solid #000;
				color: #000;
				text-decoration: none;
				}

#content ul.milestones li.milestone { background-color: #f00; 
				background: url(http://puppet.reductivelabs.com/images/diamond-black.gif) 16px 33px no-repeat;
				text-align: left;}

#content ul.milestones li:hover {
				background: url(http://puppet.reductivelabs.com/images/diamond-gray.gif) 16px 33px no-repeat;
				}

#content div.info {
				padding: none;
				margin: none;
				}

#content div.wiki-toc {
				font: 8pt Helvetica, Arial, sans-serif;
				padding-left: 0px;
				padding-right: 0px;
				padding-bottom: 50px;
				position: absolute;
				left: -202px;
				top: -25px;
				width: 154px;
				background: #fbf7c9;
				}
#content div.tabcontents {	position: relative;
				left: -202px;
				
}
				
#content div.tabs {
				font: 8pt Helvetica, Arial, sans-serif;
				padding-left: 0px;
				padding-right: 0px;
				padding-bottom: 50px;
				position: absolute;
				left: -202px;
				top: -25px;
				width: 154px;
				background: #fbf7c9;
				}


#content div.wiki-toc h4 {
				font: bold 8pt Helvetica, Arial, sans-serif;
				}
#content div.wiki-toc h2 {
				display: none;
				font: 6pt Helvetica, Arial, sans-serif;
				text-align: center;
				}
#content div.wiki-toc li {
				background: none;
				}
#content div.date {
				background: #fbf7c9;
				font: 9pt Helvetica, Arial, sans-serif;
}

#content pre.wiki {
				font: 9pt Courier, fixed;
				margin-right: 40px;
				background: #fbf7c9;
				}
#prefs,
#ticket,
#ticket .description,
#changelog,
#changelog .change,
#changelog .comment,
#prefs div {			position: static;
				left: -100px;
				background: #fbf7c9;
}
#addaccount  {			position: relative;
				left: 230px;
				top: -35px;
				clear: both;
				background: #fbf7c9;
}

#content li.entry,
#changelog li {
				padding-left: 0px;
				background: none;
}
#changelog em {
				color: #717;
}
#overview dt.property {
				padding: 0px 0px 0px 220px;
				
}
#content {
				width: 75%;
				margin-right: 0px;
				padding-right: 0px;
}
#content.column {
				float: left;
				width: 60%;
				padding-left: 220px;
				margin-right: 0px;
				padding-right: 0px;
}
#content ul.tags {
				padding-top: 50px;
				padding-left: 220px;
}

#content dl.docutils { padding-bottom: 15px; }

#footer { display: none; }

div.section h1 #info { background-color: #fff;
			border-top: none;
			border-left: none;
			border-right: none; }</style>
 <script type="text/javascript" src="/tracdocs/js/trac.js"></script>
</head>
<body>

<script src="http://www.google-analytics.com/urchin.js" type="text/javascript">
</script>
<script type="text/javascript">
_uacct = "UA-1537572-1";
urchinTracker();
</script>
<ul id="navbar">
<li id="about">  
<a href="http://puppet.reductivelabs.com/" title="About Puppet">About Puppet</a></li><li id="start">  
<a href="https:/reductivelabs.com/trac/puppet/wiki/SimplestPuppetInstallRecipe" title="Get Started">Get Started</a></li><li id="download">  
<a href="http://puppet.reductivelabs.com/download.php" title="Downloads">Downloads</a></li><li id="support">  
<a href="http://puppet.reductivelabs.com/support.php" title="Support">Support</a></li><li id="docs">  
<a class="selected" title ="Documentation">Documentation</a>
</li></ul>
<h1 id="masthead" class="raised">

<a href="/"><img src="http://puppet.reductivelabs.com/images/puppet.png" alt="Puppet: System Administration Automated" /></a>
</h1>

<div id="banner">

<div id="header"><a id="logo" href="https://reductivelabs.com/trac/puppet"><img src="/images/top-background-white.gif" width="236" height="73" alt="Reductive Labs" /></a><hr /></div>

<form id="search" action="/trac/puppet/search" method="get">
 <div>
  <label for="proj-search">Search:</label>
  <input type="text" id="proj-search" name="q" size="10" accesskey="f" value="" />
  <input type="submit" value="Search" />
  <input type="hidden" name="wiki" value="on" />
  <input type="hidden" name="changeset" value="on" />
  <input type="hidden" name="ticket" value="on" />
 </div>
</form>



<div id="metanav" class="nav"><ul><li class="first"><a href="/trac/puppet/login">Login</a></li><li><a href="/trac/puppet/settings">Settings</a></li><li><a accesskey="6" href="/trac/puppet/wiki/TracGuide">Help/Guide</a></li><li><a href="/trac/puppet/notification">My Notifications</a></li><li class="last"><a href="/trac/puppet/register">Register</a></li></ul></div>
</div>

<div id="mainnav" class="nav"><ul><li class="first"><a accesskey="1" href="/trac/puppet/wiki">Wiki</a></li><li><a accesskey="2" href="/trac/puppet/timeline">Timeline</a></li><li class="active"><a href="/trac/puppet/browser">Browse Source</a></li><li><a href="/trac/puppet/wiki/Reports">Tickets</a></li><li><a href="/trac/puppet/simpleticket">New Ticket</a></li><li><a accesskey="4" href="/trac/puppet/search">Search</a></li><li class="last"><a href="/trac/puppet/tags" accesskey="T">Tags</a></li></ul></div>
<div id="main">




<div id="ctxtnav" class="nav">
 <ul>
  <li class="first"><a href="/trac/puppet/changeset/1884/trunk/ext/vim/puppet.vim">
   Last Change</a></li>
  <li class="last"><a href="/trac/puppet/log/trunk/ext/vim/puppet.vim">
   Revision Log</a></li>
 </ul>
</div>


<div id="searchable">
<div id="content" class="browser">
 <h1><a class="first" title="Go to root directory" href="/trac/puppet/browser">root</a><span class="sep">/</span><a title="View trunk" href="/trac/puppet/browser/trunk">trunk</a><span class="sep">/</span><a title="View ext" href="/trac/puppet/browser/trunk/ext">ext</a><span class="sep">/</span><a title="View vim" href="/trac/puppet/browser/trunk/ext/vim">vim</a><span class="sep">/</span><a title="View puppet.vim" href="/trac/puppet/browser/trunk/ext/vim/puppet.vim">puppet.vim</a></h1>

 <div id="jumprev">
  <form action="" method="get">
   <div>
    <label for="rev">View revision:</label>
    <input type="text" id="rev" name="rev" value="" size="4" />
   </div>
  </form>
 </div>

 

 
  <table id="info" summary="Revision info"><tr>
    <th scope="col">
     Revision <a href="/trac/puppet/changeset/1884">1884</a>, 3.4 kB
     (checked in by luke, 6 months ago)
    </th></tr><tr>
    <td class="message"><p>
updating syntax matcher to highlight dollar signs in prototypes <br />
</p>
</td>
   </tr><tr>
    <td colspan="2"><ul class="props">
      <li>Property <strong>svn:keywords</strong> set to <em><code>Author URL Id Date Rev</code></em></li>
    </ul></td></tr>
  </table>
  <div id="preview"><table class="code"><thead><tr><th class="lineno">Line</th><th class="content">&nbsp;</th></tr></thead><tbody><tr><th id="L1"><a href="#L1">1</a></th>
<td>&#34; puppet syntax file</td>
</tr><tr><th id="L2"><a href="#L2">2</a></th>
<td>&#34; Filename:&nbsp; &nbsp; &nbsp;puppet.vim</td>
</tr><tr><th id="L3"><a href="#L3">3</a></th>
<td>&#34; Language:&nbsp; &nbsp; &nbsp;puppet configuration file </td>
</tr><tr><th id="L4"><a href="#L4">4</a></th>
<td>&#34; Maintainer:&nbsp; &nbsp;Luke Kanies &lt;luke@madstop.com&gt;</td>
</tr><tr><th id="L5"><a href="#L5">5</a></th>
<td>&#34; URL:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </td>
</tr><tr><th id="L6"><a href="#L6">6</a></th>
<td>&#34; Last Change: </td>
</tr><tr><th id="L7"><a href="#L7">7</a></th>
<td>&#34; Version:&nbsp; &nbsp; &nbsp; </td>
</tr><tr><th id="L8"><a href="#L8">8</a></th>
<td>&#34;</td>
</tr><tr><th id="L9"><a href="#L9">9</a></th>
<td></td>
</tr><tr><th id="L10"><a href="#L10">10</a></th>
<td>&#34; Copied from the cfengine, ruby, and perl syntax files</td>
</tr><tr><th id="L11"><a href="#L11">11</a></th>
<td>&#34; For version 5.x: Clear all syntax items</td>
</tr><tr><th id="L12"><a href="#L12">12</a></th>
<td>&#34; For version 6.x: Quit when a syntax file was already loaded</td>
</tr><tr><th id="L13"><a href="#L13">13</a></th>
<td>if version &lt; 600</td>
</tr><tr><th id="L14"><a href="#L14">14</a></th>
<td>&nbsp; syntax clear</td>
</tr><tr><th id="L15"><a href="#L15">15</a></th>
<td>elseif exists(&#34;b:current_syntax&#34;)</td>
</tr><tr><th id="L16"><a href="#L16">16</a></th>
<td>&nbsp; finish</td>
</tr><tr><th id="L17"><a href="#L17">17</a></th>
<td>endif</td>
</tr><tr><th id="L18"><a href="#L18">18</a></th>
<td></td>
</tr><tr><th id="L19"><a href="#L19">19</a></th>
<td>syn region&nbsp; puppetDefine&nbsp; &nbsp; &nbsp; &nbsp; start=&#34;^\s*\(class\|define\|site\|node\)&#34; end=&#34;{&#34; contains=puppetDefType,puppetDefName,puppetDefArguments</td>
</tr><tr><th id="L20"><a href="#L20">20</a></th>
<td>syn keyword puppetDefType&nbsp; &nbsp; &nbsp; &nbsp;class define site node inherits contained</td>
</tr><tr><th id="L21"><a href="#L21">21</a></th>
<td>syn keyword puppetInherits&nbsp; &nbsp; &nbsp; inherits contained</td>
</tr><tr><th id="L22"><a href="#L22">22</a></th>
<td>syn region&nbsp; puppetDefArguments&nbsp; start=&#34;(&#34; end=&#34;)&#34; contains=puppetArgument</td>
</tr><tr><th id="L23"><a href="#L23">23</a></th>
<td>syn match&nbsp; &nbsp;puppetArgument&nbsp; &nbsp; &nbsp; &#34;\w\+&#34; contained</td>
</tr><tr><th id="L24"><a href="#L24">24</a></th>
<td>syn match&nbsp; &nbsp;puppetArgument&nbsp; &nbsp; &nbsp; &#34;\$\w\+&#34; contained</td>
</tr><tr><th id="L25"><a href="#L25">25</a></th>
<td>syn match&nbsp; &nbsp;puppetArgument&nbsp; &nbsp; &nbsp; &#34;'[^']+'&#34; contained</td>
</tr><tr><th id="L26"><a href="#L26">26</a></th>
<td>syn match&nbsp; &nbsp;puppetArgument&nbsp; &nbsp; &nbsp; '&#34;[^&#34;]+&#34;' contained</td>
</tr><tr><th id="L27"><a href="#L27">27</a></th>
<td>syn match&nbsp; &nbsp;puppetDefName&nbsp; &nbsp; &nbsp;&#34;\w\+&#34; contained</td>
</tr><tr><th id="L28"><a href="#L28">28</a></th>
<td></td>
</tr><tr><th id="L29"><a href="#L29">29</a></th>
<td>syn match&nbsp; &nbsp;puppetInstance&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&#34;\w\+\s*{&#34; contains=puppetTypeBrace,puppetTypeName,puppetTypeDefault</td>
</tr><tr><th id="L30"><a href="#L30">30</a></th>
<td>syn match&nbsp; &nbsp;puppetTypeBrace&nbsp; &nbsp; &nbsp; &nbsp;&#34;{&#34; contained</td>
</tr><tr><th id="L31"><a href="#L31">31</a></th>
<td>syn match&nbsp; &nbsp;puppetTypeName&nbsp; &nbsp; &nbsp; &nbsp;&#34;[a-z]\w*&#34; contained</td>
</tr><tr><th id="L32"><a href="#L32">32</a></th>
<td>syn match&nbsp; &nbsp;puppetTypeDefault&nbsp; &nbsp; &#34;[A-Z]\w*&#34; contained</td>
</tr><tr><th id="L33"><a href="#L33">33</a></th>
<td></td>
</tr><tr><th id="L34"><a href="#L34">34</a></th>
<td>syn match&nbsp; &nbsp;puppetParam&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&#34;\w\+\s*=&gt;&#34; contains=puppetTypeRArrow,puppetParamName</td>
</tr><tr><th id="L35"><a href="#L35">35</a></th>
<td>syn match&nbsp; &nbsp;puppetParamRArrow&nbsp; &nbsp; &nbsp; &nbsp;&#34;=&gt;&#34; contained</td>
</tr><tr><th id="L36"><a href="#L36">36</a></th>
<td>syn match&nbsp; &nbsp;puppetParamName&nbsp; &nbsp; &nbsp; &nbsp;&#34;\w\+&#34; contained</td>
</tr><tr><th id="L37"><a href="#L37">37</a></th>
<td>syn match&nbsp; &nbsp;puppetVariable&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&#34;$\w\+&#34;</td>
</tr><tr><th id="L38"><a href="#L38">38</a></th>
<td>syn match&nbsp; &nbsp;puppetVariable&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&#34;${\w\+}&#34;</td>
</tr><tr><th id="L39"><a href="#L39">39</a></th>
<td>syn match&nbsp; &nbsp;puppetParen&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&#34;(&#34;</td>
</tr><tr><th id="L40"><a href="#L40">40</a></th>
<td>syn match&nbsp; &nbsp;puppetParen&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&#34;)&#34;</td>
</tr><tr><th id="L41"><a href="#L41">41</a></th>
<td>syn match&nbsp; &nbsp;puppetBrace&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&#34;{&#34;</td>
</tr><tr><th id="L42"><a href="#L42">42</a></th>
<td>syn match&nbsp; &nbsp;puppetBrace&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&#34;}&#34;</td>
</tr><tr><th id="L43"><a href="#L43">43</a></th>
<td></td>
</tr><tr><th id="L44"><a href="#L44">44</a></th>
<td>syn region&nbsp; puppetString start=+&#34;+ skip=+\\\\\|\\&#34;+ end=+&#34;+ contains=puppetVariable</td>
</tr><tr><th id="L45"><a href="#L45">45</a></th>
<td></td>
</tr><tr><th id="L46"><a href="#L46">46</a></th>
<td>syn keyword puppetBoolean&nbsp; &nbsp; true false </td>
</tr><tr><th id="L47"><a href="#L47">47</a></th>
<td>syn keyword puppetKeyword&nbsp; &nbsp; import inherits include</td>
</tr><tr><th id="L48"><a href="#L48">48</a></th>
<td>syn keyword puppetControl&nbsp; &nbsp; case default </td>
</tr><tr><th id="L49"><a href="#L49">49</a></th>
<td></td>
</tr><tr><th id="L50"><a href="#L50">50</a></th>
<td>&#34; comments last overriding everything else</td>
</tr><tr><th id="L51"><a href="#L51">51</a></th>
<td>syn match&nbsp; &nbsp;puppetComment&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#34;\s*#.*$&#34; contains=puppetTodo</td>
</tr><tr><th id="L52"><a href="#L52">52</a></th>
<td>syn keyword puppetTodo&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TODO NOTE FIXME XXX contained</td>
</tr><tr><th id="L53"><a href="#L53">53</a></th>
<td></td>
</tr><tr><th id="L54"><a href="#L54">54</a></th>
<td>&#34; Define the default highlighting.</td>
</tr><tr><th id="L55"><a href="#L55">55</a></th>
<td>&#34; For version 5.7 and earlier: only when not done already</td>
</tr><tr><th id="L56"><a href="#L56">56</a></th>
<td>&#34; For version 5.8 and later: only when an item doesn't have highlighting yet</td>
</tr><tr><th id="L57"><a href="#L57">57</a></th>
<td>if version &gt;= 508 || !exists(&#34;did_puppet_syn_inits&#34;)</td>
</tr><tr><th id="L58"><a href="#L58">58</a></th>
<td>&nbsp; if version &lt; 508</td>
</tr><tr><th id="L59"><a href="#L59">59</a></th>
<td>&nbsp; &nbsp; let did_puppet_syn_inits = 1</td>
</tr><tr><th id="L60"><a href="#L60">60</a></th>
<td>&nbsp; &nbsp; command -nargs=+ HiLink hi link &lt;args&gt;</td>
</tr><tr><th id="L61"><a href="#L61">61</a></th>
<td>&nbsp; else</td>
</tr><tr><th id="L62"><a href="#L62">62</a></th>
<td>&nbsp; &nbsp; command -nargs=+ HiLink hi def link &lt;args&gt;</td>
</tr><tr><th id="L63"><a href="#L63">63</a></th>
<td>&nbsp; endif</td>
</tr><tr><th id="L64"><a href="#L64">64</a></th>
<td></td>
</tr><tr><th id="L65"><a href="#L65">65</a></th>
<td>&nbsp; HiLink puppetVariable&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Identifier</td>
</tr><tr><th id="L66"><a href="#L66">66</a></th>
<td>&nbsp; HiLink puppetBoolean&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Boolean</td>
</tr><tr><th id="L67"><a href="#L67">67</a></th>
<td>&nbsp; HiLink puppetType&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Identifier</td>
</tr><tr><th id="L68"><a href="#L68">68</a></th>
<td>&nbsp; HiLink puppetDefault&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Identifier</td>
</tr><tr><th id="L69"><a href="#L69">69</a></th>
<td>&nbsp; HiLink puppetKeyword&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Define</td>
</tr><tr><th id="L70"><a href="#L70">70</a></th>
<td>&nbsp; HiLink puppetTypeDefs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Define</td>
</tr><tr><th id="L71"><a href="#L71">71</a></th>
<td>&nbsp; HiLink puppetComment&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Comment</td>
</tr><tr><th id="L72"><a href="#L72">72</a></th>
<td>&nbsp; HiLink puppetString&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;String</td>
</tr><tr><th id="L73"><a href="#L73">73</a></th>
<td>&nbsp; HiLink puppetTodo&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Todo</td>
</tr><tr><th id="L74"><a href="#L74">74</a></th>
<td>&#34;&nbsp; HiLink puppetBrace&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Delimiter</td>
</tr><tr><th id="L75"><a href="#L75">75</a></th>
<td>&#34;&nbsp; HiLink puppetTypeBrace&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Delimiter</td>
</tr><tr><th id="L76"><a href="#L76">76</a></th>
<td>&#34;&nbsp; HiLink puppetParen&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Delimiter</td>
</tr><tr><th id="L77"><a href="#L77">77</a></th>
<td>&nbsp; HiLink puppetDelimiter&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Delimiter</td>
</tr><tr><th id="L78"><a href="#L78">78</a></th>
<td>&nbsp; HiLink puppetControl&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Statement</td>
</tr><tr><th id="L79"><a href="#L79">79</a></th>
<td>&nbsp; HiLink puppetDefType&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Define</td>
</tr><tr><th id="L80"><a href="#L80">80</a></th>
<td>&nbsp; HiLink puppetDefName&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Type</td>
</tr><tr><th id="L81"><a href="#L81">81</a></th>
<td>&nbsp; HiLink puppetTypeName&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Statement</td>
</tr><tr><th id="L82"><a href="#L82">82</a></th>
<td>&nbsp; HiLink puppetTypeDefault&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Type</td>
</tr><tr><th id="L83"><a href="#L83">83</a></th>
<td>&nbsp; HiLink puppetParamName&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Identifier</td>
</tr><tr><th id="L84"><a href="#L84">84</a></th>
<td>&nbsp; HiLink puppetArgument&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Identifier</td>
</tr><tr><th id="L85"><a href="#L85">85</a></th>
<td></td>
</tr><tr><th id="L86"><a href="#L86">86</a></th>
<td>&nbsp; delcommand HiLink</td>
</tr><tr><th id="L87"><a href="#L87">87</a></th>
<td>endif</td>
</tr><tr><th id="L88"><a href="#L88">88</a></th>
<td></td>
</tr><tr><th id="L89"><a href="#L89">89</a></th>
<td>let b:current_syntax = &#34;puppet&#34;</td>
</tr></tbody></table>
  </div>

 <div id="help">
  <strong>Note:</strong> See <a href="/trac/puppet/wiki/TracBrowser">TracBrowser</a> for help on using the browser.
 </div>

  <div id="anydiff">
   <form action="/trac/puppet/anydiff" method="get">
    <div class="buttons">
     <input type="hidden" name="new_path" value="/trunk/ext/vim/puppet.vim" />
     <input type="hidden" name="old_path" value="/trunk/ext/vim/puppet.vim" />
     <input type="hidden" name="new_rev" value="" />
     <input type="hidden" name="old_rev" value="" />
     <input type="submit" value="View changes..." title="Prepare an Arbitrary Diff" />
    </div>
   </form>
  </div>

</div>
</div>
<script type="text/javascript">searchHighlight()</script>
<div id="altlinks"><h3>Download in other formats:</h3><ul><li class="first last"><a href="/trac/puppet/browser/trunk/ext/vim/puppet.vim?format=raw">Original Format</a></li></ul></div>

</div>

<div id="footer">
 <hr />
 <a id="tracpowered" href="http://trac.edgewall.org/"><img src="/tracdocs/trac_logo_mini.png" height="30" width="107"
   alt="Trac Powered"/></a>
 <p class="left">
  Powered by <a href="/trac/puppet/about"><strong>Trac 0.10.3</strong></a><br />
  By <a href="http://www.edgewall.org/">Edgewall Software</a>.
 </p>
 <p class="right">
  Visit the Trac open source project at<br /><a href="http://trac.edgewall.com/">http://trac.edgewall.com/</a>
 </p>
</div>

<div id="foot">
	<p>
		<a href="http://reductivelabs.com/">
			Copyright &copy;<span class="years">&nbsp;&nbsp;2000-2007</span>
			&nbsp;&nbsp;Reductive Labs, LLC.
		</a>
	</p>
</div>


 </body>
</html>
