Content-Type: multipart/mixed; boundary="===============2031625263709448129=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c:1053:12: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
Date: Tue, 19 Apr 2022 10:13:25 +0800
Message-ID: <202204191037.9JDSPIGa-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2031625263709448129==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b2d229d4ddb17db541098b83524d901257e93845
commit: d5c7255dc7ff6e1239d794b9c53029d83ced04ca drm/amdgpu/pm: fix powerpl=
ay OD interface
date:   5 months ago
:::::: branch date: 29 hours ago
:::::: commit date: 5 months ago
compiler: alpha-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout d5c7255dc7ff6e1239d794b9c53029d83ced04ca
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> drivers/gpu/ipu-v3/ipu-di.c:460:13: warning: Local variable 'div' shadow=
s outer variable [shadowVariable]
      unsigned div;
               ^
   drivers/gpu/ipu-v3/ipu-di.c:441:12: note: Shadowed declaration
     unsigned div, error;
              ^
   drivers/gpu/ipu-v3/ipu-di.c:460:13: note: Shadow variable
      unsigned div;
               ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/i2c/i2c-dev.c:59:16: warning: Uninitialized variable: i2c_dev->a=
dap [uninitvar]
     if (i2c_dev->adap->nr =3D=3D index)
                  ^
--
   drivers/gpu/ipu-v3/ipu-prv.h:146:25: warning: Shifting signed 32-bit val=
ue by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
    IPU_CONF_CSI_SEL  =3D (1 << 31),
                           ^
   drivers/gpu/ipu-v3/ipu-prv.h:146:25: warning: Signed integer overflow fo=
r expression '1<<31'. [integerOverflow]
    IPU_CONF_CSI_SEL  =3D (1 << 31),
                           ^
>> drivers/gpu/ipu-v3/ipu-di.c:196:19: warning: Signed integer overflow for=
 expression '0xffff<<(16*((wave_gen-1)&0x1))'. [integerOverflow]
     reg &=3D ~(0xffff << (16 * ((wave_gen - 1) & 0x1)));
                     ^
--
>> drivers/mmc/core/mmc_test.c:1487:6: warning: The if condition is the sam=
e as the previous if condition [duplicateCondition]
    if (timed)
        ^
   drivers/mmc/core/mmc_test.c:1484:6: note: First condition
    if (timed)
        ^
   drivers/mmc/core/mmc_test.c:1487:6: note: Second condition
    if (timed)
        ^
>> drivers/mmc/core/mmc_test.c:3026:51: warning: Parameter 'card' can be de=
clared with const [constParameter]
   static void mmc_test_free_result(struct mmc_card *card)
                                                     ^
   drivers/mmc/core/mmc_test.c:3159:55: warning: Parameter 'card' can be de=
clared with const [constParameter]
   static void mmc_test_free_dbgfs_file(struct mmc_card *card)
                                                         ^
>> drivers/mmc/core/mmc_test.c:3035:19: warning: Uninitialized variable: gr=
->card [uninitvar]
     if (card && gr->card !=3D card)
                     ^
   drivers/mmc/core/mmc_test.c:3062:11: warning: Uninitialized variable: gr=
->card [uninitvar]
     if (gr->card !=3D card)
             ^
>> drivers/mmc/core/mmc_test.c:3071:19: warning: Uninitialized variable: tr=
->iops [uninitvar]
       tr->rate, tr->iops / 100, tr->iops % 100);
                     ^
   drivers/mmc/core/mmc_test.c:3062:16: note: Assuming condition is false
     if (gr->card !=3D card)
                  ^
   drivers/mmc/core/mmc_test.c:3071:19: note: Uninitialized variable: tr->i=
ops
       tr->rate, tr->iops / 100, tr->iops % 100);
                     ^
>> drivers/mmc/core/mmc_test.c:3166:19: warning: Uninitialized variable: df=
->card [uninitvar]
     if (card && df->card !=3D card)
                     ^
--
   In file included from drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/s=
