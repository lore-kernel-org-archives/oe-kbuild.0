Content-Type: multipart/mixed; boundary="===============8882074017090119404=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 7385/14565] drivers/opp/core.c:2364 _opp_attach_genpd() warn: passing zero to 'PTR_ERR'
Date: Sat, 06 Aug 2022 03:20:31 +0800
Message-ID: <202208060312.GvvAge8e-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8882074017090119404==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Viresh Kumar <viresh.kumar@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   e894659f149e779bc1b49016231d75994f6a29e9
commit: 442e7a1786e628b38175314ec1805966b8d0c02c [7385/14565] OPP: Migrate =
attach-genpd API to use set-config helpers
:::::: branch date: 4 hours ago
:::::: commit date: 4 weeks ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
806/202208060312.GvvAge8e-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/opp/core.c:2364 _opp_attach_genpd() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/opp/core.c:1278 dev_pm_opp_set_rate() warn: passing a valid pointer=
 to 'PTR_ERR'
drivers/opp/core.c:2795 _opp_set_availability() warn: passing a valid point=
er to 'PTR_ERR'
drivers/opp/core.c:2866 dev_pm_opp_adjust_voltage() warn: passing a valid p=
ointer to 'PTR_ERR'

vim +/PTR_ERR +2364 drivers/opp/core.c

6319aee10e5303 Viresh Kumar    2019-05-08  2306  =

