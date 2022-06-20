Content-Type: multipart/mixed; boundary="===============9180103624984664040=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 03/10] ext4: Remove EA inode entry from mbcache on inode eviction
Date: Mon, 20 Jun 2022 08:32:49 +0800
Message-ID: <202206200847.jnigy6BH-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9180103624984664040==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 include/asm-generic/bug.h:97:17: warning: dereference of NULL 'ea_inode' [=
CWE-476] [-Wanalyzer-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220614160603.20566-3-jack@suse.cz>
References: <20220614160603.20566-3-jack@suse.cz>
TO: Jan Kara <jack@suse.cz>
TO: Ted Tso <tytso@mit.edu>
CC: linux-ext4(a)vger.kernel.org
CC: Ritesh Harjani <ritesh.list@gmail.com>
CC: Jan Kara <jack@suse.cz>
CC: stable(a)vger.kernel.org

Hi Jan,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tytso-ext4/dev]
[also build test WARNING on jack-fs/for_next linus/master v5.19-rc2 next-20=
220617]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Jan-Kara/ext4-Fix-po=
ssible-fs-corruption-due-to-xattr-races/20220615-000954
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-c002-20220619 (https://download.01.org/0day-ci/archi=
ve/20220620/202206200847.jnigy6BH-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d2f5812460a63288558=
be0c9ee0fedd060236275
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jan-Kara/ext4-Fix-possible-fs-corr=
uption-due-to-xattr-races/20220615-000954
        git checkout d2f5812460a63288558be0c9ee0fedd060236275
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arm/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:55,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/ext4/xattr.c:55:
   fs/ext4/xattr.c: In function 'ext4_xattr_inode_update_ref':
>> include/asm-generic/bug.h:97:17: warning: dereference of NULL 'ea_inode'=
 [CWE-476] [-Wanalyzer-null-dereference]
      97 |                 warn_slowpath_fmt(__FILE__, __LINE__, taint, arg=
);      \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:133:17: note: in expansion of macro '__WARN_pr=
intf'
     133 |                 __WARN_printf(TAINT_WARN, format);              =
        \
         |                 ^~~~~~~~~~~~~
   include/linux/once_lite.h:19:25: note: in expansion of macro 'WARN'
      19 |                         func(__VA_ARGS__);                      =
        \
         |                         ^~~~
   include/asm-generic/bug.h:151:9: note: in expansion of macro 'DO_ONCE_LI=
TE_IF'
     151 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |         ^~~~~~~~~~~~~~~
   fs/ext4/xattr.c:1013:17: note: in expansion of macro 'WARN_ONCE'
    1013 |                 WARN_ONCE(ref_count < 0, "EA inode %lu ref_count=
=3D%lld",
         |                 ^~~~~~~~~
     'ext4_xattr_delete_inode': event 1
       |
       | 2823 | int ext4_xattr_delete_inode(handle_t *handle, struct inode =
*inode,
       |      |     ^~~~~~~~~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'ext4_xattr_delete_inode'
       |
     'ext4_xattr_delete_inode': event 2
       |
       |cc1:
       | (2): '=1B[01m=1B[Kea_inode=1B[m=1B[K' is NULL
       |
     'ext4_xattr_delete_inode': events 3-5
       |
       | 2836 |         if (error < 0) {
       |      |            ^
       |      |            |
       |      |            (3) following 'false' branch (when 'error >=3D 0=
')...
       |......
       | 2841 |         if (ext4_has_feature_ea_inode(inode->i_sb) &&
       |      |         ~~ ~
       |      |         |  |
       |      |         |  (5) following 'true' branch...
       |      |         (4) ...to here
       |
     'ext4_xattr_delete_inode': event 6
       |
       |fs/ext4/ext4.h:1898:9:
       | 1898 |         return test_bit(bit + (offset), &EXT4_I(inode)->i_#=
#field);     \
       |      |         ^~~~~~
       |      |         |
       |      |         (6) ...to here
   fs/ext4/ext4.h:1922:1: note: in expansion of macro 'EXT4_INODE_BIT_FNS'
       | 1922 | EXT4_INODE_BIT_FNS(state, state_flags, 0)
       |      | ^~~~~~~~~~~~~~~~~~
       |
     'ext4_xattr_delete_inode': events 7-15
       |
       |fs/ext4/xattr.c:2841:52:
       | 2841 |         if (ext4_has_feature_ea_inode(inode->i_sb) &&
       |      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
       |      |                                                    |
       |      |                                                    (7) foll=
owing 'true' branch...
       | 2842 |             ext4_test_inode_state(inode, EXT4_STATE_XATTR))=
 {
       |      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       | 2843 | =

       | 2844 |                 error =3D ext4_get_inode_loc(inode, &iloc);
       |      |                 ~~~~~                               =

       |      |                 |
       |      |                 (8) ...to here
       | 2845 |                 if (error) {
       |      |                    ~                                =

       |      |                    |
       |      |                    (9) following 'false' branch (when 'erro=
r =3D=3D 0')...
       |......
       | 2850 |                 error =3D ext4_journal_get_write_access(han=
dle, inode->i_sb,
       |      |                 ~~~~~                               =

       |      |                 |
       |      |                 (10) ...to here
       | 2851 |                                                 iloc.bh, EX=
T4_JTR_NONE);
       | 2852 |                 if (error) {
       |      |                    ~                                =

       |      |                    |
       |      |                    (11) following 'false' branch (when 'err=
or =3D=3D 0')...
       |......
       | 2858 |                 header =3D IHDR(inode, ext4_raw_inode(&iloc=
));
       |      |                 ~~~~~~                              =

       |      |                 |
       |      |                 (12) ...to here
       | 2859 |                 if (header->h_magic =3D=3D cpu_to_le32(EXT4=
_XATTR_MAGIC))
       |      |                    ~                                =

       |      |                    |
       |      |                    (13) following 'true' branch...
       | 2860 |                         ext4_xattr_inode_dec_ref_all(handle=
, inode, iloc.bh,
       |      |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
       |      |                         |
       |      |                         (14) ...to here
       |      |                         (15) calling 'ext4_xattr_inode_dec_=
ref_all' from 'ext4_xattr_delete_inode'
       | 2861 |                                                      IFIRST=
(header),
       |      |                                                      ~~~~~~=
~~~~~~~~~
       | 2862 |                                                      false =
/* block_csum */,
       |      |                                                      ~~~~~~=
~~~~~~~~~~~~~~~~~
       | 2863 |                                                      ea_ino=
de_array,
       |      |                                                      ~~~~~~=
~~~~~~~~~
       | 2864 |                                                      extra_=
credits,
       |      |                                                      ~~~~~~=
~~~~~~~~
--
              |......
              | 1155 |                 err =3D ext4_journal_ensure_credits_=
fn(handle, credits, credits,
              |      |                 ~~~          =

              |      |                 |
              |      |                 (22) ...to here
              |......
              | 1159 |                 if (err < 0) {
              |      |                    ~         =

              |      |                    |
              |      |                    (23) following 'false' branch (wh=
en 'err >=3D 0')...
              |......
              | 1164 |                 if (err > 0) {
              |      |                 ~~           =

              |      |                 |
              |      |                 (24) ...to here
              |
              +--> 'ext4_xattr_inode_update_ref': events 26-29
                     |
                     |  984 | static int ext4_xattr_inode_update_ref(handle=
_t *handle, struct inode *ea_inode,
                     |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |            |
                     |      |            (26) entry to 'ext4_xattr_inode_up=
date_ref'
                     |......
                     |  994 |         if (ret)
                     |      |            ~
                     |      |            |
                     |      |            (27) following 'false' branch (whe=
n 'ret =3D=3D 0')...
                     |......
                     |  997 |         ref_count =3D ext4_xattr_inode_get_re=
f(ea_inode);
                     |      |         ~~~~~~~~~
                     |      |         |
                     |      |         (28) ...to here
                     |......
                     | 1001 |         if (ref_change > 0) {
                     |      |            ~
                     |      |            |
                     |      |            (29) following 'false' branch (whe=
n 'ref_change <=3D 0')...
                     |
                   'ext4_xattr_inode_update_ref': event 30
                     |
                     |include/linux/once_lite.h:13:9:
                     |   13 |         ({                                   =
                           \
                     |      |         ^
                     |      |         |
                     |      |         (30) ...to here
   include/asm-generic/bug.h:151:9: note: in expansion of macro 'DO_ONCE_LI=
TE_IF'
                     |  151 |         DO_ONCE_LITE_IF(condition, WARN, 1, f=
ormat)
                     |      |         ^~~~~~~~~~~~~~~
   fs/ext4/xattr.c:1013:17: note: in expansion of macro 'WARN_ONCE'
                     | 1013 |                 WARN_ONCE(ref_count < 0, "EA =
inode %lu ref_count=3D%lld",
                     |      |                 ^~~~~~~~~
                     |
                   'ext4_xattr_inode_update_ref': event 31
                     |
                     |include/linux/once_lite.h:17:20:
                     |   17 |                 if (unlikely(__ret_do_once &&=
 !__already_done)) {       \
                     |      |                    ^
                     |      |                    |
                     |      |                    (31) following 'true' bran=
ch...
   include/asm-generic/bug.h:151:9: note: in expansion of macro 'DO_ONCE_LI=
TE_IF'
                     |  151 |         DO_ONCE_LITE_IF(condition, WARN, 1, f=
ormat)
                     |      |         ^~~~~~~~~~~~~~~
   fs/ext4/xattr.c:1013:17: note: in expansion of macro 'WARN_ONCE'
                     | 1013 |                 WARN_ONCE(ref_count < 0, "EA =
inode %lu ref_count=3D%lld",
                     |      |                 ^~~~~~~~~
                     |
                   'ext4_xattr_inode_update_ref': event 32
                     |
                     |include/linux/once_lite.h:18:25:
                     |   18 |                         __already_done =3D tr=
ue;                          \
                     |      |                         ^~~~~~~~~~~~~~
                     |      |                         |
                     |      |                         (32) ...to here
   include/asm-generic/bug.h:151:9: note: in expansion of macro 'DO_ONCE_LI=
TE_IF'
                     |  151 |         DO_ONCE_LITE_IF(condition, WARN, 1, f=
ormat)
                     |      |         ^~~~~~~~~~~~~~~
   fs/ext4/xattr.c:1013:17: note: in expansion of macro 'WARN_ONCE'
                     | 1013 |                 WARN_ONCE(ref_count < 0, "EA =
inode %lu ref_count=3D%lld",
                     |      |                 ^~~~~~~~~
                     |
                   'ext4_xattr_inode_update_ref': event 33
                     |
                     |include/asm-generic/bug.h:97:17:
                     |   97 |                 warn_slowpath_fmt(__FILE__, _=
_LINE__, taint, arg);      \
                     |      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~
                     |      |                 |
                     |      |                 (33) dereference of NULL 'ea_=
inode'
   include/asm-generic/bug.h:133:17: note: in expansion of macro '__WARN_pr=
intf'
                     |  133 |                 __WARN_printf(TAINT_WARN, for=
mat);                      \
                     |      |                 ^~~~~~~~~~~~~
   include/linux/once_lite.h:19:25: note: in expansion of macro 'WARN'
                     |   19 |                         func(__VA_ARGS__);   =
                           \
                     |      |                         ^~~~
   include/asm-generic/bug.h:151:9: note: in expansion of macro 'DO_ONCE_LI=
TE_IF'
                     |  151 |         DO_ONCE_LITE_IF(condition, WARN, 1, f=
ormat)
                     |      |         ^~~~~~~~~~~~~~~
   fs/ext4/xattr.c:1013:17: note: in expansion of macro 'WARN_ONCE'
                     | 1013 |                 WARN_ONCE(ref_count < 0, "EA =
inode %lu ref_count=3D%lld",
                     |      |                 ^~~~~~~~~
                     |
>> include/asm-generic/bug.h:97:17: warning: dereference of NULL 'ea_inode'=
 [CWE-476] [-Wanalyzer-null-dereference]
      97 |                 warn_slowpath_fmt(__FILE__, __LINE__, taint, arg=
);      \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:133:17: note: in expansion of macro '__WARN_pr=
intf'
     133 |                 __WARN_printf(TAINT_WARN, format);              =
        \
         |                 ^~~~~~~~~~~~~
   include/linux/once_lite.h:19:25: note: in expansion of macro 'WARN'
      19 |                         func(__VA_ARGS__);                      =
        \
         |                         ^~~~
   include/asm-generic/bug.h:151:9: note: in expansion of macro 'DO_ONCE_LI=
TE_IF'
     151 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |         ^~~~~~~~~~~~~~~
   fs/ext4/xattr.c:1017:25: note: in expansion of macro 'WARN_ONCE'
    1017 |                         WARN_ONCE(ea_inode->i_nlink !=3D 1,
         |                         ^~~~~~~~~
     'ext4_xattr_delete_inode': event 1
       |
       | 2823 | int ext4_xattr_delete_inode(handle_t *handle, struct inode =
*inode,
       |      |     ^~~~~~~~~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'ext4_xattr_delete_inode'
       |
     'ext4_xattr_delete_inode': event 2
       |
       |cc1:
       | (2): '=1B[01m=1B[Kea_inode=1B[m=1B[K' is NULL
       |
     'ext4_xattr_delete_inode': events 3-5
       |
       | 2836 |         if (error < 0) {
       |      |            ^
       |      |            |
       |      |            (3) following 'false' branch (when 'error >=3D 0=
')...
       |......
       | 2841 |         if (ext4_has_feature_ea_inode(inode->i_sb) &&
       |      |         ~~ ~
       |      |         |  |
       |      |         |  (5) following 'true' branch...
       |      |         (4) ...to here
       |
     'ext4_xattr_delete_inode': event 6
       |
       |fs/ext4/ext4.h:1898:9:
       | 1898 |         return test_bit(bit + (offset), &EXT4_I(inode)->i_#=
#field);     \
       |      |         ^~~~~~
       |      |         |
       |      |         (6) ...to here
   fs/ext4/ext4.h:1922:1: note: in expansion of macro 'EXT4_INODE_BIT_FNS'
       | 1922 | EXT4_INODE_BIT_FNS(state, state_flags, 0)
       |      | ^~~~~~~~~~~~~~~~~~
       |
     'ext4_xattr_delete_inode': events 7-15
       |
       |fs/ext4/xattr.c:2841:52:
       | 2841 |         if (ext4_has_feature_ea_inode(inode->i_sb) &&
       |      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
       |      |                                                    |
       |      |                                                    (7) foll=
owing 'true' branch...
       | 2842 |             ext4_test_inode_state(inode, EXT4_STATE_XATTR))=
 {
       |      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       | 2843 | =

       | 2844 |                 error =3D ext4_get_inode_loc(inode, &iloc);
       |      |                 ~~~~~                               =

       |      |                 |
       |      |                 (8) ...to here
       | 2845 |                 if (error) {
       |      |                    ~                                =

       |      |                    |
       |      |                    (9) following 'false' branch (when 'erro=
r =3D=3D 0')...
       |......
       | 2850 |                 error =3D ext4_journal_get_write_access(han=
dle, inode->i_sb,
       |      |                 ~~~~~                               =

       |      |                 |
       |      |                 (10) ...to here
       | 2851 |                                                 iloc.bh, EX=
T4_JTR_NONE);
       | 2852 |                 if (error) {
       |      |                    ~                                =

       |      |                    |
       |      |                    (11) following 'false' branch (when 'err=
or =3D=3D 0')...
       |......
       | 2858 |                 header =3D IHDR(inode, ext4_raw_inode(&iloc=
));
       |      |                 ~~~~~~                              =

       |      |                 |
       |      |                 (12) ...to here
       | 2859 |                 if (header->h_magic =3D=3D cpu_to_le32(EXT4=
_XATTR_MAGIC))
       |      |                    ~                                =

       |      |                    |
       |      |                    (13) following 'true' branch...
       | 2860 |                         ext4_xattr_inode_dec_ref_all(handle=
, inode, iloc.bh,
       |      |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
       |      |                         |
       |      |                         (14) ...to here
       |      |                         (15) calling 'ext4_xattr_inode_dec_=
ref_all' from 'ext4_xattr_delete_inode'
       | 2861 |                                                      IFIRST=
(header),
       |      |                                                      ~~~~~~=
~~~~~~~~~
       | 2862 |                                                      false =
/* block_csum */,
       |      |                                                      ~~~~~~=
~~~~~~~~~~~~~~~~~
       | 2863 |                                                      ea_ino=
de_array,
       |      |                                                      ~~~~~~=
~~~~~~~~~
       | 2864 |                                                      extra_=
credits,
       |      |                                                      ~~~~~~=
~~~~~~~~

vim +/ea_inode +97 include/asm-generic/bug.h

^1da177e4c3f41 Linus Torvalds   2005-04-16   73  =

af9379c7121d55 David Brownell   2009-01-06   74  /*
af9379c7121d55 David Brownell   2009-01-06   75   * WARN(), WARN_ON(), WARN=
_ON_ONCE, and so on can be used to report
96c6a32ccb55a3 Dmitry Vyukov    2018-08-21   76   * significant kernel issu=
es that need prompt attention if they should ever
96c6a32ccb55a3 Dmitry Vyukov    2018-08-21   77   * appear at runtime.
96c6a32ccb55a3 Dmitry Vyukov    2018-08-21   78   *
96c6a32ccb55a3 Dmitry Vyukov    2018-08-21   79   * Do not use these macros=
 when checking for invalid external inputs
96c6a32ccb55a3 Dmitry Vyukov    2018-08-21   80   * (e.g. invalid system ca=
ll arguments, or invalid data coming from
96c6a32ccb55a3 Dmitry Vyukov    2018-08-21   81   * network/devices), and o=
n transient conditions like ENOMEM or EAGAIN.
96c6a32ccb55a3 Dmitry Vyukov    2018-08-21   82   * These macros should be =
used for recoverable kernel issues only.
96c6a32ccb55a3 Dmitry Vyukov    2018-08-21   83   * For invalid external in=
puts, transient conditions, etc use
96c6a32ccb55a3 Dmitry Vyukov    2018-08-21   84   * pr_err[_once/_ratelimit=
ed]() followed by dump_stack(), if necessary.
96c6a32ccb55a3 Dmitry Vyukov    2018-08-21   85   * Do not include "BUG"/"W=
ARNING" in format strings manually to make these
96c6a32ccb55a3 Dmitry Vyukov    2018-08-21   86   * conditions distinguisha=
ble from kernel issues.
96c6a32ccb55a3 Dmitry Vyukov    2018-08-21   87   *
96c6a32ccb55a3 Dmitry Vyukov    2018-08-21   88   * Use the versions with p=
rintk format strings to provide better diagnostics.
af9379c7121d55 David Brownell   2009-01-06   89   */
d4bce140b4e739 Kees Cook        2019-09-25   90  #ifndef __WARN_FLAGS
b9075fa968a0a4 Joe Perches      2011-10-31   91  extern __printf(4, 5)
ee8711336c5170 Kees Cook        2019-09-25   92  void warn_slowpath_fmt(con=
st char *file, const int line, unsigned taint,
b9075fa968a0a4 Joe Perches      2011-10-31   93  		       const char *fmt, =
...);
f2f84b05e02b77 Kees Cook        2019-09-25   94  #define __WARN()		__WARN_p=
rintf(TAINT_WARN, NULL)
5916d5f9b33473 Thomas Gleixner  2020-03-13   95  #define __WARN_printf(tain=
t, arg...) do {				\
5916d5f9b33473 Thomas Gleixner  2020-03-13   96  		instrumentation_begin();=
				\
5916d5f9b33473 Thomas Gleixner  2020-03-13  @97  		warn_slowpath_fmt(__FILE=
__, __LINE__, taint, arg);	\
5916d5f9b33473 Thomas Gleixner  2020-03-13   98  		instrumentation_end();		=
			\
5916d5f9b33473 Thomas Gleixner  2020-03-13   99  	} while (0)
a8f18b909c0a3f Arjan van de Ven 2008-07-25  100  #else
a7bed27af194aa Kees Cook        2017-11-17  101  extern __printf(1, 2) void=
 __warn_printk(const char *fmt, ...);
a44f71a9ab99b5 Kees Cook        2019-09-25  102  #define __WARN()		__WARN_F=
LAGS(BUGFLAG_TAINT(TAINT_WARN))
d4bce140b4e739 Kees Cook        2019-09-25  103  #define __WARN_printf(tain=
t, arg...) do {				\
5916d5f9b33473 Thomas Gleixner  2020-03-13  104  		instrumentation_begin();=
				\
d4bce140b4e739 Kees Cook        2019-09-25  105  		__warn_printk(arg);					\
a44f71a9ab99b5 Kees Cook        2019-09-25  106  		__WARN_FLAGS(BUGFLAG_NO_=
CUT_HERE | BUGFLAG_TAINT(taint));\
5916d5f9b33473 Thomas Gleixner  2020-03-13  107  		instrumentation_end();		=
			\
6b15f678fb7d5e Drew Davenport   2019-07-16  108  	} while (0)
2da1ead4d5f7fa Kees Cook        2019-09-25  109  #define WARN_ON_ONCE(condi=
tion) ({				\
2da1ead4d5f7fa Kees Cook        2019-09-25  110  	int __ret_warn_on =3D !!(=
condition);			\
2da1ead4d5f7fa Kees Cook        2019-09-25  111  	if (unlikely(__ret_warn_o=
n))				\
2da1ead4d5f7fa Kees Cook        2019-09-25  112  		__WARN_FLAGS(BUGFLAG_ONC=
E |			\
2da1ead4d5f7fa Kees Cook        2019-09-25  113  			     BUGFLAG_TAINT(TAIN=
T_WARN));	\
2da1ead4d5f7fa Kees Cook        2019-09-25  114  	unlikely(__ret_warn_on);	=
			\
2da1ead4d5f7fa Kees Cook        2019-09-25  115  })
3a6a62f96f168d Olof Johansson   2008-01-30  116  #endif
3a6a62f96f168d Olof Johansson   2008-01-30  117  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============9180103624984664040==--

