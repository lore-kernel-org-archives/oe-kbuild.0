Content-Type: multipart/mixed; boundary="===============3086069447881626365=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [lpieralisi:for-review/acpi-iort-id-rework 8/12] include/linux/of_irq.h:89:1: sparse: sparse: missing identifier in declaration
Date: Wed, 20 May 2020 02:52:35 +0800
Message-ID: <202005200228.cCrQcMlm%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3086069447881626365==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.gi=
t for-review/acpi-iort-id-rework
head:   256fa832fa39c30c478cdc08dcd1919b89099329
commit: a3954ee26a962f1d086cfdaa4bd1a83b1f8c7f5c [8/12] of/irq: make of_msi=
_map_get_device_domain() bus agnostic
config: m68k-randconfig-s001-20200519 (attached as .config)
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-193-gb8fad4bc-dirty
        git checkout a3954ee26a962f1d086cfdaa4bd1a83b1f8c7f5c
        # save the attached .config to linux build tree
        make C=3D1 ARCH=3Dm68k CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 10 hours ago
:::::: commit date: 32 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> include/linux/of_irq.h:89:1: sparse: sparse: missing identifier in decla=
ration
   include/linux/of_irq.h:89:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:89:1: sparse: sparse: got {
   include/linux/of_irq.h:91:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:91:1: sparse: sparse: got }
   include/linux/of_irq.h:99:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:99:1: sparse: sparse: got }
   include/linux/of_irq.h:115:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/of_irq.h:115:1: sparse: sparse: got }
   include/linux/node.h:36:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/node.h:36:1: sparse: sparse: got }
--
>> include/linux/of_irq.h:89:1: sparse: sparse: missing identifier in decla=
ration
   include/linux/of_irq.h:89:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:89:1: sparse: sparse: got {
   include/linux/of_irq.h:91:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:91:1: sparse: sparse: got }
   include/linux/of_irq.h:99:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:99:1: sparse: sparse: got }
   include/linux/of_irq.h:115:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/of_irq.h:115:1: sparse: sparse: got }
   drivers/mfd/wcd934x.c:183:57: sparse: sparse: undefined identifier 'wcd9=
34x_devices'
--
>> include/linux/of_irq.h:89:1: sparse: sparse: missing identifier in decla=
ration
   include/linux/of_irq.h:89:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:89:1: sparse: sparse: got {
   include/linux/of_irq.h:91:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:91:1: sparse: sparse: got }
   include/linux/of_irq.h:99:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:99:1: sparse: sparse: got }
   include/linux/of_irq.h:115:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/of_irq.h:115:1: sparse: sparse: got }
   include/linux/ftrace_irq.h:26:1: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/ftrace_irq.h:26:1: sparse: sparse: got }
   include/linux/ftrace_irq.h:35:1: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/ftrace_irq.h:35:1: sparse: sparse: got }
   include/linux/context_tracking_state.h:23:1: sparse: sparse: Expected ; =
at the end of type declaration
   include/linux/context_tracking_state.h:23:1: sparse: sparse: got }
--
>> include/linux/of_irq.h:89:1: sparse: sparse: missing identifier in decla=
ration
   include/linux/of_irq.h:89:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:89:1: sparse: sparse: got {
   include/linux/of_irq.h:91:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:91:1: sparse: sparse: got }
   include/linux/of_irq.h:99:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:99:1: sparse: sparse: got }
   include/linux/of_irq.h:115:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/of_irq.h:115:1: sparse: sparse: got }
   drivers/staging/wfx/bus_sdio.c:181:31: sparse: sparse: undefined identif=
ier 'irq_of_parse_and_map'
--
>> include/linux/of_irq.h:89:1: sparse: sparse: missing identifier in decla=
ration
   include/linux/of_irq.h:89:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:89:1: sparse: sparse: got {
   include/linux/of_irq.h:91:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:91:1: sparse: sparse: got }
   include/linux/of_irq.h:99:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:99:1: sparse: sparse: got }
   include/linux/of_irq.h:115:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/of_irq.h:115:1: sparse: sparse: got }
