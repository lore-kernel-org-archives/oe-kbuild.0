Content-Type: multipart/mixed; boundary="===============2772732895417299917=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/cpufreq/intel_pstate.c:2850:28: warning: Local variable id shadows outer variable
Date: Fri, 21 Aug 2020 15:08:51 +0800
Message-ID: <202008211547.y1gqS999%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2772732895417299917==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   da2968ff879b9e74688cdc658f646971991d2c56
commit: ed7bde7a6dab521ee9e28fe2264018f83d83c7fa cpufreq: intel_pstate: All=
ow enable/disable energy efficiency
date:   7 weeks ago
:::::: branch date: 10 hours ago
:::::: commit date: 7 weeks ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   drivers/cpufreq/intel_pstate.c:1023:9: warning: %u in format string (no.=
 1) requires 'unsigned int' but the argument type is 'signed int'. [invalid=
PrintfArgType_uint]
    return sprintf(buf, "%un", turbo_pct);
           ^
   drivers/cpufreq/intel_pstate.c:1044:9: warning: %u in format string (no.=
 1) requires 'unsigned int' but the argument type is 'signed int'. [invalid=
PrintfArgType_uint]
    return sprintf(buf, "%un", total);
           ^
   drivers/cpufreq/intel_pstate.c:1276:1: warning: %u in format string (no.=
 1) requires 'unsigned int' but the argument type is 'signed int'. [invalid=
PrintfArgType_uint]
   show_one(max_perf_pct, max_perf_pct);
   ^
   drivers/cpufreq/intel_pstate.c:1277:1: warning: %u in format string (no.=
 1) requires 'unsigned int' but the argument type is 'signed int'. [invalid=
PrintfArgType_uint]
   show_one(min_perf_pct, min_perf_pct);
   ^
