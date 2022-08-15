Content-Type: multipart/mixed; boundary="===============1779253873063847044=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.15 134/241] net/bluetooth/aosp.c:226:6-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
Date: Mon, 15 Aug 2022 11:56:56 +0800
Message-ID: <202208151125.hDJO1fLs-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1779253873063847044==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.15
head:   569e73597b93c5052fa02e5a2405d3137205f3a0
commit: b6fb8c88d431993a4507baee38b66ee6dd8680b4 [134/241] CHROMIUM: Blueto=
oth: surface AOSP quality report through mgmt
:::::: branch date: 2 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
815/202208151125.hDJO1fLs-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>

cocci warnings: (new ones prefixed by >>)
>> net/bluetooth/aosp.c:226:6-9: WARNING use flexible-array member instead =
(https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length=
-and-one-element-arrays)
   net/bluetooth/aosp.c:231:6-10: WARNING use flexible-array member instead=
 (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-lengt=
h-and-one-element-arrays)

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1779253873063847044==--

