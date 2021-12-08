Content-Type: multipart/mixed; boundary="===============5905164149585700411=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/firmware/arm_scmi/scmi_pm_domain.c:40 scmi_pd_power() error: uninitialized symbol 'ret_state'.
Date: Wed, 08 Dec 2021 19:19:03 +0800
Message-ID: <202112081921.SnWPhJS3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5905164149585700411==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Bjorn Andersson <bjorn.andersson@linaro.org>
CC: Charles Keepax <ckeepax@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2a987e65025e2b79c6d453b78cb5985ac6e5eb26
commit: 951cd3a0866d29cb9c01ebc1d9c17590e598226e firmware: include drivers/=
firmware/Kconfig unconditionally
date:   9 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 9 weeks ago
config: arc-randconfig-m031-20211208 (https://download.01.org/0day-ci/archi=
ve/20211208/202112081921.SnWPhJS3-lkp(a)intel.com/config)
compiler: arc-elf-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/firmware/arm_scmi/scmi_pm_domain.c:40 scmi_pd_power() error: uninit=
ialized symbol 'ret_state'.
drivers/firmware/arm_scmi/scmi_pm_domain.c:95 scmi_pm_domain_probe() error:=
 uninitialized symbol 'ph'.

vim +/ret_state +40 drivers/firmware/arm_scmi/scmi_pm_domain.c

898216c97ed2eb Sudeep Holla     2017-06-14   25  =

898216c97ed2eb Sudeep Holla     2017-06-14   26  static int scmi_pd_power(s=
truct generic_pm_domain *domain, bool power_on)
898216c97ed2eb Sudeep Holla     2017-06-14   27  {
898216c97ed2eb Sudeep Holla     2017-06-14   28  	int ret;
898216c97ed2eb Sudeep Holla     2017-06-14   29  	u32 state, ret_state;
898216c97ed2eb Sudeep Holla     2017-06-14   30  	struct scmi_pm_domain *pd=
 =3D to_scmi_pd(domain);
898216c97ed2eb Sudeep Holla     2017-06-14   31  =

898216c97ed2eb Sudeep Holla     2017-06-14   32  	if (power_on)
898216c97ed2eb Sudeep Holla     2017-06-14   33  		state =3D SCMI_POWER_STA=
TE_GENERIC_ON;
898216c97ed2eb Sudeep Holla     2017-06-14   34  	else
898216c97ed2eb Sudeep Holla     2017-06-14   35  		state =3D SCMI_POWER_STA=
TE_GENERIC_OFF;
898216c97ed2eb Sudeep Holla     2017-06-14   36  =

26f19496a9764c Cristian Marussi 2021-03-16   37  	ret =3D power_ops->state_=
set(pd->ph, pd->domain, state);
898216c97ed2eb Sudeep Holla     2017-06-14   38  	if (!ret)
26f19496a9764c Cristian Marussi 2021-03-16   39  		ret =3D power_ops->state=
_get(pd->ph, pd->domain, &ret_state);
898216c97ed2eb Sudeep Holla     2017-06-14  @40  	if (!ret && state !=3D re=
t_state)
898216c97ed2eb Sudeep Holla     2017-06-14   41  		return -EIO;
898216c97ed2eb Sudeep Holla     2017-06-14   42  =

898216c97ed2eb Sudeep Holla     2017-06-14   43  	return ret;
898216c97ed2eb Sudeep Holla     2017-06-14   44  }
898216c97ed2eb Sudeep Holla     2017-06-14   45  =

898216c97ed2eb Sudeep Holla     2017-06-14   46  static int scmi_pd_power_o=
n(struct generic_pm_domain *domain)
898216c97ed2eb Sudeep Holla     2017-06-14   47  {
898216c97ed2eb Sudeep Holla     2017-06-14   48  	return scmi_pd_power(doma=
in, true);
898216c97ed2eb Sudeep Holla     2017-06-14   49  }
898216c97ed2eb Sudeep Holla     2017-06-14   50  =

898216c97ed2eb Sudeep Holla     2017-06-14   51  static int scmi_pd_power_o=
ff(struct generic_pm_domain *domain)
898216c97ed2eb Sudeep Holla     2017-06-14   52  {
898216c97ed2eb Sudeep Holla     2017-06-14   53  	return scmi_pd_power(doma=
in, false);
898216c97ed2eb Sudeep Holla     2017-06-14   54  }
898216c97ed2eb Sudeep Holla     2017-06-14   55  =