--
>> include/linux/of_irq.h:89:1: sparse: sparse: missing identifier in decla=
ration
   include/linux/of_irq.h:89:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:89:1: sparse: sparse: got {
   include/linux/of_irq.h:91:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:91:1: sparse: sparse: got }
   include/linux/of_irq.h:99:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:99:1: sparse: sparse: got }
   include/linux/of_irq.h:115:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/of_irq.h:115:1: sparse: sparse: got }
   include/linux/pm_runtime.h:124:76: sparse: sparse: Expected ; at the end=
 of type declaration
   include/linux/pm_runtime.h:124:76: sparse: sparse: got }
   include/linux/pm_runtime.h:126:78: sparse: sparse: Expected ; at the end=
 of type declaration
   include/linux/pm_runtime.h:126:78: sparse: sparse: got }
   include/linux/pm_runtime.h:127:77: sparse: sparse: Expected ; at the end=
 of type declaration
   include/linux/pm_runtime.h:127:77: sparse: sparse: got }
   include/linux/pm_runtime.h:128:76: sparse: sparse: Expected ; at the end=
 of type declaration
   include/linux/pm_runtime.h:128:76: sparse: sparse: got }
   include/linux/pm_runtime.h:129:75: sparse: sparse: Expected ; at the end=
 of type declaration
   include/linux/pm_runtime.h:129:75: sparse: sparse: got }
   include/linux/pm_runtime.h:134:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/pm_runtime.h:134:1: sparse: sparse: got }
   include/linux/pm_runtime.h:138:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/pm_runtime.h:138:1: sparse: sparse: got }
   include/linux/pm_runtime.h:142:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/pm_runtime.h:142:1: sparse: sparse: got }
   include/linux/pm_runtime.h:146:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/pm_runtime.h:146:1: sparse: sparse: got }
   include/linux/pm_runtime.h:150:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/pm_runtime.h:150:1: sparse: sparse: got }
   include/linux/pm_runtime.h:155:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/pm_runtime.h:155:1: sparse: sparse: got }
   include/linux/pm_runtime.h:157:78: sparse: sparse: Expected ; at the end=
 of type declaration
   include/linux/pm_runtime.h:157:78: sparse: sparse: got }
   include/linux/pm_runtime.h:158:70: sparse: sparse: Expected ; at the end=
 of type declaration
   include/linux/pm_runtime.h:158:70: sparse: sparse: got }
   include/linux/pm_runtime.h:167:77: sparse: sparse: Expected ; at the end=
 of type declaration
   include/linux/pm_runtime.h:167:77: sparse: sparse: got }
   include/linux/pm_runtime.h:168:73: sparse: sparse: Expected ; at the end=
 of type declaration
   include/linux/pm_runtime.h:168:73: sparse: sparse: got }
   include/linux/pm_runtime.h:169:84: sparse: sparse: Expected ; at the end=
 of type declaration
   include/linux/pm_runtime.h:169:84: sparse: sparse: got }
   include/linux/pm_runtime.h:170:75: sparse: sparse: Expected ; at the end=
 of type declaration
   include/linux/pm_runtime.h:170:75: sparse: sparse: got }
   include/linux/pm_runtime.h:174:79: sparse: sparse: Expected ; at the end=
 of type declaration
   include/linux/pm_runtime.h:174:79: sparse: sparse: got }
   include/linux/pm_runtime.h:176:85: sparse: sparse: Expected ; at the end=
 of type declaration
   include/linux/pm_runtime.h:176:85: sparse: sparse: got }
   include/linux/pm_runtime.h:183:65: sparse: sparse: Expected ; at the end=
 of type declaration
   include/linux/pm_runtime.h:183:65: sparse: sparse: got }
   include/linux/pm_runtime.h:197:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/pm_runtime.h:197:1: sparse: sparse: got }
   include/linux/pm_runtime.h:202:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/pm_runtime.h:202:1: sparse: sparse: got }
   include/linux/pm_runtime.h:207:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/pm_runtime.h:207:1: sparse: sparse: got }
   include/linux/pm_runtime.h:212:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/pm_runtime.h:212:1: sparse: sparse: got }
   include/linux/pm_runtime.h:217:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/pm_runtime.h:217:1: sparse: sparse: got }
   include/linux/pm_runtime.h:222:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/pm_runtime.h:222:1: sparse: sparse: got }
   include/linux/pm_runtime.h:227:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/pm_runtime.h:227:1: sparse: sparse: got }
   include/linux/pm_runtime.h:232:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/pm_runtime.h:232:1: sparse: sparse: got }
   include/linux/pm_runtime.h:237:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/pm_runtime.h:237:1: sparse: sparse: got }
   include/linux/pm_runtime.h:242:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/pm_runtime.h:242:1: sparse: sparse: got }
   include/linux/pm_runtime.h:248:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/pm_runtime.h:248:1: sparse: sparse: got }
   include/linux/pm_runtime.h:253:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/pm_runtime.h:253:1: sparse: sparse: got }
   include/linux/pm_runtime.h:258:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/pm_runtime.h:258:1: sparse: sparse: got }
   include/linux/pm_runtime.h:263:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/pm_runtime.h:263:1: sparse: sparse: got }
   include/linux/pm_runtime.h:268:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/pm_runtime.h:268:1: sparse: sparse: got }
   include/linux/pm_runtime.h:273:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/pm_runtime.h:273:1: sparse: sparse: got }
   include/linux/pm_runtime.h:278:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/pm_runtime.h:278:1: sparse: sparse: got }
   include/linux/pm_runtime.h:283:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/pm_runtime.h:283:1: sparse: sparse: got }
   include/linux/pm_runtime.h:288:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/pm_runtime.h:288:1: sparse: sparse: got }
   drivers/iio/accel/mma8452.c:1673:15: sparse: sparse: undefined identifie=
