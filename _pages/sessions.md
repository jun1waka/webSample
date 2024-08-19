---
layout: sessions
title: SESSION
subtitle: セッション
permalink: /sessions
---
  <div class="row text-left">
    {% for session in site.data.sessions %}
      {% assign profile_id = 'profile-' | append: forloop.index %}
    <div class="col-md-6 col-12 p-3" id="{{data.title}}">
      {% if session.news-link %}
      <a href='{{ session.news-link }}'>
      {% endif %}
      <h4 class="ws-title">{{ session.title }}</h4>
      {% if session.news-link %}
      </a>
      {% endif %}
      <p>
        {{ session.time }}
        {% if session.tag %}
        <span class="badge badge-ws">{{ session.tag }}</span>
        {% endif %}
      </p>
     {% if session.profile-img %}
      <div class="my-3">
        {% if session.news-link %}
        <a href='{{ session.news-link }}'>
        {% endif %}
        <img src="img/{{ site.year }}/session/{{ session.profile-img }}" class="w-100 px-5" alt="プロフィール画像">
        {% if session.news-link %}
        </a>
        {% endif %}
      </div>
      {% endif %}
      <p class="session-speaker-name">{{ session.speaker }} {% if session.affiliation %}（{{ session.affiliation }}）{% endif %}</p>
      <p>
	{{ session.text | markdownify }}
	{% if session.news-link %}
	<a class='btn btn-danger btn-sm' href='{{ session.news-link }}'>
	  <i class='fas fa-scroll'></i> 詳細を見る
	</a>
	{% endif %}
      </p>
      {% if session.archive-link %}
      <p>
      	<a href="{{ session.archive-link }}" target="_blank" rel="noopener" class="btn btn-danger btn-sm"><i class="fab fa-youtube"></i> YouTube で見る</a>
      </p>
      {% endif %}
      {% if session.slides %}
      <p>
      	<a href="{{ session.slides }}" target="_blank" rel="noopener" class="btn btn-danger btn-sm"><i class="fas fa-scroll"></i> スライド資料を見る</a>
      </p>
      {% endif %}
      {% if session.profile-text or session.speakers %}
      <p>
      	<a href="#{{ profile_id }}" role="button" data-bs-toggle="collapse" data-bs-target="#{{ profile_id }}" data-toggle="collapse" class="btn btn-danger btn-sm"><i class="fas fa-angle-down"></i> 登壇者情報を見る</a>
      </p>
      {% endif %}
      <div class="collapse mt-3" id="{{ profile_id }}">
        {% if session.tag == "パネルディスカッション" %}
        {% for speaker in session.speakers %}
        <p class="session-speaker-name">{{ speaker.name }}（{{ speaker.affiliation }}）<span class="badge badge-main">{{ speaker.role }}</span></p>
        <p>{{ speaker.text | markdownify }}</p>
        <ul>
          {% for link in speaker.links %}
          <li><a href="{{ link }}" target="_blank" rel="noopener external">{{ link | remove_first: 'https://' | remove_first: 'http://' }}</a></li>
          {% endfor %}
        </ul>
        {% endfor %}
        {% else %}
        <p>{{ session.profile-text | markdownify }}</p>
        <ul>
          {% for link in session.links %}
          <li><a href="{{ link }}" target="_blank" rel="noopener external">{{ link | remove_first: 'https://' | remove_first: 'http://' }}</a></li>
          {% endfor %}
        </ul>
        {% endif %}
      </div>
    </div>
    {% endfor %}
  </div>
