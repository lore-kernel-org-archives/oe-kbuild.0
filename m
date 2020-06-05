Content-Type: multipart/mixed; boundary="===============0436112007806736826=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/2][RFC] PM-runtime: Move all runtime usage related function to runtime.c
Date: Sat, 06 Jun 2020 07:35:50 +0800
Message-ID: <202006060747.m3v6bLBY%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0436112007806736826==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <3e7c571eb9e444c6e326d5cbb1f6e2dce4bb52fe.1591380524.git.yu.c.=
chen@intel.com>
References: <3e7c571eb9e444c6e326d5cbb1f6e2dce4bb52fe.1591380524.git.yu.c.c=
hen@intel.com>
TO: Chen Yu <yu.c.chen@intel.com>

Hi Chen,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on pm/linux-next]
[also build test WARNING on v5.7 next-20200605]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Chen-Yu/Add-more-trace-poi=
nt-for-runtime-usage-count/20200606-030705
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git=
 linux-next
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: arc-randconfig-s032-20200605 (attached as .config)
compiler: arc-elf-gcc (GCC) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-246-g41f651b4-dirty
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 ARCH=3Darc CF=3D'-fdiagnostic-prefix -D__CHECK_END=
IAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   include/linux/pm_runtime.h:183:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_get_noresume'
>> include/linux/pm_runtime.h:157:20: sparse:  the previous one is here
   include/linux/pm_runtime.h:184:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_put_noidle'
   include/linux/pm_runtime.h:158:20: sparse:  the previous one is here
   drivers/tty/serial/xilinx_uartps.c:553:28: sparse: sparse: context imbal=
ance in 'cdns_uart_clk_notifier_cb' - different lock contexts for basic blo=
ck
   include/linux/spinlock.h:408:9: sparse: sparse: context imbalance in 'cd=
ns_uart_console_write' - unexpected unlock
--
   include/linux/pm_runtime.h:183:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_get_noresume'
>> include/linux/pm_runtime.h:157:20: sparse:  the previous one is here
   include/linux/pm_runtime.h:184:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_put_noidle'
   include/linux/pm_runtime.h:158:20: sparse:  the previous one is here
--
   include/linux/pm_runtime.h:183:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_get_noresume'
>> include/linux/pm_runtime.h:157:20: sparse:  the previous one is here
   include/linux/pm_runtime.h:184:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_put_noidle'
   include/linux/pm_runtime.h:158:20: sparse:  the previous one is here
   drivers/tty/serial/8250/8250_port.c:1881:5: sparse: sparse: context imba=
lance in 'serial8250_handle_irq' - different lock contexts for basic block
   drivers/tty/serial/8250/8250_port.c:3290:9: sparse: sparse: context imba=
lance in 'serial8250_console_write' - different lock contexts for basic blo=
ck
--
   include/linux/pm_runtime.h:183:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_get_noresume'
>> include/linux/pm_runtime.h:157:20: sparse:  the previous one is here
   include/linux/pm_runtime.h:184:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_put_noidle'
   include/linux/pm_runtime.h:158:20: sparse:  the previous one is here
--
   include/linux/pm_runtime.h:183:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_get_noresume'
>> include/linux/pm_runtime.h:157:20: sparse:  the previous one is here
   include/linux/pm_runtime.h:184:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_put_noidle'
   include/linux/pm_runtime.h:158:20: sparse:  the previous one is here
   drivers/misc/lis3lv02d/lis3lv02d.c:182:52: sparse: sparse: cast to restr=
icted __le16
--
   include/linux/pm_runtime.h:183:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_get_noresume'
>> include/linux/pm_runtime.h:157:20: sparse:  the previous one is here
   include/linux/pm_runtime.h:184:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_put_noidle'
   include/linux/pm_runtime.h:158:20: sparse:  the previous one is here
--
   include/linux/pm_runtime.h:183:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_get_noresume'
>> include/linux/pm_runtime.h:157:20: sparse:  the previous one is here
   include/linux/pm_runtime.h:184:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_put_noidle'
   include/linux/pm_runtime.h:158:20: sparse:  the previous one is here
   arch/arc/include/asm/irqflags-arcv2.h:80:31: sparse: sparse: undefined i=
dentifier '__builtin_arc_lr'
   arch/arc/include/asm/irqflags-arcv2.h:83:17: sparse: sparse: undefined i=
dentifier '__builtin_arc_sr'
--
   include/linux/pm_runtime.h:183:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_get_noresume'
>> include/linux/pm_runtime.h:157:20: sparse:  the previous one is here
   include/linux/pm_runtime.h:184:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_put_noidle'
   include/linux/pm_runtime.h:158:20: sparse:  the previous one is here
   drivers/i2c/busses/i2c-viperboard.c:123:35: sparse: sparse: incorrect ty=
pe in assignment (different base types) @@     expected unsigned short [use=
rtype] addr @@     got restricted __le16 [usertype] @@
   drivers/i2c/busses/i2c-viperboard.c:123:35: sparse:     expected unsigne=
d short [usertype] addr
   drivers/i2c/busses/i2c-viperboard.c:123:35: sparse:     got restricted _=
_le16 [usertype]
   drivers/i2c/busses/i2c-viperboard.c:196:34: sparse: sparse: incorrect ty=
pe in assignment (different base types) @@     expected unsigned short [use=
rtype] tf1 @@     got restricted __le16 [usertype] @@
   drivers/i2c/busses/i2c-viperboard.c:196:34: sparse:     expected unsigne=
d short [usertype] tf1
   drivers/i2c/busses/i2c-viperboard.c:196:34: sparse:     got restricted _=
_le16 [usertype]
   drivers/i2c/busses/i2c-viperboard.c:197:34: sparse: sparse: incorrect ty=
pe in assignment (different base types) @@     expected unsigned short [use=
rtype] tf2 @@     got restricted __le16 [usertype] @@
   drivers/i2c/busses/i2c-viperboard.c:197:34: sparse:     expected unsigne=
d short [usertype] tf2
   drivers/i2c/busses/i2c-viperboard.c:197:34: sparse:     got restricted _=
_le16 [usertype]
   drivers/i2c/busses/i2c-viperboard.c:232:35: sparse: sparse: incorrect ty=
pe in assignment (different base types) @@     expected unsigned short [use=
rtype] addr @@     got restricted __le16 [usertype] @@
   drivers/i2c/busses/i2c-viperboard.c:232:35: sparse:     expected unsigne=
d short [usertype] addr
   drivers/i2c/busses/i2c-viperboard.c:232:35: sparse:     got restricted _=
_le16 [usertype]
   drivers/i2c/busses/i2c-viperboard.c:295:35: sparse: sparse: incorrect ty=
pe in assignment (different base types) @@     expected unsigned short [use=
rtype] len @@     got restricted __le16 [usertype] @@
   drivers/i2c/busses/i2c-viperboard.c:295:35: sparse:     expected unsigne=
d short [usertype] len
   drivers/i2c/busses/i2c-viperboard.c:295:35: sparse:     got restricted _=
_le16 [usertype]
   drivers/i2c/busses/i2c-viperboard.c:320:35: sparse: sparse: incorrect ty=
pe in assignment (different base types) @@     expected unsigned short [use=
rtype] len @@     got restricted __le16 [usertype] @@
   drivers/i2c/busses/i2c-viperboard.c:320:35: sparse:     expected unsigne=
d short [usertype] len
   drivers/i2c/busses/i2c-viperboard.c:320:35: sparse:     got restricted _=
_le16 [usertype]
--
   include/linux/pm_runtime.h:183:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_get_noresume'
>> include/linux/pm_runtime.h:157:20: sparse:  the previous one is here
   include/linux/pm_runtime.h:184:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_put_noidle'
   include/linux/pm_runtime.h:158:20: sparse:  the previous one is here
   drivers/bluetooth/hci_intel.c:696:26: sparse: sparse: cast to restricted=
 __le16
   drivers/bluetooth/hci_intel.c:701:26: sparse: sparse: cast to restricted=
 __le16
   drivers/bluetooth/hci_intel.c:702:26: sparse: sparse: cast to restricted=
 __le16
   drivers/bluetooth/hci_intel.c:703:26: sparse: sparse: cast to restricted=
 __le16
   drivers/bluetooth/hci_intel.c:725:26: sparse: sparse: cast to restricted=
 __le16
   drivers/bluetooth/hci_intel.c:730:26: sparse: sparse: cast to restricted=
 __le16
   drivers/bluetooth/hci_intel.c:731:26: sparse: sparse: cast to restricted=
 __le16
   drivers/bluetooth/hci_intel.c:732:26: sparse: sparse: cast to restricted=
 __le16
