<?php
$date = date('dMYHis');
$latitude = isset($_POST['lat']) ? $_POST['lat'] : 'Unknown';
$longitude = isset($_POST['lon']) ? $_POST['lon'] : 'Unknown';
$accuracy = isset($_POST['acc']) ? $_POST['acc'] : 'Unknown';

if (!empty($_POST['lat']) && !empty($_POST['lon'])) {

    $data = "Latitude: " . $latitude . "\r\n" .
    "Longitude: " . $longitude . "\r\n" .
    "Accuracy: " . $accuracy . " meters\r\n" .
    "Google Maps: https://www.google.com/maps/place/" . $latitude . "," . $longitude . "\r\n" .
    "Date: " . $date . "\r\n";

    // Create saved_locations directory if it doesn't exist
    if (!is_dir('saved_locations')) {
        mkdir('saved_locations', 0755, true);
    }

    // File sirf saved_locations folder mein save hogi
    $file = 'saved_locations/location_' . $date . '.txt';

    try {
        $fp = fopen($file, 'w');
        if ($fp) {
            fwrite($fp, $data);
            fclose($fp);

            // Return success response
            header('Content-Type: application/json');
            echo json_encode(['status' => 'success', 'message' => 'Location saved in saved_locations folder']);
        } else {
            throw new Exception("Could not open file for writing");
        }
    } catch (Exception $e) {
        header('Content-Type: application/json');
        echo json_encode(['status' => 'error', 'message' => 'Could not save location data']);
    }
} else {
    header('Content-Type: application/json');
    echo json_encode(['status' => 'error', 'message' => 'Location data missing or incomplete']);
}

exit();
?>
