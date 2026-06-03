
#!/bin/bash
# echo "\n\n"
# echo "OpenAI"
# echo "\n\n"
# curl --location 'http://localhost:4000/v1/chat/completions' \
# --header 'Content-Type: application/json' \
# --header 'Authorization: Bearer sk-litellm-master-key-1234' \
# --data '{
#     "model": "gpt-4o-mini",
#     "messages": [
#         {
#             "role": "user",
#             "content": "Hello! Confirming that you can hear me."
#         }
#     ]
# }'

# echo "\n\n"
# echo "Gemini"
# echo "\n\n"
# curl --location 'http://localhost:4000/v1/chat/completions' \
#     --header 'Content-Type: application/json' \
#     --header 'Authorization: Bearer sk-litellm-master-key-1234' \
#     --data '{
#         "model": "gemini-2.5-flash",
#         "messages": [
#             {
#                 "role": "user",
#                 "content": "Hello! Confirming that you can hear me."
#             }
#     ]
# }'



echo "\n\n"
echo "Railway"
echo "\n\n"
curl --location 'https://litellm-proxy-production-b956.up.railway.app/v1/chat/completions' \
    --header 'Content-Type: application/json' \
    --header 'Authorization: Bearer sk-litellm-master-key-1234' \
    --data '{
        "model": "gemini-2.5-flash",
        "messages": [
            {
                "role": "user",
                "content": "Hello! Confirming that you can hear me."
            }
    ]
}'