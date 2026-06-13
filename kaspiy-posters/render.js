const puppeteer = require('puppeteer');
const path = require('path');

const W = 1080, H = 1350;
const files = [
  ['01-evolution.html', '01-evolution.jpg'],
  ['02-foundation.html', '02-foundation.jpg'],
];

(async () => {
  const browser = await puppeteer.launch({
    args: ['--no-sandbox', '--disable-setuid-sandbox'],
  });
  const page = await browser.newPage();
  await page.setViewport({ width: W, height: H, deviceScaleFactor: 2 });
  for (const [src, out] of files) {
    const url = 'file://' + path.resolve(__dirname, src);
    await page.goto(url, { waitUntil: 'networkidle0' });
    await page.evaluateHandle('document.fonts.ready');
    await new Promise(r => setTimeout(r, 400));
    await page.screenshot({
      path: path.resolve(__dirname, out),
      type: 'jpeg',
      quality: 92,
      clip: { x: 0, y: 0, width: W, height: H },
    });
    console.log('rendered', out);
  }
  await browser.close();
})();
