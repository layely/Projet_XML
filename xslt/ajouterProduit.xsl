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
                <form method="GET" action="#">
                    <div class="row">
                        <div class="col-sm-2 text-bottom form-group inline-block">
                            <!--<button class="btn btn-default">Ajouter au panier</button>-->
                            <label for="type">Type:</label>
                            <input type="text" class="form-control" placeholder="type" name="type" id="type"/>
                        </div>
                    </div>
                </form>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
