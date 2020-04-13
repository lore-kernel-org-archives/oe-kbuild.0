Content-Type: multipart/mixed; boundary="===============2045895260853428442=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [RFC PATCH v2 1/3] mfd: syscon: Support physical regmap bus
Date: Tue, 14 Apr 2020 06:11:51 +0800
Message-ID: <202004140617.GiZPNwLC%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2045895260853428442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <a3187ff166bf4434362b92d91149a8e445c4ed0c.1586757922.git.baoli=
n.wang7@gmail.com>
References: <a3187ff166bf4434362b92d91149a8e445c4ed0c.1586757922.git.baolin=
.wang7@gmail.com>
TO: Baolin Wang <baolin.wang7@gmail.com>

Hi Baolin,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linus/master]
[also build test WARNING on v5.7-rc1 next-20200413]
[cannot apply to ljones-mfd/for-mfd-next regmap/for-next arm-soc/for-next]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Baolin-Wang/Add-new-reg_up=
date_bits-support/20200413-143713
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
8f3d9f354286745c751374f5f1fcafee6b3f3136
reproduce:
        # apt-get install sparse
        # sparse version: =

        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/mfd/syscon.c:111:26: sparse: warning: incorrect type in argument=
 3 (different address spaces)
>> drivers/mfd/syscon.c:111:26: sparse:    expected void *bus_context
>> drivers/mfd/syscon.c:111:26: sparse:    got void [noderef] <asn:2> *[ass=
igned] base

# https://github.com/0day-ci/linux/commit/ff9a2d5184cbf0f5c4a40f77f56e383ee=
c7ca306
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout ff9a2d5184cbf0f5c4a40f77f56e383eec7ca306
vim +111 drivers/mfd/syscon.c

87d687301f3807 Dong Aisheng    2012-09-05   43  =

