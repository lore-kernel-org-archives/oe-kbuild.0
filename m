Content-Type: multipart/mixed; boundary="===============8618813178800140792=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/netfilter/nf_tables_api.c:8291:2: warning: Value stored to 'size' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 30 Jan 2022 22:38:17 +0800
Message-ID: <202201302204.8UDi2PBh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8618813178800140792==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Pablo Neira Ayuso <pablo@netfilter.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   24f4db1f3a2725a6308105081d822b26889e1018
commit: 12e4ecfa244be2f117ef5304d2d866b65e70bff3 netfilter: nf_tables: add =
register tracking infrastructure
date:   3 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-c006-20220129 (https://download.01.org/0day-ci/arc=
hive/20220130/202201302204.8UDi2PBh-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 33b45e=
e44b1f32ffdbc995e6fec806271b4b3ba4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D12e4ecfa244be2f117ef5304d2d866b65e70bff3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 12e4ecfa244be2f117ef5304d2d866b65e70bff3
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                              ^~~~~~~~~
   net/netfilter/nf_tables_api.c:8270:6: note: Assuming field 'blob_next' i=
s null
           if (chain->blob_next || !nft_is_active_next(net, chain))
               ^~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:8270:6: note: Left side of '||' is false
   net/netfilter/nf_tables_api.c:8270:27: note: Assuming the condition is t=
rue
           if (chain->blob_next || !nft_is_active_next(net, chain))
                                    ^
   include/net/netfilter/nf_tables.h:1419:3: note: expanded from macro 'nft=
_is_active_next'
           (((__obj)->genmask & nft_genmask_next(__net)) =3D=3D 0)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:8270:2: note: Taking false branch
           if (chain->blob_next || !nft_is_active_next(net, chain))
           ^
   net/netfilter/nf_tables_api.c:8276:2: note: Loop condition is true.  Ent=
ering loop body
           list_for_each_entry_continue(rule, &chain->rules, list) {
           ^
   include/linux/list.h:666:2: note: expanded from macro 'list_for_each_ent=
ry_continue'
           for (pos =3D list_next_entry(pos, member);                      =
  \
           ^
   net/netfilter/nf_tables_api.c:8277:7: note: Assuming the condition is tr=
ue
                   if (nft_is_active_next(net, rule)) {
                       ^
   include/net/netfilter/nf_tables.h:1419:3: note: expanded from macro 'nft=
_is_active_next'
           (((__obj)->genmask & nft_genmask_next(__net)) =3D=3D 0)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:8277:3: note: Taking true branch
                   if (nft_is_active_next(net, rule)) {
                   ^
   net/netfilter/nf_tables_api.c:8278:14: note: The left expression of the =
compound assignment is an uninitialized value. The computed value will also=
 be garbage
                           data_size +=3D sizeof(*prule) + rule->dlen;
                           ~~~~~~~~~ ^
   net/netfilter/nf_tables_api.c:8283:12: warning: The left expression of t=
he compound assignment is an uninitialized value. The computed value will a=
lso be garbage [clang-analyzer-core.uninitialized.Assign]
           data_size +=3D offsetof(struct nft_rule_dp, data);        /* las=
t rule */
                     ^
   net/netfilter/nf_tables_api.c:8603:6: note: Assuming the condition is fa=
lse
           if (list_empty(&nft_net->commit_list)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:8603:2: note: Taking false branch
           if (list_empty(&nft_net->commit_list)) {
           ^
   net/netfilter/nf_tables_api.c:8609:2: note: Taking false branch
           if (nf_tables_validate(net) < 0)
           ^
   net/netfilter/nf_tables_api.c:8613:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/netfilter/nf_tables_api.c:8613:2: note: Taking false branch
           if (err < 0)
           ^
   net/netfilter/nf_tables_api.c:8617:2: note: Loop condition is true.  Ent=
ering loop body
           list_for_each_entry_safe(trans, next, &nft_net->commit_list, lis=
t) {
           ^
   include/linux/list.h:717:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   net/netfilter/nf_tables_api.c:8621:7: note: 'ret' is 0
                   if (ret) {
                       ^~~
   net/netfilter/nf_tables_api.c:8621:3: note: Taking false branch
                   if (ret) {
                   ^
   net/netfilter/nf_tables_api.c:8626:7: note: Assuming field 'msg_type' is=
 not equal to NFT_MSG_NEWRULE
                   if (trans->msg_type =3D=3D NFT_MSG_NEWRULE ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:8626:7: note: Left side of '||' is false
   net/netfilter/nf_tables_api.c:8627:7: note: Assuming field 'msg_type' is=
 equal to NFT_MSG_DELRULE
                       trans->msg_type =3D=3D NFT_MSG_DELRULE) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:8626:3: note: Taking true branch
                   if (trans->msg_type =3D=3D NFT_MSG_NEWRULE ||
                   ^
   net/netfilter/nf_tables_api.c:8630:10: note: Calling 'nf_tables_commit_c=
hain_prepare'
                           ret =3D nf_tables_commit_chain_prepare(net, chai=
n);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:8263:21: note: 'data_size' declared withou=
t an initial value
           unsigned int size, data_size;
                              ^~~~~~~~~
   net/netfilter/nf_tables_api.c:8270:6: note: Assuming field 'blob_next' i=
s null
           if (chain->blob_next || !nft_is_active_next(net, chain))
               ^~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:8270:6: note: Left side of '||' is false
   net/netfilter/nf_tables_api.c:8270:27: note: Assuming the condition is t=
rue
           if (chain->blob_next || !nft_is_active_next(net, chain))
                                    ^
   include/net/netfilter/nf_tables.h:1419:3: note: expanded from macro 'nft=
_is_active_next'
           (((__obj)->genmask & nft_genmask_next(__net)) =3D=3D 0)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:8270:2: note: Taking false branch
           if (chain->blob_next || !nft_is_active_next(net, chain))
           ^
   net/netfilter/nf_tables_api.c:8276:2: note: Loop condition is false. Exe=
cution continues on line 8283
           list_for_each_entry_continue(rule, &chain->rules, list) {
           ^
   include/linux/list.h:666:2: note: expanded from macro 'list_for_each_ent=
ry_continue'
           for (pos =3D list_next_entry(pos, member);                      =
  \
           ^
   net/netfilter/nf_tables_api.c:8283:12: note: The left expression of the =
compound assignment is an uninitialized value. The computed value will also=
 be garbage
           data_size +=3D offsetof(struct nft_rule_dp, data);        /* las=
t rule */
           ~~~~~~~~~ ^
>> net/netfilter/nf_tables_api.c:8291:2: warning: Value stored to 'size' is=
 never read [clang-analyzer-deadcode.DeadStores]
           size =3D 0;
           ^      ~
   net/netfilter/nf_tables_api.c:8291:2: note: Value stored to 'size' is ne=
ver read
           size =3D 0;
           ^      ~
   net/netfilter/nf_tables_api.c:8327:3: warning: Value stored to 'size' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   size =3D 0;
                   ^      ~
   net/netfilter/nf_tables_api.c:8327:3: note: Value stored to 'size' is ne=
ver read
                   size =3D 0;
                   ^      ~
   net/netfilter/nf_tables_api.c:9019:2: warning: Use of memory after it is=
 freed [clang-analyzer-unix.Malloc]
           list_for_each_entry_safe_reverse(trans, next,
           ^
   include/linux/list.h:765:7: note: expanded from macro 'list_for_each_ent=
ry_safe_reverse'
                   n =3D list_prev_entry(pos, member);                     =
  \
                       ^
   include/linux/list.h:565:2: note: expanded from macro 'list_prev_entry'
           list_entry((pos)->member.prev, typeof(*(pos)), member)
           ^
   include/linux/list.h:513:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^
   net/netfilter/nf_tables_api.c:9791:6: note: Assuming the condition is tr=
ue
           if (!list_empty(&nft_net->commit_list))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:9791:2: note: Taking true branch
           if (!list_empty(&nft_net->commit_list))
           ^
   net/netfilter/nf_tables_api.c:9792:3: note: Calling '__nf_tables_abort'
                   __nf_tables_abort(net, NFNL_ABORT_NONE);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:8877:6: note: 'action' is not equal to NFN=
L_ABORT_VALIDATE
           if (action =3D=3D NFNL_ABORT_VALIDATE &&
               ^~~~~~
   net/netfilter/nf_tables_api.c:8877:36: note: Left side of '&&' is false
           if (action =3D=3D NFNL_ABORT_VALIDATE &&
                                             ^
   net/netfilter/nf_tables_api.c:8881:2: note: Loop condition is true.  Ent=
ering loop body
           list_for_each_entry_safe_reverse(trans, next, &nft_net->commit_l=
ist,
           ^
   include/linux/list.h:764:2: note: expanded from macro 'list_for_each_ent=
ry_safe_reverse'
           for (pos =3D list_last_entry(head, typeof(*pos), member),       =
  \
           ^
   net/netfilter/nf_tables_api.c:8883:3: note: Control jumps to 'case NFT_M=
SG_DELFLOWTABLE:'  at line 9004
                   switch (trans->msg_type) {
                   ^
   net/netfilter/nf_tables_api.c:9005:8: note: Assuming field 'update' is f=
alse
                           if (nft_trans_flowtable_update(trans)) {
                               ^
   include/net/netfilter/nf_tables.h:1594:2: note: expanded from macro 'nft=
_trans_flowtable_update'
           (((struct nft_trans_flowtable *)trans->data)->update)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:9005:4: note: Taking false branch
                           if (nft_trans_flowtable_update(trans)) {
                           ^
   net/netfilter/nf_tables_api.c:9012:4: note: Calling 'nft_trans_destroy'
                           nft_trans_destroy(trans);
                           ^~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:171:2: note: Memory is released
           kfree(trans);
           ^~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:9012:4: note: Returning; memory was releas=
ed via 1st parameter
                           nft_trans_destroy(trans);
                           ^~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:9013:4: note:  Execution continues on line=
 8881
                           break;
                           ^
   net/netfilter/nf_tables_api.c:8881:2: note: Loop condition is false. Exe=
cution continues on line 9017
           list_for_each_entry_safe_reverse(trans, next, &nft_net->commit_l=
ist,
           ^
   include/linux/list.h:764:2: note: expanded from macro 'list_for_each_ent=
ry_safe_reverse'
           for (pos =3D list_last_entry(head, typeof(*pos), member),       =
  \
           ^
   net/netfilter/nf_tables_api.c:9019:2: note: Use of memory after it is fr=
eed
           list_for_each_entry_safe_reverse(trans, next,
           ^
   include/linux/list.h:765:7: note: expanded from macro 'list_for_each_ent=
ry_safe_reverse'
                   n =3D list_prev_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:565:2: note: expanded from macro 'list_prev_entry'
           list_entry((pos)->member.prev, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:513:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   Suppressed 6 warnings (4 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   net/bluetooth/hci_event.c:1144:37: warning: Value stored to 'rp' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct hci_rp_read_local_oob_data *rp =3D (void *) skb->data;
                                              ^~   ~~~~~~~~~~~~~~~~~~
   net/bluetooth/hci_event.c:1144:37: note: Value stored to 'rp' during its=
 initialization is never read
           struct hci_rp_read_local_oob_data *rp =3D (void *) skb->data;

vim +/size +8291 net/netfilter/nf_tables_api.c

ffe8923f109b7e Florian Westphal  2020-07-24  8258  =

0cbc06b3faba75 Florian Westphal  2018-05-25  8259  static int nf_tables_com=
mit_chain_prepare(struct net *net, struct nft_chain *chain)
0cbc06b3faba75 Florian Westphal  2018-05-25  8260  {
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8261  	const struct nft_expr *=
expr, *last;
12e4ecfa244be2 Pablo Neira Ayuso 2022-01-09  8262  	struct nft_regs_track t=
rack =3D {};
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8263  	unsigned int size, data=
_size;
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8264  	void *data, *data_bound=
ary;
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8265  	struct nft_rule_dp *pru=
le;
0cbc06b3faba75 Florian Westphal  2018-05-25  8266  	struct nft_rule *rule;
0cbc06b3faba75 Florian Westphal  2018-05-25  8267  	int i;
0cbc06b3faba75 Florian Westphal  2018-05-25  8268  =

0cbc06b3faba75 Florian Westphal  2018-05-25  8269  	/* already handled or i=
nactive chain? */
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8270  	if (chain->blob_next ||=
 !nft_is_active_next(net, chain))
0cbc06b3faba75 Florian Westphal  2018-05-25  8271  		return 0;
0cbc06b3faba75 Florian Westphal  2018-05-25  8272  =

0cbc06b3faba75 Florian Westphal  2018-05-25  8273  	rule =3D list_entry(&ch=
ain->rules, struct nft_rule, list);
0cbc06b3faba75 Florian Westphal  2018-05-25  8274  	i =3D 0;
0cbc06b3faba75 Florian Westphal  2018-05-25  8275  =

0cbc06b3faba75 Florian Westphal  2018-05-25 @8276  	list_for_each_entry_con=
tinue(rule, &chain->rules, list) {
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8277  		if (nft_is_active_next=
(net, rule)) {
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8278  			data_size +=3D sizeof=
(*prule) + rule->dlen;
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8279  			if (data_size > INT_M=
AX)
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8280  				return -ENOMEM;
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8281  		}
0cbc06b3faba75 Florian Westphal  2018-05-25  8282  	}
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8283  	data_size +=3D offsetof=
(struct nft_rule_dp, data);	/* last rule */
0cbc06b3faba75 Florian Westphal  2018-05-25  8284  =

2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8285  	chain->blob_next =3D nf=
_tables_chain_alloc_rules(data_size);
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8286  	if (!chain->blob_next)
0cbc06b3faba75 Florian Westphal  2018-05-25  8287  		return -ENOMEM;
0cbc06b3faba75 Florian Westphal  2018-05-25  8288  =

2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8289  	data =3D (void *)chain-=
>blob_next->data;
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8290  	data_boundary =3D data =
+ data_size;
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09 @8291  	size =3D 0;
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8292  =

0cbc06b3faba75 Florian Westphal  2018-05-25  8293  	list_for_each_entry_con=
tinue(rule, &chain->rules, list) {
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8294  		if (!nft_is_active_nex=
t(net, rule))
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8295  			continue;
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8296  =

2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8297  		prule =3D (struct nft_=
rule_dp *)data;
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8298  		data +=3D offsetof(str=
uct nft_rule_dp, data);
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8299  		if (WARN_ON_ONCE(data =
> data_boundary))
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8300  			return -ENOMEM;
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8301  =

12e4ecfa244be2 Pablo Neira Ayuso 2022-01-09  8302  		size =3D 0;
12e4ecfa244be2 Pablo Neira Ayuso 2022-01-09  8303  		track.last =3D last;
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8304  		nft_rule_for_each_expr=
(expr, last, rule) {
12e4ecfa244be2 Pablo Neira Ayuso 2022-01-09  8305  			track.cur =3D expr;
12e4ecfa244be2 Pablo Neira Ayuso 2022-01-09  8306  =

12e4ecfa244be2 Pablo Neira Ayuso 2022-01-09  8307  			if (expr->ops->reduce=
 &&
12e4ecfa244be2 Pablo Neira Ayuso 2022-01-09  8308  			    expr->ops->reduce=
(&track, expr)) {
12e4ecfa244be2 Pablo Neira Ayuso 2022-01-09  8309  				expr =3D track.cur;
12e4ecfa244be2 Pablo Neira Ayuso 2022-01-09  8310  				continue;
12e4ecfa244be2 Pablo Neira Ayuso 2022-01-09  8311  			}
12e4ecfa244be2 Pablo Neira Ayuso 2022-01-09  8312  =

2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8313  			if (WARN_ON_ONCE(data=
 + expr->ops->size > data_boundary))
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8314  				return -ENOMEM;
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8315  =

2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8316  			memcpy(data + size, e=
xpr, expr->ops->size);
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8317  			size +=3D expr->ops->=
size;
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8318  		}
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8319  		if (WARN_ON_ONCE(size =
>=3D 1 << 12))
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8320  			return -ENOMEM;
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8321  =

2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8322  		prule->handle =3D rule=
->handle;
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8323  		prule->dlen =3D size;
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8324  		prule->is_last =3D 0;
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8325  =

2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8326  		data +=3D size;
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8327  		size =3D 0;
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8328  		chain->blob_next->size=
 +=3D (unsigned long)(data - (void *)prule);
0cbc06b3faba75 Florian Westphal  2018-05-25  8329  	}
0cbc06b3faba75 Florian Westphal  2018-05-25  8330  =

2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8331  	prule =3D (struct nft_r=
ule_dp *)data;
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8332  	data +=3D offsetof(stru=
ct nft_rule_dp, data);
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8333  	if (WARN_ON_ONCE(data >=
 data_boundary))
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8334  		return -ENOMEM;
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8335  =

2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8336  	nft_last_rule(chain->bl=
ob_next, prule);
2c865a8a28a10e Pablo Neira Ayuso 2022-01-09  8337  =

0cbc06b3faba75 Florian Westphal  2018-05-25  8338  	return 0;
0cbc06b3faba75 Florian Westphal  2018-05-25  8339  }
0cbc06b3faba75 Florian Westphal  2018-05-25  8340  =


:::::: The code at line 8291 was first introduced by commit
:::::: 2c865a8a28a10e9800a3dd07ca339d24563e3d65 netfilter: nf_tables: add r=
ule blob layout

:::::: TO: Pablo Neira Ayuso <pablo@netfilter.org>
:::::: CC: Pablo Neira Ayuso <pablo@netfilter.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8618813178800140792==--

