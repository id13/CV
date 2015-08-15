require 'rubygems'
require 'sinatra'
require 'haml'
require 'json'

get '/' do
  
  fetch_json_data
  @skill ||= {}
  skill_bank_factory @skill
  set_skill_css(@skillset.values.flatten) unless @skillset.nil?
  @project.each { |project| set_skill_css(project["skills"]) } unless @project.nil?
  @work_experience.each { |work_experience| set_skill_css(work_experience["skills"]) } unless @work_experience.nil?

  
  haml :index
end

private
  
  def fetch_json_data
    Dir["json/*.json"].each do |path|
      file = File.read(path) 
      hash = JSON.parse(file)
      # I assume json files do not have '/', '.' in their names
      filename = (path.split('/'))[1].split('.')[0]
      instance_variable_set("@#{filename}".to_sym, hash)
    end
  end

  def skill_bank_factory hash
    raise "A SkillBank must be a Hash" unless hash.class == Hash
    hash.define_singleton_method :skill_css_class do |skill_name|
      empty? ? "default" : select { |key, value| 
        value.select { |skill| 
          skill_name.downcase.include?(skill)
        }.any?
      }.keys.first || "default"
    end
  end
  
  def set_skill_css skills
    skills.each do |skill|
      css_class = @skill.skill_css_class skill
      skill.define_singleton_method :css_class do 
        css_class
      end
    end
  end
