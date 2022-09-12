Content-Type: multipart/mixed; boundary="===============8667719644966590728=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/powerpc/lib/sstep.c:1635:9: warning: Shifting a negative value is technically undefined behaviour [shiftNegativeLHS]
Date: Mon, 12 Sep 2022 19:14:29 +0800
Message-ID: <202209121943.cZrH2zQ8-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8667719644966590728==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: arch/powe=
rpc/lib/sstep.c:1635:9: warning: Shifting a negative value is technically u=
ndefined behaviour [shiftNegativeLHS]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Anders Roxell <anders.roxell@linaro.org>
CC: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   80e78fcce86de0288793a0ef0f6acf37656ee4cf
commit: fe663df7825811358531dc2e8a52d9eaa5e3515e powerpc/lib/sstep: fix 'pt=
esync' build error
date:   7 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 7 months ago
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout fe663df7825811358531dc2e8a52d9eaa5e3515e
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/powerpc/mm/book3s32/mmu.c:406:12: warning: The if condition is the =
same as the previous if condition [duplicateCondition]
    if (ppc_md.progress)
              ^
   arch/powerpc/mm/book3s32/mmu.c:404:12: note: First condition
    if (ppc_md.progress)
              ^
   arch/powerpc/mm/book3s32/mmu.c:406:12: note: Second condition
    if (ppc_md.progress)
              ^
>> arch/powerpc/mm/book3s32/mmu.c:226:27: warning: Signed integer overflow =
for expression 'i<<28'. [integerOverflow]
     if (is_module_segment(i << 28))
                             ^
   arch/powerpc/mm/book3s32/mmu.c:224:30: note: Assuming that condition 'i<=
