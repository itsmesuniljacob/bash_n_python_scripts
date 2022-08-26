from google.cloud import iam_credentials_v1
client = iam_credentials_v1.IAMCredentialsClient.from_service_account_file("./core.json")
name = client.service_account_path("-","<your service account with token creator access>")
audience = "https://sub-domain.domain.com"
response = client.generate_id_token(name=name, audience=audience)
print(response)
