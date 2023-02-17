const filesPerPage = 10;
let currentPage = 1;
let totalFiles = 0;

// Get total number of files and update table
$.get("filelist.txt", function(data) {
  let fileArray = data.split("\n");
  totalFiles = fileArray.length - 1;
  updateTable(fileArray);
});

// Function to update the table
function updateTable(fileArray) {
  let tableBody = $("#tableBody");
  tableBody.empty();
  let start = (currentPage - 1) * filesPerPage;
  let end = start + filesPerPage;
  let numFiles = Math.min(end, totalFiles) - start;
  for (let i = 0; i < numFiles; i++) {
    let file = fileArray[start + i].split(",");
    let name = file[0];
    let size = file[1];
    let path = file[2];
    let row = "<tr><td>" + name + "</td><td>" + size + "</td><td>" + path + "</td><td>CRUD buttons here</td></tr>";
    tableBody.append(row);
  }
  updatePagination();
}

// Function to update the pagination buttons
function updatePagination() {
  let numPages = Math.ceil(totalFiles / filesPerPage);
  if (currentPage == 1) {
    $("#prevPage").prop("disabled", true);
  } else {
    $("#prevPage").prop("disabled", false);
  }
  if (currentPage == numPages) {
    $("#nextPage").prop("disabled", true);
  } else {
    $("#nextPage").prop("disabled", false);
  }
  $("#currentPage").text("Page " + currentPage + " of " + numPages);
}

// Handler for previous page button
$("#prevPage").click(function() {
  if (currentPage > 1) {
    currentPage--;
    updateTable(fileArray);
  }
});

// Handler for next page button
$("#nextPage").click(function() {
  let numPages = Math.ceil(totalFiles / filesPerPage);
  if (currentPage < numPages) {
    currentPage++;
    updateTable(fileArray);
  }
});

