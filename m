Content-Type: multipart/mixed; boundary="===============0446473371341174401=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/clk/qcom/clk-smd-rpm.c:287:40: warning: Same expression in both branches of ternary operator. [duplicateExpressionTernary]
Date: Mon, 24 May 2021 22:55:19 +0800
Message-ID: <202105242214.IuHNLz4O-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0446473371341174401==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Julian Braha <julianbraha@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Julian,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c4681547bcce777daf576925a966ffa824edd09d
commit: 7d37cb2c912dc5c25ffac784a4f9b98c06c6bd08 lib: fix kconfig dependenc=
y on ARCH_WANT_FRAME_POINTERS
date:   6 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 6 weeks ago
compiler: csky-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/clk/qcom/clk-smd-rpm.c:287:40: warning: Same expression in both =
branches of ternary operator. [duplicateExpressionTernary]
    active_rate =3D r->branch ? !!peer_rate : peer_rate;
                                          ^
   drivers/clk/qcom/clk-smd-rpm.c:292:45: warning: Same expression in both =
branches of ternary operator. [duplicateExpressionTernary]
    sleep_rate =3D r->branch ? !!peer_sleep_rate : peer_sleep_rate;
                                               ^

vim +287 drivers/clk/qcom/clk-smd-rpm.c

00f64b58874e14 Georgi Djakov 2016-11-02  268  =

00f64b58874e14 Georgi Djakov 2016-11-02  269  static void clk_smd_rpm_unpre=
pare(struct clk_hw *hw)
00f64b58874e14 Georgi Djakov 2016-11-02  270  {
00f64b58874e14 Georgi Djakov 2016-11-02  271  	struct clk_smd_rpm *r =3D to=
_clk_smd_rpm(hw);
00f64b58874e14 Georgi Djakov 2016-11-02  272  	struct clk_smd_rpm *peer =3D=
 r->peer;
00f64b58874e14 Georgi Djakov 2016-11-02  273  	unsigned long peer_rate =3D =
0, peer_sleep_rate =3D 0;
00f64b58874e14 Georgi Djakov 2016-11-02  274  	unsigned long active_rate, s=
leep_rate;
00f64b58874e14 Georgi Djakov 2016-11-02  275  	int ret;
00f64b58874e14 Georgi Djakov 2016-11-02  276  =

00f64b58874e14 Georgi Djakov 2016-11-02  277  	mutex_lock(&rpm_smd_clk_lock=
);
00f64b58874e14 Georgi Djakov 2016-11-02  278  =

00f64b58874e14 Georgi Djakov 2016-11-02  279  	if (!r->rate)
00f64b58874e14 Georgi Djakov 2016-11-02  280  		goto out;
00f64b58874e14 Georgi Djakov 2016-11-02  281  =

00f64b58874e14 Georgi Djakov 2016-11-02  282  	/* Take peer clock's rate in=
to account only if it's enabled. */
00f64b58874e14 Georgi Djakov 2016-11-02  283  	if (peer->enabled)
00f64b58874e14 Georgi Djakov 2016-11-02  284  		to_active_sleep(peer, peer-=
>rate, &peer_rate,
00f64b58874e14 Georgi Djakov 2016-11-02  285  				&peer_sleep_rate);
00f64b58874e14 Georgi Djakov 2016-11-02  286  =

00f64b58874e14 Georgi Djakov 2016-11-02 @287  	active_rate =3D r->branch ? =
!!peer_rate : peer_rate;
00f64b58874e14 Georgi Djakov 2016-11-02  288  	ret =3D clk_smd_rpm_set_rate=
_active(r, active_rate);
00f64b58874e14 Georgi Djakov 2016-11-02  289  	if (ret)
00f64b58874e14 Georgi Djakov 2016-11-02  290  		goto out;
00f64b58874e14 Georgi Djakov 2016-11-02  291  =

00f64b58874e14 Georgi Djakov 2016-11-02  292  	sleep_rate =3D r->branch ? !=
!peer_sleep_rate : peer_sleep_rate;
00f64b58874e14 Georgi Djakov 2016-11-02  293  	ret =3D clk_smd_rpm_set_rate=
_sleep(r, sleep_rate);
00f64b58874e14 Georgi Djakov 2016-11-02  294  	if (ret)
00f64b58874e14 Georgi Djakov 2016-11-02  295  		goto out;
00f64b58874e14 Georgi Djakov 2016-11-02  296  =

00f64b58874e14 Georgi Djakov 2016-11-02  297  	r->enabled =3D false;
00f64b58874e14 Georgi Djakov 2016-11-02  298  =

00f64b58874e14 Georgi Djakov 2016-11-02  299  out:
00f64b58874e14 Georgi Djakov 2016-11-02  300  	mutex_unlock(&rpm_smd_clk_lo=
ck);
00f64b58874e14 Georgi Djakov 2016-11-02  301  }
00f64b58874e14 Georgi Djakov 2016-11-02  302  =


:::::: The code at line 287 was first introduced by commit
:::::: 00f64b58874e14dec2b9c02f7d63147315e0a09b clk: qcom: Add support for =
SMD-RPM Clocks

:::::: TO: Georgi Djakov <georgi.djakov@linaro.org>
:::::: CC: Stephen Boyd <sboyd@codeaurora.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0446473371341174401==--

