require 'swagger_helper'

RSpec.describe 'api/v1/ratings', type: :request do
  before do
    FactoryBot.create(:movie, id: 1)
  end

  path '/api/v1/movies/{movie_id}/ratings/leave_review' do
    parameter name: 'movie_id', in: :path, type: :string, description: 'movie_id'

    post('leave a review rating') do
      consumes 'application/json'
      produces 'application/json'

      parameter name: :rating, in: :body, schema: {
        type: :object,
        properties: {
          stars: { type: :integer },
          comment: { type: :string }
        },
        required: %w[stars]
      }

      response(201, 'created') do
        let(:movie_id) { '1' }
        let(:rating) { { stars: 1, comment: 'Great movie!' } }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(400, 'bad request') do
        let(:movie_id) { '1' }
        let(:rating) { { stars: 'invalid', comment: 'Great movie!' } }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(404, 'not found') do
        let(:movie_id) { '100' }
        let(:rating) { { stars: 1, comment: 'Great movie!' } }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/movies/{movie_id}/ratings' do
    parameter name: 'movie_id', in: :path, type: :string, description: 'movie_id'

    get('fetch movie ratings') do
      response(200, 'successful') do
        let(:movie_id) { '1' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(404, 'not found') do
        let(:movie_id) { '100' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
