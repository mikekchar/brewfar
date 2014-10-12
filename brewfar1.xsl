<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"                                xmlns="http://www.w3.org/1999/xhtml">

  <xsl:output
   method="xml"
   doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
   doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
   indent="yes"
   encoding="iso-8859-1"
  />

  <xsl:template match="/beer">
   <html>
     <head>
       <title>
         <xsl:text>Beer Recipe: </xsl:text><xsl:value-of select="name"/>
       </title>
       <link rel="stylesheet" type="text/css" href="beer.css"/>
     </head>
     <body>
       <span class="pic">
         <img src="beer.png" alt="Mmmm...beer!"/>
         <p>"Mmmm...beer!"</p>
       </span>
       <h1><xsl:text>Beer Recipe: </xsl:text><xsl:value-of select="name"/></h1>
       <h2>General</h2>
       <dl>
         <dt><strong>Style:</strong></dt>
         <dd><xsl:value-of select="style"/></dd>
         <dt><strong>First Brewed:</strong></dt>
         <dd><xsl:value-of select="first-brewed"/></dd>
         <dt><strong>Brewers:</strong></dt>
         <dd><xsl:value-of select="brewers"/></dd>
	     <dt><strong>Notes:</strong></dt>
	     <dd><xsl:value-of select="notes"/></dd>
       </dl>
       <div class="stats">
         <table>
           <tr>
             <td><strong>Stats</strong></td>
           </tr>
           <xsl:apply-templates select="stats"/>
         </table>
       </div>
       <div class="ingredients">
         <table>
           <tr>
             <td><strong>Ingredients</strong></td>
           </tr>
           <xsl:apply-templates select="ingredients"/>
         </table>
       </div>
         <xsl:apply-templates select="log"/><br/>
     </body>
   </html>
  </xsl:template>

  <xsl:template match="ingredients">
         <xsl:apply-templates select="fermentables"/>
         <xsl:apply-templates select="flavourings"/>
         <xsl:apply-templates select="yeast"/>
         <xsl:apply-templates select="priming"/>
  </xsl:template>

  <xsl:template match="fermentables">
           <xsl:apply-templates select="malt"/>
  </xsl:template>

  <xsl:template match="malt">
         <tr>
           <td>
             <xsl:value-of select="type"/>
           </td>
           <td>
             <xsl:value-of select="qty"/><xsl:text> </xsl:text><xsl:value-of select="qty/@units"/>
           </td>
           <td>
             <xsl:value-of select="added"/>
           </td>
         </tr>
  </xsl:template>

  <xsl:template match="hop">
         <tr>
           <td>
             <xsl:value-of select="type"/>
           </td>
           <td>
             <xsl:value-of select="qty"/><xsl:text> </xsl:text><xsl:value-of select="qty/@units"/>
           </td>
           <td>
             <xsl:value-of select="added"/>
           </td>
         </tr>
  </xsl:template>

  <xsl:template match="yeast">
         <tr>
           <td>
             <xsl:value-of select="type"/>
           </td>
           <td>
             <xsl:value-of select="qty"/><xsl:text> </xsl:text><xsl:value-of select="qty/@units"/>
           </td>
           <td>
             <xsl:value-of select="added"/>
           </td>
         </tr>
  </xsl:template>

  <xsl:template match="priming">
         <tr>
           <td>
             <xsl:value-of select="type"/>
           </td>
           <td>
             <xsl:value-of select="qty"/><xsl:text> </xsl:text><xsl:value-of select="qty/@units"/>
           </td>
         </tr>
  </xsl:template>

  <xsl:template match="stats">
         <tr>
           <td>Starting Gravity</td>
           <td><xsl:value-of select="sg"/></td>
         </tr>
         <tr>
           <td>Final Gravity</td>
           <td><xsl:value-of select="fg"/></td>
         </tr>
         <tr>
           <td>Apparent Attenuation</td>
           <td><xsl:value-of select="attenuation"/></td>
         </tr>
         <tr>
           <td>Apparent Extract</td>
           <td><xsl:value-of select="extract"/></td>
         </tr>
         <tr>
           <td>Calculated Colour</td>
           <td><xsl:value-of select="colour"/></td>
         </tr>
         <tr>
           <td>Calculated IBUs</td>
           <td><xsl:value-of select="ibu"/></td>
         </tr>
  </xsl:template>

  <xsl:template match="log">
       <h2>Log</h2>
       <xsl:apply-templates select="summary"/>
       <span class="data">
         <h3>Data</h3>
         <table>
           <tr>
             <td><strong>Time</strong></td>
             <td><strong>Temp</strong></td>
             <td><strong>Description</strong></td>
           </tr>
           <xsl:apply-templates select="action"/>
         </table>
       </span>
  </xsl:template>

  <xsl:template match="summary">
       <span class="summary">
         <h3>Summary</h3>
         <table>
           <xsl:apply-templates/>
         </table>
       </span>
  </xsl:template>

  <xsl:template match="type">
         <tr>
           <td>Brew Type</td>
           <td><xsl:value-of select="."/></td>
         </tr>
  </xsl:template>


  <xsl:template match="mashin">       
         <tr>
           <td>Mash In</td>
           <td><xsl:value-of select="temp"/><xsl:text> </xsl:text>
               <xsl:value-of select="temp/@units"/></td>
           <td><xsl:value-of select="thickness"/><xsl:text> </xsl:text>
               <xsl:value-of select="thickness/@units"/></td>
         </tr>
  </xsl:template>

  <xsl:template match="protein">       
         <tr>
           <td>Protein Rest</td>
           <td><xsl:value-of select="temp"/><xsl:text> </xsl:text>
               <xsl:value-of select="temp/@units"/></td>
           <td><xsl:value-of select="time"/></td>
         </tr>
  </xsl:template>

  <xsl:template match="sacharification">       
         <tr>
           <td>Sacharification Rest</td>
           <td><xsl:value-of select="temp"/><xsl:text> </xsl:text>
               <xsl:value-of select="temp/@units"/></td>
           <td><xsl:value-of select="time"/></td>
         </tr>
  </xsl:template>

  <xsl:template match="mashout">       
         <tr>
           <td>Mash Out</td>
           <td><xsl:value-of select="temp"/><xsl:text> </xsl:text>
               <xsl:value-of select="temp/@units"/></td>
           <td><xsl:value-of select="time"/></td>
         </tr>
  </xsl:template>

  <xsl:template match="sparge">       
         <tr>
           <td>Sparge</td>
           <td><xsl:value-of select="time"/></td>
         </tr>
  </xsl:template>

  <xsl:template match="preboil">       
         <tr>
           <td>Pre-Boil</td>
           <td><xsl:value-of select="time"/></td>
         </tr>
  </xsl:template>

  <xsl:template match="boil">       
         <tr>
           <td>Boil</td>
           <td><xsl:value-of select="time"/></td>
         </tr>
  </xsl:template>

  <xsl:template match="chill">       
         <tr>
           <td>Chill</td>
           <td><xsl:value-of select="time"/></td>
         </tr>
  </xsl:template>

  <xsl:template match="primary">       
         <tr>
           <td>Primary Fermentation</td>
           <td><xsl:value-of select="time"/></td>
         </tr>
  </xsl:template>

  <xsl:template match="secondary">       
         <tr>
           <td>Secondary Fermentation</td>
           <td><xsl:value-of select="time"/></td>
         </tr>
  </xsl:template>

  <xsl:template match="action">
         <tr>
           <td><xsl:value-of select="time"/></td>
           <td><xsl:value-of select="temp"/><xsl:text> </xsl:text>
               <xsl:value-of select="temp/@units"/></td>
           <td><xsl:value-of select="desc"/></td>
         </tr>
  </xsl:template>

</xsl:stylesheet>