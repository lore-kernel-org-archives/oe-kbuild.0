Content-Type: multipart/mixed; boundary="===============6360781906450742828=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c:428:11: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
Date: Thu, 20 Jan 2022 21:41:34 +0800
Message-ID: <202201202007.oEfosBrh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6360781906450742828==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Dennis Li <Dennis.Li@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Hawking Zhang <Hawking.Zhang@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1d1df41c5a33359a00e919d54eaebfb789711fdc
commit: 0e0036c7d13b945260ff1ce8377eca7ea877c008 drm/amdgpu: fix no full co=
verage issue for gprs initialization
date:   9 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 9 months ago
compiler: sparc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/message/fusion/mptbase.c:2888:3: warning: Variable 'i' is modifi=
ed but its new value is never used. [unreadVariable]
     i++;
     ^
>> drivers/message/fusion/mptctl.c:1204:3: warning: Variable 'n' is modifie=
d but its new value is never used. [unreadVariable]
     n++;
     ^
>> drivers/scsi/pm8001/pm80xx_hwi.c:4843:58: warning: Same expression on bo=
th sides of '&'. [knownConditionTrueFalse]
    payload.dtype_dlr_mcn_ir_retry =3D cpu_to_le32((retryFlag & 0x01) |
                                                            ^
   drivers/scsi/pm8001/pm80xx_hwi.c:4803:17: note: 'retryFlag' is assigned =
value '1' here.
    u8 retryFlag =3D 0x1;
                   ^
   drivers/scsi/pm8001/pm80xx_hwi.c:4843:58: note: Same expression on both =
sides of '&'.
    payload.dtype_dlr_mcn_ir_retry =3D cpu_to_le32((retryFlag & 0x01) |
                                                            ^

vim +428 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c

0e0036c7d13b94 Dennis Li 2021-04-27  411  =

0e0036c7d13b94 Dennis Li 2021-04-27  412  static void gfx_v9_4_2_log_wave_a=
ssignment(struct amdgpu_device *adev, uint32_t *wb_ptr)
0e0036c7d13b94 Dennis Li 2021-04-27  413  {
0e0036c7d13b94 Dennis Li 2021-04-27  414  	uint32_t se, cu, simd, wave;
0e0036c7d13b94 Dennis Li 2021-04-27  415  	uint32_t offset =3D 0;
0e0036c7d13b94 Dennis Li 2021-04-27  416  	char *str;
0e0036c7d13b94 Dennis Li 2021-04-27  417  	int size;
0e0036c7d13b94 Dennis Li 2021-04-27  418  =

0e0036c7d13b94 Dennis Li 2021-04-27  419  	str =3D kmalloc(256, GFP_KERNEL);
0e0036c7d13b94 Dennis Li 2021-04-27  420  	if (!str)
0e0036c7d13b94 Dennis Li 2021-04-27  421  		return;
0e0036c7d13b94 Dennis Li 2021-04-27  422  =

0e0036c7d13b94 Dennis Li 2021-04-27  423  	dev_dbg(adev->dev, "wave assignm=
ent:\n");
0e0036c7d13b94 Dennis Li 2021-04-27  424  =

0e0036c7d13b94 Dennis Li 2021-04-27  425  	for (se =3D 0; se < adev->gfx.co=
nfig.max_shader_engines; se++) {
0e0036c7d13b94 Dennis Li 2021-04-27  426  		for (cu =3D 0; cu < CU_ID_MAX; =
cu++) {
0e0036c7d13b94 Dennis Li 2021-04-27  427  			memset(str, 0, 256);
0e0036c7d13b94 Dennis Li 2021-04-27 @428  			size =3D sprintf(str, "SE[%02d=
]CU[%02d]: ", se, cu);
0e0036c7d13b94 Dennis Li 2021-04-27  429  			for (simd =3D 0; simd < SIMD_I=
D_MAX; simd++) {
0e0036c7d13b94 Dennis Li 2021-04-27  430  				size +=3D sprintf(str + size,=
 "[");
0e0036c7d13b94 Dennis Li 2021-04-27  431  				for (wave =3D 0; wave < WAVE_=
ID_MAX; wave++) {
0e0036c7d13b94 Dennis Li 2021-04-27  432  					size +=3D sprintf(str + size=
, "%x", wb_ptr[offset]);
0e0036c7d13b94 Dennis Li 2021-04-27  433  					offset++;
0e0036c7d13b94 Dennis Li 2021-04-27  434  				}
0e0036c7d13b94 Dennis Li 2021-04-27  435  				size +=3D sprintf(str + size,=
 "]  ");
0e0036c7d13b94 Dennis Li 2021-04-27  436  			}
0e0036c7d13b94 Dennis Li 2021-04-27  437  			dev_dbg(adev->dev, "%s\n", str=
);
0e0036c7d13b94 Dennis Li 2021-04-27  438  		}
0e0036c7d13b94 Dennis Li 2021-04-27  439  	}
0e0036c7d13b94 Dennis Li 2021-04-27  440  =

0e0036c7d13b94 Dennis Li 2021-04-27  441  	kfree(str);
0e0036c7d13b94 Dennis Li 2021-04-27  442  }
0e0036c7d13b94 Dennis Li 2021-04-27  443  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6360781906450742828==--

