Content-Type: multipart/mixed; boundary="===============3721423863474469084=="
MIME-Version: 1.0
From: Zhangdianfang <zhangdianfang@huawei.com>
Subject: =?utf-8?q?=5Bkbuild=5D_=E7=AD=94=E5=A4=8D=3A_=5Bdjwong-xfs=3Avectorized-s?=
 =?utf-8?q?crub_154/315=5D_fs/xfs/xfs=5Finode=2Ec=3A6=3A1=3A_iwyu=3A_warni?=
 =?utf-8?q?ng=3A_superfluous_=23include_=3Clinux/iversion=2Eh=3E?=
Date: Tue, 15 Jun 2021 00:36:08 +0000
Message-ID: <159bcb40b1894a18b3a06a4fa4f43ff8@huawei.com>
In-Reply-To: <202106150853.5NXZtxJi-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3721423863474469084==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

unsubscribe
-----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
=E5=8F=91=E4=BB=B6=E4=BA=BA: kernel test robot [mailto:lkp(a)intel.com] =

=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2021=E5=B9=B46=E6=9C=8815=E6=97=A5 8:=
27
=E6=94=B6=E4=BB=B6=E4=BA=BA: kbuild(a)lists.01.org
=E6=8A=84=E9=80=81: lkp(a)intel.com
=E4=B8=BB=E9=A2=98: [kbuild] [djwong-xfs:vectorized-scrub 154/315] fs/xfs/x=
fs_inode.c:6:1: iwyu: warning: superfluous #include <linux/iversion.h>

CC: kbuild-all(a)lists.01.org
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
TO: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t vectorized-scrub
head:   e907b5eb3852612685b26c1aa94707544d45ced0
commit: bf5c042f6d84cd2114c3e87ec0cfcf60e66a9c8c [154/315] xfs: hoist inode=
 allocation function
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: x86_64-randconfig-b001-20210614 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project d2012d=
965d60c3258b3a69d024491698f8aec386)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        # apt-get install iwyu # include-what-you-use
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.=
git/commit/?id=3Dbf5c042f6d84cd2114c3e87ec0cfcf60e66a9c8c
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kern=
el/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs vectorized-scrub
        git checkout bf5c042f6d84cd2114c3e87ec0cfcf60e66a9c8c
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross C=3D=
1 CHECK=3Diwyu ARCH=3Dx86_64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


iwyu warnings: (new ones prefixed by >>)
   fs/xfs/xfs_file.c:31:1: iwyu: warning: superfluous #include <linux/mman.=
h>
   fs/xfs/xfs_file.c:33:1: iwyu: warning: superfluous #include <linux/mount=
.h>
   fs/xfs/xfs_file.c:6:1: iwyu: warning: superfluous #include "xfs.h"
   fs/xfs/xfs_file.c:7:1: iwyu: warning: superfluous #include "xfs_fs.h"
>> fs/xfs/xfs_file.c:8:1: iwyu: warning: superfluous #include "xfs_shared.h"
--
   fs/xfs/xfs_ioctl.c:6:1: iwyu: warning: superfluous #include "xfs.h"
   fs/xfs/xfs_ioctl.c:19:1: iwyu: warning: superfluous #include "xfs_bmap.h"
   fs/xfs/xfs_ioctl.c:29:1: iwyu: warning: superfluous #include "xfs_btree.=
h"
   fs/xfs/xfs_ioctl.c:15:1: iwyu: warning: superfluous #include "xfs_iwalk.=
h"
   fs/xfs/xfs_ioctl.c:36:1: iwyu: warning: superfluous #include "xfs_reflin=
k.h"
>> fs/xfs/xfs_ioctl.c:8:1: iwyu: warning: superfluous #include "xfs_shared.=
h"
   fs/xfs/xfs_ioctl.c:11:1: iwyu: warning: superfluous #include "xfs_trans_=
resv.h"
--
>> fs/xfs/xfs_inode.c:6:1: iwyu: warning: superfluous #include =

>> <linux/iversion.h>
   fs/xfs/xfs_inode.c:8:1: iwyu: warning: superfluous #include "xfs.h"
   fs/xfs/xfs_inode.c:20:1: iwyu: warning: superfluous #include "xfs_bit.h"
   fs/xfs/xfs_inode.c:37:1: iwyu: warning: superfluous #include "xfs_bmap_b=
tree.h"
   fs/xfs/xfs_inode.c:23:1: iwyu: warning: superfluous #include "xfs_buf_it=
em.h"
   fs/xfs/xfs_inode.c:16:1: iwyu: warning: superfluous #include "xfs_defer.=
h"
   fs/xfs/xfs_inode.c:28:1: iwyu: warning: superfluous #include "xfs_errort=
ag.h"
   fs/xfs/xfs_inode.c:9:1: iwyu: warning: superfluous #include "xfs_fs.h"
   fs/xfs/xfs_inode.c:40:1: iwyu: warning: superfluous #include "xfs_health=
.h"
--
   fs/xfs/xfs_qm_syscalls.c:8:1: iwyu: warning: superfluous #include "xfs.h"
   fs/xfs/xfs_qm_syscalls.c:9:1: iwyu: warning: superfluous #include "xfs_f=
s.h"
>> fs/xfs/xfs_qm_syscalls.c:10:1: iwyu: warning: superfluous #include "xfs_=
shared.h"

vim +6 fs/xfs/xfs_inode.c

f0e28280629e0e Jeff Layton      2017-12-11 @6  #include <linux/iversion.h>
40ebd81d1a7635 Robert P. J. Day 2007-11-23  7  =


:::::: The code at line 6 was first introduced by commit
:::::: f0e28280629e0ec7921f3179409a179b1ea41f24 xfs: convert to new i_versi=
on API

:::::: TO: Jeff Layton <jlayton@redhat.com>
:::::: CC: Jeff Layton <jlayton@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation https://lists.01.org/hyperk=
itty/list/kbuild-all(a)lists.01.org

--===============3721423863474469084==--

