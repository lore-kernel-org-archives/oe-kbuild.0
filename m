Content-Type: multipart/mixed; boundary="===============1184149298079196896=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/events/intel/uncore.c:847:4: warning: %u in format string (no. 1) requires 'unsigned int' but the argument type is 'signed int'. [invalidPrintfArgType_uint]
Date: Thu, 23 Dec 2021 10:54:20 +0800
Message-ID: <202112230952.D4l7X5OD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1184149298079196896==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kan Liang <kan.liang@linux.intel.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   bc491fb12513e79702c6f936c838f792b5389129
commit: d6c754130435ab786711bed75d04a2388a6b4da8 perf/x86/intel/uncore: Gen=
eric support for the MSR type of uncore blocks
date:   9 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 9 months ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> fs/nls/nls_base.c:108:27: warning: Shifting by a negative value is undef=
ined behaviour [shiftNegative]
       *s =3D (u8) (0x80 | ((l >> c) & 0x3F));
                             ^
>> arch/x86/kernel/e820.c:1198:2: warning: int result is returned as long v=
alue. If the return value is long to avoid loss of information, then you ha=
ve loss of information. [truncLongCastReturn]
    return 64*1024*1024;
    ^
--
>> drivers/hwmon/w83791d.c:561:9: warning: %u in format string (no. 1) requ=
ires 'unsigned int' but the argument type is 'signed int'. [invalidPrintfAr=
gType_uint]
    return sprintf(buf, "%un", DIV_FROM_REG(data->fan_div[nr]));
           ^
>> lib/lz4/lz4_decompress.c:90:55: warning: Pointer addition with NULL poin=
ter. [nullPointerArithmetic]
    const BYTE * const dictEnd =3D (const BYTE *)dictStart + dictSize;
                                                         ^
   lib/lz4/lz4_decompress.c:462:33: note: Calling function 'LZ4_decompress_=
generic', 9th argument 'NULL' value is 0
             noDict, (BYTE *)dest, NULL, 0);
                                   ^
   lib/lz4/lz4_decompress.c:90:55: note: Null pointer addition
    const BYTE * const dictEnd =3D (const BYTE *)dictStart + dictSize;
                                                         ^
>> lib/glob.c:48:0: warning: Redundant assignment of 'back_str' to itself. =
[selfAssignment]
    char const *back_pat =3D NULL, *back_str =3D back_str;
   ^
>> kernel/module.c:2440:26: warning: Redundant assignment of 'mod->core_lay=
out.size' to itself. [selfAssignment]
      mod->core_layout.size =3D debug_align(mod->core_layout.size);
                            ^
   kernel/module.c:2444:26: warning: Redundant assignment of 'mod->core_lay=
out.size' to itself. [selfAssignment]
      mod->core_layout.size =3D debug_align(mod->core_layout.size);
                            ^
   kernel/module.c:2448:26: warning: Redundant assignment of 'mod->core_lay=
out.size' to itself. [selfAssignment]
      mod->core_layout.size =3D debug_align(mod->core_layout.size);
                            ^
   kernel/module.c:2452:26: warning: Redundant assignment of 'mod->core_lay=
out.size' to itself. [selfAssignment]
      mod->core_layout.size =3D debug_align(mod->core_layout.size);
                            ^
>> kernel/module.c:2474:26: warning: Redundant assignment of 'mod->init_lay=
out.size' to itself. [selfAssignment]
      mod->init_layout.size =3D debug_align(mod->init_layout.size);
                            ^
   kernel/module.c:2478:26: warning: Redundant assignment of 'mod->init_lay=
out.size' to itself. [selfAssignment]
      mod->init_layout.size =3D debug_align(mod->init_layout.size);
                            ^
   kernel/module.c:2489:26: warning: Redundant assignment of 'mod->init_lay=
out.size' to itself. [selfAssignment]
      mod->init_layout.size =3D debug_align(mod->init_layout.size);
                            ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/proc/array.c:532:0: warning: syntax error [syntaxError]
   =

   ^
--
>> drivers/acpi/device_sysfs.c:176:3: warning: Assignment of function param=
eter has no effect outside the function. [uselessAssignmentArg]
     size -=3D count;
     ^
>> mm/percpu.c:2406:9: warning: Unused variable: static_size [unusedVariabl=
e]
    size_t static_size, dyn_size;
           ^
>> mm/percpu.c:2406:22: warning: Unused variable: dyn_size [unusedVariable]
    size_t static_size, dyn_size;
                        ^
>> mm/percpu.c:2407:21: warning: Unused variable: chunk [unusedVariable]
    struct pcpu_chunk *chunk;
                       ^
>> mm/percpu.c:2414:6: warning: Unused variable: map_size [unusedVariable]
    int map_size;
        ^
>> mm/percpu.c:2415:16: warning: Unused variable: tmp_addr [unusedVariable]
    unsigned long tmp_addr;
                  ^
   mm/percpu.c:2417:23: warning: Unused variable: type [unusedVariable]
    enum pcpu_chunk_type type;
                         ^
>> drivers/acpi/proc.c:104:2: warning: sscanf() without field width limits =
can crash with huge input data. [invalidscanf]
    sscanf(strbuf, "%s", str);
    ^
>> fs/unicode/utf8-selftest.c:182:3: warning: Conversion of string literal =
"" to bool always evaluates to true. [incorrectStringBooleanError]
     test((utf8len(data, nfdi_test_data[i].str) =3D=3D nlen));
     ^
   fs/unicode/utf8-selftest.c:183:3: warning: Conversion of string literal =
"" to bool always evaluates to true. [incorrectStringBooleanError]
     test((utf8nlen(data, nfdi_test_data[i].str, len) =3D=3D nlen));
     ^
   fs/unicode/utf8-selftest.c:189:4: warning: Conversion of string literal =
