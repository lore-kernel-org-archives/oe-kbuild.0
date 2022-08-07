Content-Type: multipart/mixed; boundary="===============0981729141141676566=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.10 2/25] drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c:1053:12: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
Date: Sun, 07 Aug 2022 20:15:19 +0800
Message-ID: <202208072057.wo4TznZk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0981729141141676566==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "commit no functional change"
:::::: Manual check reason: "low confidence static check warning: drivers/g=
pu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c:1053:12: warning: %d in format =
string (no. 1) requires 'int' but the argument type is 'unsigned int'. [inv=
alidPrintfArgType_sint]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.10
head:   38577b2007cb6cbe54b2dfb4b4f38db77471426f
commit: bc59bde9d736054abff8a37b581594f42761d628 [2/25] UPSTREAM: drm/amdgp=
u/pm: fix powerplay OD interface
:::::: branch date: 22 hours ago
:::::: commit date: 3 days ago
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout bc59bde9d736054abff8a37b581594f42761d628
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/s=
mu10_hwmgr.c:
>> drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c:1053:12: warning: %=
d in format string (no. 1) requires 'int' but the argument type is 'unsigne=
d int'. [invalidPrintfArgType_sint]
      size +=3D sprintf(buf + size, "%d: %uMhz %sn",
              ^
>> drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c:2931:0: warning: S=
yntax error in #if [preprocessorErrorDirective]
   #if 0
   ^
--
   In file included from drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/v=
ega20_hwmgr.c:
>> drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c:3940:43: warning: =
syntax error [syntaxError]
      "[PowerOffAsic] Failed to disable DPM!",
                                             ^
--
   In file included from drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/s=
mu7_hwmgr.c:
>> drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c:1316:45: warning: sy=
ntax error [syntaxError]
       "Failed to enable AC DC GPIO Interrupt!",
                                               ^
--
   In file included from drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/v=
ega10_hwmgr.c:
>> drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c:2507:36: warning: =
syntax error [syntaxError]
      "Failed to upload FuseOVerride!",
                                      ^

vim +1053 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c

a960d61cbd6254 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Rex Zhu=
             2017-05-11  1016  =

c425688520990d drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c    Rex Zhu=
             2018-03-06  1017  static int smu10_print_clock_levels(struct p=
p_hwmgr *hwmgr,
a960d61cbd6254 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Rex Zhu=
             2017-05-11  1018  		enum pp_clock_type type, char *buf)
a960d61cbd6254 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Rex Zhu=
             2017-05-11  1019  {
c425688520990d drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c    Rex Zhu=
             2018-03-06  1020  	struct smu10_hwmgr *data =3D (struct smu10_=
hwmgr *)(hwmgr->backend);
c425688520990d drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c    Rex Zhu=
             2018-03-06  1021  	struct smu10_voltage_dependency_table *mclk=
_table =3D
5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an           2017-09-26  1022  			data->clock_vol_info.vdd_dep_on_fclk;
21c77de3566115 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c    Rex Zhu=
             2018-04-20  1023  	uint32_t i, now, size =3D 0;
1d2e821a40c72c drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du         2020-12-18  1024  	uint32_t min_freq, max_freq =3D 0;
1d2e821a40c72c drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du         2020-12-18  1025  	uint32_t ret =3D 0;
5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an           2017-09-26  1026  =

5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an           2017-09-26  1027  	switch (type) {
5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an           2017-09-26  1028  	case PP_SCLK:
a0ec225633d9f6 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c    Evan Qu=
an           2020-03-27  1029  		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetG=
fxclkFrequency, &now);
5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an           2017-09-26  1030  =

21c77de3566115 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c    Rex Zhu=
             2018-04-20  1031  	/* driver only know min/max gfx_clk, Add le=
vel 1 for all other gfx clks */
21c77de3566115 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c    Rex Zhu=
             2018-04-20  1032  		if (now =3D=3D data->gfx_max_freq_limit/10=
0)
21c77de3566115 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c    Rex Zhu=
             2018-04-20  1033  			i =3D 2;
21c77de3566115 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c    Rex Zhu=
             2018-04-20  1034  		else if (now =3D=3D data->gfx_min_freq_lim=
it/100)
21c77de3566115 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c    Rex Zhu=
             2018-04-20  1035  			i =3D 0;
21c77de3566115 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c    Rex Zhu=
             2018-04-20  1036  		else
21c77de3566115 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c    Rex Zhu=
             2018-04-20  1037  			i =3D 1;
21c77de3566115 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c    Rex Zhu=
             2018-04-20  1038  =

bc59bde9d73605 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Linux P=
atches Robot 2022-08-02  1039  		size +=3D sprintf(buf + size, "0: %uMhz %s=
\n",
5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an           2017-09-26  1040  					data->gfx_min_freq_limit/100,
21c77de3566115 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c    Rex Zhu=
             2018-04-20  1041  					i =3D=3D 0 ? "*" : "");
bc59bde9d73605 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Linux P=
atches Robot 2022-08-02  1042  		size +=3D sprintf(buf + size, "1: %uMhz %s=
\n",
21c77de3566115 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c    Rex Zhu=
             2018-04-20  1043  					i =3D=3D 1 ? now : SMU10_UMD_PSTATE_GFX=
CLK,
21c77de3566115 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c    Rex Zhu=
             2018-04-20  1044  					i =3D=3D 1 ? "*" : "");
bc59bde9d73605 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Linux P=
atches Robot 2022-08-02  1045  		size +=3D sprintf(buf + size, "2: %uMhz %s=
\n",
5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an           2017-09-26  1046  					data->gfx_max_freq_limit/100,
21c77de3566115 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c    Rex Zhu=
             2018-04-20  1047  					i =3D=3D 2 ? "*" : "");
5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an           2017-09-26  1048  		break;
5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an           2017-09-26  1049  	case PP_MCLK:
a0ec225633d9f6 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c    Evan Qu=
an           2020-03-27  1050  		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetF=
clkFrequency, &now);
5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an           2017-09-26  1051  =

5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an           2017-09-26  1052  		for (i =3D 0; i < mclk_table->count; i++)
bc59bde9d73605 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Linux P=
atches Robot 2022-08-02 @1053  			size +=3D sprintf(buf + size, "%d: %uMhz =
%s\n",
5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an           2017-09-26  1054  					i,
5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an           2017-09-26  1055  					mclk_table->entries[i].clk / 100,
5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an           2017-09-26  1056  					((mclk_table->entries[i].clk / 100)
5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an           2017-09-26  1057  					 =3D=3D now) ? "*" : "");
5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an           2017-09-26  1058  		break;
12a6727dee5d11 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du         2020-09-27  1059  	case OD_SCLK:
12a6727dee5d11 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du         2020-09-27  1060  		if (hwmgr->od_enabled) {
1d2e821a40c72c drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du         2020-12-18  1061  			ret =3D smum_send_msg_to_smc(hwmgr, PPSMC=
_MSG_GetMinGfxclkFrequency, &min_freq);
1d2e821a40c72c drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du         2020-12-18  1062  			if (ret)
1d2e821a40c72c drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du         2020-12-18  1063  				return ret;
1d2e821a40c72c drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du         2020-12-18  1064  			ret =3D smum_send_msg_to_smc(hwmgr, PPSMC=
_MSG_GetMaxGfxclkFrequency, &max_freq);
1d2e821a40c72c drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du         2020-12-18  1065  			if (ret)
1d2e821a40c72c drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du         2020-12-18  1066  				return ret;
12a6727dee5d11 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du         2020-09-27  1067  =

bc59bde9d73605 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Linux P=
atches Robot 2022-08-02  1068  			size +=3D sprintf(buf + size, "%s:\n", "O=
D_SCLK");
bc59bde9d73605 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Linux P=
atches Robot 2022-08-02  1069  			size +=3D sprintf(buf + size, "0: %10uMhz=
\n",
1d2e821a40c72c drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du         2020-12-18  1070  			(data->gfx_actual_soft_min_freq > 0) ? da=
ta->gfx_actual_soft_min_freq : min_freq);
bc59bde9d73605 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Linux P=
atches Robot 2022-08-02  1071  			size +=3D sprintf(buf + size, "1: %10uMhz=
\n",
1d2e821a40c72c drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du         2020-12-18  1072  			(data->gfx_actual_soft_max_freq > 0) ? da=
ta->gfx_actual_soft_max_freq : max_freq);
12a6727dee5d11 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du         2020-09-27  1073  		}
12a6727dee5d11 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du         2020-09-27  1074  		break;
12a6727dee5d11 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du         2020-09-27  1075  	case OD_RANGE:
12a6727dee5d11 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du         2020-09-27  1076  		if (hwmgr->od_enabled) {
1d2e821a40c72c drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du         2020-12-18  1077  			ret =3D smum_send_msg_to_smc(hwmgr, PPSMC=
_MSG_GetMinGfxclkFrequency, &min_freq);
1d2e821a40c72c drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du         2020-12-18  1078  			if (ret)
1d2e821a40c72c drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du         2020-12-18  1079  				return ret;
1d2e821a40c72c drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du         2020-12-18  1080  			ret =3D smum_send_msg_to_smc(hwmgr, PPSMC=
_MSG_GetMaxGfxclkFrequency, &max_freq);
1d2e821a40c72c drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du         2020-12-18  1081  			if (ret)
1d2e821a40c72c drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du         2020-12-18  1082  				return ret;
12a6727dee5d11 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du         2020-09-27  1083  =

bc59bde9d73605 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Linux P=
atches Robot 2022-08-02  1084  			size +=3D sprintf(buf + size, "%s:\n", "O=
D_RANGE");
bc59bde9d73605 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Linux P=
atches Robot 2022-08-02  1085  			size +=3D sprintf(buf + size, "SCLK: %7uM=
Hz %10uMHz\n",
12a6727dee5d11 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du         2020-09-27  1086  				min_freq, max_freq);
12a6727dee5d11 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du         2020-09-27  1087  		}
12a6727dee5d11 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c Xiaojia=
n Du         2020-09-27  1088  		break;
5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an           2017-09-26  1089  	default:
5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an           2017-09-26  1090  		break;
5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an           2017-09-26  1091  	}
5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an           2017-09-26  1092  =

5f628d997d1e41 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Evan Qu=
an           2017-09-26  1093  	return size;
a960d61cbd6254 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Rex Zhu=
             2017-05-11  1094  }
a960d61cbd6254 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c       Rex Zhu=
             2017-05-11  1095  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0981729141141676566==--

