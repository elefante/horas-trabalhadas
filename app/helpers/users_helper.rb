module UsersHelper
  def my_input(form, field)
    %Q{
      <p>
        #{form.label field}<br />
        #{form.text_field field}
      </p>
    }
  end
end
