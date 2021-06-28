Content-Type: multipart/mixed; boundary="===============8076665790046199559=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 6379/13831] drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c:503:11: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
Date: Tue, 29 Jun 2021 02:54:57 +0800
Message-ID: <202106290253.6WHEa0Tm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8076665790046199559==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Xiaomeng Hou <Xiaomeng.Hou@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Huang Rui <ray.huang@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   3579aa488520feeda433ceca23ef4704bf8cd280
commit: bd8dcea93a7d45a3366b5f3e6c341a677ff90acf [6379/13831] drm/amd/pm: a=
dd callbacks to read/write sysfs file pp_power_profile_mode
:::::: branch date: 8 hours ago
:::::: commit date: 3 weeks ago
compiler: ia64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


vim +503 drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c

4cea0fc9816add Xiaomeng Hou 2021-02-09  473  =

bd8dcea93a7d45 Xiaomeng Hou 2021-03-29  474  static int yellow_carp_get_pow=
er_profile_mode(struct smu_context *smu,
bd8dcea93a7d45 Xiaomeng Hou 2021-03-29  475  						char *buf)
bd8dcea93a7d45 Xiaomeng Hou 2021-03-29  476  {
bd8dcea93a7d45 Xiaomeng Hou 2021-03-29  477  	static const char *profile_na=
me[] =3D {
bd8dcea93a7d45 Xiaomeng Hou 2021-03-29  478  					"BOOTUP_DEFAULT",
bd8dcea93a7d45 Xiaomeng Hou 2021-03-29  479  					"3D_FULL_SCREEN",
bd8dcea93a7d45 Xiaomeng Hou 2021-03-29  480  					"POWER_SAVING",
bd8dcea93a7d45 Xiaomeng Hou 2021-03-29  481  					"VIDEO",
bd8dcea93a7d45 Xiaomeng Hou 2021-03-29  482  					"VR",
bd8dcea93a7d45 Xiaomeng Hou 2021-03-29  483  					"COMPUTE",
bd8dcea93a7d45 Xiaomeng Hou 2021-03-29  484  					"CUSTOM"};
bd8dcea93a7d45 Xiaomeng Hou 2021-03-29  485  	uint32_t i, size =3D 0;
bd8dcea93a7d45 Xiaomeng Hou 2021-03-29  486  	int16_t workload_type =3D 0;
bd8dcea93a7d45 Xiaomeng Hou 2021-03-29  487  =

bd8dcea93a7d45 Xiaomeng Hou 2021-03-29  488  	if (!buf)
bd8dcea93a7d45 Xiaomeng Hou 2021-03-29  489  		return -EINVAL;
bd8dcea93a7d45 Xiaomeng Hou 2021-03-29  490  =

bd8dcea93a7d45 Xiaomeng Hou 2021-03-29  491  	for (i =3D 0; i <=3D PP_SMC_P=
OWER_PROFILE_CUSTOM; i++) {
bd8dcea93a7d45 Xiaomeng Hou 2021-03-29  492  		/*
bd8dcea93a7d45 Xiaomeng Hou 2021-03-29  493  		 * Conv PP_SMC_POWER_PROFILE=
* to WORKLOAD_PPLIB_*_BIT.
bd8dcea93a7d45 Xiaomeng Hou 2021-03-29  494  		 * Not all profile modes are=
 supported on yellow carp.
bd8dcea93a7d45 Xiaomeng Hou 2021-03-29  495  		 */
bd8dcea93a7d45 Xiaomeng Hou 2021-03-29  496  		workload_type =3D smu_cmn_to=
_asic_specific_index(smu,
bd8dcea93a7d45 Xiaomeng Hou 2021-03-29  497  							       CMN2ASIC_MAPPING=
_WORKLOAD,
bd8dcea93a7d45 Xiaomeng Hou 2021-03-29  498  							       i);
bd8dcea93a7d45 Xiaomeng Hou 2021-03-29  499  =

bd8dcea93a7d45 Xiaomeng Hou 2021-03-29  500  		if (workload_type < 0)
bd8dcea93a7d45 Xiaomeng Hou 2021-03-29  501  			continue;
bd8dcea93a7d45 Xiaomeng Hou 2021-03-29  502  =

bd8dcea93a7d45 Xiaomeng Hou 2021-03-29 @503  		size +=3D sprintf(buf + size=
, "%2d %14s%s\n",
bd8dcea93a7d45 Xiaomeng Hou 2021-03-29  504  			i, profile_name[i], (i =3D=
=3D smu->power_profile_mode) ? "*" : " ");
bd8dcea93a7d45 Xiaomeng Hou 2021-03-29  505  	}
bd8dcea93a7d45 Xiaomeng Hou 2021-03-29  506  =

bd8dcea93a7d45 Xiaomeng Hou 2021-03-29  507  	return size;
bd8dcea93a7d45 Xiaomeng Hou 2021-03-29  508  }
bd8dcea93a7d45 Xiaomeng Hou 2021-03-29  509  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8076665790046199559==--

