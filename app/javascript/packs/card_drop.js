$(document).ready(function() {
    console.log("1")
    var cards = document.getElementsByClassName('card');
    var isDown;
    var offset;
    var div;
    var pool = document.getElementById('pool');

    var mouse_down = function (e) {
        console.log('mouse_don');
        div = e.target.closest('.card');
        div.style.position = 'absolute'
        console.log(div);
        isDown = true;
        offset = [
            0, //div.offsetLeft - e.clientX,
            0 //div.offsetTop - e.clientY
        ];
    };
    console.log(cards)
    console.log(cards.length)
    for (var i = 0; i < cards.length; i++) {
        console.log(cards[i])
        cards[i].addEventListener('mousedown', mouse_down, true);
    }
    console.log("4")
    document.addEventListener('mouseup', function () {
        console.log('UP')
        isDown = false;
        div.style.position = 'initial'
        pool.appendChild(div)
        // AJAX call for changing List-card relation
        // change_list(card_id, list_id)
    }, true);

    document.addEventListener('mousemove', function (event) {
        event.preventDefault();
        if (isDown) {
            mousePosition = {

                x: event.clientX,
                y: event.clientY

            };
            console.log(div)
            console.log(mousePosition.x.toString() + " - " + mousePosition.y.toString())
            div.style.left = (mousePosition.x + offset[0]) + 'px';
            div.style.top = (mousePosition.y + offset[1]) + 'px';
        }
    }, true);
});