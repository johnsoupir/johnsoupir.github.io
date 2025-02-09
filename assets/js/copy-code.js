console.log("Copy-code script loaded");

document.addEventListener('DOMContentLoaded', function() {
    // Loop over all <pre> elements that contain a <code> element.
    document.querySelectorAll('pre').forEach(function(pre) {
      const code = pre.querySelector('code');
      if (!code) return; // Skip if no code element is found.
  
      // Create the copy button.
      const button = document.createElement('button');
      button.classList.add('copy-button');
      button.type = 'button';
      button.textContent = 'Copy';
  
      // Append the button to the pre element.
      pre.style.position = 'relative';
      pre.appendChild(button);
  
      // Add the click event to copy code to the clipboard.
      button.addEventListener('click', function() {
        // Get the text content of the code block.
        const text = code.innerText;
        navigator.clipboard.writeText(text).then(() => {
          button.textContent = 'Copied!';
          setTimeout(() => {
            button.textContent = 'Copy';
          }, 2000);
        }).catch(err => {
          console.error('Error copying text: ', err);
        });
      });
    });
  });
  