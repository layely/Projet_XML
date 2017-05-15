<?php

//récuperation des arguments
$type = $_GET['type'];
$nom = $_GET['nom'];
$calibre = $_GET['calibre'];
$prix = $_GET['prix'];
$producteur = $_GET['producteur'];
$origine = $_GET['origine'];
$region = $_GET['region'];
$qtity = $_GET['qtity'];
$bio = $_GET['bio'];
$note = $_GET['note'];

$typeAModifier = $_GET['typeAModifier'];
$nomAModifier = $_GET['nomAModifier'];


//création du nouveau element (fruit ou légume)
//initialisation des chemins;
$stock_xml = "../xml/stock.xml";

/* * * a new domStock object ** */
$domStock = new domDocument;

/* * * load the xml into the object ** */
$domStock->load($stock_xml);

/* * * discard white space ** */
$domStock->preserveWhiteSpace = false;
$domStock->formatOutput = true;

$produits = $domStock->documentElement;

$elementAModifier = null;
//element à modifier
if (isset($typeAModifier) && $typeAModifier == 'fruit')
    $elementAModifier = $domStock->getElementsByTagName('fruit');
else {
    $elementAModifier = $domStock->getElementsByTagName('legume');
}
//Creer un nouveau element commande
$elementProduit = $domStock->createElement($type);
$elementProduit->setAttribute("type", $nom);
$elementProduit->setAttribute("prix", $prix);
$elementProduit->setAttribute("calibre", $calibre);
//$produits->appendChild($elementProduit);

$elementProducteur = $domStock->createElement("producteur", $producteur);
$elementProduit->appendChild($elementProducteur);

$elementOrigine = $domStock->createElement("origine", $origine);
if (isset($origine))
    $elementProducteur->setAttribute("region", $region);
$elementProduit->appendChild($elementOrigine);

$elementQtity = $domStock->createElement("qtity", $qtity);
$elementProduit->appendChild($elementQtity);

if (isset($note)) {
    $elementNote = $domStock->createElement("note", $note);
    $elementProduit->appendChild($elementNote);
}

if (isset($bio)) {
    $elementNote = $domStock->createElement("bio");
    $elementProduit->appendChild($elementNote);
}


//chercher l'element à modifier 
foreach ($elementAModifier as $element) {
    /*     * * get each column by tag name ** */
    $name = $element->getAttribute('type');
    if ($name == $nomAModifier) {
        echo "found :: " . $name . "<br/>";
        $produits->replaceChild($elementProduit, $element);
        echo 'done';
    }
}

//ecrire les modifications sur le fichier
$domStock->loadXML($domStock->saveXML());
$domStock->save($stock_xml);

//<fruit type = "clementine" prix = "290" calibre = "1">
//<producteur>Production Bastia</producteur>
//<origine region = "Corse">France</origine>
//<qtity>9</qtity>
//<note>Sans pepins, avec feuilles</note>
//<bio/>
//</fruit>