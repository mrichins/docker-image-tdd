require "serverspec"
require "docker"

describe "Dockerfile" do
  image = Docker::Image.build_from_dir('.')

  set :os, family: :debian
  set :backend, :docker
  set :docker_image, image.id

  it "has node installed" do
    expect(package('nodejs')).to be_installed
  end

  it "should listen on port 8000" do
    expect(port(8000)).to be_listening
  end
end
