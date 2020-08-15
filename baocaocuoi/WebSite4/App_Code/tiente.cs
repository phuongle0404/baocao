namespace tien
{
    using System;
    using System.Data;
    using System.Configuration;
    using System.Web;
    using System.Web.Security;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using System.Web.UI.WebControls.WebParts;
    using System.Web.UI.HtmlControls;

    /// <summary>
    /// Summary description for tiente
    /// </summary>
    public class tiente
    {
        public static string chuyendoi(string strinput)
        {
            int i = strinput.Length;
            string tam = "";
            int j=0;
            int solan = 0;
            solan = i / 3;
            if (i % 3 != 0)
                solan++;
            do
            {
                j = i - 3;
                if (j < 0)
                    j = 0;
                tam += strinput.Substring(j) + ";";
                if(j>0)
                    strinput = strinput.Substring(0, j);
                i = j;
                solan--;
            } while (solan > 0);
            string result = "";
            int len = tam.Split(';').Length - 1;
            string[] chuoi=tam.ToString().Split(';');
            for (int k = len - 1; k >= 0; k--)
                if (result == "")
                    result = chuoi[k];
                else
                    result += "," + chuoi[k];
            return result;
        }
    }
}