>> drivers/cpufreq/intel_pstate.c:2850:28: warning: Local variable id shado=
ws outer variable [shadowVar]
     const struct x86_cpu_id *id;
                              ^
   drivers/cpufreq/intel_pstate.c:2785:27: note: Shadowed declaration
    const struct x86_cpu_id *id;
                             ^
   drivers/cpufreq/intel_pstate.c:2850:28: note: Shadow variable
     const struct x86_cpu_id *id;
                              ^
   drivers/cpufreq/intel_pstate.c:1500:6: warning: Local variable plat_info=
 shadows outer variable [shadowVar]
    u64 plat_info;
        ^
   drivers/cpufreq/intel_pstate.c:2701:34: note: Shadowed declaration
   static struct acpi_platform_list plat_info[] __initdata =3D {
                                    ^
   drivers/cpufreq/intel_pstate.c:1500:6: note: Shadow variable
    u64 plat_info;
        ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Ded7bde7a6dab521ee9e28fe2264018f83d83c7fa
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout ed7bde7a6dab521ee9e28fe2264018f83d83c7fa
vim +2850 drivers/cpufreq/intel_pstate.c

7791e4aa59ad72 Srinivas Pandruvada 2016-02-25  2782  =

93f0822dff5dae Dirk Brandewie      2013-02-06  2783  static int __init inte=
l_pstate_init(void)
93f0822dff5dae Dirk Brandewie      2013-02-06  2784  {
ff7c9917143b3a Srinivas Pandruvada 2018-06-18  2785  	const struct x86_cpu_=
id *id;
eb5139d1a22724 Rafael J. Wysocki   2017-03-22  2786  	int rc;
93f0822dff5dae Dirk Brandewie      2013-02-06  2787  =

4ab526468344c1 Borislav Petkov     2019-04-01  2788  	if (boot_cpu_data.x86=
_vendor !=3D X86_VENDOR_INTEL)
4ab526468344c1 Borislav Petkov     2019-04-01  2789  		return -ENODEV;
4ab526468344c1 Borislav Petkov     2019-04-01  2790  =

6be264986152c4 Dirk Brandewie      2013-02-15  2791  	if (no_load)
6be264986152c4 Dirk Brandewie      2013-02-15  2792  		return -ENODEV;
6be264986152c4 Dirk Brandewie      2013-02-15  2793  =

ff7c9917143b3a Srinivas Pandruvada 2018-06-18  2794  	id =3D x86_match_cpu(=
hwp_support_ids);
ff7c9917143b3a Srinivas Pandruvada 2018-06-18  2795  	if (id) {
2f49afc2a6f6ec Rafael J. Wysocki   2017-03-28  2796  		copy_cpu_funcs(&core=
_funcs);
c4f3f70cacba2f Rafael J. Wysocki   2017-07-25  2797  		if (!no_hwp) {
7791e4aa59ad72 Srinivas Pandruvada 2016-02-25  2798  			hwp_active++;
ff7c9917143b3a Srinivas Pandruvada 2018-06-18  2799  			hwp_mode_bdw =3D id=
->driver_data;
984edbdccc6ff0 Srinivas Pandruvada 2016-12-06  2800  			intel_pstate.attr =
=3D hwp_cpufreq_attrs;
7791e4aa59ad72 Srinivas Pandruvada 2016-02-25  2801  			goto hwp_cpu_matche=
d;
7791e4aa59ad72 Srinivas Pandruvada 2016-02-25  2802  		}
eb5139d1a22724 Rafael J. Wysocki   2017-03-22  2803  	} else {
93f0822dff5dae Dirk Brandewie      2013-02-06  2804  		id =3D x86_match_cpu=
(intel_pstate_cpu_ids);
076b862c7e4409 Erwan Velu          2019-02-13  2805  		if (!id) {
4ab526468344c1 Borislav Petkov     2019-04-01  2806  			pr_info("CPU model =
not supported\n");
93f0822dff5dae Dirk Brandewie      2013-02-06  2807  			return -ENODEV;
076b862c7e4409 Erwan Velu          2019-02-13  2808  		}
93f0822dff5dae Dirk Brandewie      2013-02-06  2809  =

2f49afc2a6f6ec Rafael J. Wysocki   2017-03-28  2810  		copy_cpu_funcs((stru=
ct pstate_funcs *)id->driver_data);
eb5139d1a22724 Rafael J. Wysocki   2017-03-22  2811  	}
016c815084d5b8 Dirk Brandewie      2013-10-21  2812  =

076b862c7e4409 Erwan Velu          2019-02-13  2813  	if (intel_pstate_msrs=
_not_valid()) {
076b862c7e4409 Erwan Velu          2019-02-13  2814  		pr_info("Invalid MSR=
s\n");
b563b4e3f2dd60 Dirk Brandewie      2013-03-22  2815  		return -ENODEV;
076b862c7e4409 Erwan Velu          2019-02-13  2816  	}
33aa46f252c703 Rafael J. Wysocki   2020-03-25  2817  	/* Without HWP start =
in the passive mode. */
33aa46f252c703 Rafael J. Wysocki   2020-03-25  2818  	default_driver =3D &i=
ntel_cpufreq;
b563b4e3f2dd60 Dirk Brandewie      2013-03-22  2819  =

7791e4aa59ad72 Srinivas Pandruvada 2016-02-25  2820  hwp_cpu_matched:
7791e4aa59ad72 Srinivas Pandruvada 2016-02-25  2821  	/*
7791e4aa59ad72 Srinivas Pandruvada 2016-02-25  2822  	 * The Intel pstate d=
river will be ignored if the platform
7791e4aa59ad72 Srinivas Pandruvada 2016-02-25  2823  	 * firmware has its o=
wn power management modes.
7791e4aa59ad72 Srinivas Pandruvada 2016-02-25  2824  	 */
076b862c7e4409 Erwan Velu          2019-02-13  2825  	if (intel_pstate_plat=
form_pwr_mgmt_exists()) {
076b862c7e4409 Erwan Velu          2019-02-13  2826  		pr_info("P-states co=
ntrolled by the platform\n");
7791e4aa59ad72 Srinivas Pandruvada 2016-02-25  2827  		return -ENODEV;
076b862c7e4409 Erwan Velu          2019-02-13  2828  	}
7791e4aa59ad72 Srinivas Pandruvada 2016-02-25  2829  =

fb1fe1041c04ee Rafael J. Wysocki   2017-01-05  2830  	if (!hwp_active && hw=
p_only)
fb1fe1041c04ee Rafael J. Wysocki   2017-01-05  2831  		return -ENOTSUPP;
fb1fe1041c04ee Rafael J. Wysocki   2017-01-05  2832  =

4836df173aaed4 Joe Perches         2016-04-05  2833  	pr_info("Intel P-stat=
e driver initializing\n");
93f0822dff5dae Dirk Brandewie      2013-02-06  2834  =

fad953ce0b22cf Kees Cook           2018-06-12  2835  	all_cpu_data =3D vzal=
loc(array_size(sizeof(void *), num_possible_cpus()));
93f0822dff5dae Dirk Brandewie      2013-02-06  2836  	if (!all_cpu_data)
93f0822dff5dae Dirk Brandewie      2013-02-06  2837  		return -ENOMEM;
93f0822dff5dae Dirk Brandewie      2013-02-06  2838  =

d0ea59e1889414 Rafael J. Wysocki   2016-11-17  2839  	intel_pstate_request_=
control_from_smm();
d0ea59e1889414 Rafael J. Wysocki   2016-11-17  2840  =

93f0822dff5dae Dirk Brandewie      2013-02-06  2841  	intel_pstate_sysfs_ex=
pose_params();
b69880f9ccf7e1 Dirk Brandewie      2014-01-16  2842  =

0c30b65b3c8e5b Rafael J. Wysocki   2017-01-11  2843  	mutex_lock(&intel_pst=
ate_driver_lock);
ee8df89a68f27a Rafael J. Wysocki   2017-03-28  2844  	rc =3D intel_pstate_r=
egister_driver(default_driver);
0c30b65b3c8e5b Rafael J. Wysocki   2017-01-11  2845  	mutex_unlock(&intel_p=
state_driver_lock);
fb1fe1041c04ee Rafael J. Wysocki   2017-01-05  2846  	if (rc)
93f0822dff5dae Dirk Brandewie      2013-02-06  2847  		return rc;
001c76f05b01cc Rafael J. Wysocki   2016-11-17  2848  =

ed7bde7a6dab52 Srinivas Pandruvada 2020-06-26  2849  	if (hwp_active) {
ed7bde7a6dab52 Srinivas Pandruvada 2020-06-26 @2850  		const struct x86_cpu=
_id *id;
ed7bde7a6dab52 Srinivas Pandruvada 2020-06-26  2851  =

ed7bde7a6dab52 Srinivas Pandruvada 2020-06-26  2852  		id =3D x86_match_cpu=
(intel_pstate_cpu_ee_disable_ids);
ed7bde7a6dab52 Srinivas Pandruvada 2020-06-26  2853  		if (id) {
ed7bde7a6dab52 Srinivas Pandruvada 2020-06-26  2854  			set_power_ctl_ee_st=
ate(false);
ed7bde7a6dab52 Srinivas Pandruvada 2020-06-26  2855  			pr_info("Disabling =
energy efficiency optimization\n");
ed7bde7a6dab52 Srinivas Pandruvada 2020-06-26  2856  		}
ed7bde7a6dab52 Srinivas Pandruvada 2020-06-26  2857  =

4836df173aaed4 Joe Perches         2016-04-05  2858  		pr_info("HWP enabled=
\n");
ed7bde7a6dab52 Srinivas Pandruvada 2020-06-26  2859  	}
907cc908108b16 Dirk Brandewie      2013-03-05  2860  =

fb1fe1041c04ee Rafael J. Wysocki   2017-01-05  2861  	return 0;
93f0822dff5dae Dirk Brandewie      2013-02-06  2862  }
93f0822dff5dae Dirk Brandewie      2013-02-06  2863  device_initcall(intel_=
pstate_init);
93f0822dff5dae Dirk Brandewie      2013-02-06  2864  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2772732895417299917==--

