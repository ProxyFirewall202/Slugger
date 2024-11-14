const { execSync } = require('child_process');
const fs = require('fs');

// Step 1: Check if we're on the 'unstable' branch
let currentBranch = execSync('git rev-parse --abbrev-ref HEAD').toString().trim();

if (currentBranch !== 'unstable') {
    console.log(`You are on the "${currentBranch}" branch. Switching to "unstable"...`);
    execSync('git checkout unstable');  // Automatically switch to the unstable branch
    currentBranch = 'unstable';  // Update currentBranch to 'unstable' after switching
    console.log('Switched to the "unstable" branch.');
} else {
    console.log('You are on the "unstable" branch. Proceeding with tag creation.');
}

// Step 2: Modify the index.html file (as described in your previous steps)
// Example: This part adds the Google Tag to index.html

const indexFilePath = 'C:/Proxys-Machine Syncs/Game Files/Code Save Files/Slugger/Slugger Repo/slugger-snapshot/public/index.html';  // Adjust this path if needed
const googleTagScript = `
<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-VFCJQNXD2Y"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-VFCJQNXD2Y');
</script>
<!-- End Google Tag Manager -->
`;

if (fs.existsSync(indexFilePath)) {
    let indexHtml = fs.readFileSync(indexFilePath, 'utf-8');
    
    // Add the Google Tag under the opening <head> tag
    indexHtml = indexHtml.replace('<head>', `<head>${googleTagScript}`);
    
    // Save the updated file
    fs.writeFileSync(indexFilePath, indexHtml);
    console.log('Updated index.html with Google Tag.');
} else {
    console.log('index.html file not found.');
    process.exit(1);  // Exit the script if the file doesn't exist
}

// Step 3: Stage, commit, and push changes
execSync('git add .');
execSync('git commit -m "(Extremely unstable) A snapshot of the newest update in the works"');
execSync('git push origin unstable');

// Step 4: Create the version tag based on your format

// Get the current year (two digits)
const currentYear = moment().year().toString().slice(-2);

// Get the current week of the year (1-52)
const currentWeek = moment().week();

// Step 5: Count the number of tags in the current week
const tagsThisWeek = execSync(`git tag --list 'SNAPSHOT150-${currentYear}.${currentWeek}*'`).toString().split('\n').filter(Boolean).length;
const releaseLetterThisWeek = String.fromCharCode(97 + tagsThisWeek);  // Convert number to letter ('a' = 1, 'b' = 2, etc.)

// Step 6: Count the total number of tags (total releases)
const totalTags = execSync('git tag --list "SNAPSHOT150*"').toString().split('\n').filter(Boolean).length;

// Combine the components into the desired format
const versionTag = `SNAPSHOT150-${currentYear}.${currentWeek}${releaseLetterThisWeek}${totalTags}exp`;

// Create the tag and push it
execSync(`git tag ${versionTag}`);
execSync(`git push origin ${versionTag}`);

console.log(`Pushed new version tag: ${versionTag}`);