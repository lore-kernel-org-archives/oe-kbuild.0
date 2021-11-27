Content-Type: multipart/mixed; boundary="===============8152886337199543632=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c:1562:12: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
Date: Sun, 28 Nov 2021 03:57:03 +0800
Message-ID: <202111280321.KwoBDEw9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8152886337199543632==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c5c17547b778975b3d83a73c8d84e8fb5ecf3ba5
commit: d5c7255dc7ff6e1239d794b9c53029d83ced04ca drm/amdgpu/pm: fix powerpl=
ay OD interface
date:   3 days ago
:::::: branch date: 23 hours ago
:::::: commit date: 3 days ago
compiler: sparc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
   In file included from drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/s=
mu8_hwmgr.c:
>> drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c:1562:12: warning: %d=
 in format string (no. 1) requires 'int' but the argument type is 'unsigned=
 int'. [invalidPrintfArgType_sint]
      size +=3D sprintf(buf + size, "%d: %uMhz %sn",
              ^
   drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c:1574:12: warning: %d=
 in format string (no. 1) requires 'int' but the argument type is 'unsigned=
 int'. [invalidPrintfArgType_sint]
      size +=3D sprintf(buf + size, "%d: %uMhz %sn",
              ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/s=
mu8_hwmgr.c:
>> drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c:1562:12: warning: %d=
 in format string (no. 1) requires 'int' but the argument type is 'unsigned=
 int'. [invalidPrintfArgType_sint]
      size +=3D sprintf(buf + size, "%d: %uMhz %sn",
              ^
   drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c:1574:12: warning: %d=
 in format string (no. 1) requires 'int' but the argument type is 'unsigned=
 int'. [invalidPrintfArgType_sint]
      size +=3D sprintf(buf + size, "%d: %uMhz %sn",
              ^
>> drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c:2931:0: warning: S=
yntax error in #if [preprocessorErrorDirective]
   #if 0
   ^
--
   In file included from drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/v=
ega20_hwmgr.c:

vim +1562 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c

d7341ef66870fc drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c      Eric Hua=
ng    2016-01-22  1543  =

47ce4a9f84d783 drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c      Rex Zhu =
      2018-03-14  1544  static int smu8_print_clock_levels(struct pp_hwmgr =
*hwmgr,
d7341ef66870fc drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c      Eric Hua=
ng    2016-01-22  1545  		enum pp_clock_type type, char *buf)
d7341ef66870fc drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c      Eric Hua=
ng    2016-01-22  1546  {
47ce4a9f84d783 drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c      Rex Zhu =
      2018-03-14  1547  	struct smu8_hwmgr *data =3D hwmgr->backend;
d7341ef66870fc drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c      Eric Hua=
ng    2016-01-22  1548  	struct phm_clock_voltage_dependency_table *sclk_ta=
ble =3D
d7341ef66870fc drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c      Eric Hua=
ng    2016-01-22  1549  			hwmgr->dyn_state.vddc_dependency_on_sclk;
6db0c87a0a8ee1 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c Darren P=
owell 2021-07-17  1550  	uint32_t i, now;
6db0c87a0a8ee1 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c Darren P=
owell 2021-07-17  1551  	int size =3D 0;
d7341ef66870fc drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c      Eric Hua=
ng    2016-01-22  1552  =

d7341ef66870fc drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c      Eric Hua=
ng    2016-01-22  1553  	switch (type) {
d7341ef66870fc drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c      Eric Hua=
ng    2016-01-22  1554  	case PP_SCLK:
d7341ef66870fc drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c      Eric Hua=
ng    2016-01-22  1555  		now =3D PHM_GET_FIELD(cgs_read_ind_register(hwmgr=
->device,
d7341ef66870fc drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c      Eric Hua=
ng    2016-01-22  1556  				CGS_IND_REG__SMC,
d7341ef66870fc drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c      Eric Hua=
ng    2016-01-22  1557  				ixTARGET_AND_CURRENT_PROFILE_INDEX),
d7341ef66870fc drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c      Eric Hua=
ng    2016-01-22  1558  				TARGET_AND_CURRENT_PROFILE_INDEX,
d7341ef66870fc drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c      Eric Hua=
ng    2016-01-22  1559  				CURR_SCLK_INDEX);
d7341ef66870fc drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c      Eric Hua=
ng    2016-01-22  1560  =

d7341ef66870fc drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c      Eric Hua=
ng    2016-01-22  1561  		for (i =3D 0; i < sclk_table->count; i++)
d5c7255dc7ff6e drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c Alex Deu=
cher  2021-11-23 @1562  			size +=3D sprintf(buf + size, "%d: %uMhz %s\n",
d7341ef66870fc drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c      Eric Hua=
ng    2016-01-22  1563  					i, sclk_table->entries[i].clk / 100,
d7341ef66870fc drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c      Eric Hua=
ng    2016-01-22  1564  					(i =3D=3D now) ? "*" : "");
d7341ef66870fc drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c      Eric Hua=
ng    2016-01-22  1565  		break;
039fdc94c15a52 drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c      Rex Zhu =
      2018-01-08  1566  	case PP_MCLK:
039fdc94c15a52 drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c      Rex Zhu =
      2018-01-08  1567  		now =3D PHM_GET_FIELD(cgs_read_ind_register(hwmgr=
->device,
039fdc94c15a52 drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c      Rex Zhu =
      2018-01-08  1568  				CGS_IND_REG__SMC,
039fdc94c15a52 drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c      Rex Zhu =
      2018-01-08  1569  				ixTARGET_AND_CURRENT_PROFILE_INDEX),
039fdc94c15a52 drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c      Rex Zhu =
      2018-01-08  1570  				TARGET_AND_CURRENT_PROFILE_INDEX,
039fdc94c15a52 drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c      Rex Zhu =
      2018-01-08  1571  				CURR_MCLK_INDEX);
039fdc94c15a52 drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c      Rex Zhu =
      2018-01-08  1572  =

47ce4a9f84d783 drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c      Rex Zhu =
      2018-03-14  1573  		for (i =3D SMU8_NUM_NBPMEMORYCLOCK; i > 0; i--)
d5c7255dc7ff6e drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c Alex Deu=
cher  2021-11-23  1574  			size +=3D sprintf(buf + size, "%d: %uMhz %s\n",
47ce4a9f84d783 drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c      Rex Zhu =
      2018-03-14  1575  					SMU8_NUM_NBPMEMORYCLOCK-i, data->sys_info.nbp_=
memory_clock[i-1] / 100,
47ce4a9f84d783 drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c      Rex Zhu =
      2018-03-14  1576  					(SMU8_NUM_NBPMEMORYCLOCK-i =3D=3D now) ? "*" :=
 "");
039fdc94c15a52 drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c      Rex Zhu =
      2018-01-08  1577  		break;
d7341ef66870fc drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c      Eric Hua=
ng    2016-01-22  1578  	default:
d7341ef66870fc drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c      Eric Hua=
ng    2016-01-22  1579  		break;
d7341ef66870fc drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c      Eric Hua=
ng    2016-01-22  1580  	}
d7341ef66870fc drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c      Eric Hua=
ng    2016-01-22  1581  	return size;
d7341ef66870fc drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c      Eric Hua=
ng    2016-01-22  1582  }
d7341ef66870fc drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c      Eric Hua=
ng    2016-01-22  1583  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8152886337199543632==--

