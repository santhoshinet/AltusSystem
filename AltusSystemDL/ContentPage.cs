using Telerik.OpenAccess;

namespace AltusSystemDL
{
    [Persistent]
    public class ContentPage
    {
        public string Name { get; set; }

        public string Content { get; set; }

        public string ID { get; set; }
    }
}