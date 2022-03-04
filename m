Content-Type: multipart/mixed; boundary="===============3238960054561902368=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [vbabka:slub-stackdepot-v2 4/6] mm/slub.c:5132 add_location() warn: statement has no effect 3
Date: Fri, 04 Mar 2022 10:46:55 +0800
Message-ID: <202203040353.AyuLODiL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3238960054561902368==
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
commit: 5b4178af1b7316bc06206490a8f0aec9f96f5392 [4/6] mm/slub: distinguish=
 and print stack traces in debugfs files
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: nds32-randconfig-m031-20220303 (https://download.01.org/0day-ci/arc=
hive/20220304/202203040353.AyuLODiL-lkp(a)intel.com/config)
compiler: nds32le-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/slub.c:5132 add_location() warn: statement has no effect 3
mm/slub.c:6115 slab_debugfs_show() warn: statement has no effect 3

vim +5132 mm/slub.c

88a420e4e21c1ff Christoph Lameter 2007-05-06  5124  =

88a420e4e21c1ff Christoph Lameter 2007-05-06  5125  static int add_location=
(struct loc_track *t, struct kmem_cache *s,
45edfa580b8e638 Christoph Lameter 2007-05-09  5126  				const struct track =
*track)
88a420e4e21c1ff Christoph Lameter 2007-05-06  5127  {
88a420e4e21c1ff Christoph Lameter 2007-05-06  5128  	long start, end, pos;
88a420e4e21c1ff Christoph Lameter 2007-05-06  5129  	struct location *l;
5b4178af1b7316b Oliver Glitta     2021-05-21  5130  	unsigned long caddr, c=
handle;
45edfa580b8e638 Christoph Lameter 2007-05-09  5131  	unsigned long age =3D =
jiffies - track->when;
5b4178af1b7316b Oliver Glitta     2021-05-21 @5132  	depot_stack_handle_t h=
andle =3D 0;
88a420e4e21c1ff Christoph Lameter 2007-05-06  5133  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3238960054561902368==--