a3b884cef8730c Nicolas Pitre    2021-05-07   56  static int scmi_pd_attach_=
dev(struct generic_pm_domain *pd, struct device *dev)
a3b884cef8730c Nicolas Pitre    2021-05-07   57  {
a3b884cef8730c Nicolas Pitre    2021-05-07   58  	int ret;
a3b884cef8730c Nicolas Pitre    2021-05-07   59  =

a3b884cef8730c Nicolas Pitre    2021-05-07   60  	ret =3D pm_clk_create(dev=
);
a3b884cef8730c Nicolas Pitre    2021-05-07   61  	if (ret)
a3b884cef8730c Nicolas Pitre    2021-05-07   62  		return ret;
a3b884cef8730c Nicolas Pitre    2021-05-07   63  =

a3b884cef8730c Nicolas Pitre    2021-05-07   64  	ret =3D of_pm_clk_add_clk=
s(dev);
a3b884cef8730c Nicolas Pitre    2021-05-07   65  	if (ret >=3D 0)
a3b884cef8730c Nicolas Pitre    2021-05-07   66  		return 0;
a3b884cef8730c Nicolas Pitre    2021-05-07   67  =

a3b884cef8730c Nicolas Pitre    2021-05-07   68  	pm_clk_destroy(dev);
a3b884cef8730c Nicolas Pitre    2021-05-07   69  	return ret;
a3b884cef8730c Nicolas Pitre    2021-05-07   70  }
a3b884cef8730c Nicolas Pitre    2021-05-07   71  =

a3b884cef8730c Nicolas Pitre    2021-05-07   72  static void scmi_pd_detach=
_dev(struct generic_pm_domain *pd, struct device *dev)
a3b884cef8730c Nicolas Pitre    2021-05-07   73  {
a3b884cef8730c Nicolas Pitre    2021-05-07   74  	pm_clk_destroy(dev);
a3b884cef8730c Nicolas Pitre    2021-05-07   75  }
a3b884cef8730c Nicolas Pitre    2021-05-07   76  =

