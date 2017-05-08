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
                        <div class="col-sm-3">
                            <h3>Panier</h3>
                        </div>
                        <div class="col-sm-9">
                            <div class="row">
                                <h3>Fruis</h3>
                                <xsl:for-each select="/produits/fruit">
                                    <xsl:sort select="@type"/>
                                    <div class="col-sm-4">
                                        <p>
                                            <xsl:value-of select="@type" />
                                        </p>
                                        <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image"/>
                                    </div>
                                </xsl:for-each>
                            </div>
                            <br/>
                            <br/>
                            <div class="row">
                                <h3>Légumes</h3>
                                <xsl:for-each select="/produits/legume">
                                    <xsl:sort select="@type"/>
                                    <div class="col-sm-4">
                                        <p>
                                            <xsl:value-of select="@type" />
                                        </p>
                                        <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image"/>
                                    </div>
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