4f018bc0e1cfde Viresh Kumar    2018-06-26  2307  /**
442e7a1786e628 Viresh Kumar    2022-05-26  2308   * _opp_attach_genpd - Att=
ach genpd(s) for the device and save virtual device pointer
6319aee10e5303 Viresh Kumar    2019-05-08  2309   * @dev: Consumer device f=
or which the genpd is getting attached.
6319aee10e5303 Viresh Kumar    2019-05-08  2310   * @names: Null terminated=
 array of pointers containing names of genpd to attach.
17a8f868ae3e85 Viresh Kumar    2019-07-08  2311   * @virt_devs: Pointer to =
return the array of virtual devices.
4f018bc0e1cfde Viresh Kumar    2018-06-26  2312   *
4f018bc0e1cfde Viresh Kumar    2018-06-26  2313   * Multiple generic power =
domains for a device are supported with the help of
4f018bc0e1cfde Viresh Kumar    2018-06-26  2314   * virtual genpd devices, =
which are created for each consumer device - genpd
4f018bc0e1cfde Viresh Kumar    2018-06-26  2315   * pair. These are the dev=
ice structures which are attached to the power domain
4f018bc0e1cfde Viresh Kumar    2018-06-26  2316   * and are required by the=
 OPP core to set the performance state of the genpd.
6319aee10e5303 Viresh Kumar    2019-05-08  2317   * The same API also works=
 for the case where single genpd is available and so
6319aee10e5303 Viresh Kumar    2019-05-08  2318   * we don't need to suppor=
t that separately.
4f018bc0e1cfde Viresh Kumar    2018-06-26  2319   *
4f018bc0e1cfde Viresh Kumar    2018-06-26  2320   * This helper will normal=
ly be called by the consumer driver of the device
6319aee10e5303 Viresh Kumar    2019-05-08  2321   * "dev", as only that has=
 details of the genpd names.
4f018bc0e1cfde Viresh Kumar    2018-06-26  2322   *
6319aee10e5303 Viresh Kumar    2019-05-08  2323   * This helper needs to be=
 called once with a list of all genpd to attach.
6319aee10e5303 Viresh Kumar    2019-05-08  2324   * Otherwise the original =
device structure will be used instead by the OPP core.
baea35e4db17a7 Viresh Kumar    2019-07-17  2325   *
baea35e4db17a7 Viresh Kumar    2019-07-17  2326   * The order of entries in=
 the names array must match the order in which
baea35e4db17a7 Viresh Kumar    2019-07-17  2327   * "required-opps" are add=
ed in DT.
4f018bc0e1cfde Viresh Kumar    2018-06-26  2328   */
442e7a1786e628 Viresh Kumar    2022-05-26  2329  static int _opp_attach_gen=
pd(struct opp_table *opp_table, struct device *dev,
3734b9f2cee01d Dmitry Osipenko 2021-09-27  2330  			const char * const *nam=
es, struct device ***virt_devs)
4f018bc0e1cfde Viresh Kumar    2018-06-26  2331  {
6319aee10e5303 Viresh Kumar    2019-05-08  2332  	struct device *virt_dev;
baea35e4db17a7 Viresh Kumar    2019-07-17  2333  	int index =3D 0, ret =3D =
-EINVAL;
3734b9f2cee01d Dmitry Osipenko 2021-09-27  2334  	const char * const *name =
=3D names;
4f018bc0e1cfde Viresh Kumar    2018-06-26  2335  =

cb60e9602cce15 Viresh Kumar    2020-08-31  2336  	if (opp_table->genpd_virt=
_devs)
442e7a1786e628 Viresh Kumar    2022-05-26  2337  		return 0;
4f018bc0e1cfde Viresh Kumar    2018-06-26  2338  =

6319aee10e5303 Viresh Kumar    2019-05-08  2339  	/*
6319aee10e5303 Viresh Kumar    2019-05-08  2340  	 * If the genpd's OPP tab=
le isn't already initialized, parsing of the
6319aee10e5303 Viresh Kumar    2019-05-08  2341  	 * required-opps fail for=
 dev. We should retry this after genpd's OPP
6319aee10e5303 Viresh Kumar    2019-05-08  2342  	 * table is added.
6319aee10e5303 Viresh Kumar    2019-05-08  2343  	 */
442e7a1786e628 Viresh Kumar    2022-05-26  2344  	if (!opp_table->required_=
opp_count)
442e7a1786e628 Viresh Kumar    2022-05-26  2345  		return -EPROBE_DEFER;
6319aee10e5303 Viresh Kumar    2019-05-08  2346  =

4f018bc0e1cfde Viresh Kumar    2018-06-26  2347  	mutex_lock(&opp_table->ge=
npd_virt_dev_lock);
4f018bc0e1cfde Viresh Kumar    2018-06-26  2348  =

c0ab9e0812da8e Viresh Kumar    2019-05-08  2349  	opp_table->genpd_virt_dev=
s =3D kcalloc(opp_table->required_opp_count,
c0ab9e0812da8e Viresh Kumar    2019-05-08  2350  					     sizeof(*opp_tabl=
e->genpd_virt_devs),
c0ab9e0812da8e Viresh Kumar    2019-05-08  2351  					     GFP_KERNEL);
c0ab9e0812da8e Viresh Kumar    2019-05-08  2352  	if (!opp_table->genpd_vir=
t_devs)
c0ab9e0812da8e Viresh Kumar    2019-05-08  2353  		goto unlock;
4f018bc0e1cfde Viresh Kumar    2018-06-26  2354  =

6319aee10e5303 Viresh Kumar    2019-05-08  2355  	while (*name) {
6319aee10e5303 Viresh Kumar    2019-05-08  2356  		if (index >=3D opp_table=
->required_opp_count) {
6319aee10e5303 Viresh Kumar    2019-05-08  2357  			dev_err(dev, "Index can=
't be greater than required-opp-count - 1, %s (%d : %d)\n",
6319aee10e5303 Viresh Kumar    2019-05-08  2358  				*name, opp_table->requ=
ired_opp_count, index);
6319aee10e5303 Viresh Kumar    2019-05-08  2359  			goto err;
6319aee10e5303 Viresh Kumar    2019-05-08  2360  		}
4f018bc0e1cfde Viresh Kumar    2018-06-26  2361  =

6319aee10e5303 Viresh Kumar    2019-05-08  2362  		virt_dev =3D dev_pm_doma=
in_attach_by_name(dev, *name);
4ea9496cbc959e Tang Bin        2022-05-24  2363  		if (IS_ERR_OR_NULL(virt_=
dev)) {
4ea9496cbc959e Tang Bin        2022-05-24 @2364  			ret =3D PTR_ERR(virt_de=
v) ? : -ENODEV;
6319aee10e5303 Viresh Kumar    2019-05-08  2365  			dev_err(dev, "Couldn't =
attach to pm_domain: %d\n", ret);
6319aee10e5303 Viresh Kumar    2019-05-08  2366  			goto err;
4f018bc0e1cfde Viresh Kumar    2018-06-26  2367  		}
4f018bc0e1cfde Viresh Kumar    2018-06-26  2368  =

4f018bc0e1cfde Viresh Kumar    2018-06-26  2369  		opp_table->genpd_virt_de=
vs[index] =3D virt_dev;
baea35e4db17a7 Viresh Kumar    2019-07-17  2370  		index++;
6319aee10e5303 Viresh Kumar    2019-05-08  2371  		name++;
6319aee10e5303 Viresh Kumar    2019-05-08  2372  	}
6319aee10e5303 Viresh Kumar    2019-05-08  2373  =

17a8f868ae3e85 Viresh Kumar    2019-07-08  2374  	if (virt_devs)
17a8f868ae3e85 Viresh Kumar    2019-07-08  2375  		*virt_devs =3D opp_table=
->genpd_virt_devs;
4f018bc0e1cfde Viresh Kumar    2018-06-26  2376  	mutex_unlock(&opp_table->=
genpd_virt_dev_lock);
4f018bc0e1cfde Viresh Kumar    2018-06-26  2377  =

442e7a1786e628 Viresh Kumar    2022-05-26  2378  	return 0;
6319aee10e5303 Viresh Kumar    2019-05-08  2379  =

6319aee10e5303 Viresh Kumar    2019-05-08  2380  err:
442e7a1786e628 Viresh Kumar    2022-05-26  2381  	_detach_genpd(opp_table);
c0ab9e0812da8e Viresh Kumar    2019-05-08  2382  unlock:
6319aee10e5303 Viresh Kumar    2019-05-08  2383  	mutex_unlock(&opp_table->=
genpd_virt_dev_lock);
442e7a1786e628 Viresh Kumar    2022-05-26  2384  	return ret;
6319aee10e5303 Viresh Kumar    2019-05-08  2385  =


:::::: The code at line 2364 was first introduced by commit
:::::: 4ea9496cbc959eb5c78f3e379199aca9ef4e386b opp: Fix error check in dev=
_pm_opp_attach_genpd()

:::::: TO: Tang Bin <tangbin@cmss.chinamobile.com>
:::::: CC: Viresh Kumar <viresh.kumar@linaro.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8882074017090119404==--

