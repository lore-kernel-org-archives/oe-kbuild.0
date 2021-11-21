Content-Type: multipart/mixed; boundary="===============5471499479853093380=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/hyperv/rndis_filter.c:135:31: warning: Value stored to 'pkt' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 21 Nov 2021 22:10:47 +0800
Message-ID: <202111212241.ZT6Vf8ml-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5471499479853093380==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Andrea Parri (Microsoft)" <parri.andrea@gmail.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   923dcc5eb0c111eccd51cc7ce1658537e3c38b25
commit: 505e3f00c3f3648cb6260deb35e87fae1f64f5d8 hv_netvsc: Add (more) vali=
dation for untrusted Hyper-V values
date:   10 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-c007-20211025 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project a461fa=
64bb37cffd73f683c74f6b0780379fc2ca)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D505e3f00c3f3648cb6260deb35e87fae1f64f5d8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 505e3f00c3f3648cb6260deb35e87fae1f64f5d8
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/list.h:916:3: note: Loop condition is false.  Exiting loop
                   WRITE_ONCE(n->next->pprev, &n->next);
                   ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:298:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   include/linux/list.h:916:3: note: Use of memory after it is freed
                   WRITE_ONCE(n->next->pprev, &n->next);
                   ^
   include/asm-generic/rwonce.h:61:2: note: expanded from macro 'WRITE_ONCE'
           __WRITE_ONCE(x, val);                                           \
           ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:55:30: note: expanded from macro '__WRITE_O=