mu10_hwmgr.c:
>> drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c:1053:12: warning: %=
d in format string (no. 1) requires 'int' but the argument type is 'unsigne=
d int'. [invalidPrintfArgType_sint]
      size +=3D sprintf(buf + size, "%d: %uMhz %sn",
              ^

vim +1053 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c

a960d61cbd6254 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Rex Zhu=
      2017-05-11  1016  =

c425688520990d drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c    Rex Zhu=
      2018-03-06  1017  static int smu10_print_clock_levels(struct pp_hwmgr=
 *hwmgr,
a960d61cbd6254 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Rex Zhu=
      2017-05-11  1018  		enum pp_clock_type type, char *buf)
a960d61cbd6254 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Rex Zhu=
      2017-05-11  1019  {
c425688520990d drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c    Rex Zhu=
      2018-03-06  1020  	struct smu10_hwmgr *data =3D (struct smu10_hwmgr *=
)(hwmgr->backend);
c425688520990d drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c    Rex Zhu=
      2018-03-06  1021  	struct smu10_voltage_dependency_table *mclk_table =
=3D
5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an    2017-09-26  1022  			data->clock_vol_info.vdd_dep_on_fclk;
21c77de3566115 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c    Rex Zhu=
      2018-04-20  1023  	uint32_t i, now, size =3D 0;
37f5d8b777a9a5 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du  2020-12-18  1024  	uint32_t min_freq, max_freq =3D 0;
37f5d8b777a9a5 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du  2020-12-18  1025  	uint32_t ret =3D 0;
5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an    2017-09-26  1026  =

5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an    2017-09-26  1027  	switch (type) {
5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an    2017-09-26  1028  	case PP_SCLK:
a0ec225633d9f6 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c    Evan Qu=
an    2020-03-27  1029  		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetGfxclkFr=
equency, &now);
5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an    2017-09-26  1030  =

21c77de3566115 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c    Rex Zhu=
      2018-04-20  1031  	/* driver only know min/max gfx_clk, Add level 1 f=
or all other gfx clks */
21c77de3566115 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c    Rex Zhu=
      2018-04-20  1032  		if (now =3D=3D data->gfx_max_freq_limit/100)
21c77de3566115 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c    Rex Zhu=
      2018-04-20  1033  			i =3D 2;
21c77de3566115 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c    Rex Zhu=
      2018-04-20  1034  		else if (now =3D=3D data->gfx_min_freq_limit/100)
21c77de3566115 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c    Rex Zhu=
      2018-04-20  1035  			i =3D 0;
21c77de3566115 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c    Rex Zhu=
      2018-04-20  1036  		else
21c77de3566115 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c    Rex Zhu=
      2018-04-20  1037  			i =3D 1;
21c77de3566115 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c    Rex Zhu=
      2018-04-20  1038  =

d5c7255dc7ff6e drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Alex De=
ucher 2021-11-23  1039  		size +=3D sprintf(buf + size, "0: %uMhz %s\n",
5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an    2017-09-26  1040  					data->gfx_min_freq_limit/100,
21c77de3566115 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c    Rex Zhu=
      2018-04-20  1041  					i =3D=3D 0 ? "*" : "");
d5c7255dc7ff6e drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Alex De=
ucher 2021-11-23  1042  		size +=3D sprintf(buf + size, "1: %uMhz %s\n",
21c77de3566115 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c    Rex Zhu=
      2018-04-20  1043  					i =3D=3D 1 ? now : SMU10_UMD_PSTATE_GFXCLK,
21c77de3566115 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c    Rex Zhu=
      2018-04-20  1044  					i =3D=3D 1 ? "*" : "");
d5c7255dc7ff6e drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Alex De=
ucher 2021-11-23  1045  		size +=3D sprintf(buf + size, "2: %uMhz %s\n",
5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an    2017-09-26  1046  					data->gfx_max_freq_limit/100,
21c77de3566115 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c    Rex Zhu=
      2018-04-20  1047  					i =3D=3D 2 ? "*" : "");
5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an    2017-09-26  1048  		break;
5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an    2017-09-26  1049  	case PP_MCLK:
a0ec225633d9f6 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c    Evan Qu=
an    2020-03-27  1050  		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetFclkFreq=
uency, &now);
5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an    2017-09-26  1051  =

5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an    2017-09-26  1052  		for (i =3D 0; i < mclk_table->count; i++)
d5c7255dc7ff6e drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Alex De=
ucher 2021-11-23 @1053  			size +=3D sprintf(buf + size, "%d: %uMhz %s\n",
5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an    2017-09-26  1054  					i,
5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an    2017-09-26  1055  					mclk_table->entries[i].clk / 100,
5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an    2017-09-26  1056  					((mclk_table->entries[i].clk / 100)
5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an    2017-09-26  1057  					 =3D=3D now) ? "*" : "");
5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an    2017-09-26  1058  		break;
12a6727dee5d11 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du  2020-09-27  1059  	case OD_SCLK:
12a6727dee5d11 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du  2020-09-27  1060  		if (hwmgr->od_enabled) {
37f5d8b777a9a5 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du  2020-12-18  1061  			ret =3D smum_send_msg_to_smc(hwmgr, PPSMC_MSG_Ge=
tMinGfxclkFrequency, &min_freq);
37f5d8b777a9a5 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du  2020-12-18  1062  			if (ret)
37f5d8b777a9a5 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du  2020-12-18  1063  				return ret;
37f5d8b777a9a5 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du  2020-12-18  1064  			ret =3D smum_send_msg_to_smc(hwmgr, PPSMC_MSG_Ge=
tMaxGfxclkFrequency, &max_freq);
37f5d8b777a9a5 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du  2020-12-18  1065  			if (ret)
37f5d8b777a9a5 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du  2020-12-18  1066  				return ret;
12a6727dee5d11 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du  2020-09-27  1067  =

d5c7255dc7ff6e drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Alex De=
ucher 2021-11-23  1068  			size +=3D sprintf(buf + size, "%s:\n", "OD_SCLK"=
);
d5c7255dc7ff6e drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Alex De=
ucher 2021-11-23  1069  			size +=3D sprintf(buf + size, "0: %10uMhz\n",
37f5d8b777a9a5 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du  2020-12-18  1070  			(data->gfx_actual_soft_min_freq > 0) ? data->gfx=
_actual_soft_min_freq : min_freq);
d5c7255dc7ff6e drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Alex De=
ucher 2021-11-23  1071  			size +=3D sprintf(buf + size, "1: %10uMhz\n",
37f5d8b777a9a5 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du  2020-12-18  1072  			(data->gfx_actual_soft_max_freq > 0) ? data->gfx=
_actual_soft_max_freq : max_freq);
12a6727dee5d11 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du  2020-09-27  1073  		}
12a6727dee5d11 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du  2020-09-27  1074  		break;
12a6727dee5d11 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du  2020-09-27  1075  	case OD_RANGE:
12a6727dee5d11 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du  2020-09-27  1076  		if (hwmgr->od_enabled) {
37f5d8b777a9a5 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du  2020-12-18  1077  			ret =3D smum_send_msg_to_smc(hwmgr, PPSMC_MSG_Ge=
tMinGfxclkFrequency, &min_freq);
37f5d8b777a9a5 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du  2020-12-18  1078  			if (ret)
37f5d8b777a9a5 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du  2020-12-18  1079  				return ret;
37f5d8b777a9a5 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du  2020-12-18  1080  			ret =3D smum_send_msg_to_smc(hwmgr, PPSMC_MSG_Ge=
tMaxGfxclkFrequency, &max_freq);
37f5d8b777a9a5 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du  2020-12-18  1081  			if (ret)
37f5d8b777a9a5 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du  2020-12-18  1082  				return ret;
12a6727dee5d11 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du  2020-09-27  1083  =

d5c7255dc7ff6e drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Alex De=
ucher 2021-11-23  1084  			size +=3D sprintf(buf + size, "%s:\n", "OD_RANGE=
");
d5c7255dc7ff6e drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Alex De=
ucher 2021-11-23  1085  			size +=3D sprintf(buf + size, "SCLK: %7uMHz %10u=
MHz\n",
12a6727dee5d11 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du  2020-09-27  1086  				min_freq, max_freq);
12a6727dee5d11 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du  2020-09-27  1087  		}
12a6727dee5d11 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du  2020-09-27  1088  		break;
5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an    2017-09-26  1089  	default:
5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an    2017-09-26  1090  		break;
5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an    2017-09-26  1091  	}
5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an    2017-09-26  1092  =

5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an    2017-09-26  1093  	return size;
a960d61cbd6254 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Rex Zhu=
      2017-05-11  1094  }
a960d61cbd6254 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Rex Zhu=
      2017-05-11  1095  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2031625263709448129==--

