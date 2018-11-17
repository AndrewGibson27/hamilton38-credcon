const ENDPOINT = 'http://localhost:3000/api?url=foo';
const BOX = `
  <aside class="hamilton-68">
    <p class="hamilton-68__para">
      The article you're reading has been linked to Russian propaganda efforts.
    </p>
  </aside>
`;
const STYLES = `
  .hamilton-68 {
    align-items: center;
    background: rgb(220, 138, 138);
    border-top: 3px solid rgb(255, 255, 255);
    bottom: 0px;
    display: flex;
    height: 100px;
    justify-content: center;
    left: 0px;
    margin: 0;
    opacity: 0.95;
    position: fixed;
    transform: translateY(0%);
    transition: transform 0.5s ease 0s;
    width: 100%;
    z-index: 99999999;
  }

  .hamilton-68__para {
    color: rgb(255, 255, 255);
    font-size: 1.5rem;
    font-weight: bold;
    margin: 0;
    text-align: center;
  }
`;

function buildStyles() {
  const styleTag = document.createElement('style');
  styleTag.appendChild(document.createTextNode(STYLES));
  document.head.appendChild(styleTag);
}

function buildBox() {
  const aside = document.createElement('aside');
  aside.innerHTML = BOX;
  document.body.appendChild(BOX);
}

async function checkUrl() {
  try {
    const result = await fetch(ENDPOINT);
    const { status } = result;
    
    if (status === 200) {
      buildStyles();
      buildBox();
    }
  } catch (err) {
    console.error(`Something went wrong: ${err.message}`);
  }
}

checkUrl();