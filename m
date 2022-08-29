Content-Type: multipart/mixed; boundary="===============7369686185485795979=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/netfilter/nf_tables_api.c:2879:8: warning: Access to field 'type' results in a dereference of an undefined pointer value (loaded from field 'ops') [clang-analyzer-core.NullDereference]
Date: Mon, 29 Aug 2022 10:00:17 +0800
Message-ID: <202208290955.vpaU8fL4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7369686185485795979==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: net/netfi=
lter/nf_tables_api.c:2879:8: warning: Access to field 'type' results in a d=
ereference of an undefined pointer value (loaded from field 'ops') [clang-a=
nalyzer-core.NullDereference]"
:::::: =


BCC: lkp(a)intel.com
CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Pablo Neira Ayuso <pablo@netfilter.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b90cb1053190353cc30f0fef0ef1f378ccc063c5
commit: 520778042ccca019f3ffa136dd0ca565c486cedd netfilter: nf_tables: disa=
llow non-stateful expression in sets earlier
date:   3 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 months ago
config: s390-randconfig-c005-20220827 (https://download.01.org/0day-ci/arch=
ive/20220829/202208290955.vpaU8fL4-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project a2100d=
af12fb980a29fd1a9c85ccf8eaaaf79730)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D520778042ccca019f3ffa136dd0ca565c486cedd
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 520778042ccca019f3ffa136dd0ca565c486cedd
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)
   net/netfilter/nf_tables_api.c:2013:2: note: Taking false branch
           lockdep_assert_held(&nft_net->commit_mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:7: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                ^
   arch/s390/include/asm/bug.h:59:3: note: expanded from macro 'WARN_ON'
                   if (unlikely(__ret_warn_on))            \
                   ^
   net/netfilter/nf_tables_api.c:2013:2: note: Loop condition is false.  Ex=
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
   net/netfilter/nf_tables_api.c:2019:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/netfilter/nf_tables_api.c:2019:2: note: Taking false branch
           if (err < 0)
           ^
   net/netfilter/nf_tables_api.c:2022:6: note: Assuming the condition is fa=
lse
           if (ha[NFTA_HOOK_HOOKNUM] =3D=3D NULL ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:2022:6: note: Left side of '||' is false
   net/netfilter/nf_tables_api.c:2023:6: note: Assuming the condition is fa=
lse
               ha[NFTA_HOOK_PRIORITY] =3D=3D NULL)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:2022:2: note: Taking false branch
           if (ha[NFTA_HOOK_HOOKNUM] =3D=3D NULL ||
           ^
   net/netfilter/nf_tables_api.c:2030:6: note: Assuming 'type' is non-null
           if (!type)
               ^~~~~
   net/netfilter/nf_tables_api.c:2030:2: note: Taking false branch
           if (!type)
           ^
   net/netfilter/nf_tables_api.c:2033:6: note: Assuming the condition is tr=
ue
           if (nla[NFTA_CHAIN_TYPE]) {
               ^~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:2033:2: note: Taking true branch
           if (nla[NFTA_CHAIN_TYPE]) {
           ^
   net/netfilter/nf_tables_api.c:2036:3: note: Taking true branch
                   if (IS_ERR(type)) {
                   ^
   net/netfilter/nf_tables_api.c:2037:4: note: Assuming 'extack' is null
                           NL_SET_BAD_ATTR(extack, nla[NFTA_CHAIN_TYPE]);
                           ^
   include/linux/netlink.h:111:39: note: expanded from macro 'NL_SET_BAD_AT=
TR'
   #define NL_SET_BAD_ATTR(extack, attr) NL_SET_BAD_ATTR_POLICY(extack, att=
r, NULL)
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/linux/netlink.h:105:6: note: expanded from macro 'NL_SET_BAD_ATT=
R_POLICY'
           if ((extack)) {                                 \
               ^~~~~~~~
   net/netfilter/nf_tables_api.c:2037:4: note: Taking false branch
                           NL_SET_BAD_ATTR(extack, nla[NFTA_CHAIN_TYPE]);
                           ^
   include/linux/netlink.h:111:39: note: expanded from macro 'NL_SET_BAD_AT=
TR'
   #define NL_SET_BAD_ATTR(extack, attr) NL_SET_BAD_ATTR_POLICY(extack, att=
r, NULL)
                                         ^
   include/linux/netlink.h:105:2: note: expanded from macro 'NL_SET_BAD_ATT=
R_POLICY'
           if ((extack)) {                                 \
           ^
   net/netfilter/nf_tables_api.c:2037:4: note: Loop condition is false.  Ex=
iting loop
                           NL_SET_BAD_ATTR(extack, nla[NFTA_CHAIN_TYPE]);
                           ^
   include/linux/netlink.h:111:39: note: expanded from macro 'NL_SET_BAD_AT=
TR'
   #define NL_SET_BAD_ATTR(extack, attr) NL_SET_BAD_ATTR_POLICY(extack, att=
r, NULL)
                                         ^
   include/linux/netlink.h:104:51: note: expanded from macro 'NL_SET_BAD_AT=
TR_POLICY'
   #define NL_SET_BAD_ATTR_POLICY(extack, attr, pol) do {  \
                                                     ^
   net/netfilter/nf_tables_api.c:2038:4: note: Returning without writing to=
 'hook->type'
                           return PTR_ERR(type);
                           ^
   net/netfilter/nf_tables_api.c:2358:9: note: Returning from 'nft_chain_pa=
rse_hook'
                   err =3D nft_chain_parse_hook(ctx->net, nla, &hook, ctx->=
family,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   net/netfilter/nf_tables_api.c:2360:7: note: Assuming 'err' is >=3D 0
                   if (err < 0)
                       ^~~~~~~
   net/netfilter/nf_tables_api.c:2360:3: note: Taking false branch
                   if (err < 0)
                   ^
   net/netfilter/nf_tables_api.c:2364:23: note: The right operand of '!=3D'=
 is a garbage value
                   if (basechain->type !=3D hook.type) {
                                       ^  ~~~~~~~~~
   net/netfilter/nf_tables_api.c:2807:3: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(info->tb, 0, sizeof(info->tb[0]) * (type->maxattr=
 + 1));
                   ^~~~~~
   net/netfilter/nf_tables_api.c:2807:3: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
                   memset(info->tb, 0, sizeof(info->tb[0]) * (type->maxattr=
 + 1));
                   ^~~~~~
>> net/netfilter/nf_tables_api.c:2879:8: warning: Access to field 'type' re=
sults in a dereference of an undefined pointer value (loaded from field 'op=
s') [clang-analyzer-core.NullDereference]
           if (!(expr_info.ops->type->flags & NFT_EXPR_STATEFUL))
                 ^
   net/netfilter/nf_tables_api.c:5791:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/netfilter/nf_tables_api.c:5791:2: note: Taking false branch
           if (err < 0)
           ^
   net/netfilter/nf_tables_api.c:5797:6: note: 'err' is >=3D 0
           if (err < 0)
               ^~~
   net/netfilter/nf_tables_api.c:5797:2: note: Taking false branch
           if (err < 0)
           ^
   net/netfilter/nf_tables_api.c:5800:6: note: Assuming the condition is fa=
lse
           if (!nla[NFTA_SET_ELEM_KEY] && !(flags & NFT_SET_ELEM_CATCHALL))
               ^~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5800:30: note: Left side of '&&' is false
           if (!nla[NFTA_SET_ELEM_KEY] && !(flags & NFT_SET_ELEM_CATCHALL))
                                       ^
   net/netfilter/nf_tables_api.c:5803:6: note: Assuming 'flags' is equal to=
 0
           if (flags !=3D 0)
               ^~~~~~~~~~
   net/netfilter/nf_tables_api.c:5803:2: note: Taking false branch
           if (flags !=3D 0)
           ^
   net/netfilter/nf_tables_api.c:5806:6: note: Assuming the condition is fa=
lse
           if (set->flags & NFT_SET_MAP) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5806:2: note: Taking false branch
           if (set->flags & NFT_SET_MAP) {
           ^
   net/netfilter/nf_tables_api.c:5811:7: note: Assuming the condition is fa=
lse
                   if (nla[NFTA_SET_ELEM_DATA] !=3D NULL)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5811:3: note: Taking false branch
                   if (nla[NFTA_SET_ELEM_DATA] !=3D NULL)
                   ^
   net/netfilter/nf_tables_api.c:5815:42: note: Left side of '&&' is false
           if ((flags & NFT_SET_ELEM_INTERVAL_END) &&
                                                   ^
   net/netfilter/nf_tables_api.c:5826:6: note: Assuming the condition is fa=
lse
           if (nla[NFTA_SET_ELEM_TIMEOUT] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5826:2: note: Taking false branch
           if (nla[NFTA_SET_ELEM_TIMEOUT] !=3D NULL) {
           ^
   net/netfilter/nf_tables_api.c:5833:13: note: Assuming the condition is f=
alse
           } else if (set->flags & NFT_SET_TIMEOUT) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5833:9: note: Taking false branch
           } else if (set->flags & NFT_SET_TIMEOUT) {
                  ^
   net/netfilter/nf_tables_api.c:5838:6: note: Assuming the condition is fa=
lse
           if (nla[NFTA_SET_ELEM_EXPIRATION] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5838:2: note: Taking false branch
           if (nla[NFTA_SET_ELEM_EXPIRATION] !=3D NULL) {
           ^
   net/netfilter/nf_tables_api.c:5847:6: note: Assuming the condition is tr=
ue
           if (nla[NFTA_SET_ELEM_EXPR]) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5847:2: note: Taking true branch
           if (nla[NFTA_SET_ELEM_EXPR]) {
           ^
   net/netfilter/nf_tables_api.c:5850:7: note: Assuming field 'num_exprs' i=
s 0
                   if (set->num_exprs && set->num_exprs !=3D 1)
                       ^~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5850:22: note: Left side of '&&' is false
                   if (set->num_exprs && set->num_exprs !=3D 1)
                                      ^
   net/netfilter/nf_tables_api.c:5853:10: note: Calling 'nft_set_elem_expr_=
alloc'
                   expr =3D nft_set_elem_expr_alloc(ctx, set,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5415:9: note: Calling 'nft_expr_init'
           expr =3D nft_expr_init(ctx, attr);
                  ^~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:2874:8: note: Calling 'nf_tables_expr_pars=
e'
           err =3D nf_tables_expr_parse(ctx, nla, &expr_info);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:2793:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/netfilter/nf_tables_api.c:2793:2: note: Taking false branch
           if (err < 0)
           ^
   net/netfilter/nf_tables_api.c:2797:2: note: Taking true branch
           if (IS_ERR(type))
           ^
   net/netfilter/nf_tables_api.c:2798:3: note: Returning without writing to=
 'info->ops'
                   return PTR_ERR(type);
                   ^
   net/netfilter/nf_tables_api.c:2874:8: note: Returning from 'nf_tables_ex=
pr_parse'
           err =3D nf_tables_expr_parse(ctx, nla, &expr_info);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:2875:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/netfilter/nf_tables_api.c:2875:2: note: Taking false branch
           if (err < 0)

vim +2879 net/netfilter/nf_tables_api.c

96518518cc417b Patrick McHardy   2013-10-14  2865  =

795a6d6b42244d Pablo Neira Ayuso 2020-03-11  2866  static struct nft_expr *=
nft_expr_init(const struct nft_ctx *ctx,
0b2d8a7b638b50 Patrick McHardy   2015-04-11  2867  				      const struct n=
lattr *nla)
0b2d8a7b638b50 Patrick McHardy   2015-04-11  2868  {
7dab8ee3b6e7ec Pablo Neira Ayuso 2021-04-23  2869  	struct nft_expr_info ex=
pr_info;
0b2d8a7b638b50 Patrick McHardy   2015-04-11  2870  	struct nft_expr *expr;
b8e204006340b7 Pablo Neira Ayuso 2019-02-13  2871  	struct module *owner;
0b2d8a7b638b50 Patrick McHardy   2015-04-11  2872  	int err;
0b2d8a7b638b50 Patrick McHardy   2015-04-11  2873  =

7dab8ee3b6e7ec Pablo Neira Ayuso 2021-04-23  2874  	err =3D nf_tables_expr_=
parse(ctx, nla, &expr_info);
0b2d8a7b638b50 Patrick McHardy   2015-04-11  2875  	if (err < 0)
520778042ccca0 Pablo Neira Ayuso 2022-05-25  2876  		goto err_expr_parse;
520778042ccca0 Pablo Neira Ayuso 2022-05-25  2877  =

520778042ccca0 Pablo Neira Ayuso 2022-05-25  2878  	err =3D -EOPNOTSUPP;
520778042ccca0 Pablo Neira Ayuso 2022-05-25 @2879  	if (!(expr_info.ops->ty=
pe->flags & NFT_EXPR_STATEFUL))
520778042ccca0 Pablo Neira Ayuso 2022-05-25  2880  		goto err_expr_stateful;
0b2d8a7b638b50 Patrick McHardy   2015-04-11  2881  =

0b2d8a7b638b50 Patrick McHardy   2015-04-11  2882  	err =3D -ENOMEM;
33758c891479ea Vasily Averin     2022-03-24  2883  	expr =3D kzalloc(expr_i=
nfo.ops->size, GFP_KERNEL_ACCOUNT);
0b2d8a7b638b50 Patrick McHardy   2015-04-11  2884  	if (expr =3D=3D NULL)
520778042ccca0 Pablo Neira Ayuso 2022-05-25  2885  		goto err_expr_stateful;
0b2d8a7b638b50 Patrick McHardy   2015-04-11  2886  =

7dab8ee3b6e7ec Pablo Neira Ayuso 2021-04-23  2887  	err =3D nf_tables_newex=
pr(ctx, &expr_info, expr);
0b2d8a7b638b50 Patrick McHardy   2015-04-11  2888  	if (err < 0)
520778042ccca0 Pablo Neira Ayuso 2022-05-25  2889  		goto err_expr_new;
0b2d8a7b638b50 Patrick McHardy   2015-04-11  2890  =

0b2d8a7b638b50 Patrick McHardy   2015-04-11  2891  	return expr;
520778042ccca0 Pablo Neira Ayuso 2022-05-25  2892  err_expr_new:
6cafaf4764a325 Liping Zhang      2016-06-20  2893  	kfree(expr);
520778042ccca0 Pablo Neira Ayuso 2022-05-25  2894  err_expr_stateful:
7dab8ee3b6e7ec Pablo Neira Ayuso 2021-04-23  2895  	owner =3D expr_info.ops=
->type->owner;
7dab8ee3b6e7ec Pablo Neira Ayuso 2021-04-23  2896  	if (expr_info.ops->type=
->release_ops)
7dab8ee3b6e7ec Pablo Neira Ayuso 2021-04-23  2897  		expr_info.ops->type->r=
elease_ops(expr_info.ops);
b8e204006340b7 Pablo Neira Ayuso 2019-02-13  2898  =

b8e204006340b7 Pablo Neira Ayuso 2019-02-13  2899  	module_put(owner);
520778042ccca0 Pablo Neira Ayuso 2022-05-25  2900  err_expr_parse:
0b2d8a7b638b50 Patrick McHardy   2015-04-11  2901  	return ERR_PTR(err);
0b2d8a7b638b50 Patrick McHardy   2015-04-11  2902  }
0b2d8a7b638b50 Patrick McHardy   2015-04-11  2903  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7369686185485795979==--

