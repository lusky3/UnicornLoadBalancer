# UnicornLoadBalancer
Unofficial Docker container for [UnicornLoadBalancer](https://github.com/UnicornTranscoder/UnicornLoadBalancer), part of the **UnicornTranscoder Project**.  

Can be found on [Docker Hub](https://registry.hub.docker.com/r/lusky3/unicornloadbalancer)

## Docker Tags

### UnicornLoadbalancer Only
Contains only [UnicornLoadBalancer](https://github.com/UnicornTranscoder/UnicornLoadBalancer). Uses the Environment variables listed below. No difference between the Ubuntu and Alpine builds, functionality-wise. Personal preference, really.  
   
Ubuntu: `ubuntu`, `ubuntu-latest`, `latest`  
Alpine: `alpine`, `alpine-latest`  

### Plex All-In-One
Contains Plex ([Official Docker Image](https://github.com/plexinc/pms-docker)), [UnicornLoadBalancer](https://github.com/UnicornTranscoder/UnicornLoadBalancer) and [UnicornFFMPEG](https://github.com/UnicornTranscoder/UnicornFFMPEG). Originally built on-top of the work by [magn2o](https://github.com/magn2o/UnicornDockerUnofficial). Uses the same Plex Environment Variables. Also uses the same UnicornLoadBalancer Environment Variables listed below, although most are pre-configured and don't need to be modified.  
  
Important note: The `pms-docker` branch will update whenever [plexinc/pms-docker](https://hub.docker.com/r/plexinc/pms-docker) updates. Becuase [UnicornTranscoder](https://github.com/UnicornTranscoder/UnicornTranscoder) is built specific to the Plex build, it's recommended you do not update the container until your UnicornTranscoder ([releases](https://github.com/UnicornTranscoder/UnicornTranscoder/releases)) build matches the latest Plex build ([tags](https://hub.docker.com/r/plexinc/pms-docker/tags)).  
Tags: `pms-docker`

### Other
Testing and Development - Very alpha, could be broken at any time.   
Tags: `dev`

## UnicornLoadBalancer Environment Variables
These are primarily for the UnicornLoadBalancer Only docker images

| Name | Description | Type | Default |
| ----------------- | ------------------------------------------------------------ | ------| ------- |
| **SERVER_PORT** | Port used by the *UnicornLoadBalancer* | `int` | `3001` |
| **SERVER_PUBLIC** | Public url where the *UnicornLoadBalancer* can be called, **with** a slash at the end | `string` | `http://127.0.0.1:3001/` |
| **PLEX_HOST** | Host to access to Plex | `string` | `127.0.0.1` | 
| **PLEX_PORT** | Port used by Plex | `int` | `32400` | 
| **PLEX_PATH_USR** | The Plex's path | `string` | `/usr/lib/plexmediaserver/` | 
| **PLEX_PATH_SESSIONS** | The path where Plex store sessions (to grab external subtitles) | `string` | `/var/lib/plexmediaserver/Library/Application Support/Plex Media Server/Cache/Transcode/Sessions` | 
| **DATABASE_MODE** | Kind of database to use with Plex, can be `sqlite` or `postgresql` | `string` | `sqlite` |
| **DATABASE_SQLITE_PATH** | The path of the Plex database | `string` | `/var/lib/plexmediaserver/Library/Application Support/Plex Media Server/Plug-in Support/Databases/com.plexapp.plugins.library.db` |
| **DATABASE_POSTGRESQL_HOST** | Host of the Postgresql server | `string` | ` ` |
| **DATABASE_POSTGRESQL_DATABASE** | Name of the postgresql database | `string` | ` ` |
| **DATABASE_POSTGRESQL_USER** | User used by the Postgresql database| `string` | ` ` |
| **DATABASE_POSTGRESQL_PASSWORD** | Password used by the Postgresql database | `string` | ` ` |
| **DATABASE_POSTGRESQL_PORT** | Port used by the Postgresql database | `int` | `5432` |
| **REDIS_HOST** | The host of the redis database | `string` `undefined` | `undefined` | 
| **REDIS_PORT** | Port used by Redis | `int` | `6379` |
| **REDIS_PASSWORD** | The password of the redis database | `string` | ` ` | 
| **REDIS_DB** | The index of the redis database | `int` | `0` | 
| **CUSTOM_SCORES_TIMEOUT** | Seconds to consider a not-pinged server as unavailable | `int` | `10` | 
| **CUSTOM_IMAGE_PROXY** | URL of an alternative server to convert images, this proxy must be compliant with the *images.weserv.nl* API (original or self-hosted). Eg supported value: `https://images.weserv.nl/` | `string` | ` ` | 
| **CUSTOM_DOWNLOAD_FORWARD** | Enable or disable 302 for download links and direct play, if enabled, transcoders need to have access to media files | `bool` | `false` | 
| **CUSTOM_SERVERS_LIST** | Transcoder servers set by default, **with** a slash at the end, separate servers with a **comma** | `string array` | `[]` | 
