class Demo {

  static String getPrintOut2(List printList) {
    printList.remove('item');
    String printOutString = """
    <!DOCTYPE html>
    <html lang="en">
    """;
    printOutString += """
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Print Out</title>
    <style>
		
		body {
			background: #fff;
			margin: 0; padding: 0;
		}
		* {
			font-family: 'arial';
			-webkit-print-color-adjust: true;
			-webkit-print-color-adjust: exact;
		}
		#invoice-POS {
		  width: 65%;
		  background: #FFF;
		  padding: 0;
		}

		#invoice-POS h2 {
		  font-size: 5em;
		  margin-bottom: 0;
		  line-height: 1em;
		}
		#invoice-POS h3 {
		  font-size: 4.5em;
		  font-weight: 300;
		  line-height: 0.8em;
		  margin: 20px 0 0 0;
		}
		.tableitem {
		  font-size: 2.8em;
		  color: #000;
		  padding-bottom: 36px;
		}
		#invoice-POS p {
		  font-size: 2.8em;
		  color: #000;
		  line-height: 1.5em;
		}
		#invoice-POS #top, #invoice-POS #mid, #invoice-POS #bot {
		  border-bottom: 4px dashed #000;
		}
		
		#invoice-POS table {
		  width: 100%;
		  border-collapse: collapse;
		}
		#invoice-POS .tabletitle {
		  font-size: 3.0em;
		  overflow: hidden;
		  line-height: 1em;
		  margin:0;
		  border-bottom: 4px dashed #000;
		}
		#invoice-POS .Hours {
		  width: 2.5cm;
		}
		.item-name {
		  min-width: 70%;
		 }
		 
  </style>
</head>
<body>
    <div id="invoice-POS">
    
      <div id="top">
        <div class="logo"></div>
        <div class="info"> 
          <h2 style="text-align: center;">Boutique</h2>
          <p style="text-align: center"> 
              Shop 26 Tonimas, Awka, Anambra State</br>
              Email: iceztech@gmail.com</br>
              Tel: 000-000-000 </br>
          </p>
        </div><!--End Info-->
      </div><!--End InvoiceTop-->
      
      <div id="mid">
        <div class="info">
          <p>
            <strong>Receipt No: 3938474995885</strong><br>
            Date: 23 may, 2022 @ 3:43 PM
          </p>
        </div>
      </div><!--End Invoice Mid-->
      
      <div id="bot">
  
            <div id="table">
              <table>
                <tr class="tabletitle">
                  <td class="Hours"><h4>Qty</h4></td>
                  <td class="item item-name"><h4>Item</h4></td>
                  <td class="Rate"><h4>Sub Total</h4></td>
                </tr> """;
    printList.forEach((element) {
      printOutString += """
                <tr class="service">
                  <td class="tableitem">${element['quantity']}</td>
                  <td class="tableitem">${element['name']}</td>
                  <td class="tableitem">${element['price']}</td>
                </tr> """;
    });

    printOutString += """
                <tr class="tabletitle summary">
                  <td></td>
                  <td class="Rate"><h4>Total</h2></td>
                  <td class="payment"><h4>N3,644.25</h4></td>
                </tr>
  
              </table>
            </div><!--End Table-->
  
            <div id="legalcopy">
              <p class="legal"><strong>Thank you for shopping with us</strong>  
              <br>
                Feel free to visit us for more amazing deals, offers and promo codes 
              </p>
            </div>
  
          </div><!--End InvoiceBot-->
    </div><!--End Invoice-->
  </body>
</html>
""";
    return printOutString;
  }

}
