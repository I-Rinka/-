#���㴫������ĸ���
function sayHello {
    if ($args.Count -eq 0) {
        "No argument!"
    }
    else {
        $args | ForEach-Object { "Hello,$($_)" }
    }
}