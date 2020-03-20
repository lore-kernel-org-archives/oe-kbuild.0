Content-Type: multipart/mixed; boundary="===============2494713585433666260=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] xfrm: policy: Fix doulbe free in xfrm_policy_timer
Date: Fri, 20 Mar 2020 15:37:39 +0300
Message-ID: <20200320123739.GE4650@kadam>
In-Reply-To: <20200318034839.57996-1-yuehaibing@huawei.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2494713585433666260==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi YueHaibing,

Thank you for the patch! Perhaps something to improve:

url:    https://github.com/0day-ci/linux/commits/YueHaibing/xfrm-policy-Fix=
-doulbe-free-in-xfrm_policy_timer/20200318-130228
base:   https://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec-next=
.git master

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/xfrm/xfrm_policy.c:449 xfrm_policy_kill() error: double locked 'policy-=
>lock' (orig line 437)

# https://github.com/0day-ci/linux/commit/c5e76419bf56de53360e5d79e2708fd0e=
ed0cf38
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout c5e76419bf56de53360e5d79e2708fd0eed0cf38
vim +449 net/xfrm/xfrm_policy.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  435  static void xfrm_policy_=
kill(struct xfrm_policy *policy)
^1da177e4c3f41 Linus Torvalds     2005-04-16  436  {
c5e76419bf56de YueHaibing         2020-03-18 @437  	write_lock_bh(&policy->=
lock);
12a169e7d8f4b1 Herbert Xu         2008-10-01  438  	policy->walk.dead =3D 1;
^1da177e4c3f41 Linus Torvalds     2005-04-16  439  =

285ead175c5dd5 Timo Ter=C3=A4s         2010-04-07  440  	atomic_inc(&policy=
->genid);
^1da177e4c3f41 Linus Torvalds     2005-04-16  441  =

e7d8f6cb2f8735 Steffen Klassert   2013-10-08  442  	if (del_timer(&policy->=
polq.hold_timer))
e7d8f6cb2f8735 Steffen Klassert   2013-10-08  443  		xfrm_pol_put(policy);
1ee5e6676bccbf Li RongQing        2015-04-22  444  	skb_queue_purge(&policy=
->polq.hold_queue);
a0073fe18e718a Steffen Klassert   2013-02-05  445  =

285ead175c5dd5 Timo Ter=C3=A4s         2010-04-07  446  	if (del_timer(&pol=
icy->timer))
285ead175c5dd5 Timo Ter=C3=A4s         2010-04-07  447  		xfrm_pol_put(poli=
cy);
285ead175c5dd5 Timo Ter=C3=A4s         2010-04-07  448  =

c5e76419bf56de YueHaibing         2020-03-18 @449  	write_lock_bh(&policy->=
lock);

s/lock/unlock/

285ead175c5dd5 Timo Ter=C3=A4s         2010-04-07  450  	xfrm_pol_put(polic=
y);
^1da177e4c3f41 Linus Torvalds     2005-04-16  451  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2494713585433666260==--

