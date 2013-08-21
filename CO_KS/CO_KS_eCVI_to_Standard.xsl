<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns="StateVet"
    xmlns:my="http://www.clemson.edu/public/lph/StdECVI">
    <xsl:output indent="yes" method="xml"/>
    <xsl:strip-space elements="*"/>
    <!-- Get the terrible lookup code stuff out into its own file.  -->
    <xsl:include href="./SpeciesBreedTrans.xsl"/>

    <xsl:template match="/">
        <xsl:apply-templates select="/eCVI"/>
    </xsl:template>

    <xsl:template match="eCVI">
        <xsl:element name="eCVI">
            <xsl:attribute name="CviNumber">
                <xsl:value-of select="certificate"/>
            </xsl:attribute>
            <xsl:attribute name="SpeciesCode">
                <xsl:call-template name="Species"/>
            </xsl:attribute>
            <xsl:attribute name="InspectionDate">
                <xsl:value-of select="vetInspection/cviPG1/inspDate"/>
            </xsl:attribute>
            <xsl:attribute name="IssueDate">
                <xsl:value-of select="certDate"/>
            </xsl:attribute>
            <xsl:attribute name="ExpirationDate">
                <xsl:value-of select="certDate"/>
            </xsl:attribute>
            <xsl:if test="vetInspection/cviPG1/shipDate and vetInspection/cviPG1/shipDate!=''">
                <xsl:attribute name="ShipmentDate">
                    <xsl:value-of select="vetInspection/cviPG1/shipDate"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="entryPermit and entryPermit!=''">
                <xsl:attribute name="EntryPermitNumber">
                    <xsl:value-of select="entryPermit"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates select="/eCVI/vetInspection/vetCertification"/>
            <xsl:apply-templates select="/eCVI/vetInspection/cviPG1/carrier/purpose"/>
            <xsl:apply-templates select="/eCVI/vetInspection/cviPG1/consignor"/>
            <xsl:apply-templates select="/eCVI/vetInspection/cviPG1/consignee"/>
            <xsl:apply-templates select="/eCVI/vetInspection/cviPG1/consignor/ownerAdd"/>
            <xsl:apply-templates select="/eCVI/vetInspection/cviPG1/consignee/ownerAdd"/>
            <xsl:call-template name="Accessions"/>
            <xsl:apply-templates select="/eCVI/vetInspection/cviPG1/species/large/table"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="/eCVI/vetInspection/vetCertification">
        <xsl:element name="Veterinarian">
            <xsl:if test="licenseNumber and licenseNumber!=''">
                <xsl:attribute name="LicenseNumber">
                    <xsl:value-of select="licenseNumber"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="usdaNumber and usdaNumber!=''">
                <xsl:attribute name="NationalAccreditationNumber">
                    <xsl:value-of select="usdaNumber"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:element name="Person">
                <xsl:element name="Name">
                    <xsl:value-of select="/eCVI/printedName"/>
                </xsl:element>
                <xsl:if test="phoneNum and phoneNum!=''">
                    <xsl:element name="Phone">
                        <xsl:attribute name="Type">Unknown</xsl:attribute>
                        <xsl:attribute name="Number" select="phoneNum"/>
                    </xsl:element>
                </xsl:if>
            </xsl:element>
            <xsl:element name="Address">
                <xsl:element name="Line1">
                    <xsl:value-of select="certAddress"/>
                </xsl:element>
                <xsl:element name="Town">
                    <xsl:value-of select="certCity"/>
                </xsl:element>
                <xsl:element name="State">
                    <xsl:value-of select="certState"/>
                </xsl:element>
                <xsl:element name="ZIP">
                    <xsl:value-of select="certZip"/>
                </xsl:element>
                <xsl:element name="Country">
                    <xsl:text>USA</xsl:text>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template match="/eCVI/vetInspection/cviPG1/carrier/purpose">
        <xsl:element name="MovementPurposes">
            <xsl:element name="MovementPurpose">
                <xsl:value-of select="translate(., $uppercase, $smallcase)"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template match="/eCVI/vetInspection/cviPG1/consignor">
        <xsl:element name="Origin">
            <xsl:call-template name="OriginDestination">
                <xsl:with-param name="data" select="."/>
            </xsl:call-template>
        </xsl:element>
    </xsl:template>

    <xsl:template match="/eCVI/vetInspection/cviPG1/consignee">
        <xsl:element name="Destination">
            <xsl:call-template name="OriginDestination">
                <xsl:with-param name="data" select="."/>
            </xsl:call-template>
        </xsl:element>
    </xsl:template>

    <xsl:template name="OriginDestination">
        <xsl:param name="data"/>
        <xsl:if test="$data/lid != ''">
            <xsl:element name="PremId">
                <xsl:value-of select="$data/lid"/>
            </xsl:element>
        </xsl:if>
        <xsl:if test="$data/busName and $data!=''">
            <xsl:element name="PremName">
                <xsl:value-of select="$data/busName"/>
            </xsl:element>
        </xsl:if>
        <xsl:element name="Address">
            <xsl:element name="Line1">
                <xsl:value-of select="$data/address"/>
            </xsl:element>
            <xsl:element name="Town">
                <xsl:value-of select="$data/city"/>
            </xsl:element>
            <xsl:element name="State">
                <xsl:value-of select="$data/state"/>
            </xsl:element>
            <xsl:element name="ZIP">
                <xsl:value-of select="$data/zipCode"/>
            </xsl:element>
            <xsl:element name="Country">
                <xsl:text>USA</xsl:text>
            </xsl:element>
        </xsl:element>
        <xsl:element name="Person">
            <xsl:element name="Name">
                <xsl:value-of select="$data/lName"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of select="$data/fName"/>
            </xsl:element>
            <xsl:if test="$data/phoneNum and $data/phoneNum!=''">
                <xsl:element name="Phone">
                    <xsl:attribute name="Type">Unknown</xsl:attribute>
                    <xsl:attribute name="Number" select="$data/phoneNum"/>
                </xsl:element>
            </xsl:if>
        </xsl:element>
    </xsl:template>

    <xsl:template match="/eCVI/vetInspection/cviPG1/consignor/ownerAdd">
        <xsl:if test=".!=''">
            <xsl:element name="Consignor">
                <xsl:element name="Person">
                    <xsl:element name="Name">
                        <xsl:value-of select="."/>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/eCVI/vetInspection/cviPG1/consignee/ownerAdd">
        <xsl:if test=".!=''">
            <xsl:element name="Consignee">
                <xsl:element name="Person">
                    <xsl:element name="Name">
                        <xsl:value-of select="."/>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/eCVI/vetInspection/cviPG1/species/large/table">
        <xsl:for-each select="item">
            <xsl:element name="Animal">
                <xsl:attribute name="Age">
                    <xsl:call-template name="Age">
                        <xsl:with-param name="item" select="."/>
                    </xsl:call-template>
                </xsl:attribute>
                <xsl:attribute name="Breed">
                    <xsl:call-template name="Breed">
                        <xsl:with-param name="species" select="spp"/>
                        <xsl:with-param name="breed" select="breed"/>
                    </xsl:call-template>
                </xsl:attribute>
                <xsl:attribute name="Sex">
                    <xsl:call-template name="Sex">
                        <xsl:with-param name="sex" select="sex"/>
                    </xsl:call-template>
                </xsl:attribute>
                <xsl:element name="AnimalTag">
                    <xsl:attribute name="Number">
                        <xsl:value-of select="./offID"/>
                    </xsl:attribute>
                </xsl:element>
                <xsl:if test="./eiaResult != 'N/A'">
                    <xsl:element name="Test">
                        <xsl:attribute name="idref">EIA<xsl:value-of select="./itemIndex"/></xsl:attribute>
                        <xsl:attribute name="TestCode">EIA</xsl:attribute>
                        <xsl:attribute name="ResultName">RESULT</xsl:attribute>
                        <xsl:element name="Result">
                            <xsl:element name="ResultString">
                                <xsl:value-of select="./eiaResult"/>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:if>
                <xsl:if test="./brucResult != 'N/A'">
                    <xsl:element name="Test">
                        <xsl:attribute name="idref">BRUC<xsl:value-of select="./itemIndex"/></xsl:attribute>
                        <xsl:attribute name="TestCode">BRUC</xsl:attribute>
                        <xsl:attribute name="ResultName">RESULT</xsl:attribute>
                        <xsl:element name="Result">
                            <xsl:element name="ResultString">
                                <xsl:value-of select="./brucResult"/>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:if>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="Age">
        <xsl:param name="item"/>
        <xsl:value-of select="$item/ageNum"/>
        <xsl:value-of select="$item/ageTime"/>
    </xsl:template>

    <xsl:template name="Accessions">
        <xsl:element name="Accessions">
            <xsl:for-each
                select="/eCVI/vetInspection/cviPG1/species/large/table/item[eiaTestDate != 'N/A' and other != '']">
                <xsl:element name="Accession">
                    <xsl:attribute name="id">EIA<xsl:value-of select="./itemIndex"/></xsl:attribute>
                    <xsl:attribute name="InfieldTest">
                        <xsl:text>false</xsl:text>
                    </xsl:attribute>
                    <xsl:element name="Laboratory">
                        <xsl:attribute name="AccessionDate">
                            <xsl:value-of select="./eiaTestDate"/>
                        </xsl:attribute>
                        <xsl:attribute name="AccessionNumber">
                            <xsl:value-of select="./other"/>
                        </xsl:attribute>
                        <xsl:element name="LabName">
                            <xsl:value-of select="./eiaLab"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:for-each>
            <xsl:for-each
                select="/eCVI/vetInspection/cviPG1/species/large/table/item[brucTestDate != 'N/A']">
                <xsl:element name="Accession">
                    <xsl:attribute name="id">BRUC<xsl:value-of select="./itemIndex"/></xsl:attribute>
                    <xsl:attribute name="InfieldTest">
                        <xsl:text>false</xsl:text>
                    </xsl:attribute>
                    <xsl:element name="Laboratory">
                        <xsl:attribute name="AccessionDate">
                            <xsl:value-of select="./brucTestDate"/>
                        </xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>


    <xsl:template name="Sex">
        <xsl:param name="sex"/>
        <xsl:choose>
            <xsl:when test="$sex ='F'">Female</xsl:when>
            <xsl:when test="$sex ='M'">Male</xsl:when>
            <xsl:when test="$sex ='C'">Neutered Male</xsl:when>
            <xsl:when test="$sex ='S'">Neutered Female</xsl:when>
            <xsl:when test="$sex ='X'">Other</xsl:when>
            <xsl:when test="$sex ='U'">Gender Unknown</xsl:when>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
