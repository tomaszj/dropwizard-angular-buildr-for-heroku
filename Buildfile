repositories.remote << 'http://repo1.maven.org/maven2/'

main_class = 'org.tomaszjaneczko.testpoc.api.TestAPIApplication'

define 'dropwizard-angular-buildr-for-heroku' do
  project.version = '0.1.0'

  compile.with transitive('io.dropwizard:dropwizard-core:jar:0.7.1')
  compile.with transitive('io.dropwizard:dropwizard-assets:jar:0.7.1')

  correct_dependencies = filter_out_old_jackson_pkgs(compile.dependencies)

  package(:jar)
    .with(:manifest => { 'Main-Class' => main_class })
    .merge(correct_dependencies)
    .exclude('META-INF/INDEX.LIST', 'META-INF/*.RSA', 'META-INF/*.SF', 'META-INF/*.DSA')
end

def filter_out_old_jackson_pkgs(dependencies)
  dependencies.reject do |dep|
    dep.to_hash[:group].start_with?("com.fasterxml.jackson.core") &&
      dep.to_hash[:id].start_with?("jackson") &&
      dep.to_hash[:version] == "2.2.2"
  end
end

