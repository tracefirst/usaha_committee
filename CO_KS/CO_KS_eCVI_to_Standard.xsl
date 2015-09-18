<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns="http://www.usaha.org/xmlns/ecvi" xmlns:ecvi="http://www.usaha.org/xmlns/ecvi"
    xmlns:my="http://www.clemson.edu/public/lph/StdECVI"
    xmlns:xfa="http://www.xfa.org/schema/xfa-data/1.0/">
    <xsl:output indent="yes" method="xml"/>
    <xsl:strip-space elements="*"/>
    <!-- Get the terrible lookup code stuff out into its own file.  -->
    <xsl:include href="./SpeciesBreedTrans.xsl"/>

    <xsl:template match="/eCVI">
        <xsl:element name="eCVI">
            <xsl:attribute name="CviNumber">
                <xsl:value-of select="certificate"/>
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
            <xsl:apply-templates select="vetInspection/vetCertification"/>
            <xsl:apply-templates select="vetInspection/cviPG1/carrier/purpose"/>
            <xsl:apply-templates select="vetInspection/cviPG1/consignor"/>
            <xsl:apply-templates select="vetInspection/cviPG1/consignee"/>
            <xsl:apply-templates select="vetInspection/cviPG1/consignor/ownerAdd"/>
            <xsl:apply-templates select="vetInspection/cviPG1/consignee/ownerAdd"/>
            <xsl:call-template name="Accessions"/>
            <xsl:if test="vetInspection/cviPG1/species/large/table/item/headCt!=''">
                <xsl:call-template name="LargeAnimal">
                    <xsl:with-param name="table" select="vetInspection/cviPG1/species/large/table"/>
                </xsl:call-template> 
            </xsl:if>
            <xsl:if test="vetInspection/cviPG1/species/large/table/item/headCt!=''">
                <xsl:call-template name="LargeAnimalGroup">
                    <xsl:with-param name="table" select="vetInspection/cviPG1/species/large/table"/>
                </xsl:call-template>
            </xsl:if>
            <!-- Don't test for number, just assume one if not provided. -->
            <xsl:if test="vetInspection/cviPG1/species/small/table/item/spp!=''">
                <xsl:call-template name="SmallAnimal">
                    <xsl:with-param name="table" select="vetInspection/cviPG1/species/small/table"/>
                </xsl:call-template>
            </xsl:if> 
            <xsl:if test="vetInspection/cviPG1/species/small/table/item/headCt!=''">
                <xsl:call-template name="SmallAnimalGroup">
                    <xsl:with-param name="table" select="vetInspection/cviPG1/species/small/table"/>
                </xsl:call-template>
            </xsl:if>
        </xsl:element>
    </xsl:template>

    <xsl:template match="eCVI/vetInspection/vetCertification">
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
                    <xsl:value-of select="../../printedName"/>
                </xsl:element>
                <xsl:if test="phoneNum and phoneNum!=''">
                    <xsl:element name="Phone">
                        <xsl:attribute name="Type">Unknown</xsl:attribute>
                        <xsl:attribute name="Number">
                            <xsl:value-of select="phoneNum"/>
                        </xsl:attribute>
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

    <xsl:template match="eCVI/vetInspection/cviPG1/carrier/purpose">
        <xsl:element name="MovementPurposes">
            <xsl:element name="MovementPurpose">
                <xsl:call-template name="PurposeMap">
                    <xsl:with-param name="purpose" select="."/>
                </xsl:call-template>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template match="eCVI/vetInspection/cviPG1/consignor">
        <xsl:element name="Origin">
            <xsl:call-template name="OriginDestination">
                <xsl:with-param name="data" select="."/>
            </xsl:call-template>
        </xsl:element>
    </xsl:template>

    <xsl:template match="eCVI/vetInspection/cviPG1/consignee">
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
                <xsl:choose>
                    <xsl:when test="$data/lName!='' and $data/fName!=''">
                        <xsl:value-of select="$data/lName"/>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="$data/fName"/>
                    </xsl:when>
                    <xsl:when test="$data/lName!='' and $data/fName=''">
                        <xsl:value-of select="$data/lName"/>
                    </xsl:when>
                    <xsl:when test="$data/lName='' and $data/fName!=''">
                        <xsl:value-of select="$data/fName"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:element>
            <xsl:if test="$data/phoneNum and $data/phoneNum!=''">
                <xsl:element name="Phone">
                    <xsl:attribute name="Type">Unknown</xsl:attribute>
                    <xsl:attribute name="Number">
                        <xsl:value-of select="$data/phoneNum"/>
                    </xsl:attribute>
                </xsl:element>
            </xsl:if>
        </xsl:element>
    </xsl:template>

    <xsl:template match="eCVI/vetInspection/cviPG1/consignor/ownerAdd">
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

    <xsl:template match="eCVI/vetInspection/cviPG1/consignee/ownerAdd">
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

    <xsl:template name="LargeAnimal">
        <xsl:param name="table"/>
        <xsl:for-each select="$table/item">
            <xsl:variable name="head" select="headCt"/>
            <xsl:if test="number($head) = 1">
                <xsl:element name="Animal">
                    <xsl:if test="./Age and ./Age != '' ">
                        <xsl:attribute name="Age">
                            <xsl:call-template name="Age">
                                <xsl:with-param name="item" select="."/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:attribute name="SpeciesCode">
                        <xsl:call-template name="Species">
                            <xsl:with-param name="species" select="spp"/>
                        </xsl:call-template>
                    </xsl:attribute>
                    <xsl:if test="./breed and ./breed != ''">
                        <xsl:attribute name="Breed">
                            <xsl:call-template name="Breed">
                                <xsl:with-param name="species" select="spp"/>
                                <xsl:with-param name="breed" select="breed"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:attribute name="Sex">
                        <xsl:call-template name="Sex">
                            <xsl:with-param name="sex" select="sex"/>
                        </xsl:call-template>
                    </xsl:attribute>
                    <xsl:attribute name="InspectionDate">
                        <xsl:value-of select="../../../../inspDate"/>
                    </xsl:attribute>
                    <xsl:element name="AnimalTag">
                        <xsl:attribute name="Number">
                            <xsl:value-of select="./offID"/>
                        </xsl:attribute>
                    </xsl:element>
                    <xsl:if test="./eiaResult != 'N/A' and ./eiaResult != ''">
                        <xsl:element name="Test">
                            <xsl:attribute name="idref">EIA<xsl:value-of select="./itemIndex"
                                /></xsl:attribute>
                            <xsl:attribute name="TestCode">EIA</xsl:attribute>
                            <xsl:element name="Result">
                                <xsl:attribute name="ResultName">RESULT</xsl:attribute>
                                <xsl:element name="ResultString">
                                    <xsl:value-of select="./eiaResult"/>
                                </xsl:element>
                            </xsl:element>
                        </xsl:element>
                    </xsl:if>
                    <xsl:if test="./brucResult != 'N/A' and ./brucResult != ''">
                        <xsl:element name="Test">
                            <xsl:attribute name="idref">BRUC<xsl:value-of select="./itemIndex"
                                /></xsl:attribute>
                            <xsl:attribute name="TestCode">BRUC</xsl:attribute>
                            <xsl:element name="Result">
                                <xsl:attribute name="ResultName">RESULT</xsl:attribute>
                                <xsl:element name="ResultString">
                                    <xsl:value-of select="./brucResult"/>
                                </xsl:element>
                            </xsl:element>
                        </xsl:element>
                    </xsl:if>
                </xsl:element>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="LargeAnimalGroup">
        <xsl:param name="table"/>
        <xsl:for-each select="$table/item">
            <xsl:variable name="head" select="headCt"/>
            <xsl:if test="number($head) > 1">
                <xsl:element name="GroupLot">
                    <xsl:attribute name="Quantity">
                        <xsl:value-of select="headCt"/>
                    </xsl:attribute>
                    <xsl:attribute name="SpeciesCode">
                        <xsl:call-template name="Species">
                            <xsl:with-param name="species" select="spp"/>
                        </xsl:call-template>
                    </xsl:attribute>
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
                    <!-- Why did we leave this out?
                    <xsl:attribute name="InspectionDate">
                        <xsl:value-of select="../../../../inspDate"/>
                    </xsl:attribute>
                    -->
                    <xsl:attribute name="Description">
                        <xsl:value-of select="description"/>
                    </xsl:attribute>
                </xsl:element>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="SmallAnimal">
        <xsl:param name="table"/>
        <xsl:for-each select="$table/item">
            <xsl:variable name="head" select="headCt"/>
            <xsl:if test="$head = '' or number($head) = 1">
                <xsl:element name="Animal">
                    <!-- CO/KS Small Animal Age is unstructured so not reliably translateable -->
                    <!-- CO/KS Small Animal Species allows free text!!! -->
                    <xsl:attribute name="SpeciesCode">
                        <xsl:call-template name="Species">
                            <xsl:with-param name="species" select="spp"/>
                        </xsl:call-template>
                    </xsl:attribute>
                    <xsl:attribute name="Sex">
                        <xsl:call-template name="Sex">
                            <xsl:with-param name="sex" select="sex"/>
                        </xsl:call-template>
                    </xsl:attribute>
                    <xsl:attribute name="InspectionDate">
                        <xsl:value-of select="../../../../inspDate"/>
                    </xsl:attribute>
                    
                    <xsl:element name="AnimalTag">
                        <xsl:attribute name="Number">
                            <xsl:value-of select="rabiesTag"/>
                        </xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:if>
         </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="SmallAnimalGroup">
        <xsl:param name="table"/>
        <xsl:for-each select="$table/item">
            <xsl:variable name="head" select="headCt"/>
             <xsl:if test="number($head) > 1">
                <xsl:element name="GroupLot">
                    <xsl:attribute name="Quantity">
                        <xsl:value-of select="headCt"/>
                    </xsl:attribute>
                    <xsl:attribute name="SpeciesCode">
                        <xsl:call-template name="Species">
                            <xsl:with-param name="species" select="spp"/>
                        </xsl:call-template>
                    </xsl:attribute>
                    <xsl:attribute name="Sex">
                        <xsl:call-template name="Sex">
                            <xsl:with-param name="sex" select="sex"/>
                        </xsl:call-template>
                    </xsl:attribute>
                    <!-- Why did we leave this out?
                    <xsl:attribute name="InspectionDate">
                        <xsl:value-of select="../../../../inspDate"/>
                    </xsl:attribute>
                    -->
                    <xsl:attribute name="Description">
                        <xsl:if test="not(description) or description=''">No Description Entered</xsl:if>
                        <xsl:value-of select="description"/>
                    </xsl:attribute>
                </xsl:element>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="Age">
        <xsl:param name="item"/>
        <xsl:value-of select="$item/ageNum"/>
        <xsl:call-template name="AgeTime">
            <xsl:with-param name="ageTime" select="$item/ageTime"/>
        </xsl:call-template>
    </xsl:template>
    
    <!-- Translate from simple English time interval abbreviations to UCUM units -->
    <xsl:template name="AgeTime">
        <xsl:param name="ageTime"/>
        <xsl:choose>
            <xsl:when test="$ageTime = 'Y'">
                <xsl:text>a</xsl:text>
            </xsl:when>
            <xsl:when test="$ageTime = 'M'">
                <xsl:text>mo</xsl:text>
            </xsl:when>
            <xsl:when test="$ageTime = 'W'">
                <xsl:text>wk</xsl:text>
            </xsl:when>
            <xsl:when test="$ageTime = 'D'">
                <xsl:text>d</xsl:text>
            </xsl:when>
            <!-- Is this the appropriate way to react to no age units? -->
            <xsl:when test="$ageTime = null or $ageTime = ''">
                <xsl:text>a</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$ageTime"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Known bug.  Does not combine tests into accession if they share accession number and date. -->
    <xsl:template name="Accessions">
        <xsl:if
            test="/eCVI/vetInspection/cviPG1/species/large/table/item and (
               /eCVI/vetInspection/cviPG1/species/large/table/item[eiaTestDate != 'N/A' and eiaTestDate != 'n/a' and eiaTestDate != '']
            or /eCVI/vetInspection/cviPG1/species/large/table/item[brucTestDate != 'N/A' and brucTestDate != 'n/a' and brucTestDate != ''] )">

            <xsl:element name="Accessions">
                <xsl:for-each
                    select="/eCVI/vetInspection/cviPG1/species/large/table/item[eiaTestDate != 'N/A' and eiaTestDate != '']">
                    <xsl:element name="Accession">
                        <xsl:attribute name="id">EIA<xsl:value-of select="./itemIndex"
                            /></xsl:attribute>
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
                    select="/eCVI/vetInspection/cviPG1/species/large/table/item[brucTestDate != 'N/A' and brucTestDate != '']">
                    <xsl:element name="Accession">
                        <xsl:attribute name="id">BRUC<xsl:value-of select="./itemIndex"
                            /></xsl:attribute>
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
        </xsl:if>
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
            <xsl:otherwise>Gender Unknown</xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="PurposeMap">
        <xsl:param name="purpose"/>
        <xsl:choose>
            <xsl:when
                test="translate($purpose, $smallcase, $uppercase) = 
                      translate('Backgrounding', $smallcase, $uppercase) ">other</xsl:when>
            <xsl:when
                test="translate($purpose, $smallcase, $uppercase) = 
                      translate('Breeding', $smallcase, $uppercase) ">breeding</xsl:when>
            <xsl:when
                test="translate($purpose, $smallcase, $uppercase) = 
                      translate('Feeding', $smallcase, $uppercase) ">feeding</xsl:when>
            <xsl:when
                test="translate($purpose, $smallcase, $uppercase) = 
                      translate('Grazing', $smallcase, $uppercase) ">grazing</xsl:when>
            <xsl:when
                test="translate($purpose, $smallcase, $uppercase) = 
                      translate('Medical Treatment', $smallcase, $uppercase) ">medicalTreatment</xsl:when>
            <xsl:when
                test="translate($purpose, $smallcase, $uppercase) = 
                      translate('Other (specify)', $smallcase, $uppercase) ">other</xsl:when>
            <xsl:when
                test="translate($purpose, $smallcase, $uppercase) = 
                      translate('Pet', $smallcase, $uppercase) ">pet</xsl:when>
            <xsl:when
                test="translate($purpose, $smallcase, $uppercase) = 
                      translate('Pet Movement', $smallcase, $uppercase) ">pet</xsl:when>
            <xsl:when
                test="translate($purpose, $smallcase, $uppercase) = 
                      translate('Production', $smallcase, $uppercase) ">other</xsl:when>
            <xsl:when
                test="translate($purpose, $smallcase, $uppercase) = 
                      translate('Race', $smallcase, $uppercase) ">race</xsl:when>
            <xsl:when
                test="translate($purpose, $smallcase, $uppercase) = 
                      translate('Recreational', $smallcase, $uppercase) ">other</xsl:when>
            <xsl:when
                test="translate($purpose, $smallcase, $uppercase) = 
                      translate('Rodeo', $smallcase, $uppercase) ">rodeo</xsl:when>
            <xsl:when
                test="translate($purpose, $smallcase, $uppercase) = 
                      translate('Sale', $smallcase, $uppercase) ">sale</xsl:when>
            <xsl:when
                test="translate($purpose, $smallcase, $uppercase) = 
                      translate('Show/Exhibition', $smallcase, $uppercase) ">show</xsl:when>
            <xsl:when
                test="translate($purpose, $smallcase, $uppercase) = 
                      translate('Show', $smallcase, $uppercase) ">show</xsl:when>
            <xsl:when
                test="translate($purpose, $smallcase, $uppercase) = 
                      translate('Show/Sale', $smallcase, $uppercase) ">show</xsl:when>
            <xsl:when
                test="translate($purpose, $smallcase, $uppercase) = 
                      translate('Slaughter', $smallcase, $uppercase) ">slaughter</xsl:when>
            <xsl:when
                test="translate($purpose, $smallcase, $uppercase) = 
                      translate('Training', $smallcase, $uppercase) ">training</xsl:when>
            <xsl:when
                test="translate($purpose, $smallcase, $uppercase) = 
                      translate('Transit', $smallcase, $uppercase) ">other</xsl:when>
            <xsl:otherwise>other</xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
