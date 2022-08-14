Content-Type: multipart/mixed; boundary="===============5706353473571716775=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: security/loadpin/loadpin.c:365 dm_verity_ioctl() warn: maybe return -EFAULT instead of the bytes remaining?
Date: Sun, 14 Aug 2022 11:47:15 +0800
Message-ID: <202208141119.RKGSGoZ7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5706353473571716775==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Matthias Kaehlcke <mka@chromium.org>
CC: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   aea23e7c464bfdec04b52cf61edb62030e9e0d0a
commit: 3f805f8cc23ba35679dd01446929292911c2b469 LoadPin: Enable loading fr=
om trusted dm-verity devices
date:   5 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 5 weeks ago
config: s390-randconfig-m031-20220810 (https://download.01.org/0day-ci/arch=
ive/20220814/202208141119.RKGSGoZ7-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
security/loadpin/loadpin.c:365 dm_verity_ioctl() warn: maybe return -EFAULT=
 instead of the bytes remaining?

vim +365 security/loadpin/loadpin.c

3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  354  =

3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  355  static long dm_verity_ioc=
tl(struct file *filp, unsigned int cmd, unsigned long arg)
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  356  {
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  357  	void __user *uarg =3D (v=
oid __user *)arg;
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  358  	unsigned int fd;
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  359  	int rc;
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  360  =

3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  361  	switch (cmd) {
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  362  	case LOADPIN_IOC_SET_TRU=
STED_VERITY_DIGESTS:
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  363  		rc =3D copy_from_user(&=
fd, uarg, sizeof(fd));
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  364  		if (rc)
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27 @365  			return rc;
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  366  =

3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  367  		return read_trusted_ver=
ity_root_digests(fd);
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  368  =

3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  369  	default:
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  370  		return -EINVAL;
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  371  	}
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  372  }
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  373  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5706353473571716775==--

