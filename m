Content-Type: multipart/mixed; boundary="===============2000514936569511751=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/cpufreq/qcom-cpufreq-hw.c:333 qcom_lmh_dcvs_notify() error: uninitialized symbol 'throttled_freq'.
Date: Wed, 01 Jun 2022 07:53:38 +0800
Message-ID: <202206010736.NcY0Y2fK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2000514936569511751==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Viresh Kumar <viresh.kumar@linaro.org>
CC: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
CC: Bjorn Andersson <bjorn.andersson@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2a5699b0de4ee623d77f183c8e8e62691bd60a70
commit: 6240aaad75e1a623872a830d13393d7aabf1052c cpufreq: qcom-hw: fix the =
opp entries refcounting
date:   8 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 8 weeks ago
config: arm64-randconfig-m031-20220531 (https://download.01.org/0day-ci/arc=
hive/20220601/202206010736.NcY0Y2fK-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/cpufreq/qcom-cpufreq-hw.c:333 qcom_lmh_dcvs_notify() error: uniniti=
alized symbol 'throttled_freq'.

vim +/throttled_freq +333 drivers/cpufreq/qcom-cpufreq-hw.c

275157b367f479 Thara Gopinath   2021-08-09  289  =

275157b367f479 Thara Gopinath   2021-08-09  290  static void qcom_lmh_dcvs_=
notify(struct qcom_cpufreq_data *data)
275157b367f479 Thara Gopinath   2021-08-09  291  {
275157b367f479 Thara Gopinath   2021-08-09  292  	struct cpufreq_policy *po=
licy =3D data->policy;
5e4f009da6be56 Dmitry Baryshkov 2022-03-26  293  	int cpu =3D cpumask_first=
(policy->related_cpus);
275157b367f479 Thara Gopinath   2021-08-09  294  	struct device *dev =3D ge=
t_cpu_device(cpu);
0258cb19c77deb Lukasz Luba      2021-11-09  295  	unsigned long freq_hz, th=
rottled_freq;
275157b367f479 Thara Gopinath   2021-08-09  296  	struct dev_pm_opp *opp;
275157b367f479 Thara Gopinath   2021-08-09  297  	unsigned int freq;
275157b367f479 Thara Gopinath   2021-08-09  298  =

275157b367f479 Thara Gopinath   2021-08-09  299  	/*
275157b367f479 Thara Gopinath   2021-08-09  300  	 * Get the h/w throttled =
frequency, normalize it using the
275157b367f479 Thara Gopinath   2021-08-09  301  	 * registered opp table a=
nd use it to calculate thermal pressure.
275157b367f479 Thara Gopinath   2021-08-09  302  	 */
275157b367f479 Thara Gopinath   2021-08-09  303  	freq =3D qcom_lmh_get_thr=
ottle_freq(data);
275157b367f479 Thara Gopinath   2021-08-09  304  	freq_hz =3D freq * HZ_PER=
_KHZ;
275157b367f479 Thara Gopinath   2021-08-09  305  =

275157b367f479 Thara Gopinath   2021-08-09  306  	opp =3D dev_pm_opp_find_f=
req_floor(dev, &freq_hz);
275157b367f479 Thara Gopinath   2021-08-09  307  	if (IS_ERR(opp) && PTR_ER=
R(opp) =3D=3D -ERANGE)
6240aaad75e1a6 Dmitry Baryshkov 2022-03-26  308  		opp =3D dev_pm_opp_find_=
freq_ceil(dev, &freq_hz);
275157b367f479 Thara Gopinath   2021-08-09  309  =

6240aaad75e1a6 Dmitry Baryshkov 2022-03-26  310  	if (IS_ERR(opp)) {
6240aaad75e1a6 Dmitry Baryshkov 2022-03-26  311  		dev_warn(dev, "Can't fin=
d the OPP for throttling: %pe!\n", opp);
6240aaad75e1a6 Dmitry Baryshkov 2022-03-26  312  	} else {
275157b367f479 Thara Gopinath   2021-08-09  313  		throttled_freq =3D freq_=
hz / HZ_PER_KHZ;
275157b367f479 Thara Gopinath   2021-08-09  314  =

0258cb19c77deb Lukasz Luba      2021-11-09  315  		/* Update thermal pressu=
re (the boost frequencies are accepted) */
0258cb19c77deb Lukasz Luba      2021-11-09  316  		arch_update_thermal_pres=
sure(policy->related_cpus, throttled_freq);
275157b367f479 Thara Gopinath   2021-08-09  317  =

6240aaad75e1a6 Dmitry Baryshkov 2022-03-26  318  		dev_pm_opp_put(opp);
6240aaad75e1a6 Dmitry Baryshkov 2022-03-26  319  	}
6240aaad75e1a6 Dmitry Baryshkov 2022-03-26  320  =

275157b367f479 Thara Gopinath   2021-08-09  321  	/*
275157b367f479 Thara Gopinath   2021-08-09  322  	 * In the unlikely case p=
olicy is unregistered do not enable
275157b367f479 Thara Gopinath   2021-08-09  323  	 * polling or h/w interru=
pt
275157b367f479 Thara Gopinath   2021-08-09  324  	 */
275157b367f479 Thara Gopinath   2021-08-09  325  	mutex_lock(&data->throttl=
e_lock);
275157b367f479 Thara Gopinath   2021-08-09  326  	if (data->cancel_throttle)
275157b367f479 Thara Gopinath   2021-08-09  327  		goto out;
275157b367f479 Thara Gopinath   2021-08-09  328  =

275157b367f479 Thara Gopinath   2021-08-09  329  	/*
275157b367f479 Thara Gopinath   2021-08-09  330  	 * If h/w throttled frequ=
ency is higher than what cpufreq has requested
275157b367f479 Thara Gopinath   2021-08-09  331  	 * for, then stop polling=
 and switch back to interrupt mechanism.
275157b367f479 Thara Gopinath   2021-08-09  332  	 */
275157b367f479 Thara Gopinath   2021-08-09 @333  	if (throttled_freq >=3D q=
com_cpufreq_hw_get(cpu))
275157b367f479 Thara Gopinath   2021-08-09  334  		enable_irq(data->throttl=
e_irq);
275157b367f479 Thara Gopinath   2021-08-09  335  	else
275157b367f479 Thara Gopinath   2021-08-09  336  		mod_delayed_work(system_=
highpri_wq, &data->throttle_work,
275157b367f479 Thara Gopinath   2021-08-09  337  				 msecs_to_jiffies(10));
275157b367f479 Thara Gopinath   2021-08-09  338  =

275157b367f479 Thara Gopinath   2021-08-09  339  out:
275157b367f479 Thara Gopinath   2021-08-09  340  	mutex_unlock(&data->throt=
tle_lock);
275157b367f479 Thara Gopinath   2021-08-09  341  }
275157b367f479 Thara Gopinath   2021-08-09  342  =


:::::: The code at line 333 was first introduced by commit
:::::: 275157b367f479334f3e2df7be93a3dd772f359c cpufreq: qcom-cpufreq-hw: A=
dd dcvs interrupt support

:::::: TO: Thara Gopinath <thara.gopinath@linaro.org>
:::::: CC: Viresh Kumar <viresh.kumar@linaro.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2000514936569511751==--

