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
                <script src="../js/spinner.js"></script>
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
                        <div class="col-sm-3 panel panel-default" id="panier">
                            <h2>Panier</h2>
                            <table class="table">
                                <tr>
                                    <th>Nom</th>
                                    <th>Prix</th>
                                    <th>Qtité</th>
                                    <th>Total</th>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                        <input type="text" class="form-control" value="42"/>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                            </table>
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
                                                <div class="col-sm-2 text-bottom">
                                                    <button class="btn btn-default">Ajouter au panier</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    &#160;
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
                                                <div class="col-sm-2 text-bottom">
                                                    <button class="btn btn-default">Ajouter au panier</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    &#160;
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
