class QuestionsController < ApplicationController
  before_action :set_question, only: %i[update show destroy edit]

  def index
    @question = Question.new
    @questions = Question.all
  end

  def show; end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to question_path(@question), notice: 'Новый вопрос создан!'
    else
      flash[:alert] = 'Вы неправильно заполнили поля формы регистрации'
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to question_path(@question), notice: 'Вопрос обновлён!'
    else
      flash.now[:alert] = 'При попытыке сохранить пользователя возникли ошибки'
      render :edit
    end
  end

  def destroy
    @question.destroy

    redirect_to questions_path, notice: 'Вопрос удалён!'
  end

  private

  def question_params
    params.require(:question).permit(:body, :user_id)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
