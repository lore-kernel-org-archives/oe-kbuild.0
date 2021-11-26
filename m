Content-Type: multipart/mixed; boundary="===============5897164286936315687=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/skmsg.h:315:2: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Fri, 26 Nov 2021 21:10:32 +0800
Message-ID: <202111262146.PP6CxPqw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5897164286936315687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Cong Wang <cong.wang@bytedance.com>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a4849f6000e29235a2707f22e39da6b897bb9543
commit: 17edea21b38d047a10c189296c58aea9875d0d0a sock_map: Relax config dep=
endency to CONFIG_NET
date:   4 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-c002-20211114 (https://download.01.org/0day-ci/archi=
ve/20211126/202111262146.PP6CxPqw-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c3ddde=
eafb529e769cde87bd29ef6271ac6bfa5c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D17edea21b38d047a10c189296c58aea9875d0d0a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 17edea21b38d047a10c189296c58aea9875d0d0a
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   net/nfc/llcp_commands.c:422:13: note: Returning from 'nfc_llcp_build_tlv'
           miux_tlv =3D nfc_llcp_build_tlv(LLCP_TLV_MIUX, (u8 *)&miux, 0,
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/nfc/llcp_commands.c:424:7: note: 'miux_tlv' is non-null
           if (!miux_tlv) {
                ^~~~~~~~
   net/nfc/llcp_commands.c:424:2: note: Taking false branch
           if (!miux_tlv) {
           ^
   net/nfc/llcp_commands.c:430:11: note: Calling 'nfc_llcp_build_tlv'
           rw_tlv =3D nfc_llcp_build_tlv(LLCP_TLV_RW, &rw, 0, &rw_tlv_lengt=
h);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/nfc/llcp_commands.c:83:2: note: Taking false branch
           pr_debug("type %d\n", type);
           ^
   include/linux/printk.h:477:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:140:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   net/nfc/llcp_commands.c:85:6: note: 'type' is < LLCP_TLV_MAX
           if (type >=3D LLCP_TLV_MAX)
               ^~~~
   net/nfc/llcp_commands.c:85:2: note: Taking false branch
           if (type >=3D LLCP_TLV_MAX)
           ^
   net/nfc/llcp_commands.c:89:6: note: Assuming 'length' is not equal to 0
           if (length =3D=3D 0 && value_length =3D=3D 0)
               ^~~~~~~~~~~
   net/nfc/llcp_commands.c:89:18: note: Left side of '&&' is false
           if (length =3D=3D 0 && value_length =3D=3D 0)
                           ^
   net/nfc/llcp_commands.c:91:11: note: 'length' is not equal to 0
           else if (length =3D=3D 0)
                    ^~~~~~
   net/nfc/llcp_commands.c:91:7: note: Taking false branch
           else if (length =3D=3D 0)
                ^
   net/nfc/llcp_commands.c:95:8: note: Calling 'kzalloc'
           tlv =3D kzalloc(2 + length, GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:579:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:596:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/nfc/llcp_commands.c:95:8: note: Returning from 'kzalloc'
           tlv =3D kzalloc(2 + length, GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/nfc/llcp_commands.c:96:6: note: Assuming 'tlv' is not equal to NULL,=
 which participates in a condition later
           if (tlv =3D=3D NULL)
               ^~~~~~~~~~~
   net/nfc/llcp_commands.c:96:2: note: Taking false branch
           if (tlv =3D=3D NULL)
           ^
   net/nfc/llcp_commands.c:101:2: note: Assigning value, which participates=
 in a condition later
           memcpy(tlv + 2, value, length);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/nfc/llcp_commands.c:103:2: note: Returning pointer (loaded from 'tlv=
'), which participates in a condition later
           return tlv;
           ^~~~~~~~~~
   net/nfc/llcp_commands.c:430:11: note: Returning from 'nfc_llcp_build_tlv'
           rw_tlv =3D nfc_llcp_build_tlv(LLCP_TLV_RW, &rw, 0, &rw_tlv_lengt=
h);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/nfc/llcp_commands.c:431:7: note: 'rw_tlv' is non-null
           if (!rw_tlv) {
                ^~~~~~
   net/nfc/llcp_commands.c:431:2: note: Taking false branch
           if (!rw_tlv) {
           ^
   net/nfc/llcp_commands.c:437:2: note: Taking false branch
           pr_debug("SKB size %d SN length %zu\n", size, sock->service_name=
_len);
           ^
   include/linux/printk.h:477:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:140:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   net/nfc/llcp_commands.c:440:6: note: 'skb' is not equal to NULL
           if (skb =3D=3D NULL) {
               ^~~
   net/nfc/llcp_commands.c:440:2: note: Taking false branch
           if (skb =3D=3D NULL) {
           ^
   net/nfc/llcp_commands.c:445:2: note: 3rd function call argument is an un=
initialized value
           llcp_add_tlv(skb, service_name_tlv, service_name_tlv_length);
           ^                                   ~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
>> include/linux/skmsg.h:315:2: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           return msg;
           ^
   net/core/skmsg.c:411:11: note: Calling 'sk_psock_peek_msg'
           msg_rx =3D sk_psock_peek_msg(psock);
                    ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skmsg.h:313:8: note: Left side of '||' is false
           msg =3D list_first_entry_or_null(&psock->ingress_msg, struct sk_=
msg, list);
                 ^
   include/linux/list.h:545:28: note: expanded from macro 'list_first_entry=
_or_null'
           struct list_head *pos__ =3D READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   include/linux/skmsg.h:313:8: note: Left side of '||' is false
           msg =3D list_first_entry_or_null(&psock->ingress_msg, struct sk_=
msg, list);
                 ^
   include/linux/list.h:545:28: note: expanded from macro 'list_first_entry=
_or_null'
           struct list_head *pos__ =3D READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   include/linux/skmsg.h:313:8: note: Left side of '||' is true
           msg =3D list_first_entry_or_null(&psock->ingress_msg, struct sk_=
msg, list);
                 ^
   include/linux/list.h:545:28: note: expanded from macro 'list_first_entry=
_or_null'
           struct list_head *pos__ =3D READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:291:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   include/linux/skmsg.h:313:8: note: Taking false branch
           msg =3D list_first_entry_or_null(&psock->ingress_msg, struct sk_=
msg, list);
                 ^
   include/linux/list.h:545:28: note: expanded from macro 'list_first_entry=
_or_null'
           struct list_head *pos__ =3D READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/skmsg.h:313:8: note: Loop condition is false.  Exiting loop
           msg =3D list_first_entry_or_null(&psock->ingress_msg, struct sk_=
msg, list);
                 ^
   include/linux/list.h:545:28: note: expanded from macro 'list_first_entry=
_or_null'
           struct list_head *pos__ =3D READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   include/linux/skmsg.h:313:8: note: Assuming 'pos__' is not equal to 'hea=
d__'
           msg =3D list_first_entry_or_null(&psock->ingress_msg, struct sk_=
msg, list);
                 ^
   include/linux/list.h:546:2: note: expanded from macro 'list_first_entry_=
or_null'
           pos__ !=3D head__ ? list_entry(pos__, type, member) : NULL; \
           ^~~~~~~~~~~~~~~
   include/linux/skmsg.h:313:8: note: '?' condition is true
           msg =3D list_first_entry_or_null(&psock->ingress_msg, struct sk_=
msg, list);

vim +315 include/linux/skmsg.h

b01fd6e802b6d0 Cong Wang 2021-03-30  307  =

b01fd6e802b6d0 Cong Wang 2021-03-30  308  static inline struct sk_msg *sk_p=
sock_peek_msg(struct sk_psock *psock)
b01fd6e802b6d0 Cong Wang 2021-03-30  309  {
b01fd6e802b6d0 Cong Wang 2021-03-30  310  	struct sk_msg *msg;
b01fd6e802b6d0 Cong Wang 2021-03-30  311  =

b01fd6e802b6d0 Cong Wang 2021-03-30  312  	spin_lock_bh(&psock->ingress_loc=
k);
b01fd6e802b6d0 Cong Wang 2021-03-30  313  	msg =3D list_first_entry_or_null=
(&psock->ingress_msg, struct sk_msg, list);
b01fd6e802b6d0 Cong Wang 2021-03-30  314  	spin_unlock_bh(&psock->ingress_l=
ock);
b01fd6e802b6d0 Cong Wang 2021-03-30 @315  	return msg;
b01fd6e802b6d0 Cong Wang 2021-03-30  316  }
b01fd6e802b6d0 Cong Wang 2021-03-30  317  =


:::::: The code at line 315 was first introduced by commit
:::::: b01fd6e802b6d0a635176f943315670b679d8d7b skmsg: Introduce a spinlock=
 to protect ingress_msg

:::::: TO: Cong Wang <cong.wang@bytedance.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5897164286936315687==--

