class MembersController < ApplicationController

  def new
  end

  def create
    @member = Member.new(name: params[:member_name], win: 0, lose: 0)
    @member.save
    redirect_to("/#tab-2")
  end

  def destroy
    @member = Member.find_by(id: params[:id])
    @member.destroy
    redirect_to("/#tab-2")
  end

  def edit
    @member = Member.find_by(id: params[:id])
  end

  def update
    @member = Member.find_by(id: params[:id])
    @member.name = params[:member_name]
    @member.save
    redirect_to("/#tab-2")
  end
end
