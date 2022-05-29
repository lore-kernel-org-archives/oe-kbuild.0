Content-Type: multipart/mixed; boundary="===============0152405345097945093=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/hwmon/nct6775-core.c:2104:9: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or ...
Date: Sun, 29 May 2022 12:05:47 +0800
Message-ID: <202205291231.PyXFLjeQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0152405345097945093==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Zev Weiss <zev@bewilderbeest.net>
CC: Guenter Roeck <linux@roeck-us.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9d004b2f4fea97cde123e7f1939b80e77bf2e695
commit: c3963bc0a0cf9ecb205a9d4976eb92b6df2fa3fd hwmon: (nct6775) Split cor=
e and platform driver
date:   8 days ago
:::::: branch date: 24 hours ago
:::::: commit date: 8 days ago
config: arm-randconfig-c002-20220524 (https://download.01.org/0day-ci/archi=
ve/20220529/202205291231.PyXFLjeQ-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 134d7f=
9a4b97e9035150d970bd9e376043c4577e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dc3963bc0a0cf9ecb205a9d4976eb92b6df2fa3fd
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c3963bc0a0cf9ecb205a9d4976eb92b6df2fa3fd
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/hwmon/nct6775-core.c:1415:7: note: Assuming the condition is fal=
se
                   if (!data->target_speed[i] ||
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/nct6775-core.c:1415:7: note: Left side of '||' is false
   drivers/hwmon/nct6775-core.c:1416:7: note: Assuming the condition is fal=
se
                       data->pwm_enable[i] =3D=3D speed_cruise) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/nct6775-core.c:1415:3: note: Taking false branch
                   if (!data->target_speed[i] ||
                   ^
   drivers/hwmon/nct6775-core.c:1426:15: note: Assuming 'j' is >=3D field '=
auto_pwm_num'
                   for (j =3D 0; j < data->auto_pwm_num; j++) {
                               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/nct6775-core.c:1426:3: note: Loop condition is false. Exec=
ution continues on line 1439
                   for (j =3D 0; j < data->auto_pwm_num; j++) {
                   ^
   drivers/hwmon/nct6775-core.c:1439:9: note: Calling 'nct6775_read_value'
                   err =3D nct6775_read_value(data, data->REG_CRITICAL_TEMP=
[i], &reg);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   drivers/hwmon/nct6775.h:189:6: note: Assuming 'ret' is 0, which particip=
ates in a condition later
           if (!ret)
               ^~~~
   drivers/hwmon/nct6775.h:189:2: note: Taking true branch
           if (!ret)
           ^
   drivers/hwmon/nct6775.h:191:2: note: Returning without writing to 'data-=
>kind', which participates in a condition later
           return ret;
           ^
   drivers/hwmon/nct6775.h:191:2: note: Returning zero (loaded from 'ret'),=
 which participates in a condition later
           return ret;
           ^~~~~~~~~~
   drivers/hwmon/nct6775-core.c:1439:9: note: Returning from 'nct6775_read_=
value'
                   err =3D nct6775_read_value(data, data->REG_CRITICAL_TEMP=
[i], &reg);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   drivers/hwmon/nct6775-core.c:1440:7: note: 'err' is 0
                   if (err)
                       ^~~
   drivers/hwmon/nct6775-core.c:1440:3: note: Taking false branch
                   if (err)
                   ^
   drivers/hwmon/nct6775-core.c:1444:3: note: Control jumps to 'case nct677=
5:'  at line 1445
                   switch (data->kind) {
                   ^
   drivers/hwmon/nct6775-core.c:1446:10: note: 2nd function call argument i=
s an uninitialized value
                           err =3D nct6775_read_value(data, NCT6775_REG_CRI=
TICAL_ENAB[i], &reg);
                                 ^                        ~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   drivers/hwmon/nct6775-core.c:1633:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ld\n", in_from_reg(data->in[nr][index], nr=
));
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:1633:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n", in_from_reg(data->in[nr][index], nr=
));
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:1668:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n",
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:1668:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n",
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:1711:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", alarm);
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:1711:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", alarm);
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:1726:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n",
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:1726:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n",
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:1781:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", beep);
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:1781:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", beep);
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:1867:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->rpm[nr]);
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:1867:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->rpm[nr]);
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:1880:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:1880:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:1895:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", div_from_reg(data->fan_div[nr]));
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:1895:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", div_from_reg(data->fan_div[nr]));
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:2005:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", p ? : 4);
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:2005:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", p ? : 4);
                  ^~~~~~~
