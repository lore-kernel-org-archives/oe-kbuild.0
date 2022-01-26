Content-Type: multipart/mixed; boundary="===============0622203124504443919=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/ata/libata-acpi.c:768:19: warning: Value stored to 'ap' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 26 Jan 2022 13:37:07 +0800
Message-ID: <202201261355.9OWahdki-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0622203124504443919==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Hannes Reinecke <hare@suse.de>
CC: Damien Le Moal <damien.lemoal@opensource.wdc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0280e3c58f92b2fe0e8fbbdf8d386449168de4a8
commit: 17a1e1be2fc7dc99945b41df0485037dcb6044d0 ata: libata: drop ata_msg_=
probe()
date:   3 weeks ago
:::::: branch date: 11 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-c007-20220124 (https://download.01.org/0day-ci/ar=
chive/20220126/202201261355.9OWahdki-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30=
728816403d1fd73cc5082e9fb761262bce)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D17a1e1be2fc7dc99945b41df0485037dcb6044d0
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 17a1e1be2fc7dc99945b41df0485037dcb6044d0
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:307:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   include/linux/skbuff.h:2136:2: note: Dereference of null pointer
           WRITE_ONCE(next->prev, prev);
           ^
   include/asm-generic/rwonce.h:61:2: note: expanded from macro 'WRITE_ONCE'
           __WRITE_ONCE(x, val);                                           \
           ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:55:30: note: expanded from macro '__WRITE_O=
NCE'
           *(volatile typeof(x) *)&(x) =3D (val);                          =
  \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   net/ipv6/ip6_output.c:233:7: warning: Access to field 'autoflowlabel_set=
' results in a dereference of a null pointer (loaded from variable 'np') [c=
lang-analyzer-core.NullDereference]
           if (!np->autoflowlabel_set)
                ^
   net/ipv6/ip6_output.c:249:32: note: Calling 'inet6_sk'
           const struct ipv6_pinfo *np =3D inet6_sk(sk);
                                         ^~~~~~~~~~~~
   include/linux/ipv6.h:332:9: note: Assuming the condition is true
           return sk_fullsock(__sk) ? inet_sk(__sk)->pinet6 : NULL;
                  ^~~~~~~~~~~~~~~~~
   include/linux/ipv6.h:332:9: note: '?' condition is true
   include/linux/ipv6.h:332:2: note: Returning pointer
           return sk_fullsock(__sk) ? inet_sk(__sk)->pinet6 : NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/ip6_output.c:249:32: note: Returning from 'inet6_sk'
           const struct ipv6_pinfo *np =3D inet6_sk(sk);
                                         ^~~~~~~~~~~~
   net/ipv6/ip6_output.c:249:2: note: 'np' initialized here
           const struct ipv6_pinfo *np =3D inet6_sk(sk);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/ip6_output.c:262:6: note: Assuming 'opt' is null
           if (opt)
               ^~~
   net/ipv6/ip6_output.c:262:2: note: Taking false branch
           if (opt)
           ^
   net/ipv6/ip6_output.c:265:15: note: Assuming the condition is false
           if (unlikely(head_room > skb_headroom(skb))) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/ipv6/ip6_output.c:265:2: note: Taking false branch
           if (unlikely(head_room > skb_headroom(skb))) {
           ^
   net/ipv6/ip6_output.c:273:6: note: 'opt' is null
           if (opt) {
               ^~~
   net/ipv6/ip6_output.c:273:2: note: Taking false branch
           if (opt) {
           ^
   net/ipv6/ip6_output.c:291:6: note: Assuming 'np' is null
           if (np)
               ^~
   net/ipv6/ip6_output.c:291:2: note: Taking false branch
           if (np)
           ^
   net/ipv6/ip6_output.c:293:6: note: 'hlimit' is < 0
           if (hlimit < 0)
               ^~~~~~
   net/ipv6/ip6_output.c:293:2: note: Taking true branch
           if (hlimit < 0)
           ^
   net/ipv6/ip6_output.c:297:28: note: Passing null pointer value via 2nd p=
arameter 'np'
                                   ip6_autoflowlabel(net, np), fl6));
                                                          ^~
   net/ipv6/ip6_output.c:297:5: note: Calling 'ip6_autoflowlabel'
                                   ip6_autoflowlabel(net, np), fl6));
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/ip6_output.c:233:7: note: Access to field 'autoflowlabel_set' r=
esults in a dereference of a null pointer (loaded from variable 'np')
           if (!np->autoflowlabel_set)
                ^~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/ata/libata-acpi.c:768:19: warning: Value stored to 'ap' during i=
