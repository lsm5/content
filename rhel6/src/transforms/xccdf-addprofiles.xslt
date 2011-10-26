<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xccdf="http://checklists.nist.gov/xccdf/1.1" xmlns:xhtml="http://www.w3.org/1999/xhtml">

  <xsl:template match="xccdf:Benchmark">
    <xsl:copy>
      <xsl:copy-of select="@*" />
      <xsl:if test="'allprofiles'=$profile">
          <xsl:apply-templates select="document('../input/profiles/desktop.xml')" />
          <xsl:apply-templates select="document('../input/profiles/server.xml')" />
      </xsl:if>
      <xsl:copy-of select="node()" />
    </xsl:copy>
  </xsl:template>

  <!-- copy everything else through to final output -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()" />
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
