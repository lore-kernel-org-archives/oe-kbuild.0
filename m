Content-Type: multipart/mixed; boundary="===============7998497659662915654=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/netfilter/nf_tables_api.c:2014:2: warning: Assignment of function parameter has no effect outside the function. Did you forget dereferencing it? [uselessAssignmentPtrArg]
Date: Tue, 25 Jan 2022 08:26:08 +0800
Message-ID: <202201250614.Oo7D9VA6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7998497659662915654==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Pablo Neira Ayuso <pablo@netfilter.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   dd81e1c7d5fb126e5fbc5c9e334d7b3ec29a16a0
commit: 2c865a8a28a10e9800a3dd07ca339d24563e3d65 netfilter: nf_tables: add =
rule blob layout
date:   2 weeks ago
:::::: branch date: 31 hours ago
:::::: commit date: 2 weeks ago
compiler: arceb-elf-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/netfilter/nf_tables_api.c:2014:2: warning: Assignment of function pa=
rameter has no effect outside the function. Did you forget dereferencing it=
? [uselessAssignmentPtrArg]
    ptr +=3D offsetof(struct nft_rule_dp, data);
    ^
>> net/netfilter/nf_tables_api.c:1839:24: warning: Uninitialized variable: =
hook [uninitvar]
     if (this->ops.dev =3D=3D hook->ops.dev)
                          ^
   net/netfilter/nf_tables_api.c:2247:39: warning: Uninitialized variable: =
hook [uninitvar]
     if (!nft_hook_list_find(hook_list1, hook))
                                         ^
   net/netfilter/nf_tables_api.c:7235:9: warning: Uninitialized variable: h=
