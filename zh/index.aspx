<%@ Page Language="C#" %>

<script runat="server">
void Page_Load(object source, EventArgs e)
{
		if (Request.Headers["CF-IPCountry"] != null) {
			var country = Request.Headers["CF-IPCountry"];
			var countryCookie = new HttpCookie("CF-IPCountry") {
				Value = country
			};
			Response.Cookies.Add(countryCookie);
		}
		var customSetting = ConfigurationManager.AppSettings["AI_InstrumentationKey"] ?? null;
		if (customSetting != null) {
			var aiCookie = new HttpCookie("AI_InstrumentationKey") {
				Value = customSetting
			};
			Response.Cookies.Add(aiCookie);
		}
		else
			Console.WriteLine("No customsetting1 application string");


	Response.WriteFile("index.html");
}
</script>
