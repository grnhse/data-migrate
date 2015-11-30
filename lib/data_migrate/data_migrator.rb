require 'active_record'

module DataMigrate
  class DataMigrator < ActiveRecord::Migrator
    class << self
      def schema_migrations_table_name
        ActiveRecord::Base.table_name_prefix + 'data_migrations' + ActiveRecord::Base.table_name_suffix
      end

      def migrations_path
        'db/data'
      end
    end

    # NEVER use a transaction because data migrations may be long running operations
    def ddl_transaction(&block)
      block.call
    end
  end
end
