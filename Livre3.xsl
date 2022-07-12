<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    
    <xsl:template match="/"> 
        <html> 
            <head> 
                <title>Untitled</title>
                <link href="stylesheet.css" rel="stylesheet"/>
            </head> 
            <body> 
                <xsl:apply-templates/> 
            </body> 
        </html> 
    </xsl:template>
        
    <xsl:template match="//tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
      
    </xsl:template>
    
    <xsl:template match="//tei:floatingText">
        <div class="floating-container" id="floatingText{@n}">
        <div class="box">
            <xsl:apply-templates/>
        </div>
        </div>
    </xsl:template>
    
    <xsl:template match="//tei:floatingText[@type = 'verse']">
        <div class="verse-container" id="floatingText{@n}">
            <div class="box verse-text-box">
                <xsl:apply-templates/>
            </div>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:seg">
        <span onclick="myFunction{@n}();">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
        
    <xsl:template match="tei:note">
        <span class="note-container" id="Span{note|@n}">
        <span class="note">
            <xsl:apply-templates/>
        </span>
        </span>

        <script>
            function myFunction<xsl:value-of select="note|@n"/>() {
            var <xsl:value-of select="note|@n"/> = document.getElementById("Span<xsl:value-of select="note|@n"/>");
            <xsl:value-of select="note|@n"/>.classList.add("opened");
            if (<xsl:value-of select="note|@n"/>.style.display === "none") {
            <xsl:value-of select="note|@n"/>.style.display = "block";
            } else {
            <xsl:value-of select="note|@n"/>.style.display = "none";
            }
            }
        </script>
    </xsl:template>
    
    <xsl:template match="//tei:head">
        <h2>
            <xsl:apply-templates/>
        </h2> 
    </xsl:template>
    
    <xsl:template match="tei:lg | @stanza">
        <p>
            <xsl:value-of select="lg|@n"/><br/>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:l">
        
        <xsl:apply-templates/>
        <br/>
    </xsl:template>
    
    <xsl:template match="tei:head">
        <h2>
            <xsl:apply-templates/>
        </h2> 
    </xsl:template>
    
    <xsl:template match="//tei:div[@type='livre']">
        <div class="livre">
        <xsl:apply-templates/>
        </div>
    </xsl:template>
        
    
    
</xsl:stylesheet>
