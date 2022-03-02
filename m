Content-Type: multipart/mixed; boundary="===============6092232665354137839=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-lts:5.15/linux 336/2399] kernel/locking/test-ww_mutex.c:172 test_aa() warn: inconsistent returns '&mutex'.
Date: Wed, 02 Mar 2022 10:51:01 +0800
Message-ID: <202203020650.viWya6Lg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6092232665354137839==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: Junxiao Chang <junxiao.chang@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.15/linux
head:   3399541f3365b8b000f355489a6b05a32179cfe1
commit: 53956aadc1f3755f43e9a8d6741cb2b1d4c58ac6 [336/2399] kernel/locking:=
 Add context to ww_mutex_trylock()
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: parisc-randconfig-m031-20220301 (https://download.01.org/0day-ci/ar=
chive/20220302/202203020650.viWya6Lg-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/locking/test-ww_mutex.c:172 test_aa() warn: inconsistent returns '&m=
utex'.

vim +172 kernel/locking/test-ww_mutex.c

f2a5fec17395f25 Chris Wilson      2016-12-01  120  =

53956aadc1f3755 Maarten Lankhorst 2021-09-09  121  static int test_aa(bool =
trylock)
c22fb3807fd0a3b Chris Wilson      2016-12-01  122  {
c22fb3807fd0a3b Chris Wilson      2016-12-01  123  	struct ww_mutex mutex;
c22fb3807fd0a3b Chris Wilson      2016-12-01  124  	struct ww_acquire_ctx c=
tx;
c22fb3807fd0a3b Chris Wilson      2016-12-01  125  	int ret;
53956aadc1f3755 Maarten Lankhorst 2021-09-09  126  	const char *from =3D tr=
ylock ? "trylock" : "lock";
c22fb3807fd0a3b Chris Wilson      2016-12-01  127  =

c22fb3807fd0a3b Chris Wilson      2016-12-01  128  	ww_mutex_init(&mutex, &=
ww_class);
c22fb3807fd0a3b Chris Wilson      2016-12-01  129  	ww_acquire_init(&ctx, &=
ww_class);
c22fb3807fd0a3b Chris Wilson      2016-12-01  130  =

53956aadc1f3755 Maarten Lankhorst 2021-09-09  131  	if (!trylock) {
53956aadc1f3755 Maarten Lankhorst 2021-09-09  132  		ret =3D ww_mutex_lock(=
&mutex, &ctx);
53956aadc1f3755 Maarten Lankhorst 2021-09-09  133  		if (ret) {
53956aadc1f3755 Maarten Lankhorst 2021-09-09  134  			pr_err("%s: initial l=
ock failed!\n", __func__);
53956aadc1f3755 Maarten Lankhorst 2021-09-09  135  			goto out;
53956aadc1f3755 Maarten Lankhorst 2021-09-09  136  		}
53956aadc1f3755 Maarten Lankhorst 2021-09-09  137  	} else {
53956aadc1f3755 Maarten Lankhorst 2021-09-09  138  		if (!ww_mutex_trylock(=
&mutex, &ctx)) {
53956aadc1f3755 Maarten Lankhorst 2021-09-09  139  			pr_err("%s: initial t=
rylock failed!\n", __func__);
53956aadc1f3755 Maarten Lankhorst 2021-09-09  140  			goto out;
53956aadc1f3755 Maarten Lankhorst 2021-09-09  141  		}
53956aadc1f3755 Maarten Lankhorst 2021-09-09  142  	}
53956aadc1f3755 Maarten Lankhorst 2021-09-09  143  =

53956aadc1f3755 Maarten Lankhorst 2021-09-09  144  	if (ww_mutex_trylock(&m=
utex, NULL))  {
53956aadc1f3755 Maarten Lankhorst 2021-09-09  145  		pr_err("%s: trylocked =
itself without context from %s!\n", __func__, from);
53956aadc1f3755 Maarten Lankhorst 2021-09-09  146  		ww_mutex_unlock(&mutex=
);
53956aadc1f3755 Maarten Lankhorst 2021-09-09  147  		ret =3D -EINVAL;
53956aadc1f3755 Maarten Lankhorst 2021-09-09  148  		goto out;
53956aadc1f3755 Maarten Lankhorst 2021-09-09  149  	}
c22fb3807fd0a3b Chris Wilson      2016-12-01  150  =

53956aadc1f3755 Maarten Lankhorst 2021-09-09  151  	if (ww_mutex_trylock(&m=
utex, &ctx))  {
53956aadc1f3755 Maarten Lankhorst 2021-09-09  152  		pr_err("%s: trylocked =
itself with context from %s!\n", __func__, from);
c22fb3807fd0a3b Chris Wilson      2016-12-01  153  		ww_mutex_unlock(&mutex=
);
c22fb3807fd0a3b Chris Wilson      2016-12-01  154  		ret =3D -EINVAL;
c22fb3807fd0a3b Chris Wilson      2016-12-01  155  		goto out;
c22fb3807fd0a3b Chris Wilson      2016-12-01  156  	}
c22fb3807fd0a3b Chris Wilson      2016-12-01  157  =

c22fb3807fd0a3b Chris Wilson      2016-12-01  158  	ret =3D ww_mutex_lock(&=
mutex, &ctx);
c22fb3807fd0a3b Chris Wilson      2016-12-01  159  	if (ret !=3D -EALREADY)=
 {
53956aadc1f3755 Maarten Lankhorst 2021-09-09  160  		pr_err("%s: missed dea=
dlock for recursing, ret=3D%d from %s\n",
53956aadc1f3755 Maarten Lankhorst 2021-09-09  161  		       __func__, ret, =
from);
c22fb3807fd0a3b Chris Wilson      2016-12-01  162  		if (!ret)
c22fb3807fd0a3b Chris Wilson      2016-12-01  163  			ww_mutex_unlock(&mute=
x);
c22fb3807fd0a3b Chris Wilson      2016-12-01  164  		ret =3D -EINVAL;
c22fb3807fd0a3b Chris Wilson      2016-12-01  165  		goto out;
c22fb3807fd0a3b Chris Wilson      2016-12-01  166  	}
c22fb3807fd0a3b Chris Wilson      2016-12-01  167  =

53956aadc1f3755 Maarten Lankhorst 2021-09-09  168  	ww_mutex_unlock(&mutex);
c22fb3807fd0a3b Chris Wilson      2016-12-01  169  	ret =3D 0;
c22fb3807fd0a3b Chris Wilson      2016-12-01  170  out:
c22fb3807fd0a3b Chris Wilson      2016-12-01  171  	ww_acquire_fini(&ctx);
c22fb3807fd0a3b Chris Wilson      2016-12-01 @172  	return ret;
c22fb3807fd0a3b Chris Wilson      2016-12-01  173  }
c22fb3807fd0a3b Chris Wilson      2016-12-01  174  =


:::::: The code at line 172 was first introduced by commit
:::::: c22fb3807fd0a3bdd98c13c4d2190ab064e6c09d locking/ww_mutex: Add kself=
tests for ww_mutex AA deadlock detection

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Ingo Molnar <mingo@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6092232665354137839==--

