function change_show(name)
{
   var docel, result;
   if ((docel=SFW.xmldoc.documentElement) && (result=docel.selectSingleNode(name)))
   {
      var host = SFW.close_subhosts();
      if (host)
      {
         docel.setAttribute("base_result", name);
         SFW.xslobj.transformFill(host,result);
         SFW.prepare_top_sfw_host();
      }
   }
}

function show_students() { change_show("students"); }
function show_courses()  { change_show("courses"); }






