clear all
*Working Directory*
cd ""C:\Users\ACER\Documents\Stata" 
use "C:\Users\ACER\Documents\Stata\data economic freedom index.dta"

*La intención de este script es evaluar los indices operables del famoso índice de libertad económica del instituto Fraser. Ya que vemos que hay otros autores que han analizado el del Heritage Institute y no hizo hincapié en este dado la similitud de dichos índices en cuanto a los constructos teóricos que utiliza y la forma en la que los opera.

*Sabemos que una de las cuestiones más importantes que debe de tener un instrumento de medición es que los índices y subíndices operables tengan consistencia interna. Esto es lo que en no solamente en psicometría, sino en la construcción de cualquier instrumento de medición documental y/o de campo llamamos "validez de constructo". La validez de constructo según Brown (2000) se refiere a que este "has traditionally been defined as the experimental demonstration that a test is measuring the construct it claims to be measuring". En definitiva, la validez de constructo se refiere a la capacidad de un instrumento de medición de medir el constructo del cual se asume que puede medir o que mide adecuadamente. 

*Un test que sea incapaz de tener lo que llaman expertos "consistencia interna" hace que aquello que mida sea incorrecto o a lo sumo bastante subjetivo. Como podemos ver en la metodología del grupo Fraser: el Indice consta de 5 dimensiones con una serie de subíndices que detallaré a continuación: 

*1. Tamaño de gobierno
*A) Consumo del gobierno B) Transferencias y subsidios C) Empresas del gobiero e inversión pública D) Tasa marginal impositiva (la más alta) del país, la cual se divide dos subíndices: I) Tasa impositiva mas alta en terminos marginales y II)  Tasa impositiva marginal más alta y la tasa impositiva del contribuyente. E) Propiedades del Estado y activos del mismo.

*2. Sistema legal y derechos de propiedad.
*A) Independencia judicial. B) Cortes imparicales C) Protección de los derechos de propiedad. D) Intervención militar en el imperio de la ley y la política. E) Integridad del sistema legal F) Capacidad de hacer cumplir los contratos. G) Costos regulatorios sobre la venta de propiedad real (o bienes inmuebles). H) Fiabilidad de los servicios policiales.I) Costos de negociación producto de la criminalidad. J. Ajuste por disparidad de género.

*3. Solidez de sistema monetario. 
*A) Crecimiento del dinero. B) Desviación estándar de la inflación. C) Inflación del año más reciente. D) Libertad de tener cuentas de ahorro de moneda extranjera. 

*4) Libertad de entablar actos de comercio internacional



*Análisis de datos*
*1.0) Manipulación de Datos. 
*Para correr un análisis factorial exploratorio de la manera adecuada hay que eliminar los 0s debido a la falta de datos, para eso usamos el comando de Stata "keep if". Esto se debe a que un anális de componentes principales (PCA) es imposible realizar la prueba KMO y de esfericidad de Barrett.  Dicho test tien como objetivo relacionar los oceficientes de correlación rjh, observados entre las variables del índice. El valor se interpreta igual que una prueba de fiabilidad, el valor va de 0 a 1, a mayor cercanía a 1, pues major fiabilidad. Un valor aceptable para el test es, según Tristan (2008) deberá ser  mayor  o  igual  a .5823. 
drop if transfersandsubsidies ==.
drop if  governmentinvestment ==. 
drop if governmentconsumption ==.
drop if topmarginalincometaxrate  ==.
drop if topmarginalincomeandpayrolltaxra  ==.
drop if stateownershipofassets  ==.
drop if judicialindependence  ==.
drop if impartialcourts ==.
drop if protectionofpropertyrights  ==.
drop if militaryinterferenceinruleoflawa  ==. 
drop if integrityofthelegalsystem  ==.
drop if legalenforcementofcontracts  ==.
drop if regulatoryrestrictionsonthesaleo  ==.
drop if reliabilityofpolice  ==.
drop if businesscostsofcrime  ==.
drop if genderlegalrightsadjustment  ==.
drop if moneygrowth  ==.
drop if standarddeviationofinflation  ==.
drop if inflationmostrecentyear  ==.
drop if freedomtoownforeigncurrencybanka  ==.
drop if revenuefromtradetaxesoftradesect  ==.
drop if meantariffrate  ==.
drop if standarddeviationoftariffrates  ==.
drop if nontarifftradebarriers  ==.
drop if compliancecostsofimportingandexp  ==.
drop if blackmarketexchangerates  ==.
drop if foreignownershipinvestmentrestri  ==.
drop if capitalcontrols  ==.
drop if  freedomofforeignerstovisit  ==.
drop if ownershipofbanks  ==.
drop if privatesectorcredit  ==.
drop if interestratecontrolsnegativereal  ==.
drop if hiringregulationsandminimumwage  ==.
drop if hiringandfiringregulations  ==.
drop if centralizedcollectivebargaining  ==.
drop if hoursregulations  ==.
drop if mandatedcostofworkerdismissal ==.
drop if conscription  ==.
drop if administrativerequirements  ==.
drop if regulatoryburden  ==.
drop if startingabusiness  ==.
drop if extrapaymentsbribesfavoritism  ==.
drop if licensingrestrictions  ==.
drop if taxcompliance  ==.

