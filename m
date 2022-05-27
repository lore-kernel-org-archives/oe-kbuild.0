Content-Type: multipart/mixed; boundary="===============6666907828546602108=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [congwang:sch_bpf 2/4] net/core/skb_map.c:175:9: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Sat, 28 May 2022 06:59:23 +0800
Message-ID: <202205280603.5BAjdCkI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6666907828546602108==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Cong Wang <xiyou.wangcong@gmail.com>

tree:   https://github.com/congwang/linux.git sch_bpf
head:   d7144f4291a2882e698a6d9d83f7e614d97be9c8
commit: c27f47230e7935f94ef17b29accb49defa7be17e [2/4] bpf: introduce skb m=
ap
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20528/202205280603.5BAjdCkI-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 134d7f=
9a4b97e9035150d970bd9e376043c4577e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/congwang/linux/commit/c27f47230e7935f94ef17b29=
accb49defa7be17e
        git remote add congwang https://github.com/congwang/linux.git
        git fetch --no-tags congwang sch_bpf
        git checkout c27f47230e7935f94ef17b29accb49defa7be17e
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                   ^~~~~~~~~~~~~~~~
   net/atm/mpc.c:1347:2: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
           memcpy(&tlv[7], mesg->MPS_ctrl, ATM_ESA_LEN); /* MPC ctrl ATM ad=
dr */
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   net/atm/mpc.c:1348:2: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(mpc->our_ctrl_addr, mesg->MPS_ctrl, ATM_ESA_LEN);
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   net/atm/mpc.c:1348:2: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
           memcpy(mpc->our_ctrl_addr, mesg->MPS_ctrl, ATM_ESA_LEN);
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   net/atm/mpc.c:1515:3: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(mpc, 0, sizeof(struct mpoa_client));
                   ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   net/atm/mpc.c:1515:3: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
                   memset(mpc, 0, sizeof(struct mpoa_client));
                   ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 76 warnings (76 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   89 warnings generated.
   net/core/bpf_sk_storage.c:764:4: warning: Value stored to 'b' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           b =3D &smap->buckets[bucket_id++];
                           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/bpf_sk_storage.c:764:4: note: Value stored to 'b' is never read
                           b =3D &smap->buckets[bucket_id++];
                           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 88 warnings (88 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   83 warnings generated.
   net/core/skb_map.c:85:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(rb, 0, sizeof(*rb));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   net/core/skb_map.c:85:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(rb, 0, sizeof(*rb));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
>> net/core/skb_map.c:175:9: warning: Dereference of null pointer [clang-an=
alyzer-core.NullDereference]
           rank =3D *(u64 *) key;
                  ^~~~~~~~~~~~
   net/core/skb_map.c:170:6: note: Assuming 'key' is null
           if (!key) {
               ^~~~
   net/core/skb_map.c:170:2: note: Taking true branch
           if (!key) {
           ^
   net/core/skb_map.c:171:9: note: Assuming '____ptr' is non-null
                   skb =3D skb_rb_first(&rb->root);
                         ^
   include/linux/skbuff.h:3911:28: note: expanded from macro 'skb_rb_first'
   #define skb_rb_first(root) rb_to_skb(rb_first(root))
                              ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:3910:23: note: expanded from macro 'rb_to_skb'
   #define rb_to_skb(rb) rb_entry_safe(rb, struct sk_buff, rbnode)
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rbtree.h:79:5: note: expanded from macro 'rb_entry_safe'
              ____ptr ? rb_entry(____ptr, type, member) : NULL; \
              ^~~~~~~
   net/core/skb_map.c:171:9: note: '?' condition is true
                   skb =3D skb_rb_first(&rb->root);
                         ^
   include/linux/skbuff.h:3911:28: note: expanded from macro 'skb_rb_first'
   #define skb_rb_first(root) rb_to_skb(rb_first(root))
                              ^
   include/linux/skbuff.h:3910:23: note: expanded from macro 'rb_to_skb'
   #define rb_to_skb(rb) rb_entry_safe(rb, struct sk_buff, rbnode)
                         ^
   include/linux/rbtree.h:79:5: note: expanded from macro 'rb_entry_safe'
              ____ptr ? rb_entry(____ptr, type, member) : NULL; \
              ^
   net/core/skb_map.c:172:8: note: 'skb' is non-null
                   if (!skb)
                        ^~~
   net/core/skb_map.c:172:3: note: Taking false branch
                   if (!skb)
                   ^
   net/core/skb_map.c:175:9: note: Dereference of null pointer
           rank =3D *(u64 *) key;
                  ^~~~~~~~~~~~
   Suppressed 81 warnings (81 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   80 warnings generated.
   fs/cifs/ioctl.c:334:4: warning: Value stored to 'caps' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                           caps =3D le64_to_cpu(tcon->fsUnixInfo.Capability=
);
                           ^
   fs/cifs/ioctl.c:334:4: note: Value stored to 'caps' is never read
   fs/cifs/ioctl.c:445:4: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(pkey_inf.auth_key, tcon->ses->auth_key.re=
sponse,
                           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/cifs/ioctl.c:445:4: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
                           memcpy(pkey_inf.auth_key, tcon->ses->auth_key.re=
sponse,
                           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/cifs/ioctl.c:447:4: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(pkey_inf.smb3decryptionkey,
                           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/cifs/ioctl.c:447:4: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
                           memcpy(pkey_inf.smb3decryptionkey,
                           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~

vim +175 net/core/skb_map.c

c27f47230e7935 Cong Wang 2020-11-08  162  =

c27f47230e7935 Cong Wang 2020-11-08  163  /* Called from syscall */
c27f47230e7935 Cong Wang 2020-11-08  164  static int skb_map_get_next_key(s=
truct bpf_map *map, void *key, void *next_key)
c27f47230e7935 Cong Wang 2020-11-08  165  {
c27f47230e7935 Cong Wang 2020-11-08  166  	struct bpf_skb_map *rb =3D bpf_s=
kb_map(map);
c27f47230e7935 Cong Wang 2020-11-08  167  	struct sk_buff *skb;
c27f47230e7935 Cong Wang 2020-11-08  168  	u64 rank;
c27f47230e7935 Cong Wang 2020-11-08  169  =

c27f47230e7935 Cong Wang 2020-11-08  170  	if (!key) {
c27f47230e7935 Cong Wang 2020-11-08  171  		skb =3D skb_rb_first(&rb->root);
c27f47230e7935 Cong Wang 2020-11-08  172  		if (!skb)
c27f47230e7935 Cong Wang 2020-11-08  173  			return -ENOENT;
c27f47230e7935 Cong Wang 2020-11-08  174  	}
c27f47230e7935 Cong Wang 2020-11-08 @175  	rank =3D *(u64 *) key;
c27f47230e7935 Cong Wang 2020-11-08  176  	skb =3D skb_rb_find(&rb->root, r=
ank);
c27f47230e7935 Cong Wang 2020-11-08  177  	if (!skb)
c27f47230e7935 Cong Wang 2020-11-08  178  		return -ENOENT;
c27f47230e7935 Cong Wang 2020-11-08  179  	skb =3D skb_rb_next(skb);
c27f47230e7935 Cong Wang 2020-11-08  180  	if (!skb)
c27f47230e7935 Cong Wang 2020-11-08  181  		return 0;
c27f47230e7935 Cong Wang 2020-11-08  182  	*(u64 *) next_key =3D skb_map_cb=
(skb)->rank;
c27f47230e7935 Cong Wang 2020-11-08  183  	return 0;
c27f47230e7935 Cong Wang 2020-11-08  184  }
c27f47230e7935 Cong Wang 2020-11-08  185  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6666907828546602108==--

