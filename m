Content-Type: multipart/mixed; boundary="===============5710442569349943163=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [char-misc:char-misc-next 114/118] drivers/accessibility/speakup/i18n.c:93:32: sparse: sparse: obsolete array initializer, use C99 syntax
Date: Thu, 17 Jun 2021 10:19:24 +0800
Message-ID: <202106171011.9778RKxL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5710442569349943163==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Samuel Thibault <samuel.thibault@ens-lyon.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.gi=
t char-misc-next
head:   60f86b9a1c0d81507133173ba3dcfc3edd4d89a5
commit: 5b5140bf5182c24f1e37d61337a952e53f6aeb05 [114/118] speakup: Separat=
e out translations for bright colors names
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: parisc-randconfig-s031-20210617 (attached as .config)
compiler: hppa-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-341-g8af24329-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.=
git/commit/?id=3D5b5140bf5182c24f1e37d61337a952e53f6aeb05
        git remote add char-misc https://git.kernel.org/pub/scm/linux/kerne=
l/git/gregkh/char-misc.git
        git fetch --no-tags char-misc char-misc-next
        git checkout 5b5140bf5182c24f1e37d61337a952e53f6aeb05
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=3D1 ARCH=3Dparisc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/accessibility/speakup/i18n.c:93:32: sparse: sparse: obsolete arr=
ay initializer, use C99 syntax
   drivers/accessibility/speakup/i18n.c:94:33: sparse: sparse: obsolete arr=
ay initializer, use C99 syntax
   drivers/accessibility/speakup/i18n.c:95:32: sparse: sparse: obsolete arr=
ay initializer, use C99 syntax
   drivers/accessibility/speakup/i18n.c:96:31: sparse: sparse: obsolete arr=
ay initializer, use C99 syntax
   drivers/accessibility/speakup/i18n.c:97:35: sparse: sparse: obsolete arr=
ay initializer, use C99 syntax
   drivers/accessibility/speakup/i18n.c:98:34: sparse: sparse: obsolete arr=
ay initializer, use C99 syntax
   drivers/accessibility/speakup/i18n.c:99:33: sparse: sparse: obsolete arr=
ay initializer, use C99 syntax

vim +93 drivers/accessibility/speakup/i18n.c

c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   12  =

