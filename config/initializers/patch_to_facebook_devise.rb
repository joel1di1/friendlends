# encoding: utf-8
require 'devise/strategies/base'
require 'facebooker/session'

module Devise #:nodoc:
  module FacebookConnectable #:nodoc:
    module Strategies #:nodoc:

      class FacebookConnectable < ::Devise::Strategies::Base

        def authenticate!
          klass = mapping.to
          begin
            facebook_session = ::Facebooker::Session.current # session[:facebook_session]
            facebook_user = facebook_session.user

            user = klass.authenticate_with_facebook_connect(:uid => facebook_user.uid)

            if user.present?
              success!(user)
            else
              if klass.facebook_auto_create_account?
                user = returning(klass.new) do |u|
                  u.store_facebook_credentials!(
                      :session_key => facebook_session.session_key,
                      :uid => facebook_user.uid
                    )
                  u.on_before_facebook_connect(facebook_session)
                end

                begin
                  user.save(false)
                  user.on_after_facebook_connect(facebook_session)
                  success!(user)
                rescue => e
                  fail!('erreur du cote du save: '+e.message)
                end
              else
                fail!('facebook_auto_create_account')
              end
            end
          # NOTE: Facebooker::Session::SessionExpired errors handled in the controller.
          rescue => e
            fail!(e.message)
          end
        end
    end
    end
  end
end

Warden::Strategies.add(:facebook_connectable, Devise::FacebookConnectable::Strategies::FacebookConnectable)
