Content-Type: multipart/mixed; boundary="===============7260942964035082291=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 15/15] thermal/of: Initialize trip points separately
Date: Tue, 03 May 2022 15:46:30 +0800
Message-ID: <202205031504.J62WedEw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7260942964035082291==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220426221523.3056696-16-daniel.lezcano@linexp.org>
References: <20220426221523.3056696-16-daniel.lezcano@linexp.org>
TO: Daniel Lezcano <daniel.lezcano@linexp.org>
TO: rafael(a)kernel.org
TO: daniel.lezcano(a)linaro.org
CC: khilman(a)baylibre.com
CC: abailon(a)baylibre.com
CC: linux-pm(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

Hi Daniel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tegra/for-next]
[also build test WARNING on sre-power-supply/for-next linus/master v5.18-rc=
5]
[cannot apply to rafael-pm/thermal next-20220502]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Lezcano/therm=
al-OF-rework/20220427-061937
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for=
-next
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
503/202205031504.J62WedEw-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/thermal/thermal_of.c:996 thermal_of_build_thermal_zone() error: uni=
nitialized symbol 'gchild'.

vim +/gchild +996 drivers/thermal/thermal_of.c

b446fa392d1d9f drivers/thermal/thermal_of.c Daniel Lezcano     2022-04-27  =
 887  =

4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 888  /**
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 889   * thermal_of_build_thermal_zone - parse and fill one thermal zone da=
ta
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 890   * @np: DT node containing a thermal zone node
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 891   *
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 892   * This function parses a thermal zone type of node represented by
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 893   * @np parameter and fills the read data into a __thermal_zone data s=
tructure
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 894   * and return this pointer.
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 895   *
a46dbae8abe5cd drivers/thermal/of-thermal.c Eduardo Valentin   2015-05-11  =
 896   * TODO: Missing properties to parse: thermal-sensor-names
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 897   *
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 898   * Return: On success returns a valid struct __thermal_zone,
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 899   * otherwise, it returns a corresponding ERR_PTR(). Caller must
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 900   * check the return value with help of IS_ERR() helper.
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 901   */
c0ff8aaae36955 drivers/thermal/of-thermal.c Julia Lawall       2016-04-19  =
 902  static struct __thermal_zone
