Content-Type: multipart/mixed; boundary="===============7023507283848421968=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 8459/13576] drivers/iio/test/iio-test-rescale.c:578:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-...
Date: Mon, 21 Mar 2022 03:15:31 +0800
Message-ID: <202203210359.O2qNyKTL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7023507283848421968==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Liam Beguin <liambeguin@gmail.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Peter Rosin <peda@axentia.se>
CC: Andy Shevchenko <andy.shevchenko@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   6d72dda014a4753974eb08950089ddf71fec4f60
commit: 8e74a48d17d509bf605e64252f38550b1a9cc376 [8459/13576] iio: test: ad=
d basic tests for the iio-rescale driver
:::::: branch date: 2 days ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-c006-20220320 (https://download.01.org/0day-ci/arc=
hive/20220321/202203210359.O2qNyKTL-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 217f26=
7efe3082438e698e2f08566b9df8c530fa)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D8e74a48d17d509bf605e64252f38550b1a9cc376
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 8e74a48d17d509bf605e64252f38550b1a9cc376
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/btrfs/volumes.c:6766:11: note: Assuming 'bio' is equal to field 'orig=
_bio'
                   WARN_ON(bio !=3D bioc->orig_bio);
                           ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   fs/btrfs/volumes.c:6770:7: note: Assuming the condition is false
                   if (atomic_read(&bioc->error) > bioc->max_errors)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:6770:3: note: Taking false branch
                   if (atomic_read(&bioc->error) > bioc->max_errors)
                   ^
   fs/btrfs/volumes.c:6774:3: note: Calling 'btrfs_end_bioc'
                   btrfs_end_bioc(bioc, bio);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:6668:2: note: Calling 'btrfs_put_bioc'
           btrfs_put_bioc(bioc);
           ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:5947:7: note: 'bioc' is non-null
           if (!bioc)
                ^~~~
   fs/btrfs/volumes.c:5947:2: note: Taking false branch
           if (!bioc)
           ^
   fs/btrfs/volumes.c:5949:6: note: Assuming the condition is true
           if (refcount_dec_and_test(&bioc->refs))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:5949:2: note: Taking true branch
           if (refcount_dec_and_test(&bioc->refs))
           ^
   fs/btrfs/volumes.c:5950:3: note: Memory is released
                   kfree(bioc);
                   ^~~~~~~~~~~
   fs/btrfs/volumes.c:6668:2: note: Returning; memory was released via 1st =
parameter
           btrfs_put_bioc(bioc);
           ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:6774:3: note: Returning; memory was released via 1st =
parameter
                   btrfs_end_bioc(bioc, bio);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:6836:4: note: Returning; memory was released via 1st =
parameter
                           bioc_error(bioc, first_bio, logical);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:6837:4: note:  Execution continues on line 6830
                           continue;
                           ^
   fs/btrfs/volumes.c:6830:19: note: Assuming 'dev_nr' is < 'total_devs'
           for (dev_nr =3D 0; dev_nr < total_devs; dev_nr++) {
                            ^~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:6830:2: note: Loop condition is true.  Entering loop =
body
           for (dev_nr =3D 0; dev_nr < total_devs; dev_nr++) {
           ^
   fs/btrfs/volumes.c:6831:9: note: Use of memory after it is freed
                   dev =3D bioc->stripes[dev_nr].dev;
                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:8256:4: warning: Value stored to 'ret' is never read =
[clang-analyzer-deadcode.DeadStores]
                           ret =3D 0;
                           ^     ~
   fs/btrfs/volumes.c:8256:4: note: Value stored to 'ret' is never read
                           ret =3D 0;
                           ^     ~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/iio/proximity/vcnl3020.c:76:8: warning: Excessive padding in 'st=
ruct vcnl3020_data' (93 padding bytes, where 29 is optimal). =

   Optimal fields order: =

   buf, =

   rev, =

   regmap, =

   dev, =

   lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct vcnl3020_data {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/iio/proximity/vcnl3020.c:76:8: note: Excessive padding in 'struc=
t vcnl3020_data' (93 padding bytes, where 29 is optimal). Optimal fields or=
der: buf, rev, regmap, dev, lock, consider reordering the fields or adding =
explicit padding members
   struct vcnl3020_data {
   ~~~~~~~^~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/iio/test/iio-test-rescale.c:578:2: warning: Call to function 'st=
rcpy' is insecure as it does not provide bounding of the memory buffer. Rep=
lace unbounded copy functions with analogous functions that support length =
arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.s=
trcpy]
           strcpy(desc, t->name);
           ^~~~~~
   drivers/iio/test/iio-test-rescale.c:578:2: note: Call to function 'strcp=
y' is insecure as it does not provide bounding of the memory buffer. Replac=
e unbounded copy functions with analogous functions that support length arg=
uments such as 'strlcpy'. CWE-119
           strcpy(desc, t->name);
           ^~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/hwspinlock/qcom_hwspinlock.c:158:24: warning: Passed-by-value st=
ruct argument contains uninitialized data (e.g., field: 'id_size') [clang-a=
nalyzer-core.CallAndMessage]
                   bank->lock[i].priv =3D devm_regmap_field_alloc(&pdev->de=
v,
                                        ^
   drivers/hwspinlock/qcom_hwspinlock.c:132:2: note: 'field' initialized he=
re
           struct reg_field field;
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/hwspinlock/qcom_hwspinlock.c:140:21: note: Left side of '&&' is =
false
           if (IS_ERR(regmap) && PTR_ERR(regmap) =3D=3D -ENODEV)
                              ^
   drivers/hwspinlock/qcom_hwspinlock.c:143:6: note: Calling 'IS_ERR'
           if (IS_ERR(regmap))
               ^~~~~~~~~~~~~~
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwspinlock/qcom_hwspinlock.c:143:6: note: Returning from 'IS_ERR'
           if (IS_ERR(regmap))
               ^~~~~~~~~~~~~~
   drivers/hwspinlock/qcom_hwspinlock.c:143:2: note: Taking false branch
           if (IS_ERR(regmap))
           ^
   drivers/hwspinlock/qcom_hwspinlock.c:148:6: note: Assuming 'bank' is non=
-null
           if (!bank)
               ^~~~~
   drivers/hwspinlock/qcom_hwspinlock.c:148:2: note: Taking false branch
           if (!bank)
           ^
   drivers/hwspinlock/qcom_hwspinlock.c:153:2: note: Loop condition is true=
.  Entering loop body
           for (i =3D 0; i < QCOM_MUTEX_NUM_LOCKS; i++) {
           ^
   drivers/hwspinlock/qcom_hwspinlock.c:158:24: note: Passed-by-value struc=
t argument contains uninitialized data (e.g., field: 'id_size')
                   bank->lock[i].priv =3D devm_regmap_field_alloc(&pdev->de=
v,
                                        ^
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +578 drivers/iio/test/iio-test-rescale.c

8e74a48d17d509 Liam Beguin 2022-02-12  575  =

8e74a48d17d509 Liam Beguin 2022-02-12  576  static void case_to_desc(const =
struct rescale_tc_data *t, char *desc)
8e74a48d17d509 Liam Beguin 2022-02-12  577  {
8e74a48d17d509 Liam Beguin 2022-02-12 @578  	strcpy(desc, t->name);
8e74a48d17d509 Liam Beguin 2022-02-12  579  }
8e74a48d17d509 Liam Beguin 2022-02-12  580  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7023507283848421968==--

