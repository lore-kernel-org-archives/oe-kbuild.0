Content-Type: multipart/mixed; boundary="===============3416040337156933985=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wwan/wwan_core.c:914 wwan_rtnl_newlink() warn: passing a valid pointer to 'PTR_ERR'
Date: Fri, 26 Nov 2021 12:22:21 +0800
Message-ID: <202111261215.gsqO8PYK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3416040337156933985==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Johannes Berg <johannes.berg@intel.com>
CC: Sergey Ryazanov <ryazanov.s.a@gmail.com>
CC: Loic Poulain <loic.poulain@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a4849f6000e29235a2707f22e39da6b897bb9543
commit: 88b710532e53de2466d1033fb1d5125aabf3215a wwan: add interface creati=
on support
date:   6 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 6 months ago
config: openrisc-randconfig-m031-20211123 (https://download.01.org/0day-ci/=
archive/20211126/202111261215.gsqO8PYK-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/wwan/wwan_core.c:914 wwan_rtnl_newlink() warn: passing a valid =
pointer to 'PTR_ERR'

Old smatch warnings:
drivers/net/wwan/wwan_core.c:566 wwan_port_fops_open() warn: passing a vali=
d pointer to 'PTR_ERR'

vim +/PTR_ERR +914 drivers/net/wwan/wwan_core.c

88b710532e53de Johannes Berg 2021-06-12  904  =

88b710532e53de Johannes Berg 2021-06-12  905  static int wwan_rtnl_newlink(=
struct net *src_net, struct net_device *dev,
88b710532e53de Johannes Berg 2021-06-12  906  			     struct nlattr *tb[], =
struct nlattr *data[],
88b710532e53de Johannes Berg 2021-06-12  907  			     struct netlink_ext_ac=
k *extack)
88b710532e53de Johannes Berg 2021-06-12  908  {
88b710532e53de Johannes Berg 2021-06-12  909  	struct wwan_device *wwandev =
=3D wwan_dev_get_by_parent(dev->dev.parent);
88b710532e53de Johannes Berg 2021-06-12  910  	u32 link_id =3D nla_get_u32(=
data[IFLA_WWAN_LINK_ID]);
88b710532e53de Johannes Berg 2021-06-12  911  	int ret;
88b710532e53de Johannes Berg 2021-06-12  912  =

88b710532e53de Johannes Berg 2021-06-12  913  	if (IS_ERR(wwandev))
88b710532e53de Johannes Berg 2021-06-12 @914  		return PTR_ERR(wwandev);
88b710532e53de Johannes Berg 2021-06-12  915  =

88b710532e53de Johannes Berg 2021-06-12  916  	/* shouldn't have a netdev (=
left) with us as parent so WARN */
88b710532e53de Johannes Berg 2021-06-12  917  	if (WARN_ON(!wwandev->ops)) {
88b710532e53de Johannes Berg 2021-06-12  918  		ret =3D -EOPNOTSUPP;
88b710532e53de Johannes Berg 2021-06-12  919  		goto out;
88b710532e53de Johannes Berg 2021-06-12  920  	}
88b710532e53de Johannes Berg 2021-06-12  921  =

88b710532e53de Johannes Berg 2021-06-12  922  	if (wwandev->ops->newlink)
88b710532e53de Johannes Berg 2021-06-12  923  		ret =3D wwandev->ops->newli=
nk(wwandev->ops_ctxt, dev,
88b710532e53de Johannes Berg 2021-06-12  924  					    link_id, extack);
88b710532e53de Johannes Berg 2021-06-12  925  	else
88b710532e53de Johannes Berg 2021-06-12  926  		ret =3D register_netdevice(=
dev);
88b710532e53de Johannes Berg 2021-06-12  927  =

88b710532e53de Johannes Berg 2021-06-12  928  out:
88b710532e53de Johannes Berg 2021-06-12  929  	/* release the reference */
88b710532e53de Johannes Berg 2021-06-12  930  	put_device(&wwandev->dev);
88b710532e53de Johannes Berg 2021-06-12  931  	return ret;
88b710532e53de Johannes Berg 2021-06-12  932  }
88b710532e53de Johannes Berg 2021-06-12  933  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3416040337156933985==--

