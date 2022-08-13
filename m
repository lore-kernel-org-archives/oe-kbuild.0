Content-Type: multipart/mixed; boundary="===============0447001366741370273=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hverkuil-media-tree:tegrav8 2/7] drivers/media/i2c/tc358840.c:1647:3: warning: Value stored to 'have_hdcp' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 13 Aug 2022 14:15:27 +0800
Message-ID: <202208131429.45nzEuBD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0447001366741370273==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/m=
edia/i2c/tc358840.c:1647:3: warning: Value stored to 'have_hdcp' is never r=
ead [clang-analyzer-deadcode.DeadStores]"
:::::: =


BCC: lkp(a)intel.com
CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Hans Verkuil <hverkuil@xs4all.nl>

tree:   git://linuxtv.org/hverkuil/media_tree.git tegrav8
head:   386823032a34ce7926c18033b0ca34de9145a206
commit: f51f9140626da0e72ade6bd437ac2fe13e9b0425 [2/7] tc358840: add Toshib=
a tc358840 HDMI-to-CSI bridge.
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
config: mips-randconfig-c004-20220808 (https://download.01.org/0day-ci/arch=
ive/20220813/202208131429.45nzEuBD-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e=
2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        git remote add hverkuil-media-tree git://linuxtv.org/hverkuil/media=
_tree.git
        git fetch --no-tags hverkuil-media-tree tegrav8
        git checkout f51f9140626da0e72ade6bd437ac2fe13e9b0425
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)
                                                                    ^
   arch/mips/include/asm/bitops.h:390:44: note: Left side of '&&' is false
               __builtin_constant_p(cpu_has_clo_clz) && cpu_has_clo_clz) {
                                                     ^
   arch/mips/include/asm/bitops.h:402:2: note: The value 32 is assigned to =
'r'
           r =3D 32;
           ^~~~~~
   arch/mips/include/asm/bitops.h:403:6: note: Assuming 'x' is not equal to=
 0, which participates in a condition later
           if (!x)
               ^~
   arch/mips/include/asm/bitops.h:403:2: note: Taking false branch
           if (!x)
           ^
   arch/mips/include/asm/bitops.h:405:6: note: Assuming the condition is fa=
lse
           if (!(x & 0xffff0000u)) {
               ^~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/bitops.h:405:2: note: Taking false branch
           if (!(x & 0xffff0000u)) {
           ^
   arch/mips/include/asm/bitops.h:409:6: note: Assuming the condition is fa=
lse
           if (!(x & 0xff000000u)) {
               ^~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/bitops.h:409:2: note: Taking false branch
           if (!(x & 0xff000000u)) {
           ^
   arch/mips/include/asm/bitops.h:413:6: note: Assuming the condition is fa=
lse
           if (!(x & 0xf0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/bitops.h:413:2: note: Taking false branch
           if (!(x & 0xf0000000u)) {
           ^
   arch/mips/include/asm/bitops.h:417:6: note: Assuming the condition is fa=
lse
           if (!(x & 0xc0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/bitops.h:417:2: note: Taking false branch
           if (!(x & 0xc0000000u)) {
           ^
   arch/mips/include/asm/bitops.h:421:6: note: Assuming the condition is fa=
lse
           if (!(x & 0x80000000u)) {
               ^~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/bitops.h:421:2: note: Taking false branch
           if (!(x & 0x80000000u)) {
           ^
   arch/mips/include/asm/bitops.h:425:2: note: Returning the value 32 (load=
ed from 'r')
           return r;
           ^~~~~~~~
   sound/soc/codecs/wsa881x.c:749:28: note: Returning from 'fls'
           unsigned int mask =3D (1 << fls(max)) - 1;
                                     ^~~~~~~~
   sound/soc/codecs/wsa881x.c:749:25: note: The result of the left shift is=
 undefined due to shifting by '32', which is greater or equal to the width =
of type 'int'
           unsigned int mask =3D (1 << fls(max)) - 1;
                                  ^  ~~~~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   drivers/media/i2c/tc358743.c:310:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(timings, 0, sizeof(struct v4l2_dv_timings));
           ^~~~~~
   drivers/media/i2c/tc358743.c:310:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(timings, 0, sizeof(struct v4l2_dv_timings));
           ^~~~~~
   drivers/media/i2c/tc358743.c:1192:4: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(&state->timings, 0, sizeof(state->timings=
));
                           ^~~~~~
   drivers/media/i2c/tc358743.c:1192:4: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
                           memset(&state->timings, 0, sizeof(state->timings=
));
                           ^~~~~~
   drivers/media/i2c/tc358743.c:1728:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(edid->reserved, 0, sizeof(edid->reserved));
           ^~~~~~
   drivers/media/i2c/tc358743.c:1728:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(edid->reserved, 0, sizeof(edid->reserved));
           ^~~~~~
   drivers/media/i2c/tc358743.c:1766:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(edid->reserved, 0, sizeof(edid->reserved));
           ^~~~~~
   drivers/media/i2c/tc358743.c:1766:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(edid->reserved, 0, sizeof(edid->reserved));
           ^~~~~~
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   drivers/media/i2c/tc358840.c:1324:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(timings, 0, sizeof(struct v4l2_dv_timings));
           ^~~~~~
   drivers/media/i2c/tc358840.c:1324:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(timings, 0, sizeof(struct v4l2_dv_timings));
           ^~~~~~
   drivers/media/i2c/tc358840.c:1382:3: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(timings, 0, sizeof(struct v4l2_dv_timings));
                   ^~~~~~
   drivers/media/i2c/tc358840.c:1382:3: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
                   memset(timings, 0, sizeof(struct v4l2_dv_timings));
                   ^~~~~~
   drivers/media/i2c/tc358840.c:1387:3: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(timings, 0, sizeof(struct v4l2_dv_timings));
                   ^~~~~~
   drivers/media/i2c/tc358840.c:1387:3: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
                   memset(timings, 0, sizeof(struct v4l2_dv_timings));
                   ^~~~~~
>> drivers/media/i2c/tc358840.c:1647:3: warning: Value stored to 'have_hdcp=
' is never read [clang-analyzer-deadcode.DeadStores]
                   have_hdcp =3D !(i2c_rd8(sd, HDCP_MODE) &
                   ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/tc358840.c:1647:3: note: Value stored to 'have_hdcp' i=
s never read
                   have_hdcp =3D !(i2c_rd8(sd, HDCP_MODE) &
                   ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/tc358840.c:2221:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(edid->reserved, 0, sizeof(edid->reserved));
           ^~~~~~
   drivers/media/i2c/tc358840.c:2221:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(edid->reserved, 0, sizeof(edid->reserved));
           ^~~~~~
   drivers/media/i2c/tc358840.c:2261:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(edid->reserved, 0, sizeof(edid->reserved));
           ^~~~~~
   drivers/media/i2c/tc358840.c:2261:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(edid->reserved, 0, sizeof(edid->reserved));
           ^~~~~~
   drivers/media/i2c/tc358840.c:2377:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(timings->bt.reserved, 0, sizeof(timings->bt.reserved));
           ^~~~~~
   drivers/media/i2c/tc358840.c:2377:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(timings->bt.reserved, 0, sizeof(timings->bt.reserved));
           ^~~~~~
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   sound/soc/codecs/rt711-sdw.c:410:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&rt711->params, params, sizeof(*params));
           ^~~~~~
   sound/soc/codecs/rt711-sdw.c:410:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(&rt711->params, params, sizeof(*params));
           ^~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   sound/soc/codecs/sigmadsp.c:146:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ctrl->cache, data, ctrl->num_bytes);
                   ^~~~~~
   sound/soc/codecs/sigmadsp.c:146:3: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(ctrl->cache, data, ctrl->num_bytes);
                   ^~~~~~
   sound/soc/codecs/sigmadsp.c:173:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ucontrol->value.bytes.data, ctrl->cache,
                   ^~~~~~
   sound/soc/codecs/sigmadsp.c:173:3: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(ucontrol->value.bytes.data, ctrl->cache,
                   ^~~~~~
   sound/soc/codecs/sigmadsp.c:235:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(name, ctrl_chunk->name, name_len);
           ^~~~~~
   sound/soc/codecs/sigmadsp.c:235:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(name, ctrl_chunk->name, name_len);
           ^~~~~~
   sound/soc/codecs/sigmadsp.c:282:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(data->data, data_chunk->data, length);
           ^~~~~~
   sound/soc/codecs/sigmadsp.c:282:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(data->data, data_chunk->data, length);
           ^~~~~~
   sound/soc/codecs/sigmadsp.c:424:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(data->data, sa->payload, data->length);
                   ^~~~~~
   sound/soc/codecs/sigmadsp.c:424:3: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(data->data, sa->payload, data->length);
                   ^~~~~~
   sound/soc/codecs/sigmadsp.c:649:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&template, 0, sizeof(template));
           ^~~~~~
   sound/soc/codecs/sigmadsp.c:649:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(&template, 0, sizeof(template));
           ^~~~~~
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   drivers/soundwire/debugfs.c:22:2: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(name, sizeof(name), "master-%d-%d", bus->id, bus->link_=
id);
           ^~~~~~~~
   drivers/soundwire/debugfs.c:22:2: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
           snprintf(name, sizeof(name), "master-%d-%d", bus->id, bus->link_=
id);
           ^~~~~~~~
   drivers/soundwire/debugfs.c:130:2: warning: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(name, sizeof(name), "%s", dev_name(&slave->dev));

vim +/have_hdcp +1647 drivers/media/i2c/tc358840.c

f51f9140626da0 Hans Verkuil 2020-02-21  1608  =

f51f9140626da0 Hans Verkuil 2020-02-21  1609  static void tc358840_delayed_=
work_poll(struct work_struct *work)
f51f9140626da0 Hans Verkuil 2020-02-21  1610  {
f51f9140626da0 Hans Verkuil 2020-02-21  1611  	struct delayed_work *dwork =
=3D to_delayed_work(work);
f51f9140626da0 Hans Verkuil 2020-02-21  1612  	struct tc358840_state *state=
 =3D container_of(dwork,
f51f9140626da0 Hans Verkuil 2020-02-21  1613  		struct tc358840_state, dela=
yed_work_poll);
f51f9140626da0 Hans Verkuil 2020-02-21  1614  	struct v4l2_subdev *sd =3D &=
state->sd;
f51f9140626da0 Hans Verkuil 2020-02-21  1615  	u8 sys_status;
f51f9140626da0 Hans Verkuil 2020-02-21  1616  	bool have_5v;
f51f9140626da0 Hans Verkuil 2020-02-21  1617  	bool have_tmds;
f51f9140626da0 Hans Verkuil 2020-02-21  1618  	bool have_sync;
f51f9140626da0 Hans Verkuil 2020-02-21  1619  	bool have_signal;
f51f9140626da0 Hans Verkuil 2020-02-21  1620  	bool have_hdcp;
f51f9140626da0 Hans Verkuil 2020-02-21  1621  	unsigned int format_change =
=3D 0;
f51f9140626da0 Hans Verkuil 2020-02-21  1622  =

f51f9140626da0 Hans Verkuil 2020-02-21  1623  	mutex_lock(&state->lock);
f51f9140626da0 Hans Verkuil 2020-02-21  1624  =

f51f9140626da0 Hans Verkuil 2020-02-21  1625  	sys_status =3D i2c_rd8(sd, S=
YS_STATUS);
f51f9140626da0 Hans Verkuil 2020-02-21  1626  	have_5v =3D state->test_patt=
ern || (sys_status & MASK_S_DDC5V);
f51f9140626da0 Hans Verkuil 2020-02-21  1627  	have_tmds =3D state->test_pa=
ttern || (sys_status & MASK_S_TMDS);
f51f9140626da0 Hans Verkuil 2020-02-21  1628  	have_sync =3D state->test_pa=
ttern || (sys_status & MASK_S_SYNC);
f51f9140626da0 Hans Verkuil 2020-02-21  1629  	have_signal =3D have_5v && h=
ave_tmds && have_sync;
f51f9140626da0 Hans Verkuil 2020-02-21  1630  	have_hdcp =3D have_signal ? =
(sys_status & MASK_S_HDCP) : false;
f51f9140626da0 Hans Verkuil 2020-02-21  1631  =

f51f9140626da0 Hans Verkuil 2020-02-21  1632  	tc358840_check_5v(sd, have_5=
v);
f51f9140626da0 Hans Verkuil 2020-02-21  1633  	if (have_hdcp) {
f51f9140626da0 Hans Verkuil 2020-02-21  1634  		/*
f51f9140626da0 Hans Verkuil 2020-02-21  1635  		 * MASK_S_HDCP can be 1 for=
 a short time when connecting
f51f9140626da0 Hans Verkuil 2020-02-21  1636  		 * or disconnecting: the HD=
CP authentication will kick in
f51f9140626da0 Hans Verkuil 2020-02-21  1637  		 * when that happens and th=
us MASK_S_HDCP becomes 1 until
f51f9140626da0 Hans Verkuil 2020-02-21  1638  		 * the authentication fails=
 and it is cleared again.
f51f9140626da0 Hans Verkuil 2020-02-21  1639  		 *
f51f9140626da0 Hans Verkuil 2020-02-21  1640  		 * So if it is set, then do=
uble check that the HDCP_MODE
f51f9140626da0 Hans Verkuil 2020-02-21  1641  		 * is in manual authenticat=
ion mode, because then we know
f51f9140626da0 Hans Verkuil 2020-02-21  1642  		 * the authentication will =
fail and this is just a glitch.
f51f9140626da0 Hans Verkuil 2020-02-21  1643  		 *
f51f9140626da0 Hans Verkuil 2020-02-21  1644  		 * Don't rely on some globa=
l setting, actually read the
f51f9140626da0 Hans Verkuil 2020-02-21  1645  		 * register here. This in c=
ase someone has been hacking.
f51f9140626da0 Hans Verkuil 2020-02-21  1646  		 */
f51f9140626da0 Hans Verkuil 2020-02-21 @1647  		have_hdcp =3D !(i2c_rd8(sd,=
 HDCP_MODE) &
f51f9140626da0 Hans Verkuil 2020-02-21  1648  			      MASK_MANUAL_AUTHENTI=
CATION);
f51f9140626da0 Hans Verkuil 2020-02-21  1649  	}
f51f9140626da0 Hans Verkuil 2020-02-21  1650  =

f51f9140626da0 Hans Verkuil 2020-02-21  1651  	if (!have_5v) {
f51f9140626da0 Hans Verkuil 2020-02-21  1652  		state->invalid_eq_bypass[0]=
 =3D false;
f51f9140626da0 Hans Verkuil 2020-02-21  1653  		state->invalid_eq_bypass[1]=
 =3D false;
f51f9140626da0 Hans Verkuil 2020-02-21  1654  	}
f51f9140626da0 Hans Verkuil 2020-02-21  1655  	if (state->test_pattern) {
f51f9140626da0 Hans Verkuil 2020-02-21  1656  		state->found_stable_signal =
=3D true;
f51f9140626da0 Hans Verkuil 2020-02-21  1657  		state->status =3D STATUS_ST=
ABLE_SIGNAL;
f51f9140626da0 Hans Verkuil 2020-02-21  1658  	} else {
f51f9140626da0 Hans Verkuil 2020-02-21  1659  		u8 sys_int =3D i2c_rd8(sd, =
SYS_INT);
f51f9140626da0 Hans Verkuil 2020-02-21  1660  		u8 clk_int =3D i2c_rd8(sd, =
CLK_INT);
f51f9140626da0 Hans Verkuil 2020-02-21  1661  		u8 misc_int =3D i2c_rd8(sd,=
 MISC_INT);
f51f9140626da0 Hans Verkuil 2020-02-21  1662  		bool was_stable =3D state->=
found_stable_signal;
f51f9140626da0 Hans Verkuil 2020-02-21  1663  =

f51f9140626da0 Hans Verkuil 2020-02-21  1664  		i2c_wr8(sd, MISC_INT, 0xff);
f51f9140626da0 Hans Verkuil 2020-02-21  1665  		i2c_wr8(sd, CLK_INT, 0xff);
f51f9140626da0 Hans Verkuil 2020-02-21  1666  		i2c_wr8(sd, SYS_INT, 0xff);
f51f9140626da0 Hans Verkuil 2020-02-21  1667  		v4l2_dbg(2, debug, sd,
f51f9140626da0 Hans Verkuil 2020-02-21  1668  			 "%s: sys_stat: %02x misc_=
int: %02x clk_int: %02x sys_int: %02x eq_byps: %s\n",
f51f9140626da0 Hans Verkuil 2020-02-21  1669  			 __func__, sys_status, mis=
c_int, clk_int, sys_int,
f51f9140626da0 Hans Verkuil 2020-02-21  1670  			 state->eq_bypass ? "on" :=
 "off");
f51f9140626da0 Hans Verkuil 2020-02-21  1671  =

f51f9140626da0 Hans Verkuil 2020-02-21  1672  		if (!have_sync)
f51f9140626da0 Hans Verkuil 2020-02-21  1673  			format_change |=3D 1;
f51f9140626da0 Hans Verkuil 2020-02-21  1674  		if (sys_int & (MASK_DVI | M=
ASK_HDMI))
f51f9140626da0 Hans Verkuil 2020-02-21  1675  			format_change |=3D 2;
f51f9140626da0 Hans Verkuil 2020-02-21  1676  		if (clk_int & (MASK_IN_DE_C=
HG))
f51f9140626da0 Hans Verkuil 2020-02-21  1677  			format_change |=3D 4;
f51f9140626da0 Hans Verkuil 2020-02-21  1678  		if (misc_int & (MASK_SYNC_C=
HG))
f51f9140626da0 Hans Verkuil 2020-02-21  1679  			format_change |=3D 8;
f51f9140626da0 Hans Verkuil 2020-02-21  1680  =

f51f9140626da0 Hans Verkuil 2020-02-21  1681  		if (sys_int & MASK_HDMI) {
f51f9140626da0 Hans Verkuil 2020-02-21  1682  			v4l2_dbg(1, debug, sd, "%s=
: DVI->HDMI change detected\n",
f51f9140626da0 Hans Verkuil 2020-02-21  1683  				 __func__);
f51f9140626da0 Hans Verkuil 2020-02-21  1684  =

f51f9140626da0 Hans Verkuil 2020-02-21  1685  			i2c_wr8(sd, APPL_CTL, MASK=
_APLL_CPCTL_NORMAL | MASK_APLL_ON);
f51f9140626da0 Hans Verkuil 2020-02-21  1686  		}
f51f9140626da0 Hans Verkuil 2020-02-21  1687  		if (sys_int & MASK_DVI) {
f51f9140626da0 Hans Verkuil 2020-02-21  1688  			v4l2_dbg(1, debug, sd, "%s=
: HDMI->DVI change detected\n",
f51f9140626da0 Hans Verkuil 2020-02-21  1689  				 __func__);
f51f9140626da0 Hans Verkuil 2020-02-21  1690  		}
f51f9140626da0 Hans Verkuil 2020-02-21  1691  		if (!have_signal) {
f51f9140626da0 Hans Verkuil 2020-02-21  1692  			if (state->status !=3D STA=
TUS_FIND_SIGNAL)
f51f9140626da0 Hans Verkuil 2020-02-21  1693  				v4l2_info(sd, "no signal =
for EQ_BYPS %d\n",
f51f9140626da0 Hans Verkuil 2020-02-21  1694  					  state->eq_bypass);
f51f9140626da0 Hans Verkuil 2020-02-21  1695  			state->status =3D STATUS_F=
IND_SIGNAL;
f51f9140626da0 Hans Verkuil 2020-02-21  1696  			state->found_signal_cnt[0]=
 =3D 0;
f51f9140626da0 Hans Verkuil 2020-02-21  1697  			state->found_signal_cnt[1]=
 =3D 0;
f51f9140626da0 Hans Verkuil 2020-02-21  1698  			if (state->enabled)
f51f9140626da0 Hans Verkuil 2020-02-21  1699  				enable_stream(sd, false);
f51f9140626da0 Hans Verkuil 2020-02-21  1700  			if (state->found_stable_si=
gnal) {
f51f9140626da0 Hans Verkuil 2020-02-21  1701  				state->found_stable_signa=
l =3D false;
f51f9140626da0 Hans Verkuil 2020-02-21  1702  				v4l2_subdev_notify_event(=
sd, &tc358840_ev_fmt);
f51f9140626da0 Hans Verkuil 2020-02-21  1703  				v4l2_info(sd, "event: no =
signal (SYS_STATUS 0x%02x)\n",
f51f9140626da0 Hans Verkuil 2020-02-21  1704  					  sys_status);
f51f9140626da0 Hans Verkuil 2020-02-21  1705  			}
f51f9140626da0 Hans Verkuil 2020-02-21  1706  			state->detected_timings.bt=
.width =3D 0;
f51f9140626da0 Hans Verkuil 2020-02-21  1707  		}
f51f9140626da0 Hans Verkuil 2020-02-21  1708  		/*
f51f9140626da0 Hans Verkuil 2020-02-21  1709  		 * Reset the HDMI PHY to tr=
y to trigger proper lock on the
f51f9140626da0 Hans Verkuil 2020-02-21  1710  		 * incoming video format. E=
rase BKSV to prevent that old keys
f51f9140626da0 Hans Verkuil 2020-02-21  1711  		 * are used when a new sour=
ce is connected.
f51f9140626da0 Hans Verkuil 2020-02-21  1712  		 */
f51f9140626da0 Hans Verkuil 2020-02-21  1713  		if (have_5v && (format_chan=
ge & 0xa) && !have_signal) {
f51f9140626da0 Hans Verkuil 2020-02-21  1714  			if (have_tmds)
f51f9140626da0 Hans Verkuil 2020-02-21  1715  				v4l2_dbg(was_stable ? 0 :=
 1, debug, sd,
f51f9140626da0 Hans Verkuil 2020-02-21  1716  					 "reset due to format_ch=
ange (%x)\n",
f51f9140626da0 Hans Verkuil 2020-02-21  1717  					 format_change);
f51f9140626da0 Hans Verkuil 2020-02-21  1718  			tc358840_reset_phy(sd);
f51f9140626da0 Hans Verkuil 2020-02-21  1719  		}
f51f9140626da0 Hans Verkuil 2020-02-21  1720  	}
f51f9140626da0 Hans Verkuil 2020-02-21  1721  =

f51f9140626da0 Hans Verkuil 2020-02-21  1722  	if (have_signal) {
f51f9140626da0 Hans Verkuil 2020-02-21  1723  		struct v4l2_dv_timings timi=
ngs =3D { };
f51f9140626da0 Hans Verkuil 2020-02-21  1724  =

f51f9140626da0 Hans Verkuil 2020-02-21  1725  		/*
f51f9140626da0 Hans Verkuil 2020-02-21  1726  		 * If we don't have detecte=
d_timings, or something changed, then
f51f9140626da0 Hans Verkuil 2020-02-21  1727  		 * detect timings.
f51f9140626da0 Hans Verkuil 2020-02-21  1728  		 */
f51f9140626da0 Hans Verkuil 2020-02-21  1729  		if (format_change || !state=
->detected_timings.bt.width)
f51f9140626da0 Hans Verkuil 2020-02-21  1730  			tc358840_get_detected_timi=
ngs(sd, &timings);
f51f9140626da0 Hans Verkuil 2020-02-21  1731  		else
f51f9140626da0 Hans Verkuil 2020-02-21  1732  			timings =3D state->detecte=
d_timings;
f51f9140626da0 Hans Verkuil 2020-02-21  1733  =

f51f9140626da0 Hans Verkuil 2020-02-21  1734  		/*
f51f9140626da0 Hans Verkuil 2020-02-21  1735  		 * Store newly detected tim=
ings (if any) if we detect timings
f51f9140626da0 Hans Verkuil 2020-02-21  1736  		 * for the first time, or i=
f the sync toggled, or if the
f51f9140626da0 Hans Verkuil 2020-02-21  1737  		 * DVI/HDMI mode changed.
f51f9140626da0 Hans Verkuil 2020-02-21  1738  		 */
f51f9140626da0 Hans Verkuil 2020-02-21  1739  		if (!state->detected_timing=
s.bt.width || (format_change & 3)) {
f51f9140626da0 Hans Verkuil 2020-02-21  1740  			state->detected_timings =
=3D timings;
f51f9140626da0 Hans Verkuil 2020-02-21  1741  		/*
f51f9140626da0 Hans Verkuil 2020-02-21  1742  		 * Silently accept SYNC/DE =
changes if the timings stay the same,
f51f9140626da0 Hans Verkuil 2020-02-21  1743  		 * i.e. if only blanking ch=
anged.
f51f9140626da0 Hans Verkuil 2020-02-21  1744  		 */
f51f9140626da0 Hans Verkuil 2020-02-21  1745  		} else if (format_change &&
f51f9140626da0 Hans Verkuil 2020-02-21  1746  			   tc358840_match_dv_timin=
gs(&state->detected_timings,
f51f9140626da0 Hans Verkuil 2020-02-21  1747  						     &timings, 250000))=
 {
f51f9140626da0 Hans Verkuil 2020-02-21  1748  			v4l2_dbg(1, debug, sd, "ig=
nore timings change\n");
f51f9140626da0 Hans Verkuil 2020-02-21  1749  			format_change =3D 0;
f51f9140626da0 Hans Verkuil 2020-02-21  1750  		} else {
f51f9140626da0 Hans Verkuil 2020-02-21  1751  			state->detected_timings =
=3D timings;
f51f9140626da0 Hans Verkuil 2020-02-21  1752  		}
f51f9140626da0 Hans Verkuil 2020-02-21  1753  		have_signal =3D state->dete=
cted_timings.bt.width;
f51f9140626da0 Hans Verkuil 2020-02-21  1754  	}
f51f9140626da0 Hans Verkuil 2020-02-21  1755  =

f51f9140626da0 Hans Verkuil 2020-02-21  1756  	if (!state->test_pattern && =
have_5v) {
f51f9140626da0 Hans Verkuil 2020-02-21  1757  		switch (state->status) {
f51f9140626da0 Hans Verkuil 2020-02-21  1758  		case STATUS_FIND_SIGNAL:
f51f9140626da0 Hans Verkuil 2020-02-21  1759  			tc358840_find_signal(sd, h=
ave_signal);
f51f9140626da0 Hans Verkuil 2020-02-21  1760  			break;
f51f9140626da0 Hans Verkuil 2020-02-21  1761  		case STATUS_FOUND_SIGNAL:
f51f9140626da0 Hans Verkuil 2020-02-21  1762  			tc358840_found_signal(sd, =
have_signal, format_change);
f51f9140626da0 Hans Verkuil 2020-02-21  1763  			break;
f51f9140626da0 Hans Verkuil 2020-02-21  1764  		case STATUS_STABLE_SIGNAL:
f51f9140626da0 Hans Verkuil 2020-02-21  1765  			tc358840_format_change(sd,=
 have_signal, format_change);
f51f9140626da0 Hans Verkuil 2020-02-21  1766  			break;
f51f9140626da0 Hans Verkuil 2020-02-21  1767  		}
f51f9140626da0 Hans Verkuil 2020-02-21  1768  	}
f51f9140626da0 Hans Verkuil 2020-02-21  1769  	mutex_unlock(&state->lock);
f51f9140626da0 Hans Verkuil 2020-02-21  1770  	v4l2_ctrl_s_ctrl(state->tmds=
_present_ctrl, have_signal);
f51f9140626da0 Hans Verkuil 2020-02-21  1771  	v4l2_ctrl_s_ctrl(state->dete=
ct_tx_5v_ctrl, have_5v);
f51f9140626da0 Hans Verkuil 2020-02-21  1772  	v4l2_ctrl_s_ctrl(state->audi=
o_present_ctrl, audio_present(sd));
f51f9140626da0 Hans Verkuil 2020-02-21  1773  =

f51f9140626da0 Hans Verkuil 2020-02-21  1774  	if (have_signal)
f51f9140626da0 Hans Verkuil 2020-02-21  1775  		v4l2_ctrl_s_ctrl(state->aud=
io_sampling_rate_ctrl,
f51f9140626da0 Hans Verkuil 2020-02-21  1776  				 get_audio_sampling_rate(=
sd));
f51f9140626da0 Hans Verkuil 2020-02-21  1777  =

f51f9140626da0 Hans Verkuil 2020-02-21  1778  	if (!state->delayed_work_sto=
p_polling)
f51f9140626da0 Hans Verkuil 2020-02-21  1779  		schedule_delayed_work(&stat=
e->delayed_work_poll, POLL_PERIOD);
f51f9140626da0 Hans Verkuil 2020-02-21  1780  }
f51f9140626da0 Hans Verkuil 2020-02-21  1781  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0447001366741370273==--

