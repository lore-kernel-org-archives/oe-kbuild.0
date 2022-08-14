Content-Type: multipart/mixed; boundary="===============5508645036795480318=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/staging/rtl8712/rtl871x_ioctl_linux.c:1823 r8711_wx_read32() error: uninitialized symbol 'addr'.
Date: Sun, 14 Aug 2022 17:41:49 +0800
Message-ID: <202208141731.TlR9uJwW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5508645036795480318==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   aea23e7c464bfdec04b52cf61edb62030e9e0d0a
commit: a97b693c3712f040c5802f32b2d685352e08cefa uaccess: fix nios2 and mic=
roblaze get_user_8()
date:   6 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 6 months ago
config: nios2-randconfig-m031-20220814 (https://download.01.org/0day-ci/arc=
hive/20220814/202208141731.TlR9uJwW-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/staging/rtl8712/rtl871x_ioctl_linux.c:1823 r8711_wx_read32() error:=
 uninitialized symbol 'addr'.
drivers/staging/rtl8712/rtl871x_ioctl_linux.c:1841 r8711_wx_write32() error=
: uninitialized symbol 'addr'.

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:71 current_thread_info() error: uninit=
ialized symbol 'sp'.

vim +/addr +1823 drivers/staging/rtl8712/rtl871x_ioctl_linux.c

2865d42c78a912 Larry Finger 2010-08-20  1813  =

2865d42c78a912 Larry Finger 2010-08-20  1814  static int r8711_wx_read32(st=
ruct net_device *dev,
2865d42c78a912 Larry Finger 2010-08-20  1815  				struct iw_request_info *i=
nfo,
2865d42c78a912 Larry Finger 2010-08-20  1816  				union iwreq_data *wrqu, c=
har *keybuf)
2865d42c78a912 Larry Finger 2010-08-20  1817  {
8f47c28b5a0346 Julia Lawall 2015-03-29  1818  	struct _adapter *padapter =
=3D netdev_priv(dev);
2865d42c78a912 Larry Finger 2010-08-20  1819  	u32 addr;
2865d42c78a912 Larry Finger 2010-08-20  1820  	u32 data32;
2865d42c78a912 Larry Finger 2010-08-20  1821  =

2865d42c78a912 Larry Finger 2010-08-20  1822  	get_user(addr, (u32 __user *=
)wrqu->data.pointer);
2865d42c78a912 Larry Finger 2010-08-20 @1823  	data32 =3D r8712_read32(pada=
pter, addr);
2865d42c78a912 Larry Finger 2010-08-20  1824  	put_user(data32, (u32 __user=
 *)wrqu->data.pointer);
2865d42c78a912 Larry Finger 2010-08-20  1825  	wrqu->data.length =3D (data3=
2 & 0xffff0000) >> 16;
2865d42c78a912 Larry Finger 2010-08-20  1826  	wrqu->data.flags =3D data32 =
& 0xffff;
2865d42c78a912 Larry Finger 2010-08-20  1827  	get_user(addr, (u32 __user *=
)wrqu->data.pointer);
2865d42c78a912 Larry Finger 2010-08-20  1828  	return 0;
2865d42c78a912 Larry Finger 2010-08-20  1829  }
2865d42c78a912 Larry Finger 2010-08-20  1830  =

2865d42c78a912 Larry Finger 2010-08-20  1831  static int r8711_wx_write32(s=
truct net_device *dev,
2865d42c78a912 Larry Finger 2010-08-20  1832  				 struct iw_request_info *=
info,
2865d42c78a912 Larry Finger 2010-08-20  1833  				 union iwreq_data *wrqu, =
char *keybuf)
2865d42c78a912 Larry Finger 2010-08-20  1834  {
8f47c28b5a0346 Julia Lawall 2015-03-29  1835  	struct _adapter *padapter =
=3D netdev_priv(dev);
2865d42c78a912 Larry Finger 2010-08-20  1836  	u32 addr;
2865d42c78a912 Larry Finger 2010-08-20  1837  	u32 data32;
2865d42c78a912 Larry Finger 2010-08-20  1838  =

2865d42c78a912 Larry Finger 2010-08-20  1839  	get_user(addr, (u32 __user *=
)wrqu->data.pointer);
2865d42c78a912 Larry Finger 2010-08-20  1840  	data32 =3D ((u32)wrqu->data.=
length << 16) | (u32)wrqu->data.flags;
2865d42c78a912 Larry Finger 2010-08-20 @1841  	r8712_write32(padapter, addr=
, data32);
2865d42c78a912 Larry Finger 2010-08-20  1842  	return 0;
2865d42c78a912 Larry Finger 2010-08-20  1843  }
2865d42c78a912 Larry Finger 2010-08-20  1844  =


:::::: The code at line 1823 was first introduced by commit
:::::: 2865d42c78a9121caad52cb02d1fbb7f5cdbc4ef staging: r8712u: Add the ne=
w driver to the mainline kernel

:::::: TO: Larry Finger <Larry.Finger@lwfinger.net>
:::::: CC: Larry Finger <Larry.Finger@lwfinger.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5508645036795480318==--

