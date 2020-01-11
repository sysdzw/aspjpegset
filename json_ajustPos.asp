<%@ CODEPAGE=65001 %>
<% Response.CodePage=65001 %>
<% Response.Charset="UTF-8" %>
<%
Server.ScriptTimeOut = 99999

dim wx,strSql,userip
x=request("x")
y=request("y")
size=request("size")
content=request("content")
callback=request("callback")

Set Jpeg = Server.CreateObject("Persits.Jpeg")
Jpeg.Open Server.MapPath("../img/zs.jpg")'改成要处理的图片的路径

Jpeg.Canvas.Font.Color = &H000000
Jpeg.Canvas.Font.Size = size
Jpeg.Canvas.Font.Family = "微软雅黑" 
Jpeg.Canvas.Print x, y, content

randomize
strFileName="123.jpg"'这个是生成后的文件名，改不改都行
Jpeg.Save Server.MapPath(strFileName)

set Jpeg=nothing

response.write callback  & "({""result"":""" & strFileName & "?" & rnd*99 & """})"
%>