r 'pm_runtime_set_active'
   drivers/iio/accel/mma8452.c:1677:9: sparse: sparse: undefined identifier=
 'pm_runtime_enable'
   drivers/iio/accel/mma8452.c:1678:9: sparse: sparse: undefined identifier=
 'pm_runtime_set_autosuspend_delay'
   drivers/iio/accel/mma8452.c:1680:9: sparse: sparse: undefined identifier=
 'pm_runtime_use_autosuspend'
   drivers/iio/accel/mma8452.c:1714:9: sparse: sparse: undefined identifier=
 'pm_runtime_disable'
   drivers/iio/accel/mma8452.c:1715:9: sparse: sparse: undefined identifier=
 'pm_runtime_set_suspended'
   drivers/iio/accel/mma8452.c:1716:9: sparse: sparse: undefined identifier=
 'pm_runtime_put_noidle'
--
>> include/linux/of_irq.h:89:1: sparse: sparse: missing identifier in decla=
ration
   include/linux/of_irq.h:89:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:89:1: sparse: sparse: got {
   include/linux/of_irq.h:91:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:91:1: sparse: sparse: got }
   include/linux/of_irq.h:99:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:99:1: sparse: sparse: got }
   include/linux/of_irq.h:115:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/of_irq.h:115:1: sparse: sparse: got }
   include/uapi/linux/hdlc/ioctl.h:44:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/uapi/linux/hdlc/ioctl.h:44:1: sparse: sparse: got }
   include/uapi/linux/if.h:219:48: sparse: sparse: expected ; at end of dec=
laration
   include/uapi/linux/if.h:219:48: sparse: sparse: Expected } at end of spe=
cifier
   include/uapi/linux/if.h:219:48: sparse: sparse: got *
   include/uapi/linux/if.h:221:9: sparse: sparse: Expected ; at the end of =
type declaration
   include/uapi/linux/if.h:221:9: sparse: sparse: got }
   include/uapi/linux/if.h:222:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/uapi/linux/if.h:222:1: sparse: sparse: got }
--
>> include/linux/of_irq.h:89:1: sparse: sparse: missing identifier in decla=
ration
   include/linux/of_irq.h:89:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:89:1: sparse: sparse: got {
   include/linux/of_irq.h:91:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:91:1: sparse: sparse: got }
   include/linux/of_irq.h:99:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:99:1: sparse: sparse: got }
   include/linux/of_irq.h:115:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/of_irq.h:115:1: sparse: sparse: got }
   drivers/i2c/i2c-smbus.c:22:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   drivers/i2c/i2c-smbus.c:22:1: sparse: sparse: got }
   drivers/i2c/i2c-smbus.c:70:20: sparse: sparse: using member 'ara' in inc=
omplete struct i2c_smbus_alert
   drivers/i2c/i2c-smbus.c:107:17: sparse: sparse: using member 'alert' in =
incomplete struct i2c_smbus_alert
>> drivers/i2c/i2c-smbus.c:107:17: sparse: sparse: unknown member
>> drivers/i2c/i2c-smbus.c:107:17: sparse: sparse: cast from unknown type
   drivers/i2c/i2c-smbus.c:135:9: sparse: sparse: using member 'alert' in i=
ncomplete struct i2c_smbus_alert
   drivers/i2c/i2c-smbus.c:135:9: sparse: sparse: using member 'alert' in i=
ncomplete struct i2c_smbus_alert
   drivers/i2c/i2c-smbus.c:135:9: sparse: sparse: using member 'alert' in i=
ncomplete struct i2c_smbus_alert
   drivers/i2c/i2c-smbus.c:135:9: sparse: sparse: using member 'alert' in i=