*Pruebas de fiabilidad y validez de constructo: 
*1) prueba de Correlación
pwcorr economicfreedomsummaryindex governmentconsumption transfersandsubsidies governmentinvestment topmarginalincometaxrate topmarginalincomeandpayrolltaxra stateownershipofassets 
*2) Alfa de cronbach/dominio total
 
 global xlist governmentconsumption transfersandsubsidies governmentinvestment topmarginalincometaxrate topmarginalincomeandpayrolltaxra stateownershipofassets judicialindependence impartialcourts protectionofpropertyrights militaryinterferenceinruleoflawa integrityofthelegalsystem legalenforcementofcontracts regulatoryrestrictionsonthesaleo reliabilityofpolice businesscostsofcrime genderlegalrightsadjustment moneygrowth standarddeviationofinflation inflationmostrecentyear freedomtoownforeigncurrencybanka revenuefromtradetaxesoftradesect meantariffrate standarddeviationoftariffrates nontarifftradebarriers compliancecostsofimportingandexp blackmarketexchangerates foreignownershipinvestmentrestri capitalcontrols freedomofforeignerstovisit ownershipofbanks privatesectorcredit interestratecontrolsnegativereal hiringregulationsandminimumwage hiringandfiringregulations centralizedcollectivebargaining hoursregulations mandatedcostofworkerdismissal conscription administrativerequirements regulatoryburden startingabusiness extrapaymentsbribesfavoritism licensingrestrictions taxcompliance
 alpha $xlist, std item detail label
 *3) Análisis factorial (pruebas de KMO y Esfericidad de Barlett)
 factortest $xlist


 
 *3.1 Análisis factorial explotatorio. 
 factor $xlist, pcf 
 screeplot, yline(1) 
 
 rotate, v normal
 sortl 
 *#Los factores encontrados en este análisis factorial exploratorio son lo siguientes: 
 *Dimensión uno
 global Factor1 impartialcourts judicialindependence protectionofpropertyrights extrapaymentsbribesfavoritism reliabilityofpolice integrityofthelegalsystem businesscostsofcrime nontarifftradebarriers administrativerequirements taxcompliance governmentconsumption militaryinterferenceinruleoflawa foreignownershipinvestmentrestri 
 
 alpha $Factor1, std item detail label
 
 *dimension dos
 global Factor2 stateownershipofassets genderlegalrightsadjustment standarddeviationofinflation governmentinvestment
alpha $Factor2, std item detail label

