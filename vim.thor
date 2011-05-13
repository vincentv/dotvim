begin
    require 'psych'
rescue LoadError
end

require 'yaml'
require 'pathname'
require 'rbconfig'

class Vim < Thor
    include Thor::Actions

    desc 'install', 'Installations des plugins'
    def install
        plugins.each_pair do |name, repo|
            plugin_path = File.join('bundle', name)
            unless File.exist? plugin_path
                run "git submodule add #{repo} #{plugin_path}"
                run "git config --file='.gitmodules' submodule.#{plugin_path}.ignore dirty"
            end
        end
    end

    desc 'update', 'Mise à jours des plugins installés'
    def update
        plugins.each_pair do |name, repo|
            plugin_path = File.join('bundle', name)
            if File.exist? plugin_path
                Dir.chdir plugin_path do
                    run "git pull"
                end
            end
        end
    end

    desc 'clean', 'Nettoyage des plugins non referencés dans plugins.yml'
    def clean
        Pathname("bundle").each_child do |f|
            next if "pathogen" == f.basename

            if f.directory? && !plugins.has_key?(f.basename.to_s)
                begin
                    run "git config --remove-section  submodule.'#{f}'"
                    run "git config --file='.gitmodules' --remove-section  submodule.'#{f}'"
                    run "git rm -r --cached '#{f}'"
                    f.rmtree
                rescue
                end
            end
        end
    end

    protected
    def plugins
        @plugins_yml ||= YAML.load_file 'plugins.yml'
    end

    def windows?
        (RbConfig::CONFIG['host_os'] =~ /mswin|mingw/) ? true : false
    end

end
