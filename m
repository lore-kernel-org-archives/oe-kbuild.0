Content-Type: multipart/mixed; boundary="===============6295411222510632191=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [shenki:dev-5.4 250/293] drivers/char/tpm/tpm_tis_i2c.c: linux/module.h is included more than once.
Date: Wed, 19 May 2021 11:02:28 +0800
Message-ID: <202105191125.jb8i9nkB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6295411222510632191==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Joel Stanley <joel@jms.id.au>

tree:   https://github.com/shenki/linux dev-5.4
head:   43e79c6defc55f9c0e3190aa2c2ed0bd1b704e07
commit: 64ff069ebc777efcc839ad1d07f35951937b3c4b [250/293] tpm: tpm_tis: ad=
d tpm_tis_i2c driver
:::::: branch date: 3 hours ago
:::::: commit date: 1 year, 1 month ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)


Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6295411222510632191==--