*Dimension tres
global Factor3 regulatoryrestrictionsonthesaleo regulatorytradebarriers startingabusiness legalenforcementofcontracts revenuefromtradetaxesoftradesect
alpha $Factor3, std item detail label
*Dimension cuatro
global Factor4 moneygrowth inflationmostrecentyear interestratecontrolsnegativereal blackmarketexchangerates licensingrestrictions
alpha $Factor4, std item detail label
*Dimension 5.
global Factor5 hiringandfiringregulations centralizedcollectivebargaining transfersandsubsidies
alpha $Factor5, std item detail label
*Dimension 6
global Factor6 capitalcontrols freedomofforeignerstovisit freedomtoownforeigncurrencybanka ownershipofbanks
alpha $Factor6, std item detail label

 
*1. TAMAÑO DE GOBIERNO.
*1) Libertad económica y consumo del gobierno. 
reg economicfreedomsummaryindex governmentconsumption, notable
twoway (scatter economicfreedomsummaryindex governmentconsumption) (lfit economicfreedomsummaryindex governmentconsumption), note(R-squared=.0623) 
name(con)
*2) Transferencias y subsidios.
reg economicfreedomsummaryindex transfersandsubsidies, notable 
* R-squared       =    0.1161
twoway (scatter economicfreedomsummaryindex transfersandsubsidies) (lfit economicfreedomsummaryindex transfersandsubsidies), note(R-squared=0.1171) name(tran)
*3) Empresas del gobierno e inversión pública.
reg economicfreedomsummaryindex governmentinvestment, notable
*R-squared       =    0.2223
twoway (scatter economicfreedomsummaryindex governmentinvestment) (lfit economicfreedomsummaryindex governmentinvestment), note(R-squared=0.2223) name(inv)
*4) Tasa marginal impositiva (la más alta) del país
reg economicfreedomsummaryindex topmarginalincometaxrate, beta
*R-squared       =    0.0034
twoway (scatter economicfreedomsummaryindex topmarginalincometaxrate) (lfit economicfreedomsummaryindex topmarginalincometaxrate), note(R-squared=0.0034) name(taxrate)
reg economicfreedomsummaryindex topmarginalincomeandpayrolltaxra, beta
*R-squared       =    0.0011
twoway(scatter economicfreedomsummaryindex topmarginalincomeandpayrolltaxra)(lfit economicfreedomsummaryindex topmarginalincomeandpayrolltaxra),  note(R-squared=0.0106) name(taxpayroll)
reg economicfreedomsummaryindex stateownershipofassets, beta
* R-squared       =    0.2475
twoway(scatter economicfreedomsummaryindex stateownershipofassets) (lfit economicfreedomsummaryindex stateownershipofassets), note(R-Suared=0.2475) name(stateassets)
*1.1 Gráficos combinados de tamaño de gobierno
graph combine con tran inv taxrate taxpayroll stateassets 
*2. SISTEMA LEGAL Y DERECHOS DE PROPIEDAD
*1) Independencia judicial
reg economicfreedomsummaryindex judicial, beta 
*R-squared       =    0.3801
twoway(scatter economicfreedomsummaryindex judicial)(lfit economicfreedomsummaryindex judicial), note(R-squared= 0.3801) name(independece)
*2)Cortes imparciales 
reg economicfreedomsummaryindex impartialcourts, beta 
*R-Squared=  0.3307
twoway(scatter economicfreedomsummaryindex impartialcourts)(lfit economicfreedomsummaryindex impartialcourts), note(R-squared=0.3307) name(courts)
reg economicfreedomsummaryindex protectionofpropertyrights, beta 
*R-Squared= 0.5160
twoway(scatter economicfreedomsummaryindex protectionofpropertyrights) (lfit economicfreedomsummaryindex protectionofpropertyrights), ytitle(Economic Freedom Summary Index) xtitle(Protection of Property Rights) subtitle((1970-2017)) note(R-squared=0.5160) name(property)
reg economicfreedomsummaryindex militaryinterferenceinruleoflawa, beta
*0.3634
twoway(scatter economicfreedomsummaryindex militaryinterferenceinruleoflawa)(lfit economicfreedomsummaryindex militaryinterferenceinruleoflawa), ytitle(Economic Freedom Summary Index) xtitle(Military Interference in Rule of Law) subtitle ((1970-2017)) note(R-squared= 0.3634) name(military)
reg economicfreedomsummaryindex integrityofthelegalsystem, beta 
*R-Squared= 0.3005
twoway(scatter economicfreedomsummaryindex integrityofthelegalsystem)(lfit economicfreedomsummaryindex integrityofthelegalsystem), ytitle(Economic Freedom Summary Index) xtitle(Integrity of the legal system) note(R-squared= 0.3005) name(integrity)

reg economicfreedomsummaryindex legalenforcementofcontracts, beta  
*R-squared       =    0.2250
twoway(scatter economicfreedomsummaryindex legalenforcementofcontracts)(lfit economicfreedomsummaryindex legalenforcementofcontracts), ytitle(Economic Freedom Summary Index) xtitle(Legal enforcement of contracts) note(R-squared= 0.2250) name(enforcer)

reg economicfreedomsummaryindex regulatoryrestrictionsonthesaleo, beta 
*R-squared= 0.1701
twoway(scatter economicfreedomsummaryindex regulatoryrestrictionsonthesaleo)(lfit economicfreedomsummaryindex regulatoryrestrictionsonthesaleo), ytitle(Economic Freedom Summary Index) xtitle(Regulatory restrictions of real state) note(R-squared= 0.2250) name(regulatory)

reg economicfreedomsummaryindex reliabilityofpolice, beta
*0.4076
twoway(scatter economicfreedomsummaryindex reliabilityofpolice)(lfit economicfreedomsummaryindex reliabilityofpolice), ytitle(Economic Freedom Summary Index) xtitle(Reliability of police) note(R-squared= 0.4076) name(police)

