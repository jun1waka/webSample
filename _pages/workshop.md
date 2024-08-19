---
layout: default
title:  ワークショップ
permalink: /workshop
---

<div class="container mt-5">
  <div class="row">
    <div class="col-6 offset-3">
      <h1>ワークショップ</h1>
      <p>DojoCon Japan 2020 で開催されるワークショップをご紹介します</p>
    </div>
  </div>

  <div class="row text-left">
    {% for data in site.data.workshops %}
    <div class="col-md-6 col-12 p-3">
      <h4 class="ws-title">{{data.title}}</h4>
      <p>
        {% if data.badge == 'must' %}
        <span class="badge badge-must">申し込み必須</span> 
        {% elsif data.badge == 'double' %}
        <span class="badge badge-must">事前・当日申し込み必須</span>
        {% else %}
        <span class="badge badge-none">申し込み不要</span>
        {% endif %}

        {{data.time}}</p> 

      <p>{{data.text}}</p>

      {% if data.limit %}
      <p>定員：{{data.limit}}人</p>
      {% endif %}

      {% if data.url %}
      <div class="text-left">
        <a href="{{data.url}}" class="btn btn-main"><i class="fas fa-user-plus"></i> 申し込む</a>
      </div>
      {% endif %}
    </div>
    {% endfor %}
  </div>
</div>
