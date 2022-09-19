Content-Type: multipart/mixed; boundary="===============8794535869116259856=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH net-next v4 2/6] devlink: Extend devlink-rate api with queues and new parameters
Date: Mon, 19 Sep 2022 15:22:01 +0800
Message-ID: <202209191557.PkFshuDN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8794535869116259856==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220915134239.1935604-3-michal.wilczynski@intel.com>
References: <20220915134239.1935604-3-michal.wilczynski@intel.com>
TO: Michal Wilczynski <michal.wilczynski@intel.com>

Hi Michal,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Wilczynski/Im=
plement-devlink-rate-API-and-extend-it/20220915-214539
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
8a26a9dee5e3679637edc6f8caf4beb5f3100dde
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: mips-randconfig-m031-20220918 (https://download.01.org/0day-ci/arch=
ive/20220919/202209191557.PkFshuDN-lkp(a)intel.com/config)
compiler: mips64el-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/core/devlink.c:2039 devlink_nl_rate_set() error: uninitialized symbol '=
rate'.
net/core/devlink.c:10399 devl_rate_node_create() warn: possible memory leak=
 of 'rate_node'
net/core/devlink.c:10446 devl_rate_vport_create() warn: possible memory lea=
k of 'devlink_rate'

Old smatch warnings:
net/core/devlink.c:7425 devlink_fmsg_prepare_skb() error: uninitialized sym=
bol 'err'.
net/core/devlink.c:10410 devl_rate_node_create() warn: possible memory leak=
 of 'rate_node'
net/core/devlink.c:10453 devl_rate_vport_create() warn: possible memory lea=
k of 'devlink_rate'

vim +/rate +2039 net/core/devlink.c

d7555984507822 Dmytro Linkin     2021-06-02  1983  =

