<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : visualiser_commandes.xsl
    Created on : May 15, 2017, 5:23 AM
    Author     : layely
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <xsl:template match="/">
        <html>
            <head>
                <meta charset="utf-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <script src="../lib/jquery/jquery.min.js"></script>
                <script src="../lib/bootstrap/js/bootstrap.min.js"></script>
                <link rel="stylesheet" href="../lib/bootstrap/css/bootstrap.min.css"></link>
                <link rel="stylesheet" href="../css/stock.css"></link>
                <title>visualiser_les_commandes.xsl</title>
            </head>
            <body>
                <div class="jumbotron">
                    <div class="container text-center">
                        <h1>Le Maraicher</h1>
                    </div>
                </div>
                <nav class="navbar navbar-inverse">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="#">Le maraicher</a>
                        </div>
                        <div class="collapse navbar-collapse" id="myNavbar">
                            <ul class="nav navbar-nav">
                                <li class="active">
                                    <a href="#">Home</a>
                                </li>
                                <li>
                                    <a href="#">About</a>
                                </li>
                                <li>
                                    <a href="#">Contact</a>
                                </li>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                                <li>
                                    <a href="#">
                                        <span class="glyphicon glyphicon-log-in"></span> Login</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <div class="row">
                    <div class="col-sm-1">
                    </div>
                    <div class="container-fluid bg-3 text-center panel panel-default col-sm-10">
                        <div class="row">
                            <h2>COMMANDES DES CLIENTS</h2>
                        </div>
                        <div class="row">
                            <div class="col-sm-1">
                            </div>
                            <div class="col-sm-10 panel panel-default">
                                <div class="col-sm-2">
                                    <h4>N°</h4>
                                </div>
                                <div class="col-sm-2">
                                    <h4>Client</h4>
                                </div>
                                <div class="col-sm-2">
                                    <h4>Téléphone</h4>
                                </div>
                                <div class="col-sm-2">
                                    <h4>Date</h4>
                                </div>
                                <div class="col-sm-2">
                                    <h4>Nombre d'article</h4> 
                                </div>
                                <div class="col-sm-1">
                                    <h4>Total</h4>
                                </div>
                                <div class="col-sm-1">
                            
                                </div>
                            </div>
                            <div class="col-sm-1">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-1 ">
                            </div>
                            <div class="col-sm-10">
                                <xsl:apply-templates select="//commande"/>
                            </div>
                            <div class="col-sm-1">
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-1">
                    </div>
                </div>
                
                <br/>
                <br/>
                <footer class="container-fluid text-center">
                    <h2>C'est à nous de réinventer l'agriculture</h2>
                </footer>
            </body>
            
        </html>
    </xsl:template>
    
    <xsl:template match="commande">
        <div class="row">
            <div class="col-sm-2">
                <xsl:value-of select="@numero"/>
            </div>
            <div class="col-sm-2">
                <xsl:value-of select="prenom"/>&#160;
                <xsl:value-of select="nom"/>
            </div>
            <div class="col-sm-2">
                <xsl:value-of select="telephone"/>
            </div>
            <div class="col-sm-2">
                <xsl:value-of select="@date"/>
            </div>
            <div class="col-sm-2">
                <xsl:value-of select="nombre_article"/>
            </div>
            <div class="col-sm-1">
                <b>
                    <xsl:value-of select="total_general"/>
                </b>
            </div>
            <div class="col-sm-1">
                <button class="btn btn-default" data-toggle="collapse" data-target="#{@numero}">Détails</button>
            </div>
        </div>
        <div class="row">
            <div id="{@numero}" class="collapse panel bg-yellow">
                <table class="table">
                    <caption>
                        Inventaire des produits commandés
                    </caption>
                    <tr>
                        <th class="text-center">Produit</th>
                        <th class="text-center" >Article</th>
                        <th class="text-center">Prix unitaire</th>
                        <th class="text-center">Nombre commandé</th>
                        <th class="text-center">Prix Total</th>
                    </tr>
                    <xsl:apply-templates select="produits/fruit"/>
                    <xsl:apply-templates select="produits/legume"/>
                </table>
            </div>
        </div>
        <hr/>
    </xsl:template>
    
    
    <xsl:template match="fruit">
        <tr>
            <td>Fruit</td>
            <td>
                <xsl:value-of select="@type"/>
            </td>
            <td>
                <xsl:value-of select="@prix"/>
            </td>
            <td>
                <xsl:value-of select="qtity"/>
            </td>
            <td>
                <xsl:value-of select="total"/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="legume">
        <tr>
            <td>Légume</td>
            <td>
                <xsl:value-of select="@type"/>
            </td>
            <td>
                <xsl:value-of select="@prix"/>
            </td>
            <td>
                <xsl:value-of select="qtity"/>
            </td>
            <td>
                <xsl:value-of select="total"/>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