ncomplete struct i2c_smbus_alert
   drivers/i2c/i2c-smbus.c:136:14: sparse: sparse: using member 'ara' in in=
complete struct i2c_smbus_alert
   drivers/i2c/i2c-smbus.c:158:32: sparse: sparse: using member 'alert' in =
incomplete struct i2c_smbus_alert
   drivers/i2c/i2c-smbus.c:193:36: sparse: sparse: using member 'alert' in =
incomplete struct i2c_smbus_alert
--
>> include/linux/of_irq.h:89:1: sparse: sparse: missing identifier in decla=
ration
   include/linux/of_irq.h:89:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:89:1: sparse: sparse: got {
   include/linux/of_irq.h:91:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:91:1: sparse: sparse: got }
   include/linux/of_irq.h:99:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:99:1: sparse: sparse: got }
   include/linux/of_irq.h:115:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/of_irq.h:115:1: sparse: sparse: got }
   include/linux/wait_bit.h:14:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/wait_bit.h:14:1: sparse: sparse: got }
--
>> include/linux/of_irq.h:89:1: sparse: sparse: missing identifier in decla=
ration
   include/linux/of_irq.h:89:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:89:1: sparse: sparse: got {
   include/linux/of_irq.h:91:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:91:1: sparse: sparse: got }
   include/linux/of_irq.h:99:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:99:1: sparse: sparse: got }
   include/linux/of_irq.h:115:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/of_irq.h:115:1: sparse: sparse: got }
   include/linux/linkmode.h:11:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/linkmode.h:11:1: sparse: sparse: got }
   include/linux/linkmode.h:16:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/linkmode.h:16:1: sparse: sparse: got }
   include/linux/linkmode.h:22:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/linkmode.h:22:1: sparse: sparse: got }
   include/linux/linkmode.h:28:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/linkmode.h:28:1: sparse: sparse: got }
   include/linux/linkmode.h:33:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/linkmode.h:33:1: sparse: sparse: got }
   include/linux/linkmode.h:39:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/linkmode.h:39:1: sparse: sparse: got }
   include/linux/linkmode.h:44:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/linkmode.h:44:1: sparse: sparse: got }
   include/linux/linkmode.h:51:16: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/linkmode.h:51:16: sparse: sparse: got =3D
>> include/linux/linkmode.h:51:9: sparse: sparse: Trying to use reserved wo=
rd 'for' as identifier
   include/linux/linkmode.h:51:23: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/linkmode.h:51:23: sparse: sparse: got <
   include/linux/linkmode.h:51:38: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/linkmode.h:51:38: sparse: sparse: got ++
   include/linux/linkmode.h:53:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/linkmode.h:53:1: sparse: sparse: got }
   include/linux/linkmode.h:58:1: sparse: sparse: Expected ;@the end of =
type declaration
   include/linux/linkmode.h:58:1: sparse: sparse: got }
>> include/linux/linkmode.h:65:9: sparse: sparse: Trying to use reserved wo=
rd 'else' as identifier
   include/linux/linkmode.h:66:17: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/linkmode.h:66:17: sparse: sparse: got linkmode_clear_bit
   include/linux/linkmode.h:67:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/linkmode.h:67:1: sparse: sparse: got }
   include/linux/linkmode.h:72:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/linkmode.h:72:1: sparse: sparse: got }
   include/linux/linkmode.h:77:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/linkmode.h:77:1: sparse: sparse: got }
   include/linux/linkmode.h:83:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/linkmode.h:83:1: sparse: sparse: got }
   include/linux/linkmode.h:89:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/linkmode.h:89:1: sparse: sparse: got }
--
>> include/linux/of_irq.h:89:1: sparse: sparse: missing identifier in decla=
ration
   include/linux/of_irq.h:89:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:89:1: sparse: sparse: got {
   include/linux/of_irq.h:91:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:91:1: sparse: sparse: got }
   include/linux/of_irq.h:99:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:99:1: sparse: sparse: got }
   include/linux/of_irq.h:115:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/of_irq.h:115:1: sparse: sparse: got }
   kernel/irq/irqdomain.c:227:34: sparse: sparse: undefined identifier 'irq=
_domain_list'
   kernel/irq/irqdomain.c:401:9: sparse: sparse: undefined identifier 'irq_=
domain_list'
   kernel/irq/irqdomain.c:401:9: sparse: sparse: undefined identifier 'irq_=
domain_list'
>> kernel/irq/irqdomain.c:401:9: sparse: sparse: cast from unknown type
   kernel/irq/irqdomain.c:401:9: sparse: sparse: undefined identifier 'irq_=
