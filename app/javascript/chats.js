$(document).ready(() => {

  const updateChat = (data, sender) => {
    $('.chat-box').append(`
      <div class="chat-bubble-wrapper">
        <div class="chat-bubble ${sender}">
          <div class="chat-username">${data.identifier}</div>
          <div class="chat-message">${data.message}</p>
        </div>
      </div>
    `);
  };

  $('#chat-form').on('ajax:success', function(data) {
    $('#chat-form')[0].reset();
  });

  const pusher = new Pusher('85b1b7fa9a3494841e76', {
    cluster: 'us2',
    encrypted: true
  });

  const channel = pusher.subscribe('chat');
  channel.bind('new', function(data) {
    let user_id = $('.chat-box').data("user_id")
    let project_id = $('.chat-box').data("project_id")
    let current_user = $('.chat-box').data("current_user")
    let sender = data.sender_id == current_user ? "me" : "him"
    if (data.project_id == project_id && (data.sender_id == user_id) || (data.target_id == user_id) ) {
      updateChat(data, sender);
      let chatBox = document.querySelector('.chat-box');
      chatBox.scrollTop = chatBox.scrollHeight - chatBox.clientHeight;
    }
  });
});
