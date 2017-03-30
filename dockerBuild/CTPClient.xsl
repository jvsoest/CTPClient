<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" encoding="utf-8" omit-xml-declaration="yes" />

<xsl:template match="/jnlp">
    <jnlp
		<!-- needs to be hard-coded for apache reverse proxys and docker containers on different ports -->
		<!-- e.g. http://ctp.tst.cancerdata.org/CTPClient -->
        codebase="{environment/protocol}://{environment/host}/{environment/application}" >
        <!-- href="{environment/application}.jnlp" > -->

        <information>
            <title>CTP Client Utility</title>
            <vendor>RSNA</vendor>
            <homepage href="http://mircwiki.rsna.org//index.php?title=CTP-The_RSNA_Clinical_Trial_Processor"/>
            <description>CTP Client Utility</description>
            <description kind="short">Java Web Start program for transmitting data to CTP for clinical trials.</description>
            <!-- <offline-allowed/> -->
        </information>

        <security>
            <all-permissions/>
        </security>

        <resources>
            <j2se version="1.6+"/>
            <jar href="CTPClient.jar"/>
            <jar href="CTP.jar"/>
            <jar href="dcm4che.jar"/>
            <jar href="log4j.jar"/>
            <jar href="util.jar"/>
			<jar href="jdbm.jar"/>
        </resources>

        <application-desc main-class="client.CTPClient">
            <argument>"protocol=<xsl:value-of select="environment/protocol"/>"</argument>
			<!-- Needs to be hard-coded for apache reverse proxies and docker containers on different ports -->
            <argument>"host=<xsl:value-of select="environment/host"/>"</argument>
            <argument>"application=<xsl:value-of select="environment/application"/>"</argument>
			<argument>"panelTitle=TraIT CTP Client"</argument>
            <argument>"httpURL=https://ctp.bmia.nl:443"</argument>
            <argument>"showURL=no"</argument>
            <xsl:apply-templates select="params/param"/>
        </application-desc>
    </jnlp>
</xsl:template>

<xsl:template match="param">
    <argument>"<xsl:value-of select="."/>"</argument>
</xsl:template>

</xsl:stylesheet>