NCE'
           *(volatile typeof(x) *)&(x) =3D (val);                          =
  \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/usb/misc/usb251xb.c:552:2: warning: Value stored to 'len' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           len =3D utf8s_to_utf16s(str, len, UTF16_LITTLE_ENDIAN,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/misc/usb251xb.c:552:2: note: Value stored to 'len' is never =
read
           len =3D utf8s_to_utf16s(str, len, UTF16_LITTLE_ENDIAN,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/misc/usb251xb.c:561:2: warning: Value stored to 'len' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           len =3D utf8s_to_utf16s(str, len, UTF16_LITTLE_ENDIAN,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/misc/usb251xb.c:561:2: note: Value stored to 'len' is never =
read
           len =3D utf8s_to_utf16s(str, len, UTF16_LITTLE_ENDIAN,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/misc/usb251xb.c:571:2: warning: Value stored to 'len' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           len =3D utf8s_to_utf16s(str, len, UTF16_LITTLE_ENDIAN,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/misc/usb251xb.c:571:2: note: Value stored to 'len' is never =
read
           len =3D utf8s_to_utf16s(str, len, UTF16_LITTLE_ENDIAN,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
>> drivers/net/hyperv/rndis_filter.c:135:31: warning: Value stored to 'pkt'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
                           const struct rndis_packet *pkt =3D &rndis_msg->m=
sg.pkt;
                                                      ^~~   ~~~~~~~~~~~~~~~=
~~~~
   drivers/net/hyperv/rndis_filter.c:135:31: note: Value stored to 'pkt' du=
ring its initialization is never read
                           const struct rndis_packet *pkt =3D &rndis_msg->m=
sg.pkt;
                                                      ^~~   ~~~~~~~~~~~~~~~=
~~~~
>> drivers/net/hyperv/rndis_filter.c:154:44: warning: Value stored to 'init=
_complete' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
                           const struct rndis_initialize_complete *init_com=
plete =3D
                                                                   ^~~~~~~~=
~~~~~
   drivers/net/hyperv/rndis_filter.c:154:44: note: Value stored to 'init_co=
mplete' during its initialization is never read
                           const struct rndis_initialize_complete *init_com=
plete =3D
                                                                   ^~~~~~~~=
~~~~~
>> drivers/net/hyperv/rndis_filter.c:175:39: warning: Value stored to 'quer=
y_complete' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
                           const struct rndis_query_complete *query_complet=
e =3D
                                                              ^~~~~~~~~~~~~~
   drivers/net/hyperv/rndis_filter.c:175:39: note: Value stored to 'query_c=
omplete' during its initialization is never read
                           const struct rndis_query_complete *query_complet=
e =3D
                                                              ^~~~~~~~~~~~~~
>> drivers/net/hyperv/rndis_filter.c:190:37: warning: Value stored to 'set_=
complete' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
                           const struct rndis_set_complete *set_complete =
=3D
                                                            ^~~~~~~~~~~~
   drivers/net/hyperv/rndis_filter.c:190:37: note: Value stored to 'set_com=
plete' during its initialization is never read
                           const struct rndis_set_complete *set_complete =
=3D
                                                            ^~~~~~~~~~~~
>> drivers/net/hyperv/rndis_filter.c:203:40: warning: Value stored to 'indi=
cate_status' during its initialization is never read [clang-analyzer-deadco=
de.DeadStores]
                           const struct rndis_indicate_status *indicate_sta=
tus =3D
                                                               ^~~~~~~~~~~~=
~~~
   drivers/net/hyperv/rndis_filter.c:203:40: note: Value stored to 'indicat=
e_status' during its initialization is never read
                           const struct rndis_indicate_status *indicate_sta=
tus =3D
                                                               ^~~~~~~~~~~~=
~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/i2c/busses/i2c-rk3x.c:897:2: warning: Value stored to 't_low_ns'=
 is never read [clang-analyzer-deadcode.DeadStores]
           t_low_ns =3D div_u64(((u64)calc.div_low + 1) * 8 * 1000000000, c=
lk_rate);
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/i2c/busses/i2c-rk3x.c:897:2: note: Value stored to 't_low_ns' is=
 never read
           t_low_ns =3D div_u64(((u64)calc.div_low + 1) * 8 * 1000000000, c=
lk_rate);
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/i2c/busses/i2c-rk3x.c:898:2: warning: Value stored to 't_high_ns=
' is never read [clang-analyzer-deadcode.DeadStores]
           t_high_ns =3D div_u64(((u64)calc.div_high + 1) * 8 * 1000000000,
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-rk3x.c:898:2: note: Value stored to 't_high_ns' i=
s never read
           t_high_ns =3D div_u64(((u64)calc.div_high + 1) * 8 * 1000000000,
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   4 warnings generated.
   drivers/i2c/busses/i2c-viperboard.c:313:4: warning: Value stored to 'ret=
' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D vprbrd_i2c_write(vb, pmsg);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-viperboard.c:313:4: note: Value stored to 'ret' i=
s never read
                           ret =3D vprbrd_i2c_write(vb, pmsg);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   7 warnings generated.
   drivers/net/ethernet/qlogic/qlcnic/qlcnic_init.c:449:3: warning: 3rd fun=
ction call argument is an uninitialized value [clang-analyzer-core.CallAndM=
essage]
                   dev_err(&pdev->dev, "ERROR Reading crb_init area: val:%x=
\n", n);
                   ^
   include/linux/dev_printk.h:112:2: note: expanded from macro 'dev_err'
           _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^                             ~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qlcnic/qlcnic_init.c:387:9: note: 'n' declar=
ed without an initial value
           int i, n, init_delay;
                  ^
   drivers/net/ethernet/qlogic/qlcnic/qlcnic_init.c:420:6: note: Assuming t=
he condition is false
           if (err =3D=3D -EIO)
               ^~~~~~~~~~~
   drivers/net/ethernet/qlogic/qlcnic/qlcnic_init.c:420:2: note: Taking fal=
se branch
           if (err =3D=3D -EIO)
           ^
   drivers/net/ethernet/qlogic/qlcnic/qlcnic_init.c:447:6: note: Calling 'q=
lcnic_rom_fast_read'
           if (qlcnic_rom_fast_read(adapter, 0, &n) !=3D 0 || (n !=3D 0xcaf=
ecafe) ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qlcnic/qlcnic_init.c:376:6: note: Assuming t=
he condition is true
           if (qlcnic_rom_lock(adapter) !=3D 0)
               ^
   drivers/net/ethernet/qlogic/qlcnic/qlcnic.h:1554:2: note: expanded from =
macro 'qlcnic_rom_lock'
           qlcnic_pcie_sem_lock((a), 2, QLCNIC_ROM_LOCK_ID)
           ^
   drivers/net/ethernet/qlogic/qlcnic/qlcnic_init.c:376:2: note: Taking tru=
e branch
           if (qlcnic_rom_lock(adapter) !=3D 0)
           ^
   drivers/net/ethernet/qlogic/qlcnic/qlcnic_init.c:447:6: note: Returning =
from 'qlcnic_rom_fast_read'
           if (qlcnic_rom_fast_read(adapter, 0, &n) !=3D 0 || (n !=3D 0xcaf=
ecafe) ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qlcnic/qlcnic_init.c:447:48: note: Left side=
 of '||' is true
           if (qlcnic_rom_fast_read(adapter, 0, &n) !=3D 0 || (n !=3D 0xcaf=
ecafe) ||
                                                         ^
   drivers/net/ethernet/qlogic/qlcnic/qlcnic_init.c:449:3: note: 3rd functi=
on call argument is an uninitialized value
                   dev_err(&pdev->dev, "ERROR Reading crb_init area: val:%x=
\n", n);
                   ^
   include/linux/dev_printk.h:112:2: note: expanded from macro 'dev_err'
           _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^                             ~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qlcnic/qlcnic_init.c:662:27: warning: The le=
ft operand of '-' is a garbage value [clang-analyzer-core.UndefinedBinaryOp=
eratorResult]
           entry_size =3D flt_hdr.len - sizeof(struct qlcnic_flt_header);

vim +/pkt +135 drivers/net/hyperv/rndis_filter.c

fceaf24a943d8d drivers/staging/hv/RndisFilter.c  Hank Janssen             2=
009-07-13  128  =

79cf1bae384cfc drivers/net/hyperv/rndis_filter.c Stephen Hemminger        2=
017-12-12  129  static void dump_rndis_message(struct net_device *netdev,
dc54a08cd3620e drivers/net/hyperv/rndis_filter.c stephen hemminger        2=
017-01-24  130  			       const struct rndis_message *rndis_msg)
fceaf24a943d8d drivers/staging/hv/RndisFilter.c  Hank Janssen             2=
009-07-13  131  {
a388eb1727c15a drivers/staging/hv/rndis_filter.c Haiyang Zhang            2=
010-12-10  132  	switch (rndis_msg->ndis_msg_type) {
514911678fdcb3 drivers/net/hyperv/rndis_filter.c Linus Walleij            2=
012-05-11  133  	case RNDIS_MSG_PACKET:
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  134) 		if (rndis_msg->msg_len - RNDIS_HEADER_SIZE >=3D sizeof(st=
ruct rndis_packet)) {
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14 @135) 			const struct rndis_packet *pkt =3D &rndis_msg->msg.pkt;
514911678fdcb3 drivers/net/hyperv/rndis_filter.c Linus Walleij            2=
012-05-11  136  			netdev_dbg(netdev, "RNDIS_MSG_PACKET (len %u, "
0120ee0d77014e drivers/staging/hv/RndisFilter.c  Greg Kroah-Hartman       2=
009-09-02  137  				   "data offset %u data len %u, # oob %u, "
0120ee0d77014e drivers/staging/hv/RndisFilter.c  Greg Kroah-Hartman       2=
009-09-02  138  				   "oob offset %u, oob len %u, pkt offset %u, "
729a28495debad drivers/staging/hv/rndis_filter.c Haiyang Zhang            2=
011-05-27  139  				   "pkt len %u\n",
a388eb1727c15a drivers/staging/hv/rndis_filter.c Haiyang Zhang            2=
010-12-10  140  				   rndis_msg->msg_len,
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  141) 				   pkt->data_offset,
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  142) 				   pkt->data_len,
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  143) 				   pkt->num_oob_data_elements,
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  144) 				   pkt->oob_data_offset,
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  145) 				   pkt->oob_data_len,
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  146) 				   pkt->per_pkt_info_offset,
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  147) 				   pkt->per_pkt_info_len);
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  148) 		}
fceaf24a943d8d drivers/staging/hv/RndisFilter.c  Hank Janssen             2=
009-07-13  149  		break;
fceaf24a943d8d drivers/staging/hv/RndisFilter.c  Hank Janssen             2=
009-07-13  150  =

514911678fdcb3 drivers/net/hyperv/rndis_filter.c Linus Walleij            2=
012-05-11  151  	case RNDIS_MSG_INIT_C:
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  152) 		if (rndis_msg->msg_len - RNDIS_HEADER_SIZE >=3D
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  153) 				sizeof(struct rndis_initialize_complete)) {
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14 @154) 			const struct rndis_initialize_complete *init_complete =
=3D
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  155) 				&rndis_msg->msg.init_complete;
514911678fdcb3 drivers/net/hyperv/rndis_filter.c Linus Walleij            2=
012-05-11  156  			netdev_dbg(netdev, "RNDIS_MSG_INIT_C "
0120ee0d77014e drivers/staging/hv/RndisFilter.c  Greg Kroah-Hartman       2=
009-09-02  157  				"(len %u, id 0x%x, status 0x%x, major %d, minor %d, "
0120ee0d77014e drivers/staging/hv/RndisFilter.c  Greg Kroah-Hartman       2=
009-09-02  158  				"device flags %d, max xfer size 0x%x, max pkts %u, "
729a28495debad drivers/staging/hv/rndis_filter.c Haiyang Zhang            2=
011-05-27  159  				"pkt aligned %u)\n",
a388eb1727c15a drivers/staging/hv/rndis_filter.c Haiyang Zhang            2=
010-12-10  160  				rndis_msg->msg_len,
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  161) 				init_complete->req_id,
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  162) 				init_complete->status,
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  163) 				init_complete->major_ver,
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  164) 				init_complete->minor_ver,
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  165) 				init_complete->dev_flags,
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  166) 				init_complete->max_xfer_size,
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  167) 				init_complete->max_pkt_per_msg,
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  168) 				init_complete->pkt_alignment_factor);
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  169) 		}
fceaf24a943d8d drivers/staging/hv/RndisFilter.c  Hank Janssen             2=
009-07-13  170  		break;
fceaf24a943d8d drivers/staging/hv/RndisFilter.c  Hank Janssen             2=
009-07-13  171  =

