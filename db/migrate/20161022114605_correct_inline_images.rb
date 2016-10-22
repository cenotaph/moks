class CorrectInlineImages < ActiveRecord::Migration[5.0]
  def change
    Post.all.each do |p|
      p.translations.each do |pp|
        next if pp.body.nil?
        pp.body.gsub!(/\"\/uploads/, '"https://moks-production.s3.amazonaws.com')
      end
      p.save!
    end
  end
end
