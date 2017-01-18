addEventListener('load',inicializarEventos,false);

function inicializarEventos() {
  var ob=document.getElementById('boton1');//boton de inicial
  ob.addEventListener('click',presionBoton,false);
}

function presionBoton(e) {
  var ab=document.getElementById('codigoD');//textArea
  recuperarDatos(ab.value);
}


function recuperarDatos(codigoD) {
	var contenedor = document.getElementById("resultados");
	
	var objetoXHR;
	if (window.XMLHttpRequest) {
		objetoXHR = new XMLHttpRequest();
		} else {
		// IE6, IE5
		objetoXHR = new ActiveXObject("Microsoft.XMLHTTP");
	}

	objetoXHR.onreadystatechange=function() {
	  	if ( (objetoXHR.readyState==4) && (objetoXHR.status=200) ) {
			
			var datos=JSON.parse(objetoXHR.responseText);
	    	var salida='';
			
    		for(var i=0; i<datos.length; i++) {
    	    	salida += 'Codigo: '+datos[i].codigoPel+"<br>";
      			salida += 'Nacionalidad: '+datos[i].nacionalidad+"<br>";
      			salida += 'Productora: '+datos[i].productora+"<br>";
      			salida += 'Director: '+datos[i].codigoD+"<br><br>";
			}
			contenedor.innerHTML = "<BR>"+salida;
		}
		else contenedor.innerHTML = "<BR>"+"Cargando...";
  	}
  	objetoXHR.open('GET','pagina1.php?codigoD='+codigoD, true);
  	objetoXHR.send();
 }