16' is not redundant
    for (i =3D TASK_SIZE >> 28; i < 16; i++) {
                                ^
   arch/powerpc/mm/book3s32/mmu.c:226:27: note: Integer overflow
     if (is_module_segment(i << 28))
                             ^
--
>> arch/powerpc/platforms/powermac/low_i2c.c:1036:66: warning: Parameter 'a=
dapter' can be declared with const [constParameter]
   struct pmac_i2c_bus *pmac_i2c_adapter_to_bus(struct i2c_adapter *adapter)
                                                                    ^
   arch/powerpc/platforms/powermac/low_i2c.c:1047:73: warning: Parameter 'a=
dapter' can be declared with const [constParameter]
   int pmac_i2c_match_adapter(struct device_node *dev, struct i2c_adapter *=
adapter)
                                                                           ^
>> arch/powerpc/platforms/powermac/low_i2c.c:1057:43: warning: Parameter 'n=
p' can be declared with const [constParameter]
   int pmac_low_i2c_lock(struct device_node *np)
                                             ^
   arch/powerpc/platforms/powermac/low_i2c.c:1073:45: warning: Parameter 'n=
p' can be declared with const [constParameter]
   int pmac_low_i2c_unlock(struct device_node *np)
                                               ^
>> arch/powerpc/platforms/powermac/low_i2c.c:965:18: warning: Uninitialized=
 variable: bus->busnode [uninitvar]
      if (p =3D=3D bus->busnode) {
                    ^
>> arch/powerpc/platforms/powermac/low_i2c.c:1062:18: warning: Uninitialize=
d variable: bus->controller [uninitvar]
     if (np =3D=3D bus->controller) {
                    ^
   arch/powerpc/platforms/powermac/low_i2c.c:1078:18: warning: Uninitialize=
d variable: bus->controller [uninitvar]
     if (np =3D=3D bus->controller) {
                    ^
   arch/powerpc/platforms/powermac/low_i2c.c:1198:31: warning: Uninitialize=
d variable: bus->busnode [uninitvar]
     for_each_child_of_node(bus->busnode, np) {
                                 ^
>> arch/powerpc/platforms/powermac/low_i2c.c:1503:42: warning: Uninitialize=
d variables: bus.link, bus.controller, bus.busnode, bus.type, bus.flags, bu=
s.adapter, bus.hostdata, bus.channel, bus.mode, bus.mutex, bus.opened, bus.=
polled, bus.lock_key, bus.open, bus.close, bus.xfer [uninitvar]
     bus->platform_dev->dev.platform_data =3D bus;
                                            ^
   arch/powerpc/platforms/powermac/low_i2c.c:1501:25: note: Assuming condit=
ion is false
     if (bus->platform_dev =3D=3D NULL)
                           ^
   arch/powerpc/platforms/powermac/low_i2c.c:1501:25: note: Assuming condit=
ion is false
     if (bus->platform_dev =3D=3D NULL)
                           ^
   arch/powerpc/platforms/powermac/low_i2c.c:1501:25: note: Assuming condit=
ion is false
     if (bus->platform_dev =3D=3D NULL)
                           ^
   arch/powerpc/platforms/powermac/low_i2c.c:1501:25: note: Assuming condit=
ion is false
     if (bus->platform_dev =3D=3D NULL)
                           ^
   arch/powerpc/platforms/powermac/low_i2c.c:1501:25: note: Assuming condit=
ion is false
     if (bus->platform_dev =3D=3D NULL)
                           ^
   arch/powerpc/platforms/powermac/low_i2c.c:1501:25: note: Assuming condit=
ion is false
     if (bus->platform_dev =3D=3D NULL)
                           ^
   arch/powerpc/platforms/powermac/low_i2c.c:1501:25: note: Assuming condit=
ion is false
     if (bus->platform_dev =3D=3D NULL)
                           ^
   arch/powerpc/platforms/powermac/low_i2c.c:1501:25: note: Assuming condit=
ion is false
     if (bus->platform_dev =3D=3D NULL)
                           ^
   arch/powerpc/platforms/powermac/low_i2c.c:1501:25: note: Assuming condit=
ion is false
     if (bus->platform_dev =3D=3D NULL)
                           ^
   arch/powerpc/platforms/powermac/low_i2c.c:1501:25: note: Assuming condit=
ion is false
     if (bus->platform_dev =3D=3D NULL)
                           ^
   arch/powerpc/platforms/powermac/low_i2c.c:1501:25: note: Assuming condit=
ion is false
     if (bus->platform_dev =3D=3D NULL)
                           ^
   arch/powerpc/platforms/powermac/low_i2c.c:1501:25: note: Assuming condit=
ion is false
     if (bus->platform_dev =3D=3D NULL)
                           ^
   arch/powerpc/platforms/powermac/low_i2c.c:1501:25: note: Assuming condit=
ion is false
     if (bus->platform_dev =3D=3D NULL)
                           ^
   arch/powerpc/platforms/powermac/low_i2c.c:1501:25: note: Assuming condit=
ion is false
     if (bus->platform_dev =3D=3D NULL)
                           ^
   arch/powerpc/platforms/powermac/low_i2c.c:1501:25: note: Assuming condit=
ion is false
     if (bus->platform_dev =3D=3D NULL)
                           ^
   arch/powerpc/platforms/powermac/low_i2c.c:1501:25: note: Assuming condit=
ion is false
     if (bus->platform_dev =3D=3D NULL)
                           ^
   arch/powerpc/platforms/powermac/low_i2c.c:1503:42: note: Uninitialized v=
ariables: bus.link, bus.controller, bus.busnode, bus.type, bus.flags, bus.a=
dapter, bus.hostdata, bus.channel, bus.mode, bus.mutex, bus.opened, bus.pol=
led, bus.lock_key, bus.open, bus.close, bus.xfer
     bus->platform_dev->dev.platform_data =3D bus;
                                            ^
>> arch/powerpc/perf/core-book3s.c:2485:10: warning: Using pointer that is =
a temporary. [danglingTemporaryLifetime]
     memset(cpuhw, 0, sizeof(*cpuhw));
            ^
   arch/powerpc/perf/core-book3s.c:2482:32: note: Address of variable taken=
 here.
    struct cpu_hw_events *cpuhw =3D &per_cpu(cpu_hw_events, cpu);
                                  ^
   arch/powerpc/perf/core-book3s.c:2482:40: note: Temporary created here.
    struct cpu_hw_events *cpuhw =3D &per_cpu(cpu_hw_events, cpu);
                                          ^
   arch/powerpc/perf/core-book3s.c:2485:10: note: Using pointer that is a t=
emporary.
     memset(cpuhw, 0, sizeof(*cpuhw));
            ^
   arch/powerpc/perf/core-book3s.c:2486:3: warning: Using pointer that is a=
 temporary. [danglingTemporaryLifetime]
     cpuhw->mmcr.mmcr0 =3D MMCR0_FC;
     ^
   arch/powerpc/perf/core-book3s.c:2482:32: note: Address of variable taken=
 here.
    struct cpu_hw_events *cpuhw =3D &per_cpu(cpu_hw_events, cpu);
                                  ^
   arch/powerpc/perf/core-book3s.c:2482:40: note: Temporary created here.
    struct cpu_hw_events *cpuhw =3D &per_cpu(cpu_hw_events, cpu);
                                          ^
   arch/powerpc/perf/core-book3s.c:2486:3: note: Using pointer that is a te=
mporary.
     cpuhw->mmcr.mmcr0 =3D MMCR0_FC;
     ^
>> arch/powerpc/perf/core-book3s.c:1092:47: warning: Parameter 'ctrs' can b=
e declared with const [constParameter]
   static int check_excludes(struct perf_event **ctrs, unsigned int cflags[=
],
                                                 ^
--
>> arch/powerpc/lib/sstep.c:1635:9: warning: Shifting a negative value is t=
echnically undefined behaviour [shiftNegativeLHS]
     imm =3D MASK32(mb, me);
           ^
   arch/powerpc/lib/sstep.c:1643:31: warning: Shifting a negative value is =
technically undefined behaviour [shiftNegativeLHS]
     op->val =3D ROTATE(val, rb) & MASK32(mb, me);
                                 ^
   arch/powerpc/lib/sstep.c:1651:31: warning: Shifting a negative value is =
technically undefined behaviour [shiftNegativeLHS]
     op->val =3D ROTATE(val, rb) & MASK32(mb, me);
                                 ^
>> arch/powerpc/lib/sstep.c:329:1: warning: Label 'Efault' is not used. The=
re is #if in function body so the label might be used in code that is remov=
ed by the preprocessor. [unusedLabelConfiguration]
   Efault:
   ^
   arch/powerpc/lib/sstep.c:386:1: warning: Label 'Efault' is not used. The=
re is #if in function body so the label might be used in code that is remov=
ed by the preprocessor. [unusedLabelConfiguration]
   Efault:
   ^
   arch/powerpc/lib/sstep.c:465:1: warning: Label 'Efault' is not used. The=
re is #if in function body so the label might be used in code that is remov=
ed by the preprocessor. [unusedLabelConfiguration]
   Efault:
   ^
   arch/powerpc/lib/sstep.c:522:1: warning: Label 'Efault' is not used. The=
re is #if in function body so the label might be used in code that is remov=
ed by the preprocessor. [unusedLabelConfiguration]
   Efault:
   ^
>> arch/powerpc/lib/sstep.c:656:8: warning: Overlapping read/write of union=
 is undefined behavior [overlappingWriteUnion]
      u.u =3D u.l[0];
          ^
>> arch/powerpc/lib/sstep.c:2232:33: warning: Unsigned expression '63-sh' c=
an't be negative so it is unnecessary to test it. [unsignedPositive]
       op->val =3D ROTATE(val, sh) & MASK64(0, 63 - sh);
                                   ^
>> arch/powerpc/lib/sstep.c:2201:19: warning: Shifting signed 64-bit value =
by 63 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
      op->val =3D ival >> (sh < 64 ? sh : 63);
                     ^

vim +1635 arch/powerpc/lib/sstep.c

930d6288a26787 Sandipan Das               2019-02-22  1563  =

0016a4cf558241 Paul Mackerras             2010-06-15  1564  	case 7:		/* mu=
lli */
777e26f0edf8da Jordan Niethe              2020-05-06  1565  		op->val =3D r=
egs->gpr[ra] * (short) word;
3cdfcbfd32b9d1 Paul Mackerras             2017-08-30  1566  		goto compute_=
done;
0016a4cf558241 Paul Mackerras             2010-06-15  1567  =

0016a4cf558241 Paul Mackerras             2010-06-15  1568  	case 8:		/* su=
bfic */
777e26f0edf8da Jordan Niethe              2020-05-06  1569  		imm =3D (shor=
t) word;
3cdfcbfd32b9d1 Paul Mackerras             2017-08-30  1570  		add_with_carr=
y(regs, op, rd, ~regs->gpr[ra], imm, 1);
3cdfcbfd32b9d1 Paul Mackerras             2017-08-30  1571  		return 1;
0016a4cf558241 Paul Mackerras             2010-06-15  1572  =

0016a4cf558241 Paul Mackerras             2010-06-15  1573  	case 10:	/* cm=
pli */
777e26f0edf8da Jordan Niethe              2020-05-06  1574  		imm =3D (unsi=
gned short) word;
0016a4cf558241 Paul Mackerras             2010-06-15  1575  		val =3D regs-=
>gpr[ra];
0016a4cf558241 Paul Mackerras             2010-06-15  1576  #ifdef __powerp=
c64__
0016a4cf558241 Paul Mackerras             2010-06-15  1577  		if ((rd & 1) =
=3D=3D 0)
0016a4cf558241 Paul Mackerras             2010-06-15  1578  			val =3D (uns=
igned int) val;
0016a4cf558241 Paul Mackerras             2010-06-15  1579  #endif
3cdfcbfd32b9d1 Paul Mackerras             2017-08-30  1580  		do_cmp_unsign=
ed(regs, op, val, imm, rd >> 2);
3cdfcbfd32b9d1 Paul Mackerras             2017-08-30  1581  		return 1;
0016a4cf558241 Paul Mackerras             2010-06-15  1582  =

0016a4cf558241 Paul Mackerras             2010-06-15  1583  	case 11:	/* cm=
pi */
777e26f0edf8da Jordan Niethe              2020-05-06  1584  		imm =3D (shor=
t) word;
0016a4cf558241 Paul Mackerras             2010-06-15  1585  		val =3D regs-=
>gpr[ra];
0016a4cf558241 Paul Mackerras             2010-06-15  1586  #ifdef __powerp=
c64__
0016a4cf558241 Paul Mackerras             2010-06-15  1587  		if ((rd & 1) =
=3D=3D 0)
0016a4cf558241 Paul Mackerras             2010-06-15  1588  			val =3D (int=
) val;
0016a4cf558241 Paul Mackerras             2010-06-15  1589  #endif
3cdfcbfd32b9d1 Paul Mackerras             2017-08-30  1590  		do_cmp_signed=
(regs, op, val, imm, rd >> 2);
3cdfcbfd32b9d1 Paul Mackerras             2017-08-30  1591  		return 1;
0016a4cf558241 Paul Mackerras             2010-06-15  1592  =

0016a4cf558241 Paul Mackerras             2010-06-15  1593  	case 12:	/* ad=
dic */
777e26f0edf8da Jordan Niethe              2020-05-06  1594  		imm =3D (shor=
t) word;
3cdfcbfd32b9d1 Paul Mackerras             2017-08-30  1595  		add_with_carr=
y(regs, op, rd, regs->gpr[ra], imm, 0);
3cdfcbfd32b9d1 Paul Mackerras             2017-08-30  1596  		return 1;
0016a4cf558241 Paul Mackerras             2010-06-15  1597  =

0016a4cf558241 Paul Mackerras             2010-06-15  1598  	case 13:	/* ad=
dic. */
777e26f0edf8da Jordan Niethe              2020-05-06  1599  		imm =3D (shor=
t) word;
3cdfcbfd32b9d1 Paul Mackerras             2017-08-30  1600  		add_with_carr=
y(regs, op, rd, regs->gpr[ra], imm, 0);
ad47ff3e33503e Anton Blanchard            2017-09-19  1601  		set_cr0(regs,=
 op);
3cdfcbfd32b9d1 Paul Mackerras             2017-08-30  1602  		return 1;
0016a4cf558241 Paul Mackerras             2010-06-15  1603  =

0016a4cf558241 Paul Mackerras             2010-06-15  1604  	case 14:	/* ad=
di */
777e26f0edf8da Jordan Niethe              2020-05-06  1605  		imm =3D (shor=
t) word;
0016a4cf558241 Paul Mackerras             2010-06-15  1606  		if (ra)
0016a4cf558241 Paul Mackerras             2010-06-15  1607  			imm +=3D reg=
s->gpr[ra];
3cdfcbfd32b9d1 Paul Mackerras             2017-08-30  1608  		op->val =3D i=
mm;
3cdfcbfd32b9d1 Paul Mackerras             2017-08-30  1609  		goto compute_=
done;
0016a4cf558241 Paul Mackerras             2010-06-15  1610  =

0016a4cf558241 Paul Mackerras             2010-06-15  1611  	case 15:	/* ad=
dis */
777e26f0edf8da Jordan Niethe              2020-05-06  1612  		imm =3D ((sho=
rt) word) << 16;
0016a4cf558241 Paul Mackerras             2010-06-15  1613  		if (ra)
0016a4cf558241 Paul Mackerras             2010-06-15  1614  			imm +=3D reg=
s->gpr[ra];
3cdfcbfd32b9d1 Paul Mackerras             2017-08-30  1615  		op->val =3D i=
mm;
3cdfcbfd32b9d1 Paul Mackerras             2017-08-30  1616  		goto compute_=
done;
0016a4cf558241 Paul Mackerras             2010-06-15  1617  =

958465ee5407dc Paul Mackerras             2017-08-30  1618  	case 19:
777e26f0edf8da Jordan Niethe              2020-05-06  1619  		if (((word >>=
 1) & 0x1f) =3D=3D 2) {
958465ee5407dc Paul Mackerras             2017-08-30  1620  			/* addpcis */
8813ff49607eab Ananth N Mavinakayanahalli 2021-01-25  1621  			if (!cpu_has=
_feature(CPU_FTR_ARCH_300))
8813ff49607eab Ananth N Mavinakayanahalli 2021-01-25  1622  				goto unknow=
n_opcode;
777e26f0edf8da Jordan Niethe              2020-05-06  1623  			imm =3D (sho=
rt) (word & 0xffc1);	/* d0 + d2 fields */
777e26f0edf8da Jordan Niethe              2020-05-06  1624  			imm |=3D (wo=
rd >> 15) & 0x3e;	/* d1 field */
958465ee5407dc Paul Mackerras             2017-08-30  1625  			op->val =3D =
regs->nip + (imm << 16) + 4;
958465ee5407dc Paul Mackerras             2017-08-30  1626  			goto compute=
_done;
958465ee5407dc Paul Mackerras             2017-08-30  1627  		}
958465ee5407dc Paul Mackerras             2017-08-30  1628  		op->type =3D =
UNKNOWN;
958465ee5407dc Paul Mackerras             2017-08-30  1629  		return 0;
958465ee5407dc Paul Mackerras             2017-08-30  1630  =

0016a4cf558241 Paul Mackerras             2010-06-15  1631  	case 20:	/* rl=
wimi */
777e26f0edf8da Jordan Niethe              2020-05-06  1632  		mb =3D (word =
>> 6) & 0x1f;
777e26f0edf8da Jordan Niethe              2020-05-06  1633  		me =3D (word =
>> 1) & 0x1f;
0016a4cf558241 Paul Mackerras             2010-06-15  1634  		val =3D DATA3=
2(regs->gpr[rd]);
0016a4cf558241 Paul Mackerras             2010-06-15 @1635  		imm =3D MASK3=
2(mb, me);
3cdfcbfd32b9d1 Paul Mackerras             2017-08-30  1636  		op->val =3D (=
regs->gpr[ra] & ~imm) | (ROTATE(val, rb) & imm);
0016a4cf558241 Paul Mackerras             2010-06-15  1637  		goto logical_=
done;
0016a4cf558241 Paul Mackerras             2010-06-15  1638  =

0016a4cf558241 Paul Mackerras             2010-06-15  1639  	case 21:	/* rl=
winm */
777e26f0edf8da Jordan Niethe              2020-05-06  1640  		mb =3D (word =
>> 6) & 0x1f;
777e26f0edf8da Jordan Niethe              2020-05-06  1641  		me =3D (word =
>> 1) & 0x1f;
0016a4cf558241 Paul Mackerras             2010-06-15  1642  		val =3D DATA3=
2(regs->gpr[rd]);
3cdfcbfd32b9d1 Paul Mackerras             2017-08-30  1643  		op->val =3D R=
OTATE(val, rb) & MASK32(mb, me);
0016a4cf558241 Paul Mackerras             2010-06-15  1644  		goto logical_=
done;
0016a4cf558241 Paul Mackerras             2010-06-15  1645  =

0016a4cf558241 Paul Mackerras             2010-06-15  1646  	case 23:	/* rl=
wnm */
777e26f0edf8da Jordan Niethe              2020-05-06  1647  		mb =3D (word =
>> 6) & 0x1f;
777e26f0edf8da Jordan Niethe              2020-05-06  1648  		me =3D (word =
>> 1) & 0x1f;
0016a4cf558241 Paul Mackerras             2010-06-15  1649  		rb =3D regs->=
gpr[rb] & 0x1f;
0016a4cf558241 Paul Mackerras             2010-06-15  1650  		val =3D DATA3=
2(regs->gpr[rd]);
3cdfcbfd32b9d1 Paul Mackerras             2017-08-30  1651  		op->val =3D R=
OTATE(val, rb) & MASK32(mb, me);
0016a4cf558241 Paul Mackerras             2010-06-15  1652  		goto logical_=
done;
0016a4cf558241 Paul Mackerras             2010-06-15  1653  =

0016a4cf558241 Paul Mackerras             2010-06-15  1654  	case 24:	/* or=
i */
777e26f0edf8da Jordan Niethe              2020-05-06  1655  		op->val =3D r=
egs->gpr[rd] | (unsigned short) word;
3cdfcbfd32b9d1 Paul Mackerras             2017-08-30  1656  		goto logical_=
done_nocc;
0016a4cf558241 Paul Mackerras             2010-06-15  1657  =

0016a4cf558241 Paul Mackerras             2010-06-15  1658  	case 25:	/* or=
is */
777e26f0edf8da Jordan Niethe              2020-05-06  1659  		imm =3D (unsi=
gned short) word;
3cdfcbfd32b9d1 Paul Mackerras             2017-08-30  1660  		op->val =3D r=
egs->gpr[rd] | (imm << 16);
3cdfcbfd32b9d1 Paul Mackerras             2017-08-30  1661  		goto logical_=
done_nocc;
0016a4cf558241 Paul Mackerras             2010-06-15  1662  =

0016a4cf558241 Paul Mackerras             2010-06-15  1663  	case 26:	/* xo=
ri */
777e26f0edf8da Jordan Niethe              2020-05-06  1664  		op->val =3D r=
egs->gpr[rd] ^ (unsigned short) word;
3cdfcbfd32b9d1 Paul Mackerras             2017-08-30  1665  		goto logical_=
done_nocc;
0016a4cf558241 Paul Mackerras             2010-06-15  1666  =

0016a4cf558241 Paul Mackerras             2010-06-15  1667  	case 27:	/* xo=
ris */
777e26f0edf8da Jordan Niethe              2020-05-06  1668  		imm =3D (unsi=
gned short) word;
3cdfcbfd32b9d1 Paul Mackerras             2017-08-30  1669  		op->val =3D r=
egs->gpr[rd] ^ (imm << 16);
3cdfcbfd32b9d1 Paul Mackerras             2017-08-30  1670  		goto logical_=
done_nocc;
0016a4cf558241 Paul Mackerras             2010-06-15  1671  =

0016a4cf558241 Paul Mackerras             2010-06-15  1672  	case 28:	/* an=
di. */
777e26f0edf8da Jordan Niethe              2020-05-06  1673  		op->val =3D r=
egs->gpr[rd] & (unsigned short) word;
ad47ff3e33503e Anton Blanchard            2017-09-19  1674  		set_cr0(regs,=
 op);
3cdfcbfd32b9d1 Paul Mackerras             2017-08-30  1675  		goto logical_=
done_nocc;
0016a4cf558241 Paul Mackerras             2010-06-15  1676  =

0016a4cf558241 Paul Mackerras             2010-06-15  1677  	case 29:	/* an=
dis. */
777e26f0edf8da Jordan Niethe              2020-05-06  1678  		imm =3D (unsi=
gned short) word;
3cdfcbfd32b9d1 Paul Mackerras             2017-08-30  1679  		op->val =3D r=
egs->gpr[rd] & (imm << 16);
ad47ff3e33503e Anton Blanchard            2017-09-19  1680  		set_cr0(regs,=
 op);
3cdfcbfd32b9d1 Paul Mackerras             2017-08-30  1681  		goto logical_=
done_nocc;
0016a4cf558241 Paul Mackerras             2010-06-15  1682  =


:::::: The code@line 1635 was first introduced by commit
:::::: 0016a4cf5582415849fafbf9f019dd9530824789 powerpc: Emulate most Book =
I instructions in emulate_step()

:::::: TO: Paul Mackerras <paulus@samba.org>
:::::: CC: Paul Mackerras <paulus@samba.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8667719644966590728==--

