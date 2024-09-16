module ApplicationHelper
  def default_meta_tags
    {
      site: "Your Birth Game",
      title: "Your Birth Game",
      reverse: true,
      charset: "utf-8",
      description: "あなたの誕生日に発売されたゲームは何かな？",
      canonical: request.original_url,
    og: {
      site_name: "Your Birth Game",
      title: "Your Birth Game",
      description: "あなたの誕生日に発売されたゲームは何かな？",
      type: "website",
      url: request.original_url,
      image: image_url("YourBirthGame.png"),
      locale: "ja_JP"
    },
    twitter: {
      card: "summary_large_image",
      title: "Your Birth Game",
      description: "あなたの誕生日に発売されたゲームは何かな？",
      image: image_url("YourBirthGame.png")
    } }
  end
end
