Content-Type: multipart/mixed; boundary="===============7623836005769899804=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/clk/clk-scmi.c:157 scmi_clocks_probe() error: uninitialized symbol 'ph'.
Date: Wed, 08 Dec 2021 05:26:58 +0800
Message-ID: <202112080512.6fAucRKt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7623836005769899804==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Cristian Marussi <cristian.marussi@arm.com>
CC: Sudeep Holla <sudeep.holla@arm.com>
CC: Stephen Boyd <sboyd@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   cd8c917a56f20f48748dd43d9ae3caff51d5b987
commit: beb076bb181b0135ee582d1bc18dfe924270da48 clk: scmi: Port driver to =
the new scmi_clk_proto_ops interface
date:   8 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 8 months ago
config: microblaze-randconfig-m031-20211207 (https://download.01.org/0day-c=
i/archive/20211208/202112080512.6fAucRKt-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/clk/clk-scmi.c:157 scmi_clocks_probe() error: uninitialized symbol =
'ph'.

Old smatch warnings:
drivers/clk/clk-scmi.c:37 scmi_clk_recalc_rate() error: uninitialized symbo=
l 'rate'.

vim +/ph +157 drivers/clk/clk-scmi.c

6d6a1d82eaef70 Sudeep Holla     2017-06-13  138  =

6d6a1d82eaef70 Sudeep Holla     2017-06-13  139  static int scmi_clocks_pro=
be(struct scmi_device *sdev)
6d6a1d82eaef70 Sudeep Holla     2017-06-13  140  {
6d6a1d82eaef70 Sudeep Holla     2017-06-13  141  	int idx, count, err;
6d6a1d82eaef70 Sudeep Holla     2017-06-13  142  	struct clk_hw **hws;
6d6a1d82eaef70 Sudeep Holla     2017-06-13  143  	struct clk_hw_onecell_dat=
a *clk_data;
6d6a1d82eaef70 Sudeep Holla     2017-06-13  144  	struct device *dev =3D &s=
dev->dev;
6d6a1d82eaef70 Sudeep Holla     2017-06-13  145  	struct device_node *np =
=3D dev->of_node;
6d6a1d82eaef70 Sudeep Holla     2017-06-13  146  	const struct scmi_handle =
*handle =3D sdev->handle;
beb076bb181b01 Cristian Marussi 2021-03-16  147  	struct scmi_protocol_hand=
le *ph;
6d6a1d82eaef70 Sudeep Holla     2017-06-13  148  =

beb076bb181b01 Cristian Marussi 2021-03-16  149  	if (!handle)
6d6a1d82eaef70 Sudeep Holla     2017-06-13  150  		return -ENODEV;
6d6a1d82eaef70 Sudeep Holla     2017-06-13  151  =

beb076bb181b01 Cristian Marussi 2021-03-16  152  	scmi_proto_clk_ops =3D
beb076bb181b01 Cristian Marussi 2021-03-16  153  		handle->devm_protocol_ge=
t(sdev, SCMI_PROTOCOL_CLOCK, &ph);
beb076bb181b01 Cristian Marussi 2021-03-16  154  	if (IS_ERR(scmi_proto_clk=
_ops))
beb076bb181b01 Cristian Marussi 2021-03-16  155  		return PTR_ERR(scmi_prot=
o_clk_ops);
beb076bb181b01 Cristian Marussi 2021-03-16  156  =

beb076bb181b01 Cristian Marussi 2021-03-16 @157  	count =3D scmi_proto_clk_=
ops->count_get(ph);
6d6a1d82eaef70 Sudeep Holla     2017-06-13  158  	if (count < 0) {
e665f029a283af Rob Herring      2018-08-28  159  		dev_err(dev, "%pOFn: inv=
alid clock output count\n", np);
6d6a1d82eaef70 Sudeep Holla     2017-06-13  160  		return -EINVAL;
6d6a1d82eaef70 Sudeep Holla     2017-06-13  161  	}
6d6a1d82eaef70 Sudeep Holla     2017-06-13  162  =

0ed2dd03b94b7b Kees Cook        2018-05-08  163  	clk_data =3D devm_kzalloc=
(dev, struct_size(clk_data, hws, count),
0ed2dd03b94b7b Kees Cook        2018-05-08  164  				GFP_KERNEL);
6d6a1d82eaef70 Sudeep Holla     2017-06-13  165  	if (!clk_data)
6d6a1d82eaef70 Sudeep Holla     2017-06-13  166  		return -ENOMEM;
6d6a1d82eaef70 Sudeep Holla     2017-06-13  167  =

6d6a1d82eaef70 Sudeep Holla     2017-06-13  168  	clk_data->num =3D count;
6d6a1d82eaef70 Sudeep Holla     2017-06-13  169  	hws =3D clk_data->hws;
6d6a1d82eaef70 Sudeep Holla     2017-06-13  170  =

6d6a1d82eaef70 Sudeep Holla     2017-06-13  171  	for (idx =3D 0; idx < cou=
nt; idx++) {
6d6a1d82eaef70 Sudeep Holla     2017-06-13  172  		struct scmi_clk *sclk;
6d6a1d82eaef70 Sudeep Holla     2017-06-13  173  =

6d6a1d82eaef70 Sudeep Holla     2017-06-13  174  		sclk =3D devm_kzalloc(de=
v, sizeof(*sclk), GFP_KERNEL);
6d6a1d82eaef70 Sudeep Holla     2017-06-13  175  		if (!sclk)
6d6a1d82eaef70 Sudeep Holla     2017-06-13  176  			return -ENOMEM;
6d6a1d82eaef70 Sudeep Holla     2017-06-13  177  =

beb076bb181b01 Cristian Marussi 2021-03-16  178  		sclk->info =3D scmi_prot=
o_clk_ops->info_get(ph, idx);
6d6a1d82eaef70 Sudeep Holla     2017-06-13  179  		if (!sclk->info) {
6d6a1d82eaef70 Sudeep Holla     2017-06-13  180  			dev_dbg(dev, "invalid c=
lock info for idx %d\n", idx);
6d6a1d82eaef70 Sudeep Holla     2017-06-13  181  			continue;
6d6a1d82eaef70 Sudeep Holla     2017-06-13  182  		}
6d6a1d82eaef70 Sudeep Holla     2017-06-13  183  =

6d6a1d82eaef70 Sudeep Holla     2017-06-13  184  		sclk->id =3D idx;
beb076bb181b01 Cristian Marussi 2021-03-16  185  		sclk->ph =3D ph;
6d6a1d82eaef70 Sudeep Holla     2017-06-13  186  =

6d6a1d82eaef70 Sudeep Holla     2017-06-13  187  		err =3D scmi_clk_ops_ini=
t(dev, sclk);
6d6a1d82eaef70 Sudeep Holla     2017-06-13  188  		if (err) {
6d6a1d82eaef70 Sudeep Holla     2017-06-13  189  			dev_err(dev, "failed to=
 register clock %d\n", idx);
6d6a1d82eaef70 Sudeep Holla     2017-06-13  190  			devm_kfree(dev, sclk);
6d6a1d82eaef70 Sudeep Holla     2017-06-13  191  			hws[idx] =3D NULL;
6d6a1d82eaef70 Sudeep Holla     2017-06-13  192  		} else {
6d6a1d82eaef70 Sudeep Holla     2017-06-13  193  			dev_dbg(dev, "Registere=
d clock:%s\n", sclk->info->name);
6d6a1d82eaef70 Sudeep Holla     2017-06-13  194  			hws[idx] =3D &sclk->hw;
6d6a1d82eaef70 Sudeep Holla     2017-06-13  195  		}
6d6a1d82eaef70 Sudeep Holla     2017-06-13  196  	}
6d6a1d82eaef70 Sudeep Holla     2017-06-13  197  =

7f9badfceffc6d Sudeep Holla     2018-03-20  198  	return devm_of_clk_add_hw=
_provider(dev, of_clk_hw_onecell_get,
7f9badfceffc6d Sudeep Holla     2018-03-20  199  					   clk_data);
6d6a1d82eaef70 Sudeep Holla     2017-06-13  200  }
6d6a1d82eaef70 Sudeep Holla     2017-06-13  201  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7623836005769899804==--

