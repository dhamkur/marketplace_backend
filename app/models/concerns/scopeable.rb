module Scopeable
	extend ActiveSupport::Concern

	included do
		scope :alphabetically,->(column_name: nil) {
			column = column_name.present? ? "#{column_name}" : "#{klass.table_name}.name"
			order("#{column} ASC")
		}

		scope :newest,->(table: nil, column_name: nil) {
			column_name = "#{klass.table_name}.created_at" if column_name.blank?
			column = table.present? ? "#{table}.#{column_name}" : column_name
			order("#{column} DESC")
		}

		scope :oldest,->(table: nil, column_name: nil) {
			column_name = "#{klass.table_name}.created_at" if column_name.blank?
			column = table.present? ? "#{table}.#{column_name}" : column_name
			order("#{column} ASC")
		}

		scope :this_year, ->(table: nil, column_name: nil) {
			column_name = "#{klass.table_name}.created_at" if column_name.blank?
			column = table.present? ? "#{table}.#{column_name}" : column_name
			where("#{column} >= ? AND #{column} <= ?", Time.zone.now.beginning_of_year, Time.zone.now.end_of_year)
		}

		scope :this_month, ->(table: nil, column_name: nil) {
			column_name = "#{klass.table_name}.created_at" if column_name.blank?
			column = table.present? ? "#{table}.#{column_name}" : column_name
			where("#{column} >= ? AND #{column} <= ?", Time.zone.now.beginning_of_month, Time.zone.now.end_of_month)
		}

		scope :this_week, ->(table: nil, column_name: nil) {
			column_name = "#{klass.table_name}.created_at" if column_name.blank?
			column = table.present? ? "#{table}.#{column_name}" : column_name
			where("#{column} >= ? AND #{column} <= ?", Time.zone.now.beginning_of_week, Time.zone.now.end_of_week)
		}

		scope :today, ->(table: nil, column_name: nil) {
			column_name = "#{klass.table_name}.created_at" if column_name.blank?
			column = table.present? ? "#{table}.#{column_name}" : column_name
			where("DATE(#{column}) = ?", Time.zone.now.to_date)
		}

		scope :by_position,->(table: nil){
			column = table.present? ? "#{table}.position" : "#{klass.table_name}.position"
			order("#{column} ASC")
		}
	end
end
