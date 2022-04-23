Content-Type: multipart/mixed; boundary="===============7096323914240544918=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kees:for-next/lkdtm 6/6] drivers/misc/lkdtm/cfi.c:100:21: warning: syntax error [syntaxError]
Date: Sun, 24 Apr 2022 01:40:24 +0800
Message-ID: <202204240126.3vzHg3cy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7096323914240544918==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: Dan Li <ashimida@linux.alibaba.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-=
next/lkdtm
head:   2e53b877dc1258d4ac3de98f496bb88ec3bf5e25
commit: 2e53b877dc1258d4ac3de98f496bb88ec3bf5e25 [6/6] lkdtm: Add CFI_BACKW=
ARD to test ROP mitigations
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
compiler: arc-elf-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 2e53b877dc1258d4ac3de98f496bb88ec3bf5e25
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/misc/lkdtm/cfi.c:100:21: warning: syntax error [syntaxError]
    void *labels[] =3D {0, &&normal, &&redirected, &&check_normal, &&check_=
redirected};
                       ^

vim +100 drivers/misc/lkdtm/cfi.c

2e53b877dc1258 Kees Cook 2022-03-11   96  =

2e53b877dc1258 Kees Cook 2022-03-11   97  static void lkdtm_CFI_BACKWARD(vo=
id)
2e53b877dc1258 Kees Cook 2022-03-11   98  {
2e53b877dc1258 Kees Cook 2022-03-11   99  	/* Use calculated gotos to keep =
labels addressable. */
2e53b877dc1258 Kees Cook 2022-03-11 @100  	void *labels[] =3D {0, &&normal,=
 &&redirected, &&check_normal, &&check_redirected};
2e53b877dc1258 Kees Cook 2022-03-11  101  =

2e53b877dc1258 Kees Cook 2022-03-11  102  	pr_info("Attempting unchecked st=
ack return address redirection ...\n");
2e53b877dc1258 Kees Cook 2022-03-11  103  =

2e53b877dc1258 Kees Cook 2022-03-11  104  	/* Always false */
2e53b877dc1258 Kees Cook 2022-03-11  105  	if (force_check) {
2e53b877dc1258 Kees Cook 2022-03-11  106  		/*
2e53b877dc1258 Kees Cook 2022-03-11  107  		 * Prepare to call with NULLs t=
o avoid parameters being treated as
2e53b877dc1258 Kees Cook 2022-03-11  108  		 * constants in -02.
2e53b877dc1258 Kees Cook 2022-03-11  109  		 */
2e53b877dc1258 Kees Cook 2022-03-11  110  		set_return_addr_unchecked(NULL,=
 NULL);
2e53b877dc1258 Kees Cook 2022-03-11  111  		set_return_addr(NULL, NULL);
2e53b877dc1258 Kees Cook 2022-03-11  112  		if (force_check)
2e53b877dc1258 Kees Cook 2022-03-11  113  			goto *labels[1];
2e53b877dc1258 Kees Cook 2022-03-11  114  		if (force_check)
2e53b877dc1258 Kees Cook 2022-03-11  115  			goto *labels[2];
2e53b877dc1258 Kees Cook 2022-03-11  116  		if (force_check)
2e53b877dc1258 Kees Cook 2022-03-11  117  			goto *labels[3];
2e53b877dc1258 Kees Cook 2022-03-11  118  		if (force_check)
2e53b877dc1258 Kees Cook 2022-03-11  119  			goto *labels[4];
2e53b877dc1258 Kees Cook 2022-03-11  120  		return;
2e53b877dc1258 Kees Cook 2022-03-11  121  	}
2e53b877dc1258 Kees Cook 2022-03-11  122  =

2e53b877dc1258 Kees Cook 2022-03-11  123  	/*
2e53b877dc1258 Kees Cook 2022-03-11  124  	 * Use fallthrough switch case t=
o keep basic block ordering between
2e53b877dc1258 Kees Cook 2022-03-11  125  	 * set_return_addr*() and the la=
bel after it.
2e53b877dc1258 Kees Cook 2022-03-11  126  	 */
2e53b877dc1258 Kees Cook 2022-03-11  127  	switch (force_check) {
2e53b877dc1258 Kees Cook 2022-03-11  128  	case 0:
2e53b877dc1258 Kees Cook 2022-03-11  129  		set_return_addr_unchecked(&&nor=
mal, &&redirected);
2e53b877dc1258 Kees Cook 2022-03-11  130  		fallthrough;
2e53b877dc1258 Kees Cook 2022-03-11  131  	case 1:
2e53b877dc1258 Kees Cook 2022-03-11  132  normal:
2e53b877dc1258 Kees Cook 2022-03-11  133  		/* Always true */
2e53b877dc1258 Kees Cook 2022-03-11  134  		if (!force_check) {
2e53b877dc1258 Kees Cook 2022-03-11  135  			pr_err("FAIL: stack return add=
ress manipulation failed!\n");
2e53b877dc1258 Kees Cook 2022-03-11  136  			/* If we can't redirect "norma=
lly", we can't test mitigations. */
2e53b877dc1258 Kees Cook 2022-03-11  137  			return;
2e53b877dc1258 Kees Cook 2022-03-11  138  		}
2e53b877dc1258 Kees Cook 2022-03-11  139  		break;
2e53b877dc1258 Kees Cook 2022-03-11  140  	default:
2e53b877dc1258 Kees Cook 2022-03-11  141  redirected:
2e53b877dc1258 Kees Cook 2022-03-11  142  		pr_info("ok: redirected stack r=
eturn address.\n");
2e53b877dc1258 Kees Cook 2022-03-11  143  		break;
2e53b877dc1258 Kees Cook 2022-03-11  144  	}
2e53b877dc1258 Kees Cook 2022-03-11  145  =

2e53b877dc1258 Kees Cook 2022-03-11  146  	pr_info("Attempting checked stac=
k return address redirection ...\n");
2e53b877dc1258 Kees Cook 2022-03-11  147  =

2e53b877dc1258 Kees Cook 2022-03-11  148  	switch (force_check) {
2e53b877dc1258 Kees Cook 2022-03-11  149  	case 0:
2e53b877dc1258 Kees Cook 2022-03-11  150  		set_return_addr(&&check_normal,=
 &&check_redirected);
2e53b877dc1258 Kees Cook 2022-03-11  151  		fallthrough;
2e53b877dc1258 Kees Cook 2022-03-11  152  	case 1:
2e53b877dc1258 Kees Cook 2022-03-11  153  check_normal:
2e53b877dc1258 Kees Cook 2022-03-11  154  		/* Always true */
2e53b877dc1258 Kees Cook 2022-03-11  155  		if (!force_check) {
2e53b877dc1258 Kees Cook 2022-03-11  156  			pr_info("ok: control flow unch=
anged.\n");
2e53b877dc1258 Kees Cook 2022-03-11  157  			return;
2e53b877dc1258 Kees Cook 2022-03-11  158  		}
2e53b877dc1258 Kees Cook 2022-03-11  159  =

2e53b877dc1258 Kees Cook 2022-03-11  160  check_redirected:
2e53b877dc1258 Kees Cook 2022-03-11  161  		pr_err("FAIL: stack return addr=
ess was redirected!\n");
2e53b877dc1258 Kees Cook 2022-03-11  162  		break;
2e53b877dc1258 Kees Cook 2022-03-11  163  	}
2e53b877dc1258 Kees Cook 2022-03-11  164  =

2e53b877dc1258 Kees Cook 2022-03-11  165  	if (IS_ENABLED(CONFIG_ARM64_PTR_=
AUTH_KERNEL)) {
2e53b877dc1258 Kees Cook 2022-03-11  166  		pr_expected_config(CONFIG_ARM64=
_PTR_AUTH_KERNEL);
2e53b877dc1258 Kees Cook 2022-03-11  167  		return;
2e53b877dc1258 Kees Cook 2022-03-11  168  	}
2e53b877dc1258 Kees Cook 2022-03-11  169  	if (IS_ENABLED(CONFIG_SHADOW_CAL=
L_STACK)) {
2e53b877dc1258 Kees Cook 2022-03-11  170  		pr_expected_config(CONFIG_SHADO=
W_CALL_STACK);
2e53b877dc1258 Kees Cook 2022-03-11  171  		return;
2e53b877dc1258 Kees Cook 2022-03-11  172  	}
2e53b877dc1258 Kees Cook 2022-03-11  173  	pr_warn("This is probably expect=
ed, since this %s was built *without* %s=3Dy nor %s=3Dy\n",
2e53b877dc1258 Kees Cook 2022-03-11  174  		lkdtm_kernel_info,
2e53b877dc1258 Kees Cook 2022-03-11  175  		"CONFIG_ARM64_PTR_AUTH_KERNEL",=
 "CONFIG_SHADOW_CALL_STACK");
2e53b877dc1258 Kees Cook 2022-03-11  176  }
2e53b877dc1258 Kees Cook 2022-03-11  177  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7096323914240544918==--

