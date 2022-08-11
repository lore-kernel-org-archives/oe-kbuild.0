Content-Type: multipart/mixed; boundary="===============8033990385853982753=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-lts:5.10/dovetail-xenomai 22/207] include/linux/irq_pipeline.h: linux/irqstage.h is included more than once.
Date: Thu, 11 Aug 2022 18:59:45 +0800
Message-ID: <202208111837.ETcgmGJE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8033990385853982753==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: Hao Li <hao3.li@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.10/dovetail-xenomai
head:   1ec5fba16dd51c564b43e1de41ff50e30ecd0e9b
commit: b0eacb8ef27534e5a4a3e0663e1dd8f9f9a97ec1 [22/207] genirq: irq_pipel=
ine: add IRQ pipeline core
:::::: branch date: 12 days ago
:::::: commit date: 4 months ago
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> include/linux/irq_pipeline.h: linux/irqstage.h is included more than onc=
e.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8033990385853982753==--

