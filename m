Content-Type: multipart/mixed; boundary="===============7723160808006819160=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/netfilter/nf_tables_api.c:2034:18: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Tue, 01 Feb 2022 16:53:56 +0800
Message-ID: <202202011655.PUMkk8kx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7723160808006819160==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Yajun Deng <yajun.deng@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   26291c54e111ff6ba87a164d85d4a4e134b7315c
commit: f9b282b36dfa9b6c6d6b3e8816cdf0e4defff482 net: netlink: add the case=
 when nlh is NULL
date:   6 months ago
:::::: branch date: 2 days ago
:::::: commit date: 6 months ago
config: riscv-randconfig-c006-20220129 (https://download.01.org/0day-ci/arc=
hive/20220201/202202011655.PUMkk8kx-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 33b45e=
e44b1f32ffdbc995e6fec806271b4b3ba4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df9b282b36dfa9b6c6d6b3e8816cdf0e4defff482
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f9b282b36dfa9b6c6d6b3e8816cdf0e4defff482
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
   net/netfilter/nf_tables_api.c:1940:19: note: '?' condition is false
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
   net/netfilter/nf_tables_api.c:1943:6: note: Assuming 'type' is non-null
           if (!type)
               ^~~~~
   net/netfilter/nf_tables_api.c:1943:2: note: Taking false branch
           if (!type)
           ^
   net/netfilter/nf_tables_api.c:1946:6: note: Assuming the condition is fa=
lse
           if (nla[NFTA_CHAIN_TYPE]) {
               ^~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:1946:2: note: Taking false branch
           if (nla[NFTA_CHAIN_TYPE]) {
           ^
   net/netfilter/nf_tables_api.c:1954:6: note: Assuming the condition is fa=
lse
           if (hook->num >=3D NFT_MAX_HOOKS || !(type->hook_mask & (1 << ho=
ok->num)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:1954:6: note: Left side of '||' is false
   net/netfilter/nf_tables_api.c:1954:36: note: Assuming the condition is f=
alse
           if (hook->num >=3D NFT_MAX_HOOKS || !(type->hook_mask & (1 << ho=
ok->num)))
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   net/netfilter/nf_tables_api.c:1954:2: note: Taking false branch
           if (hook->num >=3D NFT_MAX_HOOKS || !(type->hook_mask & (1 << ho=
ok->num)))
           ^
   net/netfilter/nf_tables_api.c:1957:6: note: Assuming field 'type' is not=
 equal to NFT_CHAIN_T_NAT
           if (type->type =3D=3D NFT_CHAIN_T_NAT &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:1957:36: note: Left side of '&&' is false
           if (type->type =3D=3D NFT_CHAIN_T_NAT &&
                                             ^
   net/netfilter/nf_tables_api.c:1961:2: note: Taking false branch
           if (!try_module_get(type->owner)) {
           ^
   net/netfilter/nf_tables_api.c:1970:2: note: Taking true branch
           if (nft_base_chain_netdev(family, hook->num)) {
           ^
   net/netfilter/nf_tables_api.c:1971:9: note: Calling 'nft_chain_parse_net=
dev'
                   err =3D nft_chain_parse_netdev(net, ha, &hook->list);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:1895:6: note: Assuming the condition is tr=
ue
           if (tb[NFTA_HOOK_DEV]) {
               ^~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:1895:2: note: Taking true branch
           if (tb[NFTA_HOOK_DEV]) {
           ^
   net/netfilter/nf_tables_api.c:1896:10: note: Calling 'nft_netdev_hook_al=
loc'
                   hook =3D nft_netdev_hook_alloc(net, tb[NFTA_HOOK_DEV]);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:1798:9: note: Memory is allocated
           hook =3D kmalloc(sizeof(struct nft_hook), GFP_KERNEL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:1799:6: note: Assuming 'hook' is non-null
           if (!hook) {
               ^~~~~
   net/netfilter/nf_tables_api.c:1799:2: note: Taking false branch
           if (!hook) {
           ^
   net/netfilter/nf_tables_api.c:1810:6: note: Assuming 'dev' is non-null
           if (!dev) {
               ^~~~
   net/netfilter/nf_tables_api.c:1810:2: note: Taking false branch
           if (!dev) {
           ^
   net/netfilter/nf_tables_api.c:1896:10: note: Returned allocated memory
                   hook =3D nft_netdev_hook_alloc(net, tb[NFTA_HOOK_DEV]);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:1897:3: note: Taking true branch
                   if (IS_ERR(hook))
                   ^
   net/netfilter/nf_tables_api.c:1971:9: note: Returned allocated memory
                   err =3D nft_chain_parse_netdev(net, ha, &hook->list);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:1972:7: note: 'err' is >=3D 0
                   if (err < 0) {
                       ^~~
   net/netfilter/nf_tables_api.c:1972:3: note: Taking false branch
                   if (err < 0) {
                   ^
   net/netfilter/nf_tables_api.c:1981:9: note: Potential leak of memory poi=
nted to by 'err'
           return 0;
                  ^
>> net/netfilter/nf_tables_api.c:2034:18: warning: Assigned value is garbag=
e or undefined [clang-analyzer-core.uninitialized.Assign]
           basechain->type =3D hook->type;
                           ^
   net/netfilter/nf_tables_api.c:2091:6: note: Assuming the condition is fa=
lse
           if (table->use =3D=3D UINT_MAX)
               ^~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:2091:2: note: Taking false branch
           if (table->use =3D=3D UINT_MAX)
           ^
   net/netfilter/nf_tables_api.c:2094:6: note: Assuming the condition is tr=
ue
           if (nla[NFTA_CHAIN_HOOK]) {
               ^~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:2094:2: note: Taking true branch
           if (nla[NFTA_CHAIN_HOOK]) {
           ^
   net/netfilter/nf_tables_api.c:2097:7: note: Assuming the condition is fa=
lse
                   if (flags & NFT_CHAIN_BINDING)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:2097:3: note: Taking false branch
                   if (flags & NFT_CHAIN_BINDING)
                   ^
   net/netfilter/nf_tables_api.c:2100:9: note: Calling 'nft_chain_parse_hoo=
k'
                   err =3D nft_chain_parse_hook(net, nla, &hook, family, ex=
tack,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   net/netfilter/nf_tables_api.c:1926:2: note: Assuming 'debug_locks' is 0
           lockdep_assert_held(&nft_net->commit_mutex);
           ^
   include/linux/lockdep.h:310:11: note: expanded from macro 'lockdep_asser=
t_held'
                   WARN_ON(debug_locks &&                                  \
                           ^~~~~~~~~~~
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   net/netfilter/nf_tables_api.c:1926:2: note: Left side of '&&' is false
           lockdep_assert_held(&nft_net->commit_mutex);
           ^
   include/linux/lockdep.h:310:23: note: expanded from macro 'lockdep_asser=
t_held'
                   WARN_ON(debug_locks &&                                  \
                                       ^
   net/netfilter/nf_tables_api.c:1926:2: note: Loop condition is false.  Ex=
iting loop
           lockdep_assert_held(&nft_net->commit_mutex);
           ^
   include/linux/lockdep.h:309:32: note: expanded from macro 'lockdep_asser=
t_held'
   #define lockdep_assert_held(l)  do {                                    \
                                   ^
   net/netfilter/nf_tables_api.c:1932:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/netfilter/nf_tables_api.c:1932:2: note: Taking false branch
           if (err < 0)
           ^
   net/netfilter/nf_tables_api.c:1935:6: note: Assuming the condition is fa=
lse
           if (ha[NFTA_HOOK_HOOKNUM] =3D=3D NULL ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:1935:6: note: Left side of '||' is false
   net/netfilter/nf_tables_api.c:1936:6: note: Assuming the condition is fa=
lse
               ha[NFTA_HOOK_PRIORITY] =3D=3D NULL)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:1935:2: note: Taking false branch
           if (ha[NFTA_HOOK_HOOKNUM] =3D=3D NULL ||
           ^
   net/netfilter/nf_tables_api.c:1939:14: note: '?' condition is false
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
   net/netfilter/nf_tables_api.c:1940:19: note: '?' condition is false
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
   net/netfilter/nf_tables_api.c:1943:6: note: Assuming 'type' is non-null
           if (!type)
               ^~~~~
   net/netfilter/nf_tables_api.c:1943:2: note: Taking false branch
           if (!type)
           ^
   net/netfilter/nf_tables_api.c:1946:6: note: Assuming the condition is tr=
ue
           if (nla[NFTA_CHAIN_TYPE]) {
               ^~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:1946:2: note: Taking true branch

vim +2034 net/netfilter/nf_tables_api.c

d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1915  =

508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1916  static int nft_chain_par=
se_hook(struct net *net,
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1917  				const struct nlattr =
* const nla[],
36596dadf54a92 Pablo Neira Ayuso 2018-01-09  1918  				struct nft_chain_hoo=
k *hook, u8 family,
983c4fcb81d6bd Pablo Neira Ayuso 2021-05-19  1919  				struct netlink_ext_a=
ck *extack, bool autoload)
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1920  {
d59d2f82f984df Pablo Neira Ayuso 2021-04-23  1921  	struct nftables_pernet =
*nft_net =3D nft_pernet(net);
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1922  	struct nlattr *ha[NFTA_=
HOOK_MAX + 1];
32537e91847a56 Pablo Neira Ayuso 2018-03-27  1923  	const struct nft_chain_=
type *type;
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1924  	int err;
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1925  =

0854db2aaef3fc Florian Westphal  2021-04-01  1926  	lockdep_assert_held(&nf=
t_net->commit_mutex);
f102d66b335a41 Florian Westphal  2018-07-11  1927  	lockdep_nfnl_nft_mutex_=
not_held();
f102d66b335a41 Florian Westphal  2018-07-11  1928  =

8cb081746c031f Johannes Berg     2019-04-26  1929  	err =3D nla_parse_neste=
d_deprecated(ha, NFTA_HOOK_MAX,
8cb081746c031f Johannes Berg     2019-04-26  1930  					  nla[NFTA_CHAIN_HO=
OK],
fceb6435e85298 Johannes Berg     2017-04-12  1931  					  nft_hook_policy, =
NULL);
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1932  	if (err < 0)
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1933  		return err;
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1934  =

508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1935  	if (ha[NFTA_HOOK_HOOKNU=
M] =3D=3D NULL ||
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1936  	    ha[NFTA_HOOK_PRIORI=
TY] =3D=3D NULL)
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1937  		return -EINVAL;
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1938  =

508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1939  	hook->num =3D ntohl(nla=
_get_be32(ha[NFTA_HOOK_HOOKNUM]));
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1940  	hook->priority =3D ntoh=
l(nla_get_be32(ha[NFTA_HOOK_PRIORITY]));
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1941  =

826035498ec14b Pablo Neira Ayuso 2020-01-21  1942  	type =3D __nft_chain_ty=
pe_get(family, NFT_CHAIN_T_DEFAULT);
826035498ec14b Pablo Neira Ayuso 2020-01-21  1943  	if (!type)
826035498ec14b Pablo Neira Ayuso 2020-01-21  1944  		return -EOPNOTSUPP;
826035498ec14b Pablo Neira Ayuso 2020-01-21  1945  =

508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1946  	if (nla[NFTA_CHAIN_TYPE=
]) {
452238e8d5ffd8 Florian Westphal  2018-07-11  1947  		type =3D nf_tables_cha=
in_type_lookup(net, nla[NFTA_CHAIN_TYPE],
445509eb9b0027 Pablo Neira Ayuso 2018-08-03  1948  						   family, autoloa=
d);
983c4fcb81d6bd Pablo Neira Ayuso 2021-05-19  1949  		if (IS_ERR(type)) {
983c4fcb81d6bd Pablo Neira Ayuso 2021-05-19  1950  			NL_SET_BAD_ATTR(extac=
k, nla[NFTA_CHAIN_TYPE]);
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1951  			return PTR_ERR(type);
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1952  		}
983c4fcb81d6bd Pablo Neira Ayuso 2021-05-19  1953  	}
d25e2e9388eda6 Pablo Neira Ayuso 2020-10-14  1954  	if (hook->num >=3D NFT_=
MAX_HOOKS || !(type->hook_mask & (1 << hook->num)))
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1955  		return -EOPNOTSUPP;
84ba7dd71add05 Florian Westphal  2017-12-08  1956  =

84ba7dd71add05 Florian Westphal  2017-12-08  1957  	if (type->type =3D=3D N=
FT_CHAIN_T_NAT &&
84ba7dd71add05 Florian Westphal  2017-12-08  1958  	    hook->priority <=3D=
 NF_IP_PRI_CONNTRACK)
84ba7dd71add05 Florian Westphal  2017-12-08  1959  		return -EOPNOTSUPP;
84ba7dd71add05 Florian Westphal  2017-12-08  1960  =

983c4fcb81d6bd Pablo Neira Ayuso 2021-05-19  1961  	if (!try_module_get(typ=
e->owner)) {
983c4fcb81d6bd Pablo Neira Ayuso 2021-05-19  1962  		if (nla[NFTA_CHAIN_TYP=
E])
983c4fcb81d6bd Pablo Neira Ayuso 2021-05-19  1963  			NL_SET_BAD_ATTR(extac=
k, nla[NFTA_CHAIN_TYPE]);
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1964  		return -ENOENT;
983c4fcb81d6bd Pablo Neira Ayuso 2021-05-19  1965  	}
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1966  =

508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1967  	hook->type =3D type;
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1968  =

d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1969  	INIT_LIST_HEAD(&hook->l=
ist);
d3519cb89f6d59 Pablo Neira Ayuso 2020-10-08  1970  	if (nft_base_chain_netd=
ev(family, hook->num)) {
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1971  		err =3D nft_chain_pars=
e_netdev(net, ha, &hook->list);
d54725cd11a57c Pablo Neira Ayuso 2019-10-16 @1972  		if (err < 0) {
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1973  			module_put(type->owne=
r);
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1974  			return err;
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1975  		}
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1976  	} else if (ha[NFTA_HOOK=
_DEV] || ha[NFTA_HOOK_DEVS]) {
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1977  		module_put(type->owner=
);
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1978  		return -EOPNOTSUPP;
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1979  	}
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1980  =

508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1981  	return 0;
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1982  }
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1983  =

508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1984  static void nft_chain_re=
lease_hook(struct nft_chain_hook *hook)
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1985  {
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1986  	struct nft_hook *h, *ne=
xt;
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1987  =

d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1988  	list_for_each_entry_saf=
e(h, next, &hook->list, list) {
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1989  		list_del(&h->list);
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1990  		kfree(h);
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1991  	}
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1992  	module_put(hook->type->=
owner);
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1993  }
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1994  =

0cbc06b3faba75 Florian Westphal  2018-05-25  1995  struct nft_rules_old {
0cbc06b3faba75 Florian Westphal  2018-05-25  1996  	struct rcu_head h;
0cbc06b3faba75 Florian Westphal  2018-05-25  1997  	struct nft_rule **start;
0cbc06b3faba75 Florian Westphal  2018-05-25  1998  };
0cbc06b3faba75 Florian Westphal  2018-05-25  1999  =

0cbc06b3faba75 Florian Westphal  2018-05-25  2000  static struct nft_rule *=
*nf_tables_chain_alloc_rules(const struct nft_chain *chain,
0cbc06b3faba75 Florian Westphal  2018-05-25  2001  						     unsigned int =
alloc)
0cbc06b3faba75 Florian Westphal  2018-05-25  2002  {
0cbc06b3faba75 Florian Westphal  2018-05-25  2003  	if (alloc > INT_MAX)
0cbc06b3faba75 Florian Westphal  2018-05-25  2004  		return NULL;
0cbc06b3faba75 Florian Westphal  2018-05-25  2005  =

0cbc06b3faba75 Florian Westphal  2018-05-25  2006  	alloc +=3D 1;	/* NULL, =
ends rules */
0cbc06b3faba75 Florian Westphal  2018-05-25  2007  	if (sizeof(struct nft_r=
ule *) > INT_MAX / alloc)
0cbc06b3faba75 Florian Westphal  2018-05-25  2008  		return NULL;
0cbc06b3faba75 Florian Westphal  2018-05-25  2009  =

0cbc06b3faba75 Florian Westphal  2018-05-25  2010  	alloc *=3D sizeof(struc=
t nft_rule *);
0cbc06b3faba75 Florian Westphal  2018-05-25  2011  	alloc +=3D sizeof(struc=
t nft_rules_old);
0cbc06b3faba75 Florian Westphal  2018-05-25  2012  =

0cbc06b3faba75 Florian Westphal  2018-05-25  2013  	return kvmalloc(alloc, =
GFP_KERNEL);
0cbc06b3faba75 Florian Westphal  2018-05-25  2014  }
0cbc06b3faba75 Florian Westphal  2018-05-25  2015  =

d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2016  static void nft_basechai=
n_hook_init(struct nf_hook_ops *ops, u8 family,
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2017  				    const struct nft=
_chain_hook *hook,
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2018  				    struct nft_chain=
 *chain)
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2019  {
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2020  	ops->pf			=3D family;
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2021  	ops->hooknum		=3D hook-=
>num;
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2022  	ops->priority		=3D hook=
->priority;
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2023  	ops->priv		=3D chain;
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2024  	ops->hook		=3D hook->ty=
pe->hooks[ops->hooknum];
c5c6accd7b7e10 Florian Westphal  2021-06-08  2025  	ops->hook_ops_type	=3D =
NF_HOOK_OP_NF_TABLES;
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2026  }
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2027  =

d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2028  static int nft_basechain=
_init(struct nft_base_chain *basechain, u8 family,
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2029  			      struct nft_chai=
n_hook *hook, u32 flags)
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2030  {
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2031  	struct nft_chain *chain;
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2032  	struct nft_hook *h;
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2033  =

d54725cd11a57c Pablo Neira Ayuso 2019-10-16 @2034  	basechain->type =3D hoo=
k->type;
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2035  	INIT_LIST_HEAD(&basecha=
in->hook_list);
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2036  	chain =3D &basechain->c=
hain;
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2037  =

d3519cb89f6d59 Pablo Neira Ayuso 2020-10-08  2038  	if (nft_base_chain_netd=
ev(family, hook->num)) {
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2039  		list_splice_init(&hook=
->list, &basechain->hook_list);
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2040  		list_for_each_entry(h,=
 &basechain->hook_list, list)
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2041  			nft_basechain_hook_in=
it(&h->ops, family, hook, chain);
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2042  =

d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2043  		basechain->ops.hooknum=
	=3D hook->num;
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2044  		basechain->ops.priorit=
y	=3D hook->priority;
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2045  	} else {
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2046  		nft_basechain_hook_ini=
t(&basechain->ops, family, hook, chain);
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2047  	}
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2048  =

67c49de4ad862c Pablo Neira Ayuso 2020-06-30  2049  	chain->flags |=3D NFT_C=
HAIN_BASE | flags;
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2050  	basechain->policy =3D N=
F_ACCEPT;
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2051  	if (chain->flags & NFT_=
CHAIN_HW_OFFLOAD &&
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2052  	    nft_chain_offload_p=
riority(basechain) < 0)
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2053  		return -EOPNOTSUPP;
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2054  =

d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2055  	flow_block_init(&basech=
ain->flow_block);
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2056  =

d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2057  	return 0;
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2058  }
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2059  =


:::::: The code at line 2034 was first introduced by commit
:::::: d54725cd11a57c30f650260cfb0a92c268bdc3e0 netfilter: nf_tables: suppo=
rt for multiple devices per netdev hook

:::::: TO: Pablo Neira Ayuso <pablo@netfilter.org>
:::::: CC: Pablo Neira Ayuso <pablo@netfilter.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7723160808006819160==--

