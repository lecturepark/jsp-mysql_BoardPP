
public class Display {
	static private String TITLE_BAR = "🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈";
	static private String TITLE = "🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈     게시판     🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈";
	static private String SELECT = "[1]글리스트 [2]글읽기 [3]글쓰기 [4]댓글쓰기 [5]글삭제 [6]글수정 [7]추천수 높은 게시글 [0]관리자 [e]나가기";
	static private String LIST = "🐱‍👓🐱‍👓🐱‍👓🐱‍👓🐱‍👓🐱‍👓🐱‍👓🐱‍👓🐱‍👓🐱‍👓🐱‍👓🐱‍👓    글 리스트   🐱‍👓🐱‍👓🐱‍👓🐱‍👓🐱‍👓🐱‍👓🐱‍👓🐱‍👓🐱‍👓🐱‍👓🐱‍👓🐱‍👓";
	static private String READ = "🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈    글 읽기   🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈";
	static private String WRITE = "😶!😶!😶!😶!😶!😶!😶!😶!   글 쓰기   😶!😶!😶!😶!😶!😶!😶!😶!";
	static private String REWRITE = "😶!😶!😶!😶!😶!😶!😶!😶!   댓글 쓰기   😶!😶!😶!😶!😶!😶!😶!😶!";
	static private String DELETE = "⚠⚠⚠⚠⚠⚠⚠⚠⚠⚠⚠⚠    글 삭제   ⚠⚠⚠⚠⚠⚠⚠⚠⚠⚠⚠⚠⚠";
	static private String EDITE = "⚠⚠⚠⚠⚠⚠⚠⚠⚠⚠⚠⚠    글 수정   ⚠⚠⚠⚠⚠⚠⚠⚠⚠⚠⚠⚠⚠";
	static private String HIGHRECOMMEND = "👍👍👍👍👍👍👍👍👍👍👍👍    베스트 게시글   👍👍👍👍👍👍👍👍👍👍👍👍👍👍";
	static private String ADMIN = "🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜    관리자   🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜";
	static private String EXIT = "🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜    게시판을 종료합니다   🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜🦜";

	static public void showTitle() {
		System.out.println(TITLE_BAR);
		System.out.println(TITLE);
		System.out.println(TITLE_BAR);

	}

	static public void showSELECT() {
		System.out.println(SELECT);
	}

	static public void showLIST() {
		System.out.println(LIST);
	}

	static public void showREAD() {
		System.out.println(READ);
	}

	static public void showWRITE() {
		System.out.println(WRITE);
	}

	static public void showREWRITE() {
		System.out.println(REWRITE);
	}

	static public void showDELETE() {
		System.out.println(DELETE);
	}

	static public void showEDITE() {
		System.out.println(EDITE);
	}

	static public void showHIGHRECOMMEND() {
		System.out.println(HIGHRECOMMEND);
	}

	static public void showADMIN() {
		System.out.println(ADMIN);
	}

	static public void showEXIT() {
		System.out.println(EXIT);
	}
}