Content-Type: multipart/mixed; boundary="===============8192610785271211924=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH net] net: ipv6: make fib6_nh_init properly clean after itself on error
Date: Tue, 30 Nov 2021 09:18:08 +0800
Message-ID: <202111300910.7HWZTGBF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8192610785271211924==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211129141151.490533-1-razor@blackwall.org>
References: <20211129141151.490533-1-razor@blackwall.org>
TO: Nikolay Aleksandrov <razor@blackwall.org>

Hi Nikolay,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on net/master]

url:    https://github.com/0day-ci/linux/commits/Nikolay-Aleksandrov/net-ip=
v6-make-fib6_nh_init-properly-clean-after-itself-on-error/20211130-001132
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git 2191b=
1dfef7d45f44b5008d2148676d9f2c82874
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: x86_64-randconfig-s032-20211128 (https://download.01.org/0day-ci/ar=
chive/20211130/202111300910.7HWZTGBF-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/2db1685345b4a1aecadba0a81=
97c79f5e49da8ec
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Nikolay-Aleksandrov/net-ipv6-make-=
fib6_nh_init-properly-clean-after-itself-on-error/20211130-001132
        git checkout 2db1685345b4a1aecadba0a8197c79f5e49da8ec
        # save the config file to linux build tree
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Dx86_64 SHELL=3D/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> net/ipv4/nexthop.c:2570:1: sparse: sparse: unused label 'out'
   net/ipv4/nexthop.c: note: in included file (through include/linux/sysctl=
.h, include/net/net_namespace.h, include/linux/netdevice.h, ...):
   include/linux/rbtree.h:74:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   include/linux/rbtree.h:74:9: sparse:    struct rb_node [noderef] __rcu *
   include/linux/rbtree.h:74:9: sparse:    struct rb_node *

vim +/out +2570 net/ipv4/nexthop.c

597cfe4fc3390a David Ahern         2019-05-24  2544  =

53010f991a9f5e David Ahern         2019-05-24  2545  static int nh_create_i=
pv6(struct net *net,  struct nexthop *nh,
53010f991a9f5e David Ahern         2019-05-24  2546  			  struct nh_info *n=
hi, struct nh_config *cfg,
53010f991a9f5e David Ahern         2019-05-24  2547  			  struct netlink_ex=
t_ack *extack)
53010f991a9f5e David Ahern         2019-05-24  2548  {
53010f991a9f5e David Ahern         2019-05-24  2549  	struct fib6_nh *fib6_=
nh =3D &nhi->fib6_nh;
53010f991a9f5e David Ahern         2019-05-24  2550  	struct fib6_config fi=
b6_cfg =3D {
53010f991a9f5e David Ahern         2019-05-24  2551  		.fc_table =3D l3mdev=
_fib_table(cfg->dev),
53010f991a9f5e David Ahern         2019-05-24  2552  		.fc_ifindex =3D cfg-=
>nh_ifindex,
53010f991a9f5e David Ahern         2019-05-24  2553  		.fc_gateway =3D cfg-=
>gw.ipv6,
53010f991a9f5e David Ahern         2019-05-24  2554  		.fc_flags =3D cfg->n=
h_flags,
9aca491e0dccf8 Ryoga Saito         2021-09-02  2555  		.fc_nlinfo =3D cfg->=
nlinfo,
b513bd035f4044 David Ahern         2019-05-24  2556  		.fc_encap =3D cfg->n=
h_encap,
b513bd035f4044 David Ahern         2019-05-24  2557  		.fc_encap_type =3D c=
fg->nh_encap_type,
38428d68719c45 Roopa Prabhu        2020-05-21  2558  		.fc_is_fdb =3D cfg->=
nh_fdb,
53010f991a9f5e David Ahern         2019-05-24  2559  	};
6f43e5252833f3 Colin Ian King      2019-05-30  2560  	int err;
53010f991a9f5e David Ahern         2019-05-24  2561  =

53010f991a9f5e David Ahern         2019-05-24  2562  	if (!ipv6_addr_any(&c=
fg->gw.ipv6))
53010f991a9f5e David Ahern         2019-05-24  2563  		fib6_cfg.fc_flags |=
=3D RTF_GATEWAY;
53010f991a9f5e David Ahern         2019-05-24  2564  =

53010f991a9f5e David Ahern         2019-05-24  2565  	/* sets nh_dev if suc=
cessful */
53010f991a9f5e David Ahern         2019-05-24  2566  	err =3D ipv6_stub->fi=
b6_nh_init(net, fib6_nh, &fib6_cfg, GFP_KERNEL,
53010f991a9f5e David Ahern         2019-05-24  2567  				      extack);
2db1685345b4a1 Nikolay Aleksandrov 2021-11-29  2568  	if (!err)
53010f991a9f5e David Ahern         2019-05-24  2569  		nh->nh_flags =3D fib=
6_nh->fib_nh_flags;
1c743127cc54b1 Nikolay Aleksandrov 2021-11-23 @2570  out:
53010f991a9f5e David Ahern         2019-05-24  2571  	return err;
53010f991a9f5e David Ahern         2019-05-24  2572  }
53010f991a9f5e David Ahern         2019-05-24  2573  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8192610785271211924==--

