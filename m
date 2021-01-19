Content-Type: multipart/mixed; boundary="===============7917394156284794480=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/platform/x86/panasonic-laptop.c:495:9: warning: %u in format string (no. 1) requires 'unsigned int' but the argument type is 'signed int'.
Date: Tue, 19 Jan 2021 12:25:41 +0800
Message-ID: <202101191232.h9jOYKfR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7917394156284794480==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kenneth Chan <kenneth.t.chan@gmail.com>
CC: Hans de Goede <hdegoede@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1e2a199f6ccdc15cf111d68d212e2fd4ce65682e
commit: 008563513348a5ab0324fb8976172fe56c939450 platform/x86: panasonic-la=
ptop: Fix sticky key init bug
date:   2 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 2 months ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"cppcheck warnings: (new ones prefixed by >>)"
>> kernel/trace/trace_events_synth.c:530:22: warning: Pointer addition with=
 NULL pointer. [nullPointerArithmetic]
    pos +=3D snprintf(buf + pos, LEN_OR_ZERO, """);
                        ^
   kernel/trace/trace_events_synth.c:562:43: note: Calling function '__set_=
synth_event_print_fmt', 2nd argument 'NULL' value is 0
    len =3D __set_synth_event_print_fmt(event, NULL, 0);
                                             ^
   kernel/trace/trace_events_synth.c:530:22: note: Null pointer addition
    pos +=3D snprintf(buf + pos, LEN_OR_ZERO, """);
                        ^
   kernel/trace/trace_events_synth.c:537:22: warning: Pointer addition with=
 NULL pointer. [nullPointerArithmetic]
    pos +=3D snprintf(buf + pos, LEN_OR_ZERO, """);
                        ^
   kernel/trace/trace_events_synth.c:562:43: note: Calling function '__set_=
synth_event_print_fmt', 2nd argument 'NULL' value is 0
    len =3D __set_synth_event_print_fmt(event, NULL, 0);
                                             ^
   kernel/trace/trace_events_synth.c:537:22: note: Null pointer addition
    pos +=3D snprintf(buf + pos, LEN_OR_ZERO, """);
                        ^
>> net/atm/ioctl.c:208:40: warning: Uninitialized variable: number [uninitv=
ar]
     error =3D atm_dev_ioctl(cmd, buf, len, number, compat);
                                          ^
--

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/regulator/da903x-regulator.c:391:2: warning: Division by zero. [=
zerodiv]
    DA9030_LDO(13, 2100, 2100, 0, INVAL, 0, 0, RCTL11, 3), /* fixed @2.1V */
    ^
   drivers/regulator/da903x-regulator.c:411:2: warning: Division by zero. [=
zerodiv]
    DA9034_LDO(5, 3100, 3100, 0, INVAL, 0, 0, OVER3, 7), /* fixed @3.1V */
    ^
--
>> drivers/platform/x86/panasonic-laptop.c:495:9: warning: %u in format str=
ing (no. 1) requires 'unsigned int' but the argument type is 'signed int'. =
[invalidPrintfArgType_uint]
    return snprintf(buf, PAGE_SIZE, "%un", pcc->sticky_key);
           ^
--
>> kernel/bpf/bpf_iter.c:420:12: warning: Boolean result is used in bitwise=
 operation. Clarify expression with parentheses. [clarifyCondition]
    if (!ulen ^ !ubuf)
              ^
   kernel/bpf/bpf_iter.c:480:14: warning: Boolean result is used in bitwise=
 operation. Clarify expression with parentheses. [clarifyCondition]
    if (!ulinfo ^ !linfo_len)
                ^
>> net/smc/smc_clc.c:46:36: warning: Variable 'smcd_v2_ext' is not assigned=
 a value. [unassignedVariable]
    struct smc_clc_smcd_v2_extension *smcd_v2_ext;
                                      ^

vim +495 drivers/platform/x86/panasonic-laptop.c

709ee531c153038d drivers/misc/panasonic-laptop.c         Harald Welte 2008-=
09-23  485  =

80373ad0edb53b5f drivers/platform/x86/panasonic-laptop.c Kenneth Chan 2020-=
08-22  486  static ssize_t sticky_key_show(struct device *dev, struct devic=
e_attribute *attr,
709ee531c153038d drivers/misc/panasonic-laptop.c         Harald Welte 2008-=
09-23  487  			   char *buf)
709ee531c153038d drivers/misc/panasonic-laptop.c         Harald Welte 2008-=
09-23  488  {
709ee531c153038d drivers/misc/panasonic-laptop.c         Harald Welte 2008-=
09-23  489  	struct acpi_device *acpi =3D to_acpi_device(dev);
709ee531c153038d drivers/misc/panasonic-laptop.c         Harald Welte 2008-=
09-23  490  	struct pcc_acpi *pcc =3D acpi_driver_data(acpi);
709ee531c153038d drivers/misc/panasonic-laptop.c         Harald Welte 2008-=
09-23  491  =

e253fb944d3335a2 drivers/platform/x86/panasonic-laptop.c Jean Delvare 2010-=
10-21  492  	if (!acpi_pcc_retrieve_biosdata(pcc))
709ee531c153038d drivers/misc/panasonic-laptop.c         Harald Welte 2008-=
09-23  493  		return -EIO;
709ee531c153038d drivers/misc/panasonic-laptop.c         Harald Welte 2008-=
09-23  494  =

008563513348a5ab drivers/platform/x86/panasonic-laptop.c Kenneth Chan 2020-=
08-22 @495  	return snprintf(buf, PAGE_SIZE, "%u\n", pcc->sticky_key);
709ee531c153038d drivers/misc/panasonic-laptop.c         Harald Welte 2008-=
09-23  496  }
709ee531c153038d drivers/misc/panasonic-laptop.c         Harald Welte 2008-=
09-23  497  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7917394156284794480==--