1897db2ec3109e Dmytro Linkin     2021-06-02  1984  static int devlink_nl_ra=
te_set(struct devlink_rate *devlink_rate,
1897db2ec3109e Dmytro Linkin     2021-06-02  1985  			       const struct d=
evlink_ops *ops,
1897db2ec3109e Dmytro Linkin     2021-06-02  1986  			       struct genl_in=
fo *info)
1897db2ec3109e Dmytro Linkin     2021-06-02  1987  {
d7555984507822 Dmytro Linkin     2021-06-02  1988  	struct nlattr *nla_pare=
nt, **attrs =3D info->attrs;
a8ecb93ef03de4 Dmytro Linkin     2021-06-02  1989  	int err =3D -EOPNOTSUPP;
3400deb7c35335 Michal Wilczynski 2022-09-15  1990  	u16 priority;
3400deb7c35335 Michal Wilczynski 2022-09-15  1991  	u16 weight;
1897db2ec3109e Dmytro Linkin     2021-06-02  1992  	u64 rate;
1897db2ec3109e Dmytro Linkin     2021-06-02  1993  =

1897db2ec3109e Dmytro Linkin     2021-06-02  1994  	if (attrs[DEVLINK_ATTR_=
RATE_TX_SHARE]) {
1897db2ec3109e Dmytro Linkin     2021-06-02  1995  		rate =3D nla_get_u64(a=
ttrs[DEVLINK_ATTR_RATE_TX_SHARE]);
3400deb7c35335 Michal Wilczynski 2022-09-15  1996  		if (devlink_rate_is_vp=
ort(devlink_rate))
3400deb7c35335 Michal Wilczynski 2022-09-15  1997  			err =3D ops->rate_vpo=
rt_tx_share_set(devlink_rate, devlink_rate->priv,
1897db2ec3109e Dmytro Linkin     2021-06-02  1998  							   rate, info->ex=
tack);
a8ecb93ef03de4 Dmytro Linkin     2021-06-02  1999  		else if (devlink_rate_=
is_node(devlink_rate))
a8ecb93ef03de4 Dmytro Linkin     2021-06-02  2000  			err =3D ops->rate_nod=
e_tx_share_set(devlink_rate, devlink_rate->priv,
a8ecb93ef03de4 Dmytro Linkin     2021-06-02  2001  							  rate, info->ext=
ack);
3400deb7c35335 Michal Wilczynski 2022-09-15  2002  		else if (devlink_rate_=
is_queue(devlink_rate))
3400deb7c35335 Michal Wilczynski 2022-09-15  2003  			err =3D ops->rate_que=
ue_tx_share_set(devlink_rate, devlink_rate->priv,
3400deb7c35335 Michal Wilczynski 2022-09-15  2004  							   rate, info->ex=
tack);
1897db2ec3109e Dmytro Linkin     2021-06-02  2005  		if (err)
1897db2ec3109e Dmytro Linkin     2021-06-02  2006  			return err;
1897db2ec3109e Dmytro Linkin     2021-06-02  2007  		devlink_rate->tx_share=
 =3D rate;
1897db2ec3109e Dmytro Linkin     2021-06-02  2008  	}
1897db2ec3109e Dmytro Linkin     2021-06-02  2009  =

1897db2ec3109e Dmytro Linkin     2021-06-02  2010  	if (attrs[DEVLINK_ATTR_=
RATE_TX_MAX]) {
1897db2ec3109e Dmytro Linkin     2021-06-02  2011  		rate =3D nla_get_u64(a=
ttrs[DEVLINK_ATTR_RATE_TX_MAX]);
3400deb7c35335 Michal Wilczynski 2022-09-15  2012  		if (devlink_rate_is_vp=
ort(devlink_rate))
3400deb7c35335 Michal Wilczynski 2022-09-15  2013  			err =3D ops->rate_vpo=
rt_tx_max_set(devlink_rate, devlink_rate->priv,
1897db2ec3109e Dmytro Linkin     2021-06-02  2014  							 rate, info->exta=
ck);
a8ecb93ef03de4 Dmytro Linkin     2021-06-02  2015  		else if (devlink_rate_=
is_node(devlink_rate))
a8ecb93ef03de4 Dmytro Linkin     2021-06-02  2016  			err =3D ops->rate_nod=
e_tx_max_set(devlink_rate, devlink_rate->priv,
a8ecb93ef03de4 Dmytro Linkin     2021-06-02  2017  							rate, info->extac=
k);
3400deb7c35335 Michal Wilczynski 2022-09-15  2018  		else if (devlink_rate_=
is_queue(devlink_rate))
3400deb7c35335 Michal Wilczynski 2022-09-15  2019  			err =3D ops->rate_que=
ue_tx_max_set(devlink_rate, devlink_rate->priv,
3400deb7c35335 Michal Wilczynski 2022-09-15  2020  							rate, info->extac=
k);
1897db2ec3109e Dmytro Linkin     2021-06-02  2021  		if (err)
1897db2ec3109e Dmytro Linkin     2021-06-02  2022  			return err;
1897db2ec3109e Dmytro Linkin     2021-06-02  2023  		devlink_rate->tx_max =
=3D rate;
1897db2ec3109e Dmytro Linkin     2021-06-02  2024  	}
1897db2ec3109e Dmytro Linkin     2021-06-02  2025  =

3400deb7c35335 Michal Wilczynski 2022-09-15  2026  	if (attrs[DEVLINK_ATTR_=
RATE_TX_PRIORITY]) {
3400deb7c35335 Michal Wilczynski 2022-09-15  2027  		priority =3D nla_get_u=
16(attrs[DEVLINK_ATTR_RATE_TX_PRIORITY]);
3400deb7c35335 Michal Wilczynski 2022-09-15  2028  		if (devlink_rate_is_vp=
ort(devlink_rate))
3400deb7c35335 Michal Wilczynski 2022-09-15  2029  			err =3D ops->rate_vpo=
rt_tx_priority_set(devlink_rate, devlink_rate->priv,
3400deb7c35335 Michal Wilczynski 2022-09-15  2030  							priority, info->e=
xtack);
3400deb7c35335 Michal Wilczynski 2022-09-15  2031  		else if (devlink_rate_=
is_node(devlink_rate))
3400deb7c35335 Michal Wilczynski 2022-09-15  2032  			err =3D ops->rate_nod=
e_tx_priority_set(devlink_rate, devlink_rate->priv,
3400deb7c35335 Michal Wilczynski 2022-09-15  2033  							priority, info->e=
xtack);
3400deb7c35335 Michal Wilczynski 2022-09-15  2034  		else if (devlink_rate_=
is_queue(devlink_rate))
3400deb7c35335 Michal Wilczynski 2022-09-15  2035  			err =3D ops->rate_que=
ue_tx_priority_set(devlink_rate, devlink_rate->priv,
3400deb7c35335 Michal Wilczynski 2022-09-15  2036  							priority, info->e=
xtack);
3400deb7c35335 Michal Wilczynski 2022-09-15  2037  		if (err)
3400deb7c35335 Michal Wilczynski 2022-09-15  2038  			return err;
3400deb7c35335 Michal Wilczynski 2022-09-15 @2039  		devlink_rate->tx_prior=
ity =3D rate;
3400deb7c35335 Michal Wilczynski 2022-09-15  2040  	}
3400deb7c35335 Michal Wilczynski 2022-09-15  2041  =

3400deb7c35335 Michal Wilczynski 2022-09-15  2042  	if (attrs[DEVLINK_ATTR_=
RATE_TX_WEIGHT]) {
3400deb7c35335 Michal Wilczynski 2022-09-15  2043  		weight =3D nla_get_u16=
(attrs[DEVLINK_ATTR_RATE_TX_WEIGHT]);
3400deb7c35335 Michal Wilczynski 2022-09-15  2044  		if (devlink_rate_is_vp=
ort(devlink_rate))
3400deb7c35335 Michal Wilczynski 2022-09-15  2045  			err =3D ops->rate_vpo=
rt_tx_weight_set(devlink_rate, devlink_rate->priv,
3400deb7c35335 Michal Wilczynski 2022-09-15  2046  							 weight, info->ex=
tack);
3400deb7c35335 Michal Wilczynski 2022-09-15  2047  		else if (devlink_rate_=
is_node(devlink_rate))
3400deb7c35335 Michal Wilczynski 2022-09-15  2048  			err =3D ops->rate_nod=
e_tx_weight_set(devlink_rate, devlink_rate->priv,
3400deb7c35335 Michal Wilczynski 2022-09-15  2049  							weight, info->ext=
ack);
3400deb7c35335 Michal Wilczynski 2022-09-15  2050  		else if (devlink_rate_=
is_queue(devlink_rate))
3400deb7c35335 Michal Wilczynski 2022-09-15  2051  			err =3D ops->rate_que=
ue_tx_weight_set(devlink_rate, devlink_rate->priv,
3400deb7c35335 Michal Wilczynski 2022-09-15  2052  							weight, info->ext=
ack);
3400deb7c35335 Michal Wilczynski 2022-09-15  2053  		if (err)
3400deb7c35335 Michal Wilczynski 2022-09-15  2054  			return err;
3400deb7c35335 Michal Wilczynski 2022-09-15  2055  		devlink_rate->tx_weigh=
t =3D weight;
3400deb7c35335 Michal Wilczynski 2022-09-15  2056  	}
3400deb7c35335 Michal Wilczynski 2022-09-15  2057  =

d7555984507822 Dmytro Linkin     2021-06-02  2058  	nla_parent =3D attrs[DE=
VLINK_ATTR_RATE_PARENT_NODE_NAME];
d7555984507822 Dmytro Linkin     2021-06-02  2059  	if (nla_parent) {
d7555984507822 Dmytro Linkin     2021-06-02  2060  		err =3D devlink_nl_rat=
e_parent_node_set(devlink_rate, info,
d7555984507822 Dmytro Linkin     2021-06-02  2061  						      nla_parent);
d7555984507822 Dmytro Linkin     2021-06-02  2062  		if (err)
d7555984507822 Dmytro Linkin     2021-06-02  2063  			return err;
d7555984507822 Dmytro Linkin     2021-06-02  2064  	}
d7555984507822 Dmytro Linkin     2021-06-02  2065  =

1897db2ec3109e Dmytro Linkin     2021-06-02  2066  	return 0;
1897db2ec3109e Dmytro Linkin     2021-06-02  2067  }
1897db2ec3109e Dmytro Linkin     2021-06-02  2068  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8794535869116259856==--