ook [uninitvar]
       if (hook->ops.dev =3D=3D hook2->ops.dev &&
           ^
>> net/netfilter/nf_tables_api.c:8527:7: warning: Uninitialized variable: a=
dp [uninitvar]
     if (adp->table =3D=3D table)
         ^
   net/netfilter/nf_tables_api.c:8554:7: warning: Uninitialized variable: a=
dp [uninitvar]
     if (adp->table =3D=3D table)
         ^

vim +2014 net/netfilter/nf_tables_api.c

3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1832  =

abadb2f865d72a Pablo Neira Ayuso 2020-05-20  1833  static struct nft_hook *=
nft_hook_list_find(struct list_head *hook_list,
b75a3e8371bce7 Pablo Neira Ayuso 2019-10-16  1834  					   const struct nft=
_hook *this)
b75a3e8371bce7 Pablo Neira Ayuso 2019-10-16  1835  {
b75a3e8371bce7 Pablo Neira Ayuso 2019-10-16  1836  	struct nft_hook *hook;
b75a3e8371bce7 Pablo Neira Ayuso 2019-10-16  1837  =

b75a3e8371bce7 Pablo Neira Ayuso 2019-10-16  1838  	list_for_each_entry(hoo=
k, hook_list, list) {
b75a3e8371bce7 Pablo Neira Ayuso 2019-10-16 @1839  		if (this->ops.dev =3D=
=3D hook->ops.dev)
abadb2f865d72a Pablo Neira Ayuso 2020-05-20  1840  			return hook;
b75a3e8371bce7 Pablo Neira Ayuso 2019-10-16  1841  	}
b75a3e8371bce7 Pablo Neira Ayuso 2019-10-16  1842  =

abadb2f865d72a Pablo Neira Ayuso 2020-05-20  1843  	return NULL;
b75a3e8371bce7 Pablo Neira Ayuso 2019-10-16  1844  }
b75a3e8371bce7 Pablo Neira Ayuso 2019-10-16  1845  =

3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1846  static int nf_tables_par=
se_netdev_hooks(struct net *net,
3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1847  					const struct nlattr=
 *attr,
3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1848  					struct list_head *h=
ook_list)
3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1849  {
3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1850  	struct nft_hook *hook, =
*next;
3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1851  	const struct nlattr *tm=
p;
3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1852  	int rem, n =3D 0, err;
3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1853  =

3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1854  	nla_for_each_nested(tmp=
, attr, rem) {
3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1855  		if (nla_type(tmp) !=3D=
 NFTA_DEVICE_NAME) {
3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1856  			err =3D -EINVAL;
3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1857  			goto err_hook;
3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1858  		}
3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1859  =

3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1860  		hook =3D nft_netdev_ho=
ok_alloc(net, tmp);
3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1861  		if (IS_ERR(hook)) {
3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1862  			err =3D PTR_ERR(hook);
3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1863  			goto err_hook;
3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1864  		}
b75a3e8371bce7 Pablo Neira Ayuso 2019-10-16  1865  		if (nft_hook_list_find=
(hook_list, hook)) {
cd77e75b5e4632 Dan Carpenter     2020-01-16  1866  			kfree(hook);
b75a3e8371bce7 Pablo Neira Ayuso 2019-10-16  1867  			err =3D -EEXIST;
b75a3e8371bce7 Pablo Neira Ayuso 2019-10-16  1868  			goto err_hook;
b75a3e8371bce7 Pablo Neira Ayuso 2019-10-16  1869  		}
3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1870  		list_add_tail(&hook->l=
ist, hook_list);
3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1871  		n++;
3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1872  =

cb662ac6711f71 Pablo Neira Ayuso 2019-10-16  1873  		if (n =3D=3D NFT_NETDE=
VICE_MAX) {
3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1874  			err =3D -EFBIG;
3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1875  			goto err_hook;
3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1876  		}
3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1877  	}
3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1878  =

3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1879  	return 0;
3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1880  =

3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1881  err_hook:
3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1882  	list_for_each_entry_saf=
e(hook, next, hook_list, list) {
3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1883  		list_del(&hook->list);
3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1884  		kfree(hook);
3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1885  	}
3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1886  	return err;
3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1887  }
3f0465a9ef0262 Pablo Neira Ayuso 2019-10-16  1888  =

508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1889  struct nft_chain_hook {
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1890  	u32				num;
84ba7dd71add05 Florian Westphal  2017-12-08  1891  	s32				priority;
32537e91847a56 Pablo Neira Ayuso 2018-03-27  1892  	const struct nft_chain_=
type	*type;
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1893  	struct list_head		list;
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1894  };
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  1895  =

d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1896  static int nft_chain_par=
se_netdev(struct net *net,
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1897  				  struct nlattr *tb[=
],
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1898  				  struct list_head *=
hook_list)
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1899  {
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1900  	struct nft_hook *hook;
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1901  	int err;
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1902  =

d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1903  	if (tb[NFTA_HOOK_DEV]) {
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1904  		hook =3D nft_netdev_ho=
ok_alloc(net, tb[NFTA_HOOK_DEV]);
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1905  		if (IS_ERR(hook))
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1906  			return PTR_ERR(hook);
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1907  =

d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1908  		list_add_tail(&hook->l=
ist, hook_list);
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1909  	} else if (tb[NFTA_HOOK=
_DEVS]) {
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1910  		err =3D nf_tables_pars=
e_netdev_hooks(net, tb[NFTA_HOOK_DEVS],
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1911  						   hook_list);
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1912  		if (err < 0)
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1913  			return err;
05abe4456fa376 Pablo Neira Ayuso 2020-05-20  1914  =

05abe4456fa376 Pablo Neira Ayuso 2020-05-20  1915  		if (list_empty(hook_li=
st))
05abe4456fa376 Pablo Neira Ayuso 2020-05-20  1916  			return -EINVAL;
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1917  	} else {
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1918  		return -EINVAL;
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1919  	}
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1920  =

d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1921  	return 0;
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1922  }
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
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  1980  		if (err < 0) {
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
--===============7998497659662915654==--

