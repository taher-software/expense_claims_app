module Status
    extend ActiveSupport::Concern
    VALID_STATUS = ['pending','approved','rejected']
    included do
        validates :status, inclusion: {in: VALID_STATUS}
    end

    def approve
        self.status = 'approved'
        self.save
    end
    def reject
        self.status = 'rejected'
        self.save
    end
    def approved?
        status == 'approved'
    end

    def rejected?
        status == 'rejected'
    end

    def pending?
        status == 'pending'
    end

end