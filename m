Content-Type: multipart/mixed; boundary="===============5021390634687497187=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c:800:11: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
Date: Fri, 02 Apr 2021 16:27:50 +0800
Message-ID: <202104021641.METfpaHp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5021390634687497187==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Xiaojian Du <Xiaojian.Du@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Huang Rui <ray.huang@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1678e493d530e7977cce34e59a86bb86f3c5631e
commit: 307f049bfcad5dab909e9f9b9919e05f3aeeb074 drm/amd/pm: add the parame=
ters of power profiles for vangogh
date:   3 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 3 months ago
compiler: alpha-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


vim +800 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c

d0e4e112a9461a Xiaojian Du 2020-12-24  772  =

307f049bfcad5d Xiaojian Du 2021-01-07  773  static int vangogh_get_power_pr=
ofile_mode(struct smu_context *smu,
307f049bfcad5d Xiaojian Du 2021-01-07  774  					   char *buf)
307f049bfcad5d Xiaojian Du 2021-01-07  775  {
307f049bfcad5d Xiaojian Du 2021-01-07  776  	static const char *profile_nam=
e[] =3D {
307f049bfcad5d Xiaojian Du 2021-01-07  777  					"FULL_SCREEN_3D",
307f049bfcad5d Xiaojian Du 2021-01-07  778  					"VIDEO",
307f049bfcad5d Xiaojian Du 2021-01-07  779  					"VR",
307f049bfcad5d Xiaojian Du 2021-01-07  780  					"COMPUTE",
307f049bfcad5d Xiaojian Du 2021-01-07  781  					"CUSTOM"};
307f049bfcad5d Xiaojian Du 2021-01-07  782  	uint32_t i, size =3D 0;
307f049bfcad5d Xiaojian Du 2021-01-07  783  	int16_t workload_type =3D 0;
307f049bfcad5d Xiaojian Du 2021-01-07  784  =

307f049bfcad5d Xiaojian Du 2021-01-07  785  	if (!buf)
307f049bfcad5d Xiaojian Du 2021-01-07  786  		return -EINVAL;
307f049bfcad5d Xiaojian Du 2021-01-07  787  =

307f049bfcad5d Xiaojian Du 2021-01-07  788  	for (i =3D 0; i <=3D PP_SMC_PO=
WER_PROFILE_CUSTOM; i++) {
307f049bfcad5d Xiaojian Du 2021-01-07  789  		/*
307f049bfcad5d Xiaojian Du 2021-01-07  790  		 * Conv PP_SMC_POWER_PROFILE*=
 to WORKLOAD_PPLIB_*_BIT
307f049bfcad5d Xiaojian Du 2021-01-07  791  		 * Not all profile modes are =
supported on vangogh.
307f049bfcad5d Xiaojian Du 2021-01-07  792  		 */
307f049bfcad5d Xiaojian Du 2021-01-07  793  		workload_type =3D smu_cmn_to_=
asic_specific_index(smu,
307f049bfcad5d Xiaojian Du 2021-01-07  794  							       CMN2ASIC_MAPPING_=
WORKLOAD,
307f049bfcad5d Xiaojian Du 2021-01-07  795  							       i);
307f049bfcad5d Xiaojian Du 2021-01-07  796  =

307f049bfcad5d Xiaojian Du 2021-01-07  797  		if (workload_type < 0)
307f049bfcad5d Xiaojian Du 2021-01-07  798  			continue;
307f049bfcad5d Xiaojian Du 2021-01-07  799  =

307f049bfcad5d Xiaojian Du 2021-01-07 @800  		size +=3D sprintf(buf + size,=
 "%2d %14s%s\n",
307f049bfcad5d Xiaojian Du 2021-01-07  801  			i, profile_name[i], (i =3D=
=3D smu->power_profile_mode) ? "*" : " ");
307f049bfcad5d Xiaojian Du 2021-01-07  802  	}
307f049bfcad5d Xiaojian Du 2021-01-07  803  =

307f049bfcad5d Xiaojian Du 2021-01-07  804  	return size;
307f049bfcad5d Xiaojian Du 2021-01-07  805  }
307f049bfcad5d Xiaojian Du 2021-01-07  806  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5021390634687497187==--

