Content-Type: multipart/mixed; boundary="===============3877036359172854170=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH v2 2/2] kernfs: Reduce contention around global per-fs kernfs_rwsem.
Date: Tue, 04 Jan 2022 15:20:58 +0800
Message-ID: <202201041512.lFBs9kxK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3877036359172854170==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220103084544.1109829-3-imran.f.khan@oracle.com>
References: <20220103084544.1109829-3-imran.f.khan@oracle.com>
TO: Imran Khan <imran.f.khan@oracle.com>

Hi Imran,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on ea586a076e8aa606c59b66d86660590f18354b11]

url:    https://github.com/0day-ci/linux/commits/Imran-Khan/kernfs-use-kern=
fs_node-specific-mutex-and-spinlock/20220103-164752
base:   ea586a076e8aa606c59b66d86660590f18354b11
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: arm-randconfig-c002-20220102 (https://download.01.org/0day-ci/archi=
ve/20220104/202201041512.lFBs9kxK-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b50fea=
47b6c454581fce89af359f3afe5154986c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/3dd2a5f81a41be1f22391cc8e=
f0ac78293de0141
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Imran-Khan/kernfs-use-kernfs_node-=
specific-mutex-and-spinlock/20220103-164752
        git checkout 3dd2a5f81a41be1f22391cc8ef0ac78293de0141
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/gpu/drm/drm_ioctl.c:390:7: note: Assuming field 'drm_di_major' i=
s equal to DRM_IF_MAJOR
                   if (sv->drm_di_major !=3D DRM_IF_MAJOR ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_ioctl.c:390:7: note: Left side of '||' is false
   drivers/gpu/drm/drm_ioctl.c:391:7: note: Assuming field 'drm_di_minor' i=
s >=3D 0
                       sv->drm_di_minor < 0 || sv->drm_di_minor > DRM_IF_MI=
NOR) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_ioctl.c:390:7: note: Left side of '||' is false
                   if (sv->drm_di_major !=3D DRM_IF_MAJOR ||
                       ^
   drivers/gpu/drm/drm_ioctl.c:391:31: note: Assuming field 'drm_di_minor' =
is <=3D DRM_IF_MINOR
                       sv->drm_di_minor < 0 || sv->drm_di_minor > DRM_IF_MI=
NOR) {
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/drm_ioctl.c:390:3: note: Taking false branch
                   if (sv->drm_di_major !=3D DRM_IF_MAJOR ||
                   ^
   drivers/gpu/drm/drm_ioctl.c:397:21: note: Assuming '__UNIQUE_ID___x289' =
is <=3D '__UNIQUE_ID___y290'
                   dev->if_version =3D max(if_version, dev->if_version);
                                     ^
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/gpu/drm/drm_ioctl.c:397:21: note: '?' condition is false
                   dev->if_version =3D max(if_version, dev->if_version);
                                     ^
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/gpu/drm/drm_ioctl.c:398:7: note: Assuming field 'drm_di_minor' i=
s >=3D 1
                   if (sv->drm_di_minor >=3D 1) {
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_ioctl.c:398:3: note: Taking true branch
                   if (sv->drm_di_minor >=3D 1) {
                   ^
   drivers/gpu/drm/drm_ioctl.c:403:14: note: Calling 'drm_set_busid'
                           retcode =3D drm_set_busid(dev, file_priv);
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_ioctl.c:150:6: note: Assuming field 'unique' is equa=
l to NULL
           if (master->unique !=3D NULL)
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_ioctl.c:150:2: note: Taking false branch
           if (master->unique !=3D NULL)
           ^
   drivers/gpu/drm/drm_ioctl.c:153:6: note: Assuming field 'dev' is null
           if (dev->dev && dev_is_pci(dev->dev)) {
               ^~~~~~~~
   drivers/gpu/drm/drm_ioctl.c:153:15: note: Left side of '&&' is false
           if (dev->dev && dev_is_pci(dev->dev)) {
                        ^
   drivers/gpu/drm/drm_ioctl.c:160:11: note: Assuming field 'unique' is null
                   WARN_ON(!dev->unique);
                           ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/gpu/drm/drm_ioctl.c:162:7: note: Assuming field 'unique' is non-=
null
                   if (master->unique)
                       ^~~~~~~~~~~~~~
   drivers/gpu/drm/drm_ioctl.c:162:3: note: Taking true branch
                   if (master->unique)
                   ^
   drivers/gpu/drm/drm_ioctl.c:163:25: note: Null pointer passed as 1st arg=
ument to string length function
                           master->unique_len =3D strlen(dev->unique);
                                                ^      ~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
>> fs/kernfs/inode.c:102:22: warning: Value stored to 'root' during its ini=
tialization is never read [clang-analyzer-deadcode.DeadStores]
           struct kernfs_root *root =3D kernfs_root(kn);
                               ^~~~   ~~~~~~~~~~~~~~~
   fs/kernfs/inode.c:102:22: note: Value stored to 'root' during its initia=
lization is never read
           struct kernfs_root *root =3D kernfs_root(kn);
                               ^~~~   ~~~~~~~~~~~~~~~
>> fs/kernfs/inode.c:123:2: warning: Value stored to 'root' is never read [=
clang-analyzer-deadcode.DeadStores]
           root =3D kernfs_root(kn);
           ^      ~~~~~~~~~~~~~~~
   fs/kernfs/inode.c:123:2: note: Value stored to 'root' is never read
           root =3D kernfs_root(kn);
           ^      ~~~~~~~~~~~~~~~
   fs/kernfs/inode.c:194:22: warning: Value stored to 'root' during its ini=
tialization is never read [clang-analyzer-deadcode.DeadStores]
           struct kernfs_root *root =3D kernfs_root(kn);
                               ^~~~   ~~~~~~~~~~~~~~~
   fs/kernfs/inode.c:194:22: note: Value stored to 'root' during its initia=
lization is never read
           struct kernfs_root *root =3D kernfs_root(kn);
                               ^~~~   ~~~~~~~~~~~~~~~
   fs/kernfs/inode.c:295:2: warning: Value stored to 'root' is never read [=
clang-analyzer-deadcode.DeadStores]
           root =3D kernfs_root(kn);
           ^      ~~~~~~~~~~~~~~~
   fs/kernfs/inode.c:295:2: note: Value stored to 'root' is never read
           root =3D kernfs_root(kn);
           ^      ~~~~~~~~~~~~~~~
   Suppressed 11 warnings (7 in non-user code, 4 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   arch/arm/mach-pxa/pcm990-baseboard.c:344:3: warning: Value stored to 'va=
l' is never read [clang-analyzer-deadcode.DeadStores]
                   val |=3D PCM990_CTRL_MMC2PWR;
                   ^
   arch/arm/mach-pxa/pcm990-baseboard.c:344:3: note: Value stored to 'val' =
is never read
   arch/arm/mach-pxa/pcm990-baseboard.c:346:3: warning: Value stored to 'va=
l' is never read [clang-analyzer-deadcode.DeadStores]
                   val &=3D ~PCM990_CTRL_MMC2PWR;
                   ^      ~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-pxa/pcm990-baseboard.c:346:3: note: Value stored to 'val' =
is never read
                   val &=3D ~PCM990_CTRL_MMC2PWR;
                   ^      ~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   ipc/sem.c:688:29: warning: Access to field 'sem_num' results in a derefe=
rence of a null pointer (loaded from variable 'sop') [clang-analyzer-core.N=
ullDereference]
                   ipc_update_pid(&sma->sems[sop->sem_num].sempid, pid);
                                             ^
   ipc/sem.c:2344:6: note: Assuming 'ulp' is non-null

vim +/root +102 fs/kernfs/inode.c

ffed24e22845a3 Tejun Heo         2013-11-28   91  =

ffed24e22845a3 Tejun Heo         2013-11-28   92  /**
ffed24e22845a3 Tejun Heo         2013-11-28   93   * kernfs_setattr - set i=
attr on a node
324a56e16e44ba Tejun Heo         2013-12-11   94   * @kn: target node
ffed24e22845a3 Tejun Heo         2013-11-28   95   * @iattr: iattr to set
ffed24e22845a3 Tejun Heo         2013-11-28   96   *
ffed24e22845a3 Tejun Heo         2013-11-28   97   * Returns 0 on success, =
-errno on failure.
ffed24e22845a3 Tejun Heo         2013-11-28   98   */
324a56e16e44ba Tejun Heo         2013-12-11   99  int kernfs_setattr(struct=
 kernfs_node *kn, const struct iattr *iattr)
ffed24e22845a3 Tejun Heo         2013-11-28  100  {
ffed24e22845a3 Tejun Heo         2013-11-28  101  	int ret;
393c3714081a53 Minchan Kim       2021-11-18 @102  	struct kernfs_root *root=
 =3D kernfs_root(kn);
ffed24e22845a3 Tejun Heo         2013-11-28  103  =

3dd2a5f81a41be Imran Khan        2022-01-03  104  	kernfs_get(kn);
3dd2a5f81a41be Imran Khan        2022-01-03  105  	down_write(&kn->kernfs_i=
op_rwsem);
324a56e16e44ba Tejun Heo         2013-12-11  106  	ret =3D __kernfs_setattr=
(kn, iattr);
3dd2a5f81a41be Imran Khan        2022-01-03  107  	up_write(&kn->kernfs_iop=
_rwsem);
3dd2a5f81a41be Imran Khan        2022-01-03  108  	kernfs_put(kn);
ffed24e22845a3 Tejun Heo         2013-11-28  109  	return ret;
ffed24e22845a3 Tejun Heo         2013-11-28  110  }
ffed24e22845a3 Tejun Heo         2013-11-28  111  =

549c7297717c32 Christian Brauner 2021-01-21  112  int kernfs_iop_setattr(st=
ruct user_namespace *mnt_userns, struct dentry *dentry,
549c7297717c32 Christian Brauner 2021-01-21  113  		       struct iattr *ia=
ttr)
ffed24e22845a3 Tejun Heo         2013-11-28  114  {
2b0143b5c986be David Howells     2015-03-17  115  	struct inode *inode =3D =
d_inode(dentry);
319ba91d352a74 Shaohua Li        2017-07-12  116  	struct kernfs_node *kn =
=3D inode->i_private;
393c3714081a53 Minchan Kim       2021-11-18  117  	struct kernfs_root *root;
ffed24e22845a3 Tejun Heo         2013-11-28  118  	int error;
ffed24e22845a3 Tejun Heo         2013-11-28  119  =

324a56e16e44ba Tejun Heo         2013-12-11  120  	if (!kn)
ffed24e22845a3 Tejun Heo         2013-11-28  121  		return -EINVAL;
ffed24e22845a3 Tejun Heo         2013-11-28  122  =

393c3714081a53 Minchan Kim       2021-11-18 @123  	root =3D kernfs_root(kn);
3dd2a5f81a41be Imran Khan        2022-01-03  124  	kernfs_get(kn);
3dd2a5f81a41be Imran Khan        2022-01-03  125  	down_write(&kn->kernfs_i=
op_rwsem);
2f221d6f7b881d Christian Brauner 2021-01-21  126  	error =3D setattr_prepar=
e(&init_user_ns, dentry, iattr);
ffed24e22845a3 Tejun Heo         2013-11-28  127  	if (error)
ffed24e22845a3 Tejun Heo         2013-11-28  128  		goto out;
ffed24e22845a3 Tejun Heo         2013-11-28  129  =

324a56e16e44ba Tejun Heo         2013-12-11  130  	error =3D __kernfs_setat=
tr(kn, iattr);
ffed24e22845a3 Tejun Heo         2013-11-28  131  	if (error)
ffed24e22845a3 Tejun Heo         2013-11-28  132  		goto out;
ffed24e22845a3 Tejun Heo         2013-11-28  133  =

ffed24e22845a3 Tejun Heo         2013-11-28  134  	/* this ignores size cha=
nges */
2f221d6f7b881d Christian Brauner 2021-01-21  135  	setattr_copy(&init_user_=
ns, inode, iattr);
ffed24e22845a3 Tejun Heo         2013-11-28  136  =

ffed24e22845a3 Tejun Heo         2013-11-28  137  out:
3dd2a5f81a41be Imran Khan        2022-01-03  138  	up_write(&kn->kernfs_iop=
_rwsem);
3dd2a5f81a41be Imran Khan        2022-01-03  139  	kernfs_put(kn);
ffed24e22845a3 Tejun Heo         2013-11-28  140  	return error;
ffed24e22845a3 Tejun Heo         2013-11-28  141  }
ffed24e22845a3 Tejun Heo         2013-11-28  142  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3877036359172854170==--

