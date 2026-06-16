set.seed(123)
punti = 0:10
vincite = c(2, 0, 0, 0, 0, 5, 15, 150, 1000, 20000, 1000000)
guadagni = data.frame(punti, vincite)
numerig1=sort(sample(1:90,10))
numerig1
#impostiamo il capitale iniziale a 1000, questo poi subirà cambiamenti in base
#alle vittorie o alle perdite
budget=1000
i=0
q=0
w=0
vincitap=0 #vincita parziale, momentanea
vetvincitenette=c()
vetmaxnette=c()
vetmedienette=c()
k=1
vincitamax=c()
vincitamin=c()
v=c()
path = c()
budgetfinale= c()
numgiocate= c()
puntata=5
for(k in (1:1000)){
{  while(budget>0&budget<=50000 & i<550){{ 
budget=budget-5
i=i+1
#print(c("i= ",i))
tabellone=sort(sample(1:90,20))
#print(c("tabellone = ", tabellone))
conta = length(intersect(numerig1,tabellone))  
#print(c("conta = ", conta))
vincitap = 5*guadagni[which(guadagni$punti == conta), c(2)]
v=c(v,vincitap)
#print(c("vincitap = ", vincitap))
budget=budget+(vincitap)
#print(c("budget =", budget))
vincitanetta=vincitap-puntata
vetvincitenette=c(vetvincitenette,vincitanetta)
}
  q= max(v)  
  w= min(v) 
  q11=max(vetvincitenette)
  m11=mean(vetvincitenette)
}
   path = c(path, budget-1000)
  budgetfinale =c(budgetfinale, budget)
  numgiocate= c(numgiocate, i)
  vincitamax=c(vincitamax,q)
  vetmaxnette=c(vetmaxnette,q11)
  vetmedienette=c(vetmedienette,m11)
  budget=1000
  i=0
  vincitap=0
  v=c()# aggiunto per resettare vettore prima di altro ciclo
  vetvincitenette=c()
  }
}
path
budgetfinale
numgiocate
vincitamax
vetmedienette
vetmaxnette
mean(path)
mean(budgetfinale)
mean(numgiocate)
mean(vincitamax)
#secondo giocatore
budget2=1000
#impostiamo il budget iniziale uguale al budget del primo giocatore
i2=0
q2=0
w2=0
vincitap2=0
vincitanetta2=0
k2=1
puntata2=5
guadagni2= data.frame (punti,vincite)
vetpuntate2=c() #vettore in cui memorizzo le puntate
vetvincite2=c() #vettore in cui memorizzo tutte le vincite
vetvincitenette2=c()
vetmaxnette2=c()
vetmedienette2=c()
v2=c()
path2 = c()
budgetfinale2= c()
numgiocate2= c()
vincitamax2=c()
vincitamin2=c()
for(k2 in (1:1000)){
{ while(budget2>0&budget2<=50000&i2<550){{
  i2=i2+1
  vetpuntate2=c(vetpuntate2, puntata2) #ogni volta inserisco la puntata
  #print(c("i2 = ", i2))
  budget2=budget2-puntata2
  tabellone2=sort(sample(1:90,20))
 # print(c("tabellone2 = ", tabellone2))
  conta2=length(intersect(numerig1,tabellone2))
 # print(c("conta2 = ", conta2))
  vincitap2=puntata2*guadagni2[which(guadagni2$punti==conta2),c(2)]
  v2=c(v2,vincitap2)
  vincitanetta2=vincitap2- puntata2#ho inserito qui la vincita netta all'interno
                                    #del while
  vetvincitenette2=c(vetvincitenette2,vincitanetta2)
  #print(c("le vincite nette sono =",vincitanetta2))
  #print(c("vincitap2 = ", vincitap2))
  budget2=budget2+vincitap2
  #print(c("budget2=" ,budget2))
  if(i2>1){
  if (vincitap2==0& vetpuntate2[i2]==vetvincite2[i2-1])#cioè se al turno
    #prima della perdita avevo avuto una piccola vincita che ho rigiocato, non 
      #raddoppio ma rigioco la puntata ancora prima
      puntata2= vetpuntate2[i2-1] }
  else{
    #caso di sconfitta alla puntata precedente e in cui si punta il 
    #doppio di quanto puntato in precedenza sempre però rimanendo dentro il budget 
    #senza indebitarsi
    if (vincitap2==0)
      puntata2=min(puntata2*2,budget2) #se invece perde solo senza la condizione 
    #che al turno prima ha vinto allora raddoppia
   else{
      if(vincitap2>0 & vincitap2<100)
        puntata2=vincitap2
     else {puntata2=5
     }
   }
  }
  vetvincite2=c(vetvincite2, vincitap2) #vettore che contiene le vincite di ogni
  #giocata e che mi serve nel primo if
   }
    q2=max(v2)
    w2=min(v2)
    #print(c("puntata2 = ", puntata2))
    q22=max(vetvincitenette2)
    m22=mean(vetvincitenette2)
}
  path2=c(path2,budget2-1000)
  budgetfinale2=c(budgetfinale2, budget2)
  numgiocate2=c(numgiocate2, i2)
  vincitamax2=c(vincitamax2,q2)
  
  vetmaxnette2=c(vetmaxnette2,q22)
  vetmedienette2=c(vetmedienette2,m22)
  budget2=1000
  i2=0
  v2=c()
  vetvincitenette2=c()
  puntata2=5 
  vetpuntate2=c()
  vetvincite2=c()
  
}
}
path2
budgetfinale2
numgiocate2
vincitamax2
vetmedienette2
vetmaxnette2
mean(path2)
mean(budgetfinale2)
mean(numgiocate2)
mean(vincitamax2)