39233b7c611248 Paul Cercueil   2019-07-24   44  static struct syscon *of_sy=
scon_register(struct device_node *np, bool check_clk)
87d687301f3807 Dong Aisheng    2012-09-05   45  {
a00406b71c5f08 Fabrice Gasnier 2018-12-12   46  	struct clk *clk;
bdb0066df96e74 Pankaj Dubey    2014-09-30   47  	struct syscon *syscon;
bdb0066df96e74 Pankaj Dubey    2014-09-30   48  	struct regmap *regmap;
bdb0066df96e74 Pankaj Dubey    2014-09-30   49  	void __iomem *base;
db2fb60cd35d2d Damien Riegel   2015-11-30   50  	u32 reg_io_width;
bdb0066df96e74 Pankaj Dubey    2014-09-30   51  	int ret;
bdb0066df96e74 Pankaj Dubey    2014-09-30   52  	struct regmap_config sysco=
n_config =3D syscon_regmap_config;
ca668f0edfae65 Philipp Zabel   2016-01-29   53  	struct resource res;
bdb0066df96e74 Pankaj Dubey    2014-09-30   54  =

bdb0066df96e74 Pankaj Dubey    2014-09-30   55  	syscon =3D kzalloc(sizeof(=
*syscon), GFP_KERNEL);
bdb0066df96e74 Pankaj Dubey    2014-09-30   56  	if (!syscon)
bdb0066df96e74 Pankaj Dubey    2014-09-30   57  		return ERR_PTR(-ENOMEM);
bdb0066df96e74 Pankaj Dubey    2014-09-30   58  =

ca668f0edfae65 Philipp Zabel   2016-01-29   59  	if (of_address_to_resource=
(np, 0, &res)) {
ca668f0edfae65 Philipp Zabel   2016-01-29   60  		ret =3D -ENOMEM;
ca668f0edfae65 Philipp Zabel   2016-01-29   61  		goto err_map;
ca668f0edfae65 Philipp Zabel   2016-01-29   62  	}
ca668f0edfae65 Philipp Zabel   2016-01-29   63  =

ca668f0edfae65 Philipp Zabel   2016-01-29   64  	base =3D ioremap(res.start=
, resource_size(&res));
bdb0066df96e74 Pankaj Dubey    2014-09-30   65  	if (!base) {
bdb0066df96e74 Pankaj Dubey    2014-09-30   66  		ret =3D -ENOMEM;
bdb0066df96e74 Pankaj Dubey    2014-09-30   67  		goto err_map;
bdb0066df96e74 Pankaj Dubey    2014-09-30   68  	}
bdb0066df96e74 Pankaj Dubey    2014-09-30   69  =

bdb0066df96e74 Pankaj Dubey    2014-09-30   70  	/* Parse the device's DT n=
ode for an endianness specification */
bdb0066df96e74 Pankaj Dubey    2014-09-30   71  	if (of_property_read_bool(=
np, "big-endian"))
bdb0066df96e74 Pankaj Dubey    2014-09-30   72  		syscon_config.val_format_=
endian =3D REGMAP_ENDIAN_BIG;
bdb0066df96e74 Pankaj Dubey    2014-09-30   73  	else if (of_property_read_=
bool(np, "little-endian"))
bdb0066df96e74 Pankaj Dubey    2014-09-30   74  		syscon_config.val_format_=
endian =3D REGMAP_ENDIAN_LITTLE;
d29ccdb3f0e5dc Paul Burton     2016-10-14   75  	else if (of_property_read_=
bool(np, "native-endian"))
d29ccdb3f0e5dc Paul Burton     2016-10-14   76  		syscon_config.val_format_=
endian =3D REGMAP_ENDIAN_NATIVE;
bdb0066df96e74 Pankaj Dubey    2014-09-30   77  =

db2fb60cd35d2d Damien Riegel   2015-11-30   78  	/*
db2fb60cd35d2d Damien Riegel   2015-11-30   79  	 * search for reg-io-width=
 property in DT. If it is not provided,
db2fb60cd35d2d Damien Riegel   2015-11-30   80  	 * default to 4 bytes. reg=
map_init_mmio will return an error if values
db2fb60cd35d2d Damien Riegel   2015-11-30   81  	 * are invalid so there is=
 no need to check them here.
db2fb60cd35d2d Damien Riegel   2015-11-30   82  	 */
db2fb60cd35d2d Damien Riegel   2015-11-30   83  	ret =3D of_property_read_u=
32(np, "reg-io-width", &reg_io_width);
db2fb60cd35d2d Damien Riegel   2015-11-30   84  	if (ret)
db2fb60cd35d2d Damien Riegel   2015-11-30   85  		reg_io_width =3D 4;
db2fb60cd35d2d Damien Riegel   2015-11-30   86  =

3bafc09e779710 Baolin Wang     2017-12-25   87  	ret =3D of_hwspin_lock_get=
_id(np, 0);
3bafc09e779710 Baolin Wang     2017-12-25   88  	if (ret > 0 || (IS_ENABLED=
(CONFIG_HWSPINLOCK) && ret =3D=3D 0)) {
3bafc09e779710 Baolin Wang     2017-12-25   89  		syscon_config.use_hwlock =
=3D true;
3bafc09e779710 Baolin Wang     2017-12-25   90  		syscon_config.hwlock_id =
=3D ret;
3bafc09e779710 Baolin Wang     2017-12-25   91  		syscon_config.hwlock_mode=
 =3D HWLOCK_IRQSTATE;
3bafc09e779710 Baolin Wang     2017-12-25   92  	} else if (ret < 0) {
3bafc09e779710 Baolin Wang     2017-12-25   93  		switch (ret) {
3bafc09e779710 Baolin Wang     2017-12-25   94  		case -ENOENT:
3bafc09e779710 Baolin Wang     2017-12-25   95  			/* Ignore missing hwlock=
, it's optional. */
3bafc09e779710 Baolin Wang     2017-12-25   96  			break;
3bafc09e779710 Baolin Wang     2017-12-25   97  		default:
3bafc09e779710 Baolin Wang     2017-12-25   98  			pr_err("Failed to retrie=
ve valid hwlock: %d\n", ret);
3bafc09e779710 Baolin Wang     2017-12-25   99  			/* fall-through */
3bafc09e779710 Baolin Wang     2017-12-25  100  		case -EPROBE_DEFER:
3bafc09e779710 Baolin Wang     2017-12-25  101  			goto err_regmap;
3bafc09e779710 Baolin Wang     2017-12-25  102  		}
3bafc09e779710 Baolin Wang     2017-12-25  103  	}
3bafc09e779710 Baolin Wang     2017-12-25  104  =

408d1d570a6339 David Lechner   2018-01-23  105  	syscon_config.name =3D of_=
node_full_name(np);
db2fb60cd35d2d Damien Riegel   2015-11-30  106  	syscon_config.reg_stride =
=3D reg_io_width;
db2fb60cd35d2d Damien Riegel   2015-11-30  107  	syscon_config.val_bits =3D=
 reg_io_width * 8;
ca668f0edfae65 Philipp Zabel   2016-01-29  108  	syscon_config.max_register=
 =3D resource_size(&res) - reg_io_width;
db2fb60cd35d2d Damien Riegel   2015-11-30  109  =

ff9a2d5184cbf0 Baolin Wang     2020-04-13  110  	if (syscon_phy_regmap_bus)
ff9a2d5184cbf0 Baolin Wang     2020-04-13 @111  		regmap =3D regmap_init(NU=
LL, syscon_phy_regmap_bus, base,
ff9a2d5184cbf0 Baolin Wang     2020-04-13  112  				     &syscon_config);
ff9a2d5184cbf0 Baolin Wang     2020-04-13  113  	else
bdb0066df96e74 Pankaj Dubey    2014-09-30  114  		regmap =3D regmap_init_mm=
io(NULL, base, &syscon_config);
bdb0066df96e74 Pankaj Dubey    2014-09-30  115  	if (IS_ERR(regmap)) {
bdb0066df96e74 Pankaj Dubey    2014-09-30  116  		pr_err("regmap init faile=
d\n");
bdb0066df96e74 Pankaj Dubey    2014-09-30  117  		ret =3D PTR_ERR(regmap);
bdb0066df96e74 Pankaj Dubey    2014-09-30  118  		goto err_regmap;
bdb0066df96e74 Pankaj Dubey    2014-09-30  119  	}
bdb0066df96e74 Pankaj Dubey    2014-09-30  120  =

ff9a2d5184cbf0 Baolin Wang     2020-04-13  121  	if (check_clk && !syscon_p=
hy_regmap_bus) {
a00406b71c5f08 Fabrice Gasnier 2018-12-12  122  		clk =3D of_clk_get(np, 0);
a00406b71c5f08 Fabrice Gasnier 2018-12-12  123  		if (IS_ERR(clk)) {
a00406b71c5f08 Fabrice Gasnier 2018-12-12  124  			ret =3D PTR_ERR(clk);
a00406b71c5f08 Fabrice Gasnier 2018-12-12  125  			/* clock is optional */
a00406b71c5f08 Fabrice Gasnier 2018-12-12  126  			if (ret !=3D -ENOENT)
a00406b71c5f08 Fabrice Gasnier 2018-12-12  127  				goto err_clk;
a00406b71c5f08 Fabrice Gasnier 2018-12-12  128  		} else {
a00406b71c5f08 Fabrice Gasnier 2018-12-12  129  			ret =3D regmap_mmio_atta=
ch_clk(regmap, clk);
a00406b71c5f08 Fabrice Gasnier 2018-12-12  130  			if (ret)
a00406b71c5f08 Fabrice Gasnier 2018-12-12  131  				goto err_attach;
a00406b71c5f08 Fabrice Gasnier 2018-12-12  132  		}
39233b7c611248 Paul Cercueil   2019-07-24  133  	}
a00406b71c5f08 Fabrice Gasnier 2018-12-12  134  =

bdb0066df96e74 Pankaj Dubey    2014-09-30  135  	syscon->regmap =3D regmap;
bdb0066df96e74 Pankaj Dubey    2014-09-30  136  	syscon->np =3D np;
bdb0066df96e74 Pankaj Dubey    2014-09-30  137  =

bdb0066df96e74 Pankaj Dubey    2014-09-30  138  	spin_lock(&syscon_list_slo=
ck);
bdb0066df96e74 Pankaj Dubey    2014-09-30  139  	list_add_tail(&syscon->lis=
t, &syscon_list);
bdb0066df96e74 Pankaj Dubey    2014-09-30  140  	spin_unlock(&syscon_list_s=
lock);
87d687301f3807 Dong Aisheng    2012-09-05  141  =

bdb0066df96e74 Pankaj Dubey    2014-09-30  142  	return syscon;
bdb0066df96e74 Pankaj Dubey    2014-09-30  143  =

a00406b71c5f08 Fabrice Gasnier 2018-12-12  144  err_attach:
a00406b71c5f08 Fabrice Gasnier 2018-12-12  145  	if (!IS_ERR(clk))
a00406b71c5f08 Fabrice Gasnier 2018-12-12  146  		clk_put(clk);
a00406b71c5f08 Fabrice Gasnier 2018-12-12  147  err_clk:
a00406b71c5f08 Fabrice Gasnier 2018-12-12  148  	regmap_exit(regmap);
bdb0066df96e74 Pankaj Dubey    2014-09-30  149  err_regmap:
bdb0066df96e74 Pankaj Dubey    2014-09-30  150  	iounmap(base);
bdb0066df96e74 Pankaj Dubey    2014-09-30  151  err_map:
bdb0066df96e74 Pankaj Dubey    2014-09-30  152  	kfree(syscon);
bdb0066df96e74 Pankaj Dubey    2014-09-30  153  	return ERR_PTR(ret);
87d687301f3807 Dong Aisheng    2012-09-05  154  }
87d687301f3807 Dong Aisheng    2012-09-05  155  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2045895260853428442==--

