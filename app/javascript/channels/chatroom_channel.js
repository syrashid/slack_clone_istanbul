import consumer from "./consumer";

const initChatroomCable = () => {
  // First find the element
  const messagesContainer = document.getElementById('messages');
  // And only if it exists on the page, do something
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;

    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        messagesContainer.insertAdjacentHTML('beforeend', data);
        // called when data is broadcast in the cable
      },
    });
  }
}

export { initChatroomCable };
