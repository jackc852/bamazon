var mysql = require('mysql');
var inquirer = require('inquirer');
var Table = require('cli-table');

var connection = mysql.createConnection({
	host: 'localhost',
	port: 3306,
	user: 'root',
	database: 'bamazon'
})

connection.connect(function(err) {
	if (err) throw err;
	console.log('Connected as id' + connection.threadId);
	startPurchase();
})

function listItems(res) {
	var table = new Table({
		head: ['Item ID', 'Product Name', 'Department', 'Cost', 'In Stock']
		, colWidths: [10, 50, 30, 10, 10]
	});
	
	for (var i = 0; i < res.length; i++) {
		table.push([res[i].item_id, res[i].product_name, res[i].department_name, res[i].price, res[i].stock_quantity]);
	}
	console.log(table.toString());
}

var startPurchase = function() {
	connection.query('SELECT * FROM products', function(err, res) {
		listItems(res);
		var itemsArray = [];
		for (var i = 0; i < res.length; i++) {
			itemsArray.push(res[i].product_name);
		}
		
		inquirer.prompt([{
			name: 'item',
			type: 'input',
			message: 'Please enter the Item ID of your choice.'
		},
		{
			name: 'quantity',
			type: 'input',
			message: 'How many would you like to purchase?'
		}]).then(function(response) {
			var item_id = response.item;
			var itemPurchased = res[item_id-1];
			var productName = itemPurchased.product_name;
			var totalPrice = itemPurchased.price*response.quantity;
			console.log(" - Product: " + productName);
			console.log(" - Item Total: " + totalPrice);

			var newQuantity = itemPurchased.stock_quantity - response.quantity;
			if (newQuantity >= 0) {
				connection.query('UPDATE products SET ? WHERE item_id = ?', [{ stock_quantity: newQuantity }, item_id]);
				startPurchase();
			} else {
				console.log('Insufficient quantity, please revise amount.');
				startPurchase();
			}
		})
	})
}