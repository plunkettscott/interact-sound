
/**
 * The Sound Server for Interact Sound.
 */
class Server {

  /**
   * The resource name at time of instantiation.
   */
  private resourceName: string

  /**
   * The sound tags registered with this Sound Server.
   */
  private soundTags: object = {}

  /**
   * Constructor.
   */
  public constructor() {
    this.resourceName = GetCurrentResourceName()

    this.fetchSoundTags()
  }

  /**
   * Gets the current resource name when the Server was instantiated.
   */
  public getResourceName() {
    return this.resourceName
  }

  /**
   * Fetch all tagged sounds for playback later.
   */
  private fetchSoundTags(): void {
    const numMetadata: number = GetNumResourceMetadata(this.getResourceName(), 'is_tag')

    for (let i: number = 0; i < numMetadata; i++) {
      const tag: string = GetResourceMetadata(this.getResourceName(), 'is_tag', i)
      const data: any = GetResourceMetadata(this.getResourceName(), 'is_tag_extra', i)

      if (data === null) {
        console.warn('Not all `is_tag` entries have a data object. The data object is required for the tag to be created.')
        continue;
      }

      console.log(tag, data)
    }
  }

}

export default Server