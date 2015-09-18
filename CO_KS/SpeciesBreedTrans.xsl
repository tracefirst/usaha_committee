<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'"/>
    <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>

    <!-- This is a placeholder for a lookup table to standard species codes -->
    <xsl:template name="Species">
        <xsl:param name="species"/>
        <xsl:choose>
            <xsl:when test="$species ='BBOV'">BOV</xsl:when>
            <xsl:when test="$species ='DBOV'">BOV</xsl:when>
            <xsl:when test="$species ='AQU'">AQU</xsl:when>
            <xsl:when test="$species ='AVI'">AVI</xsl:when>
            <xsl:when test="$species ='BEF'">BEF</xsl:when>
            <xsl:when test="$species ='BIS'">BIS</xsl:when>
            <xsl:when test="$species ='BOV'">BOV</xsl:when>
            <xsl:when test="$species ='CAM'">CAM</xsl:when>
            <xsl:when test="$species ='CAN'">CAN</xsl:when>
<xsl:when test="translate($species, $smallcase, $uppercase)='CANINE'">CAN</xsl:when>
            <xsl:when test="$species ='CAP'">CAP</xsl:when>
            <xsl:when test="$species ='CER'">CER</xsl:when>
            <xsl:when test="$species ='CHI'">CHI</xsl:when>
            <xsl:when test="$species ='CLM'">CLM</xsl:when>
            <xsl:when test="$species ='CRA'">CRA</xsl:when>
            <xsl:when test="$species ='CTF'">CTF</xsl:when>
            <xsl:when test="$species ='DAI'">DAI</xsl:when>
            <xsl:when test="$species ='DEE'">DEE</xsl:when>
            <xsl:when test="$species ='DUC'">DUC</xsl:when>
            <xsl:when test="$species ='ELK'">ELK</xsl:when>
            <xsl:when test="$species ='EQU'">EQU</xsl:when>
            <xsl:when test="$species ='FEL'">FEL</xsl:when>
            <xsl:when test="$species ='GEE'">GEE</xsl:when>
            <xsl:when test="$species ='GUI'">GUI</xsl:when>
            <xsl:when test="$species ='MSL'">MSL</xsl:when>
            <xsl:when test="$species ='OTH'">OTH</xsl:when>
            <xsl:when test="$species ='OVI'">OVI</xsl:when>
            <xsl:when test="$species ='OYS'">OYS</xsl:when>
            <xsl:when test="$species ='PGN'">PGN</xsl:when>
            <xsl:when test="$species ='POR'">POR</xsl:when>
            <xsl:when test="$species ='QUA'">QUA</xsl:when>
            <xsl:when test="$species ='RTT'">RTT</xsl:when>
            <xsl:when test="$species ='SAL'">SAL</xsl:when>
            <xsl:when test="$species ='SBA'">SBA</xsl:when>
            <xsl:when test="$species ='SHR'">SHR</xsl:when>
            <xsl:when test="$species ='SLP'">SLP</xsl:when>
            <xsl:when test="$species ='TIL'">TIL</xsl:when>
            <xsl:when test="$species ='TRO'">TRO</xsl:when>
            <xsl:when test="$species ='TUR'">TUR</xsl:when>
            <xsl:otherwise>OTH</xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- This is a placeholder for a lookup table to standard codes -->
    <xsl:template name="Breed">
        <xsl:param name="species"/>
        <xsl:param name="breed"/>
        <xsl:choose>
            <xsl:when test="$species='BBOV'">
                <xsl:choose>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Crossbreed', $smallcase, $uppercase)">XB</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Beefmaster', $smallcase, $uppercase)">BM</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Black Angus', $smallcase, $uppercase)">AN</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Brahma', $smallcase, $uppercase)">BR</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Braunvieh', $smallcase, $uppercase)">BU</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Charolais', $smallcase, $uppercase)">CH</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Corriente', $smallcase, $uppercase)">MC</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Galloway', $smallcase, $uppercase)">GA</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Gelbvieh', $smallcase, $uppercase)">GV</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Hereford', $smallcase, $uppercase)">HB</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Limousin', $smallcase, $uppercase)">LM</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Longhorn', $smallcase, $uppercase)">LH</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Maine Anjou', $smallcase, $uppercase)">MA</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Red Angus', $smallcase, $uppercase)">AR</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Salers', $smallcase, $uppercase)">SA</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Beefmaster', $smallcase, $uppercase)">BM</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Scottish Highland', $smallcase, $uppercase)">SH</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Shorthorn', $smallcase, $uppercase)">SS</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Simmental', $smallcase, $uppercase)">SM</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Unknown', $smallcase, $uppercase)">UK</xsl:when>
                    <xsl:otherwise>OTH</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="translate($species, $smallcase, $uppercase)='DBOV'">
                <xsl:choose>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Brown Swiss', $smallcase, $uppercase)">SB</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Guernesey', $smallcase, $uppercase)">GU</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Holstein', $smallcase, $uppercase)">HO</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Jersey', $smallcase, $uppercase)">JE</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Unknown', $smallcase, $uppercase)">UK</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Other PB', $smallcase, $uppercase)">OTH</xsl:when>
                    <xsl:otherwise>OTH</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="translate($species, $smallcase, $uppercase)='EQU'">
                <xsl:choose>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Grade', $smallcase, $uppercase)">GX</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Appaloosa', $smallcase, $uppercase)">AP</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Arabian', $smallcase, $uppercase)">AD</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Belgian', $smallcase, $uppercase)">GI</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Clydesdale', $smallcase, $uppercase)">CY</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Donkey', $smallcase, $uppercase)">DK</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Miniature', $smallcase, $uppercase)">OTH</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Morgan', $smallcase, $uppercase)">MN</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Mule', $smallcase, $uppercase)">ML</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Mustang', $smallcase, $uppercase)">MT</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Paint', $smallcase, $uppercase)">PT</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Percheron', $smallcase, $uppercase)">PH</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Pinto', $smallcase, $uppercase)">PN</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Pony', $smallcase, $uppercase)">PY</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Quarter Horse', $smallcase, $uppercase)">QH</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Shire', $smallcase, $uppercase)">SY</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Tennessee Walker', $smallcase, $uppercase)">TW</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Thoroughbred', $smallcase, $uppercase)">TH</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Warmblood', $smallcase, $uppercase)">WM</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Zebra', $smallcase, $uppercase)">OTH</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Unknown', $smallcase, $uppercase)">OTH</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Other PB', $smallcase, $uppercase)">OTH</xsl:when>
                    <xsl:otherwise>OTH</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="translate($species, $smallcase, $uppercase)='OVI'">
                <xsl:choose>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Crossbreed', $smallcase, $uppercase)">XB</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Black-faced', $smallcase, $uppercase)">BF</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Cheviot', $smallcase, $uppercase)">BC</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Columbia', $smallcase, $uppercase)">CL</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Corriedale', $smallcase, $uppercase)">CR</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Cotswold', $smallcase, $uppercase)">CW</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Debouillet', $smallcase, $uppercase)">OTH</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Dorper', $smallcase, $uppercase)">DO</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Dorset', $smallcase, $uppercase)">DP</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Hampshire', $smallcase, $uppercase)">HS</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Lincoln', $smallcase, $uppercase)">LI</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Merino', $smallcase, $uppercase)">MM</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Mottle-faced', $smallcase, $uppercase)">OTH</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Natural Colored', $smallcase, $uppercase)">OTH</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Navajo-Churro', $smallcase, $uppercase)">OTH</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Rambouillet', $smallcase, $uppercase)">RG</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Romney', $smallcase, $uppercase)">RY</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Solid Face, not Black', $smallcase, $uppercase)">OTH</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Southdown', $smallcase, $uppercase)">ST</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Suffolk', $smallcase, $uppercase)">SU</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Targhee', $smallcase, $uppercase)">TA</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('White Dorper', $smallcase, $uppercase)">DO</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('White-faced', $smallcase, $uppercase)">OTH</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Unknown', $smallcase, $uppercase)">UK</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Other PB', $smallcase, $uppercase)">OTH</xsl:when>
                    <xsl:otherwise>OTH</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="translate($species, $smallcase, $uppercase)='CAP'">
                <xsl:choose>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Crossbreed', $smallcase, $uppercase)">XB</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Alpine', $smallcase, $uppercase)">AL</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Angora', $smallcase, $uppercase)">AG</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Boer', $smallcase, $uppercase)">BO</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Cashmere', $smallcase, $uppercase)">CS</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Cotswold', $smallcase, $uppercase)">OTH</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Dairy-type crossbred', $smallcase, $uppercase)">DR</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Fiber-type crossbred', $smallcase, $uppercase)">FI</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('La Mancha', $smallcase, $uppercase)">LN</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Meat-type crossbred', $smallcase, $uppercase)">MT</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Nubian', $smallcase, $uppercase)">OTH</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Pygmy', $smallcase, $uppercase)">PY</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Saanen', $smallcase, $uppercase)">SA</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Sable', $smallcase, $uppercase)">SB</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Toggenburg', $smallcase, $uppercase)">TO</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Unknown', $smallcase, $uppercase)">UNK</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Other', $smallcase, $uppercase)">OTH</xsl:when>
                    <xsl:otherwise>OTH</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="translate($species, $smallcase, $uppercase)='POR'">
                <xsl:choose>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Crossbreed', $smallcase, $uppercase)">CB</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Berkshire', $smallcase, $uppercase)">BK</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Chester White', $smallcase, $uppercase)">CW</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Duroc', $smallcase, $uppercase)">DU</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Hampshire', $smallcase, $uppercase)">HA</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Lancombe', $smallcase, $uppercase)">LC</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Landrace', $smallcase, $uppercase)">LA</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Poland', $smallcase, $uppercase)">PC</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Potbelly', $smallcase, $uppercase)">VP</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Spot', $smallcase, $uppercase)">SO</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Tamworth', $smallcase, $uppercase)">TM</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Yorkshire', $smallcase, $uppercase)">YO</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Unknown', $smallcase, $uppercase)">UNK</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Other PB', $smallcase, $uppercase)">OTH</xsl:when>
                    <xsl:otherwise>OTH</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="translate($species, $smallcase, $uppercase)='OTH'">
                <xsl:choose>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Other', $smallcase, $uppercase)">OTH</xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="translate($species, $smallcase, $uppercase)='POU'">
                <xsl:choose>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Chicken', $smallcase, $uppercase)">BRD</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Game Fowl', $smallcase, $uppercase)">BRD</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Geese', $smallcase, $uppercase)">BRD</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Pigeons', $smallcase, $uppercase)">BRD</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Rattites', $smallcase, $uppercase)">BRD</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Turkey', $smallcase, $uppercase)">BRD</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Water Fowl', $smallcase, $uppercase)">BRD</xsl:when>
                    <xsl:otherwise>OTH</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="translate($species, $smallcase, $uppercase)='CER'">
                <xsl:choose>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Black-Tailed Deer', $smallcase, $uppercase)">BRD</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Caribou', $smallcase, $uppercase)">BRD</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Deer', $smallcase, $uppercase)">BRD</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Elk', $smallcase, $uppercase)">BRD</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Elk/Red Deer X', $smallcase, $uppercase)">BRD</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Fallow Deer', $smallcase, $uppercase)">BRD</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Mule Deer', $smallcase, $uppercase)">BRD</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Mule Deer X', $smallcase, $uppercase)">BRD</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Muntjad', $smallcase, $uppercase)">BRD</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Red Deer', $smallcase, $uppercase)">BRD</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Sika Deer', $smallcase, $uppercase)">BRD</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('White-Tailed Deer', $smallcase, $uppercase)">BRD</xsl:when>
                    <xsl:otherwise>OTH</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="translate($species, $smallcase, $uppercase)='CAM'">
                <xsl:choose>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Alpaca', $smallcase, $uppercase)">AL</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Camel', $smallcase, $uppercase)">DC</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Llama', $smallcase, $uppercase)">LL</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Unknown', $smallcase, $uppercase)">UNK</xsl:when>
                    <xsl:when test="translate($breed, $smallcase, $uppercase)=translate('Other', $smallcase, $uppercase)">OTH</xsl:when>
                    <xsl:otherwise>OTH</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>OTH</xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
