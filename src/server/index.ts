import { gt } from 'semver'
import { version } from '../../package.json'
import axios, { AxiosResponse } from 'axios'
import Server from './Server';

let soundServer: Server = new Server()

/**
 * Fetch the latest version of this resource from Github.
 */
async function getLatestVersion(): Promise<string> {
  try {
    return (await axios.get('https://api.github.com/repos/plunkettscott/interact-sound/releases/latest'))
      .data
      .tag_name
  } catch (e) {
    console.error('Failed checking for latest version. Assuming the current version is the latest version.')

    return version
  }
}

/**
 * Check if an update is available in Github.
 */
async function isUpdateAvailable(): Promise<boolean> {
  return gt(await getLatestVersion(), version)
}

/**
 * Triggered when any Resource is started. We only care
 * if our resource starts. When it starts, check the version
 * and log that an update is available in the server console if
 * one is available.
 * 
 */
onNet('onResourceStart', async (resourceName: string) => {
  if (resourceName !== GetCurrentResourceName()) {
    return;
  }

  if (await isUpdateAvailable()) {
    console.warn('An update is available for Interact Sound. Please consider updating ASAP.')
  }

  console.log(`Interact Sound v${version} has started.`)
})

exports('soundServer', soundServer)
