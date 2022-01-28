Content-Type: multipart/mixed; boundary="===============1758226859043937559=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kees:for-next/memcpy 7/7] include/linux/fortify-string.h:137:3: warning: Null pointer passed as 1st argument to memory copy function [clang-analyzer-unix.cstring.NullArg]
Date: Fri, 28 Jan 2022 20:19:14 +0800
Message-ID: <202201282038.fAJRojv6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1758226859043937559==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-=
next/memcpy
head:   7db6d0c94a3589eaaa2e71abb6f9218fcc16ebbb
commit: 7db6d0c94a3589eaaa2e71abb6f9218fcc16ebbb [7/7] fortify: Work around=
 Clang inlining bugs
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20128/202201282038.fAJRojv6-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f32dcc=
b9a43b02ce4e540d6ba5dbbdb188f2dc7d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/co=
mmit/?id=3D7db6d0c94a3589eaaa2e71abb6f9218fcc16ebbb
        git remote add kees https://git.kernel.org/pub/scm/linux/kernel/git=
/kees/linux.git
        git fetch --no-tags kees for-next/memcpy
        git checkout 7db6d0c94a3589eaaa2e71abb6f9218fcc16ebbb
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   fs/nls/nls_base.c:227:10: warning: Dereference of null pointer [clang-an=
alyzer-core.NullDereference]
                           *op++ =3D (u8) u;
                           ~~~~~~^~~~~~~~
   fs/nls/nls_base.c:194:9: note: Assuming 'inlen' is > 0
           while (inlen > 0 && maxout > 0) {
                  ^~~~~~~~~
   fs/nls/nls_base.c:194:9: note: Left side of '&&' is true
   fs/nls/nls_base.c:194:22: note: Assuming 'maxout' is > 0
           while (inlen > 0 && maxout > 0) {
                               ^~~~~~~~~~
   fs/nls/nls_base.c:194:2: note: Loop condition is true.  Entering loop bo=
dy
           while (inlen > 0 && maxout > 0) {
           ^
   fs/nls/nls_base.c:195:7: note: Calling 'get_utf16'
                   u =3D get_utf16(*pwcs, endian);
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/nls/nls_base.c:176:2: note: Control jumps to the 'default' case at li=
ne 177
           switch (endian) {
           ^
   fs/nls/nls_base.c:178:3: note: Returning value (loaded from 'c'), which =
participates in a condition later
                   return c;
                   ^~~~~~~~
   fs/nls/nls_base.c:195:7: note: Returning from 'get_utf16'
                   u =3D get_utf16(*pwcs, endian);
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/nls/nls_base.c:196:7: note: Assuming 'u' is not equal to 0
                   if (!u)
                       ^~
   fs/nls/nls_base.c:196:3: note: Taking false branch
                   if (!u)
                   ^
   fs/nls/nls_base.c:200:7: note: Assuming 'u' is > 127
                   if (u > 0x7f) {
                       ^~~~~~~~
   fs/nls/nls_base.c:200:3: note: Taking true branch
                   if (u > 0x7f) {
                   ^
   fs/nls/nls_base.c:201:8: note: Assuming the condition is false
                           if ((u & SURROGATE_MASK) =3D=3D SURROGATE_PAIR) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nls/nls_base.c:201:4: note: Taking false branch
                           if ((u & SURROGATE_MASK) =3D=3D SURROGATE_PAIR) {
                           ^
   fs/nls/nls_base.c:220:4: note: Taking false branch
                           if (size =3D=3D -1) {
                           ^
   fs/nls/nls_base.c:194:9: note: Assuming 'inlen' is > 0
           while (inlen > 0 && maxout > 0) {
                  ^~~~~~~~~
   fs/nls/nls_base.c:194:9: note: Left side of '&&' is true
   fs/nls/nls_base.c:194:22: note: 'maxout' is > 0
           while (inlen > 0 && maxout > 0) {
                               ^~~~~~
   fs/nls/nls_base.c:194:2: note: Loop condition is true.  Entering loop bo=
dy
           while (inlen > 0 && maxout > 0) {
           ^
   fs/nls/nls_base.c:195:7: note: Calling 'get_utf16'
                   u =3D get_utf16(*pwcs, endian);
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/nls/nls_base.c:176:2: note: Control jumps to the 'default' case at li=
ne 177
           switch (endian) {
           ^
   fs/nls/nls_base.c:178:3: note: Returning value (loaded from 'c'), which =
participates in a condition later
                   return c;
                   ^~~~~~~~
   fs/nls/nls_base.c:195:7: note: Returning from 'get_utf16'
                   u =3D get_utf16(*pwcs, endian);
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/nls/nls_base.c:196:7: note: Assuming 'u' is not equal to 0
                   if (!u)
                       ^~
   fs/nls/nls_base.c:196:3: note: Taking false branch
                   if (!u)
                   ^
   fs/nls/nls_base.c:200:7: note: Assuming 'u' is <=3D 127
                   if (u > 0x7f) {
                       ^~~~~~~~
   fs/nls/nls_base.c:200:3: note: Taking false branch
                   if (u > 0x7f) {
                   ^
   fs/nls/nls_base.c:227:5: note: Null pointer value stored to 'op'
                           *op++ =3D (u8) u;
                            ^~~~
   fs/nls/nls_base.c:227:10: note: Dereference of null pointer
                           *op++ =3D (u8) u;
                           ~~~~~~^~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   fs/dlm/config.c:723:4: warning: Call to function 'strcat' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcat(buf, buf0);
                           ^~~~~~
   fs/dlm/config.c:723:4: note: Call to function 'strcat' is insecure as it=
 does not provide bounding of the memory buffer. Replace unbounded copy fun=
ctions with analogous functions that support length arguments such as 'strl=
cat'. CWE-119
                           strcat(buf, buf0);
                           ^~~~~~
>> include/linux/fortify-string.h:137:3: warning: Null pointer passed as 1s=
t argument to memory copy function [clang-analyzer-unix.cstring.NullArg]
                   __underlying_memcpy(p, q, len);
                   ^
   include/linux/fortify-string.h:43:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^
   fs/dlm/config.c:125:10: note: Passing null pointer value via 1st paramet=
er 'p'
           strlcpy(cl->cl_cluster_name, buf, sizeof(cl->cl_cluster_name));
                   ^
   include/linux/fortify-string.h:114:44: note: expanded from macro 'strlcp=
y'
   #define strlcpy(p, q, s) __fortify_strlcpy(p, q, s,                     \
                                              ^
   fs/dlm/config.c:125:2: note: Calling '__fortify_strlcpy'
           strlcpy(cl->cl_cluster_name, buf, sizeof(cl->cl_cluster_name));
           ^
   include/linux/fortify-string.h:114:26: note: expanded from macro 'strlcp=
y'
   #define strlcpy(p, q, s) __fortify_strlcpy(p, q, s,                     \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:125:27: note: Left side of '&&' is false
           if (p_size =3D=3D (size_t)-1 && q_size =3D=3D (size_t)-1)
                                    ^
   include/linux/fortify-string.h:128:9: note: 'q_len' is >=3D 'size'
           len =3D (q_len >=3D size) ? size - 1 : q_len;
                  ^~~~~
   include/linux/fortify-string.h:128:8: note: '?' condition is true
           len =3D (q_len >=3D size) ? size - 1 : q_len;
                 ^
   include/linux/fortify-string.h:129:33: note: Left side of '&&' is false
           if (__builtin_constant_p(size) && __builtin_constant_p(q_len) &&=
 size) {
                                          ^
   include/linux/fortify-string.h:134:6: note: 'size' is 64
           if (size) {
               ^~~~
   include/linux/fortify-string.h:134:2: note: Taking true branch
           if (size) {
           ^
   include/linux/fortify-string.h:135:7: note: 'len' is < 'p_size'
                   if (len >=3D p_size)
                       ^~~
   include/linux/fortify-string.h:135:3: note: Taking false branch
                   if (len >=3D p_size)
                   ^
   include/linux/fortify-string.h:137:3: note: Null pointer passed as 1st a=
rgument to memory copy function
                   __underlying_memcpy(p, q, len);
                   ^                   ~
   include/linux/fortify-string.h:43:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   include/linux/list.h:818:10: warning: Access to field 'pprev' results in=
 a dereference of a null pointer (loaded from variable 'h') [clang-analyzer=
-core.NullDereference]
           return !h->pprev;
                   ^
   kernel/ucount.c:257:23: note: Assuming pointer value is null
           for (iter =3D ucounts; iter; iter =3D iter->ns->ucounts) {
                                ^~~~
   kernel/ucount.c:257:2: note: Loop condition is false. Execution continue=
s on line 261
           for (iter =3D ucounts; iter; iter =3D iter->ns->ucounts) {
           ^
   kernel/ucount.c:261:14: note: Passing null pointer value via 1st paramet=
er 'ucounts'
           put_ucounts(ucounts);
                       ^~~~~~~
   kernel/ucount.c:261:2: note: Calling 'put_ucounts'
           put_ucounts(ucounts);
           ^~~~~~~~~~~~~~~~~~~~
   kernel/ucount.c:210:6: note: Assuming the condition is true
           if (atomic_dec_and_lock_irqsave(&ucounts->count, &ucounts_lock, =
flags)) {
               ^
   include/linux/spinlock.h:476:21: note: expanded from macro 'atomic_dec_a=
nd_lock_irqsave'
                   __cond_lock(lock, _atomic_dec_and_lock_irqsave(atomic, l=
ock, &(flags)))
                   ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:48:28: note: expanded from macro '__cond_=
lock'
   # define __cond_lock(x,c) (c)
                              ^
   kernel/ucount.c:210:2: note: Taking true branch
           if (atomic_dec_and_lock_irqsave(&ucounts->count, &ucounts_lock, =
flags)) {
           ^
   kernel/ucount.c:211:18: note: Passing null pointer value via 1st paramet=
er 'n'
                   hlist_del_init(&ucounts->node);
                                  ^~~~~~~~~~~~~~
   kernel/ucount.c:211:3: note: Calling 'hlist_del_init'
                   hlist_del_init(&ucounts->node);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:875:22: note: Passing null pointer value via 1st pa=
rameter 'h'
           if (!hlist_unhashed(n)) {
                               ^
   include/linux/list.h:875:7: note: Calling 'hlist_unhashed'
           if (!hlist_unhashed(n)) {
                ^~~~~~~~~~~~~~~~~
   include/linux/list.h:818:10: note: Access to field 'pprev' results in a =
dereference of a null pointer (loaded from variable 'h')
           return !h->pprev;
                   ^
   kernel/ucount.c:340:2: warning: Use of memory after it is freed [clang-a=
nalyzer-unix.Malloc]
           do_dec_rlimit_put_ucounts(ucounts, iter, type);
--
           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   drivers/target/iscsi/iscsi_target.c:2606:12: note: Assuming '__UNIQUE_ID=
___x863' is >=3D '__UNIQUE_ID___y864'
           rx_size =3D min(cmd->se_cmd.data_length - cmd->write_data_done, =
length);
                     ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
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
   drivers/target/iscsi/iscsi_target.c:2606:12: note: '?' condition is false
           rx_size =3D min(cmd->se_cmd.data_length - cmd->write_data_done, =
length);
                     ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
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
   drivers/target/iscsi/iscsi_target.c:2610:6: note: Assuming 'iov_ret' is =
>=3D 0
           if (iov_ret < 0)
               ^~~~~~~~~~~
   drivers/target/iscsi/iscsi_target.c:2610:2: note: Taking false branch
           if (iov_ret < 0)
           ^
   drivers/target/iscsi/iscsi_target.c:2615:6: note: 'rx_size' is >=3D 'len=
gth'
           if (rx_size < length) {
               ^~~~~~~
   drivers/target/iscsi/iscsi_target.c:2615:2: note: Taking false branch
           if (rx_size < length) {
           ^
   drivers/target/iscsi/iscsi_target.c:2633:6: note: Assuming 'padding' is =
equal to 0
           if (padding !=3D 0) {
               ^~~~~~~~~~~~
   drivers/target/iscsi/iscsi_target.c:2633:2: note: Taking false branch
           if (padding !=3D 0) {
           ^
   drivers/target/iscsi/iscsi_target.c:2639:6: note: Assuming field 'DataDi=
gest' is 0
           if (conn->conn_ops->DataDigest) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/iscsi/iscsi_target.c:2639:2: note: Taking false branch
           if (conn->conn_ops->DataDigest) {
           ^
   drivers/target/iscsi/iscsi_target.c:2645:15: note: Assuming 'iov_count' =
is <=3D field 'orig_iov_data_count'
           WARN_ON_ONCE(iov_count > cmd->orig_iov_data_count);
                        ^
   include/asm-generic/bug.h:104:25: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_on =3D !!(condition);                      \
                                  ^~~~~~~~~
   drivers/target/iscsi/iscsi_target.c:2645:2: note: Taking false branch
           WARN_ON_ONCE(iov_count > cmd->orig_iov_data_count);
           ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   drivers/target/iscsi/iscsi_target.c:2650:6: note: Assuming 'rx_got' is e=
qual to 'rx_size'
           if (rx_got !=3D rx_size) {
               ^~~~~~~~~~~~~~~~~
   drivers/target/iscsi/iscsi_target.c:2650:2: note: Taking false branch
           if (rx_got !=3D rx_size) {
           ^
   drivers/target/iscsi/iscsi_target.c:2655:6: note: Assuming field 'DataDi=
gest' is not equal to 0
           if (conn->conn_ops->DataDigest) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/iscsi/iscsi_target.c:2655:2: note: Taking true branch
           if (conn->conn_ops->DataDigest) {
           ^
   drivers/target/iscsi/iscsi_target.c:2662:16: note: The left operand of '=
!=3D' is a garbage value
                   if (checksum !=3D data_crc) {
                       ~~~~~~~~ ^
   Suppressed 12 warnings (11 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/net/wireless/st/cw1200/txrx.c:756:3: warning: Value stored to 'r=
et' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D -ENOMEM;
                   ^     ~~~~~~~
   drivers/net/wireless/st/cw1200/txrx.c:756:3: note: Value stored to 'ret'=
 is never read
                   ret =3D -ENOMEM;
                   ^     ~~~~~~~
>> include/linux/fortify-string.h:393:9: warning: Null pointer passed as 1s=
t argument to memory comparison function [clang-analyzer-unix.cstring.NullA=
rg]
           return __underlying_memcmp(p, q, size);
                  ^
   include/linux/fortify-string.h:42:29: note: expanded from macro '__under=
lying_memcmp'
   #define __underlying_memcmp     __builtin_memcmp
                                   ^
   drivers/net/wireless/st/cw1200/txrx.c:1016:13: note: Assuming field 'vif=
' is null
           bool p2p =3D priv->vif && priv->vif->p2p;
                      ^~~~~~~~~
   drivers/net/wireless/st/cw1200/txrx.c:1016:23: note: Left side of '&&' i=
s false
           bool p2p =3D priv->vif && priv->vif->p2p;
                                ^
   drivers/net/wireless/st/cw1200/txrx.c:1020:6: note: Assuming field 'mode=
' is not equal to NL80211_IFTYPE_UNSPECIFIED
           if (priv->mode =3D=3D NL80211_IFTYPE_UNSPECIFIED) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/st/cw1200/txrx.c:1020:2: note: Taking false branch
           if (priv->mode =3D=3D NL80211_IFTYPE_UNSPECIFIED) {
           ^
   drivers/net/wireless/st/cw1200/txrx.c:1025:6: note: Assuming 'link_id' i=
s 0
           if (link_id && link_id <=3D CW1200_MAX_STA_IN_AP_MODE) {
               ^~~~~~~
   drivers/net/wireless/st/cw1200/txrx.c:1025:14: note: Left side of '&&' i=
s false
           if (link_id && link_id <=3D CW1200_MAX_STA_IN_AP_MODE) {
                       ^
   drivers/net/wireless/st/cw1200/txrx.c:1031:13: note: 'p2p' is false
           } else if (p2p &&
                      ^~~
   drivers/net/wireless/st/cw1200/txrx.c:1031:17: note: Left side of '&&' i=
s false
           } else if (p2p &&
                          ^
   drivers/net/wireless/st/cw1200/txrx.c:1042:6: note: 'link_id' is 0
           if (link_id && p2p &&
               ^~~~~~~
   drivers/net/wireless/st/cw1200/txrx.c:1042:14: note: Left side of '&&' i=
s false
           if (link_id && p2p &&
                       ^
   drivers/net/wireless/st/cw1200/txrx.c:1054:6: note: Assuming field 'stat=
us' is 0
           if (arg->status) {
               ^~~~~~~~~~~
   drivers/net/wireless/st/cw1200/txrx.c:1054:2: note: Taking false branch
           if (arg->status) {
           ^
   drivers/net/wireless/st/cw1200/txrx.c:1068:6: note: Assuming the conditi=
on is false
           if (skb->len < sizeof(struct ieee80211_pspoll)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/st/cw1200/txrx.c:1068:2: note: Taking false branch
           if (skb->len < sizeof(struct ieee80211_pspoll)) {
           ^
   drivers/net/wireless/st/cw1200/txrx.c:1073:2: note: Taking true branch
           if (ieee80211_is_pspoll(frame->frame_control))
           ^
   drivers/net/wireless/st/cw1200/txrx.c:1074:7: note: Calling 'cw1200_hand=
le_pspoll'
                   if (cw1200_handle_pspoll(priv, skb))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/st/cw1200/txrx.c:814:6: note: Assuming field 'join_=
status' is equal to CW1200_JOIN_STATUS_AP
           if (priv->join_status !=3D CW1200_JOIN_STATUS_AP)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/st/cw1200/txrx.c:814:2: note: Taking false branch
           if (priv->join_status !=3D CW1200_JOIN_STATUS_AP)
           ^
   drivers/net/wireless/st/cw1200/txrx.c:816:13: note: Passing null pointer=
 value via 1st parameter 'p'
           if (memcmp(priv->vif->addr, pspoll->bssid, ETH_ALEN))
                      ^
   include/linux/fortify-string.h:379:42: note: expanded from macro 'memcmp'
   #define memcmp(p, q, s) __fortify_memcmp(p, q, s)
                                            ^
   drivers/net/wireless/st/cw1200/txrx.c:816:6: note: Calling '__fortify_me=
mcmp'
           if (memcmp(priv->vif->addr, pspoll->bssid, ETH_ALEN))
               ^
   include/linux/fortify-string.h:379:25: note: expanded from macro 'memcmp'
   #define memcmp(p, q, s) __fortify_memcmp(p, q, s)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:385:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/fortify-string.h:391:6: note: Assuming 'p_size' is >=3D 's=
ize'
           if (p_size < size || q_size < size)
               ^~~~~~~~~~~~~
   include/linux/fortify-string.h:391:6: note: Left side of '||' is false
   include/linux/fortify-string.h:391:23: note: Assuming 'q_size' is >=3D '=
size'
           if (p_size < size || q_size < size)
                                ^~~~~~~~~~~~~
   include/linux/fortify-string.h:391:2: note: Taking false branch
           if (p_size < size || q_size < size)
           ^
   include/linux/fortify-string.h:393:9: note: Null pointer passed as 1st a=
rgument to memory comparison function
           return __underlying_memcmp(p, q, size);
                  ^                   ~
   include/linux/fortify-string.h:42:29: note: expanded from macro '__under=
lying_memcmp'
   #define __underlying_memcmp     __builtin_memcmp
                                   ^
   Suppressed 13 warnings (13 in non-user code).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).

vim +137 include/linux/fortify-string.h

a28a6e860c6cf2 Francis Laniel 2021-02-25  111  =

a28a6e860c6cf2 Francis Laniel 2021-02-25  112  /* defined after fortified s=
trlen to reuse it */
a28a6e860c6cf2 Francis Laniel 2021-02-25  113  extern size_t __real_strlcpy=
(char *, const char *, size_t) __RENAME(strlcpy);
7db6d0c94a3589 Kees Cook      2021-06-17  114  #define strlcpy(p, q, s) __f=
ortify_strlcpy(p, q, s,			\
7db6d0c94a3589 Kees Cook      2021-06-17  115  					   __builtin_object_siz=
e(p, 1),	\
7db6d0c94a3589 Kees Cook      2021-06-17  116  					   __builtin_object_siz=
e(q, 1))
7db6d0c94a3589 Kees Cook      2021-06-17  117  __FORTIFY_INLINE size_t __fo=
rtify_strlcpy(char *p, const char *q,
7db6d0c94a3589 Kees Cook      2021-06-17  118  					  size_t size,
7db6d0c94a3589 Kees Cook      2021-06-17  119  					  const size_t p_size,
7db6d0c94a3589 Kees Cook      2021-06-17  120  					  const size_t q_size)
a28a6e860c6cf2 Francis Laniel 2021-02-25  121  {
3009f891bb9f32 Kees Cook      2021-08-02  122  	size_t q_len;	/* Full count=
 of source string length. */
3009f891bb9f32 Kees Cook      2021-08-02  123  	size_t len;	/* Count of cha=
racters going into destination. */
a28a6e860c6cf2 Francis Laniel 2021-02-25  124  =

a28a6e860c6cf2 Francis Laniel 2021-02-25  125  	if (p_size =3D=3D (size_t)-=
1 && q_size =3D=3D (size_t)-1)
a28a6e860c6cf2 Francis Laniel 2021-02-25  126  		return __real_strlcpy(p, q=
, size);
3009f891bb9f32 Kees Cook      2021-08-02  127  	q_len =3D strlen(q);
3009f891bb9f32 Kees Cook      2021-08-02  128  	len =3D (q_len >=3D size) ?=
 size - 1 : q_len;
3009f891bb9f32 Kees Cook      2021-08-02  129  	if (__builtin_constant_p(si=
ze) && __builtin_constant_p(q_len) && size) {
3009f891bb9f32 Kees Cook      2021-08-02  130  		/* Write size is always la=
rger than destination. */
3009f891bb9f32 Kees Cook      2021-08-02  131  		if (len >=3D p_size)
a28a6e860c6cf2 Francis Laniel 2021-02-25  132  			__write_overflow();
3009f891bb9f32 Kees Cook      2021-08-02  133  	}
3009f891bb9f32 Kees Cook      2021-08-02  134  	if (size) {
a28a6e860c6cf2 Francis Laniel 2021-02-25  135  		if (len >=3D p_size)
a28a6e860c6cf2 Francis Laniel 2021-02-25  136  			fortify_panic(__func__);
a28a6e860c6cf2 Francis Laniel 2021-02-25 @137  		__underlying_memcpy(p, q, =
len);
a28a6e860c6cf2 Francis Laniel 2021-02-25  138  		p[len] =3D '\0';
a28a6e860c6cf2 Francis Laniel 2021-02-25  139  	}
3009f891bb9f32 Kees Cook      2021-08-02  140  	return q_len;
a28a6e860c6cf2 Francis Laniel 2021-02-25  141  }
a28a6e860c6cf2 Francis Laniel 2021-02-25  142  =


:::::: The code at line 137 was first introduced by commit
:::::: a28a6e860c6cf231cf3c5171c75c342adcd00406 string.h: move fortified fu=
nctions definitions in a dedicated header.

:::::: TO: Francis Laniel <laniel_francis@privacyrequired.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1758226859043937559==--

