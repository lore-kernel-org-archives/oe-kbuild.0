Content-Type: multipart/mixed; boundary="===============3754244590111333702=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c:158:3: warning: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments...
Date: Sun, 21 Nov 2021 20:29:46 +0800
Message-ID: <202111212044.NKlJgl66-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3754244590111333702==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mario Limonciello <mario.limonciello@dell.com>
CC: Hans de Goede <hdegoede@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   923dcc5eb0c111eccd51cc7ce1658537e3c38b25
commit: f1e1ea516721d1ea0b21327ff9e6cb2c2bb86e28 platform/x86: Move all del=
l drivers to their own subdirectory
date:   10 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 10 months ago
config: i386-randconfig-c001-20211016 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project a49f53=
86ce6b091da66ea7c3a1d9a588d53becf7)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df1e1ea516721d1ea0b21327ff9e6cb2c2bb86e28
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f1e1ea516721d1ea0b21327ff9e6cb2c2bb86e28
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           do {                                                            \
           ^
   kernel/events/core.c:10042:2: note: Loop condition is true.  Entering lo=
op body
           list_for_each_entry(filter, &ifh->list, entry) {
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   kernel/events/core.c:10043:7: note: Assuming field 'dentry' is non-null
                   if (filter->path.dentry) {
                       ^~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:10043:3: note: Taking true branch
                   if (filter->path.dentry) {
                   ^
   kernel/events/core.c:10051:35: note: Passing null pointer value via 2nd =
parameter 'mm'
                           perf_addr_filter_apply(filter, mm, &event->addr_=
filter_ranges[count]);
                                                          ^~
   kernel/events/core.c:10051:4: note: Calling 'perf_addr_filter_apply'
                           perf_addr_filter_apply(filter, mm, &event->addr_=
filter_ranges[count]);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:10004:13: note: Dereference of null pointer
           for (vma =3D mm->mmap; vma; vma =3D vma->vm_next) {
                      ^~~~~~~~
   kernel/events/core.c:11792:2: warning: Value stored to 'err' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           err =3D 0;
           ^     ~
   kernel/events/core.c:11792:2: note: Value stored to 'err' is never read
           err =3D 0;
           ^     ~
   Suppressed 5 warnings (3 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/iio/light/tsl2772.c:896:40: warning: The result of the left shif=
t is undefined because the left operand is negative [clang-analyzer-core.Un=
definedBinaryOperatorResult]
           chip->settings.prox_thres_high =3D (max << 1) - mean;
                                                 ^
   drivers/iio/light/tsl2772.c:1057:6: note: Assuming the condition is false
           if (kstrtobool(buf, &value) || !value)
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/tsl2772.c:1057:6: note: Left side of '||' is false
   drivers/iio/light/tsl2772.c:1057:33: note: Assuming 'value' is true
           if (kstrtobool(buf, &value) || !value)
                                          ^~~~~~
   drivers/iio/light/tsl2772.c:1057:2: note: Taking false branch
           if (kstrtobool(buf, &value) || !value)
           ^
   drivers/iio/light/tsl2772.c:1060:8: note: Calling 'tsl2772_prox_cal'
           ret =3D tsl2772_prox_cal(indio_dev);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/tsl2772.c:875:6: note: Assuming field 'prox_max_sample=
s_cal' is >=3D 1
           if (chip->settings.prox_max_samples_cal < 1 ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/tsl2772.c:875:6: note: Left side of '||' is false
   drivers/iio/light/tsl2772.c:876:6: note: Assuming field 'prox_max_sample=
s_cal' is <=3D MAX_SAMPLES_CAL
               chip->settings.prox_max_samples_cal > MAX_SAMPLES_CAL)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/tsl2772.c:875:2: note: Taking false branch
           if (chip->settings.prox_max_samples_cal < 1 ||
           ^
   drivers/iio/light/tsl2772.c:879:14: note: 'i' is < field 'prox_max_sampl=
es_cal'
           for (i =3D 0; i < chip->settings.prox_max_samples_cal; i++) {
                       ^
   drivers/iio/light/tsl2772.c:879:2: note: Loop condition is true.  Enteri=
ng loop body
           for (i =3D 0; i < chip->settings.prox_max_samples_cal; i++) {
           ^
   drivers/iio/light/tsl2772.c:882:7: note: 'ret' is >=3D 0
                   if (ret < 0)
                       ^~~
   drivers/iio/light/tsl2772.c:882:3: note: Taking false branch
                   if (ret < 0)
                   ^
   drivers/iio/light/tsl2772.c:879:14: note: Assuming 'i' is >=3D field 'pr=
ox_max_samples_cal'
           for (i =3D 0; i < chip->settings.prox_max_samples_cal; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/tsl2772.c:879:2: note: Loop condition is false. Execut=
ion continues on line 888
           for (i =3D 0; i < chip->settings.prox_max_samples_cal; i++) {
           ^
   drivers/iio/light/tsl2772.c:889:2: note: The value -2147483648 is assign=
ed to 'max'
           max =3D INT_MIN;
           ^~~~~~~~~~~~~
   drivers/iio/light/tsl2772.c:890:14: note: Assuming 'i' is >=3D field 'pr=
ox_max_samples_cal'
           for (i =3D 0; i < chip->settings.prox_max_samples_cal; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/tsl2772.c:890:2: note: Loop condition is false. Execut=
ion continues on line 894
           for (i =3D 0; i < chip->settings.prox_max_samples_cal; i++) {
           ^
   drivers/iio/light/tsl2772.c:896:40: note: The result of the left shift i=
s undefined because the left operand is negative
           chip->settings.prox_thres_high =3D (max << 1) - mean;
                                             ~~~ ^
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   fs/f2fs/super.c:937:4: warning: Call to function 'strcpy' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(ext[ext_cnt], name);
                           ^~~~~~
   fs/f2fs/super.c:937:4: note: Call to function 'strcpy' is insecure as it=
 does not provide bounding of the memory buffer. Replace unbounded copy fun=
ctions with analogous functions that support length arguments such as 'strl=
cpy'. CWE-119
                           strcpy(ext[ext_cnt], name);
                           ^~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c:158:3: warni=
ng: Call to function 'strcat' is insecure as it does not provide bounding o=
f the memory buffer. Replace unbounded copy functions with analogous functi=
ons that support length arguments such as 'strlcat'. CWE-119 [clang-analyze=
r-security.insecureAPI.strcpy]
                   strcat(wmi_priv.enumeration_data[instance_id].dell_value=
_modifier,
                   ^~~~~~
   drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c:158:3: note:=
 Call to function 'strcat' is insecure as it does not provide bounding of t=
he memory buffer. Replace unbounded copy functions with analogous functions=
 that support length arguments such as 'strlcat'. CWE-119
                   strcat(wmi_priv.enumeration_data[instance_id].dell_value=
_modifier,
                   ^~~~~~
   drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c:160:3: warni=
ng: Call to function 'strcat' is insecure as it does not provide bounding o=
f the memory buffer. Replace unbounded copy functions with analogous functi=
ons that support length arguments such as 'strlcat'. CWE-119 [clang-analyze=
r-security.insecureAPI.strcpy]
                   strcat(wmi_priv.enumeration_data[instance_id].dell_value=
_modifier, ";");
                   ^~~~~~
   drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c:160:3: note:=
 Call to function 'strcat' is insecure as it does not provide bounding of t=
he memory buffer. Replace unbounded copy functions with analogous functions=
 that support length arguments such as 'strlcat'. CWE-119
                   strcat(wmi_priv.enumeration_data[instance_id].dell_value=
_modifier, ";");
                   ^~~~~~
   drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c:166:3: warni=
ng: Call to function 'strcat' is insecure as it does not provide bounding o=
f the memory buffer. Replace unbounded copy functions with analogous functi=
ons that support length arguments such as 'strlcat'. CWE-119 [clang-analyze=
r-security.insecureAPI.strcpy]
                   strcat(wmi_priv.enumeration_data[instance_id].possible_v=
alues,
                   ^~~~~~
   drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c:166:3: note:=
 Call to function 'strcat' is insecure as it does not provide bounding of t=
he memory buffer. Replace unbounded copy functions with analogous functions=
 that support length arguments such as 'strlcat'. CWE-119
                   strcat(wmi_priv.enumeration_data[instance_id].possible_v=
alues,
                   ^~~~~~
   drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c:168:3: warni=
ng: Call to function 'strcat' is insecure as it does not provide bounding o=
f the memory buffer. Replace unbounded copy functions with analogous functi=
ons that support length arguments such as 'strlcat'. CWE-119 [clang-analyze=
r-security.insecureAPI.strcpy]
                   strcat(wmi_priv.enumeration_data[instance_id].possible_v=
alues, ";");
                   ^~~~~~
   drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c:168:3: note:=
 Call to function 'strcat' is insecure as it does not provide bounding of t=
he memory buffer. Replace unbounded copy functions with analogous functions=
 that support length arguments such as 'strlcat'. CWE-119
                   strcat(wmi_priv.enumeration_data[instance_id].possible_v=
alues, ";");
                   ^~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/iio/dac/ad5770r.c:133:8: warning: Excessive padding in 'struct a=
d5770r_state' (86 padding bytes, where 22 is optimal). =

   Optimal fields order: =

   transf_buf, =

   internal_ref, =

   external_res, =

   spi, =

   regmap, =

   vref_reg, =

   gpio_reset, =

   vref, =

   ch_pwr_down, =

   output_mode, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad5770r_state {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/iio/dac/ad5770r.c:133:8: note: Excessive padding in 'struct ad57=
70r_state' (86 padding bytes, where 22 is optimal). Optimal fields order: t=
ransf_buf, internal_ref, external_res, spi, regmap, vref_reg, gpio_reset, v=
ref, ch_pwr_down, output_mode, consider reordering the fields or adding exp=
licit padding members
   struct ad5770r_state {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/iio/dac/ad5770r.c:544:2: warning: Undefined or garbage value ret=
urned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^
   drivers/iio/dac/ad5770r.c:609:6: note: Assuming 'indio_dev' is non-null
           if (!indio_dev)
               ^~~~~~~~~~
   drivers/iio/dac/ad5770r.c:609:2: note: Taking false branch
           if (!indio_dev)
           ^
   drivers/iio/dac/ad5770r.c:618:2: note: Taking false branch
           if (IS_ERR(regmap)) {
           ^
   drivers/iio/dac/ad5770r.c:626:2: note: Taking false branch
           if (!IS_ERR(st->vref_reg)) {
           ^
   drivers/iio/dac/ad5770r.c:646:7: note: Assuming the condition is true
                   if (PTR_ERR(st->vref_reg) =3D=3D -ENODEV) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/dac/ad5770r.c:646:3: note: Taking true branch
                   if (PTR_ERR(st->vref_reg) =3D=3D -ENODEV) {
                   ^
   drivers/iio/dac/ad5770r.c:660:8: note: Calling 'ad5770r_init'
           ret =3D ad5770r_init(st);
                 ^~~~~~~~~~~~~~~~
   drivers/iio/dac/ad5770r.c:553:2: note: Taking false branch
           if (IS_ERR(st->gpio_reset))
           ^
   drivers/iio/dac/ad5770r.c:558:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/iio/dac/ad5770r.c:558:2: note: Taking false branch
           if (ret)
           ^
   drivers/iio/dac/ad5770r.c:562:8: note: Calling 'ad5770r_channel_config'
           ret =3D ad5770r_channel_config(st);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/dac/ad5770r.c:516:6: note: 'ret' declared without an initial=
 value
           int ret, tmp[2], min, max;
               ^~~
   drivers/iio/dac/ad5770r.c:521:6: note: Assuming 'num' is equal to AD5770=
R_MAX_CHANNELS
           if (num !=3D AD5770R_MAX_CHANNELS)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/dac/ad5770r.c:521:2: note: Taking false branch
           if (num !=3D AD5770R_MAX_CHANNELS)
           ^
   drivers/iio/dac/ad5770r.c:524:2: note: Loop condition is false. Executio=
n continues on line 544
           device_for_each_child_node(&st->spi->dev, child) {
           ^
   include/linux/property.h:111:2: note: expanded from macro 'device_for_ea=
ch_child_node'
           for (child =3D device_get_next_child_node(dev, NULL); child;    =
  \
--
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/iio/potentiometer/max5481.c:44:8: warning: Excessive padding in =
'struct max5481_data' (117 padding bytes, where 53 is optimal). =

   Optimal fields order: =

   msg, =

   spi, =

   cfg, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct max5481_data {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/potentiometer/max5481.c:44:8: note: Excessive padding in 'st=
ruct max5481_data' (117 padding bytes, where 53 is optimal). Optimal fields=
 order: msg, spi, cfg, consider reordering the fields or adding explicit pa=
dding members
   struct max5481_data {
   ~~~~~~~^~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/iio/potentiometer/mcp41010.c:58:8: warning: Excessive padding in=
 'struct mcp41010_data' (86 padding bytes, where 22 is optimal). =

   Optimal fields order: =

   buf, =

   spi, =

   cfg, =

   value, =

   lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct mcp41010_data {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/iio/potentiometer/mcp41010.c:58:8: note: Excessive padding in 's=
truct mcp41010_data' (86 padding bytes, where 22 is optimal). Optimal field=
s order: buf, spi, cfg, value, lock, consider reordering the fields or addi=
ng explicit padding members
   struct mcp41010_data {
   ~~~~~~~^~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/platform/x86/dell/dell-laptop.c:1596:4: warning: Value stored to=
 'unit' is never read [clang-analyzer-deadcode.DeadStores]
                           unit =3D KBD_TIMEOUT_SECONDS;
                           ^      ~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/dell/dell-laptop.c:1596:4: note: Value stored to 'u=
nit' is never read
                           unit =3D KBD_TIMEOUT_SECONDS;
                           ^      ~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/iio/frequency/adf4371.c:157:8: warning: Excessive padding in 'st=
ruct adf4371_state' (110 padding bytes, where 46 is optimal). =

   Optimal fields order: =

   buf, =

   spi, =

   regmap, =

   clkin, =

   chip_info, =

   clkin_freq, =

   fpfd, =

   integer, =

   fract1, =

   fract2, =

   mod2, =

   rf_div_sel, =

   ref_div_factor, =

   lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct adf4371_state {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/iio/frequency/adf4371.c:157:8: note: Excessive padding in 'struc=
t adf4371_state' (110 padding bytes, where 46 is optimal). Optimal fields o=
rder: buf, spi, regmap, clkin, chip_info, clkin_freq, fpfd, integer, fract1=
, fract2, mod2, rf_div_sel, ref_div_factor, lock, consider reordering the f=
ields or adding explicit padding members
   struct adf4371_state {
   ~~~~~~~^~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/leds/uleds.c:150:4: warning: Value stored to 'retval' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           retval =3D copy_to_user(buffer, &udev->brightnes=
s,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/uleds.c:150:4: note: Value stored to 'retval' is never read
                           retval =3D copy_to_user(buffer, &udev->brightnes=
s,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).

vim +158 drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c

e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  129  =

e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  130  /**
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  131   * populate_enum_data() - Populate all propertie=
s of an instance under enumeration attribute
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  132   * @enumeration_obj: ACPI object with enumeratio=
n data
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  133   * @instance_id: The instance to enumerate
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  134   * @attr_name_kobj: The parent kernel object
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  135   */
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  136  int populate_enum_data(union acpi_object *enumer=
ation_obj, int instance_id,
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  137  			struct kobject *attr_name_kobj)
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  138  {
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  139  	int i, next_obj, value_modifier_count, possible=
_values_count;
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  140  =

e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  141  	wmi_priv.enumeration_data[instance_id].attr_nam=
e_kobj =3D attr_name_kobj;
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  142  	strlcpy_attr(wmi_priv.enumeration_data[instance=
_id].attribute_name,
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  143  		enumeration_obj[ATTR_NAME].string.pointer);
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  144  	strlcpy_attr(wmi_priv.enumeration_data[instance=
_id].display_name_language_code,
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  145  		enumeration_obj[DISPL_NAME_LANG_CODE].string.p=
ointer);
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  146  	strlcpy_attr(wmi_priv.enumeration_data[instance=
_id].display_name,
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  147  		enumeration_obj[DISPLAY_NAME].string.pointer);
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  148  	strlcpy_attr(wmi_priv.enumeration_data[instance=
_id].default_value,
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  149  		enumeration_obj[DEFAULT_VAL].string.pointer);
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  150  	strlcpy_attr(wmi_priv.enumeration_data[instance=
_id].dell_modifier,
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  151  		enumeration_obj[MODIFIER].string.pointer);
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  152  =

e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  153  	next_obj =3D MODIFIER + 1;
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  154  =

e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  155  	value_modifier_count =3D (uintptr_t)enumeration=
_obj[next_obj].string.pointer;
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  156  =

e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  157  	for (i =3D 0; i < value_modifier_count; i++) {
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27 @158  		strcat(wmi_priv.enumeration_data[instance_id].=
dell_value_modifier,
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  159  			enumeration_obj[++next_obj].string.pointer);
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  160  		strcat(wmi_priv.enumeration_data[instance_id].=
dell_value_modifier, ";");
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  161  	}
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  162  =

e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  163  	possible_values_count =3D (uintptr_t) enumerati=
on_obj[++next_obj].string.pointer;
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  164  =

e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  165  	for (i =3D 0; i < possible_values_count; i++) {
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  166  		strcat(wmi_priv.enumeration_data[instance_id].=
possible_values,
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  167  			enumeration_obj[++next_obj].string.pointer);
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  168  		strcat(wmi_priv.enumeration_data[instance_id].=
possible_values, ";");
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  169  	}
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  170  =

e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  171  	return sysfs_create_group(attr_name_kobj, &enum=
eration_attr_group);
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  172  }
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  173  =


:::::: The code@line 158 was first introduced by commit
:::::: e8a60aa7404bfef37705da5607c97737073ac38d platform/x86: Introduce sup=
port for Systems Management Driver over WMI for Dell Systems

:::::: TO: Divya Bharathi <divya.bharathi@dell.com>
:::::: CC: Hans de Goede <hdegoede@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3754244590111333702==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3754244590111333702==--

