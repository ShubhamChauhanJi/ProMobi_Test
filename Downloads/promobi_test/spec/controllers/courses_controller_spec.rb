require 'rails_helper'

describe CoursesController do
  it "create the course" do
    post :create, params: {course: {name: "Ruby on Rails Course", description: "Ruby on Rails course is very good",  tutors_attributes: [name: "Ruby on Rails First Tutorial", experience: 5]}}
    json_response = response
    parsed_body = JSON.parse(json_response.body).with_indifferent_access
    expect(json_response.status).to equal(201)
    expect(parsed_body[:id]).to_not eql nil
    expect(parsed_body[:name]).to eql("Ruby on Rails Course")
  end
  it "should not create the course if name is not present" do
    post :create, params: {course: {tutors_attributes: [name: "Ruby on Rails First Tutorial"]}}
    json_response = response
    parsed_body = JSON.parse(json_response.body).with_indifferent_access
    expect(json_response.status).to equal(422)
    expect(parsed_body[:name]).to eql(["can't be blank"])
  end

  it "should not create the course if description is not present" do
    post :create, params: {course: {name: "Ruby on Rails Course", tutors_attributes: [name: "Ruby on Rails First Tutorial"]}}
    json_response = response
    parsed_body = JSON.parse(json_response.body).with_indifferent_access
    expect(json_response.status).to equal(422)
    expect(parsed_body[:description]).to eql(["can't be blank"])
  end

  it "should list all the courses" do
    get :index
    expect(response.status).to equal(200)
  end
end