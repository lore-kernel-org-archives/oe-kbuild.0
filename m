Content-Type: multipart/mixed; boundary="===============6659260115961567332=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/3] vt: keyboard, reorder user buffer handling in vt_do_kdgkb_ioctl
Date: Fri, 16 Oct 2020 22:13:37 +0800
Message-ID: <202010162208.pzegggfF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6659260115961567332==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20201016122412.31767-1-jslaby@suse.cz>
References: <20201016122412.31767-1-jslaby@suse.cz>
TO: Jiri Slaby <jslaby@suse.cz>

Hi Jiri,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on v5.9 next-20201016]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jiri-Slaby/vt-keyboard-reo=
rder-user-buffer-handling-in-vt_do_kdgkb_ioctl/20201016-202459
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-=
testing
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: i386-randconfig-m021-20201016 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/tty/vt/keyboard.c:2114 vt_do_kdgkb_ioctl() error: uninitialized sym=
bol 'kbs'.

Old smatch warnings:
drivers/tty/vt/keyboard.c:1909 vt_do_kdsk_ioctl() warn: potential spectre i=
ssue 'key_map' [r]
drivers/tty/vt/keyboard.c:2052 vt_do_kdgkb_ioctl() warn: potential spectre =
issue 'func_table' [r] (local cap)
drivers/tty/vt/keyboard.c:2061 vt_do_kdgkb_ioctl() warn: possible spectre s=
econd half.  'fj'
drivers/tty/vt/keyboard.c:2067 vt_do_kdgkb_ioctl() warn: possible spectre s=
econd half.  'fj'
drivers/tty/vt/keyboard.c:2086 vt_do_kdgkb_ioctl() warn: possible spectre s=
econd half.  'fj'
drivers/tty/vt/keyboard.c:2088 vt_do_kdgkb_ioctl() warn: possible spectre s=
econd half.  'fj'

vim +/kbs +2114 drivers/tty/vt/keyboard.c

079c9534a96da9a Alan Cox           2012-02-28  1993  =