"Unexpected byte 0x%x should be 0x%xn" to bool always evaluates to true. [i=
ncorrectStringBooleanError]
      test_f((c =3D=3D nfdi_test_data[i].dec[j]),
      ^
   fs/unicode/utf8-selftest.c:195:3: warning: Conversion of string literal =
"" to bool always evaluates to true. [incorrectStringBooleanError]
     test((j =3D=3D nlen));
     ^
   fs/unicode/utf8-selftest.c:218:3: warning: Conversion of string literal =
"" to bool always evaluates to true. [incorrectStringBooleanError]
     test((utf8len(data, nfdicf_test_data[i].str) =3D=3D nlen));
     ^
   fs/unicode/utf8-selftest.c:219:3: warning: Conversion of string literal =
"" to bool always evaluates to true. [incorrectStringBooleanError]
     test((utf8nlen(data, nfdicf_test_data[i].str, len) =3D=3D nlen));
     ^
   fs/unicode/utf8-selftest.c:225:4: warning: Conversion of string literal =
"Unexpected byte 0x%x should be 0x%xn" to bool always evaluates to true. [i=
ncorrectStringBooleanError]
      test_f((c =3D=3D nfdicf_test_data[i].ncf[j]),
      ^
   fs/unicode/utf8-selftest.c:231:3: warning: Conversion of string literal =
"" to bool always evaluates to true. [incorrectStringBooleanError]
     test((j =3D=3D nlen));
     ^
   fs/unicode/utf8-selftest.c:252:3: warning: Conversion of string literal =
"%s %s comparison mismatchn" to bool always evaluates to true. [incorrectSt=
ringBooleanError]
     test_f(!utf8_strncmp(table, &s1, &s2),
     ^
   fs/unicode/utf8-selftest.c:262:3: warning: Conversion of string literal =
"%s %s comparison mismatchn" to bool always evaluates to true. [incorrectSt=
ringBooleanError]
     test_f(!utf8_strncasecmp(table, &s1, &s2),
     ^
   fs/unicode/utf8-selftest.c:272:2: warning: Conversion of string literal =
"" to bool always evaluates to true. [incorrectStringBooleanError]
    test(utf8version_is_supported(7, 0, 0));
    ^
   fs/unicode/utf8-selftest.c:275:2: warning: Conversion of string literal =
"" to bool always evaluates to true. [incorrectStringBooleanError]
    test(utf8version_is_supported(9, 0, 0));
    ^
   fs/unicode/utf8-selftest.c:278:2: warning: Conversion of string literal =
"" to bool always evaluates to true. [incorrectStringBooleanError]
    test(utf8version_is_supported(latest_maj, latest_min, latest_rev));
    ^
   fs/unicode/utf8-selftest.c:281:2: warning: Conversion of string literal =
"" to bool always evaluates to true. [incorrectStringBooleanError]
    test(!utf8version_is_supported(13, 0, 0));
    ^
   fs/unicode/utf8-selftest.c:282:2: warning: Conversion of string literal =
"" to bool always evaluates to true. [incorrectStringBooleanError]
    test(!utf8version_is_supported(0, 0, 0));
    ^
   fs/unicode/utf8-selftest.c:283:2: warning: Conversion of string literal =
"" to bool always evaluates to true. [incorrectStringBooleanError]
    test(!utf8version_is_supported(-1, -1, -1));
    ^
--
>> drivers/acpi/sysfs.c:383:3: warning: %u in format string (no. 1) require=
s 'unsigned int' but the argument type is 'signed int'. [invalidPrintfArgTy=
pe_uint]
     snprintf(instance_str, sizeof(instance_str), "%u",
     ^
>> fs/nls/nls_base.c:108:30: warning: Suspicious code: sign conversion of c=
 in calculation, even though c can have a negative value [signConversion]
       *s =3D (u8) (0x80 | ((l >> c) & 0x3F));
                                ^
--
>> net/core/datagram.c:607:4: warning: Assignment of function parameter has=
 no effect outside the function. [uselessAssignmentArg]
      offset +=3D copy;
      ^
>> drivers/iio/light/apds9960.c:768:16: warning: Suspicious condition (assi=
gnment + comparison); Clarify expression with parentheses. [clarifyConditio=
n]
    while (cnt || (cnt =3D apds9660_fifo_is_empty(data) > 0)) {
                  ^
--
>> drivers/iio/light/cm32181.c:400:10: warning: %u in format string (no. 1)=
 requires 'unsigned int' but the argument type is 'signed int'. [invalidPri=
ntfArgType_uint]
     len +=3D sprintf(buf + len, "0.%06u ", cm32181->als_it_values[i]);
            ^
--
>> drivers/iio/light/isl29018.c:275:10: warning: %d in format string (no. 1=
) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArg=
Type_sint]
     len +=3D sprintf(buf + len, "%d.%06d ",
            ^
   drivers/iio/light/isl29018.c:275:10: warning: %d in format string (no. 2=
) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArg=
Type_sint]
     len +=3D sprintf(buf + len, "%d.%06d ",
            ^
--
>> drivers/char/lp.c:926:10: warning: Array 'lp_table[8]' accessed at index=
 8, which is out of bounds. [arrayIndexOutOfBounds]
    lp_table[nr].dev =3D parport_register_dev_model(port, "lp",
            ^
   drivers/char/lp.c:971:3: note: After for loop, i has value 8
     for (i =3D 0; i < LP_NO; i++)
     ^
   drivers/char/lp.c:975:20: note: Calling function 'lp_register', 1st argu=
ment 'i' value is 8
     if (!lp_register(i, port))
                      ^
   drivers/char/lp.c:926:10: note: Array index out of bounds
    lp_table[nr].dev =3D parport_register_dev_model(port, "lp",
            ^
   drivers/char/lp.c:928:14: warning: Array 'lp_table[8]' accessed at index=
 8, which is out of bounds. [arrayIndexOutOfBounds]
    if (lp_table[nr].dev =3D=3D NULL)
                ^
   drivers/char/lp.c:971:3: note: After for loop, i has value 8
     for (i =3D 0; i < LP_NO; i++)
     ^
   drivers/char/lp.c:975:20: note: Calling function 'lp_register', 1st argu=
ment 'i' value is 8
     if (!lp_register(i, port))
                      ^
   drivers/char/lp.c:928:14: note: Array index out of bounds
    if (lp_table[nr].dev =3D=3D NULL)
                ^
   drivers/char/lp.c:930:10: warning: Array 'lp_table[8]' accessed@index=
 8, which is out of bounds. [arrayIndexOutOfBounds]
    lp_table[nr].flags |=3D LP_EXIST;
            ^
   drivers/char/lp.c:971:3: note: After for loop, i has value 8
     for (i =3D 0; i < LP_NO; i++)
     ^
   drivers/char/lp.c:975:20: note: Calling function 'lp_register', 1st argu=
ment 'i' value is 8
     if (!lp_register(i, port))
                      ^
   drivers/char/lp.c:930:10: note: Array index out of bounds
    lp_table[nr].flags |=3D LP_EXIST;
            ^
>> drivers/char/lp.c:952:10: warning: Array 'port_num[8]' accessed at index=
 8, which is out of bounds. [arrayIndexOutOfBounds]
    port_num[nr] =3D port->number;
            ^
   drivers/char/lp.c:971:3: note: After for loop, i has value 8
     for (i =3D 0; i < LP_NO; i++)
     ^
   drivers/char/lp.c:975:20: note: Calling function 'lp_register', 1st argu=
ment 'i' value is 8
     if (!lp_register(i, port))
                      ^
   drivers/char/lp.c:952:10: note: Array index out of bounds
    port_num[nr] =3D port->number;
            ^
--
>> drivers/iio/light/max44009.c:309:22: warning: Either the condition 'inte=
gral>7520256' is redundant or there is signed integer overflow for expressi=
on 'integral*1000'. [integerOverflowCond]
    mantissa =3D integral * MAX44009_SCALE_DENOMINATOR;
                        ^
   drivers/iio/light/max44009.c:304:16: note: Assuming that condition 'inte=
gral>7520256' is not redundant
         integral > MAX44009_MAXIMUM_THRESHOLD ||
                  ^
   drivers/iio/light/max44009.c:309:22: note: Integer overflow
    mantissa =3D integral * MAX44009_SCALE_DENOMINATOR;
                        ^
--
>> drivers/regulator/s5m8767.c:201:44: warning: Uninitialized variable: mod=
e [uninitvar]
    *enable_ctrl =3D s5m8767_opmode_reg[reg_id][mode] << S5M8767_ENCTRL_SHI=
FT;
                                              ^
>> drivers/mfd/si476x-cmd.c:877:15: warning: Boolean result is used in bitw=
ise operation. Clarify expression with parentheses. [clarifyCondition]
     seekup << 3 | wrap << 2,
                 ^
   drivers/mfd/si476x-cmd.c:909:20: warning: Boolean result is used in bitw=
ise operation. Clarify expression with parentheses. [clarifyCondition]
     status_only << 2 | mtfifo << 1 | intack,
                      ^
   drivers/mfd/si476x-cmd.c:1053:15: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
     seekup << 3 | wrap << 2,
                 ^
   drivers/mfd/si476x-cmd.c:1074:14: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
     ctsen << 7 | intsel << 6 | 0x07, /* Last five bits
                ^
   drivers/mfd/si476x-cmd.c:1097:14: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
     ctsen << 7 | intsel << 6 | puargs->fastboot << 5 |
                ^
>> drivers/misc/apds990x.c:378:0: warning: Same expression used in consecut=
ive assignments of 'curr_again' and 'next_again'. [duplicateAssignExpressio=
n]
    int curr_again =3D chip->again_meas;
   ^
   drivers/misc/apds990x.c:379:0: note: Same expression used in consecutive=
 assignments of 'curr_again' and 'next_again'.
    int next_again =3D chip->again_meas;
   ^
   drivers/misc/apds990x.c:378:0: note: Same expression used in consecutive=
 assignments of 'curr_again' and 'next_again'.
    int curr_again =3D chip->again_meas;
   ^
>> drivers/misc/apds990x.c:987:2: warning: Consecutive return, break, conti=
nue, goto or throw statements are unnecessary. [duplicateBreak]
    return 0;
    ^
--
>> drivers/misc/altera-stapl/altera.c:685:23: warning: Shifting a negative =
value is technically undefined behaviour [shiftNegativeLHS]
        long_tmp &=3D ((-1L) >> (32 - count));
                         ^
>> drivers/iio/temperature/tmp007.c:350:62: warning: Shifting a negative va=
lue is technically undefined behaviour [shiftNegativeLHS]
    return i2c_smbus_write_word_swapped(data->client, reg, (val << 7));
                                                                ^
--
>> fs/proc/vmcore.c:386:4: warning: Assignment of function parameter has no=
 effect outside the function. Did you forget dereferencing it? [uselessAssi=
gnmentPtrArg]
      buffer +=3D tsz;
      ^
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
>> fs/overlayfs/export.c:654:60: warning: Possible null pointer dereference=
: lowerpath [nullPointer]
    const struct ovl_layer *layer =3D upper ? &ofs->layers[0] : lowerpath->=
layer;
                                                              ^
   fs/overlayfs/export.c:689:37: note: Calling function 'ovl_get_dentry', 3=
rd argument 'NULL' value is 0
    dentry =3D ovl_get_dentry(sb, upper, NULL, NULL);
                                       ^
   fs/overlayfs/export.c:654:60: note: Null pointer dereference
    const struct ovl_layer *layer =3D upper ? &ofs->layers[0] : lowerpath->=
layer;
                                                              ^
   fs/overlayfs/export.c:655:43: warning: Possible null pointer dereference=
: lowerpath [nullPointer]
    struct dentry *real =3D upper ?: (index ?: lowerpath->dentry);
                                             ^
   fs/overlayfs/export.c:689:37: note: Calling function 'ovl_get_dentry', 3=
rd argument 'NULL' value is 0
    dentry =3D ovl_get_dentry(sb, upper, NULL, NULL);
                                       ^
   fs/overlayfs/export.c:655:43: note: Null pointer dereference
    struct dentry *real =3D upper ?: (index ?: lowerpath->dentry);
                                             ^
>> kernel/cgroup/cgroup-v1.c:857:25: warning: Uninitialized variable: ss [u=
ninitvar]
      seq_show_option(seq, ss->legacy_name, NULL);
                           ^
   kernel/cgroup/cgroup-v1.c:918:27: warning: Uninitialized variable: ss [u=
ninitvar]
      if (strcmp(param->key, ss->legacy_name))
                             ^
   kernel/cgroup/cgroup-v1.c:1270:22: warning: Uninitialized variable: ss [=
uninitvar]
          strcmp(token, ss->legacy_name))
                        ^
   kernel/cgroup/cgroup-v1.c:669:7: warning: Uninitialized variable: ss [un=
initvar]
         ss->legacy_name, ss->root->hierarchy_id,
         ^
   kernel/cgroup/cgroup-v1.c:1269:22: warning: Uninitialized variable: ss [=
uninitvar]
      if (strcmp(token, ss->name) &&
                        ^
--
>> drivers/watchdog/dw_wdt.c:159:25: warning: Array 'dw_wdt->timeouts[16]' =
accessed at index 16, which is out of bounds. [arrayIndexOutOfBounds]
    return dw_wdt->timeouts[idx].sec;
                           ^
   drivers/watchdog/dw_wdt.c:154:2: note: After for loop, idx has value 16
    for (idx =3D 0; idx < DW_WDT_NUM_TOPS; ++idx) {
    ^
   drivers/watchdog/dw_wdt.c:159:25: note: Array index out of bounds
    return dw_wdt->timeouts[idx].sec;
                           ^
   drivers/watchdog/dw_wdt.c:186:25: warning: Array 'dw_wdt->timeouts[16]' =
accessed at index 16, which is out of bounds. [arrayIndexOutOfBounds]
    return dw_wdt->timeouts[idx].sec * dw_wdt->rmod;
                           ^
   drivers/watchdog/dw_wdt.c:177:2: note: After for loop, idx has value 16
    for (idx =3D 0; idx < DW_WDT_NUM_TOPS; ++idx) {
    ^
   drivers/watchdog/dw_wdt.c:186:25: note: Array index out of bounds
    return dw_wdt->timeouts[idx].sec * dw_wdt->rmod;
                           ^
>> drivers/watchdog/dw_wdt.c:159:17: warning: Array 'dw_wdt.timeouts[16]' a=
ccessed at index 16, which is out of bounds. [arrayIndexOutOfBounds]
    return dw_wdt->timeouts[idx].sec;
                   ^
   drivers/watchdog/dw_wdt.c:186:17: warning: Array 'dw_wdt.timeouts[16]' a=
ccessed at index 16, which is out of bounds. [arrayIndexOutOfBounds]
    return dw_wdt->timeouts[idx].sec * dw_wdt->rmod;
                   ^
--
>> drivers/thermal/thermal_sysfs.c:589:9: warning: %ld in format string (no=
. 1) requires 'long' but the argument type is 'unsigned long'. [invalidPrin=
tfArgType_sint]
    return sprintf(buf, "%ldn", state);
           ^
   drivers/thermal/thermal_sysfs.c:602:9: warning: %ld in format string (no=
. 1) requires 'long' but the argument type is 'unsigned long'. [invalidPrin=
tfArgType_sint]
    return sprintf(buf, "%ldn", state);
           ^
>> drivers/thermal/thermal_sysfs.c:613:6: warning: %ld in format string (no=
. 1) requires 'long *' but the argument type is 'unsigned long *'. [invalid=
ScanfArgType_int]
    if (sscanf(buf, "%ldn", &state) !=3D 1)
        ^
>> drivers/thermal/thermal_sysfs.c:888:9: warning: %d in format string (no.=
 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfA=
rgType_sint]
    return sprintf(buf, "%dn", instance->weight);
           ^
>> drivers/watchdog/ziirave_wdt.c:247:21: warning: Possible null pointer de=
reference: data [nullPointer]
    memcpy(packet + 3, data, len);
                       ^
   drivers/watchdog/ziirave_wdt.c:382:39: note: Calling function 'ziirave_f=
irm_write_pkt', 3rd argument 'NULL' value is 0
    ret =3D ziirave_firm_write_pkt(wdd, 0, NULL, 0);
                                         ^
   drivers/watchdog/ziirave_wdt.c:293:45: note: Calling function '__ziirave=
_firm_write_pkt', 3rd argument 'data' value is 0
    return __ziirave_firm_write_pkt(wdd, addr, data, len);
                                               ^
   drivers/watchdog/ziirave_wdt.c:247:21: note: Null pointer dereference
    memcpy(packet + 3, data, len);
                       ^
>> drivers/of/device.c:229:3: warning: Assignment of function parameter has=
 no effect outside the function. [uselessAssignmentArg]
     len -=3D csize;
     ^
>> drivers/of/device.c:230:3: warning: Assignment of function parameter has=
 no effect outside the function. Did you forget dereferencing it? [uselessA=
ssignmentPtrArg]
     str +=3D csize;
     ^
>> drivers/of/device.c:210:19: warning: Possible null pointer dereference: =
str [nullPointer]
    csize =3D snprintf(str, len, "of:N%pOFn%c%s", dev->of_node, 'T',
                     ^
   drivers/of/device.c:242:37: note: Calling function 'of_device_get_modali=
as', 2nd argument 'NULL' value is 0
    size =3D of_device_get_modalias(dev, NULL, 0);
                                       ^
   drivers/of/device.c:210:19: note: Null pointer dereference
    csize =3D snprintf(str, len, "of:N%pOFn%c%s", dev->of_node, 'T',
                     ^
--
>> drivers/hid/hid-lenovo.c:381:9: warning: %u in format string (no. 1) req=
uires 'unsigned int' but the argument type is 'signed int'. [invalidPrintfA=
rgType_uint]
    return snprintf(buf, PAGE_SIZE, "%un",
           ^
   drivers/hid/hid-lenovo.c:538:9: warning: %u in format string (no. 1) req=
uires 'unsigned int' but the argument type is 'signed int'. [invalidPrintfA=
rgType_uint]
    return snprintf(buf, PAGE_SIZE, "%un", data_pointer->press_to_select);
           ^
   drivers/hid/hid-lenovo.c:568:9: warning: %u in format string (no. 1) req=
uires 'unsigned int' but the argument type is 'signed int'. [invalidPrintfA=
rgType_uint]
    return snprintf(buf, PAGE_SIZE, "%un", data_pointer->dragging);
           ^
   drivers/hid/hid-lenovo.c:598:9: warning: %u in format string (no. 1) req=
uires 'unsigned int' but the argument type is 'signed int'. [invalidPrintfA=
rgType_uint]
    return snprintf(buf, PAGE_SIZE, "%un", data_pointer->release_to_select);
           ^
   drivers/hid/hid-lenovo.c:628:9: warning: %u in format string (no. 1) req=
uires 'unsigned int' but the argument type is 'signed int'. [invalidPrintfA=
rgType_uint]
    return snprintf(buf, PAGE_SIZE, "%un", data_pointer->select_right);
           ^
   drivers/hid/hid-lenovo.c:658:9: warning: %u in format string (no. 1) req=
uires 'unsigned int' but the argument type is 'signed int'. [invalidPrintfA=
rgType_uint]
    return snprintf(buf, PAGE_SIZE, "%un",
           ^
   drivers/hid/hid-lenovo.c:687:9: warning: %u in format string (no. 1) req=
uires 'unsigned int' but the argument type is 'signed int'. [invalidPrintfA=
rgType_uint]
    return snprintf(buf, PAGE_SIZE, "%un",
           ^
>> drivers/greybus/svc.c:1192:35: warning: Variable 'request' is not assign=
ed a value. [unassignedVariable]
    struct gb_svc_intf_oops_request *request;
                                     ^
--
>> drivers/hwmon/adm9240.c:363:9: warning: %d in format string (no. 1) requ=
ires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_s=
int]
    return sprintf(buf, "%dn", IN_FROM_REG(data->in[attr->index],
           ^
   drivers/hwmon/adm9240.c:376:9: warning: %d in format string (no. 1) requ=
ires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_s=
int]
    return sprintf(buf, "%dn", IN_FROM_REG(data->in_min[attr->index],
           ^
   drivers/hwmon/adm9240.c:389:9: warning: %d in format string (no. 1) requ=
ires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_s=
int]
    return sprintf(buf, "%dn", IN_FROM_REG(data->in_max[attr->index],
           ^
   drivers/hwmon/adm9240.c:464:9: warning: %d in format string (no. 1) requ=
ires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_s=
int]
    return sprintf(buf, "%dn", FAN_FROM_REG(data->fan[attr->index],
           ^
   drivers/hwmon/adm9240.c:477:9: warning: %d in format string (no. 1) requ=
ires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_s=
int]
    return sprintf(buf, "%dn", FAN_FROM_REG(data->fan_min[attr->index],
           ^
   drivers/hwmon/adm9240.c:627:9: warning: %d in format string (no. 1) requ=
ires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_s=
int]
    return sprintf(buf, "%dn", AOUT_FROM_REG(data->aout));
           ^
--
>> kernel/cgroup/debug.c:67:52: warning: Uninitialized variable: ss [uninit=
var]
     seq_printf(seq, "%2d: %-4st- %p[%d]n", ss->id, ss->name,
                                                      ^
   kernel/cgroup/debug.c:227:57: warning: Uninitialized variable: ss [unini=
tvar]
     seq_printf(seq, "%2d: %-4st- %p[%d] %d%sn", ss->id, ss->name,
                                                           ^
   kernel/cgroup/debug.c:249:17: warning: Uninitialized variable: ss [unini=
tvar]
     seq_puts(seq, ss->name);
                   ^
   kernel/cgroup/debug.c:64:22: warning: Uninitialized variable: ss [uninit=
var]
     css =3D cset->subsys[ss->id];
                        ^
   kernel/cgroup/debug.c:217:44: warning: Uninitialized variable: ss [unini=
tvar]
     css =3D rcu_dereference_check(cgrp->subsys[ss->id], true);
                                              ^
--
>> drivers/hid/hid-sensor-custom.c:591:22: warning: Either the condition 'j=
<(10+1)' is redundant or the array 'hid_custom_attrs[8]' is accessed at ind=
ex 10, which is out of bounds. [arrayIndexOutOfBoundsCond]
        hid_custom_attrs[j].name);
                        ^
   drivers/hid/hid-sensor-custom.c:582:12: note: Assuming that condition 'j=
<(10+1)' is not redundant
     while (j < HID_CUSTOM_TOTAL_ATTRS &&
              ^
   drivers/hid/hid-sensor-custom.c:591:22: note: Array index out of bounds
        hid_custom_attrs[j].name);
                        ^
   drivers/hid/hid-sensor-custom.c:595:45: warning: Either the condition 'j=
<(10+1)' is redundant or the array 'hid_custom_attrs[8]' is accessed@ind=
ex 10, which is out of bounds. [arrayIndexOutOfBoundsCond]
      device_attr->attr.mode =3D hid_custom_attrs[j].mode;
                                               ^
   drivers/hid/hid-sensor-custom.c:582:12: note: Assuming that condition 'j=
<(10+1)' is not redundant
     while (j < HID_CUSTOM_TOTAL_ATTRS &&
              ^
   drivers/hid/hid-sensor-custom.c:595:45: note: Array index out of bounds
      device_attr->attr.mode =3D hid_custom_attrs[j].mode;
                                               ^
   drivers/hid/hid-sensor-custom.c:597:24: warning: Either the condition 'j=
<(10+1)' is redundant or the array 'hid_custom_attrs[8]' is accessed@ind=
ex 10, which is out of bounds. [arrayIndexOutOfBoundsCond]
      if (hid_custom_attrs[j].mode & S_IWUSR)
                          ^
   drivers/hid/hid-sensor-custom.c:582:12: note: Assuming that condition 'j=
<(10+1)' is not redundant
     while (j < HID_CUSTOM_TOTAL_ATTRS &&
              ^
   drivers/hid/hid-sensor-custom.c:597:24: note: Array index out of bounds
      if (hid_custom_attrs[j].mode & S_IWUSR)
                          ^
>> drivers/hid/hid-sensor-custom.c:287:6: warning: %x in format string (no.=
 1) requires 'unsigned int *' but the argument type is 'signed int *'. [inv=
alidScanfArgType_int]
    if (sscanf(attr->attr.name, "feature-%x-%x-%s", &index, &usage,
        ^
   drivers/hid/hid-sensor-custom.c:287:6: warning: %x in format string (no.=
 2) requires 'unsigned int *' but the argument type is 'signed int *'. [inv=
alidScanfArgType_int]
    if (sscanf(attr->attr.name, "feature-%x-%x-%s", &index, &usage,
        ^
   drivers/hid/hid-sensor-custom.c:291:13: warning: %x in format string (no=
. 1) requires 'unsigned int *' but the argument type is 'signed int *'. [in=
validScanfArgType_int]
    } else if (sscanf(attr->attr.name, "input-%x-%x-%s", &index, &usage,
               ^
   drivers/hid/hid-sensor-custom.c:291:13: warning: %x in format string (no=
. 2) requires 'unsigned int *' but the argument type is 'signed int *'. [in=
validScanfArgType_int]
    } else if (sscanf(attr->attr.name, "input-%x-%x-%s", &index, &usage,
               ^
   drivers/hid/hid-sensor-custom.c:392:6: warning: %x in format string (no.=
 1) requires 'unsigned int *' but the argument type is 'signed int *'. [inv=
alidScanfArgType_int]
    if (sscanf(attr->attr.name, "feature-%x-%x-%s", &index, &usage,
        ^
   drivers/hid/hid-sensor-custom.c:392:6: warning: %x in format string (no.=
 2) requires 'unsigned int *' but the argument type is 'signed int *'. [inv=
alidScanfArgType_int]
    if (sscanf(attr->attr.name, "feature-%x-%x-%s", &index, &usage,
        ^
>> drivers/hid/hid-sensor-custom.c:591:22: warning: Either the condition 'j=
<11' is redundant or the array 'hid_custom_attrs[8]' is accessed at index 1=
0, which is out of bounds. [arrayIndexOutOfBoundsCond]
        hid_custom_attrs[j].name);
                        ^
   drivers/hid/hid-sensor-custom.c:582:12: note: Assuming that condition 'j=
<11' is not redundant
     while (j < HID_CUSTOM_TOTAL_ATTRS &&
              ^
   drivers/hid/hid-sensor-custom.c:591:22: note: Array index out of bounds
        hid_custom_attrs[j].name);
                        ^
   drivers/hid/hid-sensor-custom.c:595:45: warning: Either the condition 'j=
<11' is redundant or the array 'hid_custom_attrs[8]' is accessed@index 1=
0, which is out of bounds. [arrayIndexOutOfBoundsCond]
      device_attr->attr.mode =3D hid_custom_attrs[j].mode;
                                               ^
   drivers/hid/hid-sensor-custom.c:582:12: note: Assuming that condition 'j=
<11' is not redundant
     while (j < HID_CUSTOM_TOTAL_ATTRS &&
              ^
   drivers/hid/hid-sensor-custom.c:595:45: note: Array index out of bounds
      device_attr->attr.mode =3D hid_custom_attrs[j].mode;
                                               ^
   drivers/hid/hid-sensor-custom.c:597:24: warning: Either the condition 'j=
<11' is redundant or the array 'hid_custom_attrs[8]' is accessed@index 1=
0, which is out of bounds. [arrayIndexOutOfBoundsCond]
      if (hid_custom_attrs[j].mode & S_IWUSR)
                          ^
   drivers/hid/hid-sensor-custom.c:582:12: note: Assuming that condition 'j=
<11' is not redundant
     while (j < HID_CUSTOM_TOTAL_ATTRS &&
              ^
   drivers/hid/hid-sensor-custom.c:597:24: note: Array index out of bounds
      if (hid_custom_attrs[j].mode & S_IWUSR)
                          ^
>> drivers/hid/hid-sensor-custom.c:287:6: warning: sscanf() without field w=
idth limits can crash with huge input data. [invalidscanf]
    if (sscanf(attr->attr.name, "feature-%x-%x-%s", &index, &usage,
        ^
   drivers/hid/hid-sensor-custom.c:291:13: warning: sscanf() without field =
width limits can crash with huge input data. [invalidscanf]
    } else if (sscanf(attr->attr.name, "input-%x-%x-%s", &index, &usage,
               ^
   drivers/hid/hid-sensor-custom.c:392:6: warning: sscanf() without field w=
idth limits can crash with huge input data. [invalidscanf]
    if (sscanf(attr->attr.name, "feature-%x-%x-%s", &index, &usage,
        ^
--
>> drivers/hwmon/g760a.c:117:9: warning: %d in format string (no. 1) requir=
es 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sin=
t]
    return sprintf(buf, "%dn", rpm);
           ^
--
>> drivers/hwmon/lm63.c:666:9: warning: %u in format string (no. 1) require=
s 'unsigned int' but the argument type is 'signed int'. [invalidPrintfArgTy=
pe_uint]
    return sprintf(buf, "%un", data->update_interval);
           ^
>> net/core/net_namespace.c:116:26: warning: Division by result of sizeof()=
. memcpy() expects a size in bytes, did you intend to multiply instead? [si=
zeofDivisionMemfunc]
           (old_ng->s.len - MIN_PERNET_OPS_ID) * sizeof(void *));
                            ^
--
>> drivers/hwmon/lm93.c:385:20: warning: int result is assigned to long var=
iable. If the variable is long to avoid loss of information, then you have =
loss of information. [truncLongCastAssignment]
    const long uv_vid =3D vid * 1000;
                      ^
>> drivers/input/keyboard/sunkbd.c:151:45: warning: Boolean result is used =
in bitwise operation. Clarify expression with parentheses. [clarifyConditio=
n]
      (!!test_bit(LED_COMPOSE, dev->led) << 1) |
                                               ^
   drivers/input/keyboard/sunkbd.c:214:52: warning: Boolean result is used =
in bitwise operation. Clarify expression with parentheses. [clarifyConditio=
n]
     (!!test_bit(LED_COMPOSE, sunkbd->dev->led) << 1) |
                                                      ^
>> drivers/hwtracing/intel_th/msu.c:1396:3: warning: Assignment of function=
 parameter has no effect outside the function. [uselessAssignmentArg]
     pgoff -=3D pgsz;
     ^
>> drivers/hwmon/w83627ehf.c:865:19: warning: Shifting a negative value is =
technically undefined behaviour [shiftNegativeLHS]
    reg |=3D (val - 1) << W83627EHF_PWM_ENABLE_SHIFT[channel];
                     ^
--
>> drivers/hwmon/nct6683.c:722:9: warning: %d in format string (no. 1) requ=
ires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_s=
int]
    return sprintf(buf, "%dn", data->rpm[sattr->index]);
           ^
>> drivers/input/keyboard/tca8418_keypad.c:240:15: warning: Shifting a nega=
tive value is technically undefined behaviour [shiftNegativeLHS]
    reg  =3D  ~(~0 << rows);
                 ^
   drivers/input/keyboard/tca8418_keypad.c:241:15: warning: Shifting a nega=
tive value is technically undefined behaviour [shiftNegativeLHS]
    reg +=3D (~(~0 << cols)) << 8;
                 ^
--
>> drivers/most/core.c:1322:4: warning: %d in format string (no. 1) require=
s 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
      snprintf(c->name, STRING_SIZE, "ch%d", i);
      ^
--
>> sound/soc/codecs/wm8711.c:476:6: warning: Unused variable: ret [unusedVa=
riable]
    int ret;
        ^
--
>> fs/posix_acl.c:704:56: warning: Either the condition '!value' is redunda=
nt or there is pointer arithmetic with NULL pointer. [nullPointerArithmetic=
RedundantCheck]
    struct posix_acl_xattr_entry *entry =3D (void *)(header + 1), *end;
                                                          ^
   fs/posix_acl.c:709:6: note: Assuming that condition '!value' is not redu=
ndant
    if (!value)
        ^
   fs/posix_acl.c:703:42: note: Assignment 'header=3Dvalue', assigned value=
 is 0
    struct posix_acl_xattr_header *header =3D value;
                                            ^
   fs/posix_acl.c:704:56: note: Null pointer addition
    struct posix_acl_xattr_entry *entry =3D (void *)(header + 1), *end;
                                                          ^
   fs/posix_acl.c:774:68: warning: Either the condition '!value' is redunda=
nt or there is pointer arithmetic with NULL pointer. [nullPointerArithmetic=
RedundantCheck]
    const struct posix_acl_xattr_entry *entry =3D (const void *)(header + 1=
), *end;
                                                                      ^
   fs/posix_acl.c:779:6: note: Assuming that condition '!value' is not redu=
ndant
    if (!value)
        ^
   fs/posix_acl.c:773:48: note: Assignment 'header=3Dvalue', assigned value=
 is 0
    const struct posix_acl_xattr_header *header =3D value;
                                                  ^
   fs/posix_acl.c:774:68: note: Null pointer addition
    const struct posix_acl_xattr_entry *entry =3D (const void *)(header + 1=
), *end;
                                                                      ^
>> drivers/net/ethernet/intel/e1000/e1000_hw.c:356:13: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
      status =3D er32(STATUS);
               ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:391:2: warning: Same value i=
n both branches of ternary operator. [duplicateValueTernary]
    ew32(IMC, 0xffffffff);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:397:2: warning: Same value i=
n both branches of ternary operator. [duplicateValueTernary]
    ew32(RCTL, 0);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:398:2: warning: Same value i=
n both branches of ternary operator. [duplicateValueTernary]
    ew32(TCTL, E1000_TCTL_PSP);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:399:2: warning: Same value i=
n both branches of ternary operator. [duplicateValueTernary]
    E1000_WRITE_FLUSH();
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:409:9: warning: Same value i=
n both branches of ternary operator. [duplicateValueTernary]
    ctrl =3D er32(CTRL);
           ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:413:3: warning: Same value i=
n both branches of ternary operator. [duplicateValueTernary]
     ew32(CTRL, (ctrl | E1000_CTRL_PHY_RST));
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:414:3: warning: Same value i=
n both branches of ternary operator. [duplicateValueTernary]
     E1000_WRITE_FLUSH();
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:440:3: warning: Same value i=
n both branches of ternary operator. [duplicateValueTernary]
     ew32(CTRL_DUP, (ctrl | E1000_CTRL_RST));
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:444:3: warning: Same value i=
n both branches of ternary operator. [duplicateValueTernary]
     ew32(CTRL, (ctrl | E1000_CTRL_RST));
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:459:14: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
     ctrl_ext =3D er32(CTRL_EXT);
                ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:461:3: warning: Same value i=
n both branches of ternary operator. [duplicateValueTernary]
     ew32(CTRL_EXT, ctrl_ext);
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:462:3: warning: Same value i=
n both branches of ternary operator. [duplicateValueTernary]
     E1000_WRITE_FLUSH();
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:483:10: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
     manc =3D er32(MANC);
            ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:485:3: warning: Same value i=
n both branches of ternary operator. [duplicateValueTernary]
     ew32(MANC, manc);
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:492:14: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
     led_ctrl =3D er32(LEDCTL);
                ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:495:3: warning: Same value i=
n both branches of ternary operator. [duplicateValueTernary]
     ew32(LEDCTL, led_ctrl);
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:500:2: warning: Same value i=
n both branches of ternary operator. [duplicateValueTernary]
    ew32(IMC, 0xffffffff);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:503:2: warning: Same value i=
n both branches of ternary operator. [duplicateValueTernary]
    er32(ICR);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:545:3: warning: Same value i=
n both branches of ternary operator. [duplicateValueTernary]
     ew32(VET, 0);
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:552:3: warning: Same value i=
n both branches of ternary operator. [duplicateValueTernary]
     ew32(RCTL, E1000_RCTL_RST);
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:553:3: warning: Same value i=
n both branches of ternary operator. [duplicateValueTernary]
     E1000_WRITE_FLUSH();
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:564:3: warning: Same value i=
n both branches of ternary operator. [duplicateValueTernary]
     ew32(RCTL, 0);
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:565:3: warning: Same value i=
n both branches of ternary operator. [duplicateValueTernary]
     E1000_WRITE_FLUSH();
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:579:3: warning: Same value i=
n both branches of ternary operator. [duplicateValueTernary]
     E1000_WRITE_FLUSH();
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:588:10: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
     ctrl =3D er32(CTRL);
            ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:589:3: warning: Same value i=
n both branches of ternary operator. [duplicateValueTernary]
     ew32(CTRL, ctrl | E1000_CTRL_PRIOR);
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:611:10: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
     ctrl =3D er32(TXDCTL);
            ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:615:3: warning: Same value i=
n both branches of ternary operator. [duplicateValueTernary]
     ew32(TXDCTL, ctrl);
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:627:14: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
     ctrl_ext =3D er32(CTRL_EXT);
                ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:632:3: warning: Same value i=
n both branches of ternary operator. [duplicateValueTernary]
     ew32(CTRL_EXT, ctrl_ext);
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:745:3: warning: Same value i=
n both branches of ternary operator. [duplicateValueTernary]
     ew32(CTRL_EXT, ctrl_ext);
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:759:2: warning: Same value i=
n both branches of ternary operator. [duplicateValueTernary]
    ew32(FCT, FLOW_CONTROL_TYPE);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:760:2: warning: Same value i=
n both branches of ternary operator. [duplicateValueTernary]
    ew32(FCAH, FLOW_CONTROL_ADDRESS_HIGH);
--
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4696:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(ROC);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4697:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(RJC);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4698:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(TORL);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4699:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(TORH);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4700:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(TOTL);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4701:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(TOTH);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4702:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(TPR);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4703:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(TPT);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4705:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(PTC64);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4706:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(PTC127);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4707:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(PTC255);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4708:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(PTC511);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4709:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(PTC1023);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4710:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(PTC1522);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4712:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(MPTC);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4713:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(BPTC);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4718:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(ALGNERRC);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4719:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(RXERRC);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4720:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(TNCRS);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4721:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(CEXTERR);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4722:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(TSCTC);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4723:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(TSCTFC);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4728:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(MGTPRC);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4729:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(MGTPDC);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4730:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(MGTPTC);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4753:3: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
     ew32(AIT, 0);
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4779:6: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
        ew32(AIT, hw->current_ifs_val);
        ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4787:5: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
       ew32(AIT, 0);
       ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4813:12: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
     status =3D er32(STATUS);
              ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:5512:10: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
     manc =3D er32(MANC);
            ^
>> drivers/net/ethernet/intel/e1000/e1000_hw.c:5367:0: warning: Uninitializ=
ed variable: phy_data [uninitvar]
      phy_data &=3D ~IGP01E1000_GMII_FLEX_SPD;
   ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:5412:0: warning: Uninitializ=
ed variable: phy_data [uninitvar]
      phy_data |=3D IGP01E1000_GMII_FLEX_SPD;
   ^
--
>> drivers/input/misc/ims-pcu.c:215:2: warning: %d in format string (no. 1)=
 requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgT=
ype_sint]
    snprintf(buttons->name, sizeof(buttons->name),
    ^
   drivers/input/misc/ims-pcu.c:301:2: warning: %d in format string (no. 1)=
 requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgT=
ype_sint]
    snprintf(gamepad->name, sizeof(gamepad->name),
    ^
   drivers/input/misc/ims-pcu.c:1005:2: warning: %d in format string (no. 1=
) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArg=
Type_sint]
    snprintf(backlight->name, sizeof(backlight->name),
    ^
>> sound/soc/codecs/wm8962.c:2788:25: warning: Uninitialized variable: frat=
io [uninitvar]
    fll_div->n =3D target / (fratio * Fref);
                           ^
--
>> drivers/input/touchscreen/cyttsp4_core.c:1945:15: warning: Same expressi=
on on both sides of '-'. [duplicateExpression]
       min =3D min - min;
                 ^
>> mm/page_alloc.c:2547:6: warning: Local variable free_pages shadows outer=
 function [shadowFunction]
    int free_pages, movable_pages, alike_pages;
        ^
   mm/page_alloc.c:5095:6: note: Shadowed declaration
   void free_pages(unsigned long addr, unsigned int order)
        ^
   mm/page_alloc.c:2547:6: note: Shadow variable
    int free_pages, movable_pages, alike_pages;
        ^
   mm/page_alloc.c:3715:7: warning: Local variable free_pages shadows outer=
 function [shadowFunction]
    long free_pages;
         ^
   mm/page_alloc.c:5095:6: note: Shadowed declaration
   void free_pages(unsigned long addr, unsigned int order)
        ^
   mm/page_alloc.c:3715:7: note: Shadow variable
    long free_pages;
         ^
   mm/page_alloc.c:3754:7: warning: Local variable free_pages shadows outer=
 function [shadowFunction]
    long free_pages =3D zone_page_state(z, NR_FREE_PAGES);
         ^
   mm/page_alloc.c:5095:6: note: Shadowed declaration
   void free_pages(unsigned long addr, unsigned int order)
        ^
   mm/page_alloc.c:3754:7: note: Shadow variable
    long free_pages =3D zone_page_state(z, NR_FREE_PAGES);
         ^
>> mm/kasan/common.c:304:35: warning: Same value in both branches of ternar=
y operator. [duplicateValueTernary]
    return init ? kasan_random_tag() : get_tag(object);
                                     ^
>> mm/kasan/kasan.h:361:2: warning: Assignment of function parameter has no=
 effect outside the function. [uselessAssignmentArg]
    size =3D round_up(size, KASAN_GRANULE_SIZE);
    ^
   mm/kasan/common.c:293:34: warning: Same value in both branches of ternar=
y operator. [duplicateValueTernary]
     return init ? KASAN_TAG_KERNEL : kasan_random_tag();
                                    ^
>> kernel/locking/locktorture.c:708:2: warning: Assignment of function para=
meter has no effect outside the function. Did you forget dereferencing it? =
[uselessAssignmentPtrArg]
    page +=3D sprintf(page,
    ^
--
>> security/keys/keyring.c:38:2: warning: Non-boolean value returned from f=
unction returning bool [returnNonBoolInBooleanFunction]
    return (unsigned long)x & KEYRING_PTR_SUBTYPE;
    ^
>> fs/notify/fanotify/fanotify_user.c:431:3: warning: Assignment of functio=
n parameter has no effect outside the function. Did you forget dereferencin=
g it? [uselessAssignmentPtrArg]
     buf +=3D ret;
     ^
>> fs/notify/fanotify/fanotify_user.c:432:3: warning: Assignment of functio=
n parameter has no effect outside the function. [uselessAssignmentArg]
     count -=3D ret;
     ^
>> arch/x86/kernel/cpu/topology.c:138:27: warning: Shifting a negative valu=
e is technically undefined behaviour [shiftNegativeLHS]
    core_select_mask =3D (~(-1 << core_plus_mask_width)) >> ht_mask_width;
                             ^
   arch/x86/kernel/cpu/topology.c:139:26: warning: Shifting a negative valu=
e is technically undefined behaviour [shiftNegativeLHS]
    die_select_mask =3D (~(-1 << die_plus_mask_width)) >>
                            ^
--
   In file included from arch/x86/events/intel/uncore.c:
   arch/x86/events/perf_event.h:87:2: warning: Non-boolean value returned f=
rom function returning bool [returnNonBoolInBooleanFunction]
    return event->hw.flags & PERF_X86_EVENT_TOPDOWN;
    ^
   arch/x86/events/perf_event.h:987:2: warning: Non-boolean value returned =
from function returning bool [returnNonBoolInBooleanFunction]
    return hwc->flags & PERF_X86_EVENT_PAIR;
    ^
>> arch/x86/events/intel/uncore.c:847:4: warning: %u in format string (no. =
1) requires 'unsigned int' but the argument type is 'signed int'. [invalidP=
rintfArgType_uint]
      sprintf(pmu->name, "uncore_type_%u", type->type_id);
      ^
   arch/x86/events/intel/uncore.c:849:4: warning: %u in format string (no. =
1) requires 'unsigned int' but the argument type is 'signed int'. [invalidP=
rintfArgType_uint]
      sprintf(pmu->name, "uncore_type_%u_%d",
      ^
>> arch/x86/events/intel/uncore.c:849:4: warning: %d in format string (no. =
2) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfAr=
gType_sint]
      sprintf(pmu->name, "uncore_type_%u_%d",
      ^
>> kernel/irq/autoprobe.c:96:16: warning: Shifting signed 32-bit value by 3=
1 bits is undefined behaviour. See condition at line 95. [shiftTooManyBitsS=
igned]
        mask |=3D 1 << i;
                  ^
   kernel/irq/autoprobe.c:95:11: note: Assuming that condition 'i<32' is no=
t redundant
       if (i < 32)
             ^
   kernel/irq/autoprobe.c:96:16: note: Shift
        mask |=3D 1 << i;
                  ^
--
>> kernel/irq/proc.c:357:2: warning: %d in format string (no. 1) requires '=
int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
    sprintf(name, "%d", irq);
    ^
>> lib/decompress_inflate.c:82:64: warning: Same expression in both branche=
s of ternary operator. [duplicateExpressionTernary]
    strm->workspace =3D malloc(flush ? zlib_inflate_workspacesize() :
                                                                  ^
--
>> crypto/poly1305_generic.c:49:4: warning: Assignment of function paramete=
r has no effect outside the function. Did you forget dereferencing it? [use=
lessAssignmentPtrArg]
      src +=3D POLY1305_BLOCK_SIZE;
      ^
>> kernel/rcu/srcutree.c:129:26: warning: Uninitialized variable: sdp [unin=
itvar]
    WARN_ON_ONCE(ARRAY_SIZE(sdp->srcu_lock_count) !=3D
                            ^
   kernel/rcu/srcutree.c:130:19: warning: Uninitialized variable: sdp [unin=
itvar]
          ARRAY_SIZE(sdp->srcu_unlock_count));
                     ^
>> drivers/video/fbdev/metronomefb.c:214:26: warning: Undefined behaviour, =
when 'i' is 4 the pointer arithmetic 'wfm_hdr->stuff2a+i' is out of bounds.=
 [pointerOutOfBounds]
     if (*(wfm_hdr->stuff2a + i) !=3D 0) {
                            ^
>> mm/compaction.c:2925:22: warning: Local variable kcompactd shadows outer=
 function [shadowFunction]
    struct task_struct *kcompactd =3D NODE_DATA(nid)->kcompactd;
                        ^
   mm/compaction.c:2845:12: note: Shadowed declaration
   static int kcompactd(void *p)
              ^
   mm/compaction.c:2925:22: note: Shadow variable
    struct task_struct *kcompactd =3D NODE_DATA(nid)->kcompactd;
                        ^
>> drivers/input/rmi4/rmi_f12.c:401:13: warning: Variable 'query_addr' is m=
odified but its new value is never used. [unreadVariable]
    query_addr +=3D 3;
               ^
>> lib/radix-tree.c:1136:2: warning: Assignment of function parameter has n=
o effect outside the function. Did you forget dereferencing it? [uselessAss=
ignmentPtrArg]
    slot++;
    ^
>> drivers/input/touchscreen/tps6507x-ts.c:144:3: warning: Variable 'loops'=
 is modified but its new value is never used. [unreadVariable]
     loops++;
     ^
--
>> net/ipv4/devinet.c:1277:3: warning: Assignment of function parameter has=
 no effect outside the function. [uselessAssignmentArg]
     len  -=3D size;
     ^
>> lib/math/gcd.c:32:12: warning: Opposite expression on both sides of '&'.=
 [oppositeExpression]
     return r & -r;
              ^
   lib/math/gcd.c:37:13: warning: Opposite expression on both sides of '&'.=
 [oppositeExpression]
      return r & -r;
               ^
   lib/math/gcd.c:58:4: warning: Opposite expression on both sides of '&=3D=
'. [oppositeExpression]
    r &=3D -r;
      ^
--
   In file included from drivers/usb/host/ehci-hcd.c:
>> drivers/usb/host/ehci-hub.c:550:0: warning: syntax error [syntaxError]
   =

   ^
>> drivers/power/supply/bq256xx_charger.c:346:12: warning: Identical inner =
'if' condition is always true. [identicalInnerCondition]
      if (val < array[i])
              ^
   drivers/power/supply/bq256xx_charger.c:345:33: note: outer condition: va=
l<array[i]
     if (val > array[i - 1] && val < array[i]) {
                                   ^
   drivers/power/supply/bq256xx_charger.c:346:12: note: identical inner con=
dition: val<array[i]
      if (val < array[i])
              ^
>> kernel/bpf/bpf_iter.c:434:12: warning: Boolean result is used in bitwise=
 operation. Clarify expression with parentheses. [clarifyCondition]
    if (!ulen ^ !ubuf)
              ^
   kernel/bpf/bpf_iter.c:494:14: warning: Boolean result is used in bitwise=
 operation. Clarify expression with parentheses. [clarifyCondition]
    if (!ulinfo ^ !linfo_len)
                ^
>> lib/zlib_deflate/deflate.c:817:0: warning: failed to expand 'UPDATE_HASH=
', Wrong number of parameters for macro 'UPDATE_HASH'. [preprocessorErrorDi=
rective]
               Call UPDATE_HASH() MIN_MATCH-3 more times
   ^
--
>> sound/soc/fsl/fsl_ssi.c:457:0: warning: syntax error [syntaxError]
   =

   ^
--
>> net/ipv4/fib_trie.c:1408:34: warning: Opposite expression on both sides =
of '|'. [oppositeExpression]
    return (key ^ prefix) & (prefix | -prefix);
                                    ^
>> drivers/usb/gadget/function/f_hid.c:565:4: warning: Consecutive return, =
break, continue, goto or throw statements are unnecessary. [duplicateBreak]
      break;
      ^
>> kernel/bpf/syscall.c:2766:12: warning: Boolean result is used in bitwise=
 operation. Clarify expression with parentheses. [clarifyCondition]
    if (!ulen ^ !ubuf)
              ^
>> sound/core/seq/seq_clientmgr.c:2113:7: warning: union member 'Anonymous1=
::pversion' is never used. [unusedStructMember]
     int pversion;
         ^
>> sound/core/seq/seq_clientmgr.c:2114:7: warning: union member 'Anonymous1=
::client_id' is never used. [unusedStructMember]
     int client_id;
         ^
>> drivers/mmc/core/sd_ops.c:175:41: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    cmd.arg =3D ((ocr & 0xFF8000) !=3D 0) << 8 | pcie_bits << 8 | test_patt=
ern;
                                           ^
>> lib/lz4/lz4_decompress.c:346:25: warning: Overflow in pointer arithmetic=
, NULL pointer is subtracted. [nullPointerArithmetic]
       memmove(op, dictEnd - (lowPrefix - match),
                           ^
   lib/lz4/lz4_decompress.c:462:33: note: Calling function 'LZ4_decompress_=
generic', 9th argument 'NULL' value is 0
             noDict, (BYTE *)dest, NULL, 0);
                                   ^
   lib/lz4/lz4_decompress.c:90:55: note: Assignment 'dictEnd=3D(const uint8=
_t*)dictStart+dictSize', assigned value is 0
    const BYTE * const dictEnd =3D (const BYTE *)dictStart + dictSize;
                                                         ^
   lib/lz4/lz4_decompress.c:346:25: note: Null pointer subtraction
       memmove(op, dictEnd - (lowPrefix - match),
                           ^
--
>> net/sunrpc/addr.c:290:6: warning: %u in format string (no. 2) requires '=
unsigned int' but the argument type is 'signed int'. [invalidPrintfArgType_=
uint]
    if (snprintf(portbuf, sizeof(portbuf),
        ^
--
>> drivers/usb/gadget/function/f_printer.c:1271:11: warning: %d in format s=
tring (no. 1) requires 'int' but the argument type is 'unsigned int'. [inva=
lidPrintfArgType_sint]
    result =3D sprintf(page, "%dn", opts->q_len);
             ^
>> drivers/usb/early/ehci-dbgp.c:244:14: warning: Array 'bytes[2]' accessed=
 at index 3, which is out of bounds. [arrayIndexOutOfBounds]
     lo |=3D bytes[i] << (8*i);
                ^
>> drivers/usb/early/ehci-dbgp.c:260:3: warning: Possible null pointer dere=
ference: bytes [nullPointer]
     bytes[i] =3D (lo >> (8*i)) & 0xff;
     ^
   drivers/usb/early/ehci-dbgp.c:573:46: note: Calling function 'dbgp_contr=
ol_msg', 6th argument 'NULL' value is 0
      USB_REQ_SET_ADDRESS, USB_DEBUG_DEVNUM, 0, NULL, 0);
                                                ^
   drivers/usb/early/ehci-dbgp.c:360:35: note: Calling function 'dbgp_bulk_=
read', 3rd argument 'data' value is 0
    return dbgp_bulk_read(devnum, 0, data, size, DBGP_LOOPS);
                                     ^
   drivers/usb/early/ehci-dbgp.c:320:16: note: Calling function 'dbgp_get_d=
ata', 1st argument 'data' value is 0
    dbgp_get_data(data, size);
                  ^
   drivers/usb/early/ehci-dbgp.c:253:25: note: Assignment 'bytes=3Dbuf', as=
signed value is 0
    unsigned char *bytes =3D buf;
                           ^
   drivers/usb/early/ehci-dbgp.c:260:3: note: Null pointer dereference
     bytes[i] =3D (lo >> (8*i)) & 0xff;
     ^
>> drivers/mmc/host/usdhi6rol0.c:1122:17: warning: Boolean result is used i=
n bitwise operation. Clarify expression with parentheses. [clarifyCondition]
    return !status ^ !(mmc->caps2 & MMC_CAP2_CD_ACTIVE_HIGH);
                   ^
   drivers/mmc/host/usdhi6rol0.c:1138:17: warning: Boolean result is used i=
n bitwise operation. Clarify expression with parentheses. [clarifyCondition]
    return !status ^ !(mmc->caps2 & MMC_CAP2_RO_ACTIVE_HIGH);
                   ^
>> net/sunrpc/svcsock.c:439:9: warning: union member 'Anonymous0::all' is n=
ever used. [unusedStructMember]
     long  all[SVC_PKTINFO_SPACE / sizeof(long)];
           ^
>> net/sunrpc/svcsock.c:558:9: warning: union member 'Anonymous1::all' is n=
ever used. [unusedStructMember]
     long  all[SVC_PKTINFO_SPACE / sizeof(long)];
           ^
--
>> lib/xz/xz_dec_bcj.c:350:2: warning: Assignment of function parameter has=
 no effect outside the function. Did you forget dereferencing it? [uselessA=
ssignmentPtrArg]
    buf +=3D *pos;
    ^
>> lib/xz/xz_dec_bcj.c:351:2: warning: Assignment of function parameter has=
 no effect outside the function. [uselessAssignmentArg]
    size -=3D *pos;
    ^
>> kernel/profile.c:280:19: warning: Division by result of sizeof(). memset=
() expects a size in bytes, did you intend to multiply instead? [sizeofDivi=
sionMemfunc]
     memset(hits, 0, NR_PROFILE_HIT*sizeof(struct profile_hit));
                     ^
--
>> kernel/kthread.c:89:18: warning: Local variable kthread shadows outer fu=
nction [shadowFunction]
    struct kthread *kthread;
                    ^
   kernel/kthread.c:244:12: note: Shadowed declaration
   static int kthread(void *_create)
              ^
   kernel/kthread.c:89:18: note: Shadow variable
    struct kthread *kthread;
                    ^
   kernel/kthread.c:202:18: warning: Local variable kthread shadows outer f=
unction [shadowFunction]
    struct kthread *kthread =3D to_kthread(task);
                    ^
   kernel/kthread.c:244:12: note: Shadowed declaration
   static int kthread(void *_create)
              ^
   kernel/kthread.c:202:18: note: Shadow variable
    struct kthread *kthread =3D to_kthread(task);
                    ^
   kernel/kthread.c:502:18: warning: Local variable kthread shadows outer f=
unction [shadowFunction]
    struct kthread *kthread =3D to_kthread(k);
                    ^
   kernel/kthread.c:244:12: note: Shadowed declaration
   static int kthread(void *_create)
              ^
   kernel/kthread.c:502:18: note: Shadow variable
    struct kthread *kthread =3D to_kthread(k);
                    ^
   kernel/kthread.c:519:18: warning: Local variable kthread shadows outer f=
unction [shadowFunction]
    struct kthread *kthread =3D to_kthread(k);
                    ^
   kernel/kthread.c:244:12: note: Shadowed declaration
   static int kthread(void *_create)
              ^
   kernel/kthread.c:519:18: note: Shadow variable
    struct kthread *kthread =3D to_kthread(k);
                    ^
   kernel/kthread.c:536:18: warning: Local variable kthread shadows outer f=
unction [shadowFunction]
    struct kthread *kthread =3D to_kthread(k);
                    ^
   kernel/kthread.c:244:12: note: Shadowed declaration
   static int kthread(void *_create)
              ^
   kernel/kthread.c:536:18: note: Shadow variable
    struct kthread *kthread =3D to_kthread(k);
                    ^
   kernel/kthread.c:567:18: warning: Local variable kthread shadows outer f=
unction [shadowFunction]
    struct kthread *kthread =3D to_kthread(k);
                    ^
   kernel/kthread.c:244:12: note: Shadowed declaration
   static int kthread(void *_create)
              ^
   kernel/kthread.c:567:18: note: Shadow variable
    struct kthread *kthread =3D to_kthread(k);
                    ^
   kernel/kthread.c:611:18: warning: Local variable kthread shadows outer f=
unction [shadowFunction]
    struct kthread *kthread;
                    ^
   kernel/kthread.c:244:12: note: Shadowed declaration
   static int kthread(void *_create)
              ^
   kernel/kthread.c:611:18: note: Shadow variable
    struct kthread *kthread;
                    ^
   kernel/kthread.c:1376:18: warning: Local variable kthread shadows outer =
function [shadowFunction]
    struct kthread *kthread;
                    ^
   kernel/kthread.c:244:12: note: Shadowed declaration
   static int kthread(void *_create)
              ^
   kernel/kthread.c:1376:18: note: Shadow variable
    struct kthread *kthread;
                    ^
   kernel/kthread.c:1402:18: warning: Local variable kthread shadows outer =
function [shadowFunction]
    struct kthread *kthread;
                    ^
   kernel/kthread.c:244:12: note: Shadowed declaration
   static int kthread(void *_create)
              ^
   kernel/kthread.c:1402:18: note: Shadow variable
    struct kthread *kthread;
                    ^
--
>> kernel/relay.c:360:2: warning: %d in format string (no. 2) requires 'int=
' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
    snprintf(tmpname, NAME_MAX, "%s%d", chan->base_filename, cpu);
    ^
>> lib/sort.c:206:34: warning: Opposite expression on both sides of '&'. [o=
ppositeExpression]
    const unsigned int lsbit =3D size & -size;  /* Used to find parent */
                                    ^
>> lib/mpi/mpih-div.c:202:12: warning: Either the switch case 'case 0' is r=
edundant or there is division by zero at line 202. [zerodivcond]
     return 1 / dsize;
              ^
   lib/mpi/mpih-div.c:195:2: note: case 0: dsize is 0 here.
    case 0:
    ^
   lib/mpi/mpih-div.c:202:12: note: Division by zero
     return 1 / dsize;
              ^
>> lib/glob.c:48:43: warning: Uninitialized variable: back_str [uninitvar]
    char const *back_pat =3D NULL, *back_str =3D back_str;
                                             ^
--
>> lib/mpi/ec.c:357:0: warning: failed to evaluate #if condition, division/=
modulo by zero [preprocessorErrorDirective]
   #if (LIMB_SIZE_HALF_448 > LIMB_SIZE_448/2)
   ^
>> lib/xxhash.c:273:33: warning: Either the condition 'input=3D=3DNULL' is =
redundant or there is pointer arithmetic with NULL pointer. [nullPointerAri=
thmeticRedundantCheck]
    const uint8_t *const b_end =3D p + len;
                                   ^
   lib/xxhash.c:275:12: note: Assuming that condition 'input=3D=3DNULL' is =
not redundant
    if (input =3D=3D NULL)
              ^
   lib/xxhash.c:272:21: note: Assignment 'p=3D(const uint8_t*)input', assig=
ned value is 0
    const uint8_t *p =3D (const uint8_t *)input;
                       ^
   lib/xxhash.c:273:33: note: Null pointer addition
    const uint8_t *const b_end =3D p + len;
                                   ^
   lib/xxhash.c:380:33: warning: Either the condition 'input=3D=3DNULL' is =
redundant or there is pointer arithmetic with NULL pointer. [nullPointerAri=
thmeticRedundantCheck]
    const uint8_t *const b_end =3D p + len;
                                   ^
   lib/xxhash.c:382:12: note: Assuming that condition 'input=3D=3DNULL' is =
not redundant
    if (input =3D=3D NULL)
              ^
   lib/xxhash.c:379:21: note: Assignment 'p=3D(const uint8_t*)input', assig=
ned value is 0
    const uint8_t *p =3D (const uint8_t *)input;
                       ^
   lib/xxhash.c:380:33: note: Null pointer addition
    const uint8_t *const b_end =3D p + len;
                                   ^
>> lib/xxhash.c:300:3: warning: Variable 'p32' is modified but its new valu=
e is never used. [unreadVariable]
     p32++;
     ^
--
>> lib/oid_registry.c:118:16: warning: %u in format string (no. 1) requires=
 'unsigned int' but the argument type is 'signed int'. [invalidPrintfArgTyp=
e_uint]
    ret =3D count =3D snprintf(buffer, bufsize, "%u.%u", n / 40, n % 40);
                  ^
   lib/oid_registry.c:118:16: warning: %u in format string (no. 2) requires=
 'unsigned int' but the argument type is 'signed int'. [invalidPrintfArgTyp=
e_uint]
    ret =3D count =3D snprintf(buffer, bufsize, "%u.%u", n / 40, n % 40);
                  ^
--
>> drivers/leds/trigger/ledtrig-activity.c:158:9: warning: %u in format str=
ing (no. 1) requires 'unsigned int' but the argument type is 'signed int'. =
[invalidPrintfArgType_uint]
    return sprintf(buf, "%un", activity_data->invert);
           ^
--
>> drivers/memstick/core/memstick.c:330:59: warning: Uninitialized variable=
: id_reg [uninitvar]
     memstick_init_req(&card->current_mrq, MS_TPC_READ_REG, &id_reg,
                                                             ^
--
>> drivers/usb/musb/musb_gadget.c:1762:5: warning: Variable 'count' is modi=
fied but its new value is never used. [unreadVariable]
       count++;
       ^
>> net/ipv6/addrconf.c:1582:50: warning: Boolean result is used in bitwise =
operation. Clarify expression with parentheses. [clarifyCondition]
     ret =3D !(score->ifa->flags & IFA_F_HOMEADDRESS) ^ prefhome;
                                                    ^
>> mm/vmalloc.c:2924:3: warning: Assignment of function parameter has no ef=
fect outside the function. Did you forget dereferencing it? [uselessAssignm=
entPtrArg]
     addr +=3D n;
     ^
>> mm/vmalloc.c:2925:3: warning: Assignment of function parameter has no ef=
fect outside the function. [uselessAssignmentArg]
     count -=3D n;
     ^
   mm/vmalloc.c:3002:3: warning: Assignment of function parameter has no ef=
fect outside the function. Did you forget dereferencing it? [uselessAssignm=
entPtrArg]
     buf +=3D n;
     ^
   mm/vmalloc.c:3003:3: warning: Assignment of function parameter has no ef=
fect outside the function. Did you forget dereferencing it? [uselessAssignm=
entPtrArg]
     addr +=3D n;
     ^
   mm/vmalloc.c:3004:3: warning: Assignment of function parameter has no ef=
fect outside the function. [uselessAssignmentArg]
     count -=3D n;
     ^
>> drivers/gpio/gpio-twl4030.c:329:30: warning: Same expression in both bra=
nches of ternary operator. [duplicateExpressionTernary]
    ret =3D (status < 0) ? status : !!status;
                                ^
>> drivers/iio/common/st_sensors/st_sensors_buffer.c:45:3: warning: Assignm=
ent of function parameter has no effect outside the function. Did you forge=
t dereferencing it? [uselessAssignmentPtrArg]
     buf +=3D storage_bytes;
     ^
--
>> drivers/staging/greybus/hid.c:257:3: warning: Variable 'ret' is modified=
 but its new value is never used. [unreadVariable]
     ret++; /* add report_id to the number of transferred bytes */
     ^
--
>> drivers/pci/proc.c:101:3: warning: Assignment of function parameter has =
no effect outside the function. Did you forget dereferencing it? [uselessAs=
signmentPtrArg]
     buf++;
     ^
   drivers/pci/proc.c:178:3: warning: Assignment of function parameter has =
no effect outside the function. Did you forget dereferencing it? [uselessAs=
signmentPtrArg]
     buf++;
     ^
>> drivers/pci/proc.c:103:3: warning: Variable 'cnt' is modified but its ne=
w value is never used. [unreadVariable]
     cnt--;
     ^
   drivers/pci/proc.c:180:3: warning: Variable 'cnt' is modified but its ne=
w value is never used. [unreadVariable]
     cnt--;
     ^
>> drivers/staging/greybus/audio_codec.c:933:23: warning: Unused variable: =
jack [unusedVariable]
    struct gbaudio_jack *jack, *n;
                         ^
>> drivers/staging/greybus/audio_codec.c:933:30: warning: Unused variable: =
n [unusedVariable]
    struct gbaudio_jack *jack, *n;
                                ^
>> drivers/staging/greybus/audio_codec.c:934:6: warning: Unused variable: m=
ask [unusedVariable]
    int mask;
        ^
>> drivers/staging/greybus/audio_codec.c:314:8: warning: sscanf() without f=
ield width limits can crash with huge input data. [invalidscanf]
    ret =3D sscanf(w->sname, "%s %d %s", intf_name, &dai_id, dir);
          ^
--
>> drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.c:71:3: warning: Addres=
s of local auto-variable assigned to a function parameter. [autoVariables]
     *accel =3D &pack2->accel;
     ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.c:72:3: warning: Addres=
s of local auto-variable assigned to a function parameter. [autoVariables]
     *gyro =3D &pack2->gyro;
     ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.c:73:3: warning: Addres=
s of local auto-variable assigned to a function parameter. [autoVariables]
     *temp =3D &pack2->temp;
     ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.c:80:3: warning: Addres=
s of local auto-variable assigned to a function parameter. [autoVariables]
     *accel =3D &pack1->data;
     ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.c:82:3: warning: Addres=
s of local auto-variable assigned to a function parameter. [autoVariables]
     *temp =3D &pack1->temp;
     ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.c:90:3: warning: Addres=
s of local auto-variable assigned to a function parameter. [autoVariables]
     *gyro =3D &pack1->data;
     ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.c:91:3: warning: Addres=
s of local auto-variable assigned to a function parameter. [autoVariables]
     *temp =3D &pack1->temp;
     ^
--
>> drivers/staging/greybus/audio_topology.c:38:6: warning: sscanf() without=
 field width limits can crash with huge input data. [invalidscanf]
    if (sscanf(name, "%s %d", begin, &dev_id) !=3D 2)
        ^
--
>> drivers/mmc/host/sdhci.c:4096:3: warning: Non-boolean value returned fro=
m function returning bool [returnNonBoolInBooleanFunction]
     return host->caps & SDHCI_CAN_64BIT_V4;
     ^
   drivers/mmc/host/sdhci.c:4098:2: warning: Non-boolean value returned fro=
m function returning bool [returnNonBoolInBooleanFunction]
    return host->caps & SDHCI_CAN_64BIT;
    ^
>> drivers/mmc/host/sdhci.c:3011:19: warning: Array 'host->mrqs_done[2]' ac=
cessed at index 2, which is out of bounds. [arrayIndexOutOfBounds]
      host->mrqs_done[i] =3D NULL;
                     ^
   drivers/mmc/host/sdhci.c:2988:2: note: After for loop, i has value 2
    for (i =3D 0; i < SDHCI_MAX_MRQS; i++) {
    ^
   drivers/mmc/host/sdhci.c:3011:19: note: Array index out of bounds
      host->mrqs_done[i] =3D NULL;
                     ^
>> drivers/mmc/host/sdhci.c:3011:10: warning: Array 'host.mrqs_done[2]' acc=
essed at index 2, which is out of bounds. [arrayIndexOutOfBounds]
      host->mrqs_done[i] =3D NULL;
            ^

vim +847 arch/x86/events/intel/uncore.c

314d9f63f38509 arch/x86/kernel/cpu/perf_event_intel_uncore.c Yan, Zheng 201=
2-09-10  836  =

d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  837  static void uncore_get_pmu_name(struct intel_uncore_pmu *pmu)
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  838  {
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  839  	struct intel_uncore_type *type =3D pmu->type;
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  840  =

d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  841  	/*
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  842  	 * No uncore block name in discovery table.
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  843  	 * Use uncore_type_&typeid_&boxid as name.
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  844  	 */
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  845  	if (!type->name) {
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  846  		if (type->num_boxes =3D=3D 1)
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17 @847  			sprintf(pmu->name, "uncore_type_%u", type->type_id);
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  848  		else {
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17 @849  			sprintf(pmu->name, "uncore_type_%u_%d",
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  850  				type->type_id, type->box_ids[pmu->pmu_idx]);
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  851  		}
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  852  		return;
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  853  	}
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  854  =

d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  855  	if (type->num_boxes =3D=3D 1) {
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  856  		if (strlen(type->name) > 0)
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  857  			sprintf(pmu->name, "uncore_%s", type->name);
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  858  		else
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  859  			sprintf(pmu->name, "uncore");
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  860  	} else
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  861  		sprintf(pmu->name, "uncore_%s_%d", type->name, pmu->pmu_idx=
);
d6c754130435ab arch/x86/events/intel/uncore.c                Kan Liang  202=
1-03-17  862  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1184149298079196896==--

