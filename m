Content-Type: multipart/mixed; boundary="===============1788717996593199974=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 6/7] media: i2c: ov9282: Set v4l2 subdev name according to sensor model
Date: Wed, 03 Aug 2022 07:12:21 +0800
Message-ID: <202208030644.UFmtMaV9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1788717996593199974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/m=
edia/i2c/ov9282.c:1054:3: warning: Undefined or garbage value returned to c=
aller [clang-analyzer-core.uninitialized.UndefReturn]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220728130237.3396663-7-alexander.stein@ew.tq-group.com>
References: <20220728130237.3396663-7-alexander.stein@ew.tq-group.com>
TO: Alexander Stein <alexander.stein@ew.tq-group.com>
TO: "Paul J . Murphy" <paul.j.murphy@intel.com>
TO: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
TO: Rob Herring <robh+dt@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Alexander Stein <alexander.stein@ew.tq-group.com>
CC: devicetree(a)vger.kernel.org
CC: Sakari Ailus <sakari.ailus@iki.fi>

Hi Alexander,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linus/master v5.19 next-20220728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Stein/OV92=
81-support/20220728-210448
base:   git://linuxtv.org/media_tree.git master
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-c002-20220731 (https://download.01.org/0day-ci/archi=
ve/20220803/202208030644.UFmtMaV9-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00=
cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/ee28006553d4d23f600=
b0076ef6066710519f156
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Alexander-Stein/OV9281-support/202=
20728-210448
        git checkout ee28006553d4d23f600b0076ef6066710519f156
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   include/linux/printk.h:690:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:674:3: note: expanded from macro 'printk_ratelimi=
ted'
                   printk(fmt, ##__VA_ARGS__);                             \
                   ^
   include/linux/printk.h:480:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:451:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:426:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   include/linux/hid.h:1056:9: note: Access to field 'name' results in a de=
reference of a null pointer (loaded from variable 'input')
                                       input->name, c, type);
                                       ^
   include/linux/printk.h:690:49: note: expanded from macro 'pr_warn_rateli=
mited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                                          ^~~~~~~~~~~
   include/linux/printk.h:674:17: note: expanded from macro 'printk_ratelim=
ited'
                   printk(fmt, ##__VA_ARGS__);                             \
                                 ^~~~~~~~~~~
   include/linux/printk.h:480:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:452:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/hwmon/sht3x.c:268:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->temperature);
                  ^~~~~~~
   drivers/hwmon/sht3x.c:268:9: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->temperature);
                  ^~~~~~~
   drivers/hwmon/sht3x.c:279:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", data->humidity);
                  ^~~~~~~
   drivers/hwmon/sht3x.c:279:9: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", data->humidity);
                  ^~~~~~~
   drivers/hwmon/sht3x.c:356:2: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(position, commands->write_command, SHT3X_CMD_LENGTH);
           ^~~~~~
   drivers/hwmon/sht3x.c:356:2: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
           memcpy(position, commands->write_command, SHT3X_CMD_LENGTH);
           ^~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   drivers/input/joystick/magellan.c:144:2: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(magellan->phys, sizeof(magellan->phys), "%s/input0", se=
rio->phys);
           ^~~~~~~~
   drivers/input/joystick/magellan.c:144:2: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(magellan->phys, sizeof(magellan->phys), "%s/input0", se=
rio->phys);
           ^~~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   drivers/input/joystick/psxpad-spi.c:101:2: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(pad->sendbuf, PSX_CMD_ENTER_CFG, sizeof(PSX_CMD_ENTER_CFG=
));
           ^~~~~~
   drivers/input/joystick/psxpad-spi.c:101:2: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(pad->sendbuf, PSX_CMD_ENTER_CFG, sizeof(PSX_CMD_ENTER_CFG=
));
           ^~~~~~
   drivers/input/joystick/psxpad-spi.c:110:2: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(pad->sendbuf, PSX_CMD_ENABLE_MOTOR,
           ^~~~~~
   drivers/input/joystick/psxpad-spi.c:110:2: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(pad->sendbuf, PSX_CMD_ENABLE_MOTOR,
           ^~~~~~
   drivers/input/joystick/psxpad-spi.c:122:2: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(pad->sendbuf, PSX_CMD_EXIT_CFG, sizeof(PSX_CMD_EXIT_CFG));
           ^~~~~~
   drivers/input/joystick/psxpad-spi.c:122:2: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(pad->sendbuf, PSX_CMD_EXIT_CFG, sizeof(PSX_CMD_EXIT_CFG));
           ^~~~~~
   drivers/input/joystick/psxpad-spi.c:213:2: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(pad->sendbuf, PSX_CMD_POLL, sizeof(PSX_CMD_POLL));
           ^~~~~~
   drivers/input/joystick/psxpad-spi.c:213:2: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(pad->sendbuf, PSX_CMD_POLL, sizeof(PSX_CMD_POLL));
           ^~~~~~
   drivers/input/joystick/psxpad-spi.c:306:2: warning: Call to function 'sn=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(pad->phys, sizeof(pad->phys), "%s/input", dev_name(&spi=
->dev));
           ^~~~~~~~
   drivers/input/joystick/psxpad-spi.c:306:2: note: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(pad->phys, sizeof(pad->phys), "%s/input", dev_name(&spi=
->dev));
           ^~~~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
