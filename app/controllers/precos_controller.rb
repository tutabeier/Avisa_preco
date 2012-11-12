class PrecosController < ApplicationController
  def index
    require 'nokogiri'
    require 'open-uri'

    doc = Nokogiri::HTML(open('http://www.submarino.com.br/produto/110746014/tablet-motorola-xoom-2-com-android-3.2-wifi-e-3g-tela-82-touchscreen-e-memoria-interna-32gb'))
    doc.xpath('//p[@class="sale price money"]/span[@class="amount"]').each do |preco|
      @preco = preco.content
    end
  end
end
