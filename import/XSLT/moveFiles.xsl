<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
    <!-- ko v terminali narediš premik datotek, se najprej (change directory - cd) premakni v mapo, kjer so ti dokumenti -->
    
    <xsl:output method="text" encoding="UTF-8"/>
    
    <xsl:param name="lastSIDIHfileNumber">8</xsl:param>
    <xsl:param name="path2entity">/Users/andrejp/Repo/DARIAH-SI/Foglar-pub/import/facsimile/sidih/menuTop/menu1/menu2/menu3/1/</xsl:param>
    
    <xsl:template match="tei:TEI/tei:facsimile">
        <xsl:result-document href="import/move.txt">
            <xsl:for-each select="tei:surface">
                <xsl:variable name="fileNumber" select="position() + $lastSIDIHfileNumber"/>
                <xsl:variable name="fileName" select="tokenize(tei:graphic[@n='orig']/@url,'/')[last()]"/>
                <xsl:text>mv </xsl:text>
                <xsl:value-of select="$fileName"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="concat($path2entity,'file',$fileNumber,'/',$fileName)"/>
                <xsl:if test="position() != last()">
                    <xsl:text> ; </xsl:text>
                </xsl:if>
            </xsl:for-each>
        </xsl:result-document>
    </xsl:template>
    
</xsl:stylesheet>