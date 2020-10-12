import consumer from "./consumer"
import CableReady from "cable_ready"

export default function connect_room_channel(room_id) {
  consumer.subscriptions.create({ channel: "RoomChannel", room: room_id }, {
    received(data) {
      if (data.cableReady) CableReady.perform(data.operations)
    }
  });
}
