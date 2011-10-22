module Rack
  class NeverLocal
    module RemoveLocalHost
      module_function

      def from(env)
        detect_localhost(env) and (transform_from('HTTP_X_REAL_IP',env) or transform_from('HTTP_X_CLUSTER_CLIENT_IP',env))
        env
      end

      def transform_from(key,env)
        env[key] and env['REMOTE_ADDR'] = env[key]
      end

      def detect_localhost(env)
        ['::1','127.0.0.1'].include? env['REMOTE_ADDR']
      end

    end
  end
end
