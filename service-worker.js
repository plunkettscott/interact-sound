/**
 * Welcome to your Workbox-powered service worker!
 *
 * You'll need to register this file in your web app and you should
 * disable HTTP caching for this file too.
 * See https://goo.gl/nhQhGp
 *
 * The rest of the code is auto-generated. Please don't update this file
 * directly; instead, make changes to your Workbox build configuration
 * and re-run your build process.
 * See https://goo.gl/2aRDsh
 */

importScripts("https://storage.googleapis.com/workbox-cdn/releases/3.6.3/workbox-sw.js");

/**
 * The workboxSW.precacheAndRoute() method efficiently caches and responds to
 * requests for URLs in the manifest.
 * See https://goo.gl/S9QRab
 */
self.__precacheManifest = [
  {
    "url": "404.html",
    "revision": "7649cb499911c90ad70921928732cc8f"
  },
  {
    "url": "assets/css/0.styles.6391059d.css",
    "revision": "a4f3df9f811ffa256c3e6d541454fee8"
  },
  {
    "url": "assets/img/search.83621669.svg",
    "revision": "83621669651b9a3d4bf64d1a670ad856"
  },
  {
    "url": "assets/js/2.0afee41c.js",
    "revision": "47b6821e8e3e36b7d9838affd96ff032"
  },
  {
    "url": "assets/js/3.e9657327.js",
    "revision": "9cbfb2e16e1abcf5f4e6442ace7fce9c"
  },
  {
    "url": "assets/js/4.02bf0ff1.js",
    "revision": "aeb4dc55c301c7a5214ad147c2fe1cb0"
  },
  {
    "url": "assets/js/5.1f41604f.js",
    "revision": "77bdbc5093ec1b1308285b7662614083"
  },
  {
    "url": "assets/js/app.0cb9e253.js",
    "revision": "0d1503d54ec578ad9dc08bdc9ec9bbf1"
  },
  {
    "url": "index.html",
    "revision": "d9e8551e903632f4c7c73dc1c1c63e26"
  },
  {
    "url": "start/index.html",
    "revision": "0757e54730bbcbad894e013bbad513e8"
  }
].concat(self.__precacheManifest || []);
workbox.precaching.suppressWarnings();
workbox.precaching.precacheAndRoute(self.__precacheManifest, {});
addEventListener('message', event => {
  const replyPort = event.ports[0]
  const message = event.data
  if (replyPort && message && message.type === 'skip-waiting') {
    event.waitUntil(
      self.skipWaiting().then(
        () => replyPort.postMessage({ error: null }),
        error => replyPort.postMessage({ error })
      )
    )
  }
})
