<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Forward11.jsp
	
	//이전 페이지(→ Send11.html)로부터 넘어온 데이터 수신
	// → num1, num2, op
	
	String num1Str = request.getParameter("num1");
	String num2Str = request.getParameter("num2");
	String op = request.getParameter("op");
	
	int num1, num2;
	num1=num2=0;
	String result = "";
	
	try
	{
		num1 = Integer.parseInt(num1Str);
		num2 = Integer.parseInt(num2Str);
		
		if(op.equals("1"))		//-- 더하기
			result = String.format("%d + %d = %d", num1, num2, (num1+num2));
		else if(op.equals("2"))	//-- 빼기
			result = String.format("%d - %d = %d", num1, num2, (num1-num2));
		else if(op.equals("3"))	//-- 곱하기
			result = String.format("%d * %d = %d", num1, num2, (num1*num2));
		else if(op.equals("4"))	//-- 나누기
			result = String.format("%d / %d = %.1f", num1, num2, (num1/(double)num2));
		else
			result = "알 수 없음";
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
	request.setAttribute("resultStr", result);
	
	// check~!!!
	RequestDispatcher dispatcher = request.getRequestDispatcher("Receive11.jsp");
	dispatcher.forward(request, response);
	
	/*===========================================================================================
	■■■ 『RequestDispatcher』 인터페이스 ■■■
	
	※ 이 인터페이스는 『forward()』와 『include()』 만 있다.
	
	※ 처리 과정 및 개념
	
	   일반적으로 HttpServlet 을 상속받는 클래스... ← 서블릿(Servlet) 만드는 방법.
	   
	   이렇게 작성된 클래스 내부에는
	   실제 요청을 서비스하는 『doGet()』과 『doPost()』 메소드가
	   정의되어 있으며(→ service() 메소드가 이들의 상위 메소드 : 제너릭서블릿이 Http서블릿보다 상위개념이구나~)
	   
	   // 자바에서 main이 있어야 실행되는 것처럼.. 서블릿컨테이너가 실행시키는 장소이자 주체.
	   ServletContainer 는 『HttpServlet』의 인스턴스를 생성하고,
	   『init()』 메소드를 호출하여 실행시켜주고,
	   이 메소드에 의해 매핑된 URL 에
	   (페이지 요청 방식에 따라...) doGet() 과 doPost() 중 선택하여
	   메소드를 호출하여 실행시켜주고,
	   Container 가 종료될 때 『destory()』 메소드를 호출해주고,
	   관련된 처리 과정이 마무리된다.
	   
	   // JSP는 어떻게 그리라는 칩같은 것, 서블릿은 칩 꽂는 장치.
	   // JSP가 필요없어지면 메모리차지하게 할 필요 없으니까 서블릿컨테이너가 알아서 destroy시키는 것.
	   즉, ServletContainer 가
	   init()		→ 처음
	   service()	→ 중간중간 요청이 있을 때 마다
	   destroy()	→ 마지막
	   메소드를 호출한다.
	   (절대 우리가 직접 호출하는 것이 아니다~!!!)
	   // init(), service(), destroy()를 호출하는 건 서블릿컨테이너.
	   
	   결국 『HttpServlet』은
	   하나의 인스턴스만 생성되어 멀티 스레딩으로 돌아가게 된다.
	   // CGI 방식 : 한글문서파일 하나 열 때마다 한글프로그램이 매번 또 실행됨(메모리 차지 심함)
	   // 멀티스레드 언세이프티 환경에서는 어떤 파일이 이 프로그램을 쓰고있는데? 그럼 다른 파일을 잠깐 블럭. 기다려.
	   // 멀티스레드 세이프티 환경에서는 너네 다 그 리소스 프로그램 써도 돼. 괜찮아. 문제가 생기면 내가 스레드를 조절할게.
	   // CGI 방식은 각자 프린터를 하나씩 가지고있음.(언제 누가 쓸지 모르니까)
	   // (하지만 다같이 동시에 출력하는 일이 드물다면..) 공유프린터 1대를 두고,
	   // 멀티스레드 언세이프티라면.. 지금 쓰고있는 사람있는지 확인하고 안 쓰고있어야지만 쓸 수 있음.(동시에 여러명이 쓰려고하면 다 멈춤)
	   // 멀티스레드 세이프티라면.. 
	   //							동시에 여러명이 인쇄하기 할 수 있음. 먼저 온 사람이 먼저 출력되도록.. 등의 리소스 사용 룰을 정해두면 되니까.
	   //                           즉, 교통정리규칙이 필요함. 그게 바로 멀티스레드를 세이프티하게 만든 구조.
	   
	   이렇게 구성되는 『HttpServlet』의 상속된 클래스의 인스턴스는
	   스레드에 안전하게 설계(스레드 세이프티)되어야 하고
	   따라서, 스레드에 안전하게 설계하지 않은 경우
	   상위 클래스를 마구 접근하게 되어 에러가 발생할 수 밖에 없다.
	   // 그러지 않으면 상위클래스를 먼저 선점하고 먼저 쓰려고 부딪히고 난리났을 거니까..
	   
	   이와 같은 이유로 환경 설정이나 J2EE 서비스에 관한 내용은
	   『ServletContext』에서 할 수 있게 된다.
	   (※ ServletContext : 서블릿에 대한 환경, 상태 등을 설정할 수 있는 객체)
	   // 하나의 객체를 멀티스레드로 돌아가게 하는 객체가 ServletContext.
	   // 만약 각각의 서블릿이 각각의 구조로 운영되게 하는 거라면 설정도 여러개.
	   //  -> 그러면 서블릿컨테이너가 대체 난 어떻게 인코딩해야하는거야? 혼란스러움
	   
	   이 『ServletContext』는 『getServletContext()』로만 받을 수 있다.
	   그렇기 때문에 이 『getServletContext()』는
	   동기화가 제대로 구현되어 있을 것이라고 예측할 수 있다.
	   그 이유는 멀티 스레드에 안전하게 설계(멀티 스레드 세이프티)되어 있어야
	   우리가 『ServletContext』의 『setAttribute()』나 『getAttribute()』를
	   스레드 걱정 없이 마음대로 읽고 쓸 수 있기 때문이다.
	   // CPU 설계 원칙 : 한 작업을 엄청 빠르게 처리하게 해야 CPU 리소스를 가장 효율적으로 쓸 수 있다.
	   // 스레드 < 프로세스 < 프로그램
	   // 스레드는 프로그램이 CPU리소스를 효율적으로 쓰도록 정해주는 거..
	   // 프로세스를 나눠서 쓰는 거랑 스레드를 나눠쓰는 거랑 뭐가 다름? -> 오버헤드가 다름.
			   // 큰거(프로세스)를 나누면 버려지는 영역이 큼.(하드디스크 1테라 사도 1테라 다 못 쓰는 것처럼)
	   
	   『ServletContext』의 또다른 커다란 기능 중 하나는
	   다른 서블릿 인스턴스를 가져올 수 있다거나
	   서블릿 환경 설정값을 가져올 수 있는 기능이다.
	   
	   『RequestDispatcher』 역시 그 기능 중의 하나이다.
	   사전적인 의미로는... 요청을 제공하는 도구
	   즉, 요청을 보내주는 인터페이스이다.
	   // ServletContext가 들고 쓰는 도구이자 하수인이자 심부름꾼, RequestDispatcher 
	   
	   현재... 요청을 다른 서블릿(혹은 JSP)으로 보내야 하는 상황.	//Forward11_1에서 발생한 요청을 Receive11로 보내야하는 상황.
	   그런데, 위에 언급된 바와 같이 서블릿의 인스턴스는 하나만 생성되고
	   이것이 멀티 스레딩으로 돌아가고 있다.
	   
	   
	   그렇기 때문에 새로운 서블릿을
	   그 서블릿을 실행하는 것만으로는 안되고
	   이미 돌아가고 있는 서블릿 인스턴스의 스레드를				//쓰고있던 리소스에 나도 좀 씁시다~하고 끼어들어야하는 상황.
	   하나 더 추가해야 한다.
	   이것은 서블릿 개발자가 처리해야 할 영역을 벗어났기 때문에
	   이 일은 『Dispatcher』가 대신 수행해 준다는 것이다.			//하수인을 서블릿컨테이너에게 보내서 말하고 와~~
	   
	   하지만, 이 『Dispatcher』는
	   『HttpServletRequest』, 『HttpServletResponse』를
	   생성해줄 수는 없다.											
	   // 클라이언트의 요청에 의해서 생성되는 『HttpServletRequest』, 『HttpServletResponse』
	   그렇기 때문에 『Dispatcher』가 생성해준 새로운 서블릿 스레드를
	   실행시키기 위해 『doGet()』이나 『doPost()』를 호출해야 한다.	
	   // 그래서 내가 클라이언트의 요청이 있었을 때 생성된 이 친구들을 잘 담아서 doGet()이나 doPost()하는 것.
	   
	   이와 같은 이유로
	   『dispatcher.forward(request, response);』 구문과 같이
	   request 와 response 를 넘겨주는 것이다.
	   
	============================================================================================*/

%>


