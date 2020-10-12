import ApplicationController from './application_controller'
import channel from 'channels/room_channel'

/* This is the custom StimulusReflex controller for the Example Reflex.
 * Learn more at: https://docs.stimulusreflex.com
 */
export default class extends ApplicationController {
  static targets = ["roomId", "playerList"]

  connect() {
    super.connect()
    channel(this.roomIdTarget.dataset.roomId)
  }

  refreshPlayers() {
    this.stimulate(this.playerListTarget.dataset.reflexAction)
  }

}