Content-Type: multipart/mixed; boundary="===============5432393468346192767=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] tty: vt: add a bounds checking in vt_do_kdgkb_ioctl()
Date: Fri, 09 Sep 2022 02:45:40 +0800
Message-ID: <202209090239.LlWhQWyG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5432393468346192767==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220908075403.27930-1-hbh25y@gmail.com>
References: <20220908075403.27930-1-hbh25y@gmail.com>
TO: Hangyu Hua <hbh25y@gmail.com>
TO: gregkh(a)linuxfoundation.org
TO: jirislaby(a)kernel.org
TO: changlianzhi(a)uniontech.com
TO: dmitry.torokhov(a)gmail.com
CC: linux-kernel(a)vger.kernel.org
CC: Hangyu Hua <hbh25y@gmail.com>

Hi Hangyu,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on linus/master v6.0-rc4 next-20220908]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hangyu-Hua/tty-vt-ad=
d-a-bounds-checking-in-vt_do_kdgkb_ioctl/20220908-155511
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-=
testing
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: microblaze-randconfig-m031-20220907 (https://download.01.org/0day-c=
i/archive/20220909/202209090239.LlWhQWyG-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/tty/vt/keyboard.c:2070 vt_do_kdgkb_ioctl() warn: impossible conditi=
on '(kb_func >=3D 256) =3D> (0-255 >=3D 256)'

Old smatch warnings:
drivers/tty/vt/keyboard.c:2088 vt_do_kdgkb_ioctl() warn: possible info leak=
 'kbs'
drivers/tty/vt/keyboard.c:2110 vt_do_kdgkb_ioctl() error: uninitialized sym=
bol 'kbs'.
drivers/tty/vt/keyboard.c:2112 vt_do_kdgkb_ioctl() error: uninitialized sym=
bol 'ret'.

vim +2070 drivers/tty/vt/keyboard.c

4e1404a5cd0436 Jiri Slaby         2020-10-29  2059  =

079c9534a96da9 Alan Cox           2012-02-28  2060  int vt_do_kdgkb_ioctl(i=
nt cmd, struct kbsentry __user *user_kdgkb, int perm)
079c9534a96da9 Alan Cox           2012-02-28  2061  {
4e1404a5cd0436 Jiri Slaby         2020-10-29  2062  	unsigned char kb_func;
4e1404a5cd0436 Jiri Slaby         2020-10-29  2063  	unsigned long flags;
07edff9265204e Jiri Slaby         2020-10-29  2064  	char *kbs;
079c9534a96da9 Alan Cox           2012-02-28  2065  	int ret;
079c9534a96da9 Alan Cox           2012-02-28  2066  =

07edff9265204e Jiri Slaby         2020-10-29  2067  	if (get_user(kb_func, =
&user_kdgkb->kb_func))
07edff9265204e Jiri Slaby         2020-10-29  2068  		return -EFAULT;
079c9534a96da9 Alan Cox           2012-02-28  2069  =

9878c90ddacf7a Hangyu Hua         2022-09-08 @2070  	if (kb_func >=3D MAX_N=
R_FUNC)
9878c90ddacf7a Hangyu Hua         2022-09-08  2071  		return -EFAULT;
9878c90ddacf7a Hangyu Hua         2022-09-08  2072  =

07edff9265204e Jiri Slaby         2020-10-29  2073  	kb_func =3D array_inde=
x_nospec(kb_func, MAX_NR_FUNC);
079c9534a96da9 Alan Cox           2012-02-28  2074  =

079c9534a96da9 Alan Cox           2012-02-28  2075  	switch (cmd) {
6ca03f90527e49 Jiri Slaby         2020-10-19  2076  	case KDGKBSENT: {
6ca03f90527e49 Jiri Slaby         2020-10-19  2077  		/* size should have b=
een a struct member */
82e61c3909db51 Jiri Slaby         2020-10-19  2078  		ssize_t len =3D sizeo=
f(user_kdgkb->kb_string);
82e61c3909db51 Jiri Slaby         2020-10-19  2079  =

07edff9265204e Jiri Slaby         2020-10-29  2080  		kbs =3D kmalloc(len, =
GFP_KERNEL);
07edff9265204e Jiri Slaby         2020-10-29  2081  		if (!kbs)
07edff9265204e Jiri Slaby         2020-10-29  2082  			return -ENOMEM;
07edff9265204e Jiri Slaby         2020-10-29  2083  =

82e61c3909db51 Jiri Slaby         2020-10-19  2084  		spin_lock_irqsave(&fu=
nc_buf_lock, flags);
07edff9265204e Jiri Slaby         2020-10-29  2085  		len =3D strlcpy(kbs, =
func_table[kb_func] ? : "", len);
82e61c3909db51 Jiri Slaby         2020-10-19  2086  		spin_unlock_irqrestor=
e(&func_buf_lock, flags);
6ca03f90527e49 Jiri Slaby         2020-10-19  2087  =

07edff9265204e Jiri Slaby         2020-10-29  2088  		ret =3D copy_to_user(=
user_kdgkb->kb_string, kbs, len + 1) ?
07edff9265204e Jiri Slaby         2020-10-29  2089  			-EFAULT : 0;
6ca03f90527e49 Jiri Slaby         2020-10-19  2090  =

4e1404a5cd0436 Jiri Slaby         2020-10-29  2091  		break;
079c9534a96da9 Alan Cox           2012-02-28  2092  	}
079c9534a96da9 Alan Cox           2012-02-28  2093  	case KDSKBSENT:
cb58a5046095c0 Jiri Slaby         2020-10-29  2094  		if (!perm || !capable=
(CAP_SYS_TTY_CONFIG))
07edff9265204e Jiri Slaby         2020-10-29  2095  			return -EPERM;
07edff9265204e Jiri Slaby         2020-10-29  2096  =

07edff9265204e Jiri Slaby         2020-10-29  2097  		kbs =3D strndup_user(=
user_kdgkb->kb_string,
07edff9265204e Jiri Slaby         2020-10-29  2098  				sizeof(user_kdgkb->=
kb_string));
07edff9265204e Jiri Slaby         2020-10-29  2099  		if (IS_ERR(kbs))
07edff9265204e Jiri Slaby         2020-10-29  2100  			return PTR_ERR(kbs);
079c9534a96da9 Alan Cox           2012-02-28  2101  =

46ca3f735f345c Sergei Trofimovich 2019-03-10  2102  		spin_lock_irqsave(&fu=
nc_buf_lock, flags);
4e1404a5cd0436 Jiri Slaby         2020-10-29  2103  		kbs =3D vt_kdskbsent(=
kbs, kb_func);
46ca3f735f345c Sergei Trofimovich 2019-03-10  2104  		spin_unlock_irqrestor=
e(&func_buf_lock, flags);
4e1404a5cd0436 Jiri Slaby         2020-10-29  2105  =

4e1404a5cd0436 Jiri Slaby         2020-10-29  2106  		ret =3D 0;
079c9534a96da9 Alan Cox           2012-02-28  2107  		break;
079c9534a96da9 Alan Cox           2012-02-28  2108  	}
4e1404a5cd0436 Jiri Slaby         2020-10-29  2109  =

079c9534a96da9 Alan Cox           2012-02-28  2110  	kfree(kbs);
4e1404a5cd0436 Jiri Slaby         2020-10-29  2111  =

079c9534a96da9 Alan Cox           2012-02-28  2112  	return ret;
079c9534a96da9 Alan Cox           2012-02-28  2113  }
079c9534a96da9 Alan Cox           2012-02-28  2114  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5432393468346192767==--

