%(cat)'chef-gen-flavor-example.gemspec'
Gem::Specification.new do |s|
  s.name        = 'chef-flavor-example'
  s.version     = '0.0.7'
  s.add_runtime_dependency('chef-gen-flavors', ['~> 0.9'])
  s.required_rubygems_version = Gem::Requirement.new('>= 0') if s.respond_to? :required_rubygems_version=
  s.require_paths = ['lib']
  s.date        = '2016-07-28'
  s.summary     = 'Custom Flavor gem for different cookbooks'
  s.description = 'This gem will allow different flavors for custom generator cookbooks with target specific settings'
  s.extra_rdoc_files = ['CHANGELOG.md', 'README.md']
  s.authors     = ['Joe Talbot']
  s.email       = 'joe.talbot2@gmail.com'
  s.rdoc_options = ['--main', 'README.md']
  s.rubygems_version = '2.4.4'
  s.files = Dir.glob('**/*', File::FNM_DOTMATCH).keep_if { |file| File.file?(file) } - %w(. .. .DS_Store) - Dir.glob('{.git}/**/*')
  s.homepage =
    'https://github.com/JoeTalbot/chef-flavor-example'
  s.license = 'None'
  s.specification_version = 4 if s.respond_to? :specification_version
end
