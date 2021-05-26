<?php include 'includes/session.php'; ?>
<?php include 'includes/header.php'; ?>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <?php include 'includes/navbar.php'; ?>
  <?php include 'includes/menubar.php'; ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
     
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Analytics</li>
      </ol>
    </section>
<?php
//index.php

$error = '';
$longitude = '';
$latitude = '';
$Area = '';
$Status= '';
$Timeofday = '';
$Population = '';
$di = '';

function clean_text($string)
{
 $string = trim($string);
 $string = stripslashes($string);
 $string = htmlspecialchars($string);
 return $string;
}

if(isset($_POST["submit"]))
{
 if(empty($_POST["longitude"]))
 {
  
  $error .= '<p><label class="text-danger">Longitude is required</label></p>';
 }
 else
 {
  $longitude = clean_text($_POST["longitude"]);
 }
 if(empty($_POST["latitude"]))
 {
  $error .= '<p><label class="text-danger">Latitude is required</label></p>';
 }
 else
 {
  $latitude = clean_text($_POST["latitude"]);
 }
 if(empty($_POST["Area"]))
 {
  $error .= '<p><label class="text-danger">Area is required</label></p>';
 }
 else
 {
  $Area = clean_text($_POST["Area"]);
 }
 if(empty($_POST["Status"]))
 {
  $error .= '<p><label class="text-danger">Status is required</label></p>';
 }
 else
 {
  $Status = clean_text($_POST["Status"]);
 }
  if(empty($_POST["Timeofday"]))
 {
  $error .= '<p><label class="text-danger">Time is required</label></p>';
 }
 else
 {
  $Timeofday = clean_text($_POST["Timeofday"]);
 }
  if(empty($_POST["Population"]))
 {
  $error .= '<p><label class="text-danger">Population is required</label></p>';
 }
 else
 {
  $Population = clean_text($_POST["Population"]);
 }
  if(empty($_POST["di"]))
 {
  $error .= '<p><label class="text-danger">Distance to time required is required</label></p>';
 }
 else
 {
  $di = clean_text($_POST["di"]);
 }
 

 if($error == '')
 {
  $file_open = fopen("E:\Geo-Tag-waste-management--master\src\R\Dustbin.csv", "a");
  $no_rows = count(file("E:\Geo-Tag-waste-management--master\src\R\Dustbin.csv"));
  if($no_rows > 1)
  {
   $no_rows = ($no_rows - 1) + 1;
  }
  $form_data = array(
  //'sr_no'  => $no_rows,
   
   'longitude' => $longitude,
   'latitude' => $latitude,
   'Area' => $Area,
   'Status' => $Status,
   'Timeofday' => $Timeofday,
   'Population' => $Population,
   'di' => $di
   
   
  );
  fputcsv($file_open, $form_data);
  $error = '<label class="text-success">Thank you for contacting us</label>';
  
	$longitude = '';
	$latitude = '';
	$Area = '';
	$Status= '';
	$Timeofday = '';
	$Population = '';
	$di = '';
 }
}



?>
<!DOCTYPE html>
<html>
 <head>
  <title>Add location</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 </head>
 <body>
  <br />
  <div class="container">
   
   <br />
   <div class="col-md-6" style="margin:0 auto; float:none;">
    <form method="post">
     <h3 align="center">Add location</h3>
     <br />
     <?php echo $error; ?>
     <div class="form-group">
      <label>Longitude</label>
      <input type="text" name="longitude" placeholder="Longitude" class="form-control"value="<?php echo $longitude; ?>"/ >
     </div>
	 <div class="form-group">
      <label>Latitude</label>
      <input type="text" name="latitude" placeholder="Lattitude" class="form-control"value="<?php echo $latitude; ?>"/ >
     </div>
     
      <div class="form-group">
      <label for="City">City:</label>
      <select name="Area" class="form-control" id="message"value="<?php echo $Area; ?>" />
		<option>Select</option>
        <option>Mumbai</option>
        <option>Navi Mumbai</option>
        <option>Thane City</option>
      </select>
         
    </div>

     
	 <div class="form-group">
      <label for="Status">Status:</label>
      <select name="Status"class="form-control" id="message"value="<?php echo $Status; ?>" />
        <option>Select</option>
		<option>Full</option>
        <option>Half</option>
        <option>Empty</option>
      </select>
         
    </div>
	 <div class="form-group">
      <label for="Time of Day">Time of Day:</label>
      <select name="Timeofday"class="form-control" id="message"value="<?php echo $Timeofday; ?>" />
        <option>Select</option>
		<option>7-10 am</option>
        <option>11am-3pm</option>
        <option>3-7 pm</option>
		<option>7-12 am</option>
      </select>
         
    </div>
	 <div class="form-group">
      <label>Population</label>
      <input type="number" name="Population" class="form-control" placeholder="Population"value="<?php echo $Population; ?>" />
     </div>
	 
      <div class="form-group">
      <label>Distance to industry(in km)</label>
      <input type="number" name="di" class="form-control" placeholder="Distance to Industry"value="<?php echo $di; ?>" />
     </div>
     <div class="form-group" align="center">
      <input type="submit" name="submit" class="btn btn-info" value="Submit" />
     </div>
    </form>
   </div>
  </div>
 </body>
</html>