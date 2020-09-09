Content-Type: multipart/mixed; boundary="===============4704541408382019504=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4326/6354] drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:214:7: warning: Identical condition 'err', second condition is always false
Date: Thu, 10 Sep 2020 02:36:03 +0800
Message-ID: <202009100251.zWmtpX1W%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4704541408382019504==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   7204eaa2c1f509066486f488c9dcb065d7484494
commit: 36e3cf0cb17b722ac19f58db9780746ec56bf3d6 [4326/6354] media: dvb-ttu=
sb-budget: don't use stack for USB transfers
:::::: branch date: 8 hours ago
:::::: commit date: 6 days ago
compiler: ia64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:665:33: warning: Boole=
an result is used in bitwise operation. Clarify expression with parentheses=
. [clarifyCondition]
               muxpack[0] & 0x20)) ^
                                   ^
>> drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:214:7: warning: Identi=
cal condition 'err', second condition is always false [identicalConditionAf=
terEarlyExit]
     if (err || b[0] !=3D 0x55 || b[1] !=3D id) {
         ^
   drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:206:6: note: first con=
dition
    if (err)
        ^
   drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:214:7: note: second co=
ndition
     if (err || b[0] !=3D 0x55 || b[1] !=3D id) {
         ^

# https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3D36e3cf0cb17b722ac19f58db9780746ec56bf3d6
git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/n=
ext/linux-next.git
git fetch --no-tags linux-next master
git checkout 36e3cf0cb17b722ac19f58db9780746ec56bf3d6
vim +/err +214 drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c

^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  181  =

^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  182  static int ttusb_i2c_msg(struct ttusb *ttusb,
^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  183  		  u8 addr, u8 * snd_buf, u8 snd_len, u8 * r=
cv_buf,
^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  184  		  u8 rcv_len)
^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  185  {
36e3cf0cb17b722 drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c Mauro Car=
valho Chehab 2020-09-02  186  	u8 b[MAX_SEND];
^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  187  	u8 id =3D ++ttusb->c;
^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  188  	int i, err;
^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  189  =

36e3cf0cb17b722 drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c Mauro Car=
valho Chehab 2020-09-02  190  	if (snd_len > MAX_SEND - 7 || rcv_len > MAX_=
RCV - 7)
^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  191  		return -EINVAL;
^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  192  =

^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  193  	b[0] =3D 0xaa;
^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  194  	b[1] =3D id;
^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  195  	b[2] =3D 0x31;
^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  196  	b[3] =3D snd_len + 3;
^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  197  	b[4] =3D addr << 1;
^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  198  	b[5] =3D snd_len;
^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  199  	b[6] =3D rcv_len;
^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  200  =

^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  201  	for (i =3D 0; i < snd_len; i++)
^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  202  		b[7 + i] =3D snd_buf[i];
^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  203  =

36e3cf0cb17b722 drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c Mauro Car=
valho Chehab 2020-09-02  204  	err =3D ttusb_cmd(ttusb, b, snd_len + 7, MAX=
_RCV);
^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  205  =

^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  206  	if (err)
^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  207  		return -EREMOTEIO;
^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  208  =

^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  209  	/* check if the i2c transaction was successf=
ul */
^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  210  	if ((snd_len !=3D b[5]) || (rcv_len !=3D b[6=
])) return -EREMOTEIO;
^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  211  =

^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  212  	if (rcv_len > 0) {
^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  213  =

^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16 @214  		if (err || b[0] !=3D 0x55 || b[1] !=3D id) {
^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  215  			dprintk
^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  216  			    ("%s: usb_bulk_msg(recv) failed, err =
=3D=3D %i, id =3D=3D %02x, b =3D=3D ",
fb9393b519fb277 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Harvey Ha=
rrison       2008-04-08  217  			     __func__, err, id);
^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  218  			return -EREMOTEIO;
^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  219  		}
^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  220  =

^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  221  		for (i =3D 0; i < rcv_len; i++)
^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  222  			rcv_buf[i] =3D b[7 + i];
^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  223  	}
^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  224  =

^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  225  	return rcv_len;
^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  226  }
^1da177e4c3f415 drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c Linus Tor=
valds        2005-04-16  227  =


:::::: The code@line 214 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4704541408382019504==--

