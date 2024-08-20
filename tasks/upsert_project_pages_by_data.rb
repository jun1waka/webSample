#!/usr/bin/env ruby

# require 'pry' unless ENV['JEKYLL_ENV'] == 'production'
require 'yaml'     # https://docs.ruby-lang.org/ja/latest/library/yaml.html
require 'rinku'    # https://github.com/vmg/rinku
require 'truncato' # https://github.com/jorgemanrubia/truncato
t = Truncato

# Remove existing files and re-generate them
# NOTE: もしファイルパスを変更して過去ファイルを消したい場面があれば使う
#Dir.glob("_posts/exhibition/*.md").each { |filename| File.delete(filename) }

projects = YAML.load_file('_data/projects.yml', symbolize_names: true)
projects.each.with_index(0) do |project, index|
  # Generate individual project page by data
  project_prev = projects.rotate(index - 1).first
  project_next = projects.rotate(index + 1).first
  # DEBUG: ナビゲーション用の簡易デバッグプリント
  #print "#{project_prev[:id]} <---> #{project_next[:id]}\t"
  path = "./_pages/exhibition/2023-#{project[:id]}.md"
  page = <<~PROJECT_PAGE
    ---
    layout: default
    title: "#{project[:title]}"
    thumbnail: /img/2023/exhibition/#{project[:thumbnail]}
    permalink: /expo/#{project[:id]}
    description: #{project[:description]}
    ---
    <h1 style="padding-top: 100px; padding-bottom: 30px; ">#{project[:title]}</h1>
    <div class="main_content">
      <a href="#{project[:url]}" target="_blank" rel="noopener" >
        <img class='top-img lazyload' loading='lazy' alt='サムネイル画像'
             style='margin-bottom: 10px; border-radius: 6px;width: 100%;'
             src='/img/2023/exhibition/#{project[:thumbnail]}' />
      </a>
      <p>
        作者: #{project[:creator]}
        <small>(CoderDojo #{project[:coderdojo_at]})</small>
      </p>

      <div class="contents">
        <div class="box">
          <h5>作品の説明</h5>
          <p>#{Rinku.auto_link project[:description]}</p>
        </div>

        <div class="box">
          <h5>参考・参照元、工夫したところ</h5>
          <p>#{Rinku.auto_link project[:note]}</p>
        </div>
      </div>
    </div>

    <div>
      <a href="#{project[:url]}" target="_blank" rel="noopener" class="button">
        <i class="fas fa-scroll"></i>
        作品を見る
      </a>
      <a href="https://twitter.com/intent/tweet?text={{ page.title | replace: '&', '%26' }}+%7C+ニンジャ大博覧会&hashtags=DojoConJapan,CoderDojo&url={{ site.url }}/expo/#{project[:id]}&lang=jp&related=DojoConJapan" target="_blank" rel="noopener" class="button" style="margin: 50px auto;">
        <i class="fab fa-twitter"></i>
        作品を共有する
      </a>
      <a href="https://www.facebook.com/share.php?u={{ site.url }}/expo/#{project[:id]}" target="_blank" rel="noopener" class="button">
        <i class="fab fa-facebook"></i>
        作品を共有する
      </a>
    </div>

    <div class="content main_content">
      <a href="/exhibition" class="back-to-top text-left" style="margin: 50px auto;">
        <i class="fas fa-chevron-circle-left"></i>
        作品一覧に戻る
      </a>
    </div>

    <div class="article-navigation" style="margin-bottom: 100px;">
      <a href="/expo/#{project_prev[:id]}" title="#{project_prev[:title]}" style="margin-right: 20px;">
        <i class="fas fa-arrow-left"></i>
        前の作品へ<br>
        <span style="font-size: 8px;">#{t.truncate project_prev[:title], max_length: 11}</span>
      </a>
      <a href="/expo/#{project_next[:id]}" title="#{project_next[:title]}" style="margin-left: 20px;">
        次の作品へ
        <i class="fas fa-arrow-right"></i><br>
        <span style="font-size: 8px;">#{t.truncate project_next[:title], max_length: 11}</span>
      </a>
    </div>

    <style type="text/css">
      /* 作品説明などのスタイル */
      .box { width:auto; margin: 50px auto 30px; }
      .box h5 { text-align: left; }
      .box p  { text-align: left; }
      .contents {
        width:   auto;
        margin:  0 auto;
        padding: 5px;
      }
      .main_content a { color: #7e2639; }
      .main_content{
        display: block;
        margin: 0 auto 12px;
        text-align: center;
        text-decoration: none;
        width: 40%;
      }
      @media screen and (max-width: 1000px) {
        .main_content {
          padding: 8px 0;
          width: 80%;
        }
      }

      /* 前後の作品へのナビゲーションバー */
      .article-navigation {
        text-align: center;
        margin: 20px 0;
      }
      .article-navigation a {
        display: inline-block;
        padding: 10px 20px;
        background-color: #7e2639;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        margin: 0 10px;
      }
      .article-navigation a:hover {
        text-decoration: underline;
      }
    </style>
  PROJECT_PAGE

  IO.write(path, page)
  puts "Upsert: #{path}"
end

# This script above inherits from the following repo
# under The MIT License published by Mitou Junior.
# https://github.com/mitou/jr.mitou.org


