<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
   xmlns="http://www.w3.org/1999/xhtml"
   xmlns:html="http://www.w3.org/1999/xhtml"
   xmlns:tei="http://www.tei-c.org/ns/1.0"
   xmlns:teidocx="http://www.tei-c.org/ns/teidocx/1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   exclude-result-prefixes="tei html teidocx xs"
   version="2.0">

   <xsl:import href="../../../../pub-XSLT/Stylesheets/html5-foundation6-chs/to.xsl"/>
    
   <xsl:import href="text-critical.xsl"/>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl" scope="stylesheet" type="stylesheet">
      <desc>
         <p>TEI stylesheet for making HTML5 output (Zurb Foundation 6 http://foundation.zurb.com/sites/docs/).</p>
         <p>This software is dual-licensed:
            
            1. Distributed under a Creative Commons Attribution-ShareAlike 3.0
            Unported License http://creativecommons.org/licenses/by-sa/3.0/ 
            
            2. http://www.opensource.org/licenses/BSD-2-Clause
            
            
            
            Redistribution and use in source and binary forms, with or without
            modification, are permitted provided that the following conditions are
            met:
            
            * Redistributions of source code must retain the above copyright
            notice, this list of conditions and the following disclaimer.
            
            * Redistributions in binary form must reproduce the above copyright
            notice, this list of conditions and the following disclaimer in the
            documentation and/or other materials provided with the distribution.
            
            This software is provided by the copyright holders and contributors
            "as is" and any express or implied warranties, including, but not
            limited to, the implied warranties of merchantability and fitness for
            a particular purpose are disclaimed. In no event shall the copyright
            holder or contributors be liable for any direct, indirect, incidental,
            special, exemplary, or consequential damages (including, but not
            limited to, procurement of substitute goods or services; loss of use,
            data, or profits; or business interruption) however caused and on any
            theory of liability, whether in contract, strict liability, or tort
            (including negligence or otherwise) arising in any way out of the use
            of this software, even if advised of the possibility of such damage.
         </p>
         <p>Andrej Pančur, Institute for Contemporary History</p>
         <p>Copyright: 2013, TEI Consortium</p>
      </desc>
   </doc>
    
    <xsl:param name="localWebsite">true</xsl:param>
   
    <!-- Uredi parametre v skladu z dodatnimi zahtevami za pretvorbo te publikacije: -->
    
    <!--<xsl:param name="path-general">../../../</xsl:param>-->
    <!--<xsl:param name="path-general">https://www2.sistory.si/publikacije/</xsl:param>-->
    <!-- v primeru localWebsite='true' spodnji paragraf nima vrednosti -->
    <xsl:param name="path-general"></xsl:param>
   
    <!-- Andrej: moja absolutna pot v outputDir je /Users/andrejp/Repo/pub/Kapelski/sidih/,
         vendar v tem primeru naredi pretvorbro iz generiranega sidih/kapelski.xml kar direktno v sidih/ direktorij -->
   <xsl:param name="outputDir"></xsl:param>
   
   <xsl:param name="title-bar-sticky">false</xsl:param>
   
    <xsl:param name="homeLabel">eZISS</xsl:param>
    <xsl:param name="homeURL">https://dariah-si.github.io/Foglar-pub/</xsl:param>
    
   <!-- V html/head izpisani metapodatki -->
   <xsl:param name="description"></xsl:param>
   <xsl:param name="keywords"></xsl:param>
   <xsl:param name="title"></xsl:param>
    
    
    <!-- Slovene localisation of eZRC/TEI element, attribute and value names / glosses to Slovene -->
    <!-- Needed for teiHeader localisation and write-out of e.g. Janus elements -->
    <xsl:param name="localisation-file">../../teiLocalise-sl.xml</xsl:param>
    <xsl:key name="id" match="tei:*" use="@xml:id"/>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>Novo ime za glavno vsebino (glavna navigacija)</desc>
        <param name="thisLanguage"></param>
    </doc>
    <xsl:template name="nav-body-head">
        <xsl:param name="thisLanguage"/>
        <xsl:text>Prepisi</xsl:text>
    </xsl:template>
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>Novo ime za uvodna poglavja (glavna navigacija)</desc>
        <param name="thisLanguage"></param>
    </doc>
    <xsl:template name="nav-front-head">
        <xsl:param name="thisLanguage"/>
        <xsl:text>Ureditev in načela</xsl:text>
    </xsl:template>
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>Novo ime za študije (glavna navigacija)</desc>
        <param name="thisLanguage"></param>
    </doc>
    <xsl:template name="nav-study-head">
        <xsl:param name="thisLanguage"/>
        <xsl:text>Komentar</xsl:text>
    </xsl:template>
    
   <xsldoc:doc xmlns:xsldoc="http://www.oxygenxml.com/ns/doc/xsl">
      <xsldoc:desc>V css in javascript Hook dodam viewerjs</xsldoc:desc>
   </xsldoc:doc>
   <xsl:template name="cssHook">
      <xsl:if test="$title-bar-sticky = 'true'">
         <xsl:value-of select="concat($path-general,'themes/css/foundation/6/sistory-sticky_title_bar.css')"/>
      </xsl:if>
      <link href="http://cdnjs.cloudflare.com/ajax/libs/foundicons/3.0.0/foundation-icons.min.css" rel="stylesheet" type="text/css" />
      <link href="{concat($path-general,'themes/plugin/TipueSearch/6.1/tipuesearch/css/normalize.css')}" rel="stylesheet" type="text/css" />
      <link href="{concat($path-general,'themes/css/plugin/TipueSearch/6.1/my-tipuesearch.css')}"  rel="stylesheet" type="text/css" />
       <!-- dodan viewerjs -->
       <link href="{concat($path-general,'themes/plugin/viewerjs/1.2.0/dist/viewer.css')}" rel="stylesheet" type="text/css" />
       <!-- dodam projektno specifičen css, ki se nahaja v istem direktoriju kot ostali HTML dokumenti -->
      <link href="project.css" rel="stylesheet" type="text/css"/>
   </xsl:template>
   <xsldoc:doc xmlns:xsldoc="http://www.oxygenxml.com/ns/doc/xsl">
      <xsldoc:desc>[html] Hook where extra Javascript functions can be defined</xsldoc:desc>
   </xsldoc:doc>
   <xsl:template name="javascriptHook">
      <script src="{concat($path-general,'themes/foundation/6/js/vendor/jquery.js')}"></script>
      <!-- za highcharts -->
      <xsl:if test="//tei:figure[@type = 'chart'][tei:graphic[@mimeType = 'application/javascript']]">
         <xsl:variable name="jsfile" select="//tei:figure[@type = 'chart'][tei:graphic[@mimeType = 'application/javascript']][1]/tei:graphic[@mimeType = 'application/javascript']/@url"/>
         <xsl:variable name="chart-jsfile" select="document($jsfile)/html/body/script[1]/@src"/>
         <script src="{$chart-jsfile[1]}"></script>
      </xsl:if>
      <!-- za back-to-top in highcharts je drugače potrebno dati jquery, vendar sedaj ne rabim dodajati jquery kodo,
         ker je že vsebovana zgoraj -->
       <!-- dodan viewerjs -->
       <script src="{concat($path-general,'themes/plugin/viewerjs/1.2.0/dist/viewer.js')}"></script>
       <!-- dodan css jstree (mora biti za jquery.js -->
       <link href="{concat($path-general,'themes/plugin/jstree/3.3.5/dist/themes/default/style.min.css')}" rel="stylesheet" type="text/css" />
       <!-- dodan jstree -->
      <script src="{concat($path-general,'themes/plugin/jstree/3.3.5/dist/jstree.min.js')}"></script>
   </xsl:template>
    
   
   <xsldoc:doc xmlns:xsldoc="http://www.oxygenxml.com/ns/doc/xsl">
      <xsldoc:desc>Dodam javascript za viewerjs (pogled tei:pb)</xsldoc:desc>
   </xsldoc:doc>
   <xsl:template name="bodyEndHook">
       <script type="text/javascript">
           var allImages = document.getElementsByClassName('image');
           
           var image = Array.prototype.filter.call(allImages, function(element){
               var viewer = new Viewer(element, {
                   url: 'data-original',
                   toolbar: false,
                   navbar: false,
                   title: false,
                   backdrop: true
                });
              });
       </script>
       
      <script src="{concat($path-general,'themes/foundation/6/js/vendor/what-input.js')}"></script>
      <script src="{concat($path-general,'themes/foundation/6/js/vendor/foundation.min.js')}"></script>
      <script src="{concat($path-general,'themes/foundation/6/js/app.js')}"></script>
      <!-- back-to-top -->
      <script src="{concat($path-general,'themes/js/plugin/back-to-top/back-to-top.js')}"></script>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Dodam vsebino Saxon-JS v prej prazni template</desc>
   </doc>
   <xsl:template name="divGen-process-content">
      <script type="text/javascript" src="SaxonJS.min.js"></script>
       <script>
           window.onload = function() {
           SaxonJS.transform({
           stylesheetLocation: "para.sef",
           sourceLocation: "foglar.xml"
           });
           }     
       </script>
       <!-- dodam svoj preloader: ko nalaga stran, se vrti krogec -->
       <div class="preloader"></div>
       <!-- dinamična para vsebina -->
       <div id="para"/>
       <!-- js za preloader -->
       <script type="text/javascript">
           $(document).ready(function () {
             // preloader
             $(window).load(function(){
               $('.preloader').delay(400).fadeOut(500);
             })
           })
       </script>
       
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc></desc>
   </doc>
   <xsl:template match="tei:quote">
      <xsl:choose>
         <!-- Če ni znotraj odstavka -->
         <xsl:when test="not(ancestor::tei:p)">
            <blockquote>
               <xsl:choose>
                  <xsl:when test="@xml:id and not(parent::tei:cit[@xml:id])">
                     <xsl:attribute name="id">
                        <xsl:value-of select="@xml:id"/>
                     </xsl:attribute>
                  </xsl:when>
                  <xsl:when test="parent::tei:cit[@xml:id]">
                     <xsl:attribute name="id">
                        <xsl:value-of select="parent::tei:cit/@xml:id"/>
                     </xsl:attribute>
                  </xsl:when>
               </xsl:choose>
               <xsl:apply-templates/>
               <!-- glej spodaj obrazložitev pri procesiranju elementov cit -->
               <xsl:if test="parent::tei:cit/tei:bibl">
                  <xsl:for-each select="parent::tei:cit/tei:bibl">
                     <cite>
                        <xsl:apply-templates/>
                     </cite>
                  </xsl:for-each>
               </xsl:if>
            </blockquote>
         </xsl:when>
         <!-- Če pa je znotraj odstavka, ga damo samo v element q, se pravi v narekovaje. -->
         <xsl:otherwise>
            <q>
               <xsl:apply-templates/>
            </q>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <!-- Če je naveden tudi avtor citata, damo predhodno element quote v parent element cit
         in mu dodamo še sibling element bibl/author
    -->
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc></desc>
   </doc>
   <xsl:template match="tei:cit">
      <xsl:apply-templates/>
   </xsl:template>
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc></desc>
   </doc>
   <xsl:template match="tei:bibl[parent::tei:cit]">
      <!-- ta element pustimo prazen,ker ga procesiroma zgoraj v okviru elementa quote -->
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc></desc>
      <param name="thisChapter-id"></param>
      <param name="title-bar-type"></param>
   </doc>
   <xsl:template name="title-bar-list-of-contents-subchapters">
      <xsl:param name="thisChapter-id"/>
      <xsl:param name="title-bar-type"/>
      <!-- odstranim, da mora imeti atribut type -->
      <xsl:if test="tei:div[@xml:id]">
         <ul>
            <xsl:attribute name="class">
               <xsl:if test="$title-bar-type = 'vertical'">vertical menu</xsl:if>
               <xsl:if test="$title-bar-type = 'dropdown'">menu</xsl:if>
            </xsl:attribute>
            <xsl:for-each select="tei:div">
               <li>
                  <xsl:if test="descendant-or-self::tei:div[@xml:id = $thisChapter-id]">
                     <xsl:attribute name="class">active</xsl:attribute>
                  </xsl:if>
                  <a>
                     <xsl:attribute name="href">
                        <xsl:apply-templates mode="generateLink" select="."/>
                     </xsl:attribute>
                     <!--<xsl:attribute name="href">
                                <xsl:variable name="this-subchapterID" select="@xml:id"/>
                                <xsl:value-of select="concat(ancestor::tei:div[1]/@xml:id,'.html#',$this-subchapterID)"/>
                            </xsl:attribute>-->
                     <xsl:apply-templates select="tei:head[1]" mode="chapters-head"/>
                  </a>
                  <xsl:call-template name="title-bar-list-of-contents-subchapters">
                     <xsl:with-param name="thisChapter-id" select="$thisChapter-id"/>
                     <xsl:with-param name="title-bar-type" select="$title-bar-type"/>
                  </xsl:call-template>
               </li>
            </xsl:for-each>
         </ul>
      </xsl:if>
   </xsl:template>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>Prelome strani izkoristim za povezave na dinamično stran para.html</desc>
    </doc>
    <xsl:template match="tei:pb">
        <xsl:variable name="facs-id" select="substring-after(@facs,'#')"/>
        <xsl:variable name="type">
            <xsl:choose>
                <xsl:when test="contains(@xml:id,'dipl')">dipl</xsl:when>
                <xsl:otherwise>crit</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="image-thumb" select="ancestor::tei:TEI/tei:facsimile/tei:surface[@xml:id=$facs-id]/tei:graphic[@n='thumb']/@url"/>
        <xsl:variable name="image-small" select="ancestor::tei:TEI/tei:facsimile/tei:surface[@xml:id=$facs-id]/tei:graphic[@n='small']/@url"/>
        <xsl:variable name="image-large" select="ancestor::tei:TEI/tei:facsimile/tei:surface[@xml:id=$facs-id]/tei:graphic[@n='orig']/@url"/>
        <!-- dodam za novo procesiranje -->
        <xsl:variable name="image" select="tokenize(ancestor::tei:TEI/tei:facsimile/tei:surface[@xml:id=$facs-id]/tei:graphic[@n='orig']/@url,'/')[last()]"/>
        <xsl:variable name="image-thumb-iiif" select="concat('https://sidih.si/iiif/2/entity|1-1000|1|',$image,'/full/,50/0/default.jpg')"/>
        <xsl:variable name="image-small-iiif" select="concat('https://sidih.si/iiif/2/entity|1-1000|1|',$image,'/full/,400/0/default.jpg')"/>
        <xsl:variable name="image-large-iiif" select="concat('https://sidih.si/iiif/2/entity|1-1000|1|',$image,'/full/,900/0/default.jpg')"/>
        <hr/>
        <div class="border-content pb" id="{@xml:id}">
            <div class="dropdown">
                <button class="small dropdown button text-center">
                    <xsl:text>Stran </xsl:text>
                    <xsl:value-of select="@n"/>
                </button>
                <div class="dropdown-content">
                    <xsl:if test="$type='dipl'">
                        <a href="#{@xml:id}" class="border-content">diplomatični</a>
                        <a href="foglar-crit.html#foglar-crit.pb.{@n}">kritični</a>
                        <a href="{concat('foglar-para.html?type=page&amp;mode=facs-dipl-crit&amp;page=',@n,'&amp;lb=1')}">vzporedni</a>
                        <a href="{$image-large}">faksimile</a>
                        <a>
                            <img class="image" src="{$image-thumb-iiif}" data-original="{$image-large-iiif}" height="50" width="50"/>
                        </a>
                    </xsl:if>
                    <xsl:if test="$type='crit'">
                        <a href="foglar-dipl.html#foglar-dipl.pb.{@n}">diplomatični</a>
                        <a href="#{@xml:id}" class="border-content">kritični</a>
                        <a href="{concat('foglar-para.html?type=page&amp;mode=facs-dipl-crit&amp;page=',@n,'&amp;lb=1')}">vzporedni</a>
                        <a href="{$image-large}">faksimile</a>
                        <a>
                            <img class="image" src="{$image-thumb-iiif}" data-original="{$image-large-iiif}" height="50" width="50"/>
                        </a>
                    </xsl:if>
                </div>
            </div>
            <br/>
            
            <div class="show-for-large">
                <img class="image" data-original="{$image-large-iiif}" src="{$image-small-iiif}"/>
            </div>
            <div class="show-for-medium-only">
                <img class="image" data-original="{$image-large-iiif}" src="{$image-thumb-iiif}"/>
            </div>
        </div>
    </xsl:template>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc></desc>
    </doc>
    <xsl:template match="tei:fw">
        <div class="pageNum" style="text-align: center;">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc></desc>
    </doc>
    <xsl:template match="tei:label">
        <div class="{if (@rend) then (concat('text',@rend)) else 'padding'}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!-- poenostavljeno procesiranje besed, ločil in presledkov -->
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc></desc>
    </doc>
    <xsl:template match="tei:w">
        <xsl:apply-templates/>
    </xsl:template>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc></desc>
    </doc>
    <xsl:template match="tei:pc">
        <xsl:value-of select="."/>
    </xsl:template>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc></desc>
    </doc>
    <xsl:template match="tei:c">
        <xsl:text> </xsl:text>
    </xsl:template>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>Odstranim prvotno procesiranje app elementov v opombah</desc>
    </doc>
    <xsl:template match="tei:app" mode="printnotes">
        <!--<xsl:variable name="identifier">
         <xsl:text>App</xsl:text>
         <xsl:choose>
            <xsl:when test="@xml:id">
               <xsl:value-of select="@xml:id"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:number count="tei:app" level="any"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <div class="app">
         <xsl:call-template name="makeAnchor">
            <xsl:with-param name="name" select="$identifier"/>
         </xsl:call-template>
         <span class="lemma">
            <xsl:call-template name="appLemma"/>
         </span>
         <xsl:text>] </xsl:text>
         <span class="lemmawitness">
            <xsl:call-template name="appLemmaWitness"/>
         </span>
         <xsl:call-template name="appReadings"/>
      </div>-->
    </xsl:template>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>Pri app procesiram samo lemo. Vsebino elementov rdg procesiram pri vzporednem prikazu.</desc>
    </doc>
    <xsl:template match="tei:app">
        <xsl:apply-templates/>
    </xsl:template>
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>Lemo procesiram</desc>
    </doc>
    <xsl:template match="tei:lem">
        <xsl:apply-templates/>
    </xsl:template>
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>rdg odstranim</desc>
    </doc>
    <xsl:template match="tei:rdg">
        <!-- ne procesiram naprej -->
    </xsl:template>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>Ker mi ni uspelo odpraviti napake pri prevzeti izdelavi kazal, 
            sem prilagodil spodnjo svojo pretvorbo na način, da procesira samo naslove, kjer je xml:id</desc>
    </doc>
    <xsl:template name="TOC-title-type">
        <xsl:if test="//tei:front/tei:div[@xml:id] | //tei:front/tei:divGen">
            <ul class="toc toc_front">
                <xsl:for-each select="//tei:front/tei:div[@type][@xml:id] | //tei:front/tei:divGen[not(@type = 'search')][not(@type = 'cip')][not(@type = 'teiHeader')][not(@type = 'toc')]">
                    <xsl:call-template name="TOC-title-type-li"/>
                </xsl:for-each>
            </ul>
        </xsl:if>
        <ul class="toc toc_body">
            <xsl:for-each select="//tei:body/tei:div[@xml:id]">
                <xsl:call-template name="TOC-title-type-li"/>
            </xsl:for-each>
        </ul>
        <xsl:if test="//tei:back/tei:div[@xml:id] | //tei:back/tei:divGen">
            <ul class="toc toc_back">
                <xsl:for-each select="//tei:back/tei:div[@type][@xml:id] | //tei:back/tei:divGen">
                    <xsl:call-template name="TOC-title-type-li"/>
                </xsl:for-each>
            </ul>
        </xsl:if>
    </xsl:template>
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>Prilagodim glede na zgornje potrebe</desc>
    </doc>
    <xsl:template name="TOC-title-type-li">
        <li class="toc">
            <a>
                <xsl:attribute name="href">
                    <xsl:apply-templates mode="generateLink" select="."/>
                </xsl:attribute>
                <xsl:for-each select="tei:head">
                    <xsl:variable name="chaptersHead">
                        <xsl:apply-templates select="." mode="chapters-head"/>
                    </xsl:variable>
                    <xsl:choose>
                        <xsl:when test="parent::tei:div[@type='part']">
                            <xsl:value-of select="upper-case($chaptersHead)"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$chaptersHead"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:if test="position() != last()">
                        <xsl:text>: </xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </a>
            <xsl:if test="tei:div[@xml:id][tei:head]">
                <ul>
                    <xsl:for-each select="tei:div[@xml:id][tei:head]">
                        <xsl:call-template name="TOC-title-type-li"/>
                    </xsl:for-each>
                </ul>
            </xsl:if>
        </li>
    </xsl:template>
    
    
</xsl:stylesheet>
