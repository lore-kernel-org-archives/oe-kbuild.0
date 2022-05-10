Content-Type: multipart/mixed; boundary="===============7700000176302328508=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ogabbay:habanalabs-next 47/47] drivers/misc/habanalabs/common/habanalabs_ioctl.c:135 events_info() warn: maybe return -EFAULT instead of the bytes remaining?
Date: Tue, 10 May 2022 08:01:51 +0800
Message-ID: <202205100736.Y0Vi5Fcf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7700000176302328508==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Tal Cohen <talcohen@habana.ai>
CC: Oded Gabbay <ogabbay@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git h=
abanalabs-next
head:   20c59ac5d71e766235e74f353b74e60facd733c8
commit: 20c59ac5d71e766235e74f353b74e60facd733c8 [47/47] habanalabs: add su=
pport for notification via eventfd
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: x86_64-randconfig-m001-20220509 (https://download.01.org/0day-ci/ar=
chive/20220510/202205100736.Y0Vi5Fcf-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/misc/habanalabs/common/habanalabs_ioctl.c:135 events_info() warn: m=
aybe return -EFAULT instead of the bytes remaining?

vim +135 drivers/misc/habanalabs/common/habanalabs_ioctl.c

d8dd7b0a81cc19 drivers/misc/habanalabs/habanalabs_ioctl.c        Oded Gabba=
y 2019-02-16  118  =

20c59ac5d71e76 drivers/misc/habanalabs/common/habanalabs_ioctl.c Tal Cohen =
  2022-04-28  119  static int events_info(struct hl_fpriv *hpriv, struct hl=
_info_args *args)
20c59ac5d71e76 drivers/misc/habanalabs/common/habanalabs_ioctl.c Tal Cohen =
  2022-04-28  120  {
20c59ac5d71e76 drivers/misc/habanalabs/common/habanalabs_ioctl.c Tal Cohen =
  2022-04-28  121  	int rc;
20c59ac5d71e76 drivers/misc/habanalabs/common/habanalabs_ioctl.c Tal Cohen =
  2022-04-28  122  	u32 max_size =3D args->return_size;
20c59ac5d71e76 drivers/misc/habanalabs/common/habanalabs_ioctl.c Tal Cohen =
  2022-04-28  123  	u64 events_mask;
20c59ac5d71e76 drivers/misc/habanalabs/common/habanalabs_ioctl.c Tal Cohen =
  2022-04-28  124  	void __user *out =3D (void __user *) (uintptr_t) args->=
return_pointer;
20c59ac5d71e76 drivers/misc/habanalabs/common/habanalabs_ioctl.c Tal Cohen =
  2022-04-28  125  =

20c59ac5d71e76 drivers/misc/habanalabs/common/habanalabs_ioctl.c Tal Cohen =
  2022-04-28  126  	if ((max_size < sizeof(u64)) || (!out))
20c59ac5d71e76 drivers/misc/habanalabs/common/habanalabs_ioctl.c Tal Cohen =
  2022-04-28  127  		return -EINVAL;
20c59ac5d71e76 drivers/misc/habanalabs/common/habanalabs_ioctl.c Tal Cohen =
  2022-04-28  128  =

20c59ac5d71e76 drivers/misc/habanalabs/common/habanalabs_ioctl.c Tal Cohen =
  2022-04-28  129  	mutex_lock(&hpriv->notifier_event.lock);
20c59ac5d71e76 drivers/misc/habanalabs/common/habanalabs_ioctl.c Tal Cohen =
  2022-04-28  130  	events_mask =3D hpriv->notifier_event.events_mask;
20c59ac5d71e76 drivers/misc/habanalabs/common/habanalabs_ioctl.c Tal Cohen =
  2022-04-28  131  	hpriv->notifier_event.events_mask =3D 0;
20c59ac5d71e76 drivers/misc/habanalabs/common/habanalabs_ioctl.c Tal Cohen =
  2022-04-28  132  	mutex_unlock(&hpriv->notifier_event.lock);
20c59ac5d71e76 drivers/misc/habanalabs/common/habanalabs_ioctl.c Tal Cohen =
  2022-04-28  133  =

20c59ac5d71e76 drivers/misc/habanalabs/common/habanalabs_ioctl.c Tal Cohen =
  2022-04-28  134  	rc =3D copy_to_user(out, &events_mask, sizeof(u64));
20c59ac5d71e76 drivers/misc/habanalabs/common/habanalabs_ioctl.c Tal Cohen =
  2022-04-28 @135  	return rc;
20c59ac5d71e76 drivers/misc/habanalabs/common/habanalabs_ioctl.c Tal Cohen =
  2022-04-28  136  }
20c59ac5d71e76 drivers/misc/habanalabs/common/habanalabs_ioctl.c Tal Cohen =
  2022-04-28  137  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7700000176302328508==--

