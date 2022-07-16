# Run Locally
1. ```npm install```
1. ```npm run start```

# Docker
## Build
```docker build -t react-docker:1.0.0-prod .```
## Run
```docker run --rm -it --name web -p 3000:80 react-docker:1.0.0-prod```