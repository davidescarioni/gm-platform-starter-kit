function approach(_a, _b, _amount){
	if (_a < _b) {
	    _a += _amount;
	    if (_a > _b)  return _b;
	} else {
	    _a -= _amount;
	    if (_a < _b)  return _b;
	}
	return _a;
}