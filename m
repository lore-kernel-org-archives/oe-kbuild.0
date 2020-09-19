Content-Type: multipart/mixed; boundary="===============7899890893151790448=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 937/9028] drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c:461:9: warning: Identical condition 'ret', second condition is always false
Date: Sun, 20 Sep 2020 04:18:38 +0800
Message-ID: <202009200423.a2F3zCOA%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7899890893151790448==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Evan Quan <evan.quan@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   b652d2a5f2a4e93d803cc33eb57fdc41ee528500
commit: e098bc9612c2b60f94920461d71c92962a916e73 [937/9028] drm/amd/pm: opt=
imize the power related source code layout
:::::: branch date: 2 days ago
:::::: commit date: 5 weeks ago
compiler: s390-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   In file included from drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/arctu=
rus_ppt.c:
>> drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c:461:9: warning: Identi=
cal condition 'ret', second condition is always false [identicalConditionAf=
terEarlyExit]
    return ret;
           ^
   drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c:458:6: note: first con=
dition
    if (ret)
        ^
   drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c:461:9: note: second co=
ndition
    return ret;
           ^
   drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c:1148:9: warning: Ident=
ical condition 'ret', second condition is always false [identicalConditionA=
fterEarlyExit]
    return ret;
           ^
   drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c:1142:6: note: first co=
ndition
    if (ret)
        ^
   drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c:1148:9: note: second c=
ondition
    return ret;
           ^
>> drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c:1249:11: warning: %d i=
n format string (no. 1) requires 'int' but the argument type is 'unsigned i=
nt'. [invalidPrintfArgType_sint]
     size +=3D sprintf(buf + size, "%2d %14s%sn",
             ^
>> drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c:2132:2: warning: %llx =
in format string (no. 1) requires 'unsigned long long' but the argument typ=
e is 'unsigned long'. [invalidPrintfArgType_uint]
    sprintf(adev->serial, "%llx", id);
    ^
>> drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c:453:9: warning: Identica=
l condition 'ret', second condition is always false [identicalConditionAfte=
rEarlyExit]
    return ret;
           ^
   drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c:450:6: note: first condi=
tion
    if (ret)
        ^
   drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c:453:9: note: second cond=
ition
    return ret;
           ^
   drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c:1381:9: warning: Identic=
al condition 'ret', second condition is always false [identicalConditionAft=
erEarlyExit]
    return ret;
           ^
   drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c:1375:6: note: first cond=
ition
    if (ret)
        ^
   drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c:1381:9: note: second con=
dition
    return ret;
           ^
>> drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c:1039:12: warning: %u in =
format string (no. 3) requires 'unsigned int' but the argument type is 'sig=
ned int'. [invalidPrintfArgType_uint]
      size +=3D sprintf(buf + size, "%d: %uMHz %umVn", i, curve_settings[0]=
, curve_settings[1] / NAVI10_VOLTAGE_SCALE);
              ^
>> drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c:1070:12: warning: %d in =
format string (no. 1) requires 'int' but the argument type is 'unsigned int=
'. [invalidPrintfArgType_sint]
      size +=3D sprintf(buf + size, "VDDC_CURVE_VOLT[0]: %7dmV %11dmVn",
              ^
   drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c:1070:12: warning: %d in =
format string (no. 2) requires 'int' but the argument type is 'unsigned int=
'. [invalidPrintfArgType_sint]
      size +=3D sprintf(buf + size, "VDDC_CURVE_VOLT[0]: %7dmV %11dmVn",
              ^
   drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c:1078:12: warning: %d in =
format string (no. 1) requires 'int' but the argument type is 'unsigned int=
'. [invalidPrintfArgType_sint]
      size +=3D sprintf(buf + size, "VDDC_CURVE_VOLT[1]: %7dmV %11dmVn",
              ^
   drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c:1078:12: warning: %d in =
format string (no. 2) requires 'int' but the argument type is 'unsigned int=
'. [invalidPrintfArgType_sint]
      size +=3D sprintf(buf + size, "VDDC_CURVE_VOLT[1]: %7dmV %11dmVn",
              ^
   drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c:1086:12: warning: %d in =
format string (no. 1) requires 'int' but the argument type is 'unsigned int=
'. [invalidPrintfArgType_sint]
      size +=3D sprintf(buf + size, "VDDC_CURVE_VOLT[2]: %7dmV %11dmVn",
              ^
   drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c:1086:12: warning: %d in =
format string (no. 2) requires 'int' but the argument type is 'unsigned int=
'. [invalidPrintfArgType_sint]
      size +=3D sprintf(buf + size, "VDDC_CURVE_VOLT[2]: %7dmV %11dmVn",
              ^
   drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c:1434:11: warning: %d in =
format string (no. 1) requires 'int' but the argument type is 'unsigned int=
'. [invalidPrintfArgType_sint]
     size +=3D sprintf(buf + size, "%2d %14s%s:n",
             ^
>> drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c:363:9: warning: =
Identical condition 'ret', second condition is always false [identicalCondi=
tionAfterEarlyExit]
    return ret;
           ^
   drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c:360:6: note: fir=
st condition
    if (ret)
        ^
   drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c:363:9: note: sec=
ond condition
    return ret;
           ^
   drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c:1185:9: warning:=
 Identical condition 'ret', second condition is always false [identicalCond=
itionAfterEarlyExit]
    return ret;
           ^
   drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c:1179:6: note: fi=
rst condition
    if (ret)
        ^
   drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c:1185:9: note: se=
cond condition
    return ret;
           ^
>> drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c:646:9: warning: Identical=
 condition 'ret', second condition is always false [identicalConditionAfter=
EarlyExit]
    return ret;
           ^
   drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c:643:6: note: first condit=
ion
    if (ret)
        ^
   drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c:646:9: note: second condi=
tion
    return ret;
           ^
   drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c:1389:9: warning: Identica=
l condition 'ret', second condition is always false [identicalConditionAfte=
rEarlyExit]
    return ret;
           ^
   drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c:1386:6: note: first condi=
tion
    if (ret)
        ^
   drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c:1389:9: note: second cond=
ition
    return ret;
           ^
   drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c:1527:9: warning: Identica=
l condition 'ret', second condition is always false [identicalConditionAfte=
rEarlyExit]
    return ret;
           ^
   drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c:1522:6: note: first condi=
tion
    if (ret)
        ^
   drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c:1527:9: note: second cond=
ition
    return ret;
           ^
   drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c:1538:9: warning: Identica=
l condition 'ret', second condition is always false [identicalConditionAfte=
rEarlyExit]
    return ret;
           ^
   drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c:1535:6: note: first condi=
tion
    if (ret)
        ^
   drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c:1538:9: note: second cond=
ition
    return ret;
           ^
   drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c:1847:9: warning: Identica=
l condition 'ret', second condition is always false [identicalConditionAfte=
rEarlyExit]
    return ret;
           ^
   drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c:1838:6: note: first condi=
tion
    if (ret)
        ^
   drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c:1847:9: note: second cond=
ition
    return ret;
           ^
>> drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c:512:9: warning: Identica=
l condition 'ret', second condition is always false [identicalConditionAfte=
rEarlyExit]
    return ret;
           ^
   drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c:501:6: note: first condi=
tion
    if (ret)
        ^
   drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c:512:9: note: second cond=
ition
    return ret;
           ^
   drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c:780:9: warning: Identica=
l condition 'ret', second condition is always false [identicalConditionAfte=
rEarlyExit]
    return ret;
           ^
   drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c:777:6: note: first condi=
tion
    if (ret)
        ^
   drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c:780:9: note: second cond=
ition
    return ret;
           ^
>> drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c:919:11: warning: %d in f=
ormat string (no. 1) requires 'int' but the argument type is 'unsigned int'=
. [invalidPrintfArgType_sint]
     size +=3D sprintf(buf + size, "%2d %14s%sn",
             ^
>> drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c:379:9: warning: Identical cond=
ition 'ret', second condition is always false [identicalConditionAfterEarly=
Exit]
    return ret;
           ^
   drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c:370:6: note: first condition
    if (ret)
        ^
   drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c:379:9: note: second condition
    return ret;
           ^
   drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c:851:9: warning: Identical cond=
ition 'ret', second condition is always false [identicalConditionAfterEarly=
Exit]
    return ret;
           ^
   drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c:838:6: note: first condition
    if (ret)
        ^
   drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c:851:9: note: second condition
    return ret;
           ^
   drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c:1001:9: warning: Identical con=
dition 'ret', second condition is always false [identicalConditionAfterEarl=
yExit]
    return ret;
           ^
   drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c:998:6: note: first condition
    if (ret)
        ^
   drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c:1001:9: note: second condition
    return ret;
           ^
   drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c:1035:9: warning: Identical con=
dition 'ret', second condition is always false [identicalConditionAfterEarl=
yExit]
    return ret;
           ^
   drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c:1032:6: note: first condition
    if (ret)
        ^
   drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c:1035:9: note: second condition
    return ret;
           ^
>> drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c:3224:38: warning: =
Variable 'stable_pstate_sclk_dpm_percentage' is reassigned a value before t=
he old one has been used. [redundantAssignment]
      stable_pstate_sclk_dpm_percentage =3D 75);
                                        ^
   drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c:3218:37: note: Var=
iable 'stable_pstate_sclk_dpm_percentage' is reassigned a value before the =
old one has been used.
     stable_pstate_sclk_dpm_percentage =3D
                                       ^
   drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c:3224:38: note: Var=
iable 'stable_pstate_sclk_dpm_percentage' is reassigned a value before the =
old one has been used.
      stable_pstate_sclk_dpm_percentage =3D 75);
                                        ^
>> drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c:2840:0: warning: S=
yntax error in #if [preprocessorErrorDirective]
   #if 0
   ^

# https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3De098bc9612c2b60f94920461d71c92962a916e73
git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/n=
ext/linux-next.git
git fetch --no-tags linux-next master
git checkout e098bc9612c2b60f94920461d71c92962a916e73
vim +/ret +461 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c

a94235af11b3f7 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c Evan Quan 2019-=
07-29  440  =

4a13b4cefc2149 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c Evan Quan 2020-=
05-28  441  static int arcturus_setup_pptable(struct smu_context *smu)
4a13b4cefc2149 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c Evan Quan 2020-=
05-28  442  {
4a13b4cefc2149 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c Evan Quan 2020-=
05-28  443  	int ret =3D 0;
4a13b4cefc2149 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c Evan Quan 2020-=
05-28  444  =

4a13b4cefc2149 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c Evan Quan 2020-=
05-28  445  	ret =3D smu_v11_0_setup_pptable(smu);
4a13b4cefc2149 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c Evan Quan 2020-=
05-28  446  	if (ret)
4a13b4cefc2149 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c Evan Quan 2020-=
05-28  447  		return ret;
4a13b4cefc2149 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c Evan Quan 2020-=
05-28  448  =

4a13b4cefc2149 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c Evan Quan 2020-=
05-28  449  	ret =3D arcturus_store_powerplay_table(smu);
4a13b4cefc2149 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c Evan Quan 2020-=
05-28  450  	if (ret)
4a13b4cefc2149 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c Evan Quan 2020-=
05-28  451  		return ret;
4a13b4cefc2149 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c Evan Quan 2020-=
05-28  452  =

4a13b4cefc2149 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c Evan Quan 2020-=
05-28  453  	ret =3D arcturus_append_powerplay_table(smu);
4a13b4cefc2149 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c Evan Quan 2020-=
05-28  454  	if (ret)
4a13b4cefc2149 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c Evan Quan 2020-=
05-28  455  		return ret;
4a13b4cefc2149 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c Evan Quan 2020-=
05-28  456  =

4a13b4cefc2149 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c Evan Quan 2020-=
05-28  457  	ret =3D arcturus_check_powerplay_table(smu);
4a13b4cefc2149 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c Evan Quan 2020-=
05-28  458  	if (ret)
4a13b4cefc2149 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c Evan Quan 2020-=
05-28  459  		return ret;
4a13b4cefc2149 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c Evan Quan 2020-=
05-28  460  =

4a13b4cefc2149 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c Evan Quan 2020-=
05-28 @461  	return ret;
4a13b4cefc2149 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c Evan Quan 2020-=
05-28  462  }
4a13b4cefc2149 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c Evan Quan 2020-=
05-28  463  =


:::::: The code at line 461 was first introduced by commit
:::::: 4a13b4cefc2149bb62ebf90e8de89d14a2370907 drm/amd/powerplay: clean up=
 the APIs for pptable setup

:::::: TO: Evan Quan <evan.quan@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7899890893151790448==--

