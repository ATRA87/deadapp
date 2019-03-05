$(document).ready(() => {
  const updateChat = function(data) {
    $('.chat-box').append(`
      <div class="col-12">
        <div class="chat bg-secondary d-inline-block text-left text-white mb-2">
          <div class="chat-bubble">
            <small class="chat-username">${data.identifier}</small>
            <p class="m-0 chat-message">${data.message}</p>
          </div>
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
    if (data.project_id == project_id && (data.sender_id == user_id) || (data.target_id == user_id) ) {
      updateChat(data);
    }
  });
});
