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
                <link rel="stylesheet" href="../css/stock.css"></link>
                <title>stock.xsl</title>
            </head>
            <body>

                <div class="jumbotron">
                    <div class="container text-center">
                        <h1>Le Maraicher</h1>
                        <p>Some text that represents "Me"...</p>
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
                <div class="container-fluid bg-3 text-center">

                    <br/>
                    <div class="row">
                        <div class="col-sm-2">
                        </div>
                        <div class="col-sm-9 panel panel-default">
                            <div class="row">
                                <h2>Fruits</h2>
                                <xsl:for-each select="/produits/fruit">
                                    <xsl:sort select="@type"/>
                                    <div class="col-sm-12">
                                        <div class="col-sm-2">
                                            <img src="../img/fruit.jpg" class="img-responsive" style="width:100%" alt="Image"/>
                                        </div>
                                        <div class="col-sm-9 text-left">
                                            <div class="row">
                                                <h3>
                                                 &#160;&#160;
                                                    <xsl:value-of select="@type" />&#160;&#160;&#160;&#160;
                                                    <small>
                                                        <xsl:value-of select="note" />
                                                    </small>
                                                </h3>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-6 text-bottom">
                                                    <p>
                                                        Origine:&#160;
                                                        <xsl:value-of select="origine/@region" />
                                                        (<xsl:value-of select="origine" />)
                                                        <br/>
                                                        Producteur:&#160;
                                                        <xsl:value-of select="producteur" />
                                                    </p>
                                                    <p>
                                                        En stock:&#160;
                                                        <xsl:value-of select="qtity" />
                                                    </p>
                                                </div>
                                                <div class="col-sm-4">
                                                    <h3>
                                                        <xsl:value-of select="@prix" />
                                                        <sup>Frs</sup>
                                                    </h3>
                                                </div>
                                                <div class="col-sm-2 text-bottom form-group">
                                                    <button  class="btn btn-default btn-lg" data-toggle="modal" data-target="#{@type}" id="">Modifier</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    &#160;
                                    <!-- Modal -->
                                    <div id="{@type}" class="modal fade" role="dialog">
                                        <div class="modal-dialog">

                                            <!-- Modal content-->
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal">Close</button>
                                                    <h4 class="modal-title">Modifier un produit </h4>
                                                </div>
                                                <div class="modal-body">
                                                    <form method="GET" action="../php/modifier_produit.php">
                                                        <div class="col-sm-12">
                                                            <div class="form-group">
                                                                <!--<button class="btn btn-default">Ajouter au panier</button>-->
                                                                <label for="pays">Sélectionner le type du produit<span class="obligatoire">*</span></label>
                                                                <br />
                                                                <select name="type" id="type" class="form-control" placeholder="fruit ou légume">
                                                                    <option value="fruit" selected="">Fruit</option>
                                                                    <option value="légume">Légume</option>
                                                                </select>
                                                            </div>
                                                            <div class="form-group">
                                                                <!--<button class="btn btn-default">Ajouter au panier</button>-->
                                                                <label for="nom">Nom:<span class="obligatoire">*</span></label>
                                                                <input type="text" class="form-control" placeholder="ex: clementine" name="nom" value="{@type}" id="nom" required=""/>
                                                            </div>
                                                            <div class="form-group">
                                                                <!--<button class="btn btn-default">Ajouter au panier</button>-->
                                                                <label for="prix">Prix:<span class="obligatoire">*</span></label>
                                                                <input type="number" min="1" class="form-control" placeholder="prix" value="{@prix}" name="prix" id="prix" required=""/>
                                                            </div>
                                                            <div class="form-group">
                                                                <!--<button class="btn btn-default">Ajouter au panier</button>-->
                                                                <label for="prix">Calibre:<span class="obligatoire">*</span></label>
                                                                <input type="number" min="1" max="3" class="form-control" placeholder="1,2 ou 3" value="{@calibre}" name="calibre" id="calibre" required=""/>
                                                            </div>
                                                            <div class="form-group">
                                                                <!--<button class="btn btn-default">Ajouter au panier</button>-->
                                                                <label for="producteur">Producteur:<span class="obligatoire">*</span></label>
                                                                <input type="text" class="form-control" placeholder="ex: Production Bastia" value="{producteur}" name="producteur" id="producteur" required=""/>
                                                            </div>
                                                            <div class="form-group">
                                                                <!--<button class="btn btn-default">Ajouter au panier</button>-->
                                                                <label for="origine">Origine:<span class="obligatoire">*</span></label>
                                                                <input type="text" class="form-control" placeholder="Pays d'origine" value="{origine}" name="origine" id="origine" required=""/>
                                                            </div>
                                                            <div class="form-group">
                                                                <!--<button class="btn btn-default">Ajouter au panier</button>-->
                                                                <label for="region">Région:</label>
                                                                <input type="text" class="form-control" placeholder="région d'origine" value="{origine/@region}" name="region" id="region"/>
                                                            </div>
                                                            <div class="form-group">
                                                                <!--<button class="btn btn-default">Ajouter au panier</button>-->
                                                                <label for="qtity">Quantité:<span class="obligatoire">*</span></label>
                                                                <input type="number" min='1' class="form-control" value="{qtity}" placeholder="" name="qtity" id="qtity"/>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="bio">bio</label>
                                                                <input type="checkbox" class="form-control" name="bio" id="bio"/> 
                                                            </div>
                                                            <div class="form-group">
                                                                <!--<button class="btn btn-default">Ajouter au panier</button>-->
                                                                <label for="Note">Note:</label>
                                                                <textarea type="text" class="form-control" placeholder="Description supplémentaire" value="{note}" name="note" id="note"/>
                                                            </div>
                                                            <div class="form-group" style="display: none">
                                                                <input type="text" class="form-control" name="typeAModifier" id="aModifier" value="fruit"/> 
                                                            </div>
                                                            <div class="form-group" style="display: none">
                                                                <input type="text" class="form-control" name="nomAModifier" id="aModifier" value="{@type}"/> 
                                                            </div>
                                                            <div class="form-group">
                                                                <button type="submit" class="btn btn-default" id="submit">Modifier</button>
                                                            </div>
                                                        </div>
                                                    </form>
                                                    
                                                </div>
                                                <div class="modal-footer">
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <hr/>
                                </xsl:for-each>
                            </div>
                            <br/>
                            <br/>
                            <div class="row">
                                <h2>Légumes</h2>
                                <xsl:for-each select="/produits/legume">
                                    <xsl:sort select="@type"/>
                                    <div class="col-sm-12">
                                        <div class="col-sm-2">
                                            <img src="../img/legume.jpg" class="img-responsive" style="width:100%" alt="Image"/>
                                        </div>
                                        <div class="col-sm-9 text-left">
                                            <div class="row">
                                                <h3>
                                                 &#160;&#160;
                                                    <xsl:value-of select="@type" />&#160;&#160;&#160;&#160;
                                                    <small>
                                                        <xsl:value-of select="note" />
                                                    </small>
                                                </h3>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-6 text-bottom">
                                                    <p>
                                                        Origine:&#160;
                                                        <xsl:value-of select="origine/@region" />
                                                        (<xsl:value-of select="origine" />)
                                                        <br/>
                                                        Producteur:&#160;
                                                        <xsl:value-of select="producteur" />
                                                    </p>
                                                    <p>
                                                        En stock:&#160;
                                                        <xsl:value-of select="qtity" />
                                                    </p>
                                                </div>
                                                <div class="col-sm-4">
                                                    <h3>
                                                        <xsl:value-of select="@prix" />
                                                        <sup>Frs</sup>
                                                    </h3>
                                                </div>
                                                <div class="col-sm-2 text-bottom form-group">
                                                    <button  class="btn btn-default btn-lg" data-toggle="modal" data-target="#{@type}" id="">Modifier</button>
                                                </div>                                            
                                            </div>
                                        </div>
                                    </div>
                                    &#160;
                                    <!-- Modal -->
                                    <div id="{@type}" class="modal fade" role="dialog">
                                        <div class="modal-dialog">

                                            <!-- Modal content-->
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal">hello</button>
                                                    <h4 class="modal-title">Modal Header</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <p>Some text in the modal.</p>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <hr/>
                                </xsl:for-each>
                            </div>
                                
                        </div>
                    </div>
                    <br/>

                </div>
                <br/>
                <br/>
                <footer class="container-fluid text-center">
                    <h2>C'est à nous de réinventer l'agriculture</h2>
                </footer>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