c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   13  static char *speakup_msgs[MSG_LAST_INDEX];
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   14  static char *speakup_default_msgs[MSG_LAST_INDEX] =3D {
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   15  	[MSG_BLANK] =3D "blank",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   16  	[MSG_IAM_ALIVE] =3D "I'm aLive!",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   17  	[MSG_YOU_KILLED_SPEAKUP] =3D "You killed speakup!",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   18  	[MSG_HEY_THATS_BETTER] =3D "hey. That's better!",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   19  	[MSG_YOU_TURNED_ME_OFF] =3D "You turned me off!",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   20  	[MSG_PARKED] =3D "parked!",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   21  	[MSG_UNPARKED] =3D "unparked!",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   22  	[MSG_MARK] =3D "mark",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   23  	[MSG_CUT] =3D "cut",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   24  	[MSG_MARK_CLEARED] =3D "mark, cleared",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   25  	[MSG_PASTE] =3D "paste",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   26  	[MSG_BRIGHT] =3D "bright",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   27  	[MSG_ON_BLINKING] =3D "on blinking",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   28  	[MSG_OFF] =3D "off",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   29  	[MSG_ON] =3D "on",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   30  	[MSG_NO_WINDOW] =3D "no window",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   31  	[MSG_CURSORING_OFF] =3D "cursoring off",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   32  	[MSG_CURSORING_ON] =3D "cursoring on",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   33  	[MSG_HIGHLIGHT_TRACKING] =3D "highlight tracking",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   34  	[MSG_READ_WINDOW] =3D "read windo",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   35  	[MSG_READ_ALL] =3D "read all",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   36  	[MSG_EDIT_DONE] =3D "edit done",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   37  	[MSG_WINDOW_ALREADY_SET] =3D "window already set, clear then r=
eset",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   38  	[MSG_END_BEFORE_START] =3D "error end before start",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   39  	[MSG_WINDOW_CLEARED] =3D "window cleared",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   40  	[MSG_WINDOW_SILENCED] =3D "window silenced",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   41  	[MSG_WINDOW_SILENCE_DISABLED] =3D "window silence disabled",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   42  	[MSG_ERROR] =3D "error",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   43  	[MSG_GOTO_CANCELED] =3D "goto canceled",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   44  	[MSG_GOTO] =3D "go to?",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   45  	[MSG_LEAVING_HELP] =3D "leaving help",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   46  	[MSG_IS_UNASSIGNED] =3D "is unassigned",
f976520bee1ca2 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-15   47  	[MSG_HELP_INFO] =3D
f976520bee1ca2 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-15   48  	"press space to exit, up or down to scroll, or a letter to go =
to a command",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   49  	[MSG_EDGE_TOP] =3D "top,",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   50  	[MSG_EDGE_BOTTOM] =3D "bottom,",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   51  	[MSG_EDGE_LEFT] =3D "left,",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   52  	[MSG_EDGE_RIGHT] =3D "right,",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   53  	[MSG_NUMBER] =3D "number",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   54  	[MSG_SPACE] =3D "space",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   55  	[MSG_START] =3D "start",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   56  	[MSG_END] =3D "end",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   57  	[MSG_CTRL] =3D "control-",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   58  	[MSG_DISJUNCTION] =3D "or",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   59  =

c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   60  /* Messages with embedded format specifiers. */
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   61  	[MSG_POS_INFO] =3D "line %ld, col %ld, t t y %d",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   62  	[MSG_CHAR_INFO] =3D "hex %02x, decimal %d",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   63  	[MSG_REPEAT_DESC] =3D "times %d .",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   64  	[MSG_REPEAT_DESC2] =3D "repeated %d .",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   65  	[MSG_WINDOW_LINE] =3D "window is line %d",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   66  	[MSG_WINDOW_BOUNDARY] =3D "%s at line %d, column %d",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   67  	[MSG_EDIT_PROMPT] =3D "edit  %s, press space when done",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   68  	[MSG_NO_COMMAND] =3D "no commands for %c",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   69  	[MSG_KEYDESC] =3D "is %s",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   70  =

c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   71  	/* Control keys. */
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   72  	/* Most of these duplicate the entries in state names. */
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   73  	[MSG_CTL_SHIFT] =3D "shift",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   74  	[MSG_CTL_ALTGR] =3D "altgr",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   75  	[MSG_CTL_CONTROL] =3D "control",
83414d528d2f97 drivers/staging/speakup/i18n.c       Justin P. Mattock 2012-=
07-09   76  	[MSG_CTL_ALT] =3D "alt",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   77  	[MSG_CTL_LSHIFT] =3D "l shift",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   78  	[MSG_CTL_SPEAKUP] =3D "speakup",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   79  	[MSG_CTL_LCONTROL] =3D "l control",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   80  	[MSG_CTL_RCONTROL] =3D "r control",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   81  	[MSG_CTL_CAPSSHIFT] =3D "caps shift",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   82  =

c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   83  	/* Color names. */
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   84  	[MSG_COLOR_BLACK] =3D "black",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   85  	[MSG_COLOR_BLUE] =3D "blue",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   86  	[MSG_COLOR_GREEN] =3D "green",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   87  	[MSG_COLOR_CYAN] =3D "cyan",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   88  	[MSG_COLOR_RED] =3D "red",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   89  	[MSG_COLOR_MAGENTA] =3D "magenta",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   90  	[MSG_COLOR_YELLOW] =3D "yellow",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   91  	[MSG_COLOR_WHITE] =3D "white",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07   92  	[MSG_COLOR_GREY] =3D "grey",
5b5140bf5182c2 drivers/accessibility/speakup/i18n.c Samuel Thibault   2021-=
06-13  @93  	[MSG_COLOR_BRIGHTBLUE] "bright blue",
5b5140bf5182c2 drivers/accessibility/speakup/i18n.c Samuel Thibault   2021-=
06-13   94  	[MSG_COLOR_BRIGHTGREEN] "bright green",
5b5140bf5182c2 drivers/accessibility/speakup/i18n.c Samuel Thibault   2021-=
06-13   95  	[MSG_COLOR_BRIGHTCYAN] "bright cyan",
5b5140bf5182c2 drivers/accessibility/speakup/i18n.c Samuel Thibault   2021-=
06-13   96  	[MSG_COLOR_BRIGHTRED] "bright red",
5b5140bf5182c2 drivers/accessibility/speakup/i18n.c Samuel Thibault   2021-=
06-13   97  	[MSG_COLOR_BRIGHTMAGENTA] "bright magenta",
5b5140bf5182c2 drivers/accessibility/speakup/i18n.c Samuel Thibault   2021-=
06-13   98  	[MSG_COLOR_BRIGHTYELLOW] "bright yellow",
5b5140bf5182c2 drivers/accessibility/speakup/i18n.c Samuel Thibault   2021-=
06-13   99  	[MSG_COLOR_BRIGHTWHITE] "bright white",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  100  =

c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  101  	/* Names of key states. */
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  102  	[MSG_STATE_DOUBLE] =3D "double",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  103  	[MSG_STATE_SPEAKUP] =3D "speakup",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  104  	[MSG_STATE_ALT] =3D "alt",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  105  	[MSG_STATE_CONTROL] =3D "ctrl",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  106  	[MSG_STATE_ALTGR] =3D "altgr",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  107  	[MSG_STATE_SHIFT] =3D "shift",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  108  =

c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  109  	/* Key names. */
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  110  	[MSG_KEYNAME_ESC] =3D "escape",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  111  	[MSG_KEYNAME_1] =3D "1",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  112  	[MSG_KEYNAME_2] =3D "2",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  113  	[MSG_KEYNAME_3] =3D "3",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  114  	[MSG_KEYNAME_4] =3D "4",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  115  	[MSG_KEYNAME_5] =3D "5",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  116  	[MSG_KEYNAME_6] =3D "6",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  117  	[MSG_KEYNAME_7] =3D "7",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  118  	[MSG_KEYNAME_8] =3D "8",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  119  	[MSG_KEYNAME_9] =3D "9",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  120  	[MSG_KEYNAME_0] =3D "0",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  121  	[MSG_KEYNAME_DASH] =3D "minus",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  122  	[MSG_KEYNAME_EQUAL] =3D "equal",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  123  	[MSG_KEYNAME_BS] =3D "back space",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  124  	[MSG_KEYNAME_TAB] =3D "tab",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  125  	[MSG_KEYNAME_Q] =3D "q",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  126  	[MSG_KEYNAME_W] =3D "w",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  127  	[MSG_KEYNAME_E] =3D "e",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  128  	[MSG_KEYNAME_R] =3D "r",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  129  	[MSG_KEYNAME_T] =3D "t",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  130  	[MSG_KEYNAME_Y] =3D "y",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  131  	[MSG_KEYNAME_U] =3D "u",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  132  	[MSG_KEYNAME_I] =3D "i",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  133  	[MSG_KEYNAME_O] =3D "o",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  134  	[MSG_KEYNAME_P] =3D "p",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  135  	[MSG_KEYNAME_LEFTBRACE] =3D "left brace",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  136  	[MSG_KEYNAME_RIGHTBRACE] =3D "right brace",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  137  	[MSG_KEYNAME_ENTER] =3D "enter",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  138  	[MSG_KEYNAME_LEFTCTRL] =3D "left control",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  139  	[MSG_KEYNAME_A] =3D "a",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  140  	[MSG_KEYNAME_S] =3D "s",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  141  	[MSG_KEYNAME_D] =3D "d",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  142  	[MSG_KEYNAME_F] =3D "f",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  143  	[MSG_KEYNAME_G] =3D "g",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  144  	[MSG_KEYNAME_H] =3D "h",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  145  	[MSG_KEYNAME_J] =3D "j",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  146  	[MSG_KEYNAME_K] =3D "k",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  147  	[MSG_KEYNAME_L] =3D "l",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  148  	[MSG_KEYNAME_SEMICOLON] =3D "semicolon",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  149  	[MSG_KEYNAME_SINGLEQUOTE] =3D "apostrophe",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  150  	[MSG_KEYNAME_GRAVE] =3D "accent",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  151  	[MSG_KEYNAME_LEFTSHFT] =3D "left shift",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  152  	[MSG_KEYNAME_BACKSLASH] =3D "back slash",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  153  	[MSG_KEYNAME_Z] =3D "z",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  154  	[MSG_KEYNAME_X] =3D "x",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  155  	[MSG_KEYNAME_C] =3D "c",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  156  	[MSG_KEYNAME_V] =3D "v",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  157  	[MSG_KEYNAME_B] =3D "b",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  158  	[MSG_KEYNAME_N] =3D "n",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  159  	[MSG_KEYNAME_M] =3D "m",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  160  	[MSG_KEYNAME_COMMA] =3D "comma",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  161  	[MSG_KEYNAME_DOT] =3D "dot",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  162  	[MSG_KEYNAME_SLASH] =3D "slash",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  163  	[MSG_KEYNAME_RIGHTSHFT] =3D "right shift",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  164  	[MSG_KEYNAME_KPSTAR] =3D "keypad asterisk",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  165  	[MSG_KEYNAME_LEFTALT] =3D "left alt",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  166  	[MSG_KEYNAME_SPACE] =3D "space",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  167  	[MSG_KEYNAME_CAPSLOCK] =3D "caps lock",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  168  	[MSG_KEYNAME_F1] =3D "f1",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  169  	[MSG_KEYNAME_F2] =3D "f2",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  170  	[MSG_KEYNAME_F3] =3D "f3",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  171  	[MSG_KEYNAME_F4] =3D "f4",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  172  	[MSG_KEYNAME_F5] =3D "f5",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  173  	[MSG_KEYNAME_F6] =3D "f6",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  174  	[MSG_KEYNAME_F7] =3D "f7",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  175  	[MSG_KEYNAME_F8] =3D "f8",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  176  	[MSG_KEYNAME_F9] =3D "f9",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  177  	[MSG_KEYNAME_F10] =3D "f10",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  178  	[MSG_KEYNAME_NUMLOCK] =3D "num lock",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  179  	[MSG_KEYNAME_SCROLLLOCK] =3D "scroll lock",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  180  	[MSG_KEYNAME_KP7] =3D "keypad 7",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  181  	[MSG_KEYNAME_KP8] =3D "keypad 8",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  182  	[MSG_KEYNAME_KP9] =3D "keypad 9",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  183  	[MSG_KEYNAME_KPMINUS] =3D "keypad minus",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  184  	[MSG_KEYNAME_KP4] =3D "keypad 4",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  185  	[MSG_KEYNAME_KP5] =3D "keypad 5",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  186  	[MSG_KEYNAME_KP6] =3D "keypad 6",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  187  	[MSG_KEYNAME_KPPLUS] =3D "keypad plus",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  188  	[MSG_KEYNAME_KP1] =3D "keypad 1",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  189  	[MSG_KEYNAME_KP2] =3D "keypad 2",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  190  	[MSG_KEYNAME_KP3] =3D "keypad 3",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  191  	[MSG_KEYNAME_KP0] =3D "keypad 0",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  192  	[MSG_KEYNAME_KPDOT] =3D "keypad dot",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  193  	[MSG_KEYNAME_103RD] =3D "103rd",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  194  	[MSG_KEYNAME_F13] =3D "f13",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  195  	[MSG_KEYNAME_102ND] =3D "102nd",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  196  	[MSG_KEYNAME_F11] =3D "f11",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  197  	[MSG_KEYNAME_F12] =3D "f12",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  198  	[MSG_KEYNAME_F14] =3D "f14",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  199  	[MSG_KEYNAME_F15] =3D "f15",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  200  	[MSG_KEYNAME_F16] =3D "f16",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  201  	[MSG_KEYNAME_F17] =3D "f17",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  202  	[MSG_KEYNAME_F18] =3D "f18",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  203  	[MSG_KEYNAME_F19] =3D "f19",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  204  	[MSG_KEYNAME_F20] =3D "f20",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  205  	[MSG_KEYNAME_KPENTER] =3D "keypad enter",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  206  	[MSG_KEYNAME_RIGHTCTRL] =3D "right control",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  207  	[MSG_KEYNAME_KPSLASH] =3D "keypad slash",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  208  	[MSG_KEYNAME_SYSRQ] =3D "sysrq",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  209  	[MSG_KEYNAME_RIGHTALT] =3D "right alt",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  210  	[MSG_KEYNAME_LF] =3D "line feed",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  211  	[MSG_KEYNAME_HOME] =3D "home",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  212  	[MSG_KEYNAME_UP] =3D "up",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  213  	[MSG_KEYNAME_PGUP] =3D "page up",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  214  	[MSG_KEYNAME_LEFT] =3D "left",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  215  	[MSG_KEYNAME_RIGHT] =3D "right",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  216  	[MSG_KEYNAME_END] =3D "end",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  217  	[MSG_KEYNAME_DOWN] =3D "down",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  218  	[MSG_KEYNAME_PGDN] =3D "page down",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  219  	[MSG_KEYNAME_INS] =3D "insert",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  220  	[MSG_KEYNAME_DEL] =3D "delete",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  221  	[MSG_KEYNAME_MACRO] =3D "macro",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  222  	[MSG_KEYNAME_MUTE] =3D "mute",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  223  	[MSG_KEYNAME_VOLDOWN] =3D "volume down",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  224  	[MSG_KEYNAME_VOLUP] =3D "volume up",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  225  	[MSG_KEYNAME_POWER] =3D "power",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  226  	[MSG_KEYNAME_KPEQUAL] =3D "keypad equal",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  227  	[MSG_KEYNAME_KPPLUSDASH] =3D "keypad plusminus",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  228  	[MSG_KEYNAME_PAUSE] =3D "pause",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  229  	[MSG_KEYNAME_F21] =3D "f21",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  230  	[MSG_KEYNAME_F22] =3D "f22",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  231  	[MSG_KEYNAME_F23] =3D "f23",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  232  	[MSG_KEYNAME_F24] =3D "f24",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  233  	[MSG_KEYNAME_KPCOMMA] =3D "keypad comma",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  234  	[MSG_KEYNAME_LEFTMETA] =3D "left meta",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  235  	[MSG_KEYNAME_RIGHTMETA] =3D "right meta",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  236  	[MSG_KEYNAME_COMPOSE] =3D "compose",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  237  	[MSG_KEYNAME_STOP] =3D "stop",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  238  	[MSG_KEYNAME_AGAIN] =3D "again",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  239  	[MSG_KEYNAME_PROPS] =3D "props",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  240  	[MSG_KEYNAME_UNDO] =3D "undo",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  241  	[MSG_KEYNAME_FRONT] =3D "front",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  242  	[MSG_KEYNAME_COPY] =3D "copy",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  243  	[MSG_KEYNAME_OPEN] =3D "open",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  244  	[MSG_KEYNAME_PASTE] =3D "paste",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  245  	[MSG_KEYNAME_FIND] =3D "find",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  246  	[MSG_KEYNAME_CUT] =3D "cut",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  247  	[MSG_KEYNAME_HELP] =3D "help",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  248  	[MSG_KEYNAME_MENU] =3D "menu",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  249  	[MSG_KEYNAME_CALC] =3D "calc",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  250  	[MSG_KEYNAME_SETUP] =3D "setup",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  251  	[MSG_KEYNAME_SLEEP] =3D "sleep",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  252  	[MSG_KEYNAME_WAKEUP] =3D "wakeup",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  253  	[MSG_KEYNAME_FILE] =3D "file",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  254  	[MSG_KEYNAME_SENDFILE] =3D "send file",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  255  	[MSG_KEYNAME_DELFILE] =3D "delete file",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  256  	[MSG_KEYNAME_XFER] =3D "transfer",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  257  	[MSG_KEYNAME_PROG1] =3D "prog1",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  258  	[MSG_KEYNAME_PROG2] =3D "prog2",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  259  	[MSG_KEYNAME_WWW] =3D "www",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  260  	[MSG_KEYNAME_MSDOS] =3D "msdos",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  261  	[MSG_KEYNAME_COFFEE] =3D "coffee",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  262  	[MSG_KEYNAME_DIRECTION] =3D "direction",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  263  	[MSG_KEYNAME_CYCLEWINDOWS] =3D "cycle windows",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  264  	[MSG_KEYNAME_MAIL] =3D "mail",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  265  	[MSG_KEYNAME_BOOKMARKS] =3D "bookmarks",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  266  	[MSG_KEYNAME_COMPUTER] =3D "computer",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  267  	[MSG_KEYNAME_BACK] =3D "back",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  268  	[MSG_KEYNAME_FORWARD] =3D "forward",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  269  	[MSG_KEYNAME_CLOSECD] =3D "close cd",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  270  	[MSG_KEYNAME_EJECTCD] =3D "eject cd",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  271  	[MSG_KEYNAME_EJECTCLOSE] =3D "eject close cd",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  272  	[MSG_KEYNAME_NEXTSONG] =3D "next song",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  273  	[MSG_KEYNAME_PLAYPAUSE] =3D "play pause",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  274  	[MSG_KEYNAME_PREVSONG] =3D "previous song",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  275  	[MSG_KEYNAME_STOPCD] =3D "stop cd",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  276  	[MSG_KEYNAME_RECORD] =3D "record",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  277  	[MSG_KEYNAME_REWIND] =3D "rewind",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  278  	[MSG_KEYNAME_PHONE] =3D "phone",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  279  	[MSG_KEYNAME_ISO] =3D "iso",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  280  	[MSG_KEYNAME_CONFIG] =3D "config",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  281  	[MSG_KEYNAME_HOMEPG] =3D "home page",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  282  	[MSG_KEYNAME_REFRESH] =3D "refresh",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  283  	[MSG_KEYNAME_EXIT] =3D "exit",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  284  	[MSG_KEYNAME_MOVE] =3D "move",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  285  	[MSG_KEYNAME_EDIT] =3D "edit",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  286  	[MSG_KEYNAME_SCROLLUP] =3D "scroll up",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  287  	[MSG_KEYNAME_SCROLLDN] =3D "scroll down",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  288  	[MSG_KEYNAME_KPLEFTPAR] =3D "keypad left paren",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  289  	[MSG_KEYNAME_KPRIGHTPAR] =3D "keypad right paren",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  290  =

c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  291  	/* Function names. */
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  292  	[MSG_FUNCNAME_ATTRIB_BLEEP_DEC] =3D "attribute bleep decrement=
",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  293  	[MSG_FUNCNAME_ATTRIB_BLEEP_INC] =3D "attribute bleep increment=
",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  294  	[MSG_FUNCNAME_BLEEPS_DEC] =3D "bleeps decrement",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  295  	[MSG_FUNCNAME_BLEEPS_INC] =3D "bleeps increment",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  296  	[MSG_FUNCNAME_CHAR_FIRST] =3D "character, first",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  297  	[MSG_FUNCNAME_CHAR_LAST] =3D "character, last",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  298  	[MSG_FUNCNAME_CHAR_CURRENT] =3D "character, say current",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  299  	[MSG_FUNCNAME_CHAR_HEX_AND_DEC] =3D "character, say hex and de=
cimal",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  300  	[MSG_FUNCNAME_CHAR_NEXT] =3D "character, say next",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  301  	[MSG_FUNCNAME_CHAR_PHONETIC] =3D "character, say phonetic",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  302  	[MSG_FUNCNAME_CHAR_PREVIOUS] =3D "character, say previous",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  303  	[MSG_FUNCNAME_CURSOR_PARK] =3D "cursor park",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  304  	[MSG_FUNCNAME_CUT] =3D "cut",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  305  	[MSG_FUNCNAME_EDIT_DELIM] =3D "edit delimiters",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  306  	[MSG_FUNCNAME_EDIT_EXNUM] =3D "edit exnum",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  307  	[MSG_FUNCNAME_EDIT_MOST] =3D "edit most",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  308  	[MSG_FUNCNAME_EDIT_REPEATS] =3D "edit repeats",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  309  	[MSG_FUNCNAME_EDIT_SOME] =3D "edit some",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  310  	[MSG_FUNCNAME_GOTO] =3D "go to",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  311  	[MSG_FUNCNAME_GOTO_BOTTOM] =3D "go to bottom edge",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  312  	[MSG_FUNCNAME_GOTO_LEFT] =3D "go to left edge",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  313  	[MSG_FUNCNAME_GOTO_RIGHT] =3D "go to right edge",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  314  	[MSG_FUNCNAME_GOTO_TOP] =3D "go to top edge",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  315  	[MSG_FUNCNAME_HELP] =3D "help",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  316  	[MSG_FUNCNAME_LINE_SAY_CURRENT] =3D "line, say current",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  317  	[MSG_FUNCNAME_LINE_SAY_NEXT] =3D "line, say next",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  318  	[MSG_FUNCNAME_LINE_SAY_PREVIOUS] =3D "line, say previous",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  319  	[MSG_FUNCNAME_LINE_SAY_WITH_INDENT] =3D "line, say with indent=
",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  320  	[MSG_FUNCNAME_PASTE] =3D "paste",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  321  	[MSG_FUNCNAME_PITCH_DEC] =3D "pitch decrement",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  322  	[MSG_FUNCNAME_PITCH_INC] =3D "pitch increment",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  323  	[MSG_FUNCNAME_PUNC_DEC] =3D "punctuation decrement",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  324  	[MSG_FUNCNAME_PUNC_INC] =3D "punctuation increment",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  325  	[MSG_FUNCNAME_PUNC_LEVEL_DEC] =3D "punc level decrement",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  326  	[MSG_FUNCNAME_PUNC_LEVEL_INC] =3D "punc level increment",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  327  	[MSG_FUNCNAME_QUIET] =3D "quiet",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  328  	[MSG_FUNCNAME_RATE_DEC] =3D "rate decrement",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  329  	[MSG_FUNCNAME_RATE_INC] =3D "rate increment",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  330  	[MSG_FUNCNAME_READING_PUNC_DEC] =3D "reading punctuation decre=
ment",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  331  	[MSG_FUNCNAME_READING_PUNC_INC] =3D "reading punctuation incre=
ment",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  332  	[MSG_FUNCNAME_SAY_ATTRIBUTES] =3D "say attributes",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  333  	[MSG_FUNCNAME_SAY_FROM_LEFT] =3D "say from left",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  334  	[MSG_FUNCNAME_SAY_FROM_TOP] =3D "say from top",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  335  	[MSG_FUNCNAME_SAY_POSITION] =3D "say position",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  336  	[MSG_FUNCNAME_SAY_SCREEN] =3D "say screen",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  337  	[MSG_FUNCNAME_SAY_TO_BOTTOM] =3D "say to bottom",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  338  	[MSG_FUNCNAME_SAY_TO_RIGHT] =3D "say to right",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  339  	[MSG_FUNCNAME_SPEAKUP] =3D "speakup",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  340  	[MSG_FUNCNAME_SPEAKUP_LOCK] =3D "speakup lock",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  341  	[MSG_FUNCNAME_SPEAKUP_OFF] =3D "speakup off",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  342  	[MSG_FUNCNAME_SPEECH_KILL] =3D "speech kill",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  343  	[MSG_FUNCNAME_SPELL_DELAY_DEC] =3D "spell delay decrement",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  344  	[MSG_FUNCNAME_SPELL_DELAY_INC] =3D "spell delay increment",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  345  	[MSG_FUNCNAME_SPELL_WORD] =3D "spell word",
979e0419329c02 drivers/staging/speakup/i18n.c       Colin Ian King    2018-=
11-28  346  	[MSG_FUNCNAME_SPELL_WORD_PHONETICALLY] =3D "spell word phoneti=
cally",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  347  	[MSG_FUNCNAME_TONE_DEC] =3D "tone decrement",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  348  	[MSG_FUNCNAME_TONE_INC] =3D "tone increment",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  349  	[MSG_FUNCNAME_VOICE_DEC] =3D "voice decrement",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  350  	[MSG_FUNCNAME_VOICE_INC] =3D "voice increment",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  351  	[MSG_FUNCNAME_VOLUME_DEC] =3D "volume decrement",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  352  	[MSG_FUNCNAME_VOLUME_INC] =3D "volume increment",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  353  	[MSG_FUNCNAME_WINDOW_CLEAR] =3D "window, clear",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  354  	[MSG_FUNCNAME_WINDOW_SAY] =3D "window, say",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  355  	[MSG_FUNCNAME_WINDOW_SET] =3D "window, set",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  356  	[MSG_FUNCNAME_WINDOW_SILENCE] =3D "window, silence",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  357  	[MSG_FUNCNAME_WORD_SAY_CURRENT] =3D "word, say current",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  358  	[MSG_FUNCNAME_WORD_SAY_NEXT] =3D "word, say next",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  359  	[MSG_FUNCNAME_WORD_SAY_PREVIOUS] =3D "word, say previous",
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  360  };
c6e3fd22cd5383 drivers/staging/speakup/i18n.c       William Hubbs     2010-=
10-07  361  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5710442569349943163==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
CNZ9HYse8vERDOX3/wMczOKWmlABAA==
--===============5710442569349943163==--

