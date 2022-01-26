Content-Type: multipart/mixed; boundary="===============5172533280818359847=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH 2/5] driver/net/tun: Added features for USO.
Date: Thu, 27 Jan 2022 07:48:27 +0800
Message-ID: <202201270710.TzXKgCWT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5172533280818359847==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220125084702.3636253-3-andrew@daynix.com>
References: <20220125084702.3636253-3-andrew@daynix.com>
TO: Andrew Melnychenko <andrew@daynix.com>

Hi Andrew,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on net-next/master]
[also build test WARNING on net/master mst-vhost/linux-next linus/master v5=
.17-rc1 next-20220125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Andrew-Melnychenko/TUN-Vir=
tioNet-USO-features-support/20220125-171057
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
6e667749271e58d34238cf700e543beabdbe6184
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-m031-20220124 (https://download.01.org/0day-ci/=
archive/20220127/202201270710.TzXKgCWT-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/tap.c:945 set_offload() warn: compare has higher precedence tha=
n mask
drivers/net/tap.c:945 set_offload() warn: add some parenthesis here?

Old smatch warnings:
drivers/net/tap.c:958 set_offload() warn: compare has higher precedence tha=
n mask
drivers/net/tap.c:958 set_offload() warn: add some parenthesis here?

vim +945 drivers/net/tap.c

815f236d622721b drivers/net/macvtap.c Jason Wang         2013-06-05  919  =

635b8c8ecdd2714 drivers/net/tap.c     Sainath Grandhi    2017-02-10  920  s=
tatic int set_offload(struct tap_queue *q, unsigned long arg)
2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  921  {
6fe3faf86757eb7 drivers/net/tap.c     Sainath Grandhi    2017-02-10  922  	=
struct tap_dev *tap;
2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  923  	=
netdev_features_t features;
2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  924  	=
netdev_features_t feature_mask =3D 0;
2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  925  =

6fe3faf86757eb7 drivers/net/tap.c     Sainath Grandhi    2017-02-10  926  	=
tap =3D rtnl_dereference(q->tap);
6fe3faf86757eb7 drivers/net/tap.c     Sainath Grandhi    2017-02-10  927  	=
if (!tap)
2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  928  	=
	return -ENOLINK;
2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  929  =

6fe3faf86757eb7 drivers/net/tap.c     Sainath Grandhi    2017-02-10  930  	=
features =3D tap->dev->features;
2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  931  =

2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  932  	=
if (arg & TUN_F_CSUM) {
2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  933  	=
	feature_mask =3D NETIF_F_HW_CSUM;
2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  934  =

2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  935  	=
	if (arg & (TUN_F_TSO4 | TUN_F_TSO6)) {
2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  936  	=
		if (arg & TUN_F_TSO_ECN)
2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  937  	=
			feature_mask |=3D NETIF_F_TSO_ECN;
2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  938  	=
		if (arg & TUN_F_TSO4)
2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  939  	=
			feature_mask |=3D NETIF_F_TSO;
2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  940  	=
		if (arg & TUN_F_TSO6)
2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  941  	=
			feature_mask |=3D NETIF_F_TSO6;
2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  942  	=
	}
3c1c2daa10c8eac drivers/net/tap.c     Andrew Melnychenko 2022-01-25  943  =

3c1c2daa10c8eac drivers/net/tap.c     Andrew Melnychenko 2022-01-25  944  	=
	/* TODO: for now USO4 and USO6 should work simultaneously */
3c1c2daa10c8eac drivers/net/tap.c     Andrew Melnychenko 2022-01-25 @945  	=
	if (arg & (TUN_F_USO4 | TUN_F_USO6) =3D=3D (TUN_F_USO4 | TUN_F_USO6))
3c1c2daa10c8eac drivers/net/tap.c     Andrew Melnychenko 2022-01-25  946  	=
		features |=3D NETIF_F_GSO_UDP_L4;
2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  947  	}
2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  948  =

2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  949  	=
/* tun/tap driver inverts the usage for TSO offloads, where
2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  950  	=
 * setting the TSO bit means that the userspace wants to
2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  951  	=
 * accept TSO frames and turning it off means that user space
2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  952  	=
 * does not support TSO.
635b8c8ecdd2714 drivers/net/tap.c     Sainath Grandhi    2017-02-10  953  	=
 * For tap, we have to invert it to mean the same thing.
2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  954  	=
 * When user space turns off TSO, we turn off GSO/LRO so that
2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  955  	=
 * user-space will not receive TSO frames.
2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  956  	=
 */
3c1c2daa10c8eac drivers/net/tap.c     Andrew Melnychenko 2022-01-25  957  	=
if (feature_mask & (NETIF_F_TSO | NETIF_F_TSO6) ||
3c1c2daa10c8eac drivers/net/tap.c     Andrew Melnychenko 2022-01-25  958  	=
    feature_mask & (TUN_F_USO4 | TUN_F_USO6) =3D=3D (TUN_F_USO4 | TUN_F_USO=
6))
2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  959  	=
	features |=3D RX_OFFLOADS;
2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  960  	=
else
2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  961  	=
	features &=3D ~RX_OFFLOADS;
2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  962  =

2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  963  	=
/* tap_features are the same as features on tun/tap and
2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  964  	=
 * reflect user expectations.
2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  965  	=
 */
6fe3faf86757eb7 drivers/net/tap.c     Sainath Grandhi    2017-02-10  966  	=
tap->tap_features =3D feature_mask;
6fe3faf86757eb7 drivers/net/tap.c     Sainath Grandhi    2017-02-10  967  	=
if (tap->update_features)
6fe3faf86757eb7 drivers/net/tap.c     Sainath Grandhi    2017-02-10  968  	=
	tap->update_features(tap, features);
2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  969  =

2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  970  	=
return 0;
2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  971  }
2be5c76794b0e57 drivers/net/macvtap.c Vlad Yasevich      2013-06-25  972  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5172533280818359847==--

