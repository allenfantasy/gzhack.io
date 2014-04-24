module Cpanel::ProjectsHelper
  def demo_for(project)
    link_to_file project.demo.file, "DEMO"
  end
end
