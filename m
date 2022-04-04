Content-Type: multipart/mixed; boundary="===============3921636985075990930=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/misc/habanalabs/common/device.c:112:7: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Mon, 04 Apr 2022 14:46:06 +0800
Message-ID: <202204041423.35sws0gt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3921636985075990930==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Oded Gabbay <ogabbay@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   be2d3ecedd9911fbfd7e55cc9ceac5f8b79ae4cf
commit: 278b5f7acbe1ae299aae8b9669a3e67d5a2635ff habanalabs: print if devic=
e is used on FD close
date:   12 months ago
:::::: branch date: 35 hours ago
:::::: commit date: 12 months ago
config: riscv-randconfig-c006-20220402 (https://download.01.org/0day-ci/arc=
hive/20220404/202204041423.35sws0gt-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b0=
7d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D278b5f7acbe1ae299aae8b9669a3e67d5a2635ff
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 278b5f7acbe1ae299aae8b9669a3e67d5a2635ff
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                 ^
   drivers/media/i2c/adv7842.c:285:6: note: Assuming the condition is false
           if (!i2c_smbus_xfer(client->adapter, client->addr, client->flags,
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ~~~~=
~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/media/i2c/adv7842.c:285:2: note: '?' condition is false
           if (!i2c_smbus_xfer(client->adapter, client->addr, client->flags,
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/media/i2c/adv7842.c:285:2: note: Taking false branch
           if (!i2c_smbus_xfer(client->adapter, client->addr, client->flags,
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/i2c/adv7842.c:289:2: note: '?' condition is false
           if (check)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/i2c/adv7842.c:289:6: note: 'check' is false
           if (check)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/media/i2c/adv7842.c:289:2: note: '?' condition is false
           if (check)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/media/i2c/adv7842.c:289:2: note: Taking false branch
           if (check)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/i2c/adv7842.c:292:2: note: Returning the value -5
           return -EIO;
           ^~~~~~~~~~~
   drivers/media/i2c/adv7842.c:3483:9: note: Returning from 'adv_smbus_read=
_byte_data_check'
                   rev =3D adv_smbus_read_byte_data_check(client, 0xea, fal=
se) << 8 |
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/adv7842.c:3483:61: note: The result of the left shift =
is undefined because the left operand is negative
                   rev =3D adv_smbus_read_byte_data_check(client, 0xea, fal=
se) << 8 |
                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~ ^
   Suppressed 5 warnings (3 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/misc/habanalabs/common/mmu/mmu_v1.c:389:2: warning: Value stored=
 to 'hop2_pte_addr' is never read [clang-analyzer-deadcode.DeadStores]
           hop2_pte_addr =3D hop2_addr;
           ^               ~~~~~~~~~
   drivers/misc/habanalabs/common/mmu/mmu_v1.c:389:2: note: Value stored to=
 'hop2_pte_addr' is never read
           hop2_pte_addr =3D hop2_addr;
           ^               ~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/misc/habanalabs/common/device.c:112:7: warning: Use of memory af=
ter it is freed [clang-analyzer-unix.Malloc]
           if (!hl_hpriv_put(hpriv))
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/misc/habanalabs/common/device.c:103:6: note: Assuming 'hdev' is =
non-null
           if (!hdev) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/misc/habanalabs/common/device.c:103:2: note: '?' condition is fa=
lse
           if (!hdev) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/misc/habanalabs/common/device.c:103:7: note: 'hdev' is non-null
           if (!hdev) {
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/misc/habanalabs/common/device.c:103:2: note: '?' condition is fa=
lse
           if (!hdev) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/misc/habanalabs/common/device.c:103:2: note: Taking false branch
           if (!hdev) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/misc/habanalabs/common/device.c:112:7: note: Calling 'hl_hpriv_p=
ut'
           if (!hl_hpriv_put(hpriv))
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/misc/habanalabs/common/device.c:85:9: note: Calling 'kref_put'
           return kref_put(&hpriv->refcount, hpriv_release);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: '?' condition is false
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   include/linux/kref.h:64:2: note: '?' condition is true
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   include/linux/kref.h:65:3: note: Calling 'hpriv_release'
                   release(kref);

vim +112 drivers/misc/habanalabs/common/device.c

c4d66343a46a49 drivers/misc/habanalabs/device.c        Oded Gabbay 2019-02-=
16   87  =

c4d66343a46a49 drivers/misc/habanalabs/device.c        Oded Gabbay 2019-02-=
16   88  /*
c4d66343a46a49 drivers/misc/habanalabs/device.c        Oded Gabbay 2019-02-=
16   89   * hl_device_release - release function for habanalabs device
c4d66343a46a49 drivers/misc/habanalabs/device.c        Oded Gabbay 2019-02-=
16   90   *
c4d66343a46a49 drivers/misc/habanalabs/device.c        Oded Gabbay 2019-02-=
16   91   * @inode: pointer to inode structure
c4d66343a46a49 drivers/misc/habanalabs/device.c        Oded Gabbay 2019-02-=
16   92   * @filp: pointer to file structure
c4d66343a46a49 drivers/misc/habanalabs/device.c        Oded Gabbay 2019-02-=
16   93   *
c4d66343a46a49 drivers/misc/habanalabs/device.c        Oded Gabbay 2019-02-=
16   94   * Called when process closes an habanalabs device
c4d66343a46a49 drivers/misc/habanalabs/device.c        Oded Gabbay 2019-02-=
16   95   */
c4d66343a46a49 drivers/misc/habanalabs/device.c        Oded Gabbay 2019-02-=
16   96  static int hl_device_release(struct inode *inode, struct file *fil=
p)
c4d66343a46a49 drivers/misc/habanalabs/device.c        Oded Gabbay 2019-02-=
16   97  {
c4d66343a46a49 drivers/misc/habanalabs/device.c        Oded Gabbay 2019-02-=
16   98  	struct hl_fpriv *hpriv =3D filp->private_data;
ffd123fe839700 drivers/misc/habanalabs/common/device.c Tomer Tayar 2021-02-=
01   99  	struct hl_device *hdev =3D hpriv->hdev;
ffd123fe839700 drivers/misc/habanalabs/common/device.c Tomer Tayar 2021-02-=
01  100  =

ffd123fe839700 drivers/misc/habanalabs/common/device.c Tomer Tayar 2021-02-=
01  101  	filp->private_data =3D NULL;
ffd123fe839700 drivers/misc/habanalabs/common/device.c Tomer Tayar 2021-02-=
01  102  =

ffd123fe839700 drivers/misc/habanalabs/common/device.c Tomer Tayar 2021-02-=
01  103  	if (!hdev) {
ffd123fe839700 drivers/misc/habanalabs/common/device.c Tomer Tayar 2021-02-=
01  104  		pr_crit("Closing FD after device was removed. Memory leak will o=
ccur and it is advised to reboot.\n");
ffd123fe839700 drivers/misc/habanalabs/common/device.c Tomer Tayar 2021-02-=
01  105  		put_pid(hpriv->taskpid);
ffd123fe839700 drivers/misc/habanalabs/common/device.c Tomer Tayar 2021-02-=
01  106  		return 0;
ffd123fe839700 drivers/misc/habanalabs/common/device.c Tomer Tayar 2021-02-=
01  107  	}
c4d66343a46a49 drivers/misc/habanalabs/device.c        Oded Gabbay 2019-02-=
16  108  =

8e9445a678cab4 drivers/misc/habanalabs/common/device.c Ofir Bitton 2021-02-=
10  109  	hl_cb_mgr_fini(hdev, &hpriv->cb_mgr);
8e9445a678cab4 drivers/misc/habanalabs/common/device.c Ofir Bitton 2021-02-=
10  110  	hl_ctx_mgr_fini(hdev, &hpriv->ctx_mgr);
8e9445a678cab4 drivers/misc/habanalabs/common/device.c Ofir Bitton 2021-02-=
10  111  =

278b5f7acbe1ae drivers/misc/habanalabs/common/device.c Oded Gabbay 2021-02-=
18 @112  	if (!hl_hpriv_put(hpriv))
278b5f7acbe1ae drivers/misc/habanalabs/common/device.c Oded Gabbay 2021-02-=
18  113  		dev_warn(hdev->dev,
278b5f7acbe1ae drivers/misc/habanalabs/common/device.c Oded Gabbay 2021-02-=
18  114  			"Device is still in use because there are live CS and/or memory=
 mappings\n");
c4d66343a46a49 drivers/misc/habanalabs/device.c        Oded Gabbay 2019-02-=
16  115  =

c4d66343a46a49 drivers/misc/habanalabs/device.c        Oded Gabbay 2019-02-=
16  116  	return 0;
c4d66343a46a49 drivers/misc/habanalabs/device.c        Oded Gabbay 2019-02-=
16  117  }
c4d66343a46a49 drivers/misc/habanalabs/device.c        Oded Gabbay 2019-02-=
16  118  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3921636985075990930==--

