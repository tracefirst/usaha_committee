<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">
    
    <!-- This is a placeholder for a lookup table to standard species codes -->
    <xsl:template name="Species">
        <xsl:param name="species"/>
        <xsl:choose>
            <xsl:when test="$species ='BBOV'">BOV</xsl:when>
            <xsl:when test="$species ='DBOV'">BOV</xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$species"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- This is a placeholder for a lookup table to standard codes -->
    <xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'"/>
    <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>

    <xsl:template name="Breed">
        <xsl:param name="species"/>
        <xsl:param name="breed"/>
        <xsl:choose>
            <xsl:when test="$species='BBOV'">
                <xsl:choose>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Crossbreed', $smallcase, $uppercase)"
                        >XB</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Beefmaster', $smallcase, $uppercase)"
                        >BM</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Black Angus', $smallcase, $uppercase)"
                        >AN</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Brahma', $smallcase, $uppercase)"
                        >BR</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Braunvieh', $smallcase, $uppercase)"
                        >BU</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Charolais', $smallcase, $uppercase)"
                        >CH</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Corriente', $smallcase, $uppercase)"
                        >MC</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Galloway', $smallcase, $uppercase)"
                        >GA</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Gelbvieh', $smallcase, $uppercase)"
                        >GV</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Hereford', $smallcase, $uppercase)"
                        >HB</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Limousin', $smallcase, $uppercase)"
                        >LM</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Longhorn', $smallcase, $uppercase)"
                        >LH</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Maine Anjou', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <!-- TODO Map the rest of them! -->
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Red Angus', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Salers', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Beefmaster', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Scottish Highland', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Shorthorn', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Simmental', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Unknown', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="translate($species, $smallcase, $uppercase)='DBOV'">
                <xsl:choose>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Brown Swiss', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Guernesey', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Holstein', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Jersey', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Unknown', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Other PB', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="translate($species, $smallcase, $uppercase)='EQU'">
                <xsl:choose>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Grade', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Appaloosa', $smallcase, $uppercase)"
                        >AP</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Arabian', $smallcase, $uppercase)"
                        >AD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Belgian', $smallcase, $uppercase)"
                        >GI</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Clydesdale', $smallcase, $uppercase)"
                        >CY</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Donkey', $smallcase, $uppercase)"
                        >DK</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Miniature', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Morgan', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Mule', $smallcase, $uppercase)"
                        >ML</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Mustang', $smallcase, $uppercase)"
                        >MT</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Paint', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Percheron', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Pinto', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Pony', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Quarter Horse', $smallcase, $uppercase)"
                        >QH</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Shire', $smallcase, $uppercase)"
                        >SY</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Tennessee Walker', $smallcase, $uppercase)"
                        >TW</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Thoroughbred', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Pinto', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Warmblood', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Zebra', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Unknown', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Other PB', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="translate($species, $smallcase, $uppercase)='OVI'">
                <xsl:choose>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Crossbreed', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Black-faced', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Cheviot', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Columbia', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Corriedale', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Cotswold', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Debouillet', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Dorper', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Dorset', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Hampshire', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Lincoln', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Merino', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Mottle-faced', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Natural Colored', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Navajo-Churro', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Rambouillet', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Romney', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Solid Face, not Black', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Southdown', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Suffolk', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Targhee', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('White Dorper', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('White-faced', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Unknown', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Other PB', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="translate($species, $smallcase, $uppercase)='CAP'">
                <xsl:choose>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Crossbreed', $smallcase, $uppercase)"
                        >XB</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Alpine', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Angora', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Boer', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Cashmere', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Cotswold', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Dairy-type crossbred', $smallcase, $uppercase)"
                        >XD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Fiber-type crossbred', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('La Mancha', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Meat-type crossbred', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Nubian', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Pygmy', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Saanen', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Sable', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Toggenburg', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Unknown', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Other', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="translate($species, $smallcase, $uppercase)='POR'">
                <xsl:choose>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Crossbreed', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Berkshire', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Chester White', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Duroc', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Hampshire', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Lancombe', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Landrace', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Poland', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Potbelly', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Spot', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Tamworth', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Yorkshire', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Unknown', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Other PB', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="translate($species, $smallcase, $uppercase)='OTH'">
                <xsl:choose>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Other', $smallcase, $uppercase)"
                        >???</xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="translate($species, $smallcase, $uppercase)='POU'">
                <xsl:choose>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Chicken', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Game Fowl', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Geese', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Pigeons', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Rattites', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Turkey', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Water Fowl', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="translate($species, $smallcase, $uppercase)='CER'">
                <xsl:choose>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Black-Tailed Deer', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Caribou', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Deer', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Elk', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Elk/Red Deer X', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Fallow Deer', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Mule Deer', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Mule Deer X', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Muntjad', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Red Deer', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Sika Deer', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('White-Tailed Deer', $smallcase, $uppercase)"
                        >BRD</xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="translate($species, $smallcase, $uppercase)='CAM'">
                <xsl:choose>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Alpaca', $smallcase, $uppercase)"
                        >AL</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Camel', $smallcase, $uppercase)"
                        >DC</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Llama', $smallcase, $uppercase)"
                        >LL</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Unknown', $smallcase, $uppercase)"
                        >UNK</xsl:when>
                    <xsl:when
                        test="translate($breed, $smallcase, $uppercase)=translate('Other', $smallcase, $uppercase)"
                        >OTH</xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>OTH</xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>