domain_list'
   kernel/irq/irqdomain.c:401:9: sparse: sparse: undefined identifier 'irq_=
domain_list'
   kernel/irq/irqdomain.c:434:9: sparse: sparse: undefined identifier 'irq_=
domain_list'
   kernel/irq/irqdomain.c:434:9: sparse: sparse: undefined identifier 'irq_=
domain_list'
   kernel/irq/irqdomain.c:434:9: sparse: sparse: cast from unknown type
   kernel/irq/irqdomain.c:434:9: sparse: sparse: undefined identifier 'irq_=
domain_list'
   kernel/irq/irqdomain.c:434:9: sparse: sparse: undefined identifier 'irq_=
domain_list'
   kernel/irq/irqdomain.c:1813:9: sparse: sparse: undefined identifier 'irq=
_domain_list'
   kernel/irq/irqdomain.c:1813:9: sparse: sparse: undefined identifier 'irq=
_domain_list'
   kernel/irq/irqdomain.c:1813:9: sparse: sparse: cast from unknown type
   kernel/irq/irqdomain.c:1813:9: sparse: sparse: undefined identifier 'irq=
_domain_list'
   kernel/irq/irqdomain.c:1813:9: sparse: sparse: undefined identifier 'irq=
_domain_list'
--
>> include/linux/of_irq.h:89:1: sparse: sparse: missing identifier in decla=
ration
   include/linux/of_irq.h:89:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:89:1: sparse: sparse: got {
   include/linux/of_irq.h:91:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:91:1: sparse: sparse: got }
   include/linux/of_irq.h:99:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:99:1: sparse: sparse: got }
   include/linux/of_irq.h:115:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/of_irq.h:115:1: sparse: sparse: got }
   sound/soc/codecs/wcd9335.c:3552:57: sparse: sparse: undefined identifier=
 'WCD_CLSH_EVENT_PRE_DAC'
   sound/soc/codecs/wcd9335.c:3573:57: sparse: sparse: undefined identifier=
 'WCD_CLSH_EVENT_POST_PA'
   sound/soc/codecs/wcd9335.c:3591:57: sparse: sparse: undefined identifier=
 'WCD_CLSH_EVENT_PRE_DAC'
   sound/soc/codecs/wcd9335.c:3595:57: sparse: sparse: undefined identifier=
 'WCD_CLSH_EVENT_POST_PA'
   sound/soc/codecs/wcd9335.c:3611:57: sparse: sparse: undefined identifier=
 'WCD_CLSH_EVENT_PRE_DAC'
   sound/soc/codecs/wcd9335.c:3616:57: sparse: sparse: undefined identifier=
 'WCD_CLSH_EVENT_POST_PA'
   sound/soc/codecs/wcd9335.c:3708:30: sparse: sparse: undefined identifier=
 'WCD_CLSH_EVENT_PRE_DAC'
   sound/soc/codecs/wcd9335.c:3724:57: sparse: sparse: undefined identifier=
 'WCD_CLSH_EVENT_POST_PA'
   arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
>> include/linux/of_irq.h:89:1: sparse: sparse: missing identifier in decla=
ration
   include/linux/of_irq.h:89:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:89:1: sparse: sparse: got {
   include/linux/of_irq.h:91:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:91:1: sparse: sparse: got }
   include/linux/of_irq.h:99:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:99:1: sparse: sparse: got }
   include/linux/of_irq.h:115:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/of_irq.h:115:1: sparse: sparse: got }
   sound/soc/codecs/cs35l33.c:51:1: sparse: sparse: Expected ; at the end o=
f type declaration
   sound/soc/codecs/cs35l33.c:51:1: sparse: sparse: got }
   sound/soc/codecs/cs35l33.c:205:26: sparse: sparse: using member 'amp_cal=
