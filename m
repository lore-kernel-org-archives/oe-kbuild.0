Content-Type: multipart/mixed; boundary="===============5617734735340561647=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [vbabka:slub-stackdepot-v2 3/6] mm/slub.c:760 print_track() warn: statement has no effect 3
Date: Thu, 03 Mar 2022 23:58:25 +0800
Message-ID: <202203032340.IzDbqcmq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5617734735340561647==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Oliver Glitta <glittao@gmail.com>
CC: Vlastimil Babka <vbabka@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git sl=
ub-stackdepot-v2
head:   81001c54e58478cef57829b8b468f8d2865b7563
commit: 80a4eec3b671b3f834d5357d4bf0027f325606c5 [3/6] mm/slub: use stackde=
pot to save stack trace in objects
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: nds32-randconfig-m031-20220303 (https://download.01.org/0day-ci/arc=
hive/20220303/202203032340.IzDbqcmq-lkp(a)intel.com/config)
compiler: nds32le-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/slub.c:760 print_track() warn: statement has no effect 3

vim +760 mm/slub.c

81819f0fc8285a2 Christoph Lameter 2007-05-06  757  =

86609d3319ad57f Chintan Pandya    2018-04-05  758  static void print_track(=
const char *s, struct track *t, unsigned long pr_time)
81819f0fc8285a2 Christoph Lameter 2007-05-06  759  {
80a4eec3b671b3f Oliver Glitta     2021-07-07 @760  	depot_stack_handle_t ha=
ndle __maybe_unused;
80a4eec3b671b3f Oliver Glitta     2021-07-07  761  =

81819f0fc8285a2 Christoph Lameter 2007-05-06  762  	if (!t->addr)
81819f0fc8285a2 Christoph Lameter 2007-05-06  763  		return;
81819f0fc8285a2 Christoph Lameter 2007-05-06  764  =

96b94abc12e6ec6 Yafang Shao       2021-03-19  765  	pr_err("%s in %pS age=
=3D%lu cpu=3D%u pid=3D%d\n",
86609d3319ad57f Chintan Pandya    2018-04-05  766  	       s, (void *)t->ad=
dr, pr_time - t->when, t->cpu, t->pid);
80a4eec3b671b3f Oliver Glitta     2021-07-07  767  #ifdef CONFIG_STACKDEPOT
80a4eec3b671b3f Oliver Glitta     2021-07-07  768  	handle =3D READ_ONCE(t-=
>handle);
80a4eec3b671b3f Oliver Glitta     2021-07-07  769  	if (handle)
80a4eec3b671b3f Oliver Glitta     2021-07-07  770  		stack_depot_print(hand=
le);
ae14c63a9f20d49 Linus Torvalds    2021-07-17  771  	else
80a4eec3b671b3f Oliver Glitta     2021-07-07  772  		pr_err("object allocat=
ion/free stack trace missing\n");
d6543e3935cec9f Ben Greear        2011-07-07  773  #endif
2492268472e7d32 Christoph Lameter 2007-07-17  774  }
2492268472e7d32 Christoph Lameter 2007-07-17  775  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5617734735340561647==--

