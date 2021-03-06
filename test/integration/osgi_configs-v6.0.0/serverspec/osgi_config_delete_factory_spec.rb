require_relative '../../../kitchen/data/spec_helper'

describe 'Factory OSGi not.existing.factory.config.to.delete' do
  it 'there was NO attemtps to delete it' do
    expect(
      @osgi_config_helper.delete_requests(
        'not.existing.factory.config.to.delete'
      ).length
    ).to eq(0)
  end

  it 'there was a single check to verify factory PID presence' do
    expect(
      @osgi_config_helper.read_requests(
        'not.existing.factory.config.to.delete'
      ).length
    ).to eq(1)
  end

  it 'does NOT exist' do
    expect(
      @config_list.include?('not.existing.factory.config.to.delete')
    ).to be false
  end

  it 'in total there was 1 HTTP request' do
    expect(
      @osgi_config_helper.all_requests(
        'not.existing.factory.config.to.delete'
      ).length
    ).to eq(1)
  end
end

describe 'Factory OSGi org.apache.sling.tenant.internal.TenantProviderImpl' do
  it 'there was a single check to verify factory PID presence' do
    expect(
      @osgi_config_helper.read_requests(
        'org.apache.sling.tenant.internal.TenantProviderImpl'
      ).length
    ).to eq(1)
  end

  it 'in total there was 1 HTTP request' do
    expect(
      @osgi_config_helper.all_requests(
        'org.apache.sling.tenant.internal.TenantProviderImpl'
      ).length
    ).to eq(1)
  end
end

describe 'Factory OSGi org.apache.sling.commons.log.LogManager.factory.'\
  'writer' do
  it 'there was a single check to verify factory PID presence' do
    expect(
      @osgi_config_helper.read_requests(
        'org.apache.sling.commons.log.LogManager.factory.writer'
      ).length
    ).to eq(1)
  end

  it 'there was NO attemtps to delete it' do
    expect(
      @osgi_config_helper.delete_requests(
        'org.apache.sling.commons.log.LogManager.factory.writer'
      ).length
    ).to eq(0)
  end

  # 1) Read factory PID
  # 2) Read 1st instance
  it 'in total there were 2 HTTP requests' do
    expect(
      @osgi_config_helper.all_requests(
        'org.apache.sling.commons.log.LogManager.factory.writer'
      ).length
    ).to eq(2)
  end

  it '1 instance of org.apache.sling.commons.log.LogManager.factory.writer '\
    'exists' do
    expect(
      @osgi_config_helper.factory_instaces(
        'org.apache.sling.commons.log.LogManager.factory.writer'
      ).length
    ).to eq(1)
  end
end

describe 'Factory OSGi org.apache.sling.event.jobs.QueueConfiguration' do
  it 'there was 0 DELETE requests' do
    expect(
      @osgi_config_helper.delete_requests(
        'org.apache.sling.event.jobs.QueueConfiguration'
      ).length
    ).to eq(0)
  end

  # 1) Read factory PID
  # 2) - 10) Read all instances
  # 11) Re-read best pid
  it 'in total there were 11 HTTP requests' do
    expect(
      @osgi_config_helper.all_requests(
        'org.apache.sling.event.jobs.QueueConfiguration'
      ).length
    ).to eq(11)
  end

  it '9 instances of org.apache.sling.event.jobs.QueueConfiguration exist' do
    expect(
      @osgi_config_helper.factory_instaces(
        'org.apache.sling.event.jobs.QueueConfiguration'
      ).length
    ).to eq(9)
  end
end