' in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:207:29: sparse: sparse: using member 'amp_cal=
' in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:208:25: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:234:17: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:236:27: sparse: sparse: using member 'is_tdm_=
mode' in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:237:17: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:243:26: sparse: sparse: using member 'amp_cal=
' in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:244:25: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:251:17: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:254:17: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:277:25: sparse: sparse: using member 'is_tdm_=
mode' in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:300:9: sparse: sparse: using member 'regmap' =
in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:302:9: sparse: sparse: using member 'regmap' =
in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:369:17: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:371:17: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:375:17: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:377:33: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:380:25: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:445:17: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:450:17: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:464:21: sparse: sparse: using member 'is_tdm_=
mode' in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:468:21: sparse: sparse: using member 'is_tdm_=
mode' in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:485:48: sparse: sparse: using member 'mclk_in=
t' in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:490:9: sparse: sparse: using member 'regmap' =
in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:495:17: sparse: sparse: using member 'is_tdm_=
mode' in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:499:17: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:535:17: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:537:17: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:540:17: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:542:17: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:564:17: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:578:17: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:590:25: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:598:25: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:606:25: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:615:25: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:626:17: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:646:17: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:648:24: sparse: sparse: using member 'mclk_in=
t' in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:653:17: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:655:24: sparse: sparse: using member 'mclk_in=
t' in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:658:24: sparse: sparse: using member 'mclk_in=
t' in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:662:9: sparse: sparse: using member 'mclk_int=
' in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:705:17: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:708:34: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:710:17: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:713:17: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:716:17: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:720:17: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:725:25: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:731:17: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:734:17: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:737:17: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:740:17: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:770:29: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:781:16: sparse: sparse: using member 'compone=
nt' in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:784:9: sparse: sparse: using member 'regmap' =
in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:786:9: sparse: sparse: using member 'regmap' =
in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:791:9: sparse: sparse: using member 'regmap' =
in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:793:9: sparse: sparse: using member 'regmap' =
in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:797:20: sparse: sparse: using member 'pdata' =
in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:798:55: sparse: sparse: using member 'pdata' =
in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:800:20: sparse: sparse: using member 'enable_=
soft_ramp' in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:804:50: sparse: sparse: using member 'pdata' =
in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:811:20: sparse: sparse: using member 'pdata' =
in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:813:52: sparse: sparse: using member 'pdata' =
in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:815:49: sparse: sparse: using member 'pdata' =
in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:821:9: sparse: sparse: using member 'regmap' =
in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:867:41: sparse: sparse: using member 'reset_g=
pio' in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:869:44: sparse: sparse: using member 'num_cor=
e_supplies' in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:876:36: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:878:41: sparse: sparse: using member 'reset_g=
pio' in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:882:36: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:891:36: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:892:39: sparse: sparse: using member 'num_cor=
e_supplies' in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:905:16: sparse: sparse: using member 'amp_cal=
' in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:907:36: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:908:36: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:909:39: sparse: sparse: using member 'num_cor=
e_supplies' in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:965:54: sparse: sparse: using member 'compone=
nt' in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:968:28: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:970:28: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:972:28: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:973:28: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:981:28: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:991:25: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:994:25: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:998:25: sparse: sparse: using member 'regmap'=
 in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:1008:24: sparse: sparse: using member 'amp_ca=
l' in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:1012:25: sparse: sparse: using member 'regmap=
' in incomplete struct cs35l33_private
   sound/soc/codecs/cs35l33.c:1015:25: sparse: sparse: using member 'regmap=
' in incomplete struct cs35l33_private
>> sound/soc/codecs/cs35l33.c:1018:25: sparse: sparse: too many errors
--
>> include/linux/of_irq.h:89:1: sparse: sparse: missing identifier in decla=
ration
   include/linux/of_irq.h:89:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:89:1: sparse: sparse: got {
   include/linux/of_irq.h:91:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:91:1: sparse: sparse: got }
   include/linux/of_irq.h:99:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:99:1: sparse: sparse: got }
   include/linux/of_irq.h:115:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/of_irq.h:115:1: sparse: sparse: got }
   arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
>> include/linux/of_irq.h:89:1: sparse: sparse: missing identifier in decla=
ration
   include/linux/of_irq.h:89:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:89:1: sparse: sparse: got {
   include/linux/of_irq.h:91:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:91:1: sparse: sparse: got }
   include/linux/of_irq.h:99:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:99:1: sparse: sparse: got }
   include/linux/of_irq.h:115:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/of_irq.h:115:1: sparse: sparse: got }
   include/linux/node.h:36:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/node.h:36:1: sparse: sparse: got }
   arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
