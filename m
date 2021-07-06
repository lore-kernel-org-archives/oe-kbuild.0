Content-Type: multipart/mixed; boundary="===============5387165320788991606=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] net: Allow any address multicast join for IP sockets
Date: Wed, 07 Jul 2021 03:01:49 +0800
Message-ID: <202107070208.yXD584kP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5387165320788991606==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210706011548.2201-2-callum.sinclair@alliedtelesis.co.nz>
References: <20210706011548.2201-2-callum.sinclair@alliedtelesis.co.nz>
TO: Callum Sinclair <callum.sinclair@alliedtelesis.co.nz>
TO: dsahern(a)kernel.org
TO: nikolay(a)nvidia.com
CC: netdev(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: linus.luessing(a)c0d3.blue
CC: Callum Sinclair <callum.sinclair@alliedtelesis.co.nz>

Hi Callum,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.13 next-20210706]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Callum-Sinclair/net-Allow-=
any-address-multicast-join-for-IP-sockets/20210706-091734
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
79160a603bdb51916226caf4a6616cc4e1c58a58
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
compiler: m68k-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/ipv4/igmp.c:1432:9: warning: Uninitialized variable: im [uninitvar]
    return im;
           ^

vim +1432 net/ipv4/igmp.c

e9897071350bd9 Eric Dumazet    2013-06-07  1415  =

b05967ad8bde7d Callum Sinclair 2021-07-06  1416  static struct ip_mc_list *=
ip_mc_hash_lookup(struct ip_mc_list __rcu **mc_hash,
b05967ad8bde7d Callum Sinclair 2021-07-06  1417  					    __be32 mc_addr)
b05967ad8bde7d Callum Sinclair 2021-07-06  1418  {
b05967ad8bde7d Callum Sinclair 2021-07-06  1419  	struct ip_mc_list *im;
b05967ad8bde7d Callum Sinclair 2021-07-06  1420  	u32 hash;
b05967ad8bde7d Callum Sinclair 2021-07-06  1421  =

b05967ad8bde7d Callum Sinclair 2021-07-06  1422  	if (mc_hash) {
b05967ad8bde7d Callum Sinclair 2021-07-06  1423  		hash =3D hash_32((__forc=
e u32)mc_addr, MC_HASH_SZ_LOG);
b05967ad8bde7d Callum Sinclair 2021-07-06  1424  		for (im =3D rcu_derefere=
nce(mc_hash[hash]);
b05967ad8bde7d Callum Sinclair 2021-07-06  1425  		     im !=3D NULL;
b05967ad8bde7d Callum Sinclair 2021-07-06  1426  		     im =3D rcu_derefere=
nce(im->next_hash)) {
b05967ad8bde7d Callum Sinclair 2021-07-06  1427  			if (im->multiaddr =3D=
=3D mc_addr)
b05967ad8bde7d Callum Sinclair 2021-07-06  1428  				break;
b05967ad8bde7d Callum Sinclair 2021-07-06  1429  			}
b05967ad8bde7d Callum Sinclair 2021-07-06  1430  	}
b05967ad8bde7d Callum Sinclair 2021-07-06  1431  =

b05967ad8bde7d Callum Sinclair 2021-07-06 @1432  	return im;
b05967ad8bde7d Callum Sinclair 2021-07-06  1433  }
b05967ad8bde7d Callum Sinclair 2021-07-06  1434  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5387165320788991606==--

