document.addEventListener("keydown", function (event) {
  switch (event.key) {
    case "ArrowLeft":
      navigateToPrevious();
      break;
    case "ArrowRight":
      navigateToNext();
      break;
  }
});

function navigateToPrevious() {
  const prevLink = document.querySelector('a[rel="prev"]');
  if (prevLink) {
    window.location.href = prevLink.href;
  } else {
    console.log("No previous link found");
  }
}

function navigateToNext() {
  const nextLink = document.querySelector('a[rel="next"]');
  if (nextLink) {
    window.location.href = nextLink.href;
  } else {
    console.log("No next link found");
  }
}
