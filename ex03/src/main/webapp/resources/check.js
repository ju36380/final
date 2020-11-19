$(frm).submit(function(e) {
		e.preventDefault();
		if ($(frm.title).val().trim().length == 0) {
			alert("제목 입력");
			$(frm.name).focus();
		} else if ($(frm.content).val().trim().length == 0) {
			alert("내용 입력");
			$(frm.tel).focus();
		} else {
			if (!confirm("등록?")) {
				return;
			} else {
				alert("등록 완료");
				frm.submit();
			}
		}
});
