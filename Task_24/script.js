$(document).ready(function(){	
	$('#check-btn').click(function(){
		let email=$('#email').val();
		alert(email);
		if(email){
				$.ajax({
					url: 'Components/task_24.cfc?method=emailCheck',
					type:'POST',
					data: {email:email },
					dataType:'json',
					success: function(response){
							let data=JSON.stringify(response);
							console.log(response);
							if(data.trim()==="Exists"){
								alert('Mail Id already Exists');
								$('#submit-btn').prop('disabled',true);
							}
							else if(data.trim()==="NotExists"){
								$('#submit-btn').prop('disabled',false);
							}		
					}
				});		
		}
		else{
			alert("Please enter an email Id");
		}
		return false;			
	});
});