>> drivers/media/i2c/ov9282.c:1054:3: warning: Undefined or garbage value r=
eturned to caller [clang-analyzer-core.uninitialized.UndefReturn]
                   return ret;
                   ^      ~~~
   drivers/media/i2c/ov9282.c:1041:2: note: 'ret' declared without an initi=
al value
           int ret;
           ^~~~~~~
   drivers/media/i2c/ov9282.c:1044:6: note: Assuming 'ov9282' is non-null
           if (!ov9282)
               ^~~~~~~
   drivers/media/i2c/ov9282.c:1044:2: note: Taking false branch
           if (!ov9282)
           ^
   drivers/media/i2c/ov9282.c:1052:6: note: Assuming 'sensor_name' is null
           if (!sensor_name) {
               ^~~~~~~~~~~~
   drivers/media/i2c/ov9282.c:1052:2: note: Taking true branch
           if (!sensor_name) {
           ^
   drivers/media/i2c/ov9282.c:1053:3: note: Loop condition is false.  Exiti=
ng loop
                   dev_err(ov9282->dev, "Sensor name is missing");
                   ^
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##_=
_VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:447:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:426:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/media/i2c/ov9282.c:1054:3: note: Undefined or garbage value retu=
rned to caller
                   return ret;
                   ^      ~~~
   Suppressed 47 warnings (45 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (45 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/media/i2c/ov9650.c:606:3: warning: Value stored to 'ret' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   ret =3D ov965x_write(ov965x, REG_COM8, reg);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov9650.c:606:3: note: Value stored to 'ret' is never r=
ead
                   ret =3D ov965x_write(ov965x, REG_COM8, reg);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 46 warnings (45 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   drivers/media/i2c/rdacm21.c:373:11: warning: The left operand of '=3D=3D=
' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   if (val =3D=3D OV10640_ID_HIGH)
                           ^
   drivers/media/i2c/rdacm21.c:550:6: note: Assuming 'dev' is non-null
           if (!dev)
               ^~~~
   drivers/media/i2c/rdacm21.c:550:2: note: Taking false branch
           if (!dev)
           ^
   drivers/media/i2c/rdacm21.c:557:6: note: 'ret' is >=3D 0
           if (ret < 0) {
               ^~~
   drivers/media/i2c/rdacm21.c:557:2: note: Taking false branch
           if (ret < 0) {
           ^
   drivers/media/i2c/rdacm21.c:564:2: note: Taking false branch
           if (IS_ERR(dev->isp))
           ^
   drivers/media/i2c/rdacm21.c:567:8: note: Calling 'rdacm21_initialize'
           ret =3D rdacm21_initialize(dev);
                 ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/rdacm21.c:481:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/media/i2c/rdacm21.c:481:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/i2c/rdacm21.c:489:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/media/i2c/rdacm21.c:489:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/i2c/rdacm21.c:493:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/media/i2c/rdacm21.c:493:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/i2c/rdacm21.c:501:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/media/i2c/rdacm21.c:501:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/i2c/rdacm21.c:505:6: note: Assuming 'ret' is 0
           if (ret)

vim +1054 drivers/media/i2c/ov9282.c

ded4a31a12fead Alexander Stein  2022-07-28  1030  =

14ea315bbeb75a Martina Krasteva 2021-05-27  1031  /**
14ea315bbeb75a Martina Krasteva 2021-05-27  1032   * ov9282_probe() - I2C c=
lient device binding
14ea315bbeb75a Martina Krasteva 2021-05-27  1033   * @client: pointer to i2=
c client device
14ea315bbeb75a Martina Krasteva 2021-05-27  1034   *
14ea315bbeb75a Martina Krasteva 2021-05-27  1035   * Return: 0 if successfu=
l, error code otherwise.
14ea315bbeb75a Martina Krasteva 2021-05-27  1036   */
14ea315bbeb75a Martina Krasteva 2021-05-27  1037  static int ov9282_probe(s=
truct i2c_client *client)
14ea315bbeb75a Martina Krasteva 2021-05-27  1038  {
14ea315bbeb75a Martina Krasteva 2021-05-27  1039  	struct ov9282 *ov9282;
ee28006553d4d2 Alexander Stein  2022-07-28  1040  	const char *sensor_name;
14ea315bbeb75a Martina Krasteva 2021-05-27  1041  	int ret;
14ea315bbeb75a Martina Krasteva 2021-05-27  1042  =

14ea315bbeb75a Martina Krasteva 2021-05-27  1043  	ov9282 =3D devm_kzalloc(=
&client->dev, sizeof(*ov9282), GFP_KERNEL);
14ea315bbeb75a Martina Krasteva 2021-05-27  1044  	if (!ov9282)
14ea315bbeb75a Martina Krasteva 2021-05-27  1045  		return -ENOMEM;
14ea315bbeb75a Martina Krasteva 2021-05-27  1046  =

14ea315bbeb75a Martina Krasteva 2021-05-27  1047  	ov9282->dev =3D &client-=
>dev;
14ea315bbeb75a Martina Krasteva 2021-05-27  1048  =

14ea315bbeb75a Martina Krasteva 2021-05-27  1049  	/* Initialize subdev */
14ea315bbeb75a Martina Krasteva 2021-05-27  1050  	v4l2_i2c_subdev_init(&ov=
9282->sd, client, &ov9282_subdev_ops);
ee28006553d4d2 Alexander Stein  2022-07-28  1051  	sensor_name =3D device_g=
et_match_data(ov9282->dev);
ee28006553d4d2 Alexander Stein  2022-07-28  1052  	if (!sensor_name) {
ee28006553d4d2 Alexander Stein  2022-07-28  1053  		dev_err(ov9282->dev, "S=
ensor name is missing");
ee28006553d4d2 Alexander Stein  2022-07-28 @1054  		return ret;
ee28006553d4d2 Alexander Stein  2022-07-28  1055  	}
ee28006553d4d2 Alexander Stein  2022-07-28  1056  	v4l2_i2c_subdev_set_name=
(&ov9282->sd, client, sensor_name, NULL);
14ea315bbeb75a Martina Krasteva 2021-05-27  1057  =

14ea315bbeb75a Martina Krasteva 2021-05-27  1058  	ret =3D ov9282_parse_hw_=
config(ov9282);
14ea315bbeb75a Martina Krasteva 2021-05-27  1059  	if (ret) {
14ea315bbeb75a Martina Krasteva 2021-05-27  1060  		dev_err(ov9282->dev, "H=
W configuration is not supported");
14ea315bbeb75a Martina Krasteva 2021-05-27  1061  		return ret;
14ea315bbeb75a Martina Krasteva 2021-05-27  1062  	}
14ea315bbeb75a Martina Krasteva 2021-05-27  1063  =

ded4a31a12fead Alexander Stein  2022-07-28  1064  	ret =3D ov9282_get_regul=
ators(ov9282);
ded4a31a12fead Alexander Stein  2022-07-28  1065  	if (ret) {
ded4a31a12fead Alexander Stein  2022-07-28  1066  		dev_err(&client->dev, "=
Failed to get power regulators\n");
ded4a31a12fead Alexander Stein  2022-07-28  1067  		return ret;
ded4a31a12fead Alexander Stein  2022-07-28  1068  	}
ded4a31a12fead Alexander Stein  2022-07-28  1069  =

14ea315bbeb75a Martina Krasteva 2021-05-27  1070  	mutex_init(&ov9282->mute=
x);
14ea315bbeb75a Martina Krasteva 2021-05-27  1071  =

14ea315bbeb75a Martina Krasteva 2021-05-27  1072  	ret =3D ov9282_power_on(=
ov9282->dev);
14ea315bbeb75a Martina Krasteva 2021-05-27  1073  	if (ret) {
14ea315bbeb75a Martina Krasteva 2021-05-27  1074  		dev_err(ov9282->dev, "f=
ailed to power-on the sensor");
14ea315bbeb75a Martina Krasteva 2021-05-27  1075  		goto error_mutex_destro=
y;
14ea315bbeb75a Martina Krasteva 2021-05-27  1076  	}
14ea315bbeb75a Martina Krasteva 2021-05-27  1077  =

14ea315bbeb75a Martina Krasteva 2021-05-27  1078  	/* Check module identity=
 */
14ea315bbeb75a Martina Krasteva 2021-05-27  1079  	ret =3D ov9282_detect(ov=
9282);
14ea315bbeb75a Martina Krasteva 2021-05-27  1080  	if (ret) {
14ea315bbeb75a Martina Krasteva 2021-05-27  1081  		dev_err(ov9282->dev, "f=
ailed to find sensor: %d", ret);
14ea315bbeb75a Martina Krasteva 2021-05-27  1082  		goto error_power_off;
14ea315bbeb75a Martina Krasteva 2021-05-27  1083  	}
14ea315bbeb75a Martina Krasteva 2021-05-27  1084  =

14ea315bbeb75a Martina Krasteva 2021-05-27  1085  	/* Set default mode to m=
ax resolution */
14ea315bbeb75a Martina Krasteva 2021-05-27  1086  	ov9282->cur_mode =3D &su=
pported_mode;
14ea315bbeb75a Martina Krasteva 2021-05-27  1087  	ov9282->vblank =3D ov928=
2->cur_mode->vblank;
14ea315bbeb75a Martina Krasteva 2021-05-27  1088  =

14ea315bbeb75a Martina Krasteva 2021-05-27  1089  	ret =3D ov9282_init_cont=
rols(ov9282);
14ea315bbeb75a Martina Krasteva 2021-05-27  1090  	if (ret) {
14ea315bbeb75a Martina Krasteva 2021-05-27  1091  		dev_err(ov9282->dev, "f=
ailed to init controls: %d", ret);
14ea315bbeb75a Martina Krasteva 2021-05-27  1092  		goto error_power_off;
14ea315bbeb75a Martina Krasteva 2021-05-27  1093  	}
14ea315bbeb75a Martina Krasteva 2021-05-27  1094  =

14ea315bbeb75a Martina Krasteva 2021-05-27  1095  	/* Initialize subdev */
14ea315bbeb75a Martina Krasteva 2021-05-27  1096  	ov9282->sd.flags |=3D V4=
L2_SUBDEV_FL_HAS_DEVNODE;
14ea315bbeb75a Martina Krasteva 2021-05-27  1097  	ov9282->sd.entity.functi=
on =3D MEDIA_ENT_F_CAM_SENSOR;
14ea315bbeb75a Martina Krasteva 2021-05-27  1098  =

14ea315bbeb75a Martina Krasteva 2021-05-27  1099  	/* Initialize source pad=
 */
14ea315bbeb75a Martina Krasteva 2021-05-27  1100  	ov9282->pad.flags =3D ME=
DIA_PAD_FL_SOURCE;
14ea315bbeb75a Martina Krasteva 2021-05-27  1101  	ret =3D media_entity_pad=
s_init(&ov9282->sd.entity, 1, &ov9282->pad);
14ea315bbeb75a Martina Krasteva 2021-05-27  1102  	if (ret) {
14ea315bbeb75a Martina Krasteva 2021-05-27  1103  		dev_err(ov9282->dev, "f=
ailed to init entity pads: %d", ret);
14ea315bbeb75a Martina Krasteva 2021-05-27  1104  		goto error_handler_free;
14ea315bbeb75a Martina Krasteva 2021-05-27  1105  	}
14ea315bbeb75a Martina Krasteva 2021-05-27  1106  =

14ea315bbeb75a Martina Krasteva 2021-05-27  1107  	ret =3D v4l2_async_regis=
ter_subdev_sensor(&ov9282->sd);
14ea315bbeb75a Martina Krasteva 2021-05-27  1108  	if (ret < 0) {
14ea315bbeb75a Martina Krasteva 2021-05-27  1109  		dev_err(ov9282->dev,
14ea315bbeb75a Martina Krasteva 2021-05-27  1110  			"failed to register as=
ync subdev: %d", ret);
14ea315bbeb75a Martina Krasteva 2021-05-27  1111  		goto error_media_entity;
14ea315bbeb75a Martina Krasteva 2021-05-27  1112  	}
14ea315bbeb75a Martina Krasteva 2021-05-27  1113  =

14ea315bbeb75a Martina Krasteva 2021-05-27  1114  	pm_runtime_set_active(ov=
9282->dev);
14ea315bbeb75a Martina Krasteva 2021-05-27  1115  	pm_runtime_enable(ov9282=
->dev);
14ea315bbeb75a Martina Krasteva 2021-05-27  1116  	pm_runtime_idle(ov9282->=
dev);
14ea315bbeb75a Martina Krasteva 2021-05-27  1117  =

14ea315bbeb75a Martina Krasteva 2021-05-27  1118  	return 0;
14ea315bbeb75a Martina Krasteva 2021-05-27  1119  =

14ea315bbeb75a Martina Krasteva 2021-05-27  1120  error_media_entity:
14ea315bbeb75a Martina Krasteva 2021-05-27  1121  	media_entity_cleanup(&ov=
9282->sd.entity);
14ea315bbeb75a Martina Krasteva 2021-05-27  1122  error_handler_free:
14ea315bbeb75a Martina Krasteva 2021-05-27  1123  	v4l2_ctrl_handler_free(o=
v9282->sd.ctrl_handler);
14ea315bbeb75a Martina Krasteva 2021-05-27  1124  error_power_off:
14ea315bbeb75a Martina Krasteva 2021-05-27  1125  	ov9282_power_off(ov9282-=
>dev);
14ea315bbeb75a Martina Krasteva 2021-05-27  1126  error_mutex_destroy:
14ea315bbeb75a Martina Krasteva 2021-05-27  1127  	mutex_destroy(&ov9282->m=
utex);
14ea315bbeb75a Martina Krasteva 2021-05-27  1128  =

14ea315bbeb75a Martina Krasteva 2021-05-27  1129  	return ret;
14ea315bbeb75a Martina Krasteva 2021-05-27  1130  }
14ea315bbeb75a Martina Krasteva 2021-05-27  1131  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1788717996593199974==--