079c9534a96da9a Alan Cox           2012-02-28  1994  /* FIXME: This one nee=
ds untangling and locking */
079c9534a96da9a Alan Cox           2012-02-28  1995  int vt_do_kdgkb_ioctl(=
int cmd, struct kbsentry __user *user_kdgkb, int perm)
079c9534a96da9a Alan Cox           2012-02-28  1996  {
987bbe4f15e721c Jiri Slaby         2020-10-16  1997  	char *kbs;
079c9534a96da9a Alan Cox           2012-02-28  1998  	char *p;
079c9534a96da9a Alan Cox           2012-02-28  1999  	u_char *q;
079c9534a96da9a Alan Cox           2012-02-28  2000  	u_char __user *up;
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2001  	int sz, fnw_sz;
079c9534a96da9a Alan Cox           2012-02-28  2002  	int delta;
079c9534a96da9a Alan Cox           2012-02-28  2003  	char *first_free, *fj=
, *fnw;
079c9534a96da9a Alan Cox           2012-02-28  2004  	int i, j, k;
079c9534a96da9a Alan Cox           2012-02-28  2005  	int ret;
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2006  	unsigned long flags;
079c9534a96da9a Alan Cox           2012-02-28  2007  =

079c9534a96da9a Alan Cox           2012-02-28  2008  	if (!capable(CAP_SYS_=
TTY_CONFIG))
079c9534a96da9a Alan Cox           2012-02-28  2009  		perm =3D 0;
079c9534a96da9a Alan Cox           2012-02-28  2010  =

987bbe4f15e721c Jiri Slaby         2020-10-16  2011  	if (get_user(i, &user=
_kdgkb->kb_func))
987bbe4f15e721c Jiri Slaby         2020-10-16  2012  		return -EFAULT;
079c9534a96da9a Alan Cox           2012-02-28  2013  =

987bbe4f15e721c Jiri Slaby         2020-10-16  2014  	i =3D array_index_nos=
pec(i, MAX_NR_FUNC);
079c9534a96da9a Alan Cox           2012-02-28  2015  =

079c9534a96da9a Alan Cox           2012-02-28  2016  	switch (cmd) {
079c9534a96da9a Alan Cox           2012-02-28  2017  	case KDGKBSENT:
987bbe4f15e721c Jiri Slaby         2020-10-16  2018  		/* sz should have be=
en a struct member */
987bbe4f15e721c Jiri Slaby         2020-10-16  2019  		sz =3D sizeof_field(=
struct kbsentry, kb_string) - 1;
079c9534a96da9a Alan Cox           2012-02-28  2020  		up =3D user_kdgkb->k=
b_string;
079c9534a96da9a Alan Cox           2012-02-28  2021  		p =3D func_table[i];
079c9534a96da9a Alan Cox           2012-02-28  2022  		if(p)
079c9534a96da9a Alan Cox           2012-02-28  2023  			for ( ; *p && sz; p=
++, sz--)
987bbe4f15e721c Jiri Slaby         2020-10-16  2024  				if (put_user(*p, u=
p++))
987bbe4f15e721c Jiri Slaby         2020-10-16  2025  					return -EFAULT;
987bbe4f15e721c Jiri Slaby         2020-10-16  2026  =

987bbe4f15e721c Jiri Slaby         2020-10-16  2027  		if (put_user('\0', u=
p))
987bbe4f15e721c Jiri Slaby         2020-10-16  2028  			return -EFAULT;
987bbe4f15e721c Jiri Slaby         2020-10-16  2029  =

079c9534a96da9a Alan Cox           2012-02-28  2030  		return ((p && *p) ? =
-EOVERFLOW : 0);
079c9534a96da9a Alan Cox           2012-02-28  2031  	case KDSKBSENT:
987bbe4f15e721c Jiri Slaby         2020-10-16  2032  		if (!perm)
987bbe4f15e721c Jiri Slaby         2020-10-16  2033  			return -EPERM;
987bbe4f15e721c Jiri Slaby         2020-10-16  2034  =

987bbe4f15e721c Jiri Slaby         2020-10-16  2035  		kbs =3D strndup_user=
(user_kdgkb->kb_string,
987bbe4f15e721c Jiri Slaby         2020-10-16  2036  				sizeof(user_kdgkb-=
>kb_string));
987bbe4f15e721c Jiri Slaby         2020-10-16  2037  		if (IS_ERR(kbs))
987bbe4f15e721c Jiri Slaby         2020-10-16  2038  			return PTR_ERR(kbs);
079c9534a96da9a Alan Cox           2012-02-28  2039  =

46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2040  		fnw =3D NULL;
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2041  		fnw_sz =3D 0;
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2042  		/* race aginst other=
 writers */
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2043  		again:
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2044  		spin_lock_irqsave(&f=
unc_buf_lock, flags);
079c9534a96da9a Alan Cox           2012-02-28  2045  		q =3D func_table[i];
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2046  =

46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2047  		/* fj pointer to nex=
t entry after 'q' */
079c9534a96da9a Alan Cox           2012-02-28  2048  		first_free =3D funcb=
ufptr + (funcbufsize - funcbufleft);
079c9534a96da9a Alan Cox           2012-02-28  2049  		for (j =3D i+1; j < =
MAX_NR_FUNC && !func_table[j]; j++)
079c9534a96da9a Alan Cox           2012-02-28  2050  			;
079c9534a96da9a Alan Cox           2012-02-28  2051  		if (j < MAX_NR_FUNC)
079c9534a96da9a Alan Cox           2012-02-28  2052  			fj =3D func_table[j=
];
079c9534a96da9a Alan Cox           2012-02-28  2053  		else
079c9534a96da9a Alan Cox           2012-02-28  2054  			fj =3D first_free;
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2055  		/* buffer usage incr=
ease by new entry */
987bbe4f15e721c Jiri Slaby         2020-10-16  2056  		delta =3D (q ? -strl=
en(q) : 1) + strlen(kbs);
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2057  =

079c9534a96da9a Alan Cox           2012-02-28  2058  		if (delta <=3D funcb=
ufleft) { 	/* it fits in current buf */
079c9534a96da9a Alan Cox           2012-02-28  2059  		    if (j < MAX_NR_F=
UNC) {
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2060  			/* make enough spac=
e for new entry@'fj' */
079c9534a96da9a Alan Cox           2012-02-28  2061  			memmove(fj + delta,=
 fj, first_free - fj);
079c9534a96da9a Alan Cox           2012-02-28  2062  			for (k =3D j; k < M=
AX_NR_FUNC; k++)
079c9534a96da9a Alan Cox           2012-02-28  2063  			    if (func_table[=
k])
079c9534a96da9a Alan Cox           2012-02-28  2064  				func_table[k] +=3D=
 delta;
079c9534a96da9a Alan Cox           2012-02-28  2065  		    }
079c9534a96da9a Alan Cox           2012-02-28  2066  		    if (!q)
079c9534a96da9a Alan Cox           2012-02-28  2067  		      func_table[i] =
=3D fj;
079c9534a96da9a Alan Cox           2012-02-28  2068  		    funcbufleft -=3D=
 delta;
079c9534a96da9a Alan Cox           2012-02-28  2069  		} else {			/* alloca=
te a larger buffer */
079c9534a96da9a Alan Cox           2012-02-28  2070  		    sz =3D 256;
079c9534a96da9a Alan Cox           2012-02-28  2071  		    while (sz < func=
bufsize - funcbufleft + delta)
079c9534a96da9a Alan Cox           2012-02-28  2072  		      sz <<=3D 1;
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2073  		    if (fnw_sz !=3D =
sz) {
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2074  		      spin_unlock_ir=
qrestore(&func_buf_lock, flags);
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2075  		      kfree(fnw);
079c9534a96da9a Alan Cox           2012-02-28  2076  		      fnw =3D kmallo=
c(sz, GFP_KERNEL);
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2077  		      fnw_sz =3D sz;
079c9534a96da9a Alan Cox           2012-02-28  2078  		      if (!fnw) {
079c9534a96da9a Alan Cox           2012-02-28  2079  			ret =3D -ENOMEM;
079c9534a96da9a Alan Cox           2012-02-28  2080  			goto reterr;
079c9534a96da9a Alan Cox           2012-02-28  2081  		      }
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2082  		      goto again;
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2083  		    }
079c9534a96da9a Alan Cox           2012-02-28  2084  =

079c9534a96da9a Alan Cox           2012-02-28  2085  		    if (!q)
079c9534a96da9a Alan Cox           2012-02-28  2086  		      func_table[i] =
=3D fj;
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2087  		    /* copy data bef=
ore insertion point to new location */
079c9534a96da9a Alan Cox           2012-02-28  2088  		    if (fj > funcbuf=
ptr)
079c9534a96da9a Alan Cox           2012-02-28  2089  			memmove(fnw, funcbu=
fptr, fj - funcbufptr);
079c9534a96da9a Alan Cox           2012-02-28  2090  		    for (k =3D 0; k =
< j; k++)
079c9534a96da9a Alan Cox           2012-02-28  2091  		      if (func_table=
[k])
079c9534a96da9a Alan Cox           2012-02-28  2092  			func_table[k] =3D f=
nw + (func_table[k] - funcbufptr);
079c9534a96da9a Alan Cox           2012-02-28  2093  =

46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2094  		    /* copy data aft=
er insertion point to new location */
079c9534a96da9a Alan Cox           2012-02-28  2095  		    if (first_free >=
 fj) {
079c9534a96da9a Alan Cox           2012-02-28  2096  			memmove(fnw + (fj -=
 funcbufptr) + delta, fj, first_free - fj);
079c9534a96da9a Alan Cox           2012-02-28  2097  			for (k =3D j; k < M=
AX_NR_FUNC; k++)
079c9534a96da9a Alan Cox           2012-02-28  2098  			  if (func_table[k])
079c9534a96da9a Alan Cox           2012-02-28  2099  			    func_table[k] =
=3D fnw + (func_table[k] - funcbufptr) + delta;
079c9534a96da9a Alan Cox           2012-02-28  2100  		    }
079c9534a96da9a Alan Cox           2012-02-28  2101  		    if (funcbufptr !=
=3D func_buf)
079c9534a96da9a Alan Cox           2012-02-28  2102  		      kfree(funcbufp=
tr);
079c9534a96da9a Alan Cox           2012-02-28  2103  		    funcbufptr =3D f=
nw;
079c9534a96da9a Alan Cox           2012-02-28  2104  		    funcbufleft =3D =
funcbufleft - delta + sz - funcbufsize;
079c9534a96da9a Alan Cox           2012-02-28  2105  		    funcbufsize =3D =
sz;
079c9534a96da9a Alan Cox           2012-02-28  2106  		}
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2107  		/* finally insert it=
em itself */
987bbe4f15e721c Jiri Slaby         2020-10-16  2108  		strcpy(func_table[i]=
, kbs);
46ca3f735f345c9 Sergei Trofimovich 2019-03-10  2109  		spin_unlock_irqresto=
re(&func_buf_lock, flags);
079c9534a96da9a Alan Cox           2012-02-28  2110  		break;
079c9534a96da9a Alan Cox           2012-02-28  2111  	}
079c9534a96da9a Alan Cox           2012-02-28  2112  	ret =3D 0;
079c9534a96da9a Alan Cox           2012-02-28  2113  reterr:
079c9534a96da9a Alan Cox           2012-02-28 @2114  	kfree(kbs);
079c9534a96da9a Alan Cox           2012-02-28  2115  	return ret;
079c9534a96da9a Alan Cox           2012-02-28  2116  }
079c9534a96da9a Alan Cox           2012-02-28  2117  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--===============6659260115961567332==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============6659260115961567332==--

