
# OMOP_RWD_IT

Questo repository contiene il codice per condurre le analisi per lo studio "La rete italiana OHDSI per la ricerca clinica con Real World Data sanitari: uno studio di fattibilità". 

Si prega di seguire le istruzioni sotto riportate per eseguire correttamente le analisi necessarie.

## Istruzioni

### Configurazione

Per eseguire le analisi è necessario avere installato R, RTools (Windows), RStudio e Java. Si consiglia di installare R 4.2.3 per una massima compatibilità.

Le istruzioni per poter configurare correttamente l'ambiente R si trovano al seguente link: https://ohdsi.github.io/Hades/rSetup.html .

### Download del materiale per eseguire le analisi

Dopo aver installato e verificato la corretta installazione dei tool richiesti, scaricare il contenuto di questo repository sulla macchina su cui saranno eseguite le analisi. Per farlo, cliccare sul pulsante verde "<> Code" che si trova nella parte superiore della pagina, da cui sarà possibile:
* scaricare un file zip contentente il materiale incluso nel repository, oppure
* clonare il repository utilizzando git.

Una volta scaricato il contenuto del repository, aprire il file **OMOP_RWD_IT.Rproj** utilizzando RStudio e procedere con le operazioni elencate sotto.

### Creazione della libreria per il progetto e sincronizzazione dei pacchetti R necessari

Prima di avviare le analisi, è fondamentale verificare che tutti i pacchetti R necessari siano installati. Inoltre, è essenziale che ogni centro utilizzi la stessa versione dei pacchetti R per garantire la comparabilità dei risultati.

Per garantire l'installazione corretta dei pacchetti nella versione richiesta, è necessario eseguire il codice contenuto nel file **CreateProjectLibrary.R**. 

Questo script deve essere eseguito una sola volta, prima dell'avvio della prima analisi. Una volta completata l'esecuzione, non sarà più necessario utilizzarlo nelle analisi successive.

### Esecuzione delle analisi

L'unico file che richiede modifiche è il file **ConnectionDetails.R**. Si prega di compilarlo con tutte le informazioni necessarie, adattandole alla propria situazione prima di eseguire le analisi. Le informazioni inserite saranno poi necessarie per la connessione al database e l'esecuzione delle analisi.

#### Data Quality Dashboard
Il file **RunDQD.R** contiene il codice necessario per eseguire la Data Quality Dashboard. Per garantire la corretta esecuzione, si prega di non apportare modifiche allo script.

Una volta eseguito lo script, i risultati saranno salvati all'interno della cartella **results_DQD**.

#### Achilles
Il file **RunAchilles.R** contiene il codice necessario per eseguire Achilles. Per garantire la corretta esecuzione, si prega di non apportare modifiche allo script.

Una volta terminata, la cartella **results_Achilles** conterrà i log relativi all'esecuzione.

#### CdmInspection
Il file **RunCdmInspection.R** contiene il codice necessario per eseguire CdmInspection. Per garantire la corretta esecuzione, si prega di non apportare modifiche allo script.

Al termine dell'esecuzione, all'interno della cartella **results_CdmInspection** troverete i risultati e i log dell'esecuzione. All'interno della cartella, sarà presente un file zip dal nome **Results_Inspection_*databaseId*.zip**, che dovrà essere condiviso con il centro coordinatore.

#### CatalogueExport
Il file **RunCatalogueExport.R** contiene il codice necessario per eseguire CatalogueExport. Per garantire la corretta esecuzione, si prega di non apportare modifiche allo script.

Al termine dell'esecuzione, all'interno della cartella **results_CatalogueExport** troverete i risultati e i log dell'esecuzione. All'interno della cartella, sarà presente un file zip dal nome **Results_Catalogue_*databaseId*.zip**, che dovrà essere condiviso con il centro coordinatore.

#### Ares
Il file **AresIndexer.R** contiene il codice necessario per eseguire AresIndexer. Per garantire la corretta esecuzione, si prega di non apportare modifiche allo script.

Al termine dell'esecuzione, all'interno della cartella **output_Ares** troverete i risultati dell'esecuzione. All'interno della cartella, sarà presente un file zip dal nome **Results_Ares_*databaseId*.zip**, che dovrà essere condiviso con il centro coordinatore. All'interno di questo file si trovano i risultati dell'esecuzione della DQD e di Achilles in un formato compatibile con [Ares](https://github.com/OHDSI/Ares).

#### ATLAS
All'interno della cartella **ATLAS** si trova il file **Test-characterization.json**. Questo file dovrà essere importato in ATLAS per verificarne le funzionalità.

Una volta effettuato l'accesso ad ATLAS, per importare la definizione dell'analisi di caratterizzazione, seguire i seguenti step:
* spostarsi nella sezione **Characterization** del menu sulla sinistra;
* cliccare sul pulsante **New Characterization**;
* nel tab **Utilities**, nella sezione **Import** copiare il contenuto del file JSON e poi cliccare sul pulsante **Import**.

Dopo aver importato la definizione, per eseguire le analisi e ottenere i risultati richiesti:
* spostarsi nel tab **Executions**;
* cliccare sul pulsante **Generate**, a fianco del nome del vostro database. Nel caso in cui ad una instanza di ATLAS siano collegati più sorgenti OMOP, assicurarsi di selezionare quella desiderata;
* terminata l'esecuzione, cliccare sul pulsante **View latest results** per visualizzare i risultati.

Da qui, sarà possibile anche esportare i risultati che dovranno essere condivisi con il coordinatore. Cliccando sul pulsante **X** verrà avviato il download di un file zip. Una volta terminato il download, rinominare il file come **Results_ATLAS_*databaseId*.zip**. 

## Problemi

Se riscontri problemi o hai domande, per favore apri una segnalazione qui su GitHub sfruttando la funzionalità **Issues** dedicata. Altri centri potrebbero avere lo stesso problema e in questo modo è possibile facilitarne la risoluzione per tutti.

In alternativa, invia una mail a vittoria.ramella@biomeris.it.

## Condivisione dei risultati
Al termine delle analisi, se tutto avrà funzionato correttamente, ogni centro avrà a disposizione i seguenti file:
* Results_Ares_*databaseId*.zip
* Results_Inspection_*databaseId*.zip
* Results_Catalogue_*databaseId*.zip
* Results_ATLAS_*databaseId*.zip

I file elencati, dovranno essere condivisi con il centro coordinatore secondo le modalità comunicate.

Grazie!
