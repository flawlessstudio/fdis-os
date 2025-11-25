import structlog
import logging
import sys

def configure_logging():
    """Configura el logging para que sea JSON en producción y legible en desarrollo."""
    shared_processors = [
        structlog.contextvars.merge_contextvars,
        structlog.processors.add_log_level,
        structlog.processors.TimeStamper(fmt="iso"),
        structlog.processors.StackInfoRenderer(),
        structlog.processors.format_exc_info,
    ]

    structlog.configure(
        processors=shared_processors + [
            structlog.processors.JSONRenderer() # Salida JSON para Datadog/Splunk
        ],
        logger_factory=structlog.PrintLoggerFactory(),
        cache_logger_on_first_use=True,
    )

    # Interceptar logs estándar de librerías
    logging.basicConfig(format="%(message)s", stream=sys.stdout, level=logging.INFO)

logger = structlog.get_logger()