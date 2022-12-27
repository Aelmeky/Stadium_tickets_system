<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addanewmatch.aspx.cs" Inherits="stadium_tickets_system.addanewmatch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
            .topnav {
            background-color: #333;
            overflow: hidden;
        }
            .topnav a {
                float: left;
                color: #f2f2f2;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
                font-size: 17px;
            }
           .topnav a:hover {
                    background-color: white;
                    color: black;
           }
           *{
               padding:0;
               margin:0;
           }
           .container {
            height:100%;
            width:100%;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            background-image: url(Helper/background.jpg);
            }
           
           .dropdown{
               position :center;
               margin-left: auto;
                margin-right:auto;
           }
           /* Style the dropdown lists */
        .club-select {
            display: inline-block;
            width: 200px;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
            background-color: white;
        }
        /* Style the arrow inside the select element */
        .club-select after {
        content: "";
        background-image: url(arrow.png);
        background-position: center;
        background-repeat: no-repeat;
        width: 20px;
        height: 20px;
        position: absolute;
        right: 10px;
        top: 50%;
        transform: translateY(-50%);
        pointer-events: none;
      }
  /* Style the options inside the select element */
        .club-select option {
        color: black;
        background-color: white;
        display: flex;
        white-space: pre;
        min-height: 20px;
        padding: 12px;
      }


/* Style the datetime inputs */
        .datetime-input {
            display: inline-block;
            margin-bottom:15px;
            width: 200px;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
        }
        .label {
      display: block;
      margin-top: 12px;
      margin-bottom: 12px;
      font-size: 30px;
    }
        .cont {
          display: flex;
           flex-direction: column;
          align-items: center;
          width: 30%;
          margin: 0 auto;
          background-color: gainsboro;
          opacity :0.8; 
        }
        .button {
          background-color: dimgrey;
          border: thin;
          color: black;
          padding: 16px 32px;
          margin-top: 24px;
          margin-bottom:30px;
          text-align: center;
          font-size: 16px;
          opacity: 0.7;
          transition: 0.3s;
          display: inline-block;
          text-decoration: none;
          cursor: pointer;
        }

        .button:hover {opacity: 1}


</style>
</head>
<body>
    <div class ="container">
    <form id="form1" runat="server">
          <div class="topnav">
                     <asp:LinkButton ID="deleteamatch" runat="server" Text="delete a match" OnClick="deleteaMatch" />
                     <asp:LinkButton ID="upcomingmatches" runat="server" Text="view all upcoming matches" OnClick="allupcomingmatches"/>
                     <asp:LinkButton ID="alreadypalyedmatches" runat="server" Text="view already palyed matches" OnClick="alreadyplayedmatches" />
                     <asp:LinkButton ID="neverscheduled" runat="server" Text="view clubs never matched"  OnClick="nevermatched"/>
            </div>
        <div class ="cont">
            <div>
                <asp:Label ID="Label5" runat="server" Text="Add the match you want" CssClass="label"></asp:Label></div>
            
        <div class="dropdown">
            <asp:Label ID="Label2" runat="server" Text="Host Club:" for ="DropDownListhost" CssClass ="label"></asp:Label>
             <asp:DropDownList ID="DropDownListhost" runat="server" CssClass="club-select">
             </asp:DropDownList>
        </div>
        <div class ="dropdown">

            <asp:Label ID="Label1" runat="server" Text="Guest Club:" for ="DropDownListguest" CssClass ="label"></asp:Label>
             <asp:DropDownList ID="DropDownListguest" runat="server" CssClass="club-select">
             </asp:DropDownList>
        </div>
        <div>
              <asp:Label ID="Label3" runat="server" Text="Start Time:" for ="starttime" CssClass ="label"></asp:Label>
             <input id="starttime" type="datetime-local" runat="server" cssclass="datetime-input"/>
           
        </div>
        <div>
             <asp:Label ID="Label4" runat="server" Text="End Time:" for ="endtime" CssClass ="label"></asp:Label>
             <input id="endtime" type="datetime-local" runat="server" cssclass="datetime-input"/>
        </div>
        

      
          <asp:Button ID="addingmatch" runat="server" Text="Add the match" OnClick="addingmatch_Click" cssclass="button" />
      
        
      </div>

    </form>
   </div>
</body>
</html>
