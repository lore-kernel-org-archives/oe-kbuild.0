Content-Type: multipart/mixed; boundary="===============5650380165110788779=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 1/1] ceph: add getvxattr op
Date: Mon, 17 Jan 2022 21:58:27 +0800
Message-ID: <202201171930.DTzEiwER-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5650380165110788779==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220117034747.22229-2-mchangir@redhat.com>
References: <20220117034747.22229-2-mchangir@redhat.com>
TO: Milind Changire <milindchangire@gmail.com>

Hi Milind,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on ceph-client/for-linus]
[also build test WARNING on v5.16 next-20220117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Milind-Changire/ceph-add-g=
etvxattr-op-support/20220117-114947
base:   https://github.com/ceph/ceph-client.git for-linus
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: alpha-randconfig-c004-20220116 (https://download.01.org/0day-ci/arc=
hive/20220117/202201171930.DTzEiwER-lkp(a)intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.2.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/ed42f71060fc0c0c0c43a582f=
0bb817713836ddb
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Milind-Changire/ceph-add-getvxattr=
-op-support/20220117-114947
        git checkout ed42f71060fc0c0c0c43a582f0bb817713836ddb
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 O=3Dbuild_dir ARCH=3Dalpha SHELL=3D/bin/bash fs/ceph/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:20,
                    from include/linux/cpumask.h:10,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from fs/ceph/inode.c:4:
   fs/ceph/inode.c: In function 'ceph_do_getvxattr':
>> include/linux/kern_levels.h:5:25: warning: format '%u' expects argument =
of type 'unsigned int', but argument 2 has type 'size_t' {aka 'long unsigne=
d int'} [-Wformat=3D]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header=
 */
         |                         ^~~~~~
   include/linux/printk.h:422:25: note: in definition of macro 'printk_inde=
x_wrap'
     422 |                 _p_func(_fmt, ##__VA_ARGS__);                   =
        \
         |                         ^~~~
   include/linux/ceph/ceph_debug.h:26:25: note: in expansion of macro 'prin=
tk'
      26 |                         printk(KERN_DEBUG fmt, ##__VA_ARGS__);  \
         |                         ^~~~~~
   include/linux/kern_levels.h:15:25: note: in expansion of macro 'KERN_SOH'
      15 | #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages =
*/
         |                         ^~~~~~~~
   include/linux/ceph/ceph_debug.h:26:32: note: in expansion of macro 'KERN=
_DEBUG'
      26 |                         printk(KERN_DEBUG fmt, ##__VA_ARGS__);  \
         |                                ^~~~~~~~~~
   fs/ceph/inode.c:2326:9: note: in expansion of macro 'dout'
    2326 |         dout("do_getvxattr xattr_value_len:%u, size:%u\n", xattr=
_value_len, size);
         |         ^~~~
   include/linux/kern_levels.h:5:25: warning: format '%u' expects argument =
of type 'unsigned int', but argument 3 has type 'size_t' {aka 'long unsigne=
d int'} [-Wformat=3D]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header=
 */
         |                         ^~~~~~
   include/linux/printk.h:422:25: note: in definition of macro 'printk_inde=
x_wrap'
     422 |                 _p_func(_fmt, ##__VA_ARGS__);                   =
        \
         |                         ^~~~
   include/linux/ceph/ceph_debug.h:26:25: note: in expansion of macro 'prin=
tk'
      26 |                         printk(KERN_DEBUG fmt, ##__VA_ARGS__);  \
         |                         ^~~~~~
   include/linux/kern_levels.h:15:25: note: in expansion of macro 'KERN_SOH'
      15 | #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages =
*/
         |                         ^~~~~~~~
   include/linux/ceph/ceph_debug.h:26:32: note: in expansion of macro 'KERN=
_DEBUG'
      26 |                         printk(KERN_DEBUG fmt, ##__VA_ARGS__);  \
         |                                ^~~~~~~~~~
   fs/ceph/inode.c:2326:9: note: in expansion of macro 'dout'
    2326 |         dout("do_getvxattr xattr_value_len:%u, size:%u\n", xattr=
_value_len, size);
         |         ^~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  =

04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII=
 Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5650380165110788779==--

