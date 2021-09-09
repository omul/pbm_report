<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:m="http://schemas.serviceml.org/smlif/2007/02" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:sfc="http://schemas.microsoft.com/sqlserver/sfc/serialization/2007/08" xmlns:DMF="http://schemas.microsoft.com/sqlserver/DMF/2007/08" xmlns:sml="http://schemas.serviceml.org/sml/2007/02" xmlns:exslt="http://exslt.org/common" version="1.0" extension-element-prefixes="exslt">
  <xsl:output omit-xml-declaration="yes" indent="no"/>
  <xsl:template match="/">
    <html>
    <body>

    <H3>Policy Evaluation</H3>
    <table border="1">
      <tr bgcolor="#CCCCCC">
      <td align="center"><strong>ID</strong></td>
      <td align="center"><strong>Policy</strong></td>
      <td align="center"><strong>Target</strong></td>
      <td align="center"><strong>Result</strong></td>
    </tr>

    <xsl:for-each select="//m:model[1]//*/DMF:EvaluationDetail">

      <tr bgcolor="#F5F5F5">
      
      <td>
      <xsl:call-template name="value-of-template">
        <xsl:with-param name="select" select="DMF:ID"/>
      </xsl:call-template>
      </td>
      
      <td>
      <xsl:call-template name="value-of-template">
        <xsl:with-param name="select" select="DMF:Parent/sfc:Reference/sml:Uri"/>
      </xsl:call-template>
      </td>

      <td>
      <xsl:call-template name="value-of-template">
        <xsl:with-param name="select" select="DMF:TargetQueryExpression"/>
      </xsl:call-template>
      </td>
      
      <td>
      <xsl:call-template name="value-of-template">
        <xsl:with-param name="select" select="DMF:Result"/>
      </xsl:call-template>
      </td>
      
      <xsl:value-of select="'&#10;'"/>

      </tr>

    </xsl:for-each>

    </table>

    <H3>Policy Applying</H3>
    <table border="1">
      <tr bgcolor="#CCCCCC">
      <td align="center"><strong>ID</strong></td>
      <td align="center"><strong>Policy</strong></td>
      <td align="center"><strong>Target</strong></td>
      <td align="center"><strong>Result</strong></td>
    </tr>

    <xsl:for-each select="//m:model[last()]//*/DMF:EvaluationDetail">

      <tr bgcolor="#F5F5F5">
      
      <td>
      <xsl:call-template name="value-of-template">
        <xsl:with-param name="select" select="DMF:ID"/>
      </xsl:call-template>
      </td>
      
      <td>
      <xsl:call-template name="value-of-template">
        <xsl:with-param name="select" select="DMF:Parent/sfc:Reference/sml:Uri"/>
      </xsl:call-template>
      </td>

      <td>
      <xsl:call-template name="value-of-template">
        <xsl:with-param name="select" select="DMF:TargetQueryExpression"/>
      </xsl:call-template>
      </td>
      
      <td>
      <xsl:call-template name="value-of-template">
        <xsl:with-param name="select" select="DMF:Result"/>
      </xsl:call-template>
      </td>
      
      <xsl:value-of select="'&#10;'"/>

      </tr>

    </xsl:for-each>

    </table>
    
    </body>
    </html>

  </xsl:template>
  <xsl:template name="value-of-template">
    <xsl:param name="select"/>
    <xsl:value-of select="$select"/>
    <xsl:for-each select="exslt:node-set($select)[position()&gt;1]">
      <xsl:value-of select="'&#10;'"/>
      <xsl:value-of select="."/>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
