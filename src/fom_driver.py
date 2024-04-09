"""Remote Interface for FOM devices"""


def FomDriver():
    """Creates a network socket to communicate with the FOM devices"""

    def __init__(self, hostname: str = "127.0.0.1", port: int = 8000) -> None:
        """Constructor of Fom Driver"""
        self.hostname = hostname
        self.port = port

    def connect(self):
        """Connect the divice"""
        pass

    def send_command(self, command: str = None):
        """Sends commands over the SNAP7 network socket"""
        pass
