<?php

//initialisation des chemins;
$stock_xml = "../xml/stock.xml";
$commandes_xml = "../xml/commandes.xml";

/* * * a new domStock object ** */
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
$nvElementCommande->appendChild($elementNom);
$nvElementCommande->appendChild($elementPrenom);
$nvElementCommande->appendChild($elementTel);
$nvElementCommande->appendChild($elementProduits);
$commandes->appendChild($nvElementCommande);

echo $domCommandes->saveXML();

/* * * the table by its tag name ** */
$fruits = $produits->getElementsByTagName('fruit');
foreach ($fruits as $fruit) {
    /*     * * get each column by tag name ** */
    $qtity = $fruit->getElementsByTagName('qtity');
    $qtityValue = $qtity->item(0)->nodeValue;
    $name = $fruit->getAttribute('type');
    $nombreCommande = $_GET[$name];

    $counter = 0;

    if (is_numeric($nombreCommande) && ($nombreCommande > 0) && ($nombreCommande <= $qtityValue)) {

        //Modifier l'élément qtity 
        $qtityRestant = ($qtityValue - $nombreCommande);
//        echo 'fruit: ' . $name . ' -- en stock: ' . $qtityValue . ' -- commandé: ' . $nombreCommande . '-- restant: ' . $qtityRestant . '<br/>';
        $qtity->item(0)->nodeValue = $qtityRestant;


//        $clonedElement = $fruit->cloneNode(true);

        $elementProduits->appendChild($fruit);
        echo 'done';
        echo '<hr />';
//      Ajouter à la commande
    }
}


$domStock->save($stock_xml);	

$domCommandes->loadXML($domCommandes->saveXML());
$domCommandes->save($commandes_xml);

function test() {
    
}