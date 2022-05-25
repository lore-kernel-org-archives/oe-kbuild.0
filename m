Content-Type: multipart/mixed; boundary="===============0959348839520191038=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH V4 2/2] rtc: zynqmp: Add calibration set and get support
Date: Wed, 25 May 2022 23:40:08 +0800
Message-ID: <202205252348.98GUxONj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0959348839520191038==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220524122050.48553-2-srinivas.neeli@xilinx.com>
References: <20220524122050.48553-2-srinivas.neeli@xilinx.com>
TO: Srinivas Neeli <srinivas.neeli@xilinx.com>

Hi Srinivas,

I love your patch! Perhaps something to improve:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on v5.18 next-20220525]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Neeli/dt-bi=
ndings-rtc-zynqmp-Add-clock-information/20220524-202230
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git =
rtc-next
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: arm-randconfig-c002-20220524 (https://download.01.org/0day-ci/archi=
ve/20220525/202205252348.98GUxONj-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 10c9ec=
ce9f6096e18222a331c5e7d085bd813f75)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/6d9b4c8b2b2aa774507=
d2ef34e62d465698b13db
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Srinivas-Neeli/dt-bindings-rtc-zyn=
qmp-Add-clock-information/20220524-202230
        git checkout 6d9b4c8b2b2aa774507d2ef34e62d465698b13db
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/hwmon/lm77.c:137:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->temp[attr->index]);
                  ^~~~~~~
   drivers/hwmon/lm77.c:137:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->temp[attr->index]);
                  ^~~~~~~
   drivers/hwmon/lm77.c:151:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", temp);
                  ^~~~~~~
   drivers/hwmon/lm77.c:151:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", temp);
                  ^~~~~~~
   drivers/hwmon/lm77.c:208:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", (data->alarms >> bitnr) & 1);
                  ^~~~~~~
   drivers/hwmon/lm77.c:208:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", (data->alarms >> bitnr) & 1);
                  ^~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   drivers/hwmon/lm78.c:147:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", IN_FROM_REG(data->in[attr->index]));
                  ^~~~~~~
   drivers/hwmon/lm78.c:147:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", IN_FROM_REG(data->in[attr->index]));
                  ^~~~~~~
   drivers/hwmon/lm78.c:155:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", IN_FROM_REG(data->in_min[attr->index=
]));
                  ^~~~~~~
   drivers/hwmon/lm78.c:155:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", IN_FROM_REG(data->in_min[attr->index=
]));
                  ^~~~~~~
   drivers/hwmon/lm78.c:163:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", IN_FROM_REG(data->in_max[attr->index=
]));
                  ^~~~~~~
   drivers/hwmon/lm78.c:163:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", IN_FROM_REG(data->in_max[attr->index=
]));
                  ^~~~~~~
   drivers/hwmon/lm78.c:233:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp));
                  ^~~~~~~
   drivers/hwmon/lm78.c:233:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp));
                  ^~~~~~~
   drivers/hwmon/lm78.c:240:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_over));
                  ^~~~~~~
   drivers/hwmon/lm78.c:240:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_over));
                  ^~~~~~~
   drivers/hwmon/lm78.c:266:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_hyst));
                  ^~~~~~~
   drivers/hwmon/lm78.c:266:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_hyst));
                  ^~~~~~~
   drivers/hwmon/lm78.c:299:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan[nr],
                  ^~~~~~~
   drivers/hwmon/lm78.c:299:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan[nr],
                  ^~~~~~~
   drivers/hwmon/lm78.c:309:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan_min[nr],
                  ^~~~~~~
   drivers/hwmon/lm78.c:309:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan_min[nr],
                  ^~~~~~~
   drivers/hwmon/lm78.c:338:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", DIV_FROM_REG(data->fan_div[attr->ind=
ex]));
                  ^~~~~~~
   drivers/hwmon/lm78.c:338:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", DIV_FROM_REG(data->fan_div[attr->ind=
