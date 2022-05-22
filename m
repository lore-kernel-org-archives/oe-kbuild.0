Content-Type: multipart/mixed; boundary="===============8678700371725314938=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cifs:for-next 3/12] fs/cifs/connect.c:3435:7: warning: Value stored to 'nodfs' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 23 May 2022 00:33:54 +0800
Message-ID: <202205230053.4oXVlsI4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8678700371725314938==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-cifs(a)vger.kernel.org
CC: samba-technical(a)lists.samba.org
TO: Enzo Matsumiya <ematsumiya@suse.de>
CC: Steve French <stfrench@microsoft.com>
CC: "Paulo Alcantara (SUSE)" <pc@cjr.nz>

tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next
head:   35a2b533a261e2e43542df902bd9757a1deebfd5
commit: 421ef3d56513b2ff02e563623688cb6ab4977c4f [3/12] cifs: don't call ci=
fs_dfs_query_info_nonascii_quirk() if nodfs was set
:::::: branch date: 11 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20523/202205230053.4oXVlsI4-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b36976=
2beb70dfef22c7e793aed79b94d7dc0757)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add cifs git://git.samba.org/sfrench/cifs-2.6.git
        git fetch --no-tags cifs for-next
        git checkout 421ef3d56513b2ff02e563623688cb6ab4977c4f
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/cifs/connect.c:1590:2: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
           memcpy(&tcp_ses->dstaddr, &ctx->dstaddr,
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/cifs/connect.c:1593:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(tcp_ses->client_guid, ctx->client_guid,
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/cifs/connect.c:1593:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(tcp_ses->client_guid, ctx->client_guid,
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/cifs/connect.c:1934:3: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(desc, "cifs:a:%pI4", &sa->sin_addr.s_addr);
                   ^~~~~~~
   fs/cifs/connect.c:1934:3: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
                   sprintf(desc, "cifs:a:%pI4", &sa->sin_addr.s_addr);
                   ^~~~~~~
   fs/cifs/connect.c:1938:3: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(desc, "cifs:a:%pI6c", &sa6->sin6_addr.s6_addr);
                   ^~~~~~~
   fs/cifs/connect.c:1938:3: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
                   sprintf(desc, "cifs:a:%pI6c", &sa6->sin6_addr.s6_addr);
                   ^~~~~~~
   fs/cifs/connect.c:1957:3: warning: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandlin=
g]
                   sprintf(desc, "cifs:d:%s", ses->domainName);
                   ^~~~~~~
   fs/cifs/connect.c:1957:3: note: Call to function 'sprintf' is insecure a=
s it does not provide bounding of the memory buffer or security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'sprintf_s' in case of =
C11
                   sprintf(desc, "cifs:d:%s", ses->domainName);
                   ^~~~~~~
   fs/cifs/connect.c:2139:3: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(ses->ip_addr, "%pI6", &addr6->sin6_addr);
                   ^~~~~~~
   fs/cifs/connect.c:2139:3: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
                   sprintf(ses->ip_addr, "%pI6", &addr6->sin6_addr);
                   ^~~~~~~
   fs/cifs/connect.c:2141:3: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(ses->ip_addr, "%pI4", &addr->sin_addr);
                   ^~~~~~~
   fs/cifs/connect.c:2141:3: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
                   sprintf(ses->ip_addr, "%pI4", &addr->sin_addr);
                   ^~~~~~~
   fs/cifs/connect.c:2190:2: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ses->chans[0].signkey, ses->smb3signingkey,
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/cifs/connect.c:2190:2: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
           memcpy(ses->chans[0].signkey, ses->smb3signingkey,
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
>> fs/cifs/connect.c:3435:7: warning: Value stored to 'nodfs' during its in=
itialization is never read [clang-analyzer-deadcode.DeadStores]
           bool nodfs =3D cifs_sb->mnt_cifs_flags & CIFS_MOUNT_NO_DFS;
                ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/connect.c:3435:7: note: Value stored to 'nodfs' during its initi=
alization is never read
           bool nodfs =3D cifs_sb->mnt_cifs_flags & CIFS_MOUNT_NO_DFS;
                ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/connect.c:3844:3: warning: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(bcc_ptr, tree);
                   ^~~~~~
   fs/cifs/connect.c:3844:3: note: Call to function 'strcpy' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcpy'. CWE-119
                   strcpy(bcc_ptr, tree);
                   ^~~~~~
   fs/cifs/connect.c:3847:2: warning: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(bcc_ptr, "?????");
           ^~~~~~
   fs/cifs/connect.c:3847:2: note: Call to function 'strcpy' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcpy'. CWE-119
           strcpy(bcc_ptr, "?????");
           ^~~~~~
   Suppressed 88 warnings (87 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   93 warnings generated.
   include/linux/skbuff.h:2319:2: warning: Dereference of null pointer [cla=
ng-analyzer-core.NullDereference]
           WRITE_ONCE(next->prev, prev);
           ^
   include/asm-generic/rwonce.h:61:2: note: expanded from macro 'WRITE_ONCE'
           __WRITE_ONCE(x, val);                                           \
           ^
   include/asm-generic/rwonce.h:55:30: note: expanded from macro '__WRITE_O=
NCE'
           *(volatile typeof(x) *)&(x) =3D (val);                          =
  \
                                       ^
   net/tipc/bearer.c:614:15: note: Assuming 'b' is non-null
           if (unlikely(!b || !test_bit(0, &b->up)))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/tipc/bearer.c:614:15: note: Left side of '||' is false
           if (unlikely(!b || !test_bit(0, &b->up)))
                        ^
   net/tipc/bearer.c:614:6: note: Assuming the condition is false
           if (unlikely(!b || !test_bit(0, &b->up)))
               ^
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/tipc/bearer.c:614:2: note: Taking false branch
           if (unlikely(!b || !test_bit(0, &b->up)))
           ^
   net/tipc/bearer.c:616:29: note: Assuming 'skb' is not equal to 'xmitq'
           skb_queue_walk_safe(xmitq, skb, tmp) {
                                      ^
   include/linux/skbuff.h:3771:8: note: expanded from macro 'skb_queue_walk=
_safe'
                        skb !=3D (struct sk_buff *)(queue);                =
          \
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/tipc/bearer.c:616:2: note: Loop condition is true.  Entering loop bo=
dy
           skb_queue_walk_safe(xmitq, skb, tmp) {
           ^
   include/linux/skbuff.h:3770:3: note: expanded from macro 'skb_queue_walk=
_safe'
                   for (skb =3D (queue)->next, tmp =3D skb->next;          =
            \
                   ^
   net/tipc/bearer.c:617:9: note: Calling 'buf_msg'
                   hdr =3D buf_msg(skb);
                         ^~~~~~~~~~~~
   net/tipc/msg.h:202:2: note: Returning without writing to 'skb->..next'
           return (struct tipc_msg *)skb->data;
           ^
   net/tipc/bearer.c:617:9: note: Returning from 'buf_msg'
                   hdr =3D buf_msg(skb);
                         ^~~~~~~~~~~~
   net/tipc/bearer.c:616:29: note: Assuming 'skb' is not equal to 'xmitq'
           skb_queue_walk_safe(xmitq, skb, tmp) {
                                      ^
   include/linux/skbuff.h:3771:8: note: expanded from macro 'skb_queue_walk=
_safe'
                        skb !=3D (struct sk_buff *)(queue);                =
          \
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/tipc/bearer.c:616:2: note: Loop condition is true.  Entering loop bo=
dy
           skb_queue_walk_safe(xmitq, skb, tmp) {
           ^
   include/linux/skbuff.h:3770:3: note: expanded from macro 'skb_queue_walk=
_safe'
                   for (skb =3D (queue)->next, tmp =3D skb->next;          =
            \
                   ^
   net/tipc/bearer.c:620:3: note: Calling '__skb_dequeue'
                   __skb_dequeue(xmitq);
                   ^~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2334:6: note: 'skb' is non-null
           if (skb)
               ^~~
   include/linux/skbuff.h:2334:2: note: Taking true branch
           if (skb)
           ^
   include/linux/skbuff.h:2335:3: note: Calling '__skb_unlink'
                   __skb_unlink(skb, list);
                   ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2315:2: note: Left side of '||' is false
           WRITE_ONCE(list->qlen, list->qlen - 1);
           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \

vim +/nodfs +3435 fs/cifs/connect.c

a6b5058fafdf50 Aurelien Aptel    2016-05-25  3421  =

56c762eb9bee33 Paulo Alcantara   2018-11-14  3422  /*
56c762eb9bee33 Paulo Alcantara   2018-11-14  3423   * Check if path is remo=
te (e.g. a DFS share). Return -EREMOTE if it is,
56c762eb9bee33 Paulo Alcantara   2018-11-14  3424   * otherwise 0.
56c762eb9bee33 Paulo Alcantara   2018-11-14  3425   */
c88f7dcd6d6429 Paulo Alcantara   2021-11-03  3426  static int is_path_remot=
e(struct mount_ctx *mnt_ctx)
724d9f1cfba0cb Pavel Shilovsky   2011-05-05  3427  {
1daaae8fa4afe3 Jeff Layton       2012-03-21  3428  	int rc;
c88f7dcd6d6429 Paulo Alcantara   2021-11-03  3429  	struct cifs_sb_info *ci=
fs_sb =3D mnt_ctx->cifs_sb;
c88f7dcd6d6429 Paulo Alcantara   2021-11-03  3430  	struct TCP_Server_Info =
*server =3D mnt_ctx->server;
c88f7dcd6d6429 Paulo Alcantara   2021-11-03  3431  	unsigned int xid =3D mn=
t_ctx->xid;
c88f7dcd6d6429 Paulo Alcantara   2021-11-03  3432  	struct cifs_tcon *tcon =
=3D mnt_ctx->tcon;
c88f7dcd6d6429 Paulo Alcantara   2021-11-03  3433  	struct smb3_fs_context =
*ctx =3D mnt_ctx->fs_ctx;
724d9f1cfba0cb Pavel Shilovsky   2011-05-05  3434  	char *full_path;
421ef3d56513b2 Enzo Matsumiya    2022-05-18 @3435  	bool nodfs =3D cifs_sb-=
>mnt_cifs_flags & CIFS_MOUNT_NO_DFS;
724d9f1cfba0cb Pavel Shilovsky   2011-05-05  3436  =

56c762eb9bee33 Paulo Alcantara   2018-11-14  3437  	if (!server->ops->is_pa=
th_accessible)
56c762eb9bee33 Paulo Alcantara   2018-11-14  3438  		return -EOPNOTSUPP;
1dfd18d0571231 Sachin Prabhu     2015-06-16  3439  =

56c762eb9bee33 Paulo Alcantara   2018-11-14  3440  	/*
56c762eb9bee33 Paulo Alcantara   2018-11-14  3441  	 * cifs_build_path_to_r=
oot works only when we have a valid tcon
56c762eb9bee33 Paulo Alcantara   2018-11-14  3442  	 */
3fa1c6d1b8f5c3 Ronnie Sahlberg   2020-12-09  3443  	full_path =3D cifs_buil=
d_path_to_root(ctx, cifs_sb, tcon,
56c762eb9bee33 Paulo Alcantara   2018-11-14  3444  					    tcon->Flags & S=
MB_SHARE_IS_IN_DFS);
56c762eb9bee33 Paulo Alcantara   2018-11-14  3445  	if (full_path =3D=3D NU=
LL)
56c762eb9bee33 Paulo Alcantara   2018-11-14  3446  		return -ENOMEM;
724d9f1cfba0cb Pavel Shilovsky   2011-05-05  3447  =

56c762eb9bee33 Paulo Alcantara   2018-11-14  3448  	cifs_dbg(FYI, "%s: full=
_path: %s\n", __func__, full_path);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3449  =

56c762eb9bee33 Paulo Alcantara   2018-11-14  3450  	rc =3D server->ops->is_=
path_accessible(xid, tcon, cifs_sb,
56c762eb9bee33 Paulo Alcantara   2018-11-14  3451  					     full_path);
a2809d0e16963f Eugene Korenevsky 2022-01-14  3452  #ifdef CONFIG_CIFS_DFS_U=
PCALL
421ef3d56513b2 Enzo Matsumiya    2022-05-18  3453  	if (nodfs) {
421ef3d56513b2 Enzo Matsumiya    2022-05-18  3454  		if (rc =3D=3D -EREMOTE)
421ef3d56513b2 Enzo Matsumiya    2022-05-18  3455  			rc =3D -EOPNOTSUPP;
421ef3d56513b2 Enzo Matsumiya    2022-05-18  3456  		goto out;
421ef3d56513b2 Enzo Matsumiya    2022-05-18  3457  	}
421ef3d56513b2 Enzo Matsumiya    2022-05-18  3458  =

421ef3d56513b2 Enzo Matsumiya    2022-05-18  3459  	/* path *might* exist w=
ith non-ASCII characters in DFS root
421ef3d56513b2 Enzo Matsumiya    2022-05-18  3460  	 * try again with full =
path (only if nodfs is not set) */
a2809d0e16963f Eugene Korenevsky 2022-01-14  3461  	if (rc =3D=3D -ENOENT &=
& is_tcon_dfs(tcon))
a2809d0e16963f Eugene Korenevsky 2022-01-14  3462  		rc =3D cifs_dfs_query_=
info_nonascii_quirk(xid, tcon, cifs_sb,
a2809d0e16963f Eugene Korenevsky 2022-01-14  3463  							full_path);
a2809d0e16963f Eugene Korenevsky 2022-01-14  3464  #endif
421ef3d56513b2 Enzo Matsumiya    2022-05-18  3465  	if (rc !=3D 0 && rc !=
=3D -EREMOTE)
421ef3d56513b2 Enzo Matsumiya    2022-05-18  3466  		goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3467  =

56c762eb9bee33 Paulo Alcantara   2018-11-14  3468  	if (rc !=3D -EREMOTE) {
56c762eb9bee33 Paulo Alcantara   2018-11-14  3469  		rc =3D cifs_are_all_pa=
th_components_accessible(server, xid, tcon,
ce465bf94b70f0 Ronnie Sahlberg   2019-07-11  3470  			cifs_sb, full_path, t=
con->Flags & SMB_SHARE_IS_IN_DFS);
56c762eb9bee33 Paulo Alcantara   2018-11-14  3471  		if (rc !=3D 0) {
a0a3036b81f1f6 Joe Perches       2020-04-14  3472  			cifs_server_dbg(VFS, =
"cannot query dirs between root and final path, enabling CIFS_MOUNT_USE_PRE=
FIX_PATH\n");
56c762eb9bee33 Paulo Alcantara   2018-11-14  3473  			cifs_sb->mnt_cifs_fla=
gs |=3D CIFS_MOUNT_USE_PREFIX_PATH;
56c762eb9bee33 Paulo Alcantara   2018-11-14  3474  			rc =3D 0;
56c762eb9bee33 Paulo Alcantara   2018-11-14  3475  		}
b618f001a20e44 Steve French      2015-11-03  3476  	}
592fafe644bf3a Steve French      2015-11-03  3477  =

421ef3d56513b2 Enzo Matsumiya    2022-05-18  3478  out:
56c762eb9bee33 Paulo Alcantara   2018-11-14  3479  	kfree(full_path);
56c762eb9bee33 Paulo Alcantara   2018-11-14  3480  	return rc;
d00c28de55a69d Jeff Layton       2010-04-24  3481  }
1bfe73c258addc Igor Mammedov     2009-04-01  3482  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8678700371725314938==--

