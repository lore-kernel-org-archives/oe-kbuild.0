Content-Type: multipart/mixed; boundary="===============9130703103684670658=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [zen-kernel-zen-kernel:5.12/futex2 1/7] kernel/futex2.c:434:23: warning: Unused variable: waiter [unusedVariable]
Date: Thu, 29 Apr 2021 06:49:00 +0800
Message-ID: <202104290653.8CeAa6OJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9130703103684670658==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: steven(a)liquorix.net

tree:   https://github.com/zen-kernel/zen-kernel 5.12/futex2
head:   f24c1ade4967d4bb131e56bc344ac43ad8a6ca66
commit: 83f6018faa64933582396f3ef3081c3e75e69b72 [1/7] futex2: Implement wa=
it and wake functions
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
compiler: h8300-linux-gcc (GCC) 9.3.0

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

83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  429  =

83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  430  static long ksys_futex_w=
ait(void __user *uaddr, u64 val, unsigned int flags,
83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  431  			    struct __kernel_t=
imespec __user *timo)
83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  432  {
83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  433  	unsigned int size =3D f=
lags & FUTEX_SIZE_MASK;
83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27 @434  	struct futex_waiter *wa=
iter;
83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27 @435  	struct futex_waiter_hea=
d *futexv;
83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  436  =

83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  437  	/* Wrapper for a futexv=
_waiter_head with one element */
83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  438  	struct {
83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  439  		struct futex_waiter_he=
ad futexv;
83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  440  		struct futex_waiter wa=
iter;
83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  441  	} __packed wait_single;
83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  442  =

83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  443  	if (flags & ~FUTEX2_MAS=
K)
83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  444  		return -EINVAL;
83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  445  =

83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  446  	if (size !=3D FUTEX_32)
83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  447  		return -EINVAL;
83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  448  =

83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  449  	futexv =3D &wait_single=
.futexv;
83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  450  	futexv->task =3D curren=
t;
83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  451  	futexv->hint =3D false;
83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  452  =

83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  453  	waiter =3D &wait_single=
.waiter;
83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  454  	waiter->index =3D 0;
83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  455  	waiter->val =3D val;
83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  456  	waiter->uaddr =3D uaddr;
83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  457  	memset(&wait_single.wai=
ter.key, 0, sizeof(struct futex_key));
83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  458  =

83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  459  	INIT_LIST_HEAD(&waiter-=
>list);
83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  460  =

83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  461  	/* Get an unlocked hash=
 bucket */
83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  462  	waiter->bucket =3D fute=
x_get_bucket(uaddr, &waiter->key);
83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  463  	if (IS_ERR(waiter->buck=
et))
83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  464  		return PTR_ERR(waiter-=
>bucket);
83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  465  =

83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  466  	return __futex_waitv(fu=
texv, 1, timo, flags);
83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  467  }
83f6018faa6493 Andr=C3=A9 Almeida 2021-04-27  468  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============9130703103684670658==--

