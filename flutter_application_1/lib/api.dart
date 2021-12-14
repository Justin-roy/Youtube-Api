class VideoApi {
  static const finalApi = 'https://www.googleapis.com/youtube/v3/search';
  static const apiKey = 'AIzaSyCtiIAGqbDOHFyyStYRbJqslMnTxpaUQXo';
  static const channelId = 'UCldyi11QYNXYXiLjVbyw5dA';
  static const channelId2 = 'UCvtw4vj-uALdzUeRuCLxHPA';
  static const maxResult = 'maxResults=21';
  static const apiFilter = 'part=snippet,id&order=date&$maxResult';
  static const api = '$finalApi?key=$apiKey&channelId=$channelId2&$apiFilter';
}

class ChannelApi {
  static const apiLink = 'https://youtube.googleapis.com/youtube/v3/search';
  static const apiKey = 'AIzaSyCtiIAGqbDOHFyyStYRbJqslMnTxpaUQXo';
  static const channelId = 'UCykDTb_u87HMTbFYiT_qzKw'; //justin
  static const channelId2 = 'UCldyi11QYNXYXiLjVbyw5dA'; //love babbar
  static const channelId3 = 'UCwuan4V6imQf7L6oN0d47MQ'; //kabir singh
  static const part = "snippet";
  static const maxResult = 30;
  static const api =
      '$apiLink?key=$apiKey&channelId=$channelId3&part=$part&maxResults=$maxResult';
}
