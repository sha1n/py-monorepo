import pytest


@pytest.mark.unit
def test_module_a():
    assert True


@pytest.mark.unit
async def test_module_a_async():
    assert True
