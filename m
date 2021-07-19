Content-Type: multipart/mixed; boundary="===============3838720559543122248=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c:503:11: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
Date: Mon, 19 Jul 2021 11:42:28 +0800
Message-ID: <202107191125.de9s3IPs-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3838720559543122248==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Xiaomeng Hou <Xiaomeng.Hou@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Huang Rui <ray.huang@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2734d6c1b1a089fb593ef6a23d4b70903526fe0c
commit: bd8dcea93a7d45a3366b5f3e6c341a677ff90acf drm/amd/pm: add callbacks =
to read/write sysfs file pp_power_profile_mode
date:   6 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 weeks ago
compiler: ia64-linux-gcc (GCC) 10.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
   In file included from drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/yello=
w_carp_ppt.c:
>> drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c:503:11: warning: %d=
 in format string (no. 1) requires 'int' but the argument type is 'unsigned=
 int'. [invalidPrintfArgType_sint]
     size +=3D sprintf(buf + size, "%2d %14s%sn",
             ^

vim +503 drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c

4cea0fc9816add7 Xiaomeng Hou 2021-02-09  473  =

bd8dcea93a7d45a Xiaomeng Hou 2021-03-29  474  static int yellow_carp_get_po=
wer_profile_mode(struct smu_context *smu,
bd8dcea93a7d45a Xiaomeng Hou 2021-03-29  475  						char *buf)
bd8dcea93a7d45a Xiaomeng Hou 2021-03-29  476  {
bd8dcea93a7d45a Xiaomeng Hou 2021-03-29  477  	static const char *profile_n=
ame[] =3D {
bd8dcea93a7d45a Xiaomeng Hou 2021-03-29  478  					"BOOTUP_DEFAULT",
bd8dcea93a7d45a Xiaomeng Hou 2021-03-29  479  					"3D_FULL_SCREEN",
bd8dcea93a7d45a Xiaomeng Hou 2021-03-29  480  					"POWER_SAVING",
bd8dcea93a7d45a Xiaomeng Hou 2021-03-29  481  					"VIDEO",
bd8dcea93a7d45a Xiaomeng Hou 2021-03-29  482  					"VR",
bd8dcea93a7d45a Xiaomeng Hou 2021-03-29  483  					"COMPUTE",
bd8dcea93a7d45a Xiaomeng Hou 2021-03-29  484  					"CUSTOM"};
bd8dcea93a7d45a Xiaomeng Hou 2021-03-29  485  	uint32_t i, size =3D 0;
bd8dcea93a7d45a Xiaomeng Hou 2021-03-29  486  	int16_t workload_type =3D 0;
bd8dcea93a7d45a Xiaomeng Hou 2021-03-29  487  =

bd8dcea93a7d45a Xiaomeng Hou 2021-03-29  488  	if (!buf)
bd8dcea93a7d45a Xiaomeng Hou 2021-03-29  489  		return -EINVAL;
bd8dcea93a7d45a Xiaomeng Hou 2021-03-29  490  =

bd8dcea93a7d45a Xiaomeng Hou 2021-03-29  491  	for (i =3D 0; i <=3D PP_SMC_=
POWER_PROFILE_CUSTOM; i++) {
bd8dcea93a7d45a Xiaomeng Hou 2021-03-29  492  		/*
bd8dcea93a7d45a Xiaomeng Hou 2021-03-29  493  		 * Conv PP_SMC_POWER_PROFIL=
E* to WORKLOAD_PPLIB_*_BIT.
bd8dcea93a7d45a Xiaomeng Hou 2021-03-29  494  		 * Not all profile modes ar=
e supported on yellow carp.
bd8dcea93a7d45a Xiaomeng Hou 2021-03-29  495  		 */
bd8dcea93a7d45a Xiaomeng Hou 2021-03-29  496  		workload_type =3D smu_cmn_t=
o_asic_specific_index(smu,
bd8dcea93a7d45a Xiaomeng Hou 2021-03-29  497  							       CMN2ASIC_MAPPIN=
G_WORKLOAD,
bd8dcea93a7d45a Xiaomeng Hou 2021-03-29  498  							       i);
bd8dcea93a7d45a Xiaomeng Hou 2021-03-29  499  =

bd8dcea93a7d45a Xiaomeng Hou 2021-03-29  500  		if (workload_type < 0)
bd8dcea93a7d45a Xiaomeng Hou 2021-03-29  501  			continue;
bd8dcea93a7d45a Xiaomeng Hou 2021-03-29  502  =

bd8dcea93a7d45a Xiaomeng Hou 2021-03-29 @503  		size +=3D sprintf(buf + siz=
e, "%2d %14s%s\n",
bd8dcea93a7d45a Xiaomeng Hou 2021-03-29  504  			i, profile_name[i], (i =3D=
=3D smu->power_profile_mode) ? "*" : " ");
bd8dcea93a7d45a Xiaomeng Hou 2021-03-29  505  	}
bd8dcea93a7d45a Xiaomeng Hou 2021-03-29  506  =

bd8dcea93a7d45a Xiaomeng Hou 2021-03-29  507  	return size;
bd8dcea93a7d45a Xiaomeng Hou 2021-03-29  508  }
bd8dcea93a7d45a Xiaomeng Hou 2021-03-29  509  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3838720559543122248==--

