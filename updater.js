const moment = require('moment');
const fs = require('fs');

const { execSync } = require('child_process');

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

// Function to get all tags
const getTags = () => {
  const tags = execSync('git tag --list').toString().split('\n').filter(Boolean);
  return tags;
};

// Function to count the number of tags in the current week
const countWeeklyReleases = (tags) => {
  const currentWeek = moment().isoWeek(); // Get current ISO week number
  return tags.filter(tag => {
    const tagDate = moment(tag, 'SNAPSHOTYYYY-Www-a'); // Parse the date part of the tag
    return tagDate.isoWeek() === currentWeek; // Check if the tag is in the current week
  }).length;
};

// Function to count the total number of releases (tags)
const countTotalReleases = (tags) => {
  return (tags.length + 1);
};

// Get current year and week
const currentYear = moment().year().toString().slice(-2);
const currentWeek = moment().isoWeek();

// Get the tags from git
const tags = getTags();

// Count the weekly releases and total releases
const weeklyReleases = countWeeklyReleases(tags);
const totalReleases = countTotalReleases(tags);

// Generate the release letter for this week (a, b, c, etc.)
const releaseLetter = String.fromCharCode(97 + weeklyReleases); // 'a' is 97 in ASCII

// Read suffix from .txt file
const suffixFilePath = 'C:/Proxys-Machine Syncs/Game Files/Code Save Files/Slugger/Slugger Repo/snapshot-suffix.txt';
let versionSuffix = 'exp'; // Default value if the file doesn't exist

try {
    versionSuffix = fs.readFileSync(suffixFilePath, 'utf-8').trim();
} catch (error) {
    console.error(`Could not read suffix file: ${error}`);
}

// Generate the version tag
const versionTag = `SNAPSHOT150-${currentYear}.${currentWeek}${releaseLetter}${totalReleases}${versionSuffix}`;

// Output the result for review
console.log(`Generated version tag: ${versionTag}`);

// Create a new Git tag and push it
execSync(`git tag ${versionTag}`);
execSync(`git push origin ${versionTag}`);

console.log('Release pushed with tag:', versionTag);

execSync('git add .');
// Generate the commit message
const commitMessage = `(Extremely unstable) A snapshot of the newest update in the works. This specific snapshot version is: ${versionTag}`;
// Commit the changes with the correct message
execSync(`git commit -m "${commitMessage}"`);
execSync('git push origin unstable');