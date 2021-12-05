Content-Type: multipart/mixed; boundary="===============5856680362016216947=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-lts:5.10/android-civ 23385/23680] arch/x86/events/core.c:334 check_hw_exists() error: uninitialized symbol 'reg'.
Date: Sun, 05 Dec 2021 12:36:47 +0800
Message-ID: <202112051248.Hz1rdbWh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5856680362016216947==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Sun Jian <jian.sun@intel.com>
CC: "Kris, Pan" <kris.pan@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.10/android-civ
head:   0e493748b235bf61d817dabdad2832ac4e932217
commit: 16a4cbddddb16af355bbbadcbe5b9c7504d20277 [23385/23680] Skip hw pmu =
for VM on ADL
:::::: branch date: 10 days ago
:::::: commit date: 5 weeks ago
config: x86_64-randconfig-m001-20211203 (https://download.01.org/0day-ci/ar=
chive/20211205/202112051248.Hz1rdbWh-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
arch/x86/events/core.c:334 check_hw_exists() error: uninitialized symbol 'r=
eg'.

Old smatch warnings:
arch/x86/events/core.c:285 check_hw_exists() warn: should '(3 << i * 4)' be=
 a 64 bit type?

vim +/reg +334 arch/x86/events/core.c

b27ea29c626788 arch/x86/kernel/cpu/perf_event.c Robert Richter         2010=
-03-17  244  =

eac065f8ebdc04 arch/x86/events/core.c           Kan Liang              2021=
-04-12  245  bool check_hw_exists(struct pmu *pmu, int num_counters, int nu=
m_counters_fixed)
33c6d6a7ad0ffa arch/x86/kernel/cpu/perf_event.c Don Zickus             2010=
-11-22  246  {
11d8b05855f374 arch/x86/events/core.c           Arnd Bergmann          2017=
-07-19  247  	u64 val, val_fail =3D -1, val_new=3D ~0;
11d8b05855f374 arch/x86/events/core.c           Arnd Bergmann          2017=
-07-19  248  	int i, reg, reg_fail =3D -1, ret =3D 0;
a5ebe0ba3dff65 arch/x86/kernel/cpu/perf_event.c George Dunlap          2013=
-04-03  249  	int bios_fail =3D 0;
68ab747604da98 arch/x86/kernel/cpu/perf_event.c Don Zickus             2015=
-05-18  250  	int reg_safe =3D -1;
33c6d6a7ad0ffa arch/x86/kernel/cpu/perf_event.c Don Zickus             2010=
-11-22  251  =

16a4cbddddb16a arch/x86/events/core.c           Sun Jian               2021=
-10-04  252  	if(boot_cpu_has(X86_FEATURE_HYPERVISOR) &&
16a4cbddddb16a arch/x86/events/core.c           Sun Jian               2021=
-10-04  253  			(boot_cpu_data.x86_model =3D=3D INTEL_FAM6_ALDERLAKE ||
16a4cbddddb16a arch/x86/events/core.c           Sun Jian               2021=
-10-04  254  			boot_cpu_data.x86_model =3D=3D INTEL_FAM6_ALDERLAKE_L)) {
16a4cbddddb16a arch/x86/events/core.c           Sun Jian               2021=
-10-04  255  		pr_cont("Disabling PMU for VM on ADL.\n");
16a4cbddddb16a arch/x86/events/core.c           Sun Jian               2021=
-10-04  256  		goto msr_fail;
16a4cbddddb16a arch/x86/events/core.c           Sun Jian               2021=
-10-04  257  	}
16a4cbddddb16a arch/x86/events/core.c           Sun Jian               2021=
-10-04  258  =

4407204c5c9037 arch/x86/kernel/cpu/perf_event.c Peter Zijlstra         2010=
-12-08  259  	/*
4407204c5c9037 arch/x86/kernel/cpu/perf_event.c Peter Zijlstra         2010=
-12-08  260  	 * Check to see if the BIOS enabled any of the counters, if so
4407204c5c9037 arch/x86/kernel/cpu/perf_event.c Peter Zijlstra         2010=
-12-08  261  	 * complain and bail.
4407204c5c9037 arch/x86/kernel/cpu/perf_event.c Peter Zijlstra         2010=
-12-08  262  	 */
eac065f8ebdc04 arch/x86/events/core.c           Kan Liang              2021=
-04-12  263  	for (i =3D 0; i < num_counters; i++) {
41bf498949a263 arch/x86/kernel/cpu/perf_event.c Robert Richter         2011=
-02-02  264  		reg =3D x86_pmu_config_addr(i);
4407204c5c9037 arch/x86/kernel/cpu/perf_event.c Peter Zijlstra         2010=
-12-08  265  		ret =3D rdmsrl_safe(reg, &val);
4407204c5c9037 arch/x86/kernel/cpu/perf_event.c Peter Zijlstra         2010=
-12-08  266  		if (ret)
4407204c5c9037 arch/x86/kernel/cpu/perf_event.c Peter Zijlstra         2010=
-12-08  267  			goto msr_fail;
a5ebe0ba3dff65 arch/x86/kernel/cpu/perf_event.c George Dunlap          2013=
-04-03  268  		if (val & ARCH_PERFMON_EVENTSEL_ENABLE) {
a5ebe0ba3dff65 arch/x86/kernel/cpu/perf_event.c George Dunlap          2013=
-04-03  269  			bios_fail =3D 1;
a5ebe0ba3dff65 arch/x86/kernel/cpu/perf_event.c George Dunlap          2013=
-04-03  270  			val_fail =3D val;
a5ebe0ba3dff65 arch/x86/kernel/cpu/perf_event.c George Dunlap          2013=
-04-03  271  			reg_fail =3D reg;
68ab747604da98 arch/x86/kernel/cpu/perf_event.c Don Zickus             2015=
-05-18  272  		} else {
68ab747604da98 arch/x86/kernel/cpu/perf_event.c Don Zickus             2015=
-05-18  273  			reg_safe =3D i;
a5ebe0ba3dff65 arch/x86/kernel/cpu/perf_event.c George Dunlap          2013=
-04-03  274  		}
4407204c5c9037 arch/x86/kernel/cpu/perf_event.c Peter Zijlstra         2010=
-12-08  275  	}
4407204c5c9037 arch/x86/kernel/cpu/perf_event.c Peter Zijlstra         2010=
-12-08  276  =

eac065f8ebdc04 arch/x86/events/core.c           Kan Liang              2021=
-04-12  277  	if (num_counters_fixed) {
4407204c5c9037 arch/x86/kernel/cpu/perf_event.c Peter Zijlstra         2010=
-12-08  278  		reg =3D MSR_ARCH_PERFMON_FIXED_CTR_CTRL;
4407204c5c9037 arch/x86/kernel/cpu/perf_event.c Peter Zijlstra         2010=
-12-08  279  		ret =3D rdmsrl_safe(reg, &val);
4407204c5c9037 arch/x86/kernel/cpu/perf_event.c Peter Zijlstra         2010=
-12-08  280  		if (ret)
4407204c5c9037 arch/x86/kernel/cpu/perf_event.c Peter Zijlstra         2010=
-12-08  281  			goto msr_fail;
eac065f8ebdc04 arch/x86/events/core.c           Kan Liang              2021=
-04-12  282  		for (i =3D 0; i < num_counters_fixed; i++) {
eac065f8ebdc04 arch/x86/events/core.c           Kan Liang              2021=
-04-12  283  			if (fixed_counter_disabled(i, pmu))
a6bffd585202c9 arch/x86/events/core.c           Kan Liang              2021=
-01-28  284  				continue;
a5ebe0ba3dff65 arch/x86/kernel/cpu/perf_event.c George Dunlap          2013=
-04-03  285  			if (val & (0x03 << i*4)) {
a5ebe0ba3dff65 arch/x86/kernel/cpu/perf_event.c George Dunlap          2013=
-04-03  286  				bios_fail =3D 1;
a5ebe0ba3dff65 arch/x86/kernel/cpu/perf_event.c George Dunlap          2013=
-04-03  287  				val_fail =3D val;
a5ebe0ba3dff65 arch/x86/kernel/cpu/perf_event.c George Dunlap          2013=
-04-03  288  				reg_fail =3D reg;
a5ebe0ba3dff65 arch/x86/kernel/cpu/perf_event.c George Dunlap          2013=
-04-03  289  			}
4407204c5c9037 arch/x86/kernel/cpu/perf_event.c Peter Zijlstra         2010=
-12-08  290  		}
4407204c5c9037 arch/x86/kernel/cpu/perf_event.c Peter Zijlstra         2010=
-12-08  291  	}
4407204c5c9037 arch/x86/kernel/cpu/perf_event.c Peter Zijlstra         2010=
-12-08  292  =

68ab747604da98 arch/x86/kernel/cpu/perf_event.c Don Zickus             2015=
-05-18  293  	/*
68ab747604da98 arch/x86/kernel/cpu/perf_event.c Don Zickus             2015=
-05-18  294  	 * If all the counters are enabled, the below test will always
68ab747604da98 arch/x86/kernel/cpu/perf_event.c Don Zickus             2015=
-05-18  295  	 * fail.  The tools will also become useless in this scenario.
68ab747604da98 arch/x86/kernel/cpu/perf_event.c Don Zickus             2015=
-05-18  296  	 * Just fail and disable the hardware counters.
68ab747604da98 arch/x86/kernel/cpu/perf_event.c Don Zickus             2015=
-05-18  297  	 */
68ab747604da98 arch/x86/kernel/cpu/perf_event.c Don Zickus             2015=
-05-18  298  =

68ab747604da98 arch/x86/kernel/cpu/perf_event.c Don Zickus             2015=
-05-18  299  	if (reg_safe =3D=3D -1) {
68ab747604da98 arch/x86/kernel/cpu/perf_event.c Don Zickus             2015=
-05-18  300  		reg =3D reg_safe;
68ab747604da98 arch/x86/kernel/cpu/perf_event.c Don Zickus             2015=
-05-18  301  		goto msr_fail;
68ab747604da98 arch/x86/kernel/cpu/perf_event.c Don Zickus             2015=
-05-18  302  	}
68ab747604da98 arch/x86/kernel/cpu/perf_event.c Don Zickus             2015=
-05-18  303  =

4407204c5c9037 arch/x86/kernel/cpu/perf_event.c Peter Zijlstra         2010=
-12-08  304  	/*
bffd5fc26043cc arch/x86/kernel/cpu/perf_event.c Andre Przywara         2012=
-10-09  305  	 * Read the current value, change it and read it back to see =
if it
bffd5fc26043cc arch/x86/kernel/cpu/perf_event.c Andre Przywara         2012=
-10-09  306  	 * matches, this is needed to detect certain hardware emulato=
rs
bffd5fc26043cc arch/x86/kernel/cpu/perf_event.c Andre Przywara         2012=
-10-09  307  	 * (qemu/kvm) that don't trap on the MSR access and always re=
turn 0s.
4407204c5c9037 arch/x86/kernel/cpu/perf_event.c Peter Zijlstra         2010=
-12-08  308  	 */
68ab747604da98 arch/x86/kernel/cpu/perf_event.c Don Zickus             2015=
-05-18  309  	reg =3D x86_pmu_event_addr(reg_safe);
bffd5fc26043cc arch/x86/kernel/cpu/perf_event.c Andre Przywara         2012=
-10-09  310  	if (rdmsrl_safe(reg, &val))
bffd5fc26043cc arch/x86/kernel/cpu/perf_event.c Andre Przywara         2012=
-10-09  311  		goto msr_fail;
bffd5fc26043cc arch/x86/kernel/cpu/perf_event.c Andre Przywara         2012=
-10-09  312  	val ^=3D 0xffffUL;
f285f92f7e4c9a arch/x86/kernel/cpu/perf_event.c Robert Richter         2012=
-06-20  313  	ret =3D wrmsrl_safe(reg, val);
f285f92f7e4c9a arch/x86/kernel/cpu/perf_event.c Robert Richter         2012=
-06-20  314  	ret |=3D rdmsrl_safe(reg, &val_new);
33c6d6a7ad0ffa arch/x86/kernel/cpu/perf_event.c Don Zickus             2010=
-11-22  315  	if (ret || val !=3D val_new)
4407204c5c9037 arch/x86/kernel/cpu/perf_event.c Peter Zijlstra         2010=
-12-08  316  		goto msr_fail;
33c6d6a7ad0ffa arch/x86/kernel/cpu/perf_event.c Don Zickus             2010=
-11-22  317  =

45daae575e08bb arch/x86/kernel/cpu/perf_event.c Ingo Molnar            2011=
-03-25  318  	/*
45daae575e08bb arch/x86/kernel/cpu/perf_event.c Ingo Molnar            2011=
-03-25  319  	 * We still allow the PMU driver to operate:
45daae575e08bb arch/x86/kernel/cpu/perf_event.c Ingo Molnar            2011=
-03-25  320  	 */
a5ebe0ba3dff65 arch/x86/kernel/cpu/perf_event.c George Dunlap          2013=
-04-03  321  	if (bios_fail) {
1b74dde7c47c19 arch/x86/kernel/cpu/perf_event.c Chen Yucong            2016=
-02-02  322  		pr_cont("Broken BIOS detected, complain to your hardware ven=
dor.\n");
1b74dde7c47c19 arch/x86/kernel/cpu/perf_event.c Chen Yucong            2016=
-02-02  323  		pr_err(FW_BUG "the BIOS has corrupted hw-PMU resources (MSR =
%x is %Lx)\n",
1b74dde7c47c19 arch/x86/kernel/cpu/perf_event.c Chen Yucong            2016=
-02-02  324  			      reg_fail, val_fail);
a5ebe0ba3dff65 arch/x86/kernel/cpu/perf_event.c George Dunlap          2013=
-04-03  325  	}
45daae575e08bb arch/x86/kernel/cpu/perf_event.c Ingo Molnar            2011=
-03-25  326  =

45daae575e08bb arch/x86/kernel/cpu/perf_event.c Ingo Molnar            2011=
-03-25  327  	return true;
4407204c5c9037 arch/x86/kernel/cpu/perf_event.c Peter Zijlstra         2010=
-12-08  328  =

4407204c5c9037 arch/x86/kernel/cpu/perf_event.c Peter Zijlstra         2010=
-12-08  329  msr_fail:
005bd0077a79c4 arch/x86/events/core.c           Juergen Gross          2016=
-08-01  330  	if (boot_cpu_has(X86_FEATURE_HYPERVISOR)) {
005bd0077a79c4 arch/x86/events/core.c           Juergen Gross          2016=
-08-01  331  		pr_cont("PMU not available due to virtualization, using soft=
ware events only.\n");
005bd0077a79c4 arch/x86/events/core.c           Juergen Gross          2016=
-08-01  332  	} else {
1b74dde7c47c19 arch/x86/kernel/cpu/perf_event.c Chen Yucong            2016=
-02-02  333  		pr_cont("Broken PMU hardware detected, using software events=
 only.\n");
005bd0077a79c4 arch/x86/events/core.c           Juergen Gross          2016=
-08-01 @334  		pr_err("Failed to access perfctr msr (MSR %x is %Lx)\n",
65d71fe1375b97 arch/x86/kernel/cpu/perf_event.c Peter Zijlstra (Intel  2014=
-10-07  335) 		       reg, val_new);
005bd0077a79c4 arch/x86/events/core.c           Juergen Gross          2016=
-08-01  336  	}
45daae575e08bb arch/x86/kernel/cpu/perf_event.c Ingo Molnar            2011=
-03-25  337  =

4407204c5c9037 arch/x86/kernel/cpu/perf_event.c Peter Zijlstra         2010=
-12-08  338  	return false;
33c6d6a7ad0ffa arch/x86/kernel/cpu/perf_event.c Don Zickus             2010=
-11-22  339  }
33c6d6a7ad0ffa arch/x86/kernel/cpu/perf_event.c Don Zickus             2010=
-11-22  340  =


:::::: The code@line 334 was first introduced by commit
:::::: 005bd0077a79c4bcfe64e7331b275e12f742093f perf/x86: Modify error mess=
age in virtualized environment

:::::: TO: Juergen Gross <jgross@suse.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5856680362016216947==--

