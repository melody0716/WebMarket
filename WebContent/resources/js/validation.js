function CheckAddProduct() {
	
	/*addProduct에 설정한 id값을 통하여 getElementById()를 이용해서 가져옴*/
	var productId = document.getElementById("productId");
	var name = document.getElementById("name");
	var unitPrice = document.getElementById("unitPrice");
	var unitsInStock = document.getElementById("unitsInStock");
	
	//상품 아이디 체크 부분 
	//P로 시작, 숫자는 0부터 9까지 사용, 자리 수는 3~11 사이 -> 가 아닐 때 메시지창 뜸
	if(!check(/^P[0-9]{3,11}$/, productId, "[상품 코드]\nP와 숫자를 조합하여 4에서 12까지 입력하세요\n" +
	"첫 글자는 반드시 대문자 P로 시작해주세요.")) {
		return false;
	}
	
	//상품명 길이 체크 부분 
	if(name.value.length < 4 || name.value.length > 12) {
		alert("[상품명]\n최소 4자에서 최대 11자까지 입력해주세요.")
		name.select();
		name.focus();
		return false;
	}
	
	//상품 가격 체크 (숫자o)
	if(unitPrice.value.length == 0 || isNaN(unitPrice.value)) {
		alert("[가격]\n가격은 숫자만 입력 가능합니다.")
		unitPrice.select();
		unitPrice.focus();
		return false;
	}
	
	//상품 가격 체크 (음수x)
	if(unitPrice.value < 0) {
		alert("[가격]\n음수를 입력할 수 없습니다.")
		unitPrice.select();
		unitPrice.focus();
		return false;
	}
	
	//재고 수량 체크하는 부분 (숫자o)
	if(unitsInStock.value.length == 0 || isNaN(unitsInStock.value)) {
		alert("[재고 수]\n수량은 숫자만 입력 가능합니다.")
		unitsInStock.select();
		unitsInStock.focus();
		return false;
	}
	
	//재고 수량 체크하는 부분 (음수x)
	if(unitsInStock.value < 0) {
		alert("[재고 수]\n음수를 입력할 수 없습니다.")
		unitsInStock.select();
		unitsInStock.focus();
		return false;
	}
	
		
	//check함수는 정규 표현식(=regExp), 유효성 검사를 하는 부분(=e), 오류가 발생하면 알려줄 메시지(=msg)
	//매개변수를 활용하여 패턴이 맞는지 검증하는 내부 함수
	function check(regExp, e, msg) {
		//정규표현식에 적합하다면 ->
		if(regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}
	
	document.newProduct.submit();
}