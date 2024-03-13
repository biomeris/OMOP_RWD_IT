
# OMOP_RWD_IT

Questa cartella contiene il codice per eseguire le analisi per lo studio "La rete italiana OHDSI per la ricerca clinica con Real World Data sanitari: uno studio di fattibilità". 

Si prega di seguire le istruzioni sotto riportate per condurre le analisi necessarie.

## Istruzioni

### Configurazione

Per eseguire le analisi è necessario avere installato R, RTools (Windows), RStudio e Java. Si consiglia di installare R 4.2.3 per una massima compatibilità.

Le istruzioni per poter configurare correttamente l'ambiente R si trovano al seguente link: https://ohdsi.github.io/Hades/rSetup.html .

### Creazione della libreria per il progetto e sincronizzazione dei pacchetti R necessari

Prima di avviare le analisi, è fondamentale verificare che tutti i pacchetti R necessari siano installati. Inoltre, è essenziale che ogni centro utilizzi la stessa versione dei pacchetti R per garantire la comparabilità dei risultati.

Per garantire l'installazione corretta dei pacchetti nella versione richiesta, è necessario eseguire il codice contenuto nel file **CreateProjectLibrary.R**. 

Questo script deve essere eseguito una sola volta, prima dell'avvio della prima analisi. Una volta completata l'esecuzione, non sarà più necessario utilizzarlo nelle analisi successive.

### Esecuzione delle analisi

L'unico file che richiede modifiche è **ConnectionDetails.R**. Si prega di compilarlo con tutte le informazioni necessarie, adattandole alla propria situazione prima di eseguire le analisi. Le informazioni inserite saranno poi necessarie per la connessione al database e l'esecuzione delle analisi.

#### Data Quality Dashboard
Il file **RunDQD.R** contiene il codice necessario per eseguire la Data Quality Dashboard. Per garantire la corretta esecuzione, si prega di non apportare modifiche allo script.

Una volta eseguito lo script, i risultati saranno salvati all'interno della cartella "results_DQD".

#### Achilles
Il file **RunAchilles.R** contiene il codice necessario per eseguire Achilles. Per garantire la corretta esecuzione, si prega di non apportare modifiche allo script.

Una volta terminata, la cartella "results_Achilles" conterrà i log relativi all'esecuzione.

#### CdmInspection
Il file **RunCdmInspection.R** contiene il codice necessario per eseguire CdmInspection. Per garantire la corretta esecuzione, si prega di non apportare modifiche allo script.

Al termine dell'esecuzione, all'interno della cartella results_CdmInspection troverete i risultati e i log dell'esecuzione. All'interno della cartella, sarà presente un file zip dal nome **Results_Inspection_*databaseId*.zip**, che dovrà essere condiviso con il centro coordinatore.

#### CatalogueExport
Il file RunCatalogueExport.R contiene il codice necessario per eseguire CatalogueExport. Per garantire la corretta esecuzione, si prega di non apportare modifiche allo script.

Al termine dell'esecuzione, all'interno della cartella results_CatalogueExport troverete i risultati e i log dell'esecuzione. All'interno della cartella, sarà presente un file zip dal nome **Results_Catalogue_*databaseId*.zip**, che dovrà essere condiviso con il centro coordinatore.

#### Ares
Il file AresIndexer.R contiene il codice necessario per eseguire AresIndexer. Per garantire la corretta esecuzione, si prega di non apportare modifiche allo script.

Al termine dell'esecuzione, all'interno della cartella output_Ares troverete i risultati dell'esecuzione. All'interno della cartella, sarà presente un file zip dal nome **Results_Ares_*databaseId*.zip**, che dovrà essere condiviso con il centro coordinatore. All'interno di questo file si trovano i risultati dell'esecuzione della DQD e di Achilles in un formato compatibile con [Ares](https://github.com/OHDSI/Ares).

## Problemi

Se riscontri problemi o hai domande, per favore invia un'email a vittoria.ramella@biomeris.it.

## Condivisione dei risultati
Al termine delle analisi, se tutto avrà funzionato correttamente ,ogni centro avrà a disposizione i seguenti file:
* Results_Ares_*databaseId*.zip
* Results_Inspection_*databaseId*.zip
* Results_Catalogue_*databaseId*.zip
* [risultati atlas]

I file elencati, dovranno essere condivisi con il centro coordinatore secondo le modalità comunicate.

Grazie!
