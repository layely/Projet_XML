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
                <title>ajouterproduit.xsl</title>
            </head>
            <body>
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
                        
                        <div class="form-group">
                            <button type="submit" class="btn btn-default" id="submit">Ajouter</button>
                        </div>
                        
                    </div>
                </form>
            </body>
            
        </html>
    </xsl:template>

</xsl:stylesheet>