reg economicfreedomsummaryindex businesscostsofcrime, beta
*0.2113
twoway(scatter economicfreedomsummaryindex businesscostsofcrime)(lfit economicfreedomsummaryindex businesscostsofcrime), ytitle(Economic Freedom Summary Index) xtitle(Business Cost of Crime) note(R-squared= 0.213) name(crime)
reg economicfreedomsummaryindex genderlegalrightsadjustment, beta
twoway(scatter economicfreedomsummaryindex genderlegalrightsadjustment)(lfit economicfreedomsummaryindex genderlegalrightsadjustment), ytitle(Economic Freedom Summary Index) xtitle(Gender legal rights adjustment) note(R-squared= 0.1433) name(gender)

*Grafico Property rights and institutional stuff
graph combine independece courts property military integrity enforcer regulatory police crime gender 

*3) Solidez de las instituciones monetarias
reg economicfreedomsummaryindex moneygrowth , beta  notable
reg economicfreedomsummaryindex standarddeviationofinflation, beta notable
reg economicfreedomsummaryindex inflationmostrecentyear, beta notable 
reg economicfreedomsummaryindex freedomtoownforeigncurrencybanka, beta notable
*1)R-squared	=	0.1420
*2) R-squared       =    0.2341
*3)R-squared       =    0.2634
*4) R-squared       =    0.4713

*Gráficos
*3.1) Crecimiento del dinero*
twoway(scatter economicfreedomsummaryindex moneygrowth)(lfit economicfreedomsummaryindex moneygrowth), ytitle(Economic Freedom) xtitle(Money Growth) note(R-squared= 0.1420) name(money)
*3.2) Desviación estándar de la inflación.
twoway(scatter economicfreedomsummaryindex standarddeviationofinflation)(lfit economicfreedomsummaryindex standarddeviationofinflation), ytitle(Economic freedom) xtitle(Standard deviation of inflation)note(R-squared= 0.2341) name(deviation)

*3.3) Inflación (año más reciente)
twoway(scatter economicfreedomsummaryindex inflationmostrecentyear)(lfit economicfreedomsummaryindex inflationmostrecentyear), ytitle(Economic Freedom) xtitle(Inflation: Most recent year) note(R-squared= 0.2634) name(inflation)
*3.4) Libertad para aperturar una cuenta de ahorro en moneda extranjera.
twoway(scatter economicfreedomsummaryindex freedomtoownforeigncurrencybanka)(lfit economicfreedomsummaryindex freedomtoownforeigncurrencybanka), ytitle(Economic Freedom) xtitle(Freedom to own foreign currency bank accounts) note(R-squared= 0.4713) name(bankac)

*3.6 #Gráfico de la dimensión "Sound Money"#
graph combine money deviation inflation bankac

*4) Libertad de entablar actos de comercio internacional
reg economicfreedomsummaryindex revenuefromtradetaxesoftradesect, notable
reg economicfreedomsummaryindex meantariffrate, notable 
reg economicfreedomsummaryindex standarddeviationoftariffrates, notable 
reg economicfreedomsummaryindex nontarifftradebarriers, notable
reg economicfreedomsummaryindex compliancecostsofimportingandexp, notable
reg economicfreedomsummaryindex blackmarketexchangerates, notable
reg economicfreedomsummaryindex foreignownershipinvestmentrestri, notable
reg economicfreedomsummaryindex capitalcontrols, notable  
reg economicfreedomsummaryindex freedomofforeignerstovisit, notable
*Revenue from trade taxes: R-squared       =    0.2359
*Mean tariff rates : R-squared       =    0.5184
*Standard deviation of tariff rates = R-squared       =    0.0360
*Non tariff barries: R-squared       =    0.4113
*compliance cost of imports: 0.4373
*Black market exchange rates R-Squared= 0.1481
*Foreign ownership inverment restrictions: R-Squared= 42.30
*Capital controls: R-Squared= 0.3471
*Freedom of foreigners to visit: R-Squared= 0.1593