>> include/linux/of_irq.h:89:1: sparse: sparse: missing identifier in decla=
ration
   include/linux/of_irq.h:89:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:89:1: sparse: sparse: got {
   include/linux/of_irq.h:91:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:91:1: sparse: sparse: got }
   include/linux/of_irq.h:99:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:99:1: sparse: sparse: got }
   include/linux/of_irq.h:115:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/of_irq.h:115:1: sparse: sparse: got }
   include/linux/linkmode.h:11:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/linkmode.h:11:1: sparse: sparse: got }
   include/linux/linkmode.h:16:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/linkmode.h:16:1: sparse: sparse: got }
   include/linux/linkmode.h:22:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/linkmode.h:22:1: sparse: sparse: got }
   include/linux/linkmode.h:28:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/linkmode.h:28:1: sparse: sparse: got }
   include/linux/linkmode.h:33:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/linkmode.h:33:1: sparse: sparse: got }
   include/linux/linkmode.h:39:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/linkmode.h:39:1: sparse: sparse: got }
   include/linux/linkmode.h:44:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/linkmode.h:44:1: sparse: sparse: got }
   include/linux/linkmode.h:51:16: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/linkmode.h:51:16: sparse: sparse: got =3D
>> include/linux/linkmode.h:51:9: sparse: sparse: Trying to use reserved wo=
rd 'for' as identifier
   include/linux/linkmode.h:51:23: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/linkmode.h:51:23: sparse: sparse: got <
   include/linux/linkmode.h:51:38: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/linkmode.h:51:38: sparse: sparse: got ++
   include/linux/linkmode.h:53:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/linkmode.h:53:1: sparse: sparse: got }
   include/linux/linkmode.h:58:1: sparse: sparse: Expected ;@the end of =
type declaration
   include/linux/linkmode.h:58:1: sparse: sparse: got }
>> include/linux/linkmode.h:65:9: sparse: sparse: Trying to use reserved wo=
rd 'else' as identifier
   include/linux/linkmode.h:66:17: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/linkmode.h:66:17: sparse: sparse: got linkmode_clear_bit
   include/linux/linkmode.h:67:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/linkmode.h:67:1: sparse: sparse: got }
   include/linux/linkmode.h:72:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/linkmode.h:72:1: sparse: sparse: got }
   include/linux/linkmode.h:77:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/linkmode.h:77:1: sparse: sparse: got }
   include/linux/linkmode.h:83:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/linkmode.h:83:1: sparse: sparse: got }
   include/linux/linkmode.h:89:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/linkmode.h:89:1: sparse: sparse: got }
   drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c:118:22: sparse: spar=
se: undefined identifier 'irq_of_parse_and_map'
   drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c:130:40: sparse: spar=
se: undefined identifier 'irq_of_parse_and_map'
   drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c:138:40: sparse: spar=
se: undefined identifier 'irq_of_parse_and_map'
   drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c:145:25: sparse: spar=
se: undefined identifier 'irq_of_parse_and_map'
--
>> include/linux/of_irq.h:89:1: sparse: sparse: missing identifier in decla=
ration
   include/linux/of_irq.h:89:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:89:1: sparse: sparse: got {
   include/linux/of_irq.h:91:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:91:1: sparse: sparse: got }
   include/linux/of_irq.h:99:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:99:1: sparse: sparse: got }
   include/linux/of_irq.h:115:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/of_irq.h:115:1: sparse: sparse: got }
   include/linux/resource_ext.h:17:1: sparse: sparse: Expected ; at the end=
 of type declaration
   include/linux/resource_ext.h:17:1: sparse: sparse: got }
--
>> include/linux/of_irq.h:89:1: sparse: sparse: missing identifier in decla=
ration
   include/linux/of_irq.h:89:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:89:1: sparse: sparse: got {
   include/linux/of_irq.h:91:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:91:1: sparse: sparse: got }
   include/linux/of_irq.h:99:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:99:1: sparse: sparse: got }
   include/linux/of_irq.h:115:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/of_irq.h:115:1: sparse: sparse: got }
   include/uapi/linux/sched.h:104:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/uapi/linux/sched.h:104:1: sparse: sparse: got }
--
>> include/linux/of_irq.h:89:1: sparse: sparse: missing identifier in decla=
ration
   include/linux/of_irq.h:89:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:89:1: sparse: sparse: got {
   include/linux/of_irq.h:91:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:91:1: sparse: sparse: got }
   include/linux/of_irq.h:99:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:99:1: sparse: sparse: got }
   include/linux/of_irq.h:115:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/of_irq.h:115:1: sparse: sparse: got }
   include/linux/of_address.h:17:1: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/of_address.h:17:1: sparse: sparse: got }
   drivers/tty/serial/arc_uart.c:617:21: sparse: sparse: undefined identifi=
