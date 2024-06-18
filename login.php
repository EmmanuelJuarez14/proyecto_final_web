<?php
include "db.php";

session_start();

#El script de inicio de sesión comienza aquí
#Si la credencial proporcionada por el usuario coincide correctamente con los datos disponibles en la base de datos, repetiremos la cadena login_success
#La cadena login_success volverá a la función anónima llamada $("#login").click()

if(isset($_POST["email"]) && isset($_POST["password"])){
	$email = mysqli_real_escape_string($con,$_POST["email"]);
	$password = $_POST["password"];
	$sql = "SELECT * FROM user_info WHERE email = '$email' AND password = '$password'";
	$run_query = mysqli_query($con,$sql);
	$count = mysqli_num_rows($run_query);
    $row = mysqli_fetch_array($run_query);
		$_SESSION["uid"] = $row["user_id"];
		$_SESSION["name"] = $row["first_name"];
		$ip_add = getenv("REMOTE_ADDR");
		//Hemos creado una cookie en la página login_form.php, por lo que si esa cookie está disponible significa que el usuario no ha iniciado sesión.
        
	//si el registro de usuario está disponible en la base de datos, entonces $count será igual a 1
	if($count == 1){
		   	
			if (isset($_COOKIE["product_list"])) {
				$p_list = stripcslashes($_COOKIE["product_list"]);
				//aquí estamos decodificando la cookie de lista de productos json almacenada en una matriz normal
				$product_list = json_decode($p_list,true);
				for ($i=0; $i < count($product_list); $i++) { 
					//Después de obtener la identificación de usuario de la base de datos, aquí estamos verificando el artículo del carrito del usuario si 
					//ya hay un producto en la lista o no.
					$verify_cart = "SELECT id FROM cart WHERE user_id = $_SESSION[uid] AND p_id = ".$product_list[$i];
					$result  = mysqli_query($con,$verify_cart);
					if(mysqli_num_rows($result) < 1){
						//si el usuario agrega un producto al carrito por primera vez, actualizaremos user_id en la tabla de la base de datos con una identificación válida
						$update_cart = "UPDATE cart SET user_id = '$_SESSION[uid]' WHERE ip_add = '$ip_add' AND user_id = -1";
						mysqli_query($con,$update_cart);
					}else{
						//si ese producto ya está disponible en la tabla de la base de datos, eliminaremos ese registro
						$delete_existing_product = "DELETE FROM cart WHERE user_id = -1 AND ip_add = '$ip_add' AND p_id = ".$product_list[$i];
						mysqli_query($con,$delete_existing_product);
					}
				}
				//aquí estamos destruyendo la cookie del usuario
				setcookie("product_list","",strtotime("-1 day"),"/");
				//si el usuario inicia sesión desde la página posterior al carrito, enviaremos cart_login
				echo "cart_login";
				
				
				exit();
				
			}
			//si el usuario inicia sesión desde la página, enviaremos login_success
			echo "login_success";
			$BackToMyPage = $_SERVER['HTTP_REFERER'];
				if(!isset($BackToMyPage)) {
					header('Location: '.$BackToMyPage);
					echo"<script type='text/javascript'>
					
					</script>";
				} else {
					header('Location: index.php'); // página por defecto
				} 
				
			
            exit;

		}else{
                $email = mysqli_real_escape_string($con,$_POST["email"]);
                $password =md5($_POST["password"]) ;
                $sql = "SELECT * FROM admin_info WHERE admin_email = '$email' AND admin_password = '$password'";
                $run_query = mysqli_query($con,$sql);
                $count = mysqli_num_rows($run_query);

            //si el registro de usuario está disponible en la base de datos, entonces $count será igual a 1
            if($count == 1){
                $row = mysqli_fetch_array($run_query);
                $_SESSION["uid"] = $row["admin_id"];
                $_SESSION["name"] = $row["admin_name"];
                $ip_add = getenv("REMOTE_ADDR");
                //Hemos creado una cookie en la página login_form.php, por lo que si esa cookie está disponible significa que el usuario no ha iniciado sesión.


                    //si el usuario inicia sesión desde la página, enviaremos login_success
                    echo "login_success";

                    echo "<script> location.href='admin/addproduct.php'; </script>";
                    exit;

                }else{
                    echo "<span style='color:red;'>Por favor, registrese antes de ingresar</span>";
                    exit();
                }
    
	
}
    
	
}

?>