ts initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct ata_port *ap =3D dev->link->ap;
                            ^~   ~~~~~~~~~~~~~
   drivers/ata/libata-acpi.c:768:19: note: Value stored to 'ap' during its =
initialization is never read
           struct ata_port *ap =3D dev->link->ap;
                            ^~   ~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/hwmon/adm1031.c:245:6: warning: Value stored to 'range' during i=
ts initialization is never read [clang-analyzer-deadcode.DeadStores]
           int range =3D val - AUTO_TEMP_MIN_FROM_REG(reg);
               ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/adm1031.c:245:6: note: Value stored to 'range' during its =
initialization is never read
           int range =3D val - AUTO_TEMP_MIN_FROM_REG(reg);
               ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   net/ipv4/route.c:568:7: warning: Dereference of null pointer [clang-anal=
yzer-core.NullDereference]
           rt =3D rcu_dereference(fnhe->fnhe_rth_input);
                ^
   include/linux/rcupdate.h:597:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:529:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:390:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^
   net/ipv4/route.c:585:34: note: 'oldest' initialized to a null pointer va=
lue
           struct fib_nh_exception *fnhe, *oldest =3D NULL;
                                           ^~~~~~
   net/ipv4/route.c:587:2: note: Loop condition is true.  Entering loop body
           for (fnhe_p =3D &hash->chain; ; fnhe_p =3D &fnhe->fnhe_next) {
           ^
   net/ipv4/route.c:588:10: note: Assuming the condition is false
                   fnhe =3D rcu_dereference_protected(*fnhe_p,
                          ^
   include/linux/rcupdate.h:588:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:397:19: note: expanded from macro '__rcu_derefe=
rence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   include/linux/rcupdate.h:319:8: note: expanded from macro 'RCU_LOCKDEP_W=
ARN'
                   if ((c) && debug_lockdep_rcu_enabled() && !__warned) {  \
                        ^
   net/ipv4/route.c:588:10: note: Left side of '&&' is false
                   fnhe =3D rcu_dereference_protected(*fnhe_p,
                          ^
   include/linux/rcupdate.h:588:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^
   include/linux/rcupdate.h:397:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:319:11: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
                   if ((c) && debug_lockdep_rcu_enabled() && !__warned) {  \
                           ^
   net/ipv4/route.c:588:10: note: Loop condition is false.  Exiting loop
                   fnhe =3D rcu_dereference_protected(*fnhe_p,
                          ^
   include/linux/rcupdate.h:588:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)

vim +/ap +768 drivers/ata/libata-acpi.c

11ef697b37e3c8 Kristen Carlson Accardi 2006-09-28  749  =

7ea1fbc2a2449b Kristen Carlson Accardi 2006-09-28  750  /**
7ea1fbc2a2449b Kristen Carlson Accardi 2006-09-28  751   * ata_acpi_push_id=
 - send Identify data to drive
3a32a8e96694a2 Tejun Heo               2007-05-05  752   * @dev: target ATA=
 device
7ea1fbc2a2449b Kristen Carlson Accardi 2006-09-28  753   *
7ea1fbc2a2449b Kristen Carlson Accardi 2006-09-28  754   * _SDD ACPI object=
: for SATA mode only
7ea1fbc2a2449b Kristen Carlson Accardi 2006-09-28  755   * Must be after Id=
entify (Packet) Device -- uses its data
7ea1fbc2a2449b Kristen Carlson Accardi 2006-09-28  756   * ATM this functio=
n never returns a failure.  It is an optional
7ea1fbc2a2449b Kristen Carlson Accardi 2006-09-28  757   * method and if it=
 fails for whatever reason, we should still
7ea1fbc2a2449b Kristen Carlson Accardi 2006-09-28  758   * just keep going.
69b16a5f4c4f1d Tejun Heo               2007-05-15  759   *
69b16a5f4c4f1d Tejun Heo               2007-05-15  760   * LOCKING:
69b16a5f4c4f1d Tejun Heo               2007-05-15  761   * EH context.
69b16a5f4c4f1d Tejun Heo               2007-05-15  762   *
69b16a5f4c4f1d Tejun Heo               2007-05-15  763   * RETURNS:
f2406770a2f62a Tejun Heo               2009-11-18  764   * 0 on success, -E=
NOENT if _SDD doesn't exist, -errno on failure.
7ea1fbc2a2449b Kristen Carlson Accardi 2006-09-28  765   */
6746544c3b143c Tejun Heo               2007-05-15  766  static int ata_acpi=
_push_id(struct ata_device *dev)
7ea1fbc2a2449b Kristen Carlson Accardi 2006-09-28  767  {
9af5c9c97dc9d5 Tejun Heo               2007-08-06 @768  	struct ata_port *a=
p =3D dev->link->ap;
7ea1fbc2a2449b Kristen Carlson Accardi 2006-09-28  769  	acpi_status status;
7ea1fbc2a2449b Kristen Carlson Accardi 2006-09-28  770  	struct acpi_object=
_list input;
7ea1fbc2a2449b Kristen Carlson Accardi 2006-09-28  771  	union acpi_object =
in_params[1];
7ea1fbc2a2449b Kristen Carlson Accardi 2006-09-28  772  =

a9a79dfec23956 Joe Perches             2011-04-15  773  	ata_dev_dbg(dev, "=
%s: ix =3D %d, port#: %d\n",
7f5e4e8d94b601 Harvey Harrison         2008-03-05  774  		    __func__, dev=
->devno, ap->port_no);
7ea1fbc2a2449b Kristen Carlson Accardi 2006-09-28  775  =

7ea1fbc2a2449b Kristen Carlson Accardi 2006-09-28  776  	/* Give the drive =
Identify data to the drive via the _SDD method */
7ea1fbc2a2449b Kristen Carlson Accardi 2006-09-28  777  	/* _SDD: set up in=
put parameters */
7ea1fbc2a2449b Kristen Carlson Accardi 2006-09-28  778  	input.count =3D 1;
7ea1fbc2a2449b Kristen Carlson Accardi 2006-09-28  779  	input.pointer =3D =
in_params;
7ea1fbc2a2449b Kristen Carlson Accardi 2006-09-28  780  	in_params[0].type =
=3D ACPI_TYPE_BUFFER;
3a32a8e96694a2 Tejun Heo               2007-05-05  781  	in_params[0].buffe=
r.length =3D sizeof(dev->id[0]) * ATA_ID_WORDS;
3a32a8e96694a2 Tejun Heo               2007-05-05  782  	in_params[0].buffe=
r.pointer =3D (u8 *)dev->id;
7ea1fbc2a2449b Kristen Carlson Accardi 2006-09-28  783  	/* Output buffer: =
_SDD has no output */
7ea1fbc2a2449b Kristen Carlson Accardi 2006-09-28  784  =

7ea1fbc2a2449b Kristen Carlson Accardi 2006-09-28  785  	/* It's OK for _SD=
D to be missing too. */
3a32a8e96694a2 Tejun Heo               2007-05-05  786  	swap_buf_le16(dev-=
>id, ATA_ID_WORDS);
30dcf76acc695c Matthew Garrett         2012-06-25  787  	status =3D acpi_ev=
aluate_object(ata_dev_acpi_handle(dev), "_SDD", &input,
30dcf76acc695c Matthew Garrett         2012-06-25  788  				      NULL);
3a32a8e96694a2 Tejun Heo               2007-05-05  789  	swap_buf_le16(dev-=
>id, ATA_ID_WORDS);
7ea1fbc2a2449b Kristen Carlson Accardi 2006-09-28  790  =

f2406770a2f62a Tejun Heo               2009-11-18  791  	if (status =3D=3D =
AE_NOT_FOUND)
f2406770a2f62a Tejun Heo               2009-11-18  792  		return -ENOENT;
f2406770a2f62a Tejun Heo               2009-11-18  793  =

f2406770a2f62a Tejun Heo               2009-11-18  794  	if (ACPI_FAILURE(s=
tatus)) {
a9a79dfec23956 Joe Perches             2011-04-15  795  		ata_dev_warn(dev,=
 "ACPI _SDD failed (AE 0x%x)\n", status);
f2406770a2f62a Tejun Heo               2009-11-18  796  		return -EIO;
f2406770a2f62a Tejun Heo               2009-11-18  797  	}
7ea1fbc2a2449b Kristen Carlson Accardi 2006-09-28  798  =

f2406770a2f62a Tejun Heo               2009-11-18  799  	return 0;
6746544c3b143c Tejun Heo               2007-05-15  800  }
6746544c3b143c Tejun Heo               2007-05-15  801  =


:::::: The code at line 768 was first introduced by commit
:::::: 9af5c9c97dc9d599281778864c72b385f0c63341 libata-link: introduce ata_=
link

:::::: TO: Tejun Heo <htejun@gmail.com>
:::::: CC: Jeff Garzik <jeff@garzik.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0622203124504443919==--