er 'irq_of_parse_and_map'
--
>> include/linux/of_irq.h:89:1: sparse: sparse: missing identifier in decla=
ration
   include/linux/of_irq.h:89:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:89:1: sparse: sparse: got {
   include/linux/of_irq.h:91:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:91:1: sparse: sparse: got }
   include/linux/of_irq.h:99:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:99:1: sparse: sparse: got }
   include/linux/of_irq.h:115:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/of_irq.h:115:1: sparse: sparse: got }
   include/uapi/linux/sysctl.h:43:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/uapi/linux/sysctl.h:43:1: sparse: sparse: got }
--
>> include/linux/of_irq.h:89:1: sparse: sparse: missing identifier in decla=
ration
   include/linux/of_irq.h:89:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:89:1: sparse: sparse: got {
   include/linux/of_irq.h:91:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:91:1: sparse: sparse: got }
   include/linux/of_irq.h:99:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:99:1: sparse: sparse: got }
   include/linux/of_irq.h:115:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/of_irq.h:115:1: sparse: sparse: got }
   include/linux/range.h:8:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/range.h:8:1: sparse: sparse: got }
--
>> include/linux/of_irq.h:89:1: sparse: sparse: missing identifier in decla=
ration
   include/linux/of_irq.h:89:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:89:1: sparse: sparse: got {
   include/linux/of_irq.h:91:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:91:1: sparse: sparse: got }
   include/linux/of_irq.h:99:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/of_irq.h:99:1: sparse: sparse: got }
   include/linux/of_irq.h:115:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/of_irq.h:115:1: sparse: sparse: got }
   include/uapi/linux/sched.h:104:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/uapi/linux/sched.h:104:1: sparse: sparse: got }
   arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable

# https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.git/comm=
it/?id=3Da3954ee26a962f1d086cfdaa4bd1a83b1f8c7f5c
git remote add lpieralisi https://git.kernel.org/pub/scm/linux/kernel/git/l=
pieralisi/linux.git
git remote update lpieralisi
git checkout a3954ee26a962f1d086cfdaa4bd1a83b1f8c7f5c
vim +89 include/linux/of_irq.h

4c3141e09cfa646 Carlo Caione  2015-12-01   80  =

48ae34fb39b0c0c Marc Zyngier  2015-09-18   81  static inline struct irq_dom=
ain *of_msi_get_domain(struct device *dev,
48ae34fb39b0c0c Marc Zyngier  2015-09-18   82  						   struct device_node =
*np,
48ae34fb39b0c0c Marc Zyngier  2015-09-18   83  						   enum irq_domain_bus=
_token token)
48ae34fb39b0c0c Marc Zyngier  2015-09-18   84  {
48ae34fb39b0c0c Marc Zyngier  2015-09-18   85  	return NULL;
48ae34fb39b0c0c Marc Zyngier  2015-09-18   86  }
82b9b4243c6d99d Marc Zyngier  2015-10-02   87  static inline struct irq_dom=
ain *of_msi_map_get_device_domain(struct device *dev,
a3954ee26a962f1 Diana Craciun 2020-04-29   88  						u32 id, u32 bus_token);
82b9b4243c6d99d Marc Zyngier  2015-10-02  @89  {
82b9b4243c6d99d Marc Zyngier  2015-10-02   90  	return NULL;
82b9b4243c6d99d Marc Zyngier  2015-10-02   91  }
f9f9f11dcf0f3b7 Jonas Gorski  2015-10-12   92  static inline void of_msi_co=
nfigure(struct device *dev, struct device_node *np)
f9f9f11dcf0f3b7 Jonas Gorski  2015-10-12   93  {
f9f9f11dcf0f3b7 Jonas Gorski  2015-10-12   94  }
eaddb5725357e9f Rob Herring   2015-12-09   95  static inline u32 of_msi_map=
_rid(struct device *dev,
eaddb5725357e9f Rob Herring   2015-12-09   96  				 struct device_node *msi=
_np, u32 rid_in)
eaddb5725357e9f Rob Herring   2015-12-09   97  {
eaddb5725357e9f Rob Herring   2015-12-09   98  	return rid_in;
eaddb5725357e9f Rob Herring   2015-12-09   99  }
a8d3f362f52b652 Rob Herring   2013-11-07  100  #endif
a8d3f362f52b652 Rob Herring   2013-11-07  101  =


:::::: The code at line 89 was first introduced by commit
:::::: 82b9b4243c6d99d9e38087fa89183aa7479185e9 of/irq: Use the msi-map pro=
perty to provide device-specific MSI domain

:::::: TO: Marc Zyngier <marc.zyngier@arm.com>
:::::: CC: Marc Zyngier <marc.zyngier@arm.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3086069447881626365==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3086069447881626365==--

