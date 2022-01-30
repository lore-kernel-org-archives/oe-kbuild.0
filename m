Content-Type: multipart/mixed; boundary="===============4472110749818935996=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/netfilter/nf_tables_api.c:2014:2: warning: Value stored to 'ptr' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 30 Jan 2022 09:31:10 +0800
Message-ID: <202201300949.8mh6wCjw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4472110749818935996==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Pablo Neira Ayuso <pablo@netfilter.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f8c7e4ede46fe63ff10000669652648aab09d112
commit: 2c865a8a28a10e9800a3dd07ca339d24563e3d65 netfilter: nf_tables: add =
rule blob layout
date:   3 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-c006-20220129 (https://download.01.org/0day-ci/arc=
hive/20220130/202201300949.8mh6wCjw-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 33b45e=
e44b1f32ffdbc995e6fec806271b4b3ba4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D2c865a8a28a10e9800a3dd07ca339d24563e3d65
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2c865a8a28a10e9800a3dd07ca339d24563e3d65
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/uapi/linux/byteorder/little_endian.h:40:26: note: expanded from =
macro '__be32_to_cpu'
   #define __be32_to_cpu(x) __swab32((__force __u32)(__be32)(x))
                            ^
   include/uapi/linux/swab.h:118:3: note: expanded from macro '__swab32'
           (__builtin_constant_p((__u32)(x)) ?     \
            ^
   net/netfilter/nf_tables_api.c:1948:19: note: '?' condition is false
           hook->priority =3D ntohl(nla_get_be32(ha[NFTA_HOOK_PRIORITY]));
                            ^
   include/linux/byteorder/generic.h:140:18: note: expanded from macro 'nto=
hl'
   #define ntohl(x) ___ntohl(x)
                    ^
   include/linux/byteorder/generic.h:136:21: note: expanded from macro '___=
ntohl'
   #define ___ntohl(x) __be32_to_cpu(x)
                       ^
   include/uapi/linux/byteorder/little_endian.h:40:26: note: expanded from =
macro '__be32_to_cpu'
   #define __be32_to_cpu(x) __swab32((__force __u32)(__be32)(x))
                            ^
   include/uapi/linux/swab.h:118:3: note: expanded from macro '__swab32'
           (__builtin_constant_p((__u32)(x)) ?     \
            ^
   net/netfilter/nf_tables_api.c:1951:6: note: Assuming 'type' is non-null
           if (!type)
               ^~~~~
   net/netfilter/nf_tables_api.c:1951:2: note: Taking false branch
           if (!type)
           ^
   net/netfilter/nf_tables_api.c:1954:6: note: Assuming the condition is fa=
lse
           if (nla[NFTA_CHAIN_TYPE]) {
               ^~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:1954:2: note: Taking false branch
           if (nla[NFTA_CHAIN_TYPE]) {
           ^
   net/netfilter/nf_tables_api.c:1962:6: note: Assuming the condition is fa=
lse
           if (hook->num >=3D NFT_MAX_HOOKS || !(type->hook_mask & (1 << ho=
ok->num)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:1962:6: note: Left side of '||' is false
   net/netfilter/nf_tables_api.c:1962:36: note: Assuming the condition is f=
alse
           if (hook->num >=3D NFT_MAX_HOOKS || !(type->hook_mask & (1 << ho=
ok->num)))
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   net/netfilter/nf_tables_api.c:1962:2: note: Taking false branch
           if (hook->num >=3D NFT_MAX_HOOKS || !(type->hook_mask & (1 << ho=
ok->num)))
           ^
   net/netfilter/nf_tables_api.c:1965:6: note: Assuming field 'type' is not=
 equal to NFT_CHAIN_T_NAT
           if (type->type =3D=3D NFT_CHAIN_T_NAT &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:1965:36: note: Left side of '&&' is false
           if (type->type =3D=3D NFT_CHAIN_T_NAT &&
                                             ^
   net/netfilter/nf_tables_api.c:1969:2: note: Taking false branch
           if (!try_module_get(type->owner)) {
           ^
   net/netfilter/nf_tables_api.c:1978:2: note: Taking true branch
           if (nft_base_chain_netdev(family, hook->num)) {
           ^
   net/netfilter/nf_tables_api.c:1979:9: note: Calling 'nft_chain_parse_net=
dev'
                   err =3D nft_chain_parse_netdev(net, ha, &hook->list);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:1903:6: note: Assuming the condition is tr=
ue
           if (tb[NFTA_HOOK_DEV]) {
               ^~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:1903:2: note: Taking true branch
           if (tb[NFTA_HOOK_DEV]) {
           ^
   net/netfilter/nf_tables_api.c:1904:10: note: Calling 'nft_netdev_hook_al=
loc'
                   hook =3D nft_netdev_hook_alloc(net, tb[NFTA_HOOK_DEV]);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:1806:9: note: Memory is allocated
           hook =3D kmalloc(sizeof(struct nft_hook), GFP_KERNEL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:1807:6: note: Assuming 'hook' is non-null
           if (!hook) {
               ^~~~~
   net/netfilter/nf_tables_api.c:1807:2: note: Taking false branch
           if (!hook) {
           ^
   net/netfilter/nf_tables_api.c:1818:6: note: Assuming 'dev' is non-null
           if (!dev) {
               ^~~~
   net/netfilter/nf_tables_api.c:1818:2: note: Taking false branch
           if (!dev) {
           ^
   net/netfilter/nf_tables_api.c:1904:10: note: Returned allocated memory
                   hook =3D nft_netdev_hook_alloc(net, tb[NFTA_HOOK_DEV]);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:1905:3: note: Taking true branch
                   if (IS_ERR(hook))
                   ^
   net/netfilter/nf_tables_api.c:1979:9: note: Returned allocated memory
                   err =3D nft_chain_parse_netdev(net, ha, &hook->list);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:1980:7: note: 'err' is >=3D 0
                   if (err < 0) {
                       ^~~
   net/netfilter/nf_tables_api.c:1980:3: note: Taking false branch
                   if (err < 0) {
                   ^
   net/netfilter/nf_tables_api.c:1989:9: note: Potential leak of memory poi=
nted to by 'err'
           return 0;
                  ^
>> net/netfilter/nf_tables_api.c:2014:2: warning: Value stored to 'ptr' is =
never read [clang-analyzer-deadcode.DeadStores]
           ptr +=3D offsetof(struct nft_rule_dp, data);
           ^
   net/netfilter/nf_tables_api.c:2014:2: note: Value stored to 'ptr' is nev=
er read
   net/netfilter/nf_tables_api.c:2058:18: warning: Assigned value is garbag=
e or undefined [clang-analyzer-core.uninitialized.Assign]
           basechain->type =3D hook->type;
                           ^
   net/netfilter/nf_tables_api.c:2116:6: note: Assuming the condition is fa=
lse
           if (table->use =3D=3D UINT_MAX)
               ^~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:2116:2: note: Taking false branch
           if (table->use =3D=3D UINT_MAX)
           ^
   net/netfilter/nf_tables_api.c:2119:6: note: Assuming the condition is tr=
ue
           if (nla[NFTA_CHAIN_HOOK]) {
               ^~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:2119:2: note: Taking true branch
           if (nla[NFTA_CHAIN_HOOK]) {
           ^
   net/netfilter/nf_tables_api.c:2122:7: note: Assuming the condition is fa=
lse
                   if (flags & NFT_CHAIN_BINDING)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:2122:3: note: Taking false branch
                   if (flags & NFT_CHAIN_BINDING)
                   ^
   net/netfilter/nf_tables_api.c:2125:9: note: Calling 'nft_chain_parse_hoo=
k'
                   err =3D nft_chain_parse_hook(net, nla, &hook, family, ex=
tack,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   net/netfilter/nf_tables_api.c:1934:2: note: Assuming 'debug_locks' is 0
           lockdep_assert_held(&nft_net->commit_mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:310:15: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                        ^~~~~~~~~~~
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   net/netfilter/nf_tables_api.c:1934:2: note: Left side of '&&' is false
           lockdep_assert_held(&nft_net->commit_mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:27: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                                    ^
   net/netfilter/nf_tables_api.c:1934:2: note: Loop condition is false.  Ex=
iting loop
           lockdep_assert_held(&nft_net->commit_mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:2: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
           ^
   net/netfilter/nf_tables_api.c:1940:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/netfilter/nf_tables_api.c:1940:2: note: Taking false branch
           if (err < 0)
           ^
   net/netfilter/nf_tables_api.c:1943:6: note: Assuming the condition is fa=
lse
           if (ha[NFTA_HOOK_HOOKNUM] =3D=3D NULL ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:1943:6: note: Left side of '||' is false
   net/netfilter/nf_tables_api.c:1944:6: note: Assuming the condition is fa=
lse
               ha[NFTA_HOOK_PRIORITY] =3D=3D NULL)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:1943:2: note: Taking false branch
           if (ha[NFTA_HOOK_HOOKNUM] =3D=3D NULL ||
           ^
   net/netfilter/nf_tables_api.c:1947:14: note: '?' condition is false
           hook->num =3D ntohl(nla_get_be32(ha[NFTA_HOOK_HOOKNUM]));
                       ^
   include/linux/byteorder/generic.h:140:18: note: expanded from macro 'nto=
hl'
   #define ntohl(x) ___ntohl(x)
                    ^
   include/linux/byteorder/generic.h:136:21: note: expanded from macro '___=
ntohl'
   #define ___ntohl(x) __be32_to_cpu(x)
                       ^
   include/uapi/linux/byteorder/little_endian.h:40:26: note: expanded from =
macro '__be32_to_cpu'
   #define __be32_to_cpu(x) __swab32((__force __u32)(__be32)(x))
                            ^
   include/uapi/linux/swab.h:118:3: note: expanded from macro '__swab32'
           (__builtin_constant_p((__u32)(x)) ?     \
            ^
   net/netfilter/nf_tables_api.c:1948:19: note: '?' condition is false
           hook->priority =3D ntohl(nla_get_be32(ha[NFTA_HOOK_PRIORITY]));
                            ^
   include/linux/byteorder/generic.h:140:18: note: expanded from macro 'nto=
hl'
   #define ntohl(x) ___ntohl(x)
                    ^
   include/linux/byteorder/generic.h:136:21: note: expanded from macro '___=
ntohl'
   #define ___ntohl(x) __be32_to_cpu(x)
                       ^
   include/uapi/linux/byteorder/little_endian.h:40:26: note: expanded from =
macro '__be32_to_cpu'
   #define __be32_to_cpu(x) __swab32((__force __u32)(__be32)(x))
                            ^
--
           if (!list_empty(&set->bindings) && set->flags & NFT_SET_CONSTANT)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:6311:34: note: Left side of '&&' is false
           if (!list_empty(&set->bindings) && set->flags & NFT_SET_CONSTANT)
                                           ^
   net/netfilter/nf_tables_api.c:6316:6: note: Assuming the condition is fa=
lse
           if (!nla[NFTA_SET_ELEM_LIST_ELEMENTS])
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:6316:2: note: Taking false branch
           if (!nla[NFTA_SET_ELEM_LIST_ELEMENTS])
           ^
   net/netfilter/nf_tables_api.c:6319:2: note: Loop condition is true.  Ent=
ering loop body
           nla_for_each_nested(attr, nla[NFTA_SET_ELEM_LIST_ELEMENTS], rem)=
 {
           ^
   include/net/netlink.h:1932:2: note: expanded from macro 'nla_for_each_ne=
sted'
           nla_for_each_attr(pos, nla_data(nla), nla_len(nla), rem)
           ^
   include/net/netlink.h:1921:2: note: expanded from macro 'nla_for_each_at=
tr'
           for (pos =3D head, rem =3D len; \
           ^
   net/netfilter/nf_tables_api.c:6320:9: note: Calling 'nft_del_setelem'
                   err =3D nft_del_setelem(&ctx, set, attr);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:6133:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/netfilter/nf_tables_api.c:6133:2: note: Taking false branch
           if (err < 0)
           ^
   net/netfilter/nf_tables_api.c:6137:6: note: 'err' is >=3D 0
           if (err < 0)
               ^~~
   net/netfilter/nf_tables_api.c:6137:2: note: Taking false branch
           if (err < 0)
           ^
   net/netfilter/nf_tables_api.c:6140:6: note: Assuming the condition is tr=
ue
           if (!nla[NFTA_SET_ELEM_KEY] && !(flags & NFT_SET_ELEM_CATCHALL))
               ^~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:6140:6: note: Left side of '&&' is true
   net/netfilter/nf_tables_api.c:6140:33: note: Assuming the condition is f=
alse
           if (!nla[NFTA_SET_ELEM_KEY] && !(flags & NFT_SET_ELEM_CATCHALL))
                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:6140:2: note: Taking false branch
           if (!nla[NFTA_SET_ELEM_KEY] && !(flags & NFT_SET_ELEM_CATCHALL))
           ^
   net/netfilter/nf_tables_api.c:6145:6: note: 'flags' is not equal to 0
           if (flags !=3D 0)
               ^~~~~
   net/netfilter/nf_tables_api.c:6145:2: note: Taking true branch
           if (flags !=3D 0)
           ^
   net/netfilter/nf_tables_api.c:6148:2: note: Taking false branch
           if (nla[NFTA_SET_ELEM_KEY]) {
           ^
   net/netfilter/nf_tables_api.c:6157:6: note: Assuming the condition is fa=
lse
           if (nla[NFTA_SET_ELEM_KEY_END]) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:6157:2: note: Taking false branch
           if (nla[NFTA_SET_ELEM_KEY_END]) {
           ^
   net/netfilter/nf_tables_api.c:6168:34: note: Passing null pointer value =
via 5th parameter 'data'
                                         elem.key_end.val.data, NULL, 0, 0,
                                                                ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   net/netfilter/nf_tables_api.c:6167:14: note: Calling 'nft_set_elem_init'
           elem.priv =3D nft_set_elem_init(set, &tmpl, elem.key.val.data,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5365:6: note: Assuming 'elem' is not equal=
 to NULL
           if (elem =3D=3D NULL)
               ^~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5365:2: note: Taking false branch
           if (elem =3D=3D NULL)
           ^
   net/netfilter/nf_tables_api.c:5371:2: note: Taking false branch
           if (nft_set_ext_exists(ext, NFT_SET_EXT_KEY))
           ^
   net/netfilter/nf_tables_api.c:5373:2: note: Taking false branch
           if (nft_set_ext_exists(ext, NFT_SET_EXT_KEY_END))
           ^
   net/netfilter/nf_tables_api.c:5375:6: note: Calling 'nft_set_ext_exists'
           if (nft_set_ext_exists(ext, NFT_SET_EXT_DATA))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netfilter/nf_tables.h:672:9: note: 'ext' is non-null
           return ext && __nft_set_ext_exists(ext, id);
                  ^~~
   include/net/netfilter/nf_tables.h:672:9: note: Left side of '&&' is true
   include/net/netfilter/nf_tables.h:672:2: note: Returning the value 1, wh=
ich participates in a condition later
           return ext && __nft_set_ext_exists(ext, id);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5375:6: note: Returning from 'nft_set_ext_=
exists'
           if (nft_set_ext_exists(ext, NFT_SET_EXT_DATA))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5375:2: note: Taking true branch
           if (nft_set_ext_exists(ext, NFT_SET_EXT_DATA))
           ^
   net/netfilter/nf_tables_api.c:5376:3: note: Null pointer passed as 2nd a=
rgument to memory copy function
                   memcpy(nft_set_ext_data(ext), data, set->dlen);
                   ^                             ~~~~
>> net/netfilter/nf_tables_api.c:8273:2: warning: Value stored to 'i' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           i =3D 0;
           ^   ~
   net/netfilter/nf_tables_api.c:8273:2: note: Value stored to 'i' is never=
 read
           i =3D 0;
           ^   ~
   net/netfilter/nf_tables_api.c:8277:14: warning: The left expression of t=
he compound assignment is an uninitialized value. The computed value will a=
lso be garbage [clang-analyzer-core.uninitialized.Assign]
                           data_size +=3D sizeof(*prule) + rule->dlen;
                                     ^
   net/netfilter/nf_tables_api.c:8592:6: note: Assuming the condition is fa=
lse
           if (list_empty(&nft_net->commit_list)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:8592:2: note: Taking false branch
           if (list_empty(&nft_net->commit_list)) {
           ^
   net/netfilter/nf_tables_api.c:8598:2: note: Taking false branch
           if (nf_tables_validate(net) < 0)
           ^
   net/netfilter/nf_tables_api.c:8602:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/netfilter/nf_tables_api.c:8602:2: note: Taking false branch
           if (err < 0)
           ^
   net/netfilter/nf_tables_api.c:8606:2: note: Loop condition is true.  Ent=
ering loop body
           list_for_each_entry_safe(trans, next, &nft_net->commit_list, lis=
t) {
           ^
   include/linux/list.h:717:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   net/netfilter/nf_tables_api.c:8610:7: note: 'ret' is 0
                   if (ret) {
                       ^~~
   net/netfilter/nf_tables_api.c:8610:3: note: Taking false branch
                   if (ret) {
                   ^
   net/netfilter/nf_tables_api.c:8615:7: note: Assuming field 'msg_type' is=
 not equal to NFT_MSG_NEWRULE
                   if (trans->msg_type =3D=3D NFT_MSG_NEWRULE ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:8615:7: note: Left side of '||' is false
   net/netfilter/nf_tables_api.c:8616:7: note: Assuming field 'msg_type' is=
 equal to NFT_MSG_DELRULE
                       trans->msg_type =3D=3D NFT_MSG_DELRULE) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:8615:3: note: Taking true branch
                   if (trans->msg_type =3D=3D NFT_MSG_NEWRULE ||
                   ^
   net/netfilter/nf_tables_api.c:8619:10: note: Calling 'nf_tables_commit_c=
hain_prepare'
                           ret =3D nf_tables_commit_chain_prepare(net, chai=
n);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:8262:21: note: 'data_size' declared withou=
t an initial value
           unsigned int size, data_size;
                              ^~~~~~~~~
   net/netfilter/nf_tables_api.c:8269:6: note: Assuming field 'blob_next' i=
s null
           if (chain->blob_next || !nft_is_active_next(net, chain))
               ^~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:8269:6: note: Left side of '||' is false
   net/netfilter/nf_tables_api.c:8269:27: note: Assuming the condition is t=
rue
           if (chain->blob_next || !nft_is_active_next(net, chain))
                                    ^
   include/net/netfilter/nf_tables.h:1405:3: note: expanded from macro 'nft=
_is_active_next'
           (((__obj)->genmask & nft_genmask_next(__net)) =3D=3D 0)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:8269:2: note: Taking false branch
           if (chain->blob_next || !nft_is_active_next(net, chain))
           ^
   net/netfilter/nf_tables_api.c:8275:2: note: Loop condition is true.  Ent=
ering loop body
           list_for_each_entry_continue(rule, &chain->rules, list) {
           ^
   include/linux/list.h:666:2: note: expanded from macro 'list_for_each_ent=
ry_continue'
           for (pos =3D list_next_entry(pos, member);                      =
  \
           ^
   net/netfilter/nf_tables_api.c:8276:7: note: Assuming the condition is tr=
ue
                   if (nft_is_active_next(net, rule)) {
                       ^
   include/net/netfilter/nf_tables.h:1405:3: note: expanded from macro 'nft=
_is_active_next'
           (((__obj)->genmask & nft_genmask_next(__net)) =3D=3D 0)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:8276:3: note: Taking true branch
                   if (nft_is_active_next(net, rule)) {
                   ^
   net/netfilter/nf_tables_api.c:8277:14: note: The left expression of the =
compound assignment is an uninitialized value. The computed value will also=
 be garbage
                           data_size +=3D sizeof(*prule) + rule->dlen;
                           ~~~~~~~~~ ^
   net/netfilter/nf_tables_api.c:8282:12: warning: The left expression of t=
he compound assignment is an uninitialized value. The computed value will a=
lso be garbage [clang-analyzer-core.uninitialized.Assign]
           data_size +=3D offsetof(struct nft_rule_dp, data);        /* las=
t rule */
                     ^
   net/netfilter/nf_tables_api.c:8592:6: note: Assuming the condition is fa=
lse
           if (list_empty(&nft_net->commit_list)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:8592:2: note: Taking false branch
           if (list_empty(&nft_net->commit_list)) {
           ^
   net/netfilter/nf_tables_api.c:8598:2: note: Taking false branch
           if (nf_tables_validate(net) < 0)
           ^
   net/netfilter/nf_tables_api.c:8602:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/netfilter/nf_tables_api.c:8602:2: note: Taking false branch
           if (err < 0)
           ^

vim +/ptr +2014 net/netfilter/nf_tables_api.c

d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1923  =

508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1924  static int nft_chain_par=
se_hook(struct net *net,
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1925  				const struct nlattr =
* const nla[],
36596dadf54a92 Pablo Neira Ayuso 2018-01-09  1926  				struct nft_chain_hoo=
k *hook, u8 family,
983c4fcb81d6bd Pablo Neira Ayuso 2021-05-19  1927  				struct netlink_ext_a=
ck *extack, bool autoload)
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1928  {
d59d2f82f984df Pablo Neira Ayuso 2021-04-23  1929  	struct nftables_pernet =
*nft_net =3D nft_pernet(net);
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1930  	struct nlattr *ha[NFTA_=
HOOK_MAX + 1];
32537e91847a56 Pablo Neira Ayuso 2018-03-27  1931  	const struct nft_chain_=
type *type;
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1932  	int err;
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1933  =

0854db2aaef3fc Florian Westphal  2021-04-01  1934  	lockdep_assert_held(&nf=
t_net->commit_mutex);
f102d66b335a41 Florian Westphal  2018-07-11  1935  	lockdep_nfnl_nft_mutex_=
not_held();
f102d66b335a41 Florian Westphal  2018-07-11  1936  =

8cb081746c031f Johannes Berg     2019-04-26  1937  	err =3D nla_parse_neste=
d_deprecated(ha, NFTA_HOOK_MAX,
8cb081746c031f Johannes Berg     2019-04-26  1938  					  nla[NFTA_CHAIN_HO=
OK],
fceb6435e85298 Johannes Berg     2017-04-12  1939  					  nft_hook_policy, =
NULL);
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1940  	if (err < 0)
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1941  		return err;
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1942  =

508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1943  	if (ha[NFTA_HOOK_HOOKNU=
M] =3D=3D NULL ||
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1944  	    ha[NFTA_HOOK_PRIORI=
TY] =3D=3D NULL)
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1945  		return -EINVAL;
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1946  =

508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1947  	hook->num =3D ntohl(nla=
_get_be32(ha[NFTA_HOOK_HOOKNUM]));
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1948  	hook->priority =3D ntoh=
l(nla_get_be32(ha[NFTA_HOOK_PRIORITY]));
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1949  =

826035498ec14b Pablo Neira Ayuso 2020-01-21  1950  	type =3D __nft_chain_ty=
pe_get(family, NFT_CHAIN_T_DEFAULT);
826035498ec14b Pablo Neira Ayuso 2020-01-21  1951  	if (!type)
826035498ec14b Pablo Neira Ayuso 2020-01-21  1952  		return -EOPNOTSUPP;
826035498ec14b Pablo Neira Ayuso 2020-01-21  1953  =

508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1954  	if (nla[NFTA_CHAIN_TYPE=
]) {
452238e8d5ffd8 Florian Westphal  2018-07-11  1955  		type =3D nf_tables_cha=
in_type_lookup(net, nla[NFTA_CHAIN_TYPE],
445509eb9b0027 Pablo Neira Ayuso 2018-08-03  1956  						   family, autoloa=
d);
983c4fcb81d6bd Pablo Neira Ayuso 2021-05-19  1957  		if (IS_ERR(type)) {
983c4fcb81d6bd Pablo Neira Ayuso 2021-05-19  1958  			NL_SET_BAD_ATTR(extac=
k, nla[NFTA_CHAIN_TYPE]);
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1959  			return PTR_ERR(type);
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1960  		}
983c4fcb81d6bd Pablo Neira Ayuso 2021-05-19  1961  	}
d25e2e9388eda6 Pablo Neira Ayuso 2020-10-14  1962  	if (hook->num >=3D NFT_=
MAX_HOOKS || !(type->hook_mask & (1 << hook->num)))
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1963  		return -EOPNOTSUPP;
84ba7dd71add05 Florian Westphal  2017-12-08  1964  =

84ba7dd71add05 Florian Westphal  2017-12-08  1965  	if (type->type =3D=3D N=
FT_CHAIN_T_NAT &&
84ba7dd71add05 Florian Westphal  2017-12-08  1966  	    hook->priority <=3D=
 NF_IP_PRI_CONNTRACK)
84ba7dd71add05 Florian Westphal  2017-12-08  1967  		return -EOPNOTSUPP;
84ba7dd71add05 Florian Westphal  2017-12-08  1968  =

983c4fcb81d6bd Pablo Neira Ayuso 2021-05-19  1969  	if (!try_module_get(typ=
e->owner)) {
983c4fcb81d6bd Pablo Neira Ayuso 2021-05-19  1970  		if (nla[NFTA_CHAIN_TYP=
E])
983c4fcb81d6bd Pablo Neira Ayuso 2021-05-19  1971  			NL_SET_BAD_ATTR(extac=
k, nla[NFTA_CHAIN_TYPE]);
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1972  		return -ENOENT;
983c4fcb81d6bd Pablo Neira Ayuso 2021-05-19  1973  	}
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1974  =

508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1975  	hook->type =3D type;
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1976  =

d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1977  	INIT_LIST_HEAD(&hook->l=
ist);
d3519cb89f6d59 Pablo Neira Ayuso 2020-10-08  1978  	if (nft_base_chain_netd=
ev(family, hook->num)) {
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1979  		err =3D nft_chain_pars=
e_netdev(net, ha, &hook->list);
d54725cd11a57c Pablo Neira Ayuso 2019-10-16 @1980  		if (err < 0) {
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1981  			module_put(type->owne=
r);
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1982  			return err;
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1983  		}
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1984  	} else if (ha[NFTA_HOOK=
_DEV] || ha[NFTA_HOOK_DEVS]) {
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1985  		module_put(type->owner=
);
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1986  		return -EOPNOTSUPP;
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1987  	}
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1988  =

508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1989  	return 0;
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1990  }
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1991  =

508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1992  static void nft_chain_re=
lease_hook(struct nft_chain_hook *hook)
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1993  {
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1994  	struct nft_hook *h, *ne=
xt;
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1995  =

d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1996  	list_for_each_entry_saf=
e(h, next, &hook->list, list) {
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1997  		list_del(&h->list);
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1998  		kfree(h);
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1999  	}
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  2000  	module_put(hook->type->=
owner);
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  2001  }
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  2002  =

0cbc06b3faba75 Florian Westphal  2018-05-25  2003  struct nft_rules_old {
0cbc06b3faba75 Florian Westphal  2018-05-25  2004  	struct rcu_head h;
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  2005  	struct nft_rule_blob *b=
lob;
0cbc06b3faba75 Florian Westphal  2018-05-25  2006  };
0cbc06b3faba75 Florian Westphal  2018-05-25  2007  =

2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  2008  static void nft_last_rul=
e(struct nft_rule_blob *blob, const void *ptr)
0cbc06b3faba75 Florian Westphal  2018-05-25  2009  {
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  2010  	struct nft_rule_dp *pru=
le;
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  2011  =

2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  2012  	prule =3D (struct nft_r=
ule_dp *)ptr;
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  2013  	prule->is_last =3D 1;
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09 @2014  	ptr +=3D offsetof(struc=
t nft_rule_dp, data);
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  2015  	/* blob size does not i=
nclude the trailer rule */
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  2016  }
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  2017  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4472110749818935996==--

