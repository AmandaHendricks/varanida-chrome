// TODO: List of url blocked. We need to connect to our REST API to refresh our local JSON file. We can also store this list on the blockchain.

var blocked_url = [
  'googlesyndication.com',
  'adclick.g.doubleclick.net'
];

var callback = function(details) {
  var redirect = blocked_url.some(function(element) {
    return (details.url.indexOf(element) != -1);
  });
  if (redirect) {
    console.log(details.type + " " + details.url);
    var urlRedirect = (details.type == "image" ? "empty.png" : (details.type == "script" ? "empty.js" : "empty.html"));

	// TODO: Add here Implement counter of ads blocked and send request to the smart contrat

    return { redirectUrl: chrome.runtime.getURL(urlRedirect) };
  }
};
var filter = {urls: ["<all_urls>"]};
var options = ["blocking"];
chrome.webRequest.onBeforeRequest.addListener(callback, filter, options)