>> drivers/hwmon/nct6775-core.c:2104:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
           return sprintf(buf, "%s\n", data->temp_label[data->temp_src[nr]]=
);
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:2104:9: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
           return sprintf(buf, "%s\n", data->temp_label[data->temp_src[nr]]=
);
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:2118:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", LM75_TEMP_FROM_REG(data->temp[index]=
[nr]));
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:2118:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", LM75_TEMP_FROM_REG(data->temp[index]=
[nr]));
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:2152:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->temp_offset[sattr->index] * 10=
00);
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:2152:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->temp_offset[sattr->index] * 10=
00);
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:2189:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", (int)data->temp_type[nr]);
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:2189:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", (int)data->temp_type[nr]);
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:2375:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->pwm_mode[sattr->index]);
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:2375:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->pwm_mode[sattr->index]);
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:2442:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", pwm);
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:2442:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", pwm);
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:2567:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->pwm_enable[sattr->index]);
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:2567:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->pwm_enable[sattr->index]);
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:2636:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", sel);
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:2636:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", sel);
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:2761:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->target_temp[sattr->index] * 10=
00);
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:2761:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->target_temp[sattr->index] * 10=
00);
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:2798:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:2798:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:2840:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->temp_tolerance[index][nr] * 10=
00);
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:2840:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->temp_tolerance[index][nr] * 10=
00);
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:2907:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", tolerance);
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:2907:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", tolerance);
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:2967:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->weight_temp[index][nr] * 1000);
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:2967:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->weight_temp[index][nr] * 1000);
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:3016:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:3016:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:3053:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->auto_pwm[sattr->nr][sattr->ind=
ex]);
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:3053:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->auto_pwm[sattr->nr][sattr->ind=
ex]);
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:3144:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->auto_temp[nr][point] * 1000);
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:3144:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->auto_temp[nr][point] * 1000);
                  ^~~~~~~
   drivers/hwmon/nct6775-core.c:3964:9: warning: 2nd function call argument=
 is an uninitialized value [clang-analyzer-core.CallAndMessage]
                   err =3D nct6775_read_value(data, data->REG_TEMP_SOURCE[i=
], &src);
                         ^                        ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/nct6775-core.c:3415:2: note: Taking false branch
           if (IS_ERR(data->regmap))

vim +2104 drivers/hwmon/nct6775-core.c

1c65dc365ed38d drivers/hwmon/nct6775.c Guenter Roeck 2012-12-04  2093  =

aa136e5dad9fbe drivers/hwmon/nct6775.c Guenter Roeck 2012-12-04  2094  stat=
ic ssize_t
aa136e5dad9fbe drivers/hwmon/nct6775.c Guenter Roeck 2012-12-04  2095  show=
_temp_label(struct device *dev, struct device_attribute *attr, char *buf)
aa136e5dad9fbe drivers/hwmon/nct6775.c Guenter Roeck 2012-12-04  2096  {
aa136e5dad9fbe drivers/hwmon/nct6775.c Guenter Roeck 2012-12-04  2097  	str=
uct nct6775_data *data =3D nct6775_update_device(dev);
aa136e5dad9fbe drivers/hwmon/nct6775.c Guenter Roeck 2012-12-04  2098  	str=
uct sensor_device_attribute *sattr =3D to_sensor_dev_attr(attr);
aa136e5dad9fbe drivers/hwmon/nct6775.c Guenter Roeck 2012-12-04  2099  	int=
 nr =3D sattr->index;
9cd892bcbe32fe drivers/hwmon/nct6775.c Guenter Roeck 2014-11-16  2100  =

4ef2774511dc6e drivers/hwmon/nct6775.c Zev Weiss     2022-04-26  2101  	if =
(IS_ERR(data))
4ef2774511dc6e drivers/hwmon/nct6775.c Zev Weiss     2022-04-26  2102  		re=
turn PTR_ERR(data);
4ef2774511dc6e drivers/hwmon/nct6775.c Zev Weiss     2022-04-26  2103  =

aa136e5dad9fbe drivers/hwmon/nct6775.c Guenter Roeck 2012-12-04 @2104  	ret=
urn sprintf(buf, "%s\n", data->temp_label[data->temp_src[nr]]);
aa136e5dad9fbe drivers/hwmon/nct6775.c Guenter Roeck 2012-12-04  2105  }
aa136e5dad9fbe drivers/hwmon/nct6775.c Guenter Roeck 2012-12-04  2106  =


:::::: The code at line 2104 was first introduced by commit
:::::: aa136e5dad9fbec9e98867278555a81f2d75ea10 hwmon: (nct6775) Add suppor=
t for temperature sensors

:::::: TO: Guenter Roeck <linux@roeck-us.net>
:::::: CC: Guenter Roeck <linux@roeck-us.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0152405345097945093==--

