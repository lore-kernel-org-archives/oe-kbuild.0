Content-Type: multipart/mixed; boundary="===============7701483404027274847=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/cifs/cifsacl.c:267:21: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Thu, 09 Dec 2021 23:22:45 +0800
Message-ID: <202112092330.UoF7QNos-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7701483404027274847==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2a987e65025e2b79c6d453b78cb5985ac6e5eb26
commit: a52f8a59aef46b59753e583bf4b28fccb069ce64 fortify: Explicitly disabl=
e Clang support
date:   3 months ago
:::::: branch date: 2 days ago
:::::: commit date: 3 months ago
config: i386-randconfig-c001-20211208 (https://download.01.org/0day-ci/arch=
ive/20211209/202112092330.UoF7QNos-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Da52f8a59aef46b59753e583bf4b28fccb069ce64
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a52f8a59aef46b59753e583bf4b28fccb069ce64
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   net/ipv6/mcast.c:1489:5: note: '?' condition is true
                                   if (!mark)
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
   net/ipv6/mcast.c:1489:5: note: Taking true branch
                                   if (!mark)
                                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/ipv6/mcast.c:1498:8: note: Assuming the condition is false
                           if (!(ma->mca_flags & MAF_GSQUERY) ||
                               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/ipv6/mcast.c:1498:8: note: Left side of '||' is false
                           if (!(ma->mca_flags & MAF_GSQUERY) ||
                               ^
   net/ipv6/mcast.c:1499:28: note: Access to field 'mld2q_nsrcs' results in=
 a dereference of a null pointer (loaded from variable 'mlh2')
                               mld_marksources(ma, ntohs(mlh2->mld2q_nsrcs)=
, mlh2->mld2q_srcs))
                                                   ^
   include/linux/byteorder/generic.h:142:18: note: expanded from macro 'nto=
hs'
   #define ntohs(x) ___ntohs(x)
                    ^        ~
   include/linux/byteorder/generic.h:137:21: note: expanded from macro '___=
ntohs'
   #define ___ntohs(x) __be16_to_cpu(x)
                       ^             ~
   include/uapi/linux/byteorder/little_endian.h:42:58: note: expanded from =
macro '__be16_to_cpu'
   #define __be16_to_cpu(x) __swab16((__force __u16)(__be16)(x))
                                                            ^~
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   fs/cifs/smb2transport.c:430:3: warning: Value stored to 'rc' is never re=
ad [clang-analyzer-deadcode.DeadStores]
                   rc =3D generate_key(ses, ptriplet->encryption.label,
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/smb2transport.c:430:3: note: Value stored to 'rc' is never read
                   rc =3D generate_key(ses, ptriplet->encryption.label,
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   fs/cifs/smb2misc.c:505:2: warning: Value stored to 'rc' is never read [c=
lang-analyzer-deadcode.DeadStores]
           rc =3D SMB2_lease_break(0, tlink_tcon(lw->tlink), lw->lease_key,
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/smb2misc.c:505:2: note: Value stored to 'rc' is never read
           rc =3D SMB2_lease_break(0, tlink_tcon(lw->tlink), lw->lease_key,
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   fs/cifs/smb2pdu.c:577:3: warning: Value stored to 'pneg_ctxt' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   pneg_ctxt +=3D ctxt_len;
                   ^            ~~~~~~~~
   fs/cifs/smb2pdu.c:577:3: note: Value stored to 'pneg_ctxt' is never read
                   pneg_ctxt +=3D ctxt_len;
                   ^            ~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
>> fs/cifs/cifsacl.c:267:21: warning: Assigned value is garbage or undefine=
d [clang-analyzer-core.uninitialized.Assign]
                   dst->authority[i] =3D src->authority[i];
                                     ^
   fs/cifs/cifsacl.c:1261:2: note: Assuming 'dacloffset' is not equal to 0
           if (dacloffset) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/cifs/cifsacl.c:1261:2: note: '?' condition is false
           if (dacloffset) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/cifs/cifsacl.c:1261:6: note: 'dacloffset' is not equal to 0
           if (dacloffset) {
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
   fs/cifs/cifsacl.c:1261:2: note: '?' condition is true
           if (dacloffset) {
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
   fs/cifs/cifsacl.c:1261:2: note: Taking true branch
           if (dacloffset) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/cifs/cifsacl.c:1263:3: note: '?' condition is false
                   if (end_of_acl < (char *)dacl_ptr + le16_to_cpu(dacl_ptr=
->size)) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/cifs/cifsacl.c:1263:3: note: Assuming the condition is false
                   if (end_of_acl < (char *)dacl_ptr + le16_to_cpu(dacl_ptr=
->size)) {
                   ^
   include/linux/compiler.h:56:44: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   fs/cifs/cifsacl.c:1263:3: note: '?' condition is false
                   if (end_of_acl < (char *)dacl_ptr + le16_to_cpu(dacl_ptr=
->size)) {
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
   fs/cifs/cifsacl.c:1263:3: note: Taking false branch
                   if (end_of_acl < (char *)dacl_ptr + le16_to_cpu(dacl_ptr=
->size)) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/cifs/cifsacl.c:1274:6: note: Assuming 'pnmode' is null
           if (pnmode && *pnmode !=3D NO_CHANGE_64) { /* chmod */
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/cifs/cifsacl.c:1274:13: note: Left side of '&&' is false
           if (pnmode && *pnmode !=3D NO_CHANGE_64) { /* chmod */

vim +267 fs/cifs/cifsacl.c

3514de3fd5fab5 Steve French   2016-10-13  257  =

f5065508897a92 Shyam Prasad N 2021-02-12  258  static __u16
36960e440ccf94 Jeff Layton    2012-11-03  259  cifs_copy_sid(struct cifs_si=
d *dst, const struct cifs_sid *src)
36960e440ccf94 Jeff Layton    2012-11-03  260  {
36f87ee70f754d Jeff Layton    2012-11-25  261  	int i;
f5065508897a92 Shyam Prasad N 2021-02-12  262  	__u16 size =3D 1 + 1 + 6;
36f87ee70f754d Jeff Layton    2012-11-25  263  =

36f87ee70f754d Jeff Layton    2012-11-25  264  	dst->revision =3D src->revi=
sion;
30c9d6cca52624 Jeff Layton    2012-11-25  265  	dst->num_subauth =3D min_t(=
u8, src->num_subauth, SID_MAX_SUB_AUTHORITIES);
36f87ee70f754d Jeff Layton    2012-11-25  266  	for (i =3D 0; i < NUM_AUTHS=
; ++i)
36f87ee70f754d Jeff Layton    2012-11-25 @267  		dst->authority[i] =3D src-=
>authority[i];
36f87ee70f754d Jeff Layton    2012-11-25  268  	for (i =3D 0; i < dst->num_=
subauth; ++i)
36f87ee70f754d Jeff Layton    2012-11-25  269  		dst->sub_auth[i] =3D src->=
sub_auth[i];
f5065508897a92 Shyam Prasad N 2021-02-12  270  	size +=3D (dst->num_subauth=
 * 4);
f5065508897a92 Shyam Prasad N 2021-02-12  271  =

f5065508897a92 Shyam Prasad N 2021-02-12  272  	return size;
36960e440ccf94 Jeff Layton    2012-11-03  273  }
36960e440ccf94 Jeff Layton    2012-11-03  274  =


:::::: The code at line 267 was first introduced by commit
:::::: 36f87ee70f754d04e55518853e6fb30ed4732dda cifs: make cifs_copy_sid ha=
ndle a source sid with variable size subauth arrays

:::::: TO: Jeff Layton <jlayton@redhat.com>
:::::: CC: Steve French <smfrench@gmail.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7701483404027274847==--

