Content-Type: multipart/mixed; boundary="===============3992640698032035994=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [f2fs-stable:linux-4.19.y 303/666] fs/unicode/utf8-selftest.c:190:3: warning: Conversion of string literal "" to bool always evaluates to true.
Date: Sun, 13 Sep 2020 12:05:01 +0800
Message-ID: <202009131256.B6DtIBzb%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3992640698032035994==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Jaegeuk Kim <jaegeuk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-stable=
.git linux-4.19.y
head:   e1712134c01acfde2d20aea490ad3b3581ec8e0a
commit: 56427c9cf549342906953cfd1d180d014b78c97b [303/666] unicode: introdu=
ce test module for normalized utf8 implementation
:::::: branch date: 3 days ago
:::::: commit date: 12 months ago
compiler: alpha-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> fs/unicode/utf8-selftest.c:190:3: warning: Conversion of string literal =
"" to bool always evaluates to true. [incorrectStringBooleanError]
     test((utf8len(data, nfdi_test_data[i].str) =3D=3D nlen));
     ^
   fs/unicode/utf8-selftest.c:191:3: warning: Conversion of string literal =
"" to bool always evaluates to true. [incorrectStringBooleanError]
     test((utf8nlen(data, nfdi_test_data[i].str, len) =3D=3D nlen));
     ^
   fs/unicode/utf8-selftest.c:197:4: warning: Conversion of string literal =
