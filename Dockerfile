FROM directus/directus:10.9.2

# Install git 
# We need this part becaus "npm install" will fail without the git package.
# Installing apk packages needs permissions, so we need to switch to root user.
USER root  
RUN apk add git --no-cache 

COPY ./directus/extensions /directus/extensions

RUN corepack enable \
  && corepack prepare pnpm@8.13.1 --activate

USER node

# SearchSync extension
# First we copy the config file, then we install the extension.
COPY searchsync.config.cjs ./ 
RUN pnpm i moment uuid
RUN pnpm i dimitrov-adrian/directus-extension-searchsync
# RUN pnpm i hx-natthawat/directus-extension-global-search // Build Error
# RUN pnpm i u12206050/directus-extension-global-search // Build Error
# RUN pnpm i directus-extension-editorjs other-extensions
RUN pnpm i directus-extension-schema-management-module
RUN pnpm i directus-extension-field-actions
RUN pnpm i directus-extension-computed-interface
# RUN pnpm i maltejur/directus-extension-generate-types

# RUN pnpm i @bicou/directus-extension-imagga
# RUN pnpm i @thirdrocktechno/directus-extension-directusgpt

# Start command for our image
CMD npx directus bootstrap && \
  npx directus database migrate:latest && \
  npx directus start



