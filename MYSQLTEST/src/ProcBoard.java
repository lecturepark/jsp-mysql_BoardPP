import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class ProcBoard {
	Connection con = null;
	Statement st = null;
	ResultSet result = null;

	void run() {
		dbInit();
		Display.showTitle();
		Scanner sc = new Scanner(System.in);
		naga: while (true) {
			dbPostCount();
			Display.showSELECT();
			System.out.println("명령입력: ");
			String cmd = sc.next();
			switch (cmd) {
			case "1": // 글 리스트
				Display.showLIST();
				try {
					result = st.executeQuery("SELECT * FROM board LIMIT 5 OFFSET 0");
					while (result.next()) {
						String no = result.getString("글번호");
						String title = result.getString("글제목");
						String id = result.getString("작성자id");
						String datetime = result.getString("작성시간");
						System.out.println(no + " " + title + " " + id + " " + datetime);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				System.out.println("<이전 [1] 2 3 4 5 다음>  e.나가기");
				nagagi: while (true) {
					String pageUpDown = sc.next();
					switch (pageUpDown) {

					case "1":
						try {
							result = st.executeQuery("SELECT * FROM board LIMIT 5 OFFSET 0");
							while (result.next()) {
								String no = result.getString("글번호");
								String title = result.getString("글제목");
								String id = result.getString("작성자id");
								String datetime = result.getString("작성시간");
								System.out.println(no + " " + title + " " + id + " " + datetime);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						}
						System.out.println("<이전 [1] 2 3 4 5 다음>  e.나가기");
						break;
					case "2":
						try {
							result = st.executeQuery("SELECT * FROM board LIMIT 5 OFFSET 5");
							while (result.next()) {
								String no = result.getString("글번호");
								String title = result.getString("글제목");
								String id = result.getString("작성자id");
								String datetime = result.getString("작성시간");
								System.out.println(no + " " + title + " " + id + " " + datetime);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						}
						System.out.println("<이전 1 [2] 3 4 5 다음>  e.나가기");
						break;
					case "3":
						try {
							result = st.executeQuery("SELECT * FROM board LIMIT 5 OFFSET 10");
							while (result.next()) {
								String no = result.getString("글번호");
								String title = result.getString("글제목");
								String id = result.getString("작성자id");
								String datetime = result.getString("작성시간");
								System.out.println(no + " " + title + " " + id + " " + datetime);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						}
						System.out.println("<이전 1 2 [3] 4 5 다음>  e.나가기");
						break;
					case "4":
						try {
							result = st.executeQuery("SELECT * FROM board LIMIT 5 OFFSET 15");
							while (result.next()) {
								String no = result.getString("글번호");
								String title = result.getString("글제목");
								String id = result.getString("작성자id");
								String datetime = result.getString("작성시간");
								System.out.println(no + " " + title + " " + id + " " + datetime);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						}
						System.out.println("<이전 1 2 3 [4] 5 다음>  e.나가기");
						break;
					case "5":
						try {
							result = st.executeQuery("SELECT * FROM board LIMIT 5 OFFSET 20");
							while (result.next()) {
								String no = result.getString("글번호");
								String title = result.getString("글제목");
								String id = result.getString("작성자id");
								String datetime = result.getString("작성시간");
								System.out.println(no + " " + title + " " + id + " " + datetime);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						}
						System.out.println("<이전 1 2 3 4 [5] 다음>  e.나가기");
						break;
					case "다음":
						try {
							result = st.executeQuery("SELECT * FROM board LIMIT 5 OFFSET 25");
							while (result.next()) {
								String no = result.getString("글번호");
								String title = result.getString("글제목");
								String id = result.getString("작성자id");
								String datetime = result.getString("작성시간");
								System.out.println(no + " " + title + " " + id + " " + datetime);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						}
						System.out.println("<이전 [6] 7 8 9 10 다음>  e.나가기");
						break;
					case "6":
						try {
							result = st.executeQuery("SELECT * FROM board LIMIT 5 OFFSET 25");
							while (result.next()) {
								String no = result.getString("글번호");
								String title = result.getString("글제목");
								String id = result.getString("작성자id");
								String datetime = result.getString("작성시간");
								System.out.println(no + " " + title + " " + id + " " + datetime);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						}
						System.out.println("<이전 [6] 7 8 9 10 다음>  e.나가기");
						break;
					case "7":
						try {
							result = st.executeQuery("SELECT * FROM board LIMIT 5 OFFSET 30");
							while (result.next()) {
								String no = result.getString("글번호");
								String title = result.getString("글제목");
								String id = result.getString("작성자id");
								String datetime = result.getString("작성시간");
								System.out.println(no + " " + title + " " + id + " " + datetime);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						}
						System.out.println("<이전 6 [7] 8 9 10 다음>  e.나가기");
						break;
					case "8":
						try {
							result = st.executeQuery("SELECT * FROM board LIMIT 5 OFFSET 35");
							while (result.next()) {
								String no = result.getString("글번호");
								String title = result.getString("글제목");
								String id = result.getString("작성자id");
								String datetime = result.getString("작성시간");
								System.out.println(no + " " + title + " " + id + " " + datetime);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						}
						System.out.println("<이전 6 7 [8] 9 10 다음>  e.나가기");
						break;
					case "9":
						try {
							result = st.executeQuery("SELECT * FROM board LIMIT 5 OFFSET 40");
							while (result.next()) {
								String no = result.getString("글번호");
								String title = result.getString("글제목");
								String id = result.getString("작성자id");
								String datetime = result.getString("작성시간");
								System.out.println(no + " " + title + " " + id + " " + datetime);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						}
						System.out.println("<이전 6 7 8 [9] 10 다음>  e.나가기");
						break;
					case "10":
						try {
							result = st.executeQuery("SELECT * FROM board LIMIT 5 OFFSET 45");
							while (result.next()) {
								String no = result.getString("글번호");
								String title = result.getString("글제목");
								String id = result.getString("작성자id");
								String datetime = result.getString("작성시간");
								System.out.println(no + " " + title + " " + id + " " + datetime);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						}
						System.out.println("<이전 6 7 8 9 [10] 다음>  e.나가기");
						break;
					case "이전":
						try {
							result = st.executeQuery("SELECT * FROM board LIMIT 5 OFFSET 20");
							while (result.next()) {
								String no = result.getString("글번호");
								String title = result.getString("글제목");
								String id = result.getString("작성자id");
								String datetime = result.getString("작성시간");
								System.out.println(no + " " + title + " " + id + " " + datetime);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						}
						System.out.println("<이전 1 2 3 4 [5] 다음>  e.나가기");
						break;
					case "e":
						System.out.println("글 리스트 보기를 종료합니다.");
						break nagagi;
					}
				}
				break;
			case "2": // 글 읽기
				Display.showREAD();
				System.out.println("읽을 글 번호을 입력해주세요:");
				String readNo = sc.next();
				try {
					result = st.executeQuery("select * from board where 글번호 =" + readNo);
					result.next();
					String title = result.getString("글제목");
					String content = result.getString("글내용");
					int hit = result.getInt("조회수");
					dbExecuteUpdate("update board set 조회수= 조회수+1 where 글번호=" + readNo);
					System.out.println("글제목" + title);
					System.out.println("글내용" + content);
					System.out.println("조회수" + (hit + 1));
					System.out.println("이 글은 추천하시겠습니까? y or n");
					String recommend = sc.next();
					if (recommend.equals("y")) {
						dbExecuteUpdate("update board set 추천수= 추천수+1 where 글번호=" + readNo);
						System.out.println("추천하였습니다.");
						break;
					} else {
						System.out.println("안추천");
						break;
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				break;
			case "3": // 글 쓰기
				Display.showWRITE();
				sc.nextLine();
				System.out.println("글제목을 입력해주세요:");
				String title = sc.nextLine();
				System.out.println("id를 입력해주세요: ");
				String id = sc.next();
				sc.nextLine();
				System.out.println("글 내용을 입력해주세요: ");
				String contents = sc.nextLine();
				dbExecuteUpdate("insert into board (글제목,작성자id,작성시간,글내용,조회수) values ('" + title + "', '" + id
						+ "',now(),'" + contents + "',0);");
				break;
			case "4": // 댓글 쓰기
				Display.showREWRITE();
				try {
					result = st.executeQuery("select * from board");
					while (result.next()) {
						String no = result.getString("글번호");
						String title2 = result.getString("글제목");
						String id2 = result.getString("작성자id");
						String datetime = result.getString("작성시간");
						System.out.println(no + " " + title2 + " " + id2 + " " + datetime);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				System.out.println("댓글을 작성할 글번호를 선택하세요:");
				String readNo2 = sc.next();
				sc.nextLine();
				try {
					result = st.executeQuery("select * from board where 글번호=" + readNo2);
					System.out.println("댓글을 작성하세요");
					String reply_text = sc.nextLine();
					dbExecuteUpdate("update board set 댓글내용= '" + reply_text + "',댓글수=댓글수+1 where 글번호=" + readNo2);
					System.out.println("댓글 작성을 완료했습니다");
				} catch (SQLException e) {
					e.printStackTrace();
				}
				break;
			case "5": // 글 삭제
				Display.showDELETE();
				System.out.println("삭제할 글 번호를 입력하세요");
				String delNo = sc.next();
				dbExecuteUpdate("delete from board where 글번호=" + delNo);
				break;
			case "6": // 글 수정
				Display.showEDITE();
				System.out.println("수정할 글 번호를 입력하세요");
				String edtNo = sc.next();
				sc.nextLine();
				System.out.println("제목을 수정하세요");
				String edtTitle = sc.nextLine();
				System.out.println("아이디를 수정하세요");
				String edtId = sc.next();
				System.out.println("글 내용을 수정하세요");
				sc.nextLine();
				String edtText = sc.nextLine();
				dbExecuteUpdate("update board set 글제목='" + edtTitle + "',작성자id='" + edtId + "',작성시간=now(),글내용='"
						+ edtText + "' where 글번호=" + edtNo);
				break;
			case "7": // 추천수 높은순으로 보기
				Display.showHIGHRECOMMEND();
				try {
					result = st.executeQuery("select * from board order by 추천수 desc LIMIT 5 OFFSET 0");
					while (result.next()) {
						String no = result.getString("글번호");
						String title3 = result.getString("글제목");
						String id3 = result.getString("작성자id");
						String datetime = result.getString("작성시간");
						String recommend3 = result.getString("추천수");
						System.out.println(no + " " + title3 + " " + id3 + " " + datetime + "추천수 : " + recommend3);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				System.out.println("<이전 [1] 2 3 4 5 다음>  e.나가기");
				choi: while (true) {
					String pageUpDown2 = sc.next();
					switch (pageUpDown2) {
					case "1":
						try {
							result = st.executeQuery("select * from board order by 추천수 desc LIMIT 5 OFFSET 0");
							while (result.next()) {
								String no = result.getString("글번호");
								String title3 = result.getString("글제목");
								String id3 = result.getString("작성자id");
								String datetime = result.getString("작성시간");
								String recommend3 = result.getString("추천수");
								System.out.println(
										no + " " + title3 + " " + id3 + " " + datetime + " 추천수 : " + recommend3);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						}
						System.out.println("<이전 [1] 2 3 4 5 다음>  e.나가기");
						break;
					case "2":
						try {
							result = st.executeQuery("select * from board order by 추천수 desc LIMIT 5 OFFSET 5");
							while (result.next()) {
								String no = result.getString("글번호");
								String title3 = result.getString("글제목");
								String id3 = result.getString("작성자id");
								String datetime = result.getString("작성시간");
								String recommend3 = result.getString("추천수");
								System.out.println(
										no + " " + title3 + " " + id3 + " " + datetime + " 추천수 : " + recommend3);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						}
						System.out.println("<이전 1 [2] 3 4 5 다음>  e.나가기");
						break;
					case "3":
						try {
							result = st.executeQuery("select * from board order by 추천수 desc LIMIT 5 OFFSET 10");
							while (result.next()) {
								String no = result.getString("글번호");
								String title3 = result.getString("글제목");
								String id3 = result.getString("작성자id");
								String datetime = result.getString("작성시간");
								String recommend3 = result.getString("추천수");
								System.out.println(
										no + " " + title3 + " " + id3 + " " + datetime + " 추천수 : " + recommend3);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						}
						System.out.println("<이전 1 2 [3] 4 5 다음>  e.나가기");
						break;
					case "4":
						try {
							result = st.executeQuery("select * from board order by 추천수 desc LIMIT 5 OFFSET 15");
							while (result.next()) {
								String no = result.getString("글번호");
								String title3 = result.getString("글제목");
								String id3 = result.getString("작성자id");
								String datetime = result.getString("작성시간");
								String recommend3 = result.getString("추천수");
								System.out.println(
										no + " " + title3 + " " + id3 + " " + datetime + " 추천수 : " + recommend3);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						}
						System.out.println("<이전 1 2 3 [4] 5 다음>  e.나가기");
						break;
					case "5":
						try {
							result = st.executeQuery("select * from board order by 추천수 desc LIMIT 5 OFFSET 20");
							while (result.next()) {
								String no = result.getString("글번호");
								String title3 = result.getString("글제목");
								String id3 = result.getString("작성자id");
								String datetime = result.getString("작성시간");
								String recommend3 = result.getString("추천수");
								System.out.println(
										no + " " + title3 + " " + id3 + " " + datetime + " 추천수 : " + recommend3);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						}
						System.out.println("<이전 1 2 3 4 [5] 다음>  e.나가기");
						break;
					case "다음":
						try {
							result = st.executeQuery("select * from board order by 추천수 desc LIMIT 5 OFFSET 25");
							while (result.next()) {
								String no = result.getString("글번호");
								String title3 = result.getString("글제목");
								String id3 = result.getString("작성자id");
								String datetime = result.getString("작성시간");
								String recommend3 = result.getString("추천수");
								System.out.println(
										no + " " + title3 + " " + id3 + " " + datetime + " 추천수 : " + recommend3);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						}
						System.out.println("<이전 [6] 7 8 9 10 다음>  e.나가기");
						break;
					case "6":
						try {
							result = st.executeQuery("select * from board order by 추천수 desc LIMIT 5 OFFSET 25");
							while (result.next()) {
								String no = result.getString("글번호");
								String title3 = result.getString("글제목");
								String id3 = result.getString("작성자id");
								String datetime = result.getString("작성시간");
								String recommend3 = result.getString("추천수");
								System.out.println(
										no + " " + title3 + " " + id3 + " " + datetime + " 추천수 : " + recommend3);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						}
						System.out.println("<이전 [6] 7 8 9 10 다음>  e.나가기");
						break;
					case "7":
						try {
							result = st.executeQuery("select * from board order by 추천수 desc LIMIT 5 OFFSET 30");
							while (result.next()) {
								String no = result.getString("글번호");
								String title3 = result.getString("글제목");
								String id3 = result.getString("작성자id");
								String datetime = result.getString("작성시간");
								String recommend3 = result.getString("추천수");
								System.out.println(
										no + " " + title3 + " " + id3 + " " + datetime + " 추천수 : " + recommend3);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						}
						System.out.println("<이전 6 [7] 8 9 10 다음>  e.나가기");
						break;
					case "8":
						try {
							result = st.executeQuery("select * from board order by 추천수 desc LIMIT 5 OFFSET 35");
							while (result.next()) {
								String no = result.getString("글번호");
								String title3 = result.getString("글제목");
								String id3 = result.getString("작성자id");
								String datetime = result.getString("작성시간");
								String recommend3 = result.getString("추천수");
								System.out.println(
										no + " " + title3 + " " + id3 + " " + datetime + " 추천수 : " + recommend3);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						}
						System.out.println("<이전 6 7 [8] 9 10 다음>  e.나가기");
						break;
					case "9":
						try {
							result = st.executeQuery("select * from board order by 추천수 desc LIMIT 5 OFFSET 40");
							while (result.next()) {
								String no = result.getString("글번호");
								String title3 = result.getString("글제목");
								String id3 = result.getString("작성자id");
								String datetime = result.getString("작성시간");
								String recommend3 = result.getString("추천수");
								System.out.println(
										no + " " + title3 + " " + id3 + " " + datetime + " 추천수 : " + recommend3);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						}
						System.out.println("<이전 6 7 8 [9] 10 다음>  e.나가기");
						break;
					case "10":
						try {
							result = st.executeQuery("select * from board order by 추천수 desc LIMIT 5 OFFSET 45");
							while (result.next()) {
								String no = result.getString("글번호");
								String title3 = result.getString("글제목");
								String id3 = result.getString("작성자id");
								String datetime = result.getString("작성시간");
								String recommend3 = result.getString("추천수");
								System.out.println(
										no + " " + title3 + " " + id3 + " " + datetime + " 추천수 : " + recommend3);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						}
						System.out.println("<이전 6 7 8 9 [10] 다음>  e.나가기");
						break;
					case "이전":
						try {
							result = st.executeQuery("select * from board order by 추천수 desc LIMIT 5 OFFSET 20");
							while (result.next()) {
								String no = result.getString("글번호");
								String title3 = result.getString("글제목");
								String id3 = result.getString("작성자id");
								String datetime = result.getString("작성시간");
								String recommend3 = result.getString("추천수");
								System.out.println(
										no + " " + title3 + " " + id3 + " " + datetime + " 추천수 : " + recommend3);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						}
						System.out.println("<이전 1 2 3 4 [5] 다음>  e.나가기");
						break;

					case "e":
						System.out.println("추천수 보기를 그만합니다");
						break choi;
					}
				}
				break;
			case "0": // 관리자
				Display.showADMIN();
				break;
			case "e": // 종료
				Display.showEXIT();
				break naga;
			}
		}
	}

	private void dbInit() {
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BoardBoard", "root", "admin");
			st = con.createStatement(); // Statement는 정적 SQL문을 실행하고 결과를 반환받기 위한 객체다. Statement하나당 한개의 ResultSet 객체만을 열
										// 수있다.
		} catch (SQLException e) {
			System.out.println("SQLException: " + e.getMessage());
			System.out.println("SQLState: " + e.getSQLState());
		}
	}

	private void dbExecuteQuery(String query) {
		try {
			result = st.executeQuery(query);
			while (result.next()) { // 결과를 하나씩 빼기. 더 이상 없으면(행 수가 끝나면) false 리턴됨.
				String name = result.getString("p_name"); // p_name 필드(열) 의 데이터 꺼내기(1개 꺼낸거에서)
				System.out.println(name);
			}
		} catch (SQLException e) {
			System.out.println("SQLException: " + e.getMessage());
			System.out.println("SQLState: " + e.getSQLState());
		}
	}

	private void dbExecuteUpdate(String query) {
		try {
			int resultCount = st.executeUpdate(query);
			System.out.println("처리된 행 수:" + resultCount);
		} catch (SQLException e) {
			e.printStackTrace();
//			System.out.println("SQLException: " + e.getMessage());
//			System.out.println("SQLState: " + e.getSQLState());
		}
	}

	private void dbPostCount() {
		try {
			result = st.executeQuery("select count(*) from board");
			result.next();
			String count = result.getString("count(*)");
			System.out.println("글 수:" + count);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}