/*======================
	DBCPConn.java
======================*/

package com.util;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBCPConn
{
	private static Connection conn = null;
	
	public static Connection getConnection()
	{
		if (conn == null)
		{
			try
			{
				// ○ 이름과 객체를 바인딩
				//-- 컨텍스트(Context)를 얻어내는 가장 쉬운 방법은
				//   『javax.naming.InitialContext』 클래스의
				//   인스턴스를 생성하는 것이다.
				//   → 『new InitialContext();』
				Context ctx = new InitialContext();
				
				// ※ javax.naming.InitialContext 의 메소드
				//    - bind(String str, Object obj)
				//      : 서비스할 객체를 특정 이름으로 등록한다.
				//    - rebind(String str, Object obj)
				//      : 서비스할 객체를 특정 이름으로 다시 등록한다.
				//    - lists(String str)
				//      : 특정 이름으로 서비스하는 객체 정보를 반환한다.
				//    - unbinding(String str)
				//      : 등록된 객체를 메모리에서 해제(제거)한다.
				//    - Object lookup(String str)
				//      : 서비스중인 객체 정보를 얻어온다.
				
				// 『web.xml』로부터 환경 설정을 얻어오겠다는 의미
				//-- 다른 형태로 변경 불가("java:/comp/env" : 고정!!)
				Context evt = (Context)ctx.lookup("java:/comp/env");
				
				// web.xml 을 통해서 읽어들인 콘텍스트 중에 "jdbc/myOracle"이라는 이름으로 등록된 리소스를 데리고와라
				//--> 아까 우리가 직접 context.xml에 등록한 이름 그대로, 우리가 등록했던 타입 DataSource니까 다운캐스팅
				//--> lookup()이 반환하는 자료형이 Object이므로, 그 안에 담긴 실제 "jdbc/myOracle"의 타입으로 형변환해서 받은 것.
				
				//--> 사실 아까 우리가 등록한 데는 context.xml 이므로.. web.xml에 가서 등록했던 걸 참조하겠다고 추가해줘야함.(web.xml로 가기)
				DataSource ds = (DataSource)evt.lookup("jdbc/myOracle");
				//--> DataSource 를 얻은 뒤로는 원래 우리 DBConn 운영하던 거랑 똑같이 운용하면 됨.
				
				conn = ds.getConnection();
			}
			catch(Exception e)
			{
				System.out.println(e.toString());
			}
		}
		
		return conn;
	}
	
	public static void close()
	{
		if (conn != null)
		{
			try
			{
				if (!conn.isClosed())
					conn.close();
			}
			catch(Exception e)
			{
				System.out.println(e.toString());
			}
		}
		conn = null;
	}
}
