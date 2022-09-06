Content-Type: multipart/mixed; boundary="===============5700194990646875157=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.15 135/241] drivers/bluetooth/btintel.c:1405:6-10: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
Date: Tue, 06 Sep 2022 20:02:19 +0800
Message-ID: <202209061944.TsFsZUqj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5700194990646875157==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.15
head:   2a2d77c5b1a6c9203069b85a9b29bbad6d7444b3
commit: 88ac2020f6e3cea46399525348022dcaf39be7f4 [135/241] CHROMIUM: Blueto=
oth: surface Intel telemetry events through mgmt
:::::: branch date: 3 hours ago
:::::: commit date: 3 weeks ago
config: arc-randconfig-c44-20220906 (https://download.01.org/0day-ci/archiv=
e/20220906/202209061944.TsFsZUqj-lkp(a)intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>

cocci warnings: (new ones prefixed by >>)
>> drivers/bluetooth/btintel.c:1405:6-10: WARNING use flexible-array member=
 instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#ze=
ro-length-and-one-element-arrays)

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5700194990646875157==--