514911678fdcb3 drivers/net/hyperv/rndis_filter.c Linus Walleij            2=
012-05-11  172  	case RNDIS_MSG_QUERY_C:
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  173) 		if (rndis_msg->msg_len - RNDIS_HEADER_SIZE >=3D
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  174) 				sizeof(struct rndis_query_complete)) {
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14 @175) 			const struct rndis_query_complete *query_complete =3D
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  176) 				&rndis_msg->msg.query_complete;
514911678fdcb3 drivers/net/hyperv/rndis_filter.c Linus Walleij            2=
012-05-11  177  			netdev_dbg(netdev, "RNDIS_MSG_QUERY_C "
0120ee0d77014e drivers/staging/hv/RndisFilter.c  Greg Kroah-Hartman       2=
009-09-02  178  				"(len %u, id 0x%x, status 0x%x, buf len %u, "
729a28495debad drivers/staging/hv/rndis_filter.c Haiyang Zhang            2=
011-05-27  179  				"buf offset %u)\n",
a388eb1727c15a drivers/staging/hv/rndis_filter.c Haiyang Zhang            2=
010-12-10  180  				rndis_msg->msg_len,
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  181) 				query_complete->req_id,
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  182) 				query_complete->status,
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  183) 				query_complete->info_buflen,
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  184) 				query_complete->info_buf_offset);
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  185) 		}
fceaf24a943d8d drivers/staging/hv/RndisFilter.c  Hank Janssen             2=
009-07-13  186  		break;
fceaf24a943d8d drivers/staging/hv/RndisFilter.c  Hank Janssen             2=
009-07-13  187  =

