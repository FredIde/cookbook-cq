#
# Cookbook Name:: cq
# Resource:: osgi_config
#
# Copyright (C) 2015 Jakub Wadolowski
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

actions :create, :delete

default_action :create

attribute :pid,
          :kind_of => String,
          :name_attribute => true,
          :required => true
attribute :factory_pid,
          :kind_of => String,
          :required => false
attribute :properties,
          :kind_of => Hash,
          :required => true
attribute :append,
          :kind_of => [TrueClass, FalseClass],
          :default => false,
          :required => false
attribute :username,
          :kind_of => String,
          :required => true
attribute :password,
          :kind_of => String,
          :required => true
attribute :instance,
          :kind_of => String,
          :required => true

attr_accessor :exists, :valid