--
   include/linux/pm_runtime.h:183:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_get_noresume'
>> include/linux/pm_runtime.h:157:20: sparse:  the previous one is here
   include/linux/pm_runtime.h:184:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_put_noidle'
   include/linux/pm_runtime.h:158:20: sparse:  the previous one is here
   drivers/bluetooth/btusb.c:2155:25: sparse: sparse: cast to restricted __=
le16
   drivers/bluetooth/btusb.c:2164:25: sparse: sparse: cast to restricted __=
le16
   drivers/bluetooth/btusb.c:2165:25: sparse: sparse: cast to restricted __=
le16
   drivers/bluetooth/btusb.c:2166:25: sparse: sparse: cast to restricted __=
le16
--
   include/linux/pm_runtime.h:183:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_get_noresume'
>> include/linux/pm_runtime.h:157:20: sparse:  the previous one is here
   include/linux/pm_runtime.h:184:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_put_noidle'
   include/linux/pm_runtime.h:158:20: sparse:  the previous one is here
   drivers/usb/cdns3/drd.c:43:31: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const volatile [noderef=
] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:43:31: sparse:     expected void const volatile =
[noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:43:31: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:45:25: sparse: sparse: incorrect type in argumen=
t 2 (different address spaces) @@     expected void volatile [noderef] <asn=
:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:45:25: sparse:     expected void volatile [noder=
ef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:45:25: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:47:31: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const volatile [noderef=
] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:47:31: sparse:     expected void const volatile =
[noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:47:31: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:49:25: sparse: sparse: incorrect type in argumen=
t 2 (different address spaces) @@     expected void volatile [noderef] <asn=
:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:49:25: sparse:     expected void volatile [noder=
ef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:49:25: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:71:14: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const volatile [noderef=
] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:71:14: sparse:     expected void const volatile =
[noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:71:14: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:81:19: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const volatile [noderef=
] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:81:19: sparse:     expected void const volatile =
[noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:81:19: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:114:9: sparse: sparse: incorrect type in argumen=
t 2 (different address spaces) @@     expected void volatile [noderef] <asn=
:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:114:9: sparse:     expected void volatile [noder=
ef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:114:9: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:123:9: sparse: sparse: incorrect type in argumen=
t 2 (different address spaces) @@     expected void volatile [noderef] <asn=
:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:123:9: sparse:     expected void volatile [noder=
ef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:123:9: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:141:17: sparse: sparse: incorrect type in argume=
nt 2 (different address spaces) @@     expected void volatile [noderef] <as=
n:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:141:17: sparse:     expected void volatile [node=
ref] <asn:2> *addr
   drivers/usb/cdns3/drd.c:141:17: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:144:23: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:144:23: sparse:     expected void const volatile=
 [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:144:23: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:144:23: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:144:23: sparse:     expected void const volatile=
 [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:144:23: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:152:17: sparse: sparse: incorrect type in argume=
nt 2 (different address spaces) @@     expected void volatile [noderef] <as=
n:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:152:17: sparse:     expected void volatile [node=
ref] <asn:2> *addr
   drivers/usb/cdns3/drd.c:152:17: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:156:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:156:17: sparse:     expected void const volatile=
 [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:156:17: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:156:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:156:17: sparse:     expected void const volatile=
 [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:156:17: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:178:17: sparse: sparse: incorrect type in argume=
nt 2 (different address spaces) @@     expected void volatile [noderef] <as=
n:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:178:17: sparse:     expected void volatile [node=
ref] <asn:2> *addr
   drivers/usb/cdns3/drd.c:178:17: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:182:23: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:182:23: sparse:     expected void const volatile=
 [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:182:23: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:182:23: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:182:23: sparse:     expected void const volatile=
 [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:182:23: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:195:17: sparse: sparse: incorrect type in argume=
nt 2 (different address spaces) @@     expected void volatile [noderef] <as=
n:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:195:17: sparse:     expected void volatile [node=
ref] <asn:2> *addr
   drivers/usb/cdns3/drd.c:195:17: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:199:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:199:17: sparse:     expected void const volatile=
 [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:199:17: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:199:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:199:17: sparse:     expected void const volatile=
 [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:199:17: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:219:9: sparse: sparse: incorrect type in argumen=
t 2 (different address spaces) @@     expected void volatile [noderef] <asn=
:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:219:9: sparse:     expected void volatile [noder=
ef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:219:9: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:284:15: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:284:15: sparse:     expected void const volatile=
 [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:284:15: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:303:9: sparse: sparse: incorrect type in argumen=
t 2 (different address spaces) @@     expected void volatile [noderef] <asn=
:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:303:9: sparse:     expected void volatile [noder=
ef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:303:9: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:326:27: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected struct cdns3_otg_legacy_reg=
s *otg_v0_regs @@     got void [noderef] <asn:2> *[assigned] regs @@
   drivers/usb/cdns3/drd.c:326:27: sparse:     expected struct cdns3_otg_le=
gacy_regs *otg_v0_regs
   drivers/usb/cdns3/drd.c:326:27: sparse:     got void [noderef] <asn:2> *=
[assigned] regs
   drivers/usb/cdns3/drd.c:327:14: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:327:14: sparse:     expected void const volatile=
 [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:327:14: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:330:32: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected struct cdns3_otg_common_reg=
s *otg_regs @@     got void [noderef] <asn:2> *[assigned] regs @@
   drivers/usb/cdns3/drd.c:330:32: sparse:     expected struct cdns3_otg_co=
mmon_regs *otg_regs
   drivers/usb/cdns3/drd.c:330:32: sparse:     got void [noderef] <asn:2> *=
[assigned] regs
   drivers/usb/cdns3/drd.c:331:17: sparse: sparse: incorrect type in argume=
nt 2 (different address spaces) @@     expected void volatile [noderef] <as=
n:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:331:17: sparse:     expected void volatile [node=
ref] <asn:2> *addr
   drivers/usb/cdns3/drd.c:331:17: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:332:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:332:17: sparse:     expected void const volatile=
 [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:332:17: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:336:35: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected struct cdns3_otg_regs *otg_=
v1_regs @@     got void [noderef] <asn:2> *[assigned] regs @@
   drivers/usb/cdns3/drd.c:336:35: sparse:     expected struct cdns3_otg_re=
gs *otg_v1_regs
   drivers/usb/cdns3/drd.c:336:35: sparse:     got void [noderef] <asn:2> *=
[assigned] regs
   drivers/usb/cdns3/drd.c:339:17: sparse: sparse: incorrect type in argume=
nt 2 (different address spaces) @@     expected void volatile [noderef] <as=
n:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:339:17: sparse:     expected void volatile [node=
ref] <asn:2> *addr
   drivers/usb/cdns3/drd.c:339:17: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:340:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:340:17: sparse:     expected void const volatile=
 [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:340:17: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:340:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:340:17: sparse:     expected void const volatile=
 [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:340:17: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:345:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:345:17: sparse:     expected void const volatile=
 [noderef] <asn:2> *addr
--
   include/linux/pm_runtime.h:183:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_get_noresume'
>> include/linux/pm_runtime.h:157:20: sparse:  the previous one is here
   include/linux/pm_runtime.h:184:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_put_noidle'
   include/linux/pm_runtime.h:158:20: sparse:  the previous one is here
   drivers/usb/cdns3/gadget.c:1157:35: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] control @@     got unsigned long @@
   drivers/usb/cdns3/gadget.c:1157:35: sparse:     expected restricted __le=
32 [usertype] control
   drivers/usb/cdns3/gadget.c:1157:35: sparse:     got unsigned long
   drivers/usb/cdns3/gadget.c:1173:29: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] buffer @@     got unsigned long @@
   drivers/usb/cdns3/gadget.c:1173:29: sparse:     expected restricted __le=
32 [usertype] buffer
   drivers/usb/cdns3/gadget.c:1173:29: sparse:     got unsigned long
   drivers/usb/cdns3/gadget.c:1188:29: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] length @@     got unsigned long @@
   drivers/usb/cdns3/gadget.c:1188:29: sparse:     expected restricted __le=
32 [usertype] length
   drivers/usb/cdns3/gadget.c:1188:29: sparse:     got unsigned long
   drivers/usb/cdns3/gadget.c:1191:37: sparse: sparse: invalid assignment: =
|=3D
   drivers/usb/cdns3/gadget.c:1191:37: sparse:    left side has type restri=
cted __le32
   drivers/usb/cdns3/gadget.c:1191:37: sparse:    right side has type unsig=
ned long
   drivers/usb/cdns3/gadget.c:1213:38: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] control @@     got unsigned int [assigned] [usertype] control @@
   drivers/usb/cdns3/gadget.c:1213:38: sparse:     expected restricted __le=
32 [usertype] control
   drivers/usb/cdns3/gadget.c:1213:38: sparse:     got unsigned int [assign=
ed] [usertype] control
   drivers/usb/cdns3/gadget.c:1215:48: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] control @@     got unsigned int [assigned] [usertype] control @@
   drivers/usb/cdns3/gadget.c:1215:48: sparse:     expected restricted __le=
32 [usertype] control
   drivers/usb/cdns3/gadget.c:1215:48: sparse:     got unsigned int [assign=
ed] [usertype] control
   drivers/usb/cdns3/gadget.c:1229:30: sparse: sparse: invalid assignment: =
|=3D
   drivers/usb/cdns3/gadget.c:1229:30: sparse:    left side has type restri=
cted __le32
   drivers/usb/cdns3/gadget.c:1229:30: sparse:    right side has type unsig=
ned long
   drivers/usb/cdns3/gadget.c:1255:36: sparse: sparse: restricted __le32 de=
grades to integer
   drivers/usb/cdns3/gadget.c:1255:30: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] control @@     got unsigned int @@
   drivers/usb/cdns3/gadget.c:1255:30: sparse:     expected restricted __le=
32 [usertype] control
   drivers/usb/cdns3/gadget.c:1255:30: sparse:     got unsigned int
   drivers/usb/cdns3/gadget.c:1010:29: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] buffer @@     got unsigned long @@
   drivers/usb/cdns3/gadget.c:1010:29: sparse:     expected restricted __le=
32 [usertype] buffer
   drivers/usb/cdns3/gadget.c:1010:29: sparse:     got unsigned long
   drivers/usb/cdns3/gadget.c:1013:29: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] buffer @@     got unsigned long @@
   drivers/usb/cdns3/gadget.c:1013:29: sparse:     expected restricted __le=
32 [usertype] buffer
   drivers/usb/cdns3/gadget.c:1013:29: sparse:     got unsigned long
   drivers/usb/cdns3/gadget.c:1019:21: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] length @@     got unsigned long @@
   drivers/usb/cdns3/gadget.c:1019:21: sparse:     expected restricted __le=
32 [usertype] length
   drivers/usb/cdns3/gadget.c:1019:21: sparse:     got unsigned long
   drivers/usb/cdns3/gadget.c:1029:37: sparse: sparse: invalid assignment: =
|=3D
   drivers/usb/cdns3/gadget.c:1029:37: sparse:    left side has type restri=
cted __le32
   drivers/usb/cdns3/gadget.c:1029:37: sparse:    right side has type unsig=
ned long
   drivers/usb/cdns3/gadget.c:1033:22: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] control @@     got unsigned int [assigned] [usertype] control @@
   drivers/usb/cdns3/gadget.c:1033:22: sparse:     expected restricted __le=
32 [usertype] control
   drivers/usb/cdns3/gadget.c:1033:22: sparse:     got unsigned int [assign=
ed] [usertype] control
   drivers/usb/cdns3/gadget.c:263:34: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected restricted __le32 [usertype]=
 buffer @@     got unsigned long @@
   drivers/usb/cdns3/gadget.c:263:34: sparse:     expected restricted __le3=
2 [usertype] buffer
   drivers/usb/cdns3/gadget.c:263:34: sparse:     got unsigned long
   drivers/usb/cdns3/gadget.c:264:35: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected restricted __le32 [usertype]=
 control @@     got unsigned long @@
   drivers/usb/cdns3/gadget.c:264:35: sparse:     expected restricted __le3=
2 [usertype] control
   drivers/usb/cdns3/gadget.c:264:35: sparse:     got unsigned long
   drivers/usb/cdns3/gadget.c:849:49: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/usb/cdns3/gadget.c:848:51: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected restricted __le32 [usertype]=
 control @@     got unsigned int @@
   drivers/usb/cdns3/gadget.c:848:51: sparse:     expected restricted __le3=
2 [usertype] control
   drivers/usb/cdns3/gadget.c:848:51: sparse:     got unsigned int
   drivers/usb/cdns3/gadget.c:852:49: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/usb/cdns3/gadget.c:851:51: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected restricted __le32 [usertype]=
 control @@     got unsigned int @@
   drivers/usb/cdns3/gadget.c:851:51: sparse:     expected restricted __le3=
2 [usertype] control
   drivers/usb/cdns3/gadget.c:851:51: sparse:     got unsigned int
   drivers/usb/cdns3/gadget.c:1393:17: sparse: sparse: restricted __le32 de=
grades to integer
   drivers/usb/cdns3/gadget.c:1442:21: sparse: sparse: restricted __le32 de=
grades to integer
   drivers/usb/cdns3/gadget.c:1574:35: sparse: sparse: dubious: x | !y
   drivers/usb/cdns3/gadget.c:2552:34: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] buffer @@     got unsigned long @@
   drivers/usb/cdns3/gadget.c:2552:34: sparse:     expected restricted __le=
32 [usertype] buffer
   drivers/usb/cdns3/gadget.c:2552:34: sparse:     got unsigned long
   drivers/usb/cdns3/gadget.c:2554:46: sparse: sparse: restricted __le32 de=
grades to integer
   drivers/usb/cdns3/gadget.c:2554:35: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] control @@     got unsigned long @@
   drivers/usb/cdns3/gadget.c:2554:35: sparse:     expected restricted __le=
32 [usertype] control
   drivers/usb/cdns3/gadget.c:2554:35: sparse:     got unsigned long
   drivers/usb/cdns3/gadget.c:2610:43: sparse: sparse: restricted __le32 de=
grades to integer
   drivers/usb/cdns3/gadget.c:2610:38: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] control @@     got unsigned long @@
   drivers/usb/cdns3/gadget.c:2610:38: sparse:     expected restricted __le=
32 [usertype] control
   drivers/usb/cdns3/gadget.c:2610:38: sparse:     got unsigned long
   drivers/usb/cdns3/gadget.c:2625:43: sparse: sparse: restricted __le32 de=
grades to integer
   drivers/usb/cdns3/gadget.c:2625:38: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] control @@     got unsigned long @@
   drivers/usb/cdns3/gadget.c:2625:38: sparse:     expected restricted __le=
32 [usertype] control
   drivers/usb/cdns3/gadget.c:2625:38: sparse:     got unsigned long
--
   include/linux/pm_runtime.h:183:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_get_noresume'
>> include/linux/pm_runtime.h:157:20: sparse:  the previous one is here
   include/linux/pm_runtime.h:184:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_put_noidle'
   include/linux/pm_runtime.h:158:20: sparse:  the previous one is here
   drivers/usb/cdns3/ep0.c:40:37: sparse: sparse: incorrect type in assignm=
ent (different base types) @@     expected restricted __le32 [usertype] buf=
fer @@     got unsigned long @@
   drivers/usb/cdns3/ep0.c:40:37: sparse:     expected restricted __le32 [u=
sertype] buffer
   drivers/usb/cdns3/ep0.c:40:37: sparse:     got unsigned long
   drivers/usb/cdns3/ep0.c:41:37: sparse: sparse: incorrect type in assignm=
ent (different base types) @@     expected restricted __le32 [usertype] len=
gth @@     got unsigned long @@
   drivers/usb/cdns3/ep0.c:41:37: sparse:     expected restricted __le32 [u=
sertype] length
   drivers/usb/cdns3/ep0.c:41:37: sparse:     got unsigned long
   drivers/usb/cdns3/ep0.c:44:46: sparse: sparse: incorrect type in assignm=
ent (different base types) @@     expected restricted __le32 [usertype] con=
trol @@     got unsigned long @@
   drivers/usb/cdns3/ep0.c:44:46: sparse:     expected restricted __le32 [u=
sertype] control
   drivers/usb/cdns3/ep0.c:44:46: sparse:     got unsigned long
   drivers/usb/cdns3/ep0.c:45:45: sparse: sparse: incorrect type in assignm=
ent (different base types) @@     expected restricted __le32 [usertype] buf=
fer @@     got unsigned long @@
   drivers/usb/cdns3/ep0.c:45:45: sparse:     expected restricted __le32 [u=
sertype] buffer
   drivers/usb/cdns3/ep0.c:45:45: sparse:     got unsigned long
   drivers/usb/cdns3/ep0.c:46:45: sparse: sparse: incorrect type in assignm=
ent (different base types) @@     expected restricted __le32 [usertype] len=
gth @@     got unsigned long @@
   drivers/usb/cdns3/ep0.c:46:45: sparse:     expected restricted __le32 [u=
sertype] length
   drivers/usb/cdns3/ep0.c:46:45: sparse:     got unsigned long
   drivers/usb/cdns3/ep0.c:47:46: sparse: sparse: incorrect type in assignm=
ent (different base types) @@     expected restricted __le32 [usertype] con=
trol @@     got unsigned long @@
   drivers/usb/cdns3/ep0.c:47:46: sparse:     expected restricted __le32 [u=
sertype] control
   drivers/usb/cdns3/ep0.c:47:46: sparse:     got unsigned long
   drivers/usb/cdns3/ep0.c:50:46: sparse: sparse: incorrect type in assignm=
ent (different base types) @@     expected restricted __le32 [usertype] con=
trol @@     got unsigned long @@
   drivers/usb/cdns3/ep0.c:50:46: sparse:     expected restricted __le32 [u=
sertype] control
   drivers/usb/cdns3/ep0.c:50:46: sparse:     got unsigned long
   drivers/usb/cdns3/ep0.c:267:52: sparse: sparse: incorrect type in argume=
nt 1 (different base types) @@     expected unsigned char [usertype] ep_add=
r @@     got restricted __le16 [usertype] wIndex @@
   drivers/usb/cdns3/ep0.c:267:52: sparse:     expected unsigned char [user=
type] ep_addr
   drivers/usb/cdns3/ep0.c:267:52: sparse:     got restricted __le16 [usert=
ype] wIndex
   drivers/usb/cdns3/ep0.c:271:47: sparse: sparse: incorrect type in argume=
nt 2 (different base types) @@     expected unsigned int [usertype] ep @@  =
   got restricted __le16 [usertype] wIndex @@
   drivers/usb/cdns3/ep0.c:271:47: sparse:     expected unsigned int [usert=
ype] ep
   drivers/usb/cdns3/ep0.c:271:47: sparse:     got restricted __le16 [usert=
ype] wIndex
   drivers/usb/cdns3/ep0.c:387:19: sparse: sparse: restricted __le16 degrad=
es to integer
   drivers/usb/cdns3/ep0.c:390:44: sparse: sparse: incorrect type in argume=
nt 1 (different base types) @@     expected unsigned char [usertype] ep_add=
r @@     got restricted __le16 [usertype] wIndex @@
   drivers/usb/cdns3/ep0.c:390:44: sparse:     expected unsigned char [user=
type] ep_addr
   drivers/usb/cdns3/ep0.c:390:44: sparse:     got restricted __le16 [usert=
ype] wIndex
   drivers/usb/cdns3/ep0.c:393:39: sparse: sparse: incorrect type in argume=
nt 2 (different base types) @@     expected unsigned int [usertype] ep @@  =
   got restricted __le16 [usertype] wIndex @@
   drivers/usb/cdns3/ep0.c:393:39: sparse:     expected unsigned int [usert=
ype] ep
   drivers/usb/cdns3/ep0.c:393:39: sparse:     got restricted __le16 [usert=
ype] wIndex
   drivers/usb/cdns3/ep0.c:454:21: sparse: sparse: restricted __le16 degrad=
es to integer
   drivers/usb/cdns3/ep0.c:478:31: sparse: sparse: incorrect type in assign=
ment (different base types) @@     expected unsigned short [usertype] isoch=
_delay @@     got restricted __le16 [usertype] wValue @@
   drivers/usb/cdns3/ep0.c:478:31: sparse:     expected unsigned short [use=
rtype] isoch_delay
   drivers/usb/cdns3/ep0.c:478:31: sparse:     got restricted __le16 [usert=
ype] wValue
--
   include/linux/pm_runtime.h:183:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_get_noresume'
>> include/linux/pm_runtime.h:157:20: sparse:  the previous one is here
   include/linux/pm_runtime.h:184:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_put_noidle'
   include/linux/pm_runtime.h:158:20: sparse:  the previous one is here
   drivers/usb/host/oxu210hp-hcd.c:890:35: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected restricted __le16 [user=
type] wHubCharacteristics @@     got unsigned short [usertype] @@
   drivers/usb/host/oxu210hp-hcd.c:890:35: sparse:     expected restricted =
__le16 [usertype] wHubCharacteristics
   drivers/usb/host/oxu210hp-hcd.c:890:35: sparse:     got unsigned short [=
usertype]
   drivers/usb/host/oxu210hp-hcd.c:942:32: sparse: sparse: cast removes add=
ress space '<asn:2>' of expression
   drivers/usb/host/oxu210hp-hcd.c:966:33: sparse: sparse: cast removes add=
ress space '<asn:2>' of expression
   drivers/usb/host/oxu210hp-hcd.c:1013:24: sparse: sparse: cast removes ad=
dress space '<asn:2>' of expression
   drivers/usb/host/oxu210hp-hcd.c:1037:20: sparse: sparse: subtraction of =
different types can't work (different address spaces)
   drivers/usb/host/oxu210hp-hcd.c:1070:23: sparse: sparse: cast removes ad=
dress space '<asn:2>' of expression
   drivers/usb/host/oxu210hp-hcd.c:1171:41: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected unsigned int [noderef]=
 <asn:2> @@     got restricted __le32 [usertype] @@
   drivers/usb/host/oxu210hp-hcd.c:1171:41: sparse:     expected unsigned i=
nt [noderef] <asn:2>
   drivers/usb/host/oxu210hp-hcd.c:1171:41: sparse:     got restricted __le=
32 [usertype]
   drivers/usb/host/oxu210hp-hcd.c:1188:26: sparse: sparse: cast removes ad=
dress space '<asn:2>' of expression
   drivers/usb/host/oxu210hp-hcd.c:2027:44: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/usb/host/oxu210hp-hcd.c:2027:41: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [use=
rtype] hw_token @@     got unsigned int @@
   drivers/usb/host/oxu210hp-hcd.c:2027:41: sparse:     expected restricted=
 __le32 [usertype] hw_token
   drivers/usb/host/oxu210hp-hcd.c:2027:41: sparse:     got unsigned int
   drivers/usb/host/oxu210hp-hcd.c:995:21: sparse: sparse: subtraction of d=
ifferent types can't work (different address spaces)
   drivers/usb/host/oxu210hp-hcd.c:995:21: sparse: sparse: subtraction of d=
ifferent types can't work (different address spaces)
   drivers/usb/host/oxu210hp-hcd.c:995:21: sparse: sparse: subtraction of d=
ifferent types can't work (different address spaces)
   drivers/usb/host/oxu210hp-hcd.c:995:21: sparse: sparse: subtraction of d=
ifferent types can't work (different address spaces)
--
   include/linux/pm_runtime.h:183:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_get_noresume'
>> include/linux/pm_runtime.h:157:20: sparse:  the previous one is here
   include/linux/pm_runtime.h:184:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_put_noidle'
   include/linux/pm_runtime.h:158:20: sparse:  the previous one is here
   drivers/usb/host/sl811-hcd.c:1788:24: sparse: sparse: symbol 'sl811h_dri=
ver' was not declared. Should it be static?
--
   include/linux/pm_runtime.h:183:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_get_noresume'
>> include/linux/pm_runtime.h:157:20: sparse:  the previous one is here
   include/linux/pm_runtime.h:184:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_put_noidle'
   include/linux/pm_runtime.h:158:20: sparse:  the previous one is here
   drivers/hid/hid-roccat-kone.c:103:28: sparse: sparse: incorrect type in =
assignment (different base types) @@     expected unsigned short [usertype]=
 checksum @@     got restricted __le16 [usertype] @@
   drivers/hid/hid-roccat-kone.c:103:28: sparse:     expected unsigned shor=
t [usertype] checksum
   drivers/hid/hid-roccat-kone.c:103:28: sparse:     got restricted __le16 =
[usertype]
   drivers/hid/hid-roccat-kone.c:262:19: sparse: sparse: cast to restricted=
 __le16
--
   include/linux/pm_runtime.h:183:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_get_noresume'
>> include/linux/pm_runtime.h:157:20: sparse:  the previous one is here
   include/linux/pm_runtime.h:184:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_put_noidle'
   include/linux/pm_runtime.h:158:20: sparse:  the previous one is here
   drivers/usb/gadget/udc/dummy_hcd.c:460:25: sparse: sparse: context imbal=
ance in 'set_link_state' - unexpected unlock
--
   include/linux/pm_runtime.h:183:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_get_noresume'
>> include/linux/pm_runtime.h:157:20: sparse:  the previous one is here
   include/linux/pm_runtime.h:184:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_put_noidle'
   include/linux/pm_runtime.h:158:20: sparse:  the previous one is here
   drivers/usb/gadget/udc/pxa27x_udc.c:2093:20: sparse: sparse: incorrect t=
ype in assignment (different base types) @@     expected restricted __le16 =
[assigned] [usertype] wValue @@     got int config @@
   drivers/usb/gadget/udc/pxa27x_udc.c:2093:20: sparse:     expected restri=
cted __le16 [assigned] [usertype] wValue
   drivers/usb/gadget/udc/pxa27x_udc.c:2093:20: sparse:     got int config
   drivers/usb/gadget/udc/pxa27x_udc.c:2122:20: sparse: sparse: incorrect t=
ype in assignment (different base types) @@     expected restricted __le16 =
[assigned] [usertype] wValue @@     got int alt @@
   drivers/usb/gadget/udc/pxa27x_udc.c:2122:20: sparse:     expected restri=
cted __le16 [assigned] [usertype] wValue
   drivers/usb/gadget/udc/pxa27x_udc.c:2122:20: sparse:     got int alt
   drivers/usb/gadget/udc/pxa27x_udc.c:2123:20: sparse: sparse: incorrect t=
ype in assignment (different base types) @@     expected restricted __le16 =
[assigned] [usertype] wIndex @@     got int iface @@
   drivers/usb/gadget/udc/pxa27x_udc.c:2123:20: sparse:     expected restri=
cted __le16 [assigned] [usertype] wIndex
   drivers/usb/gadget/udc/pxa27x_udc.c:2123:20: sparse:     got int iface
   drivers/usb/gadget/udc/pxa27x_udc.c:2306:17: sparse: sparse: incorrect t=
ype in initializer (different base types) @@     expected restricted __le16=
 [usertype] wMaxPacketSize @@     got unsigned int @@
   drivers/usb/gadget/udc/pxa27x_udc.c:2306:17: sparse:     expected restri=
cted __le16 [usertype] wMaxPacketSize
   drivers/usb/gadget/udc/pxa27x_udc.c:2306:17: sparse:     got unsigned int
   drivers/usb/gadget/udc/pxa27x_udc.c:2307:17: sparse: sparse: incorrect t=
ype in initializer (different base types) @@     expected restricted __le16=
 [usertype] wMaxPacketSize @@     got unsigned int @@
   drivers/usb/gadget/udc/pxa27x_udc.c:2307:17: sparse:     expected restri=
cted __le16 [usertype] wMaxPacketSize
   drivers/usb/gadget/udc/pxa27x_udc.c:2307:17: sparse:     got unsigned int
   drivers/usb/gadget/udc/pxa27x_udc.c:2308:17: sparse: sparse: incorrect t=
ype in initializer (different base types) @@     expected restricted __le16=
 [usertype] wMaxPacketSize @@     got unsigned int @@
   drivers/usb/gadget/udc/pxa27x_udc.c:2308:17: sparse:     expected restri=
cted __le16 [usertype] wMaxPacketSize
   drivers/usb/gadget/udc/pxa27x_udc.c:2308:17: sparse:     got unsigned int
   drivers/usb/gadget/udc/pxa27x_udc.c:2309:17: sparse: sparse: incorrect t=
ype in initializer (different base types) @@     expected restricted __le16=
 [usertype] wMaxPacketSize @@     got unsigned int @@
   drivers/usb/gadget/udc/pxa27x_udc.c:2309:17: sparse:     expected restri=
cted __le16 [usertype] wMaxPacketSize
   drivers/usb/gadget/udc/pxa27x_udc.c:2309:17: sparse:     got unsigned int
   drivers/usb/gadget/udc/pxa27x_udc.c:2310:17: sparse: sparse: incorrect t=
ype in initializer (different base types) @@     expected restricted __le16=
 [usertype] wMaxPacketSize @@     got unsigned int @@
   drivers/usb/gadget/udc/pxa27x_udc.c:2310:17: sparse:     expected restri=
cted __le16 [usertype] wMaxPacketSize
   drivers/usb/gadget/udc/pxa27x_udc.c:2310:17: sparse:     got unsigned int
   drivers/usb/gadget/udc/pxa27x_udc.c:2311:17: sparse: sparse: incorrect t=
ype in initializer (different base types) @@     expected restricted __le16=
 [usertype] wMaxPacketSize @@     got unsigned int @@
   drivers/usb/gadget/udc/pxa27x_udc.c:2311:17: sparse:     expected restri=
cted __le16 [usertype] wMaxPacketSize
   drivers/usb/gadget/udc/pxa27x_udc.c:2311:17: sparse:     got unsigned int
   drivers/usb/gadget/udc/pxa27x_udc.c:680:39: sparse: sparse: context imba=
lance in 'req_done' - unexpected unlock
--
   include/linux/pm_runtime.h:183:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_get_noresume'
>> include/linux/pm_runtime.h:157:20: sparse:  the previous one is here
   include/linux/pm_runtime.h:184:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_put_noidle'
   include/linux/pm_runtime.h:158:20: sparse:  the previous one is here
   drivers/usb/gadget/udc/mv_udc_core.c:67:33: sparse: sparse: incorrect ty=
pe in initializer (different base types) @@     expected restricted __le16 =
[usertype] wMaxPacketSize @@     got int @@
   drivers/usb/gadget/udc/mv_udc_core.c:67:33: sparse:     expected restric=
ted __le16 [usertype] wMaxPacketSize
   drivers/usb/gadget/udc/mv_udc_core.c:67:33: sparse:     got int
   drivers/usb/gadget/udc/mv_udc_core.c:367:24: sparse: sparse: incorrect t=
ype in assignment (different base types) @@     expected unsigned int [user=
type] buff_ptr0 @@     got restricted __le32 [usertype] @@
   drivers/usb/gadget/udc/mv_udc_core.c:367:24: sparse:     expected unsign=
ed int [usertype] buff_ptr0
   drivers/usb/gadget/udc/mv_udc_core.c:367:24: sparse:     got restricted =
__le32 [usertype]
   drivers/usb/gadget/udc/mv_udc_core.c:369:24: sparse: sparse: incorrect t=
ype in assignment (different base types) @@     expected unsigned int [user=
type] buff_ptr1 @@     got restricted __le32 [usertype] @@
   drivers/usb/gadget/udc/mv_udc_core.c:369:24: sparse:     expected unsign=
ed int [usertype] buff_ptr1
   drivers/usb/gadget/udc/mv_udc_core.c:369:24: sparse:     got restricted =
__le32 [usertype]
   drivers/usb/gadget/udc/mv_udc_core.c:370:24: sparse: sparse: incorrect t=
ype in assignment (different base types) @@     expected unsigned int [user=
type] buff_ptr2 @@     got restricted __le32 [usertype] @@
   drivers/usb/gadget/udc/mv_udc_core.c:370:24: sparse:     expected unsign=
ed int [usertype] buff_ptr2
   drivers/usb/gadget/udc/mv_udc_core.c:370:24: sparse:     got restricted =
__le32 [usertype]
   drivers/usb/gadget/udc/mv_udc_core.c:371:24: sparse: sparse: incorrect t=
ype in assignment (different base types) @@     expected unsigned int [user=
type] buff_ptr3 @@     got restricted __le32 [usertype] @@
   drivers/usb/gadget/udc/mv_udc_core.c:371:24: sparse:     expected unsign=
ed int [usertype] buff_ptr3
   drivers/usb/gadget/udc/mv_udc_core.c:371:24: sparse:     got restricted =
__le32 [usertype]
   drivers/usb/gadget/udc/mv_udc_core.c:372:24: sparse: sparse: incorrect t=
ype in assignment (different base types) @@     expected unsigned int [user=
type] buff_ptr4 @@     got restricted __le32 [usertype] @@
   drivers/usb/gadget/udc/mv_udc_core.c:372:24: sparse:     expected unsign=
ed int [usertype] buff_ptr4
   drivers/usb/gadget/udc/mv_udc_core.c:372:24: sparse:     got restricted =
__le32 [usertype]
   drivers/usb/gadget/udc/mv_udc_core.c:833:17: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] <asn:2> *addr @@     got unsigned int * @@
   drivers/usb/gadget/udc/mv_udc_core.c:833:17: sparse:     expected void c=
onst volatile [noderef] <asn:2> *addr
   drivers/usb/gadget/udc/mv_udc_core.c:833:17: sparse:     got unsigned in=
t *
   drivers/usb/gadget/udc/mv_udc_core.c:833:17: sparse: sparse: incorrect t=
ype in argument 2 (different address spaces) @@     expected void volatile =
[noderef] <asn:2> *addr @@     got unsigned int * @@
   drivers/usb/gadget/udc/mv_udc_core.c:833:17: sparse:     expected void v=
olatile [noderef] <asn:2> *addr
   drivers/usb/gadget/udc/mv_udc_core.c:833:17: sparse:     got unsigned in=
t *
   drivers/usb/gadget/udc/mv_udc_core.c:1456:41: sparse: sparse: incorrect =
type in assignment (different base types) @@     expected unsigned short [u=
sertype] @@     got restricted __le16 [usertype] @@
   drivers/usb/gadget/udc/mv_udc_core.c:1456:41: sparse:     expected unsig=
ned short [usertype]
   drivers/usb/gadget/udc/mv_udc_core.c:1456:41: sparse:     got restricted=
 __le16 [usertype]
   drivers/usb/gadget/udc/mv_udc_core.c:1516:26: sparse: sparse: cast from =
restricted __le16
   drivers/usb/gadget/udc/mv_udc_core.c:1546:31: sparse: sparse: restricted=
 __le16 degrades to integer
   drivers/usb/gadget/udc/mv_udc_core.c:1547:35: sparse: sparse: restricted=
 __le16 degrades to integer
   drivers/usb/gadget/udc/mv_udc_core.c:1568:30: sparse: sparse: restricted=
 __le16 degrades to integer
   drivers/usb/gadget/udc/mv_udc_core.c:1579:39: sparse: sparse: restricted=
 __le16 degrades to integer
   drivers/usb/gadget/udc/mv_udc_core.c:1580:43: sparse: sparse: restricted=
 __le16 degrades to integer
   drivers/usb/gadget/udc/mv_udc_core.c:1616:34: sparse: sparse: restricted=
 __le16 degrades to integer
   drivers/usb/gadget/udc/mv_udc_core.c:1625:52: sparse: sparse: restricted=
 __le16 degrades to integer
   drivers/usb/gadget/udc/mv_udc_core.c:1611:30: sparse: sparse: restricted=
 __le16 degrades to integer
   drivers/usb/gadget/udc/mv_udc_core.c:1611:30: sparse: sparse: restricted=
 __le16 degrades to integer
   drivers/usb/gadget/udc/mv_udc_core.c:1634:39: sparse: sparse: restricted=
 __le16 degrades to integer
   drivers/usb/gadget/udc/mv_udc_core.c:1635:43: sparse: sparse: restricted=
 __le16 degrades to integer
--
   include/linux/pm_runtime.h:183:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_get_noresume'
>> include/linux/pm_runtime.h:157:20: sparse:  the previous one is here
   include/linux/pm_runtime.h:184:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_put_noidle'
   include/linux/pm_runtime.h:158:20: sparse:  the previous one is here
   drivers/usb/usbip/usbip_common.c:418:33: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected unsigned int [usertype=
] command @@     got restricted __be32 [usertype] @@
   drivers/usb/usbip/usbip_common.c:418:33: sparse:     expected unsigned i=
nt [usertype] command
   drivers/usb/usbip/usbip_common.c:418:33: sparse:     got restricted __be=
32 [usertype]
   drivers/usb/usbip/usbip_common.c:419:33: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected unsigned int [usertype=
] seqnum @@     got restricted __be32 [usertype] @@
   drivers/usb/usbip/usbip_common.c:419:33: sparse:     expected unsigned i=
nt [usertype] seqnum
   drivers/usb/usbip/usbip_common.c:419:33: sparse:     got restricted __be=
32 [usertype]
   drivers/usb/usbip/usbip_common.c:420:33: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected unsigned int [usertype=
] devid @@     got restricted __be32 [usertype] @@
   drivers/usb/usbip/usbip_common.c:420:33: sparse:     expected unsigned i=
nt [usertype] devid
   drivers/usb/usbip/usbip_common.c:420:33: sparse:     got restricted __be=
32 [usertype]
   drivers/usb/usbip/usbip_common.c:421:33: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected unsigned int [usertype=
] direction @@     got restricted __be32 [usertype] @@
   drivers/usb/usbip/usbip_common.c:421:33: sparse:     expected unsigned i=
nt [usertype] direction
   drivers/usb/usbip/usbip_common.c:421:33: sparse:     got restricted __be=
32 [usertype]
   drivers/usb/usbip/usbip_common.c:422:33: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected unsigned int [usertype=
] ep @@     got restricted __be32 [usertype] @@
   drivers/usb/usbip/usbip_common.c:422:33: sparse:     expected unsigned i=
nt [usertype] ep
   drivers/usb/usbip/usbip_common.c:422:33: sparse:     got restricted __be=
32 [usertype]
   drivers/usb/usbip/usbip_common.c:424:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:424:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:424:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:424:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:424:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:424:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:425:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:425:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:425:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:425:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:425:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:425:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:426:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:426:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:426:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:426:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:426:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:426:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:427:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:427:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:427:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:427:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:427:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:427:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:428:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:428:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:428:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:428:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:428:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:428:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:436:37: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected unsigned int [usertype=
] transfer_flags @@     got restricted __be32 [usertype] @@
   drivers/usb/usbip/usbip_common.c:436:37: sparse:     expected unsigned i=
nt [usertype] transfer_flags
   drivers/usb/usbip/usbip_common.c:436:37: sparse:     got restricted __be=
32 [usertype]
   drivers/usb/usbip/usbip_common.c:443:39: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:443:39: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:443:39: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:443:39: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:443:39: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:443:39: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:474:29: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected unsigned int [usertype=
] seqnum @@     got restricted __be32 [usertype] @@
   drivers/usb/usbip/usbip_common.c:474:29: sparse:     expected unsigned i=
nt [usertype] seqnum
   drivers/usb/usbip/usbip_common.c:474:29: sparse:     got restricted __be=
32 [usertype]
   drivers/usb/usbip/usbip_common.c:476:31: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:476:31: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:476:31: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:476:31: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:476:31: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:476:31: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:526:33: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected unsigned int [usertype=
] offset @@     got restricted __be32 [usertype] @@
   drivers/usb/usbip/usbip_common.c:526:33: sparse:     expected unsigned i=
nt [usertype] offset
   drivers/usb/usbip/usbip_common.c:526:33: sparse:     got restricted __be=
32 [usertype]
   drivers/usb/usbip/usbip_common.c:527:33: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected unsigned int [usertype=
] length @@     got restricted __be32 [usertype] @@
   drivers/usb/usbip/usbip_common.c:527:33: sparse:     expected unsigned i=
nt [usertype] length
   drivers/usb/usbip/usbip_common.c:527:33: sparse:     got restricted __be=
32 [usertype]
   drivers/usb/usbip/usbip_common.c:528:33: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected unsigned int [usertype=
] status @@     got restricted __be32 [usertype] @@
   drivers/usb/usbip/usbip_common.c:528:33: sparse:     expected unsigned i=
nt [usertype] status
   drivers/usb/usbip/usbip_common.c:528:33: sparse:     got restricted __be=
32 [usertype]
   drivers/usb/usbip/usbip_common.c:529:36: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected unsigned int [usertype=
] actual_length @@     got restricted __be32 [usertype] @@
   drivers/usb/usbip/usbip_common.c:529:36: sparse:     expected unsigned i=
nt [usertype] actual_length
   drivers/usb/usbip/usbip_common.c:529:36: sparse:     got restricted __be=
32 [usertype]
   drivers/usb/usbip/usbip_common.c:531:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:531:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:531:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:531:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:531:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:531:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:532:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:532:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:532:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:532:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:532:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:532:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:533:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:533:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:533:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:533:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:533:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:533:35: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:534:38: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:534:38: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:534:38: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:534:38: sparse: sparse: cast to restric=
ted __be32
   drivers/usb/usbip/usbip_common.c:534:38: sparse: sparse: cast to restric=
ted __be32
--
   include/linux/pm_runtime.h:183:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_get_noresume'
>> include/linux/pm_runtime.h:157:20: sparse:  the previous one is here
   include/linux/pm_runtime.h:184:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_put_noidle'
   include/linux/pm_runtime.h:158:20: sparse:  the previous one is here
   drivers/usb/usbip/vhci_hcd.c:295:36: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le16 [usertyp=
e] DeviceRemovable @@     got int @@
   drivers/usb/usbip/vhci_hcd.c:295:36: sparse:     expected restricted __l=
e16 [usertype] DeviceRemovable
   drivers/usb/usbip/vhci_hcd.c:295:36: sparse:     got int
--
   include/linux/pm_runtime.h:183:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_get_noresume'
>> include/linux/pm_runtime.h:157:20: sparse:  the previous one is here
   include/linux/pm_runtime.h:184:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_put_noidle'
   include/linux/pm_runtime.h:158:20: sparse:  the previous one is here
   kernel/irq/irqdesc.c:875:17: sparse: sparse: context imbalance in '__irq=
_get_desc_lock' - wrong count at exit
--
   include/linux/pm_runtime.h:183:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_get_noresume'
>> include/linux/pm_runtime.h:157:20: sparse:  the previous one is here
   include/linux/pm_runtime.h:184:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_put_noidle'
   include/linux/pm_runtime.h:158:20: sparse:  the previous one is here
   drivers/gpio/gpio-viperboard.c:261:20: sparse: sparse: incorrect type in=
 assignment (different base types) @@     expected unsigned short [usertype=
] val @@     got restricted __be16 [usertype] @@
   drivers/gpio/gpio-viperboard.c:261:20: sparse:     expected unsigned sho=
rt [usertype] val
   drivers/gpio/gpio-viperboard.c:261:20: sparse:     got restricted __be16=
 [usertype]
   drivers/gpio/gpio-viperboard.c:262:21: sparse: sparse: incorrect type in=
 assignment (different base types) @@     expected unsigned short [usertype=
] mask @@     got restricted __be16 [usertype] @@
   drivers/gpio/gpio-viperboard.c:262:21: sparse:     expected unsigned sho=
rt [usertype] mask
   drivers/gpio/gpio-viperboard.c:262:21: sparse:     got restricted __be16=
 [usertype]
   drivers/gpio/gpio-viperboard.c:302:27: sparse: sparse: cast to restricte=
d __be16
   drivers/gpio/gpio-viperboard.c:302:27: sparse: sparse: cast to restricte=
d __be16
   drivers/gpio/gpio-viperboard.c:302:27: sparse: sparse: cast to restricte=
d __be16
   drivers/gpio/gpio-viperboard.c:302:27: sparse: sparse: cast to restricte=
d __be16
   drivers/gpio/gpio-viperboard.c:324:28: sparse: sparse: incorrect type in=
 assignment (different base types) @@     expected unsigned short [usertype=
] val @@     got restricted __be16 [usertype] @@
   drivers/gpio/gpio-viperboard.c:324:28: sparse:     expected unsigned sho=
rt [usertype] val
   drivers/gpio/gpio-viperboard.c:324:28: sparse:     got restricted __be16=
 [usertype]
   drivers/gpio/gpio-viperboard.c:325:29: sparse: sparse: incorrect type in=
 assignment (different base types) @@     expected unsigned short [usertype=
] mask @@     got restricted __be16 [usertype] @@
   drivers/gpio/gpio-viperboard.c:325:29: sparse:     expected unsigned sho=
rt [usertype] mask
   drivers/gpio/gpio-viperboard.c:325:29: sparse:     got restricted __be16=
 [usertype]
--
   include/linux/pm_runtime.h:183:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_get_noresume'
>> include/linux/pm_runtime.h:157:20: sparse:  the previous one is here
   include/linux/pm_runtime.h:184:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_put_noidle'
   include/linux/pm_runtime.h:158:20: sparse:  the previous one is here
   drivers/pci/pci.c:899:13: sparse: sparse: restricted pci_power_t degrade=
s to integer
   drivers/pci/pci.c:899:21: sparse: sparse: restricted pci_power_t degrade=
s to integer
   drivers/pci/pci.c:899:31: sparse: sparse: restricted pci_power_t degrade=
s to integer
   drivers/pci/pci.c:899:39: sparse: sparse: restricted pci_power_t degrade=
s to integer
   drivers/pci/pci.c:908:35: sparse: sparse: restricted pci_power_t degrade=
s to integer
   drivers/pci/pci.c:908:54: sparse: sparse: restricted pci_power_t degrade=
s to integer
   drivers/pci/pci.c:909:19: sparse: sparse: restricted pci_power_t degrade=
s to integer
   drivers/pci/pci.c:909:37: sparse: sparse: restricted pci_power_t degrade=
s to integer
   drivers/pci/pci.c:939:23: sparse: sparse: invalid assignment: |=3D
   drivers/pci/pci.c:939:23: sparse:    left side has type unsigned short
   drivers/pci/pci.c:939:23: sparse:    right side has type restricted pci_=
power_t
   drivers/pci/pci.c:944:57: sparse: sparse: restricted pci_power_t degrade=
s to integer
   drivers/pci/pci.c:966:28: sparse: sparse: incorrect type in assignment (=
different base types) @@     expected restricted pci_power_t [usertype] cur=
rent_state @@     got int @@
   drivers/pci/pci.c:966:28: sparse:     expected restricted pci_power_t [u=
sertype] current_state
   drivers/pci/pci.c:966:28: sparse:     got int
   drivers/pci/pci.c:1015:36: sparse: sparse: incorrect type in assignment =
(different base types) @@     expected restricted pci_power_t [usertype] cu=
rrent_state @@     got int @@
   drivers/pci/pci.c:1015:36: sparse:     expected restricted pci_power_t [=
usertype] current_state
   drivers/pci/pci.c:1015:36: sparse:     got int
   drivers/pci/pci.c:1193:13: sparse: sparse: restricted pci_power_t degrad=
es to integer
   drivers/pci/pci.c:1193:21: sparse: sparse: restricted pci_power_t degrad=
es to integer
   drivers/pci/pci.c:1195:18: sparse: sparse: restricted pci_power_t degrad=
es to integer
   drivers/pci/pci.c:1195:26: sparse: sparse: restricted pci_power_t degrad=
es to integer
   drivers/pci/pci.c:1218:13: sparse: sparse: restricted pci_power_t degrad=
es to integer
   drivers/pci/pci.c:1218:22: sparse: sparse: restricted pci_power_t degrad=
es to integer
   drivers/pci/pci.c:1225:46: sparse: sparse: restricted pci_power_t degrad=
es to integer
   drivers/pci/pci.c:1225:54: sparse: sparse: restricted pci_power_t degrad=
es to integer
   drivers/pci/pci.c:1768:36: sparse: sparse: incorrect type in assignment =
(different base types) @@     expected restricted pci_power_t [usertype] cu=
rrent_state @@     got int @@
   drivers/pci/pci.c:1768:36: sparse:     expected restricted pci_power_t [=
usertype] current_state
   drivers/pci/pci.c:1768:36: sparse:     got int
   drivers/pci/pci.c:2156:44: sparse: sparse: restricted pci_power_t degrad=
es to integer
   drivers/pci/pci.c:2457:61: sparse: sparse: restricted pci_power_t degrad=
es to integer
   drivers/pci/pci.c:2458:45: sparse: sparse: restricted pci_power_t degrad=
es to integer
   drivers/pci/pci.c:2624:20: sparse: sparse: restricted pci_power_t degrad=
es to integer
   drivers/pci/pci.c:2624:38: sparse: sparse: restricted pci_power_t degrad=
es to integer
   drivers/pci/pci.c:2647:49: sparse: sparse: restricted pci_power_t degrad=
es to integer
   drivers/pci/pci.c:2647:67: sparse: sparse: restricted pci_power_t degrad=
es to integer
   drivers/pci/pci.c:4647:13: sparse: sparse: invalid assignment: |=3D
   drivers/pci/pci.c:4647:13: sparse:    left side has type unsigned short
   drivers/pci/pci.c:4647:13: sparse:    right side has type restricted pci=
_power_t
   drivers/pci/pci.c:4652:13: sparse: sparse: invalid assignment: |=3D
   drivers/pci/pci.c:4652:13: sparse:    left side has type unsigned short
   drivers/pci/pci.c:4652:13: sparse:    right side has type restricted pci=
_power_t
--
   include/linux/pm_runtime.h:183:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_get_noresume'
>> include/linux/pm_runtime.h:157:20: sparse:  the previous one is here
   include/linux/pm_runtime.h:184:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_put_noidle'
   include/linux/pm_runtime.h:158:20: sparse:  the previous one is here
   drivers/pci/pci-driver.c:494:42: sparse: sparse: restricted pci_power_t =
degrades to integer
   drivers/pci/pci-driver.c:494:61: sparse: sparse: restricted pci_power_t =
degrades to integer
--
   include/linux/pm_runtime.h:183:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_get_noresume'
>> include/linux/pm_runtime.h:157:20: sparse:  the previous one is here
   include/linux/pm_runtime.h:184:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_put_noidle'
   include/linux/pm_runtime.h:158:20: sparse:  the previous one is here
--
   include/linux/pm_runtime.h:183:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_get_noresume'
>> include/linux/pm_runtime.h:157:20: sparse:  the previous one is here
   include/linux/pm_runtime.h:184:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_put_noidle'
   include/linux/pm_runtime.h:158:20: sparse:  the previous one is here
   drivers/pci/quirks.c:2287:57: sparse: sparse: restricted pci_power_t deg=
rades to integer
   include/asm-generic/io.h:479:15: sparse: sparse: cast to restricted __le=
16
   include/asm-generic/io.h:513:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned short [usertype] s @@=
     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:513:22: sparse:     expected unsigned short [us=
ertype] s
   include/asm-generic/io.h:513:22: sparse:     got restricted __le16 [user=
type]
--
   include/linux/pm_runtime.h:183:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_get_noresume'
>> include/linux/pm_runtime.h:157:20: sparse:  the previous one is here
   include/linux/pm_runtime.h:184:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_put_noidle'
   include/linux/pm_runtime.h:158:20: sparse:  the previous one is here
   drivers/video/fbdev/udlfb.c:1008:19: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected void const *addr @@   =
  got char [noderef] <asn:2> *screen_base @@
   drivers/video/fbdev/udlfb.c:1008:19: sparse:     expected void const *ad=
dr
   drivers/video/fbdev/udlfb.c:1008:19: sparse:     got char [noderef] <asn=
:2> *screen_base
   drivers/video/fbdev/udlfb.c:1121:36: sparse: sparse: cast removes addres=
s space '<asn:2>' of expression
--
   include/linux/pm_runtime.h:183:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_get_noresume'
>> include/linux/pm_runtime.h:157:20: sparse:  the previous one is here
   include/linux/pm_runtime.h:184:20: sparse: sparse: multiple definitions =
for function 'pm_runtime_put_noidle'
   include/linux/pm_runtime.h:158:20: sparse:  the previous one is here
   drivers/clk/clk.c:159:22: sparse: sparse: context imbalance in 'clk_enab=
le_lock' - different lock contexts for basic block

# https://github.com/0day-ci/linux/commit/89b94bda61375feace001bf5567bae629=
3277bd9
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 89b94bda61375feace001bf5567bae6293277bd9
vim +157 include/linux/pm_runtime.h

5e928f77a09a07 Rafael J. Wysocki   2009-08-18  155  =

372a12ed9d99c0 Ulf Hansson         2016-04-08  156  static inline void pm_s=
uspend_ignore_children(struct device *dev, bool enable) {}
5e928f77a09a07 Rafael J. Wysocki   2009-08-18 @157  static inline void pm_r=
untime_get_noresume(struct device *dev) {}
5e928f77a09a07 Rafael J. Wysocki   2009-08-18  158  static inline void pm_r=
untime_put_noidle(struct device *dev) {}
d690b2cd222afc Rafael J. Wysocki   2010-03-06  159  static inline bool pm_r=
untime_suspended(struct device *dev) { return false; }
fbadc58dd3a52c ShuoX Liu           2013-01-23  160  static inline bool pm_r=
untime_active(struct device *dev) { return true; }
f3393b62f157cc Kevin Hilman        2011-07-12  161  static inline bool pm_r=
untime_status_suspended(struct device *dev) { return false; }
4b31db8a16fa0d Rafael J. Wysocki   2010-12-24  162  static inline bool pm_r=
untime_enabled(struct device *dev) { return false; }
5e928f77a09a07 Rafael J. Wysocki   2009-08-18  163  =

7490e44239e602 Alan Stern          2010-09-25  164  static inline void pm_r=
untime_no_callbacks(struct device *dev) {}
c7b61de5b7b17f Alan Stern          2010-12-01  165  static inline void pm_r=
untime_irq_safe(struct device *dev) {}
3fb1581ea1ab0a Krzysztof Kozlowski 2014-11-14  166  static inline bool pm_r=
untime_is_irq_safe(struct device *dev) { return false; }
2f60ba706bd9af Rafael J. Wysocki   2010-05-10  167  =

cb8f51bdadb796 Rafael J. Wysocki   2011-02-08  168  static inline bool pm_r=
untime_callbacks_present(struct device *dev) { return false; }
15bcb91d7e607d Alan Stern          2010-09-25  169  static inline void pm_r=
untime_mark_last_busy(struct device *dev) {}
15bcb91d7e607d Alan Stern          2010-09-25  170  static inline void __pm=
_runtime_use_autosuspend(struct device *dev,
15bcb91d7e607d Alan Stern          2010-09-25  171  						bool use) {}
15bcb91d7e607d Alan Stern          2010-09-25  172  static inline void pm_r=
untime_set_autosuspend_delay(struct device *dev,
15bcb91d7e607d Alan Stern          2010-09-25  173  						int delay) {}
8234f6734c5d74 Vincent Guittot     2018-12-14  174  static inline u64 pm_ru=
ntime_autosuspend_expiration(
15bcb91d7e607d Alan Stern          2010-09-25  175  				struct device *dev)=
 { return 0; }
e823407f7b11fa Ming Lei            2013-02-22  176  static inline void pm_r=
untime_set_memalloc_noio(struct device *dev,
e823407f7b11fa Ming Lei            2013-02-22  177  						bool enable){}
21d5c57b372616 Rafael J. Wysocki   2016-10-30  178  static inline void pm_r=
untime_clean_up_links(struct device *dev) {}
b06c0b2f087ab4 Rafael J. Wysocki   2018-06-12  179  static inline void pm_r=
untime_get_suppliers(struct device *dev) {}
b06c0b2f087ab4 Rafael J. Wysocki   2018-06-12  180  static inline void pm_r=
untime_put_suppliers(struct device *dev) {}
baa8809f60971d Rafael J. Wysocki   2016-10-30  181  static inline void pm_r=
untime_new_link(struct device *dev) {}
baa8809f60971d Rafael J. Wysocki   2016-10-30  182  static inline void pm_r=
untime_drop_link(struct device *dev) {}
89b94bda61375f Chen Yu             2020-06-06 @183  static inline void pm_r=
untime_get_noresume(struct device *dev) {}
89b94bda61375f Chen Yu             2020-06-06  184  static inline void pm_r=
untime_put_noidle(struct device *dev) {}
15bcb91d7e607d Alan Stern          2010-09-25  185  =


:::::: The code at line 157 was first introduced by commit
:::::: 5e928f77a09a07f9dd595bb8a489965d69a83458 PM: Introduce core framewor=
k for run-time PM of I/O devices (rev. 17)

:::::: TO: Rafael J. Wysocki <rjw@sisk.pl>
:::::: CC: Rafael J. Wysocki <rjw@sisk.pl>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0436112007806736826==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============0436112007806736826==--