514911678fdcb3 drivers/net/hyperv/rndis_filter.c Linus Walleij            2=
012-05-11  188  	case RNDIS_MSG_SET_C:
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  189) 		if (rndis_msg->msg_len - RNDIS_HEADER_SIZE + sizeof(struc=
t rndis_set_complete)) {
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14 @190) 			const struct rndis_set_complete *set_complete =3D
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  191) 				&rndis_msg->msg.set_complete;
729a28495debad drivers/staging/hv/rndis_filter.c Haiyang Zhang            2=
011-05-27  192  			netdev_dbg(netdev,
514911678fdcb3 drivers/net/hyperv/rndis_filter.c Linus Walleij            2=
012-05-11  193  				"RNDIS_MSG_SET_C (len %u, id 0x%x, status 0x%x)\n",
a388eb1727c15a drivers/staging/hv/rndis_filter.c Haiyang Zhang            2=
010-12-10  194  				rndis_msg->msg_len,
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  195) 				set_complete->req_id,
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  196) 				set_complete->status);
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  197) 		}
fceaf24a943d8d drivers/staging/hv/RndisFilter.c  Hank Janssen             2=
009-07-13  198  		break;
fceaf24a943d8d drivers/staging/hv/RndisFilter.c  Hank Janssen             2=
009-07-13  199  =

