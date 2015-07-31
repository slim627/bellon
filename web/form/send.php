<?php
$ajax = (!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest');

//we do not allow direct script access
if (!$ajax) {
	//redirect to contact form
	$form = '../invia-contact.html';
	header("Location: " . $form);
	exit;
}

require_once(dirname(__FILE__) . '/vendor/ctPHPMailer.php');

$debug = false; //if problems occur, set to true to view debug messages

$mail = new ctPHPMailer();

/**
For GMAIL configuration please use this values:

$mail->Host = "smtp.gmail.com"; // SMTP server
$mail->Username = "mail@gmail.com"; // SMTP account username
$mail->Password = "yourpassword"; // SMTP account password
$mail->Port = 465; // set the SMTP port for the GMAIL server
$mail->SMTPSecure = "ssl";

More configuration options available here: https://code.google.com/a/apache-extras.org/p/phpmailer/wiki/ExamplesPage
 */

/**
 * SERVER CONFIG
 */
$mail->Host = "mail.yourdomain.com."; // sets the SMTP server
$mail->Username = "username"; // SMTP account username
$mail->Password = "password"; // SMTP account password
$mail->SMTPAuth = true; // enable SMTP authentication - true if username and password required
$mail->Port = 587; // set the SMTP port (usually 587, or 465 when SSL)

$mail->IsSMTP();
$mail->SMTPDebug = $debug ? 2 : 0; // debug messages - set debug to false on production!


/**
 * Config for simple mail() function
 * Just delete whole section (or just line $mail->IsSMTP();) "SMTP" above and mail will use default mail() function
 */


/**
 * MAIL CONFIG
 */

$mail->SetFrom('company@company.com', 'First Last'); //from address
$mail->AddAddress("recipient@company.com", "Sender Name"); //where to send email
$mail->Subject = "Contact Form";

//setup proper validation errors. If you change required=false, please make
//sure your contact form does not have "required" tag in input fields
//also keys of array (name, message, email) are the names used in contact form
$formFields = array(
	'name' => array('required' => true, 'required_error' => "Field is required"),
	'message' => array('required' => true, 'required_error' => "Field is required"),
	'email' => array('required' => true, 'required_error' => "Field is required", 'email_error' => "Email invalid"),
);

$errorMessage = "Unfortunately we couldn't deliver your message. Please try again later.";
$successMessage = "Thank you. We will contact you shortly.";

//NO NEED TO EDIT ANYTHING BELOW

//let's validate and return errors if required
if ($errors = $mail->validate($formFields, $_POST)) {
	echo json_encode(array('errors' => $errors));
	exit;
}

$mail->setup(dirname(__FILE__) . '/mail.html', $_POST, $formFields);

if (!$mail->Send()) {
	$message = '<div class="alert alert-error">' . $errorMessage . '<a data-dismiss="alert" class="close" href="#">×</a></div>';
} else {
	$message = '<div class="alert alert-notice">' . $successMessage . '<a data-dismiss="alert" class="close" href="#">×</a></div>';
}

echo json_encode(array('msg' => $message));
exit;