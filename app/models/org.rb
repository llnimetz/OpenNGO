include ApplicationHelper

class Org < ActiveRecord::Base
  after_commit :schedule_solr_reindex
  belongs_to :user
  has_many :objectives
  has_many :branches
  has_many :locations
  has_many :programs
  has_many :prizes
  has_many :balances
  has_many :incomes
  has_many :bigdonors
  has_one :legal
  has_one :board
  has_one :advisory
  has_and_belongs_to_many :affiliations
  has_and_belongs_to_many :networks
  has_and_belongs_to_many :ages
  has_and_belongs_to_many :causes
  has_and_belongs_to_many :activities
  accepts_nested_attributes_for :objectives, allow_destroy: true
  accepts_nested_attributes_for :programs, allow_destroy: true
  accepts_nested_attributes_for :legal, allow_destroy: true
  accepts_nested_attributes_for :branches, allow_destroy: true
  accepts_nested_attributes_for :board, allow_destroy: true
  accepts_nested_attributes_for :advisory, allow_destroy: true
  accepts_nested_attributes_for :locations, allow_destroy: true
  accepts_nested_attributes_for :affiliations, allow_destroy: true
  accepts_nested_attributes_for :networks, allow_destroy: true
  accepts_nested_attributes_for :prizes, allow_destroy: true
  accepts_nested_attributes_for :balances, allow_destroy: true
  accepts_nested_attributes_for :incomes, allow_destroy: true
  accepts_nested_attributes_for :bigdonors, allow_destroy: true

  attr_accessible :networks_attributes, :affiliations_attributes
  attr_accessible :legal_attributes, :objectives_attributes, :prizes_attributes, :programs_attributes, :causes_attributes, :branches_attributes, :board_attributes, :advisory_attributes, :activities_attributes, :ages_attributes, :locations_attributes
  attr_accessible :balance_attributes, :income_attributes, :bigdonors_attributes
  attr_accessible :name, :initials, :preferred_name, :logo_url, :address, :mission, :objective, :transparency
  attr_accessible :city, :int_branch, :telephone, :fax, :email, :website
  attr_accessible :founding_date, :starting_date, :legal_num, :cuit, :youtube, :twitter, :linkedin, :facebook, :legal_type
  attr_accessible :income_exempt, :tax_ded, :vat_exempt, :code_conduct, :external_auditor, :auditor_name, :annual_reporting, :external_prog_eval, :trans_policy
  attr_accessible :num_prog_ind, :num_prog_org, :num_prog_pub, :fte, :pte, :volunteers
  attr_accessible :certifier_name1, :certifier_name2, :certifier_title1, :certifier_title2, :leader_name, :leader_title
  attr_accessible :articles_web, :approved, :articles_office, :bylaws_web, :bylaws_office, :appts_web, :appts_office, :inscript_web, :inscript_office, :boardres_web, :boardres_office, :report_web, :report_office

  has_many :people, :through => :board
  has_many :people, :through => :advisory
  has_many :provinces, through: :locations

  searchable :auto_index => true, :auto_remove => true do
    text :name, boost: 5
    text :preferred_name, boost:4
    text :mission
    string :causes, :multiple=>true do
      causes.map(&:description)
    end
    text :mission
    integer :transparency
    date :updated_at
  end

  def people
    (self.advisory_members + self.board_members).uniq
  end

  def primary_province
    self.locations.find_by_primary(true).province.name
  end

  def advisory_members
    self.advisory ? self.advisory.people : []
  end

  def board_members
    self.board ? self.board.people : []
  end

  def has_valid_youtube?
    return false if self.youtube.nil?
    self.youtube.include?("www.youtube.com/embed")
  end

  def to_csv(option = {})
    CSV.generate do |csv|
      csv << self.attributes.keys
      csv << self.attributes.values
    end
  end


  private
  def schedule_solr_reindex
    SolrReindexWorker.perform_async(self.class.name)
  end

end
