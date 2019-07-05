module MicropostsHelper
  def choose_new_or_edit
    if action_name=='new'||action_name=='confirm'
      confirm_microposts_path
    else action_name=='edit'
      micropost_path
    end
  end
end
