module Cpanel::ProjectsHelper
  def demo_for(project)
    if project.try(:demo).try(:file).try(:file)
      link_to_file project.demo.file, "DEMO"
    else
      nil
    end
  end
end