898216c97ed2eb Sudeep Holla     2017-06-14   77  static int scmi_pm_domain_=
probe(struct scmi_device *sdev)
898216c97ed2eb Sudeep Holla     2017-06-14   78  {
898216c97ed2eb Sudeep Holla     2017-06-14   79  	int num_domains, i;
898216c97ed2eb Sudeep Holla     2017-06-14   80  	struct device *dev =3D &s=
dev->dev;
898216c97ed2eb Sudeep Holla     2017-06-14   81  	struct device_node *np =
=3D dev->of_node;
898216c97ed2eb Sudeep Holla     2017-06-14   82  	struct scmi_pm_domain *sc=
mi_pd;
898216c97ed2eb Sudeep Holla     2017-06-14   83  	struct genpd_onecell_data=
 *scmi_pd_data;
898216c97ed2eb Sudeep Holla     2017-06-14   84  	struct generic_pm_domain =
**domains;
898216c97ed2eb Sudeep Holla     2017-06-14   85  	const struct scmi_handle =
*handle =3D sdev->handle;
26f19496a9764c Cristian Marussi 2021-03-16   86  	struct scmi_protocol_hand=
le *ph;
898216c97ed2eb Sudeep Holla     2017-06-14   87  =

26f19496a9764c Cristian Marussi 2021-03-16   88  	if (!handle)
898216c97ed2eb Sudeep Holla     2017-06-14   89  		return -ENODEV;
898216c97ed2eb Sudeep Holla     2017-06-14   90  =

26f19496a9764c Cristian Marussi 2021-03-16   91  	power_ops =3D handle->dev=
m_protocol_get(sdev, SCMI_PROTOCOL_POWER, &ph);
26f19496a9764c Cristian Marussi 2021-03-16   92  	if (IS_ERR(power_ops))
26f19496a9764c Cristian Marussi 2021-03-16   93  		return PTR_ERR(power_ops=
);
26f19496a9764c Cristian Marussi 2021-03-16   94  =

26f19496a9764c Cristian Marussi 2021-03-16  @95  	num_domains =3D power_ops=
->num_domains_get(ph);
898216c97ed2eb Sudeep Holla     2017-06-14   96  	if (num_domains < 0) {
898216c97ed2eb Sudeep Holla     2017-06-14   97  		dev_err(dev, "number of =
domains not found\n");
898216c97ed2eb Sudeep Holla     2017-06-14   98  		return num_domains;
898216c97ed2eb Sudeep Holla     2017-06-14   99  	}
898216c97ed2eb Sudeep Holla     2017-06-14  100  =

898216c97ed2eb Sudeep Holla     2017-06-14  101  	scmi_pd =3D devm_kcalloc(=
dev, num_domains, sizeof(*scmi_pd), GFP_KERNEL);
898216c97ed2eb Sudeep Holla     2017-06-14  102  	if (!scmi_pd)
898216c97ed2eb Sudeep Holla     2017-06-14  103  		return -ENOMEM;
898216c97ed2eb Sudeep Holla     2017-06-14  104  =

898216c97ed2eb Sudeep Holla     2017-06-14  105  	scmi_pd_data =3D devm_kza=
lloc(dev, sizeof(*scmi_pd_data), GFP_KERNEL);
898216c97ed2eb Sudeep Holla     2017-06-14  106  	if (!scmi_pd_data)
898216c97ed2eb Sudeep Holla     2017-06-14  107  		return -ENOMEM;
898216c97ed2eb Sudeep Holla     2017-06-14  108  =

898216c97ed2eb Sudeep Holla     2017-06-14  109  	domains =3D devm_kcalloc(=
dev, num_domains, sizeof(*domains), GFP_KERNEL);
898216c97ed2eb Sudeep Holla     2017-06-14  110  	if (!domains)
898216c97ed2eb Sudeep Holla     2017-06-14  111  		return -ENOMEM;
898216c97ed2eb Sudeep Holla     2017-06-14  112  =

898216c97ed2eb Sudeep Holla     2017-06-14  113  	for (i =3D 0; i < num_dom=
ains; i++, scmi_pd++) {
898216c97ed2eb Sudeep Holla     2017-06-14  114  		u32 state;
898216c97ed2eb Sudeep Holla     2017-06-14  115  =

26f19496a9764c Cristian Marussi 2021-03-16  116  		if (power_ops->state_get=
(ph, i, &state)) {
e0f1a30cf18482 Cristian Marussi 2020-06-19  117  			dev_warn(dev, "failed t=
o get state for domain %d\n", i);
e0f1a30cf18482 Cristian Marussi 2020-06-19  118  			continue;
e0f1a30cf18482 Cristian Marussi 2020-06-19  119  		}
898216c97ed2eb Sudeep Holla     2017-06-14  120  =

898216c97ed2eb Sudeep Holla     2017-06-14  121  		scmi_pd->domain =3D i;
26f19496a9764c Cristian Marussi 2021-03-16  122  		scmi_pd->ph =3D ph;
26f19496a9764c Cristian Marussi 2021-03-16  123  		scmi_pd->name =3D power_=
ops->name_get(ph, i);
898216c97ed2eb Sudeep Holla     2017-06-14  124  		scmi_pd->genpd.name =3D =
scmi_pd->name;
898216c97ed2eb Sudeep Holla     2017-06-14  125  		scmi_pd->genpd.power_off=
 =3D scmi_pd_power_off;
898216c97ed2eb Sudeep Holla     2017-06-14  126  		scmi_pd->genpd.power_on =
=3D scmi_pd_power_on;
a3b884cef8730c Nicolas Pitre    2021-05-07  127  		scmi_pd->genpd.attach_de=
v =3D scmi_pd_attach_dev;
a3b884cef8730c Nicolas Pitre    2021-05-07  128  		scmi_pd->genpd.detach_de=
v =3D scmi_pd_detach_dev;
a3b884cef8730c Nicolas Pitre    2021-05-07  129  		scmi_pd->genpd.flags =3D=
 GENPD_FLAG_PM_CLK |
a3b884cef8730c Nicolas Pitre    2021-05-07  130  				       GENPD_FLAG_ACTI=
VE_WAKEUP;
898216c97ed2eb Sudeep Holla     2017-06-14  131  =

898216c97ed2eb Sudeep Holla     2017-06-14  132  		pm_genpd_init(&scmi_pd->=
genpd, NULL,
898216c97ed2eb Sudeep Holla     2017-06-14  133  			      state =3D=3D SCMI=
_POWER_STATE_GENERIC_OFF);
e0f1a30cf18482 Cristian Marussi 2020-06-19  134  =

e0f1a30cf18482 Cristian Marussi 2020-06-19  135  		domains[i] =3D &scmi_pd-=
>genpd;
898216c97ed2eb Sudeep Holla     2017-06-14  136  	}
898216c97ed2eb Sudeep Holla     2017-06-14  137  =

898216c97ed2eb Sudeep Holla     2017-06-14  138  	scmi_pd_data->domains =3D=
 domains;
898216c97ed2eb Sudeep Holla     2017-06-14  139  	scmi_pd_data->num_domains=
 =3D num_domains;
898216c97ed2eb Sudeep Holla     2017-06-14  140  =

898216c97ed2eb Sudeep Holla     2017-06-14  141  	of_genpd_add_provider_one=
cell(np, scmi_pd_data);
898216c97ed2eb Sudeep Holla     2017-06-14  142  =

898216c97ed2eb Sudeep Holla     2017-06-14  143  	return 0;
898216c97ed2eb Sudeep Holla     2017-06-14  144  }
898216c97ed2eb Sudeep Holla     2017-06-14  145  =


:::::: The code at line 40 was first introduced by commit
:::::: 898216c97ed2ebfffda659ce12388da43534de6c firmware: arm_scmi: add dev=
ice power domain support using genpd

:::::: TO: Sudeep Holla <sudeep.holla@arm.com>
:::::: CC: Sudeep Holla <sudeep.holla@arm.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5905164149585700411==--

