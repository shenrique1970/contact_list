module ApplicationHelper
  def salvar_e_voltar(form, back_path)
    content_tag(:div, class: "mt-3") do
      form.submit("Salvar", class: "btn btn-primary me-2") +
      link_to("Voltar", back_path, class: "btn btn-secondary")
    end
  end
end
