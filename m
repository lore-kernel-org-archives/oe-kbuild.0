Content-Type: multipart/mixed; boundary="===============3246988611650590852=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [rui:amd-pstate-dev-v5 6/22] drivers/cpufreq/amd-pstate.c:206 amd_get_max_freq() warn: should 'max_perf << 10' be a 64 bit type?
Date: Sat, 04 Dec 2021 00:40:16 +0800
Message-ID: <202112040034.407y1AmQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3246988611650590852==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Huang Rui <ray.huang@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rui/linux.git amd-p=
state-dev-v5
head:   33ee93463b3b2fe05043d5be31bfb12475d7b142
commit: 912ee85e7c162de04823c6b061d5a9a482556d91 [6/22] cpufreq: amd: intro=
duce a new amd pstate driver to support future processors
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-m001-20211202 (https://download.01.org/0day-ci/ar=
chive/20211204/202112040034.407y1AmQ-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/cpufreq/amd-pstate.c:206 amd_get_max_freq() warn: should 'max_perf =
<< 10' be a 64 bit type?
drivers/cpufreq/amd-pstate.c:243 amd_get_lowest_nonlinear_freq() warn: shou=
ld 'lowest_nonlinear_perf << 10' be a 64 bit type?

vim +206 drivers/cpufreq/amd-pstate.c

912ee85e7c162de Huang Rui 2021-06-10  191  =

912ee85e7c162de Huang Rui 2021-06-10  192  static int amd_get_max_freq(stru=
ct amd_cpudata *cpudata)
912ee85e7c162de Huang Rui 2021-06-10  193  {
912ee85e7c162de Huang Rui 2021-06-10  194  	struct cppc_perf_caps cppc_perf;
912ee85e7c162de Huang Rui 2021-06-10  195  	u32 max_perf, max_freq, nominal=
_freq, nominal_perf;
912ee85e7c162de Huang Rui 2021-06-10  196  	u64 boost_ratio;
912ee85e7c162de Huang Rui 2021-06-10  197  =

912ee85e7c162de Huang Rui 2021-06-10  198  	int ret =3D cppc_get_perf_caps(=
cpudata->cpu, &cppc_perf);
912ee85e7c162de Huang Rui 2021-06-10  199  	if (ret)
912ee85e7c162de Huang Rui 2021-06-10  200  		return ret;
912ee85e7c162de Huang Rui 2021-06-10  201  =

912ee85e7c162de Huang Rui 2021-06-10  202  	nominal_freq =3D cppc_perf.nomi=
nal_freq;
912ee85e7c162de Huang Rui 2021-06-10  203  	nominal_perf =3D READ_ONCE(cpud=
ata->nominal_perf);
912ee85e7c162de Huang Rui 2021-06-10  204  	max_perf =3D READ_ONCE(cpudata-=
>highest_perf);
912ee85e7c162de Huang Rui 2021-06-10  205  =

912ee85e7c162de Huang Rui 2021-06-10 @206  	boost_ratio =3D div_u64(max_per=
f << SCHED_CAPACITY_SHIFT,
912ee85e7c162de Huang Rui 2021-06-10  207  			      nominal_perf);
912ee85e7c162de Huang Rui 2021-06-10  208  =

912ee85e7c162de Huang Rui 2021-06-10  209  	max_freq =3D nominal_freq * boo=
st_ratio >> SCHED_CAPACITY_SHIFT;
912ee85e7c162de Huang Rui 2021-06-10  210  =

912ee85e7c162de Huang Rui 2021-06-10  211  	/* Switch to khz */
912ee85e7c162de Huang Rui 2021-06-10  212  	return max_freq * 1000;
912ee85e7c162de Huang Rui 2021-06-10  213  }
912ee85e7c162de Huang Rui 2021-06-10  214  =

912ee85e7c162de Huang Rui 2021-06-10  215  static int amd_get_nominal_freq(=
struct amd_cpudata *cpudata)
912ee85e7c162de Huang Rui 2021-06-10  216  {
912ee85e7c162de Huang Rui 2021-06-10  217  	struct cppc_perf_caps cppc_perf;
912ee85e7c162de Huang Rui 2021-06-10  218  =

912ee85e7c162de Huang Rui 2021-06-10  219  	int ret =3D cppc_get_perf_caps(=
cpudata->cpu, &cppc_perf);
912ee85e7c162de Huang Rui 2021-06-10  220  	if (ret)
912ee85e7c162de Huang Rui 2021-06-10  221  		return ret;
912ee85e7c162de Huang Rui 2021-06-10  222  =

912ee85e7c162de Huang Rui 2021-06-10  223  	/* Switch to khz */
912ee85e7c162de Huang Rui 2021-06-10  224  	return cppc_perf.nominal_freq *=
 1000;
912ee85e7c162de Huang Rui 2021-06-10  225  }
912ee85e7c162de Huang Rui 2021-06-10  226  =

912ee85e7c162de Huang Rui 2021-06-10  227  static int amd_get_lowest_nonlin=
ear_freq(struct amd_cpudata *cpudata)
912ee85e7c162de Huang Rui 2021-06-10  228  {
912ee85e7c162de Huang Rui 2021-06-10  229  	struct cppc_perf_caps cppc_perf;
912ee85e7c162de Huang Rui 2021-06-10  230  	u32 lowest_nonlinear_freq, lowe=
st_nonlinear_perf,
912ee85e7c162de Huang Rui 2021-06-10  231  	    nominal_freq, nominal_perf;
912ee85e7c162de Huang Rui 2021-06-10  232  	u64 lowest_nonlinear_ratio;
912ee85e7c162de Huang Rui 2021-06-10  233  =

912ee85e7c162de Huang Rui 2021-06-10  234  	int ret =3D cppc_get_perf_caps(=
cpudata->cpu, &cppc_perf);
912ee85e7c162de Huang Rui 2021-06-10  235  	if (ret)
912ee85e7c162de Huang Rui 2021-06-10  236  		return ret;
912ee85e7c162de Huang Rui 2021-06-10  237  =

912ee85e7c162de Huang Rui 2021-06-10  238  	nominal_freq =3D cppc_perf.nomi=
nal_freq;
912ee85e7c162de Huang Rui 2021-06-10  239  	nominal_perf =3D READ_ONCE(cpud=
ata->nominal_perf);
912ee85e7c162de Huang Rui 2021-06-10  240  =

912ee85e7c162de Huang Rui 2021-06-10  241  	lowest_nonlinear_perf =3D cppc_=
perf.lowest_nonlinear_perf;
912ee85e7c162de Huang Rui 2021-06-10  242  =

912ee85e7c162de Huang Rui 2021-06-10 @243  	lowest_nonlinear_ratio =3D div_=
u64(lowest_nonlinear_perf << SCHED_CAPACITY_SHIFT,
912ee85e7c162de Huang Rui 2021-06-10  244  					 nominal_perf);
912ee85e7c162de Huang Rui 2021-06-10  245  =

912ee85e7c162de Huang Rui 2021-06-10  246  	lowest_nonlinear_freq =3D nomin=
al_freq * lowest_nonlinear_ratio >> SCHED_CAPACITY_SHIFT;
912ee85e7c162de Huang Rui 2021-06-10  247  =

912ee85e7c162de Huang Rui 2021-06-10  248  	/* Switch to khz */
912ee85e7c162de Huang Rui 2021-06-10  249  	return lowest_nonlinear_freq * =
1000;
912ee85e7c162de Huang Rui 2021-06-10  250  }
912ee85e7c162de Huang Rui 2021-06-10  251  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3246988611650590852==--

