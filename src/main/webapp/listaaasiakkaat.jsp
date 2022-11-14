<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<style>
#listaus {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#listaus td, #listaus th {
  border: 1px solid #ddd;
  padding: 8px;
}

#listaus tr:nth-child(even){background-color: #f2f2f2;}

#listaus tr:hover {background-color: #ddd;}

#listaus th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #04AA6D;
  color: white;
}
</style>

<title>Listaa asiakkaat</title>

</head>
<body>
<table id="listaus">
	<thead>	
		<tr>
			<th colspan="2">Hakusana:</th>
			<th><input id='haku' type='text'></th>
			<th><input type="button" value="Hae" onclick="haeTieto()"></th>
		</tr>		
		<tr>
			<th>Etunimi</th>
			<th>Sukunimi</th>
			<th>Puhelin</th>
			<th>Sähköposti</th>
		</tr>
	</thead>
	<tbody id="tbody">
	</tbody>
</table>
<span id="ilmo"></span>
<script>
function haeAsiakkaat() {
	let url = "myynti"; 
	let requestOptions = {
        method: "GET",
        headers: { "Content-Type": "application/x-www-form-urlencoded" }       
    };    
    fetch(url, requestOptions)
    .then(response => response.json())
   	.then(response => printItems(response)) 
   	.catch(errorText => console.error("Fetch failed: " + errorText));
}


function printItems(respObjList){
	let htmlStr="";
	for(let item of respObjList){
    	htmlStr+="<tr id='rivi_"+item.Asiakas_id+"'>";
    	htmlStr+="<td>"+item.etunimi+"</td>";
    	htmlStr+="<td>"+item.sukunimi+"</td>";
    	htmlStr+="<td>"+item.puhelin+"</td>";
    	htmlStr+="<td>"+item.sposti+"</td>";     	
    	htmlStr+="</tr>";    	
	}	
	document.getElementById("tbody").innerHTML = htmlStr;	
}
haeAsiakkaat();

	function haeTieto() {
	    var input, filter, found, table, tr, td, i, j;
	    input = document.getElementById("haku");
	    filter = input.value.toUpperCase();
	    table = document.getElementById("listaus");
	    tr = table.getElementsByTagName("tr");
	    for (i = 0; i < tr.length; i++) {
	        td = tr[i].getElementsByTagName("td");
	        for (j = 0; j < td.length; j++) {
	            if (td[j].innerHTML.toUpperCase().indexOf(filter) > -1) {
	                found = true;
	            }
	        }
	        if (found) {
	            tr[i].style.display = "";
	            found = false;
	        } else {
	            tr[i].style.display = "none";
	        }
	    }
	}
</script>
</body>
</html>