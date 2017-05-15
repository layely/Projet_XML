<?php

//initialisation des chemins;
$stock_xml = "../xml/stock.xml";
$commandes_xml = "../xml/commandes.xml";

/* * * un nouveau domStock  ** */
$domStock = new domDocument;
$domCommandes = new DOMDocument;

/* * * load the xml into the object ** */
$domStock->load($stock_xml);
$domCommandes->load($commandes_xml);

/* * * discard white space ** */
$domStock->preserveWhiteSpace = false;
$domCommandes->preserveWhiteSpace = false;
$domCommandes->formatOutput = true;

$produits = $domStock->documentElement;
$commandes = $domCommandes->documentElement;

//Creer un nouveau element commande
$elementNom = $domCommandes->createElement("nom", $_GET['nom']);
$elementPrenom = $domCommandes->createElement("prenom", $_GET['prenom']);
$elementTel = $domCommandes->createElement("telephone", $_GET['tel']);
$elementProduits = $domCommandes->createElement("produits");
//$elementNom = $domCommandes->createElement("date", DATE_RSS);
$nvElementCommande = $domCommandes->createElement("commande");
$datetempsCourant = date("Y-m-d H:i:s");
$numero = mt_rand(100000, 999999);
$nvElementCommande->setAttribute('numero', $numero);
$nvElementCommande->setIdAttribute('numero', true);
$nvElementCommande->setAttribute('date', $datetempsCourant);
$nvElementCommande->appendChild($elementNom);
$nvElementCommande->appendChild($elementPrenom);
$nvElementCommande->appendChild($elementTel);
$nvElementCommande->appendChild($elementProduits);
$commandes->appendChild($nvElementCommande);

echo $domCommandes->saveXML();
echo '<br/>';
print_r($_GET);
$totalGenerale = 0;
$nombre_article = 0;

/* * * Chercher et ajouter les fruits commandés */
$fruits = $produits->getElementsByTagName('fruit');
foreach ($fruits as $fruit) {
    /*     * * get each column by tag name ** */
    $qtity = $fruit->getElementsByTagName('qtity');
    $qtityValue = $qtity->item(0)->nodeValue;
    $name = $fruit->getAttribute('type');
    $nameWithoutSpace = str_replace(' ', '_', $name);
    $nombreCommande = $_GET[$nameWithoutSpace];


    if (is_numeric($nombreCommande) && ($nombreCommande > 0) && ($nombreCommande <= $qtityValue)) {

        //Modifier l'élément qtity 
        $qtityRestant = ($qtityValue - $nombreCommande);
//        echo 'fruit: ' . $name . ' -- en stock: ' . $qtityValue . ' -- commandé: ' . $nombreCommande . '-- restant: ' . $qtityRestant . '<br/>';
        $qtity->item(0)->nodeValue = $qtityRestant;


//        $clonedElement = $fruit->cloneNode(true);
        $elementProd = $domCommandes->createElement('fruit');
        $elementProd->setAttribute('type', $name);
        $elementProd->setAttribute('prix', $fruit->getAttribute('prix'));

        $elementQti = $domCommandes->createElement('qtity', $nombreCommande);
        $elementProd->appendChild($elementQti);

        $total = $fruit->getAttribute('prix') * $nombreCommande;
        $elementTotal = $domCommandes->createElement('total', $total);
        $elementProd->appendChild($elementTotal);

        $elementProduits->appendChild($elementProd);

        $totalGenerale += $total;
        $nombre_article += $nombreCommande;
        echo 'done';
        echo '<hr />';
//      Ajouter à la commande
    }
}

/* * * Chercher et ajouter les fruits commandés */
$legumes = $produits->getElementsByTagName('legume');
foreach ($legumes as $legume) {
    /*     * * get each column by tag name ** */
    $qtity = $legume->getElementsByTagName('qtity');
    $qtityValue = $qtity->item(0)->nodeValue;
    $name = $legume->getAttribute('type');
    $nameWithoutSpace = str_replace(' ', '_', $name);
    $nombreCommande = $_GET[$nameWithoutSpace];


    if (is_numeric($nombreCommande) && ($nombreCommande > 0) && ($nombreCommande <= $qtityValue)) {

        //Modifier l'élément qtity 
        $qtityRestant = ($qtityValue - $nombreCommande);
//        echo 'fruit: ' . $name . ' -- en stock: ' . $qtityValue . ' -- commandé: ' . $nombreCommande . '-- restant: ' . $qtityRestant . '<br/>';
        $qtity->item(0)->nodeValue = $qtityRestant;


//        $clonedElement = $fruit->cloneNode(true);
        $elementProd = $domCommandes->createElement('legume');
        $elementProd->setAttribute('type', $name);
        $elementProd->setAttribute('prix', $legume->getAttribute('prix'));

        $elementQti = $domCommandes->createElement('qtity', $nombreCommande);
        $elementProd->appendChild($elementQti);

        $total = $legume->getAttribute('prix') * $nombreCommande;
        $elementTotal = $domCommandes->createElement('total', $total);
        $elementProd->appendChild($elementTotal);

        $elementProduits->appendChild($elementProd);

        $totalGenerale += $total;
        $nombre_article += $nombreCommande;
        echo 'done';
        echo '<hr />';
//      Ajouter à la commande
    }
}

$elementNombreArticle = $domCommandes->createElement("nombre_article", $nombre_article);
$nvElementCommande->appendChild($elementNombreArticle);

$elementTotalGeneral = $domCommandes->createElement("total_general", $totalGenerale);
$nvElementCommande->appendChild($elementTotalGeneral);


//Ecrire les modifications sur le fichier stock.xml
$domStock->save($stock_xml);

//Ecrire les modifications sur le fichier commandes.xml
$domCommandes->loadXML($domCommandes->saveXML());
$domCommandes->save($commandes_xml);

function test() {
    
}
