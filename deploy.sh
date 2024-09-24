cp _headers ./doc/_headers

until mix publishex.netlify --token $NETLIFY_ACCESS_TOKEN --site-id $NETLIFY_SITE_ID; do
    echo "Command failed, retrying..."
done