Content-Type: multipart/mixed; boundary="===============0630715006437003645=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-lts:5.10/dovetail-xenomai 22/205] include/linux/irq_pipeline.h: linux/irqstage.h is included more than once.
Date: Wed, 25 May 2022 11:03:59 +0800
Message-ID: <202205251030.1V06tieb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0630715006437003645==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Hao Li <hao3.li@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.10/dovetail-xenomai
head:   7e50195eb7b91d6b58f1c65457442eb5edc21848
commit: b0eacb8ef27534e5a4a3e0663e1dd8f9f9a97ec1 [22/205] genirq: irq_pipel=
ine: add IRQ pipeline core
:::::: branch date: 7 days ago
:::::: commit date: 7 weeks ago
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> include/linux/irq_pipeline.h: linux/irqstage.h is included more than onc=
e.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0630715006437003645==--

