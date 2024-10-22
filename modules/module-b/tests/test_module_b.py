import pytest

from module_a.service import ServiceA


@pytest.mark.integration
def test_module_b():
    service_a = ServiceA()
    assert service_a.name == "Service A"
