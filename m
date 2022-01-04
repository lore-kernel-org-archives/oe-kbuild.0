Content-Type: multipart/mixed; boundary="===============1625193837000131412=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [melver:kcsan/new-refcount-merge-resolution 4/8] fs/btrfs/disk-io.h:102:3: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Wed, 05 Jan 2022 06:31:31 +0800
Message-ID: <202201050658.KkBMVYk1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1625193837000131412==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: elver(a)google.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git kc=
san/new-refcount-merge-resolution
head:   cd086bd94b45dddeec54376aa1bfc45541ccedc5
commit: 43394e65056eeacbadab724997e3087d81014a2f [4/8] refcount: Use atomic=
_*_overflow()
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
config: arm-randconfig-c002-20211228 (https://download.01.org/0day-ci/archi=
ve/20220105/202201050658.KkBMVYk1-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7171af=
744543433ac75b232eb7dfdaef7efd4d7a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git/=
commit/?id=3D43394e65056eeacbadab724997e3087d81014a2f
        git remote add melver https://git.kernel.org/pub/scm/linux/kernel/g=
it/melver/linux.git
        git fetch --no-tags melver kcsan/new-refcount-merge-resolution
        git checkout 43394e65056eeacbadab724997e3087d81014a2f
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/gpu/drm/sun4i/sun4i_tcon.c:1424:2: warning: Value stored to 'id'=
 is never read [clang-analyzer-deadcode.DeadStores]
           id =3D sun4i_tcon_of_get_id_from_port(port);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/sun4i/sun4i_tcon.c:1424:2: note: Value stored to 'id' is=
 never read
           id =3D sun4i_tcon_of_get_id_from_port(port);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/gpu/drm/sun4i/sun4i_tv.c:491:3: warning: Call to function 'strcp=
y' is insecure as it does not provide bounding of the memory buffer. Replac=
e unbounded copy functions with analogous functions that support length arg=
uments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strc=
py]
                   strcpy(mode->name, tv_mode->name);
                   ^~~~~~
   drivers/gpu/drm/sun4i/sun4i_tv.c:491:3: note: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119
                   strcpy(mode->name, tv_mode->name);
                   ^~~~~~
   Suppressed 16 warnings (15 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/usb/misc/usbsevseg.c:255:4: warning: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcat(buf, " [");
                           ^~~~~~
   drivers/usb/misc/usbsevseg.c:255:4: note: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119
                           strcat(buf, " [");
                           ^~~~~~
   drivers/usb/misc/usbsevseg.c:256:4: warning: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcat(buf, display_textmodes[i]);
                           ^~~~~~
   drivers/usb/misc/usbsevseg.c:256:4: note: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119
                           strcat(buf, display_textmodes[i]);
                           ^~~~~~
   drivers/usb/misc/usbsevseg.c:257:4: warning: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcat(buf, "] ");
                           ^~~~~~
   drivers/usb/misc/usbsevseg.c:257:4: note: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119
                           strcat(buf, "] ");
                           ^~~~~~
   drivers/usb/misc/usbsevseg.c:259:4: warning: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcat(buf, " ");
                           ^~~~~~
   drivers/usb/misc/usbsevseg.c:259:4: note: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119
                           strcat(buf, " ");
                           ^~~~~~
   drivers/usb/misc/usbsevseg.c:260:4: warning: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcat(buf, display_textmodes[i]);
                           ^~~~~~
   drivers/usb/misc/usbsevseg.c:260:4: note: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119
                           strcat(buf, display_textmodes[i]);
                           ^~~~~~
   drivers/usb/misc/usbsevseg.c:261:4: warning: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcat(buf, " ");
                           ^~~~~~
   drivers/usb/misc/usbsevseg.c:261:4: note: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119
                           strcat(buf, " ");
                           ^~~~~~
   drivers/usb/misc/usbsevseg.c:264:2: warning: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(buf, "\n");
           ^~~~~~
   drivers/usb/misc/usbsevseg.c:264:2: note: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119
           strcat(buf, "\n");
           ^~~~~~
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   fs/btrfs/disk-io.c:3327:3: warning: Value stored to 'features' is never =
read [clang-analyzer-deadcode.DeadStores]
                   features |=3D BTRFS_FEATURE_INCOMPAT_BIG_METADATA;
                   ^
   fs/btrfs/disk-io.c:3327:3: note: Value stored to 'features' is never read
>> fs/btrfs/disk-io.h:102:3: warning: Use of memory after it is freed [clan=
g-analyzer-unix.Malloc]
                   return root;
                   ^
   fs/btrfs/disk-io.c:4332:2: note: '?' condition is true
           set_bit(BTRFS_FS_CLOSING_START, &fs_info->flags);
           ^
   arch/arm/include/asm/bitops.h:189:25: note: expanded from macro 'set_bit'
   #define set_bit(nr,p)                   ATOMIC_BITOP(set_bit,nr,p)
                                           ^
   arch/arm/include/asm/bitops.h:181:3: note: expanded from macro 'ATOMIC_B=
ITOP'
           (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(n=
r,p))
            ^
   fs/btrfs/disk-io.c:4357:2: note: Loop condition is false.  Exiting loop
           wait_event(fs_info->transaction_wait,
           ^
   include/linux/wait.h:342:2: note: expanded from macro 'wait_event'
           might_sleep();                                                  =
        \
           ^
   include/linux/kernel.h:171:29: note: expanded from macro 'might_sleep'
   # define might_sleep() do { might_resched(); } while (0)
                               ^
   include/linux/kernel.h:106:26: note: expanded from macro 'might_resched'
   # define might_resched() do { } while (0)
                            ^
   fs/btrfs/disk-io.c:4357:2: note: Loop condition is false.  Exiting loop
           wait_event(fs_info->transaction_wait,
           ^
   include/linux/wait.h:342:2: note: expanded from macro 'wait_event'
           might_sleep();                                                  =
        \
           ^
   include/linux/kernel.h:171:24: note: expanded from macro 'might_sleep'
   # define might_sleep() do { might_resched(); } while (0)
                          ^
   fs/btrfs/disk-io.c:4358:7: note: Assuming the condition is true
                      (atomic_read(&fs_info->defrag_running) =3D=3D 0));
                       ^
   include/linux/wait.h:343:6: note: expanded from macro 'wait_event'
           if (condition)                                                  =
        \
               ^~~~~~~~~
   fs/btrfs/disk-io.c:4357:2: note: Taking true branch
           wait_event(fs_info->transaction_wait,
           ^
   include/linux/wait.h:343:2: note: expanded from macro 'wait_event'
           if (condition)                                                  =
        \
           ^
   fs/btrfs/disk-io.c:4357:2: note:  Execution continues on line 4361
           wait_event(fs_info->transaction_wait,
           ^
   include/linux/wait.h:344:3: note: expanded from macro 'wait_event'
                   break;                                                  =
        \
                   ^
   fs/btrfs/disk-io.c:4372:6: note: Assuming the condition is false
           if (!sb_rdonly(fs_info->sb)) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/disk-io.c:4372:2: note: Taking false branch
           if (!sb_rdonly(fs_info->sb)) {
           ^
   fs/btrfs/disk-io.c:4397:6: note: Assuming the condition is false
           if (BTRFS_FS_ERROR(fs_info))
               ^
   fs/btrfs/ctree.h:3616:34: note: expanded from macro 'BTRFS_FS_ERROR'
   #define BTRFS_FS_ERROR(fs_info) (unlikely(test_bit(BTRFS_FS_STATE_ERROR,=
 \
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
   fs/btrfs/disk-io.c:4397:2: note: Taking true branch
           if (BTRFS_FS_ERROR(fs_info))
           ^
   fs/btrfs/disk-io.c:4398:3: note: Calling 'btrfs_error_commit_super'
                   btrfs_error_commit_super(fs_info);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/disk-io.c:4560:2: note: Calling 'btrfs_cleanup_transaction'
           btrfs_cleanup_transaction(fs_info);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/disk-io.c:4952:2: note: Loop condition is false. Execution cont=
inues on line 4987
           while (!list_empty(&fs_info->trans_list)) {
           ^
   fs/btrfs/disk-io.c:4991:2: note: Calling 'btrfs_destroy_all_delalloc_ino=
des'
           btrfs_destroy_all_delalloc_inodes(fs_info);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/disk-io.c:4767:2: note: Loop condition is true.  Entering loop =
body
           while (!list_empty(&splice)) {
           ^
   fs/btrfs/disk-io.c:4770:10: note: Calling 'btrfs_grab_root'
                   root =3D btrfs_grab_root(root);
                          ^~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/disk-io.h:99:6: note: Assuming 'root' is non-null
           if (!root)
               ^~~~~
   fs/btrfs/disk-io.h:99:2: note: Taking false branch
           if (!root)
           ^
   fs/btrfs/disk-io.h:101:6: note: Assuming the condition is true
           if (refcount_inc_not_zero(&root->refs))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/disk-io.h:101:2: note: Taking true branch
           if (refcount_inc_not_zero(&root->refs))

vim +102 fs/btrfs/disk-io.h

06ea65a398a250 Josef Bacik     2013-09-19   89  =

b0feb9d96e71a8 Miao Xie        2013-05-15   90  /*
b0feb9d96e71a8 Miao Xie        2013-05-15   91   * This function is used to=
 grab the root, and avoid it is freed when we
b0feb9d96e71a8 Miao Xie        2013-05-15   92   * access it. But it doesn'=
t ensure that the tree is not dropped.
b0feb9d96e71a8 Miao Xie        2013-05-15   93   *
b0feb9d96e71a8 Miao Xie        2013-05-15   94   * If you want to ensure th=
e whole tree is safe, you should use
b0feb9d96e71a8 Miao Xie        2013-05-15   95   * 	fs_info->subvol_srcu
b0feb9d96e71a8 Miao Xie        2013-05-15   96   */
0024652895e347 Josef Bacik     2020-01-24   97  static inline struct btrfs_=
root *btrfs_grab_root(struct btrfs_root *root)
b0feb9d96e71a8 Miao Xie        2013-05-15   98  {
4cdfd93002cb84 Josef Bacik     2020-01-24   99  	if (!root)
4cdfd93002cb84 Josef Bacik     2020-01-24  100  		return NULL;
0700cea7c8b387 Elena Reshetova 2017-03-03  101  	if (refcount_inc_not_zero(=
&root->refs))
b0feb9d96e71a8 Miao Xie        2013-05-15 @102  		return root;
b0feb9d96e71a8 Miao Xie        2013-05-15  103  	return NULL;
b0feb9d96e71a8 Miao Xie        2013-05-15  104  }
b0feb9d96e71a8 Miao Xie        2013-05-15  105  =


:::::: The code at line 102 was first introduced by commit
:::::: b0feb9d96e71a88d7eec56f41b8f23e92af889b0 Btrfs: introduce grab/put f=
unctions for the root of the fs/file tree

:::::: TO: Miao Xie <miaox@cn.fujitsu.com>
:::::: CC: Josef Bacik <jbacik@fusionio.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1625193837000131412==--

