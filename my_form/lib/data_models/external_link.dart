
class ExternalLink {
  final String linkAddress;
  final String buttonText;
  final String linkType;

  ExternalLink(this.linkAddress, this.buttonText, this.linkType);

  ExternalLink.fromJSON(Map<String, dynamic> json)
      : linkAddress = json["link_address"],
        buttonText  = json["button_text"],
        linkType = json["link_type"];
}