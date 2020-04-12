Content-Type: multipart/mixed; boundary="===============5488663753375635142=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v3 31/31] elx: efct: Tie into kernel Kconfig and build process
Date: Sun, 12 Apr 2020 15:22:50 +0800
Message-ID: <202004121504.E6ItoFUo%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5488663753375635142==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200412033303.29574-32-jsmart2021@gmail.com>
References: <20200412033303.29574-32-jsmart2021@gmail.com>
TO: James Smart <jsmart2021@gmail.com>
CC: linux-scsi(a)vger.kernel.org
CC: dwagner(a)suse.de, maier(a)linux.ibm.com, bvanassche(a)acm.org, herbszt=
(a)gmx.de, natechancellor(a)gmail.com, rdunlap(a)infradead.org, hare(a)suse=
.de, James Smart <jsmart2021@gmail.com>, Ram Vegesna <ram.vegesna@broad=
com.com>

Hi James,

I love your patch! Perhaps something to improve:

[auto build test WARNING on mkp-scsi/for-next]
[also build test WARNING on scsi/for-next linus/master v5.6 next-20200412]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/James-Smart/efct-Broadcom-=
Emulex-FC-Target-driver/20200412-114125
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-ne=
xt
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


coccinelle warnings: (new ones prefixed by >>)

>> drivers/scsi/elx/efct/efct_hw.c:3897:25-28: ERROR: reference preceded by=
 free on line 3893
   drivers/scsi/elx/efct/efct_hw.c:3898:7-10: ERROR: reference preceded by =
free on line 3893
--
>> drivers/scsi/elx/efct/efct_hw.c:3882:7-14: WARNING: kzalloc should be us=
ed for ctx, instead of kmalloc/memset
>> drivers/scsi/elx/efct/efct_hw.c:4509:7-14: WARNING: kzalloc should be us=
ed for cmd, instead of kmalloc/memset
>> drivers/scsi/elx/efct/efct_hw.c:4595:7-14: WARNING: kzalloc should be us=
ed for buf, instead of kmalloc/memset
>> drivers/scsi/elx/efct/efct_hw.c:5306:11-18: WARNING: kzalloc should be u=
sed for mbxdata, instead of kmalloc/memset
   drivers/scsi/elx/efct/efct_hw.c:3484:11-18: WARNING: kzalloc should be u=
sed for mbxdata, instead of kmalloc/memset
   drivers/scsi/elx/efct/efct_hw.c:3385:11-18: WARNING: kzalloc should be u=
sed for mbxdata, instead of kmalloc/memset
   drivers/scsi/elx/efct/efct_hw.c:5162:11-18: WARNING: kzalloc should be u=
sed for mbxdata, instead of kmalloc/memset
   drivers/scsi/elx/efct/efct_hw.c:3122:11-18: WARNING: kzalloc should be u=
sed for mbxdata, instead of kmalloc/memset
   drivers/scsi/elx/efct/efct_hw.c:3229:11-18: WARNING: kzalloc should be u=
sed for mbxdata, instead of kmalloc/memset
   drivers/scsi/elx/efct/efct_hw.c:4827:7-14: WARNING: kzalloc should be us=
ed for buf, instead of kmalloc/memset
   drivers/scsi/elx/efct/efct_hw.c:5003:8-15: WARNING: kzalloc should be us=
ed for buf, instead of kmalloc/memset
   drivers/scsi/elx/efct/efct_hw.c:5096:7-14: WARNING: kzalloc should be us=
ed for buf, instead of kmalloc/memset
   drivers/scsi/elx/efct/efct_hw.c:4181:8-15: WARNING: kzalloc should be us=
ed for cmd, instead of kmalloc/memset
   drivers/scsi/elx/efct/efct_hw.c:4263:7-14: WARNING: kzalloc should be us=
ed for buf, instead of kmalloc/memset
>> drivers/scsi/elx/efct/efct_hw.c:3977:9-16: WARNING: kzalloc should be us=
ed for data, instead of kmalloc/memset
>> drivers/scsi/elx/efct/efct_hw.c:532:18-25: WARNING: kzalloc should be us=
ed for hw -> wqe_buffs, instead of kmalloc/memset
--
>> drivers/scsi/elx/efct/efct_hw_queues.c:173:7-14: WARNING: kzalloc should=
 be used for cq, instead of kmalloc/memset
>> drivers/scsi/elx/efct/efct_hw_queues.c:376:7-14: WARNING: kzalloc should=
 be used for rq, instead of kmalloc/memset
--
>> drivers/scsi/elx/efct/efct_lio.c:265:22-29: WARNING: kzalloc should be u=
sed for filp -> private_data, instead of kmalloc/memset
   drivers/scsi/elx/efct/efct_lio.c:303:22-29: WARNING: kzalloc should be u=
sed for filp -> private_data, instead of kmalloc/memset
>> drivers/scsi/elx/efct/efct_lio.c:1462:11-18: WARNING: kzalloc should be =
used for wq_data, instead of kmalloc/memset
--
>> drivers/scsi/elx/efct/efct_xport.c:44:9-16: WARNING: kzalloc should be u=
sed for xport, instead of kmalloc/memset
>> drivers/scsi/elx/efct/efct_xport.c:688:12-19: WARNING: kzalloc should be=
 used for payload, instead of kmalloc/memset

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5488663753375635142==--