ex]));
                  ^~~~~~~
   drivers/hwmon/lm78.c:423:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", vid_from_reg(data->vid, 82));
                  ^~~~~~~
   drivers/hwmon/lm78.c:423:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", vid_from_reg(data->vid, 82));
                  ^~~~~~~
   drivers/hwmon/lm78.c:432:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", data->alarms);
                  ^~~~~~~
   drivers/hwmon/lm78.c:432:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", data->alarms);
                  ^~~~~~~
   drivers/hwmon/lm78.c:441:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", (data->alarms >> nr) & 1);
                  ^~~~~~~
   drivers/hwmon/lm78.c:441:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", (data->alarms >> nr) & 1);
                  ^~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
>> drivers/rtc/rtc-zynqmp.c:238:6: warning: Branch condition evaluates to a=
 garbage value [clang-analyzer-core.uninitialized.Branch]
           if (fract_tick)
               ^~~~~~~~~~
   drivers/rtc/rtc-zynqmp.c:205:27: note: Left side of '&&' is false
           unsigned int tick_mult =3D do_div(rtc_ppb, xrtcdev->freq);
                                    ^
   include/asm-generic/div64.h:223:35: note: expanded from macro 'do_div'
           if (__builtin_constant_p(__base) &&             \
                                            ^
   drivers/rtc/rtc-zynqmp.c:205:27: note: Left side of '&&' is false
           unsigned int tick_mult =3D do_div(rtc_ppb, xrtcdev->freq);
                                    ^
   include/asm-generic/div64.h:227:42: note: expanded from macro 'do_div'
           } else if (__builtin_constant_p(__base) &&      \
                                                   ^
   drivers/rtc/rtc-zynqmp.c:205:27: note: Taking true branch
           unsigned int tick_mult =3D do_div(rtc_ppb, xrtcdev->freq);
                                    ^
   include/asm-generic/div64.h:234:9: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) =3D=3D 0)) {          \
                  ^
   drivers/rtc/rtc-zynqmp.c:206:2: note: 'fract_tick' declared without an i=
nitial value
           unsigned char fract_tick;
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-zynqmp.c:211:6: note: Assuming the condition is false
           if (offset < RTC_MIN_OFFSET || offset > RTC_MAX_OFFSET)
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-zynqmp.c:211:6: note: Left side of '||' is false
   drivers/rtc/rtc-zynqmp.c:211:33: note: Assuming 'offset' is <=3D RTC_MAX=
_OFFSET
           if (offset < RTC_MIN_OFFSET || offset > RTC_MAX_OFFSET)
                                          ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-zynqmp.c:211:2: note: Taking false branch
           if (offset < RTC_MIN_OFFSET || offset > RTC_MAX_OFFSET)
           ^
   drivers/rtc/rtc-zynqmp.c:218:6: note: Assuming 'fract_offset' is 0
           if (fract_offset) {
               ^~~~~~~~~~~~
   drivers/rtc/rtc-zynqmp.c:218:2: note: Taking false branch
           if (fract_offset) {
           ^
   drivers/rtc/rtc-zynqmp.c:238:6: note: Branch condition evaluates to a ga=
rbage value
           if (fract_tick)
               ^~~~~~~~~~
   Suppressed 31 warnings (29 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   66 warnings generated.
   drivers/media/i2c/adv7604.c:1467:3: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(stdi, 0, sizeof(struct stdi_readback));
                   ^~~~~~
   drivers/media/i2c/adv7604.c:1467:3: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
                   memset(stdi, 0, sizeof(struct stdi_readback));
                   ^~~~~~
   drivers/media/i2c/adv7604.c:1571:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(timings, 0, sizeof(struct v4l2_dv_timings));
           ^~~~~~
   drivers/media/i2c/adv7604.c:1571:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(timings, 0, sizeof(struct v4l2_dv_timings));
           ^~~~~~
   drivers/media/i2c/adv7604.c:1672:3: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(timings, 0, sizeof(struct v4l2_dv_timings));
                   ^~~~~~
   drivers/media/i2c/adv7604.c:1672:3: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
                   memset(timings, 0, sizeof(struct v4l2_dv_timings));
                   ^~~~~~
   drivers/media/i2c/adv7604.c:1852:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(format, 0, sizeof(*format));
           ^~~~~~
   drivers/media/i2c/adv7604.c:1852:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(format, 0, sizeof(*format));
           ^~~~~~
   drivers/media/i2c/adv7604.c:2277:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(edid->reserved, 0, sizeof(edid->reserved));
           ^~~~~~
   drivers/media/i2c/adv7604.c:2277:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(edid->reserved, 0, sizeof(edid->reserved));
           ^~~~~~
   drivers/media/i2c/adv7604.c:2305:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(edid->edid, data + edid->start_block * 128, edid->blocks =
* 128);
           ^~~~~~
   drivers/media/i2c/adv7604.c:2305:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(edid->edid, data + edid->start_block * 128, edid->blocks =
* 128);
           ^~~~~~
   drivers/media/i2c/adv7604.c:2319:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(edid->reserved, 0, sizeof(edid->reserved));
           ^~~~~~
   drivers/media/i2c/adv7604.c:2319:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(edid->reserved, 0, sizeof(edid->reserved));
           ^~~~~~
   drivers/media/i2c/adv7604.c:2403:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(state->edid.edid, edid->edid, 128 * edid->blocks);
           ^~~~~~
   drivers/media/i2c/adv7604.c:2403:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11

vim +238 drivers/rtc/rtc-zynqmp.c

6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  200  =

6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  201  static int xlnx_rtc_set_off=
set(struct device *dev, long offset)
6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  202  {
6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  203  	struct xlnx_rtc_dev *xrtcd=
ev =3D dev_get_drvdata(dev);
6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  204  	unsigned long long rtc_ppb=
 =3D RTC_PPB;
6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  205  	unsigned int tick_mult =3D=
 do_div(rtc_ppb, xrtcdev->freq);
6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  206  	unsigned char fract_tick;
6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  207  	unsigned int calibval;
6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  208  	short int  max_tick;
6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  209  	int fract_offset;
6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  210  =

6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  211  	if (offset < RTC_MIN_OFFSE=
T || offset > RTC_MAX_OFFSET)
6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  212  		return -ERANGE;
6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  213  =

6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  214  	/* Number ticks for given =
offset */
6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  215  	max_tick =3D div_s64_rem(o=
ffset, tick_mult, &fract_offset);
6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  216  =

6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  217  	/* Number fractional ticks=
 for given offset */
6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  218  	if (fract_offset) {
6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  219  		if (fract_offset < 0) {
6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  220  			fract_offset =3D fract_o=
ffset + tick_mult;
6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  221  			max_tick--;
6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  222  		}
6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  223  		if (fract_offset > (tick_=
mult / RTC_FR_MAX_TICKS)) {
6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  224  			for (fract_tick =3D 1; f=
ract_tick < 16; fract_tick++) {
6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  225  				if (fract_offset <=3D
6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  226  				    (fract_tick *
6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  227  				     (tick_mult / RTC_F=
R_MAX_TICKS)))
6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  228  					break;
6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  229  			}
6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  230  		}
6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  231  	}
6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  232  =

6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  233  	/* Zynqmp RTC uses second =
and fractional tick
6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  234  	 * counters for compensati=
on
11143c19eb57a8 Suneel Garapati 2015-08-19  235  	 */
6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  236  	calibval =3D max_tick + RT=
C_CALIB_DEF;
6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  237  =

6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24 @238  	if (fract_tick)
6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  239  		calibval |=3D RTC_FR_EN;
6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  240  =

6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  241  	calibval |=3D (fract_tick =
<< RTC_FR_DATSHIFT);
6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  242  =

6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  243  	writel(calibval, (xrtcdev-=
>reg_base + RTC_CALIB_WR));
6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  244  =

6d9b4c8b2b2aa7 Srinivas Neeli  2022-05-24  245  	return 0;
11143c19eb57a8 Suneel Garapati 2015-08-19  246  }
11143c19eb57a8 Suneel Garapati 2015-08-19  247  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0959348839520191038==--

