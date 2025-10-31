import pytest

from module_c.service import ServiceC


@pytest.mark.integration
def test_module_d():
    service_c = ServiceC()
    assert service_c.name == "Service C"


def test_project_a_modules_are_not_accessible():
    try:
        import module_a  # noqa: F401 PLC0415
        import module_b  # noqa: F401 PLC0415

        raise AssertionError("Project A modules are accessible")
    except ImportError:
        assert True  # "Project A modules are not accessible"