"Unexpected byte 0x%x should be 0x%xn" to bool always evaluates to true. [i=
ncorrectStringBooleanError]
      test_f((c =3D=3D nfdi_test_data[i].dec[j]),
      ^
   fs/unicode/utf8-selftest.c:203:3: warning: Conversion of string literal =
"" to bool always evaluates to true. [incorrectStringBooleanError]
     test((j =3D=3D nlen));
     ^
   fs/unicode/utf8-selftest.c:226:3: warning: Conversion of string literal =
"" to bool always evaluates to true. [incorrectStringBooleanError]
     test((utf8len(data, nfdicf_test_data[i].str) =3D=3D nlen));
     ^
   fs/unicode/utf8-selftest.c:227:3: warning: Conversion of string literal =
"" to bool always evaluates to true. [incorrectStringBooleanError]
     test((utf8nlen(data, nfdicf_test_data[i].str, len) =3D=3D nlen));
     ^
   fs/unicode/utf8-selftest.c:233:4: warning: Conversion of string literal =
"Unexpected byte 0x%x should be 0x%xn" to bool always evaluates to true. [i=
ncorrectStringBooleanError]
      test_f((c =3D=3D nfdicf_test_data[i].ncf[j]),
      ^
   fs/unicode/utf8-selftest.c:239:3: warning: Conversion of string literal =
"" to bool always evaluates to true. [incorrectStringBooleanError]
     test((j =3D=3D nlen));
     ^
   fs/unicode/utf8-selftest.c:260:3: warning: Conversion of string literal =
"%s %s comparison mismatchn" to bool always evaluates to true. [incorrectSt=
ringBooleanError]
     test_f(!utf8_strncmp(table, &s1, &s2),
     ^
   fs/unicode/utf8-selftest.c:270:3: warning: Conversion of string literal =
"%s %s comparison mismatchn" to bool always evaluates to true. [incorrectSt=
ringBooleanError]
     test_f(!utf8_strncasecmp(table, &s1, &s2),
     ^
   fs/unicode/utf8-selftest.c:280:2: warning: Conversion of string literal =
"" to bool always evaluates to true. [incorrectStringBooleanError]
    test(utf8version_is_supported(7, 0, 0));
    ^
   fs/unicode/utf8-selftest.c:283:2: warning: Conversion of string literal =
"" to bool always evaluates to true. [incorrectStringBooleanError]
    test(utf8version_is_supported(9, 0, 0));
    ^
   fs/unicode/utf8-selftest.c:286:2: warning: Conversion of string literal =
"" to bool always evaluates to true. [incorrectStringBooleanError]
    test(utf8version_is_supported(latest_maj, latest_min, latest_rev));
    ^
   fs/unicode/utf8-selftest.c:289:2: warning: Conversion of string literal =
"" to bool always evaluates to true. [incorrectStringBooleanError]
    test(!utf8version_is_supported(12, 0, 0));
    ^
   fs/unicode/utf8-selftest.c:290:2: warning: Conversion of string literal =
"" to bool always evaluates to true. [incorrectStringBooleanError]
    test(!utf8version_is_supported(0, 0, 0));
    ^
   fs/unicode/utf8-selftest.c:291:2: warning: Conversion of string literal =
"" to bool always evaluates to true. [incorrectStringBooleanError]
    test(!utf8version_is_supported(-1, -1, -1));
    ^

# https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-stable.git/c=
ommit/?id=3D56427c9cf549342906953cfd1d180d014b78c97b
git remote add f2fs-stable https://git.kernel.org/pub/scm/linux/kernel/git/=
jaegeuk/f2fs-stable.git
git fetch --no-tags f2fs-stable linux-4.19.y
git checkout 56427c9cf549342906953cfd1d180d014b78c97b
vim +190 fs/unicode/utf8-selftest.c

56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  170  =

56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  171  static void check_u=
tf8_nfdi(void)
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  172  {
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  173  	int i;
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  174  	struct utf8cursor =
u8c;
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  175  	const struct utf8d=
ata *data;
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  176  =

56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  177  	data =3D utf8nfdi(=
UNICODE_AGE(latest_maj, latest_min, latest_rev));
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  178  	if (!data) {
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  179  		pr_err("%s: Unabl=
e to load utf8-%d.%d.%d. Skipping.\n",
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  180  		       __func__, =
latest_maj, latest_min, latest_rev);
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  181  		return;
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  182  	}
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  183  =

56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  184  	for (i =3D 0; i < =
ARRAY_SIZE(nfdi_test_data); i++) {
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  185  		int len =3D strle=
n(nfdi_test_data[i].str);
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  186  		int nlen =3D strl=
en(nfdi_test_data[i].dec);
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  187  		int j =3D 0;
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  188  		unsigned char c;
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  189  =

56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25 @190  		test((utf8len(dat=
a, nfdi_test_data[i].str) =3D=3D nlen));
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  191  		test((utf8nlen(da=
ta, nfdi_test_data[i].str, len) =3D=3D nlen));
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  192  =

56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  193  		if (utf8cursor(&u=
8c, data, nfdi_test_data[i].str) < 0)
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  194  			pr_err("can't cr=
eate cursor\n");
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  195  =

56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  196  		while ((c =3D utf=
8byte(&u8c)) > 0) {
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25 @197  			test_f((c =3D=3D=
 nfdi_test_data[i].dec[j]),
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  198  			       "Unexpect=
ed byte 0x%x should be 0x%x\n",
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  199  			       c, nfdi_t=
est_data[i].dec[j]);
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  200  			j++;
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  201  		}
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  202  =

56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  203  		test((j =3D=3D nl=
en));
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  204  	}
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  205  }
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  206  =

56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  207  static void check_u=
tf8_nfdicf(void)
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  208  {
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  209  	int i;
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  210  	struct utf8cursor =
u8c;
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  211  	const struct utf8d=
ata *data;
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  212  =

56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  213  	data =3D utf8nfdic=
f(UNICODE_AGE(latest_maj, latest_min, latest_rev));
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  214  	if (!data) {
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  215  		pr_err("%s: Unabl=
e to load utf8-%d.%d.%d. Skipping.\n",
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  216  		       __func__, =
latest_maj, latest_min, latest_rev);
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  217  		return;
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  218  	}
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  219  =

56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  220  	for (i =3D 0; i < =
ARRAY_SIZE(nfdicf_test_data); i++) {
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  221  		int len =3D strle=
n(nfdicf_test_data[i].str);
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  222  		int nlen =3D strl=
en(nfdicf_test_data[i].ncf);
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  223  		int j =3D 0;
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  224  		unsigned char c;
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  225  =

56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  226  		test((utf8len(dat=
a, nfdicf_test_data[i].str) =3D=3D nlen));
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  227  		test((utf8nlen(da=
ta, nfdicf_test_data[i].str, len) =3D=3D nlen));
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  228  =

56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  229  		if (utf8cursor(&u=
8c, data, nfdicf_test_data[i].str) < 0)
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  230  			pr_err("can't cr=
eate cursor\n");
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  231  =

56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  232  		while ((c =3D utf=
8byte(&u8c)) > 0) {
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  233  			test_f((c =3D=3D=
 nfdicf_test_data[i].ncf[j]),
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  234  			       "Unexpect=
ed byte 0x%x should be 0x%x\n",
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  235  			       c, nfdicf=
_test_data[i].ncf[j]);
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  236  			j++;
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  237  		}
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  238  =

56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  239  		test((j =3D=3D nl=
en));
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  240  	}
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  241  }
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  242  =

56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  243  static void check_u=
tf8_comparisons(void)
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  244  {
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  245  	int i;
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  246  	struct unicode_map=
 *table =3D utf8_load("11.0.0");
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  247  =

56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  248  	if (IS_ERR(table))=
 {
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  249  		pr_err("%s: Unabl=
e to load utf8 %d.%d.%d. Skipping.\n",
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  250  		       __func__, =
latest_maj, latest_min, latest_rev);
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  251  		return;
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  252  	}
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  253  =

56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  254  	for (i =3D 0; i < =
ARRAY_SIZE(nfdi_test_data); i++) {
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  255  		const struct qstr=
 s1 =3D {.name =3D nfdi_test_data[i].str,
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  256  					.len =3D sizeo=
f(nfdi_test_data[i].str)};
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  257  		const struct qstr=
 s2 =3D {.name =3D nfdi_test_data[i].dec,
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  258  					.len =3D sizeo=
f(nfdi_test_data[i].dec)};
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  259  =

56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25 @260  		test_f(!utf8_strn=
cmp(table, &s1, &s2),
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  261  		       "%s %s com=
parison mismatch\n", s1.name, s2.name);
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  262  	}
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  263  =

56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  264  	for (i =3D 0; i < =
ARRAY_SIZE(nfdicf_test_data); i++) {
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  265  		const struct qstr=
 s1 =3D {.name =3D nfdicf_test_data[i].str,
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  266  					.len =3D sizeo=
f(nfdicf_test_data[i].str)};
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  267  		const struct qstr=
 s2 =3D {.name =3D nfdicf_test_data[i].ncf,
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  268  					.len =3D sizeo=
f(nfdicf_test_data[i].ncf)};
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  269  =

56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  270  		test_f(!utf8_strn=
casecmp(table, &s1, &s2),
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  271  		       "%s %s com=
parison mismatch\n", s1.name, s2.name);
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  272  	}
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  273  =

56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  274  	utf8_unload(table);
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  275  }
56427c9cf54934 Gabriel Krisman Bertazi 2019-04-25  276  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============3992640698032035994==--

