<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.logging.Level" %>
<%@page import="java.util.logging.Logger" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.ArrayList" %>


<html>
<head>
    <title>OTEL ODA OTOMASYONU</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

</head>
<%
    String msg = "";
    String color = "";
    Connection conn;
    if(request.getMethod().compareToIgnoreCase("post")==0)
    {
        try
        {
            String odaNo = request.getParameter("odaNo");
            String odaTipi = request.getParameter("odaTipi");
            String yatakTipi = request.getParameter("yatakTipi");
            String miktar = request.getParameter("miktar");

            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/gchotel","root","");

            String query = "INSERT INTO `room`(`odaNo`, `odaTipi`, `yatakTipi`, `miktar`) VALUES (?,?,?,?)";

            PreparedStatement pst = conn.prepareStatement(query);
            System.out.println(query);

            pst.setString(1, odaNo);
            pst.setString(2, odaTipi);
            pst.setString(3, yatakTipi);
            pst.setString(4, miktar);

            pst.executeUpdate();

            color = "green";
            msg = "Oda Ekleme Başarılı";


        }catch(Exception ex){
            ex.printStackTrace();
            color = "red";
            msg = "Ekleme Başarısız";
        }
    }
%>

<body>
<div class="container">
    <div class="form-group col-12 p-0">
        <h4 style="color:<%= color %>"><%= msg %></h4>
    </div>
    <form id="form" method="post" action="index.jsp" class="form-horizontal">

        <div class="form-group">
            <div  class="col-sm-12">
                <h2 style="text-align: center; color: blue">OTEL ODA DETAYLARI</h2>
            </div>
        </div>

        <hr/>
        <div class="row">

            <div class="form-group col-md-6">
                <label>Oda No</label>
                <input type="text" name="odaNo" class="form-control" id="odaNo" placeholder="odaNo">
            </div>

            <div class="form-group col-md-6">
                <label >Oda Tipi</label>
                <select class="form-control" id="odatipi" name="odaTipi"
                        placeholder="Project Status" required>
                    <option value="">Lütfen Seçiniz</option>
                    <option>Klimalı</option>
                    <option>Klimasız</option>
                </select>
            </div>

            <div class="form-group col-md-6">
                <label>Yatak Tipi</label>
                <select class="form-control" id="yatakTipi" name="yatakTipi"
                        placeholder="Project Status" required>
                    <option value="">Lütfen Seciniz</option>
                    <option>Tek Kisilik</option>
                    <option>Cift Kisilik</option>
                </select>
            </div>

            <div class="form-group col-md-6">
                <label>Miktar</label>
                <input type="text" name="miktar" class="form-control" id="miktar" placeholder="miktar">
            </div>

            <div class="form-group col-md-6" align="center">

                <Button class="btn btn-success" style="width: 80px;">Gönder</Button>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <p>ADI-SOYADI :  Samet AÇAR</p>
                <p> NO : 195260057</p>


            </div>
        </div>

    </form>

</body>
</html>