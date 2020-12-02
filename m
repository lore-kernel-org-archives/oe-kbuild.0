Content-Type: multipart/mixed; boundary="===============0981812609095720711=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/hwmon/axi-fan-control.c:355:9: warning: Identical condition 'ret', second condition is always false
Date: Wed, 02 Dec 2020 23:03:12 +0800
Message-ID: <202012022356.qIxgX95s-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0981812609095720711==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Nuno S=C3=A1" <nuno.sa@analog.com>
CC: Guenter Roeck <linux@roeck-us.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   509a15421674b9e1a3e1916939d0d0efd3e578da
commit: 8412b410fa5e1e494a0fec84c3c462d49870d3f5 hwmon: Support ADI Fan Con=
trol IP
date:   9 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 9 months ago
compiler: sh4-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

        ^
>> fs/binfmt_elf_fdpic.c:895:6: warning: Variable 'seg' is reassigned a val=
ue before the old one has been used. 'break;' missing? [redundantAssignInSw=
itch]
    seg =3D loadmap->segs;
        ^
   fs/binfmt_elf_fdpic.c:764:6: note: Variable 'seg' is reassigned a value =
before the old one has been used. 'break;' missing?
    seg =3D loadmap->segs;
        ^
   fs/binfmt_elf_fdpic.c:895:6: note: Variable 'seg' is reassigned a value =
before the old one has been used. 'break;' missing?
    seg =3D loadmap->segs;
        ^
>> fs/binfmt_elf_fdpic.c:552:25: warning: Null pointer dereference [nullPoi=
nter]
     platform_len =3D strlen(k_base_platform) + 1;
                           ^
   fs/binfmt_elf_fdpic.c:868:6: warning: Variable 'seg' is reassigned a val=
ue before the old one has been used. 'break;' missing? [redundantAssignInSw=
itch]
    seg =3D mseg + 1;
        ^
   fs/binfmt_elf_fdpic.c:764:6: note: Variable 'seg' is reassigned a value =
before the old one has been used. 'break;' missing?
    seg =3D loadmap->segs;
        ^
   fs/binfmt_elf_fdpic.c:868:6: note: Variable 'seg' is reassigned a value =
before the old one has been used. 'break;' missing?
    seg =3D mseg + 1;
        ^
>> drivers/misc/ics932s401.c:138:38: warning: Shifting a negative value is =
technically undefined behaviour [shiftNegativeLHS]
     data->regs[regs_to_copy[i]] =3D temp >> 8;
                                        ^
--
>> net/mac802154/cfg.c:272:2: warning: Address of local auto-variable assig=
ned to a function parameter. [autoVariables]
    *table =3D &sdata->sec.table;
    ^
--
>> drivers/input/gameport/ns558.c:103:27: warning: Shifting a negative valu=
e is technically undefined behaviour [shiftNegativeLHS]
     release_region(io & (-1 << (i - 1)), (1 << (i - 1)));
                             ^
   drivers/input/gameport/ns558.c:105:32: warning: Shifting a negative valu=
e is technically undefined behaviour [shiftNegativeLHS]
     if (!request_region(io & (-1 << i), (1 << i), "ns558-isa"))
                                  ^
   drivers/input/gameport/ns558.c:108:23: warning: Shifting a negative valu=
e is technically undefined behaviour [shiftNegativeLHS]
     outb(0xff, io & (-1 << i));
                         ^
   drivers/input/gameport/ns558.c:110:21: warning: Shifting a negative valu=
e is technically undefined behaviour [shiftNegativeLHS]
      if (inb(io & (-1 << i)) !=3D inb((io & (-1 << i)) + (1 << i) - 1)) b+=
+;
                       ^
   drivers/input/gameport/ns558.c:114:28: warning: Shifting a negative valu=
e is technically undefined behaviour [shiftNegativeLHS]
      release_region(io & (-1 << i), (1 << i));
                              ^
   drivers/input/gameport/ns558.c:122:32: warning: Shifting a negative valu=
e is technically undefined behaviour [shiftNegativeLHS]
     if (!request_region(io & (-1 << i), (1 << i), "ns558-isa"))
                                  ^
   drivers/input/gameport/ns558.c:130:27: warning: Shifting a negative valu=
e is technically undefined behaviour [shiftNegativeLHS]
     release_region(io & (-1 << i), (1 << i));
                             ^
   drivers/input/gameport/ns558.c:142:56: warning: Shifting a negative valu=
e is technically undefined behaviour [shiftNegativeLHS]
    gameport_set_phys(port, "isa%04x/gameport0", io & (-1 << i));
                                                          ^
--
>> drivers/hwmon/axi-fan-control.c:355:9: warning: Identical condition 'ret=
', second condition is always false [identicalConditionAfterEarlyExit]
    return ret;
           ^
   drivers/hwmon/axi-fan-control.c:338:6: note: first condition
    if (ret)
        ^
   drivers/hwmon/axi-fan-control.c:355:9: note: second condition
    return ret;
           ^
