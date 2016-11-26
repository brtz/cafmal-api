class AddColumnDocumentationUrlToChecks < ActiveRecord::Migration[5.0]
  def change
    add_column :checks, :documentation_url, :string, :default => 'http://'
  end
end
