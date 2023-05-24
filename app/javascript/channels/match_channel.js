import consumer from "./consumer"

console.log('hello')

window.match_channel = 
consumer.subscriptions.create("MatchChannel", {
  connected() {
    console.log('connected')

    let start_button = document.getElementById("start_button")
    if (start_button) {
      start_button.addEventListener("click", () => {
        this.ready()
      })
    }
    let move_botton = document.getElementById("move_button")
    if (move_button) {
      move_botton.addEventListener("click", () => {
        this.makeMove()
      })
    }
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    if (data.fun === 'loadMatch') {
      this.loadMatch()
    }
    else if (data.fun === 'startMatch') {
      this.startMatch()
    }
    else if (data.fun === 'refreshBoard') {
      this.refreshBoard()
    }
    else if (data.fun === 'endMatch') {
      this.endMatch()
    }
  },
  loadMatch() {
    window.location = window.origin + '/matches/load'
  },
  ready(){
    this.perform("startMatch")
  },
  startMatch() {
    this.refreshBoard()
  },
  refreshBoard(){
    window.location = window.origin + '/matches/refresh_board'
  },
  makeMove() {
    let source_row = document.getElementById('source_row')
    source_row = source_row.options[source_row.selectedIndex].text;
    let source_col = document.getElementById('source_col')
    source_col = source_col.options[source_col.selectedIndex].text;
    let dest_row = document.getElementById('dest_row')
    dest_row = dest_row.options[dest_row.selectedIndex].text;
    let dest_col = document.getElementById('dest_col')
    dest_col = dest_col.options[dest_col.selectedIndex].text;
    this.perform("makeMove", {source_row: source_row, source_col: source_col, dest_row: dest_row, dest_col: dest_col})
  },
  endMatch() {
    window.location = window.origin + '/matches/end'
  }

});
