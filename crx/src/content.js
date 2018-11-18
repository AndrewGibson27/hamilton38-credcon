const ENDPOINT = 'http://localhost:3000/api';
const STYLES = `
  .hamilton-68 {
    background: #222 !important;
    box-shadow: 6px 10px 15px -1px rgba(134, 51, 51, 0.75) !important;
    top: 20px !important;
    left: 20px !important;
    margin: 0 !important;
    padding: 20px !important;
    position: fixed !important;
    width: 400px !important;
    z-index: 99999999 !important;
  }

  .hamilton-68__para {
    color: #fff !important;
    font-family: sans-serif !important;
    font-size: 16px !important;
    line-height: 1.5 !important;
  }

  .hamilton-68__para:first-child {
    margin-bottom: 10px !important;
  }

  .hamilton-68__para a {
    color: #416abb !important;
    font-weight: bold !important;
    text-decoration: none !important;
  }

  .hamilton-68__para a:hover {
    color: #9f9fd2 !important;
  }
`;

function buildStyles() {
  const styleTag = document.createElement('style');
  styleTag.appendChild(document.createTextNode(STYLES));
  document.head.appendChild(styleTag);
}

function getBoxContent(num) {
  const box = `
    <aside class="hamilton-68">
      <p class="hamilton-68__para">
        The article you're reading has been mentioned in Russian propaganda efforts ${num} times in the past 48 hours.
      </p>
      <p class="hamilton-68__para">
        Learn more by visiting the <a href="https://dashboard.securingdemocracy.org/">Hamilton 68</a> dashboard.
      </p>
    </aside>
  `;
  return box;
}

function buildBox(num) {
  const aside = document.createElement('aside');
  aside.innerHTML = getBoxContent(num);
  document.body.appendChild(aside);
}

async function checkUrl() {
  const url = window.location.href;
  
  try {
    const result = await fetch(`${ENDPOINT}?url=${url}`);
    const { status } = result;
    
    if (status === 404) {
      const json = await result.json();
      const { num } = json;
      buildStyles();
      buildBox(num || 100);
    }
  } catch (err) {
    console.error(`Something went wrong: ${err.message}`);
  }
}

checkUrl();