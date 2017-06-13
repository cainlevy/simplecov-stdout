require 'command_line_reporter'

module SimpleCov::Formatter
  class Stdout
    include CommandLineReporter

    def self.limit
      10
    end

    def self.project_root
      defined?(Rails) ? Rails.root.to_s : Dir.pwd
    end

    def format(result)
      files = result.files
        .select{|f| f.missed_lines.any? }
        .sort_by{|f| f.missed_lines.size * -1 }
        .first(self.class.limit)

      return unless files.any?

      table(border: true) do
        row(header: true) do
          column('File', width: 50)
          column('Covered Lines', width: 13, align: 'right')
          column('Lines of Code', width: 13, align: 'right')
          column('Coverage', width: 8, align: 'right')
          column('Missing', width: 25)
        end
        files.each do |file|
          row do
            column(file.filename.sub(self.class.project_root, ''))
            column(file.covered_lines.size)
            column(file.lines_of_code)
            column(Kernel.format('%.2f%%', file.covered_percent))
            column(file.missed_lines.map(&:number).sort.join(', '))
          end
        end
      end
    end
  end
end
