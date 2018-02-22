<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
version="1.0">
  <xsl:template match="/">
    <html>
      <head>
        <title>Test Result</title>
        <script type="text/javascript" src="C:\Users\VC024129\Documents\Vijay\TestFrameWork\ApplicationReports\canvasjs.min.js"></script>
      </head>
      <style>
        table {
        border-collapse: collapse;
        width:100%
        }

        table, td, th {
        border: 1px solid #d3d4d4;
        }
        th{
        background-color:#b8c1e0;
        height:30px;
        text-align:left;
        }
        tr:nth-child(even) {
        background-color: #E8EBF5;
        }
        #myBtn {
        display: none;
        position: fixed;
        bottom: 20px;
        right: 30px;
        z-index: 99;
        border: none;
        outline: none;
        background-color: #aaaaaa;
        color: white;
        cursor: pointer;
        padding: 15px;
        border-radius: 10px;
        }

        #myBtn:hover {
        background-color: #555;
        }
        #color-bar {
        display: block;
        width: 100%;
        background-color: #1094D2;
        border-bottom: 1px solid #d3d4d4;
        height: 30px;
        height: 3rem;
        }
        #title{
        font-size:40px;
        color:white;
        vertical-align:10px;
        padding-left: 450px;
        }
        .tooltip {
        position: relative;
        display: inline-block;
        border-bottom: 1px dotted black;
        }
        .tooltip .tooltiptext {
        visibility: hidden;
        width: 600px;
        background-color: black;
        color: #fff;
        text-align: center;
        border-radius: 6px;
        padding: 5px 0;

        /* Position the tooltip */
        position: absolute;
        z-index: 1;
        }
        .tooltip:hover .tooltiptext {
        visibility: visible;
        }
        #screenshot {
        border-radius: 5px;
        cursor: pointer;
        transition: 0.3s;
        }
        /* The Modal (background) */
        .modal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        padding-top: 100px; /* Location of the box */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.8); /* Black w/ opacity */
        }

        /* Modal Content (image) */
        .modal-content {
        margin: auto;
        display: block;
        width: 100%;
        height:60%;
        max-width: 700px;
        }

        /* Caption of Modal Image */
        #caption {
        margin: auto;
        display: block;
        width: 80%;
        max-width: 700px;
        text-align: center;
        color: #ccc;
        padding: 10px 0;
        height: 150px;
        }

        /* Add Animation */
        .modal-content, #caption {
        -webkit-animation-name: zoom;
        -webkit-animation-duration: 0.6s;
        animation-name: zoom;
        animation-duration: 0.6s;
        }

        @-webkit-keyframes zoom {
        from {-webkit-transform:scale(0)}
        to {-webkit-transform:scale(1)}
        }

        @keyframes zoom {
        from {transform:scale(0)}
        to {transform:scale(1)}
        }

        /* The Close Button */
        .close {
        position: absolute;
        top: 15px;
        right: 35px;
        color: #f1f1f1;
        font-size: 40px;
        font-weight: bold;
        transition: 0.3s;
        }

        .close:hover,
        .close:focus {
        color: #bbb;
        text-decoration: none;
        cursor: pointer;
        }

        /* 100% Image Width on Smaller Screens */
        @media only screen and (max-width: 700px){
        .modal-content {
        width: 100%;
        }
        }
      </style>
      <body>
        <div id="color-bar">
          <img src="C:\Users\VC024129\Documents\Vijay\TestFrameWork\ApplicationReports\cerner_logo.png" rel="Cerner_Logo" height="48px"/>
          <span id="title">
            Test Execution Engine
          </span>
        </div>
        <br/>
        <br/>
        <div id="chartContainer" style="height: 300px; width: 100%;" ></div>
        <div onclick="topFunction()" id="myBtn" title="Go to top">Top</div>
        <br/>
        <table>
          <tbody>
            <th>
              Total Test Cases
            </th>
            <th>
              Passed Test Cases
            </th>
            <th>
              Failed Test Cases
            </th>
            <th>
              NoRun Test Cases
            </th>
            <th>Total Execution Time in Min(s)</th>
          </tbody>
          <xsl:for-each select="Automation/Summary">
            <tr>
              <td>
                <xsl:value-of select="TotalTestCases"/>
              </td>
              <td>
                <xsl:value-of select="PassedTestCases"/>
              </td>
              <td>
                <xsl:value-of select="FailedTestCases"/>
              </td>
              <td>
                <xsl:value-of select="NoRunTestCases"/>
              </td>
              <td >
                <xsl:value-of select="TotalExecutionTime"/>
              </td>
            </tr>
          </xsl:for-each>
        </table>
        <br/>
        <br/>
        <table id="SUMMARY" border="2">
          <tr>
            <th colspan="6" style="height:40px; font-size:25px; text-align:center">Test Report</th>
          </tr>
          <tr>
            <th>Seq#</th>
            <th>TestCaseID</th>
            <th>TestCase Descr</th>
            <th>Status</th>
            <th>Run Started</th>
            <th>Duration (Sec)</th>
          </tr>
          <xsl:for-each select="Automation/Summary/SummaryTestCase">
            <tr>
              <td>
                <xsl:value-of select="TestCaseSeqNum"/>
              </td>
              <td>
                <a>
                  <xsl:attribute name="href">
                    <xsl:text>#</xsl:text>
                    <xsl:value-of select="TestCaseID"/>
                  </xsl:attribute>
                  <xsl:value-of select="TestCaseID"/>
                </a>
              </td>
              <td>
                <xsl:value-of select="TestCaseDescr"/>
              </td>
              <td>
                <xsl:if test="Result='PASS'">
                  <span style="color:green">&#10004; Passed </span>
                </xsl:if>
                <xsl:if test="Result='FAIL'">
                  <span style="color:red">&#10006; Failed</span>
                </xsl:if>
                <xsl:if test="Result='NORUN'">
                  <span style="color:blue;">* Skip</span>
                </xsl:if>
              </td>
              <td>
                <xsl:value-of select="StartDTTM"/>
              </td>
              <td>
                <xsl:value-of select="ExecutionTime"/>
              </td>
            </tr>
          </xsl:for-each>
        </table>
        <br/>
        <br/>
        <br/>
        <table border="2" >
          <tr>
            <th colspan="8" style="height:40px; font-size:25px; text-align:center">
              Test Execution Detail
            </th>
          </tr>
          <tr>
            <th style="width:50px">TestCaseID</th>
            <th style="width:30px">Seq #</th>
            <th style="width:200px">Unit Descr</th>
            <th style="width:80px">Unit Status</th>
            <th style="width:80px">Status</th>
            <th style="width:600px">Message(s)/Exception(s)</th>
            <th style="width:100px">Screen Shot</th>
          </tr>
          <xsl:for-each select="Automation/TestCase">
            <tr>
              <td style="background-color:#b8c1e0;height:30px;font-weight: bold;">
                <xsl:attribute name="ID">
                  <xsl:value-of select="PrcsID"/>
                </xsl:attribute>
                <xsl:value-of select="PrcsID"/>

              </td>
              <td colspan="7" style = "text-align:center;background-color:#b8c1e0;height:30px;font-weight: bold;" >
                <span>
                  <xsl:value-of select="PrcsDescr"/>
                </span>
              </td>

              <xsl:for-each select="TestUnit">
                <tr>
                  <td></td>
                  <td>
                    <xsl:value-of select="SeqNum"/>
                  </td>
                  <td>
                    <xsl:value-of select="UnitDescr"/>
                  </td>
                  <td>
                    <xsl:value-of select="Active"/>
                  </td>
                  <td style="width:70px;height:5px">
                    <xsl:if test="Result='PASS'">
                      <span style="color:green">&#10004; Passed </span>
                    </xsl:if>
                    <xsl:if test="Result='FAIL'">
                      <span style="color:red">&#10006; Failed</span>
                    </xsl:if>
                    <xsl:if test="Result='NORUN'">
                      <span style="color:blue;">* Skip</span>
                    </xsl:if>
                  </td>
                  <td>

                      <div class="tooltip">
						<xsl:if test="UnitDescr='Crawl'">
							<xsl:variable name="crawl"><xsl:value-of select="Exception"/></xsl:variable>
							<span id="crawlresult" tyle="text-decoration: underline;color: blue;"></span>
							<div  id="Crawlhtml">
								<a href="{$crawl}"> Crawl Result </a>
								<span class="tooltiptext">
									<xsl:value-of select="ExceptionMsg"/>
								</span>
							</div>
						</xsl:if>
						<xsl:if test="UnitDescr!='Crawl'">
							<xsl:value-of select="Exception"/>
                        <span class="tooltiptext">
                          <xsl:value-of select="ExceptionMsg"/>
                        </span>
						</xsl:if>
                      </div>


                  </td>
                  <td>
                    <xsl:if test="ScreenShotImageName!=' '">
                      <xsl:variable name="img"> <xsl:value-of select="ScreenShotImageName"/></xsl:variable>
                    <span id="screenshot" OnClick="LoadImage('Images/{$img}')" style="text-decoration: underline;color: blue;" >ScreenShot</span>
                    <div id="myModal" class="modal">
                      <span class="close">&#xd7;</span>
                      <img class="modal-content" alt="ScreenShot" id="image"/>
                      <div id="caption"></div>
                    </div>
                    </xsl:if>
                    <xsl:if test="ScreenShotImageName=' '">
                      NA
                    </xsl:if>
                  </td>
                </tr>
              </xsl:for-each>
            </tr>
          </xsl:for-each>
        </table>
        <script>
          // When the user scrolls down 20px from the top of the document, show the button
          window.onscroll = function() {scrollFunction()};

          function scrollFunction() {
          if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
          document.getElementById("myBtn").style.display = "block";
          } else {
          document.getElementById("myBtn").style.display = "none";
          }
          }

          // When the user clicks on the button, scroll to the top of the document
          function topFunction() {
          document.body.scrollTop = 0;
          document.documentElement.scrollTop = 0;
          }
          window.onload = function () {
          var chart = new CanvasJS.Chart("chartContainer",
          {
          theme: "theme2",
          title:{
          text: "Test Execution Summary"
          },
          data: [
          {
          type: "pie",
          showInLegend: true,
          legendText: "{indexLabel}",
          dataPoints: [
          {  y: '<xsl:value-of select="Automation/Summary/PassedTestCases"/>', indexLabel: "PASSED" ,color:"green"},
          {  y: '<xsl:value-of select="Automation/Summary/FailedTestCases"/>', indexLabel: "FAILED", color:"red"},
          {  y: '<xsl:value-of select="Automation/Summary/NoRunTestCases"/>', indexLabel: "NORUN", color:"blue"},

          ]
          }
          ]
          });
          chart.render();
          }

          var modal = document.getElementById('myModal');
          var img = document.getElementById('screenshot');
          var modalImg = document.getElementById("image");
          var captionText = document.getElementById("caption");
          
          function LoadImage(img){
          modal.style.display = "block";
          modalImg.src =img;
          }

          var span = document.getElementsByClassName("close")[0];


          span.onclick = function() {
          modal.style.display = "none";
          }
        </script>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>