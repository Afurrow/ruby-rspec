describe Hash do
  subject(:my_car) do
    {
      make: 'Toyota',
      model: 'Prius',
      year: 2016,
      parking_camera?: true,
      assisted_steering?: false
    }
  end

  it 'is newer than 2015' do
    expect(my_car[:year]).to be > 2015
  end

  it 'has a parking camera' do
    expect(my_car[:parking_camera?]).to be true
  end

  it 'does not have assisted steering' do
    expect(my_car{:assisted_steering?}).not_to be true
  end
end
