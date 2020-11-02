Content-Type: multipart/mixed; boundary="===============8263520878608288005=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jirislaby:devel 12/48] drivers/tty/vt/keyboard.c:2055 vt_do_kdgkb_ioctl() warn: possible info leak 'kbs'
Date: Mon, 02 Nov 2020 21:57:13 +0800
Message-ID: <202011022105.RqLPGHio-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8263520878608288005==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Jiri Slaby <jslaby@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git=
 devel
head:   3e1b1373e00a69094c88c52c94632bf76b44b6c7
commit: caf4aeff5e949526e96ea8511ac636d9f6630f72 [12/48] vt: keyboard, reor=
der user buffer handling in vt_do_kdgkb_ioctl
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: x86_64-randconfig-m001-20201102 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/tty/vt/keyboard.c:2055 vt_do_kdgkb_ioctl() warn: possible info leak=
 'kbs'

Old smatch warnings:
drivers/tty/vt/keyboard.c:2081 vt_do_kdgkb_ioctl() warn: potential spectre =
issue 'func_table' [r] (local cap)
drivers/tty/vt/keyboard.c:2090 vt_do_kdgkb_ioctl() warn: possible spectre s=
econd half.  'fj'
drivers/tty/vt/keyboard.c:2096 vt_do_kdgkb_ioctl() warn: possible spectre s=
econd half.  'fj'
drivers/tty/vt/keyboard.c:2115 vt_do_kdgkb_ioctl() warn: possible spectre s=
econd half.  'fj'
drivers/tty/vt/keyboard.c:2117 vt_do_kdgkb_ioctl() warn: possible spectre s=
econd half.  'fj'
drivers/tty/vt/keyboard.c:2143 vt_do_kdgkb_ioctl() error: uninitialized sym=
bol 'kbs'.

vim +/kbs +2055 drivers/tty/vt/keyboard.c

079c9534a96da9a Alan Cox           2012-02-28  2020  =

