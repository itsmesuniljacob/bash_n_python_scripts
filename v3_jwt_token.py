# https://cloud.google.com/python/docs/reference/iamcredentials/latest/google.cloud.iam_credentials_v1.services.iam_credentials.IAMCredentialsClient#google_cloud_iam_credentials_v1_services_iam_credentials_IAMCredentialsClient_generate_id_token
from google.cloud import iam_credentials_v1

def sample_generate_id_token():
    # Create a client
    client = iam_credentials_v1.IAMCredentialsClient()

    # Initialize request argument(s)
    request = iam_credentials_v1.GenerateIdTokenRequest(
        name="projects/-/serviceAccounts/<your service account with token creator access>",
        audience="https://accounts.google.com"
    )

    # Make the request
    response = client.generate_id_token(request=request)

    # Handle the response
    print(response)

sample_generate_id_token()