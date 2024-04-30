# Docker Compose wrapper for dmarc-report-converter

A Docker Compose wrapper around the
[dmarc-report-converter](https://github.com/tierpod/dmarc-report-converter)
tool. It uses an [nginx](https://nginx.org/) container to serve the produced
HTML reports.

## Requirements

- Docker

## Usage

1. Clone this repository.
2. Copy your DMARC aggregate reports to the `input` directory. No need to
   extract/unzip the reports or flatten the directory.
3. Run `docker compose up`.
4. Open your browser to http://localhost
5. You should get a file browser in which you can navigate to the reports.

## Configuration

You can configure dmarc-report-converter to work differently by editing
`config.yaml`, see [that
repo](https://github.com/tierpod/dmarc-report-converter) for more information.

### Download the reports

To get the files dmarc-report-converter produces you can run:
```shell
docker compose -f docker-compose-output-dir.yml up
```

This will create an `output/` directory with the files.
