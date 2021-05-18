Content-Type: multipart/mixed; boundary="===============8767471980337236040=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [zen-kernel-zen-kernel:5.12/futex2 1/15] kernel/futex2.c:434:23: warning: Unused variable: waiter [unusedVariable]
Date: Wed, 19 May 2021 00:22:41 +0800
Message-ID: <202105190033.QC6pkheR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8767471980337236040==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: steven(a)liquorix.net

tree:   https://github.com/zen-kernel/zen-kernel 5.12/futex2
head:   a9442359954c51f77fa365e8d15b7950c6aeb55b
commit: 64cdae0a6364c651f13a9ba90f6a8fadd7e1b9f7 [1/15] futex2: Implement w=
ait and wake functions
:::::: branch date: 4 hours ago
:::::: commit date: 2 weeks ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> kernel/futex2.c:434:23: warning: Unused variable: waiter [unusedVariable]
    struct futex_waiter *waiter;
                         ^
>> kernel/futex2.c:435:28: warning: Unused variable: futexv [unusedVariable]
    struct futex_waiter_head *futexv;
                              ^

vim +434 kernel/futex2.c

64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  429  =

64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  430  static long ksys_futex_w=
ait(void __user *uaddr, unsigned int val, unsigned int flags,
64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  431  			    struct __kernel_t=
imespec __user *timo)
64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  432  {
64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  433  	unsigned int size =3D f=
lags & FUTEX_SIZE_MASK;
64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05 @434  	struct futex_waiter *wa=
iter;
64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05 @435  	struct futex_waiter_hea=
d *futexv;
64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  436  =

64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  437  	/* Wrapper for a futexv=
_waiter_head with one element */
64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  438  	struct {
64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  439  		struct futex_waiter_he=
ad futexv;
64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  440  		struct futex_waiter wa=
iter;
64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  441  	} __packed wait_single;
64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  442  =

64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  443  	if (flags & ~FUTEX2_MAS=
K)
64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  444  		return -EINVAL;
64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  445  =

64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  446  	if (size !=3D FUTEX_32)
64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  447  		return -EINVAL;
64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  448  =

64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  449  	futexv =3D &wait_single=
.futexv;
64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  450  	futexv->task =3D curren=
t;
64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  451  	futexv->hint =3D false;
64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  452  =

64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  453  	waiter =3D &wait_single=
.waiter;
64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  454  	waiter->index =3D 0;
64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  455  	waiter->val =3D val;
64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  456  	waiter->uaddr =3D uaddr;
64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  457  	memset(&wait_single.wai=
ter.key, 0, sizeof(struct futex_key));
64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  458  =

64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  459  	INIT_LIST_HEAD(&waiter-=
>list);
64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  460  =

64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  461  	/* Get an unlocked hash=
 bucket */
64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  462  	waiter->bucket =3D fute=
x_get_bucket(uaddr, &waiter->key);
64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  463  	if (IS_ERR(waiter->buck=
et))
64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  464  		return PTR_ERR(waiter-=
>bucket);
64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  465  =

64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  466  	return __futex_waitv(fu=
texv, 1, timo, flags);
64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  467  }
64cdae0a6364c6 Andr=C3=A9 Almeida 2021-02-05  468  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8767471980337236040==--

