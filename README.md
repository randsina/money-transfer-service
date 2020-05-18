## Task Description
Implement TransferService.call to safely transfer money from one user to another. Make sure sender has enough balance.

Assume this table can be used by other services/applications directly (application level 'mutexes' aren't available).

Make sure it's safe to execute concurrently in multiple threads/processes.

User is an ActiveRecord model which properties are annotated below (gem annotate).

Please cover TransferService with unit tests.
### Schema Info
```ruby
# Table name: users
# id :integer
# name :string
# balance :decimal(16, 2)
# created_at :datetime
# updated_at :datetime
#
class User < ApplicationRecord
end

class TransferService
  def self.call(from_user_id, to_user_id, amount)
    # Put your code below:
  end
end
```
