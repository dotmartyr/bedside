class UpdateEmailEnqueer
  @queue = :mail_enqueer

  def self.perform(page_id)
    page = Page.find(page_id)

    page.users.find_in_batches do |group|
      group.each do |user|
        puts "email user with id #{user.id}"
        BedsideMailer.update_posted(page_id, user.id).deliver
      end
    end
  end
end