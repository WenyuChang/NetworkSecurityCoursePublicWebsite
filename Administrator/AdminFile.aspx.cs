using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_AdminFile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void UploadButton_Click(object sender, EventArgs e)
    {
        // Specify the path on the server to
        // save the uploaded file to.
        String savePath = Server.MapPath("/netWebSite/software/uploads/");

        // Before attempting to perform operations
        // on the file, verify that the FileUpload 
        // control contains a file.
        if (FileUpload1.HasFile)
        {
            // Get the name of the file to upload.
            String fileName = FileUpload1.FileName;

            // Append the name of the file to upload to the path.
            savePath += fileName;

            // Call the SaveAs method to save the 
            // uploaded file to the specified path.
            // This example does not perform all
            // the necessary error checking.               
            // If a file with the same name
            // already exists in the specified path,  
            // the uploaded file overwrites it.
            FileUpload1.SaveAs(savePath);
            DBUtil.UploadSoftware(savePath,0);
            // Notify the user of the name of the file
            // was saved under.
            UploadStatusLabel.Text = "Your file was saved as " + fileName;
        }
        else
        {
            // Notify the user that a file was not uploaded.
            UploadStatusLabel.Text = "You did not specify a file to upload.";
        }

    }

}