82e61c3909db51d Jiri Slaby         2020-10-19  2021  /* FIXME: This one nee=
ds untangling */
079c9534a96da9a Alan Cox           2012-02-28  2022  int vt_do_kdgkb_ioctl(=
int cmd, struct kbsentry __user *user_kdgkb, int perm)
079c9534a96da9a Alan Cox           2012-02-28  2023  {
caf4aeff5e94952 Jiri Slaby         2020-08-14  2024  	char *kbs;
079c9534a96da9a Alan Cox           2012-02-28  2025  	u_char *q;
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2026  	int sz, fnw_sz;
079c9534a96da9a Alan Cox           2012-02-28  2027  	int delta;
079c9534a96da9a Alan Cox           2012-02-28  2028  	char *first_free, *fj=
, *fnw;
056f2f27df67dfa Jiri Slaby         2020-08-18  2029  	int j, k;
079c9534a96da9a Alan Cox           2012-02-28  2030  	int ret;
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2031  	unsigned long flags;
056f2f27df67dfa Jiri Slaby         2020-08-18  2032  	unsigned char kb_func;
079c9534a96da9a Alan Cox           2012-02-28  2033  =

079c9534a96da9a Alan Cox           2012-02-28  2034  	if (!capable(CAP_SYS_=
TTY_CONFIG))
079c9534a96da9a Alan Cox           2012-02-28  2035  		perm =3D 0;
079c9534a96da9a Alan Cox           2012-02-28  2036  =

caf4aeff5e94952 Jiri Slaby         2020-08-14  2037  	if (get_user(kb_func,=
 &user_kdgkb->kb_func))
caf4aeff5e94952 Jiri Slaby         2020-08-14  2038  		return -EFAULT;
079c9534a96da9a Alan Cox           2012-02-28  2039  =

caf4aeff5e94952 Jiri Slaby         2020-08-14  2040  	kb_func =3D array_ind=
ex_nospec(kb_func, MAX_NR_FUNC);
079c9534a96da9a Alan Cox           2012-02-28  2041  =

079c9534a96da9a Alan Cox           2012-02-28  2042  	switch (cmd) {
6ca03f90527e499 Jiri Slaby         2020-10-19  2043  	case KDGKBSENT: {
6ca03f90527e499 Jiri Slaby         2020-10-19  2044  		/* size should have =
been a struct member */
82e61c3909db51d Jiri Slaby         2020-10-19  2045  		ssize_t len =3D size=
of(user_kdgkb->kb_string);
82e61c3909db51d Jiri Slaby         2020-10-19  2046  =

caf4aeff5e94952 Jiri Slaby         2020-08-14  2047  		kbs =3D kmalloc(len,=
 GFP_KERNEL);
caf4aeff5e94952 Jiri Slaby         2020-08-14  2048  		if (!kbs)
caf4aeff5e94952 Jiri Slaby         2020-08-14  2049  			return -ENOMEM;
caf4aeff5e94952 Jiri Slaby         2020-08-14  2050  =

82e61c3909db51d Jiri Slaby         2020-10-19  2051  		spin_lock_irqsave(&f=
unc_buf_lock, flags);
caf4aeff5e94952 Jiri Slaby         2020-08-14  2052  		len =3D strlcpy(kbs,=
 func_table[kb_func] ? : "", len);
82e61c3909db51d Jiri Slaby         2020-10-19  2053  		spin_unlock_irqresto=
re(&func_buf_lock, flags);
6ca03f90527e499 Jiri Slaby         2020-10-19  2054  =

caf4aeff5e94952 Jiri Slaby         2020-08-14 @2055  		ret =3D copy_to_user=
(user_kdgkb->kb_string, kbs, len + 1) ?
caf4aeff5e94952 Jiri Slaby         2020-08-14  2056  			-EFAULT : 0;
6ca03f90527e499 Jiri Slaby         2020-10-19  2057  =

079c9534a96da9a Alan Cox           2012-02-28  2058  		goto reterr;
079c9534a96da9a Alan Cox           2012-02-28  2059  	}
079c9534a96da9a Alan Cox           2012-02-28  2060  	case KDSKBSENT:
caf4aeff5e94952 Jiri Slaby         2020-08-14  2061  		if (!perm)
caf4aeff5e94952 Jiri Slaby         2020-08-14  2062  			return -EPERM;
caf4aeff5e94952 Jiri Slaby         2020-08-14  2063  =

caf4aeff5e94952 Jiri Slaby         2020-08-14  2064  		kbs =3D strndup_user=
(user_kdgkb->kb_string,
caf4aeff5e94952 Jiri Slaby         2020-08-14  2065  				sizeof(user_kdgkb-=
>kb_string));
caf4aeff5e94952 Jiri Slaby         2020-08-14  2066  		if (IS_ERR(kbs))
caf4aeff5e94952 Jiri Slaby         2020-08-14  2067  			return PTR_ERR(kbs);
079c9534a96da9a Alan Cox           2012-02-28  2068  =

46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2069  		fnw =3D NULL;
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2070  		fnw_sz =3D 0;
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2071  		/* race aginst other=
 writers */
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2072  		again:
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2073  		spin_lock_irqsave(&f=
unc_buf_lock, flags);
056f2f27df67dfa Jiri Slaby         2020-08-18  2074  		q =3D func_table[kb_=
func];
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2075  =

46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2076  		/* fj pointer to nex=
t entry after 'q' */
079c9534a96da9a Alan Cox           2012-02-28  2077  		first_free =3D funcb=
ufptr + (funcbufsize - funcbufleft);
056f2f27df67dfa Jiri Slaby         2020-08-18  2078  		for (j =3D kb_func +=
 1; j < MAX_NR_FUNC && !func_table[j]; j++)
079c9534a96da9a Alan Cox           2012-02-28  2079  			;
079c9534a96da9a Alan Cox           2012-02-28  2080  		if (j < MAX_NR_FUNC)
079c9534a96da9a Alan Cox           2012-02-28  2081  			fj =3D func_table[j=
];
079c9534a96da9a Alan Cox           2012-02-28  2082  		else
079c9534a96da9a Alan Cox           2012-02-28  2083  			fj =3D first_free;
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2084  		/* buffer usage incr=
ease by new entry */
caf4aeff5e94952 Jiri Slaby         2020-08-14  2085  		delta =3D (q ? -strl=
en(q) : 1) + strlen(kbs);
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2086  =

079c9534a96da9a Alan Cox           2012-02-28  2087  		if (delta <=3D funcb=
ufleft) { 	/* it fits in current buf */
079c9534a96da9a Alan Cox           2012-02-28  2088  		    if (j < MAX_NR_F=
UNC) {
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2089  			/* make enough spac=
e for new entry@'fj' */
079c9534a96da9a Alan Cox           2012-02-28  2090  			memmove(fj + delta,=
 fj, first_free - fj);
079c9534a96da9a Alan Cox           2012-02-28  2091  			for (k =3D j; k < M=
AX_NR_FUNC; k++)
079c9534a96da9a Alan Cox           2012-02-28  2092  			    if (func_table[=
k])
079c9534a96da9a Alan Cox           2012-02-28  2093  				func_table[k] +=3D=
 delta;
079c9534a96da9a Alan Cox           2012-02-28  2094  		    }
079c9534a96da9a Alan Cox           2012-02-28  2095  		    if (!q)
056f2f27df67dfa Jiri Slaby         2020-08-18  2096  		      func_table[kb_=
func] =3D fj;
079c9534a96da9a Alan Cox           2012-02-28  2097  		    funcbufleft -=3D=
 delta;
079c9534a96da9a Alan Cox           2012-02-28  2098  		} else {			/* alloca=
te a larger buffer */
079c9534a96da9a Alan Cox           2012-02-28  2099  		    sz =3D 256;
079c9534a96da9a Alan Cox           2012-02-28  2100  		    while (sz < func=
bufsize - funcbufleft + delta)
079c9534a96da9a Alan Cox           2012-02-28  2101  		      sz <<=3D 1;
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2102  		    if (fnw_sz !=3D =
sz) {
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2103  		      spin_unlock_ir=
qrestore(&func_buf_lock, flags);
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2104  		      kfree(fnw);
079c9534a96da9a Alan Cox           2012-02-28  2105  		      fnw =3D kmallo=
c(sz, GFP_KERNEL);
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2106  		      fnw_sz =3D sz;
079c9534a96da9a Alan Cox           2012-02-28  2107  		      if (!fnw) {
079c9534a96da9a Alan Cox           2012-02-28  2108  			ret =3D -ENOMEM;
079c9534a96da9a Alan Cox           2012-02-28  2109  			goto reterr;
079c9534a96da9a Alan Cox           2012-02-28  2110  		      }
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2111  		      goto again;
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2112  		    }
079c9534a96da9a Alan Cox           2012-02-28  2113  =

079c9534a96da9a Alan Cox           2012-02-28  2114  		    if (!q)
056f2f27df67dfa Jiri Slaby         2020-08-18  2115  		      func_table[kb_=
func] =3D fj;
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2116  		    /* copy data bef=
ore insertion point to new location */
079c9534a96da9a Alan Cox           2012-02-28  2117  		    if (fj > funcbuf=
ptr)
079c9534a96da9a Alan Cox           2012-02-28  2118  			memmove(fnw, funcbu=
fptr, fj - funcbufptr);
079c9534a96da9a Alan Cox           2012-02-28  2119  		    for (k =3D 0; k =
< j; k++)
079c9534a96da9a Alan Cox           2012-02-28  2120  		      if (func_table=
[k])
079c9534a96da9a Alan Cox           2012-02-28  2121  			func_table[k] =3D f=
nw + (func_table[k] - funcbufptr);
079c9534a96da9a Alan Cox           2012-02-28  2122  =

46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2123  		    /* copy data aft=
er insertion point to new location */
079c9534a96da9a Alan Cox           2012-02-28  2124  		    if (first_free >=
 fj) {
079c9534a96da9a Alan Cox           2012-02-28  2125  			memmove(fnw + (fj -=
 funcbufptr) + delta, fj, first_free - fj);
079c9534a96da9a Alan Cox           2012-02-28  2126  			for (k =3D j; k < M=
AX_NR_FUNC; k++)
079c9534a96da9a Alan Cox           2012-02-28  2127  			  if (func_table[k])
079c9534a96da9a Alan Cox           2012-02-28  2128  			    func_table[k] =
=3D fnw + (func_table[k] - funcbufptr) + delta;
079c9534a96da9a Alan Cox           2012-02-28  2129  		    }
079c9534a96da9a Alan Cox           2012-02-28  2130  		    if (funcbufptr !=
=3D func_buf)
079c9534a96da9a Alan Cox           2012-02-28  2131  		      kfree(funcbufp=
tr);
079c9534a96da9a Alan Cox           2012-02-28  2132  		    funcbufptr =3D f=
nw;
079c9534a96da9a Alan Cox           2012-02-28  2133  		    funcbufleft =3D =
funcbufleft - delta + sz - funcbufsize;
079c9534a96da9a Alan Cox           2012-02-28  2134  		    funcbufsize =3D =
sz;
079c9534a96da9a Alan Cox           2012-02-28  2135  		}
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2136  		/* finally insert it=
em itself */
caf4aeff5e94952 Jiri Slaby         2020-08-14  2137  		strcpy(func_table[kb=
_func], kbs);
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2138  		spin_unlock_irqresto=
re(&func_buf_lock, flags);
079c9534a96da9a Alan Cox           2012-02-28  2139  		break;
079c9534a96da9a Alan Cox           2012-02-28  2140  	}
079c9534a96da9a Alan Cox           2012-02-28  2141  	ret =3D 0;
079c9534a96da9a Alan Cox           2012-02-28  2142  reterr:
079c9534a96da9a Alan Cox           2012-02-28  2143  	kfree(kbs);
079c9534a96da9a Alan Cox           2012-02-28  2144  	return ret;
079c9534a96da9a Alan Cox           2012-02-28  2145  }
079c9534a96da9a Alan Cox           2012-02-28  2146  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--===============8263520878608288005==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8263520878608288005==--