c0ff8aaae36955 drivers/thermal/of-thermal.c Julia Lawall       2016-04-19  =
 903  __init *thermal_of_build_thermal_zone(struct device_node *np)
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 904  {
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 905  	struct device_node *child =3D NULL, *gchild;
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 906  	struct __thermal_zone *tz;
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 907  	int ret, i;
a46dbae8abe5cd drivers/thermal/of-thermal.c Eduardo Valentin   2015-05-11  =
 908  	u32 prop, coef[2];
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 909  =

4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 910  	if (!np) {
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 911  		pr_err("no thermal zone np\n");
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 912  		return ERR_PTR(-EINVAL);
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 913  	}
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 914  =

4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 915  	tz =3D kzalloc(sizeof(*tz), GFP_KERNEL);
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 916  	if (!tz)
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 917  		return ERR_PTR(-ENOMEM);
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 918  =

4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 919  	ret =3D of_property_read_u32(np, "polling-delay-passive", &prop);
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 920  	if (ret < 0) {
3079f340caa72a drivers/thermal/of-thermal.c Amit Kucheria      2019-01-21  =
 921  		pr_err("%pOFn: missing polling-delay-passive property\n", np);
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 922  		goto free_tz;
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 923  	}
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 924  	tz->passive_delay =3D prop;
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 925  =

4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 926  	ret =3D of_property_read_u32(np, "polling-delay", &prop);
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 927  	if (ret < 0) {
3079f340caa72a drivers/thermal/of-thermal.c Amit Kucheria      2019-01-21  =
 928  		pr_err("%pOFn: missing polling-delay property\n", np);
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 929  		goto free_tz;
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 930  	}
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 931  	tz->polling_delay =3D prop;
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 932  =

a46dbae8abe5cd drivers/thermal/of-thermal.c Eduardo Valentin   2015-05-11  =
 933  	/*
a46dbae8abe5cd drivers/thermal/of-thermal.c Eduardo Valentin   2015-05-11  =
 934  	 * REVIST: for now, the thermal framework supports only
a46dbae8abe5cd drivers/thermal/of-thermal.c Eduardo Valentin   2015-05-11  =
 935  	 * one sensor per thermal zone. Thus, we are considering
a46dbae8abe5cd drivers/thermal/of-thermal.c Eduardo Valentin   2015-05-11  =
 936  	 * only the first two values as slope and offset.
a46dbae8abe5cd drivers/thermal/of-thermal.c Eduardo Valentin   2015-05-11  =
 937  	 */
a46dbae8abe5cd drivers/thermal/of-thermal.c Eduardo Valentin   2015-05-11  =
 938  	ret =3D of_property_read_u32_array(np, "coefficients", coef, 2);
a46dbae8abe5cd drivers/thermal/of-thermal.c Eduardo Valentin   2015-05-11  =
 939  	if (ret =3D=3D 0) {
a46dbae8abe5cd drivers/thermal/of-thermal.c Eduardo Valentin   2015-05-11  =
 940  		tz->slope =3D coef[0];
a46dbae8abe5cd drivers/thermal/of-thermal.c Eduardo Valentin   2015-05-11  =
 941  		tz->offset =3D coef[1];
a46dbae8abe5cd drivers/thermal/of-thermal.c Eduardo Valentin   2015-05-11  =
 942  	} else {
a46dbae8abe5cd drivers/thermal/of-thermal.c Eduardo Valentin   2015-05-11  =
 943  		tz->slope =3D 1;
a46dbae8abe5cd drivers/thermal/of-thermal.c Eduardo Valentin   2015-05-11  =
 944  		tz->offset =3D 0;
a46dbae8abe5cd drivers/thermal/of-thermal.c Eduardo Valentin   2015-05-11  =
 945  	}
a46dbae8abe5cd drivers/thermal/of-thermal.c Eduardo Valentin   2015-05-11  =
 946  =

b446fa392d1d9f drivers/thermal/thermal_of.c Daniel Lezcano     2022-04-27  =
 947  	tz->trips =3D thermal_of_trips_init(np, &tz->ntrips);
b446fa392d1d9f drivers/thermal/thermal_of.c Daniel Lezcano     2022-04-27  =
 948  	if (IS_ERR(tz->trips)) {
b446fa392d1d9f drivers/thermal/thermal_of.c Daniel Lezcano     2022-04-27  =
 949  		ret =3D PTR_ERR(tz->trips);
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 950  		goto finish;
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 951  	}
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 952  =

4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 953  	/* cooling-maps */
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 954  	child =3D of_get_child_by_name(np, "cooling-maps");
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 955  =

4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 956  	/* cooling-maps not provided */
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 957  	if (!child)
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 958  		goto finish;
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 959  =

4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 960  	tz->num_tbps =3D of_get_child_count(child);
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 961  	if (tz->num_tbps =3D=3D 0)
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 962  		goto finish;
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 963  =

6396bb221514d2 drivers/thermal/of-thermal.c Kees Cook          2018-06-12  =
 964  	tz->tbps =3D kcalloc(tz->num_tbps, sizeof(*tz->tbps), GFP_KERNEL);
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 965  	if (!tz->tbps) {
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 966  		ret =3D -ENOMEM;
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 967  		goto free_trips;
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 968  	}
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 969  =

4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 970  	i =3D 0;
ca9521b770c988 drivers/thermal/of-thermal.c Stephen Boyd       2014-06-18  =
 971  	for_each_child_of_node(child, gchild) {
b446fa392d1d9f drivers/thermal/thermal_of.c Daniel Lezcano     2022-04-27  =
 972  		ret =3D thermal_of_populate_bind_params(np, gchild, &tz->tbps[i++]);
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 973  		if (ret)
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 974  			goto free_tbps;
ca9521b770c988 drivers/thermal/of-thermal.c Stephen Boyd       2014-06-18  =
 975  	}
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 976  =

4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 977  finish:
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 978  	of_node_put(child);
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 979  =

4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 980  	return tz;
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 981  =

4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 982  free_tbps:
a92bab8919e3fb drivers/thermal/of-thermal.c Viresh Kumar       2018-08-08  =
 983  	for (i =3D i - 1; i >=3D 0; i--) {
a92bab8919e3fb drivers/thermal/of-thermal.c Viresh Kumar       2018-08-08  =
 984  		struct __thermal_bind_params *tbp =3D tz->tbps + i;
a92bab8919e3fb drivers/thermal/of-thermal.c Viresh Kumar       2018-08-08  =
 985  		int j;
a92bab8919e3fb drivers/thermal/of-thermal.c Viresh Kumar       2018-08-08  =
 986  =

a92bab8919e3fb drivers/thermal/of-thermal.c Viresh Kumar       2018-08-08  =
 987  		for (j =3D 0; j < tbp->count; j++)
a92bab8919e3fb drivers/thermal/of-thermal.c Viresh Kumar       2018-08-08  =
 988  			of_node_put(tbp->tcbp[j].cooling_device);
a92bab8919e3fb drivers/thermal/of-thermal.c Viresh Kumar       2018-08-08  =
 989  =

a92bab8919e3fb drivers/thermal/of-thermal.c Viresh Kumar       2018-08-08  =
 990  		kfree(tbp->tcbp);
a92bab8919e3fb drivers/thermal/of-thermal.c Viresh Kumar       2018-08-08  =
 991  	}
a92bab8919e3fb drivers/thermal/of-thermal.c Viresh Kumar       2018-08-08  =
 992  =

4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 993  	kfree(tz->tbps);
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 994  free_trips:
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 995  	kfree(tz->trips);
c2aad93c7edd5e drivers/thermal/of-thermal.c Vladimir Zapolskiy 2014-09-29  =
@996  	of_node_put(gchild);
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 997  free_tz:
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 998  	kfree(tz);
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 999  	of_node_put(child);
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
1000  =

4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
1001  	return ERR_PTR(ret);
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
1002  }
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
1003  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7260942964035082291==--

