function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  var browser = karate.properties['browser'] || 'chromedriver';
  karate.log('the browser set is: ' + browser + ', default: "chrome"');
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    browser:browser,
    myVarName: 'someValue'
  }
  
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
    config.baseUrl =  "https://www.saucedemo.com/"
    config.homepageUrl = "https://www.saucedemo.com/inventory.html"
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}