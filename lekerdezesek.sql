--Hazai csapatok sorrendben kapott gólok és szerzett gólok különbsége alapján
SELECT cs.NEV,
	   SUM(KAPOTT_GOL)-SUM(SZERZETT_GOL) AS "KULONBSEG"
FROM Merkozesek m JOIN Csapatok cs ON m.HAZAI_CSAPAT_ID=cs.ID
GROUP BY cs.NEV
ORDER BY SUM(KAPOTT_GOL)-SUM(SZERZETT_GOL)

--Legnagyobb férőhelyű stadion csapatának elnöke
SELECT TOP 1 cs.ELNOK
FROM Csapatok cs JOIN Stadionok s ON cs.ID=s.CSAPATOK_ID
ORDER BY s.FEROHELY DESC

--Fordulónként gólszámok növekvő sorrendben
SELECT f.FORDULO_ID,
       SUM(m.KAPOTT_GOL) + SUM(m.SZERZETT_GOL) AS "GOLSZAMOK"
FROM Merkozesek m JOIN Fordulok f ON m.FORDULO_ID=f.FORDULO_ID
GROUP BY f.FORDULO_ID
ORDER BY SUM(m.KAPOTT_GOL) + SUM(m.SZERZETT_GOL) ASC

--Pancho arénában mikor játszottak, kik, és összesen hány gólt lőttek
SELECT m.HAZAI_CSAPAT_ID,
	   m.VENDEG_CSAPAT_ID,
       f.DATUM, KAPOTT_GOL+SZERZETT_GOL AS "OSSZES GOL"
FROM Merkozesek m JOIN Csapatok cs ON m.HAZAI_CSAPAT_ID=cs.ID
JOIN Stadionok s ON cs.ID=s.CSAPATOK_ID
JOIN Fordulok f ON m.FORDULO_ID=f.FORDULO_ID
WHERE s.STADION_NEV LIKE 'Pancho Aréna'

--Csapatonként szereplések száma és helyezések átlaga a góllövőlistán
SELECT cs.NEV,
	   COUNT(g.CSAPAT_ID) AS "SZEREPLESEK",
       AVG(g.HELYEZES) AS "HELYEZESEK ATLAGA"
FROM Csapatok cs JOIN Gollovolista g ON cs.ID=g.CSAPAT_ID
GROUP BY cs.NEV