514911678fdcb3 drivers/net/hyperv/rndis_filter.c Linus Walleij            2=
012-05-11  200  	case RNDIS_MSG_INDICATE:
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  201) 		if (rndis_msg->msg_len - RNDIS_HEADER_SIZE >=3D
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  202) 				sizeof(struct rndis_indicate_status)) {
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14 @203) 			const struct rndis_indicate_status *indicate_status =3D
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  204) 				&rndis_msg->msg.indicate_status;
514911678fdcb3 drivers/net/hyperv/rndis_filter.c Linus Walleij            2=
012-05-11  205  			netdev_dbg(netdev, "RNDIS_MSG_INDICATE "
729a28495debad drivers/staging/hv/rndis_filter.c Haiyang Zhang            2=
011-05-27  206  				"(len %u, status 0x%x, buf len %u, buf offset %u)\n",
a388eb1727c15a drivers/staging/hv/rndis_filter.c Haiyang Zhang            2=
010-12-10  207  				rndis_msg->msg_len,
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  208) 				indicate_status->status,
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  209) 				indicate_status->status_buflen,
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  210) 				indicate_status->status_buf_offset);
505e3f00c3f364 drivers/net/hyperv/rndis_filter.c Andrea Parri (Microsoft  2=
021-01-14  211) 		}
fceaf24a943d8d drivers/staging/hv/RndisFilter.c  Hank Janssen             2=
009-07-13  212  		break;
fceaf24a943d8d drivers/staging/hv/RndisFilter.c  Hank Janssen             2=
009-07-13  213  =

fceaf24a943d8d drivers/staging/hv/RndisFilter.c  Hank Janssen             2=
009-07-13  214  	default:
729a28495debad drivers/staging/hv/rndis_filter.c Haiyang Zhang            2=
011-05-27  215  		netdev_dbg(netdev, "0x%x (len %u)\n",
a388eb1727c15a drivers/staging/hv/rndis_filter.c Haiyang Zhang            2=
010-12-10  216  			rndis_msg->ndis_msg_type,
a388eb1727c15a drivers/staging/hv/rndis_filter.c Haiyang Zhang            2=
010-12-10  217  			rndis_msg->msg_len);
fceaf24a943d8d drivers/staging/hv/RndisFilter.c  Hank Janssen             2=
009-07-13  218  		break;
fceaf24a943d8d drivers/staging/hv/RndisFilter.c  Hank Janssen             2=
009-07-13  219  	}
fceaf24a943d8d drivers/staging/hv/RndisFilter.c  Hank Janssen             2=
009-07-13  220  }
fceaf24a943d8d drivers/staging/hv/RndisFilter.c  Hank Janssen             2=
009-07-13  221  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5471499479853093380==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
ovT5Xv0/+QdJEJICAgA=
--===============5471499479853093380==--

