@tasks = []

Given(/^O sistema tem o projeto "([^"]*)" com data de entrega "([^"]*)"$/) do |project_name, final_date_str|
  proj_final_date = get_date_from_str(final_date_str)
  create_new_proj(project_name, proj_final_date)
end

When(/^eu crio a atividade "([^"]*)" no projeto "([^"]*)"$/) do |task_name, project_name|
  proj = Project.find_by_name(project_name)
  task = create_new_task(task_name, true, nil)
  add_task_to_proj(task, proj)
end

Then(/^a atividade "([^"]*)" não tem nenhum responsável alocado$/) do |task_name|
  task = Task.find_by_name(task_name)

  if(task.users.exists?)
    throw("A nova atividade contém usuários já alocados")
  end
end