#terzo giocatore:
budget3=1000
#impostiamo il budget iniziale uguale al budget del primo e secondo giocatore
i3=0
q3=0
w3=0
vincitap3=0
vetvincitenette3=c()
vetmaxnette3=c()
vetmedienette3=c()
k3=1
vincitamax3=c()
puntata3= sum(vincite*dhyper(punti,10,80,20)) #previsione di vincita, costo
#giocata pari al valore atteso di vincita
guadagni3= data.frame (punti,vincite)
v3=c()
path3=c()
budgetfinale3=c()
numgiocate3=c()
for(k3 in (1:1000)){
{ while(budget3>0&budget3<=50000 & i3<550){{ 
  budget3=budget3-puntata3
  i3=i3+1
  #print(c("i= ",i))
  tabellone3=sort(sample(1:90,20))
  #print(c("tabellone = ", tabellone))
  conta3 = length(intersect(numerig1,tabellone3))  
  #print(c("conta = ", conta3))
  vincitap3 =guadagni[which(guadagni$punti == conta3), c(2)]
  v3=c(v3,vincitap3)
  budget3=budget3+(vincitap3)
  vincitanetta3=vincitap3-puntata3
 vetvincitenette3=c(vetvincitenette3,vincitanetta3)
  }
  q3= max(v3)  
  w3= min(v3)  
  q33=max(vetvincitenette3)
  m33=mean(vetvincitenette3)
}
  path3=c(path3, budget3-1000)
budgetfinale3=c(budgetfinale3, budget3)
numgiocate3=c(numgiocate3,i3)
vincitamax3=c(vincitamax3,q3)
vetmaxnette3=c(vetmaxnette3,q33)
vetmedienette3=c(vetmedienette3,m33)
budget3=1000
i3=0
vincitap3=0
v3=c()# aggiunto per resettare vettore prima di altro ciclo
vetvincitenette3=c()
}
}
path3
budgetfinale3
numgiocate3
vincitamax3
vetmedienette3
vetmaxnette3
mean(path3)
mean(budgetfinale3)
mean(numgiocate3)
mean(vincitamax3)
#parte grafica 1
classi=cut(budgetfinale,breaks = seq(0,110000,1000)) #divido in classi ampie
#mille, da zero 110 000 visto che il budgetfinale massimo non supera tale cifra
classi
tavola=table(classi)
barplot(tavola, main = "Soldi rimasti dopo ogni ciclo di giocate")
hist(path)
hist(budgetfinale, main = "Soldi rimasti dopo ogni ciclo di giocate",breaks=5)
barplot(budgetfinale)
hist(numgiocate)
hist(vincitamax)
hist(vetmedienette)
hist(vetmaxnette)
#grafici
boxplot(path, path2, path3, ylab="Euro" , names = c("Quota fissa", "Raddoppio", "Gioco equo"), varwidth = TRUE, main="Guadagno finale")
boxplot(numgiocate, numgiocate2, numgiocate3 , ylab="Giocate" , names = c("Quota fissa", "Raddoppio", "Gioco equo"),  main="Numero di giocate")
boxplot(vetmedienette, vetmedienette2, vetmedienette3 , ylab="euro" , names = c("Quota fissa", "Raddoppio", "Gioco equo"),  main="Vincite nette medie")
boxplot(vetmaxnette, vetmaxnette2, vetmaxnette3 , ylab="euro" , names = c("Quota fissa", "Raddoppio", "Gioco equo"),  main="Vincite nette massime")
plot(budgetfinale2,type="l",main="Budget finale alla fine di ogni ciclo di giocate",xlab = "Giocatore 2")
plot(budgetfinale3,type="l",main="Budget finale alla fine di ogni ciclo di giocate",xlab = "Giocatore 3")
plot(budgetfinale,type="l",main="Budget finale alla fine di ogni ciclo di giocate",xlab = "Giocatore 1")
