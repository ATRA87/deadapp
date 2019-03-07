const scroll = () => {
  const chatScroll = document.querySelector('.chat-box');
  if (chatScroll) {
    chatScroll.scrollTop = chatScroll.scrollHeight;
  }
}

scroll();
