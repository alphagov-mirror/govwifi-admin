module UseCases
  module Organisation
    class FetchOrganisationRegister
      def initialize(organisations_gateway:)
        @organisations_gateway = organisations_gateway
      end

      def execute
        government_orgs = organisations_gateway.government_orgs
        local_authorities = organisations_gateway.local_authorities
        custom_orgs = organisations_gateway.custom_orgs

        government_orgs + local_authorities + custom_orgs
      end

    private

      attr_reader :organisations_gateway
    end
  end
end
