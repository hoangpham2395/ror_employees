class Employee < ApplicationRecord
    has_and_belongs_to_many :projects
    has_many :leavedays
    has_many :ots
    has_many :members

	# name: Độc nhất, không bỏ trống, tối thiểu 5 ký tự, tối đa 255 ký tự
    validates :username, uniqueness: true, presence:true, length: {in: 5..255}
    validates :fullname, presence:true, length: {in: 5..255}

	# email: Không bỏ trống, tính duy nhất, đúng định dạng email
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email_company, :email_personal, length: {in: 4..255}, presence: true, uniqueness: true , format: { with: VALID_EMAIL_REGEX, message: "not in correct format." }

    # validates :password, presence: true, length: {in: 6..55}
    # Use gem bcrypt
	# has_secure_password

	# Không bỏ trống
    validates :gender, :birthday, :department, :position, :contract_type, :status, :user_type, :join_datetime, :id_number, presence: true
    
    # Image: validate paperclip
    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/ 
    # validates_attachment_content_type :image, :content_type => [/\Aimage/, 'application/octet-stream']
    # validates_attachment_content_type :image, :content_type => /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/
    # validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
    # do_not_validate_attachment_file_type :image

    # validate :check_content_type    
    # def check_content_type
    #     if !['image/jpeg', 'image/gif','image/png', 'image/jpg'].include?(self.image_content_type)
    #         errors.add_to_base("File '#{self.image_file_name}' không đúng định dạng của hình ảnh.") # or errors.add
    #     end
    # end

    # validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
end
