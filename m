Content-Type: multipart/mixed; boundary="===============6845364462630841499=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.15 14/25] drivers/gpu/arm/bifrost/mali_kbase_core_linux.c:436:3-10: line 436 is redundant because platform_get_irq() already prints an error
Date: Mon, 25 Jul 2022 16:58:26 +0000
Message-ID: <202207241035.VsHOC1pq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6845364462630841499==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.15
head:   7c0bd1ef9f529bc0203837fc1b219fc966cd62bf
commit: 1c494031fcae2aecf9027952e3daf7847feb66f0 [14/25] CHROMIUM: gpu: mal=
i: Get IRQ with platform_get_irq_byname()
:::::: branch date: 20 hours ago
:::::: commit date: 34 hours ago
config: arm64-randconfig-c042-20220724 (https://download.01.org/0day-ci/arc=
hive/20220724/202207241035.VsHOC1pq-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/arm/bifrost/mali_kbase_core_linux.c:436:3-10: line 436 is re=
dundant because platform_get_irq() already prints an error

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6845364462630841499==--

