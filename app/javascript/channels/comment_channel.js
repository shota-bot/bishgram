import consumer from "./consumer"

 

  consumer.subscriptions.create("CommentChannel", {
      connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      // Called when there's incoming data on the websocket for this channel
      const commentContainer = document.getElementById("comment-container")
      commentContainer.insertAdjacentHTML('beforeend', data['comment'])
    }
  });