*1)
twoway(scatter economicfreedomsummaryindex revenuefromtradetaxesoftradesect)(lfit economicfreedomsummaryindex revenuefromtradetaxesoftradesect), ytitle(Economic Freedom) xtitle(Revenue from trade taxes) note(R-squared= 0.2359) name(revenuetax)
*2)
twoway(scatter economicfreedomsummaryindex meantariffrate)(lfit economicfreedomsummaryindex meantariffrate), ytitle(Economic Freedom) xtitle(Freedom to own foreign currency bank accounts) note(R-squared= 0.5184) name(meantariff)
*3)
twoway(scatter economicfreedomsummaryindex standarddeviationoftariffrates)(lfit economicfreedomsummaryindex standarddeviationoftariffrates), ytitle(Economic Freedom) xtitle(Standard deviation of tariff rates) note(R-squared= 0.0360) name(devtariff)
*4)
twoway(scatter economicfreedomsummaryindex nontarifftradebarriers)(lfit economicfreedomsummaryindex nontarifftradebarriers), ytitle(Economic Freedom) xtitle(Non Tariffs trade barries) note(R-squared= 0.4113) name(nontariff)
*5)
twoway(scatter economicfreedomsummaryindex blackmarketexchangerates)(lfit economicfreedomsummaryindex blackmarketexchangerates), ytitle(Economic Freedom) xtitle(Black Market Exchange rates) note(R-squared= 0.1481) name(blackmarket)
*6)
twoway(scatter economicfreedomsummaryindex foreignownershipinvestmentrestri)(lfit economicfreedomsummaryindex foreignownershipinvestmentrestri), ytitle(Economic Freedom) xtitle(Foreign ownership investment restrictions) note(R-squared= 0.4230) name(restinv)
*7) 
twoway(scatter economicfreedomsummaryindex capitalcontrols)(lfit economicfreedomsummaryindex capitalcontrols), ytitle(Economic Freedom) xtitle(Capital Controls) note(R-squared= 0.3471) name(capitalcon)
*8)
twoway(scatter economicfreedomsummaryindex freedomofforeignerstovisit)(lfit economicfreedomsummaryindex  freedomofforeignerstovisit), ytitle(Economic Freedom) xtitle(Freedom of foreigners to visit) note(R-squared= 0.1593) name(freeforeigner)

*#Gráfico comibinado#.
graph combine revenuetax meantariff devtariff nontariff blackmarket restinv capitalcon freeforeigner

*5) Regulación.

reg economicfreedomsummaryindex ownershipofbanks, notable 
reg economicfreedomsummaryindex privatesectorcredit, notable   
reg economicfreedomsummaryindex interestratecontrolsnegativereal, notable 
reg economicfreedomsummaryindex hiringregulationsandminimumwage, notable 
reg economicfreedomsummaryindex hiringandfiringregulations, notable 
reg economicfreedomsummaryindex centralizedcollectivebargaining, notable 
reg economicfreedomsummaryindex hoursregulations, notable
reg economicfreedomsummaryindex mandatedcostofworkerdismissal, notable 
reg economicfreedomsummaryindex conscription, notable  
reg economicfreedomsummaryindex administrativerequirements, notable
reg economicfreedomsummaryindex regulatoryburden, notable  
reg economicfreedomsummaryindex startingabusiness, notable 
reg economicfreedomsummaryindex extrapaymentsbribesfavoritism, notable  
reg economicfreedomsummaryindex licensingrestrictions, notable
reg economicfreedomsummaryindex taxcompliance, notable
*1) Ownership of banks = R-Squared= 0.2245
*2) Private sector credit = R-Squared = 0.0723
*3) Interest Rate controls: negative real= R-Squared= 0.2131
*4) Hiring regulations and minimum wage R-Squared= 0.0563\
*5) Hiring and firing regulations =R-Squared= 0.0574
*6) Centralized colective bargain:= R-Squared= 0.0566
*7) Hours regulations R-Squared= 0.0069
*8) Mandated costo of worker dismissal = R-Squared 0.2005
*9) Conscription: R-Squared= 0.0343
*10) Administrative requirements: R-Squared= 0.1497
*11) Regulatory Burden: R-Squared = 0.3355
*12) Starting a business: R-Squared= 0.2481
*13) Extra Payments brides favoritism = R-Squared= 0.4374
*14) Licensing restrictions: R-Squared= 0.2051
*15) Taxcompliance: R-Squared= 0.2009
 
 twoway(scatter economicfreedomsummaryindex ownershipofbanks) yline(economicfreedomsummaryindex ownershipofbanks)



*Referencias
*Tristán,  A. (2008).  Modificación al modelo de Lawshe  para el dictamen cuantitativo  de la validez  de contenido  de un  instrumento  objetivo.  Avances en medición, 6(1), 37-48 

*http://hosted.jalt.org/test/bro_8.htm 
