<?xml version="1.0" encoding="UTF-8"?>

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
                <link rel="stylesheet" href="../css/ajouterProduit.css"></link>
                <link rel="stylesheet" href="../css/stock.css"></link>
                <title>ajouterproduit.xsl</title>
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
                    <div class="panel panel-default col-sm-10">
                        <div class="row text-center">
                            <h2>Ajouter un nouveau produit</h2>
                        </div>
                        <hr/>
                        <div class="row">
                            <form method="GET" action="../php/ajouterProduit.php">
                                <div class="col-sm-2">
                                </div>
                                <div class="col-sm-9">
                                    <div class="form-group">
                                        <!--<button class="btn btn-default">Ajouter au panier</button>-->
                                        <label for="pays">Sélectionner le type du produit<span class="obligatoire">*</span></label>
                                        <br />
                                        <select name="type" id="type" class="form-control" placeholder="fruit ou légume">
                                            <option value="rien"></option>
                                            <option value="fruit">Fruit</option>
                                            <option value="légume">Légume</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <!--<button class="btn btn-default">Ajouter au panier</button>-->
                                        <label for="nom">Nom:<span class="obligatoire">*</span></label>
                                        <input type="text" class="form-control" placeholder="ex: clementine" name="nom" id="nom" required=""/>
                                    </div>
                                    <div class="form-group">
                                        <!--<button class="btn btn-default">Ajouter au panier</button>-->
                                        <label for="prix">Prix:<span class="obligatoire">*</span></label>
                                        <input type="number" min="1" class="form-control" placeholder="prix" name="prix" id="prix" required=""/>
                                    </div>
                                    <div class="form-group">
                                        <!--<button class="btn btn-default">Ajouter au panier</button>-->
                                        <label for="prix">Calibre:<span class="obligatoire">*</span></label>
                                        <input type="number" min="1" max="3" class="form-control" placeholder="1,2 ou 3" name="calibre" id="calibre" required=""/>
                                    </div>
                                    <div class="form-group">
                                        <!--<button class="btn btn-default">Ajouter au panier</button>-->
                                        <label for="producteur">Producteur:<span class="obligatoire">*</span></label>
                                        <input type="text" class="form-control" placeholder="ex: Production Bastia" name="producteur" id="producteur" required=""/>
                                    </div>
                                    <div class="form-group">
                                        <!--<button class="btn btn-default">Ajouter au panier</button>-->
                                        <label for="origine">Origine:<span class="obligatoire">*</span></label>
                                        <input type="text" class="form-control" placeholder="Pays d'origine" name="origine" id="origine" required=""/>
                                    </div>
                                    <div class="form-group">
                                        <!--<button class="btn btn-default">Ajouter au panier</button>-->
                                        <label for="region">Région:</label>
                                        <input type="text" class="form-control" placeholder="région d'origine" name="region" id="region"/>
                                    </div>
                                    <div class="form-group">
                                        <!--<button class="btn btn-default">Ajouter au panier</button>-->
                                        <label for="qtity">Quantité:<span class="obligatoire">*</span></label>
                                        <input type="number" min='1' class="form-control" placeholder="" name="qtity" id="qtity"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="bio">bio</label>
                                        <input type="checkbox" class="form-control" name="bio" id="bio"/> 
                                    </div>
                                    <div class="form-group">
                                        <!--<button class="btn btn-default">Ajouter au panier</button>-->
                                        <label for="Note">Note:</label>
                                        <textarea type="text" class="form-control" placeholder="Description supplémentaire" name="note" id="note"/>
                                    </div>
                        
                                    <div class="form-group btn-block">
                                        <button type="submit" class="btn btn-default" id="submit">Ajouter</button>
                                    </div>
                                </div>
                                
                            </form>
                        </div>
                    </div>
                    <div class="col-sm-1">
                    </div>
                </div>
            </body>
            
        </html>
    </xsl:template>

</xsl:stylesheet>
