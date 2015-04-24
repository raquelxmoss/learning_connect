class ModifyTutorLearnerToInitializerReceiverToConnections < ActiveRecord::Migration
  def change

    rename_column :connections, :tutor_id, :initializer_id
    rename_column :connections, :learner_id, :receiver_id

  end
end