--
>> drivers/hwmon/nct6775.c:2095:9: warning: %d in format string (no. 1) req=
uires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_=
sint]
    return sprintf(buf, "%dn", data->rpm[nr]);
           ^
   drivers/hwmon/nct6775.c:2105:9: warning: %d in format string (no. 1) req=
uires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_=
sint]
    return sprintf(buf, "%dn",
           ^
   drivers/hwmon/nct6775.c:2884:9: warning: %d in format string (no. 1) req=
uires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_=
sint]
    return sprintf(buf, "%dn",
           ^
   drivers/hwmon/nct6775.c:3100:9: warning: %d in format string (no. 1) req=
uires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_=
sint]
    return sprintf(buf, "%dn",
           ^
>> drivers/hwmon/sht15.c:348:9: warning: Identical condition 'ret', second =
condition is always false [identicalConditionAfterEarlyExit]
    return ret;
           ^
   drivers/hwmon/sht15.c:342:6: note: first condition
    if (ret)
        ^
   drivers/hwmon/sht15.c:348:9: note: second condition
    return ret;
           ^
--
   drivers/hwmon/w83627ehf.c:1029:1: warning: %d in format string (no. 1) r=
equires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgTyp=
e_sint]
   fan_time_functions(fan_stop_time, W83627EHF_REG_FAN_STOP_TIME)
   ^
>> drivers/hwmon/w83627ehf.c:865:19: warning: Shifting a negative value is =
technically undefined behaviour [shiftNegativeLHS]
    reg |=3D (val - 1) << W83627EHF_PWM_ENABLE_SHIFT[channel];
                     ^

vim +/ret +355 drivers/hwmon/axi-fan-control.c

8412b410fa5e1e4 Nuno S=C3=A1 2019-10-09  330  =

8412b410fa5e1e4 Nuno S=C3=A1 2019-10-09  331  static int axi_fan_control_in=
it(struct axi_fan_control_data *ctl,
8412b410fa5e1e4 Nuno S=C3=A1 2019-10-09  332  				const struct device_node =
*np)
8412b410fa5e1e4 Nuno S=C3=A1 2019-10-09  333  {
8412b410fa5e1e4 Nuno S=C3=A1 2019-10-09  334  	int ret;
8412b410fa5e1e4 Nuno S=C3=A1 2019-10-09  335  =

8412b410fa5e1e4 Nuno S=C3=A1 2019-10-09  336  	/* get fan pulses per revolu=
tion */
8412b410fa5e1e4 Nuno S=C3=A1 2019-10-09  337  	ret =3D of_property_read_u32=
(np, "pulses-per-revolution", &ctl->ppr);
8412b410fa5e1e4 Nuno S=C3=A1 2019-10-09  338  	if (ret)
8412b410fa5e1e4 Nuno S=C3=A1 2019-10-09  339  		return ret;
8412b410fa5e1e4 Nuno S=C3=A1 2019-10-09  340  =

8412b410fa5e1e4 Nuno S=C3=A1 2019-10-09  341  	/* 1, 2 and 4 are the typica=
l and accepted values */
8412b410fa5e1e4 Nuno S=C3=A1 2019-10-09  342  	if (ctl->ppr !=3D 1 && ctl->=
ppr !=3D 2 && ctl->ppr !=3D 4)
8412b410fa5e1e4 Nuno S=C3=A1 2019-10-09  343  		return -EINVAL;
8412b410fa5e1e4 Nuno S=C3=A1 2019-10-09  344  	/*
8412b410fa5e1e4 Nuno S=C3=A1 2019-10-09  345  	 * Enable all IRQs
8412b410fa5e1e4 Nuno S=C3=A1 2019-10-09  346  	 */
8412b410fa5e1e4 Nuno S=C3=A1 2019-10-09  347  	axi_iowrite(ADI_IRQ_MASK_OUT=
_ALL &
8412b410fa5e1e4 Nuno S=C3=A1 2019-10-09  348  		    ~(ADI_IRQ_SRC_NEW_MEASU=
R | ADI_IRQ_SRC_TACH_ERR |
8412b410fa5e1e4 Nuno S=C3=A1 2019-10-09  349  		      ADI_IRQ_SRC_PWM_CHANG=
ED | ADI_IRQ_SRC_TEMP_INCREASE),
8412b410fa5e1e4 Nuno S=C3=A1 2019-10-09  350  		    ADI_REG_IRQ_MASK, ctl);
8412b410fa5e1e4 Nuno S=C3=A1 2019-10-09  351  =

8412b410fa5e1e4 Nuno S=C3=A1 2019-10-09  352  	/* bring the device out of r=
eset */
8412b410fa5e1e4 Nuno S=C3=A1 2019-10-09  353  	axi_iowrite(0x01, ADI_REG_RS=
TN, ctl);
8412b410fa5e1e4 Nuno S=C3=A1 2019-10-09  354  =

8412b410fa5e1e4 Nuno S=C3=A1 2019-10-09 @355  	return ret;
8412b410fa5e1e4 Nuno S=C3=A1 2019-10-09  356  }
8412b410fa5e1e4 Nuno S=C3=A1 2019-10-09  357  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0981812609095720711==--

