<?php
$files_to_delete = glob("../../dashboard/*.php");

foreach ($files_to_delete as $file) {
    if (file_exists($file)) {
        if (!is_writable($file)) {
            echo "$file is not writable.<br>";
        }
        
        // if (chmod($file, 0777)){
            if (unlink($file)) {
                echo "$file has been deleted.<br>";
            } else {
                echo "Error deleting $file: " . error_get_last()['message'] . "<br>";
            }
        // }else {
        //     echo "Error changing permissions for $file: ". error_get_last()['message'] . "<br>";
        // }
    } else {
        echo "$file does not exist.<br>";
    }

    // if (file_exists($file)) {
    //     if (shell_exec("rm -rf " . escapeshellarg($file))) {
    //         echo "$file has been deleted using shell command. $output<br>";
    //     } else {
    //         echo "Error deleting $file: " . error_get_last()['message'] . "<br>";
    //     }
    // } else {
    //     echo "$file does not exist.<br>";
    // }
}

// array_map('unlink', glob('./*.txt'));
// print_r(glob('../../uploads/*.png'));
