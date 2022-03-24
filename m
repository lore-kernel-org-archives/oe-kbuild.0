Content-Type: multipart/mixed; boundary="===============0762001060926912082=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [bvanassche:ufs-for-next 324/324] drivers/scsi/ufs-core/ufshpb.c:878:7-10: ERROR: iterator variable bound on line 877 cannot be NULL
Date: Thu, 24 Mar 2022 19:50:20 +0800
Message-ID: <202203241927.8qLUOAYy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0762001060926912082==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Bart Van Assche <bvanassche@acm.org>

tree:   https://github.com/bvanassche/linux ufs-for-next
head:   b93e987f91a0c037fc4357107f5144110cd84d08
commit: b93e987f91a0c037fc4357107f5144110cd84d08 [324/324] scsi: ufs: Split=
 the drivers/scsi/ufs directory
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: sparc64-randconfig-c023-20220324 (https://download.01.org/0day-ci/a=
rchive/20220324/202203241927.8qLUOAYy-lkp(a)intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/scsi/ufs-core/ufshpb.c:878:7-10: ERROR: iterator variable bound =
on line 877 cannot be NULL

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0762001060926912082==--

