Gem::Specification.new do |s|
  s.name = %q{mxtelecom_api}
  s.version = "1.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Pat George & Jim Garvin"]
  s.date = %q{2008-06-24}
  s.description = %q{Let's you easily send SMS messages through the mxtelecom gateway using their HTTP API.}
  s.email = ["pat dot george at gmail.com"]
  s.extra_rdoc_files = ["History.txt", "License.txt", "Manifest.txt", "PostInstall.txt", "README.txt", "website/index.txt"]
  s.files = ["History.txt", "License.txt", "Manifest.txt", "PostInstall.txt", "README.txt", "Rakefile", "config/hoe.rb", "config/requirements.rb", "lib/mxtelecom_api.rb", "lib/mxtelecom_api/version.rb", "script/console", "script/destroy", "script/generate", "script/txt2html", "setup.rb", "tasks/deployment.rake", "tasks/environment.rake", "tasks/website.rake", "test/test_helper.rb", "test/test_mxtelecom_api.rb", "website/index.html", "website/index.txt", "website/javascripts/rounded_corners_lite.inc.js", "website/stylesheets/screen.css", "website/template.html.erb"]
  s.has_rdoc = true
  s.homepage = %q{http://mxtelecom_api.rubyforge.org}
  s.post_install_message = %q{
For more information on mxtelecom_api, see http://mxtelecom_api.rubyforge.org

NOTE: Change this information in PostInstall.txt 
You can also delete it if you don't want it.


}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{mxtelecom_api}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{Let's you easily send SMS messages through the mxtelecom gateway using their HTTP API.}
  s.test_files = ["test/test_helper.rb", "test/test_mxtelecom_api.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
    else
    end
  else
  end
end
