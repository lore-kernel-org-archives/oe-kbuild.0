Content-Type: multipart/mixed; boundary="===============2827302591929533899=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/microchip/sparx5/sparx5_main.c:626:2: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 18 Jan 2022 19:14:21 +0800
Message-ID: <202201181844.xwy2fROg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2827302591929533899==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Steen Hegelund <steen.hegelund@microchip.com>
CC: Bjarni Jonasson <bjarni.jonasson@microchip.com>
CC: Lars Povlsen <lars.povlsen@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0c947b893d69231a9add855939da7c66237ab44f
commit: d6fce5141929697a27f029c633433d487f6f62cb net: sparx5: add switching=
 support
date:   7 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-c002-20220113 (https://download.01.org/0day-ci/archi=
ve/20220118/202201181844.xwy2fROg-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d10219=
78b8e7e35dcc30201ca1731d64b5a602a8)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dd6fce5141929697a27f029c633433d487f6f62cb
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d6fce5141929697a27f029c633433d487f6f62cb
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/net/dsa/ocelot/felix.c:1324:6: note: Assuming 'ptp_type' is not =
equal to PTP_CLASS_NONE
           if (ptp_type =3D=3D PTP_CLASS_NONE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/ocelot/felix.c:1324:2: note: Taking false branch
           if (ptp_type =3D=3D PTP_CLASS_NONE)
           ^
   drivers/net/dsa/ocelot/felix.c:1327:2: note: Loop condition is false. Ex=
ecution continues on line 1356
           while (ocelot_read(ocelot, QS_XTR_DATA_PRESENT) & BIT(grp)) {
           ^
   drivers/net/dsa/ocelot/felix.c:1356:10: note: The left operand of '<' is=
 a garbage value
           if (err < 0)
               ~~~ ^
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/iio/adc/ti-adc0832.c:27:8: warning: Excessive padding in 'struct=
 adc0832' (35 padding bytes, where 3 is optimal). =

   Optimal fields order: =

   tx_buf, =

   mux_bits, =

   rx_buf, =

   data, =

   spi, =

   reg, =

   lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct adc0832 {
   ~~~~~~~^~~~~~~~~
   drivers/iio/adc/ti-adc0832.c:27:8: note: Excessive padding in 'struct ad=
c0832' (35 padding bytes, where 3 is optimal). Optimal fields order: tx_buf=
, mux_bits, rx_buf, data, spi, reg, lock, consider reordering the fields or=
 adding explicit padding members
   struct adc0832 {
   ~~~~~~~^~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/iio/adc/ti-adc084s021.c:23:8: warning: Excessive padding in 'str=
uct adc084s021' (38 padding bytes, where 6 is optimal). =

   Optimal fields order: =

   tx_buf, =

   scan, =

   spi, =

   reg, =

   message, =

   lock, =

   spi_trans, =

   rx_buf, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct adc084s021 {
   ~~~~~~~^~~~~~~~~~~~
   drivers/iio/adc/ti-adc084s021.c:23:8: note: Excessive padding in 'struct=
 adc084s021' (38 padding bytes, where 6 is optimal). Optimal fields order: =
tx_buf, scan, spi, reg, message, lock, spi_trans, rx_buf, consider reorderi=
ng the fields or adding explicit padding members
   struct adc084s021 {
   ~~~~~~~^~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
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
   8 warnings generated.
   drivers/net/ethernet/microchip/lan743x_main.c:2055:21: warning: Value st=
ored to 'netdev' during its initialization is never read [clang-analyzer-de=
adcode.DeadStores]
           struct net_device *netdev =3D rx->adapter->netdev;
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/microchip/lan743x_main.c:2055:21: note: Value store=
d to 'netdev' during its initialization is never read
           struct net_device *netdev =3D rx->adapter->netdev;
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
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
   10 warnings generated.
>> drivers/net/ethernet/microchip/sparx5/sparx5_main.c:626:2: warning: Valu=
e stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
           err =3D sparx5_register_notifier_blocks(sparx5);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/microchip/sparx5/sparx5_main.c:626:2: note: Value s=
tored to 'err' is never read
           err =3D sparx5_register_notifier_blocks(sparx5);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/microchip/sparx5/sparx5_main.c:749:6: warning: 2nd =
function call argument is an uninitialized value [clang-analyzer-core.CallA=
ndMessage]
           if (of_get_mac_address(np, mac_addr)) {
               ^                      ~~~~~~~~
   drivers/net/ethernet/microchip/sparx5/sparx5_main.c:658:2: note: 'mac_ad=
dr' declared without an initial value
           u8 *mac_addr;
           ^~~~~~~~~~~~
   drivers/net/ethernet/microchip/sparx5/sparx5_main.c:660:6: note: Assumin=
g 'np' is non-null
           if (!np && !pdev->dev.platform_data)
               ^~~
   drivers/net/ethernet/microchip/sparx5/sparx5_main.c:660:10: note: Left s=
ide of '&&' is false
           if (!np && !pdev->dev.platform_data)
                   ^
   drivers/net/ethernet/microchip/sparx5/sparx5_main.c:664:6: note: Assumin=
g 'sparx5' is non-null
           if (!sparx5)
               ^~~~~~~
   drivers/net/ethernet/microchip/sparx5/sparx5_main.c:664:2: note: Taking =
false branch
           if (!sparx5)
           ^
   drivers/net/ethernet/microchip/sparx5/sparx5_main.c:673:6: note: Calling=
 'IS_ERR'
           if (IS_ERR(reset))
               ^~~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/microchip/sparx5/sparx5_main.c:673:6: note: Returni=
ng from 'IS_ERR'
           if (IS_ERR(reset))
               ^~~~~~~~~~~~~
   drivers/net/ethernet/microchip/sparx5/sparx5_main.c:673:2: note: Taking =
false branch
           if (IS_ERR(reset))
           ^
   drivers/net/ethernet/microchip/sparx5/sparx5_main.c:682:6: note: Assumin=
g 'ports' is non-null
           if (!ports) {
               ^~~~~~
   drivers/net/ethernet/microchip/sparx5/sparx5_main.c:682:2: note: Taking =
false branch
           if (!ports) {
           ^
   drivers/net/ethernet/microchip/sparx5/sparx5_main.c:688:12: note: Callin=
g 'kcalloc'
           configs =3D kcalloc(sparx5->port_count,
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:625:9: note: Calling 'kmalloc_array'
           return kmalloc_array(n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:592:2: note: Taking false branch
           if (unlikely(check_mul_overflow(n, size, &bytes)))
           ^
   include/linux/slab.h:594:30: note: Left side of '&&' is false
           if (__builtin_constant_p(n) && __builtin_constant_p(size))
                                       ^
   include/linux/slab.h:596:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(bytes, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:625:9: note: Returning from 'kmalloc_array'
           return kmalloc_array(n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:625:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc_array(n, size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/microchip/sparx5/sparx5_main.c:688:12: note: Return=
ing from 'kcalloc'
           configs =3D kcalloc(sparx5->port_count,
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/microchip/sparx5/sparx5_main.c:690:6: note: Assumin=
g 'configs' is non-null
           if (!configs) {
               ^~~~~~~~
   drivers/net/ethernet/microchip/sparx5/sparx5_main.c:690:2: note: Taking =
false branch
           if (!configs) {
           ^
   drivers/net/ethernet/microchip/sparx5/sparx5_main.c:695:42: note: Assumi=
ng 'portnp' is equal to null
           for_each_available_child_of_node(ports, portnp) {
                                                   ^
   include/linux/of.h:1299:58: note: expanded from macro 'for_each_availabl=
e_child_of_node'
           for (child =3D of_get_next_available_child(parent, NULL); child =
!=3D NULL; \
                                                                   ^~~~~~~~=
~~~~~
   drivers/net/ethernet/microchip/sparx5/sparx5_main.c:695:2: note: Loop co=
ndition is false. Execution continues on line 745
           for_each_available_child_of_node(ports, portnp) {
           ^
   include/linux/of.h:1299:2: note: expanded from macro 'for_each_available=
_child_of_node'
           for (child =3D of_get_next_available_child(parent, NULL); child =
!=3D NULL; \
           ^
   drivers/net/ethernet/microchip/sparx5/sparx5_main.c:746:6: note: Assumin=
g 'err' is 0
           if (err)
               ^~~
   drivers/net/ethernet/microchip/sparx5/sparx5_main.c:746:2: note: Taking =
false branch
           if (err)
           ^
   drivers/net/ethernet/microchip/sparx5/sparx5_main.c:749:6: note: 2nd fun=
ction call argument is an uninitialized value
           if (of_get_mac_address(np, mac_addr)) {

vim +/err +626 drivers/net/ethernet/microchip/sparx5/sparx5_main.c

3cfa11bac9bbed Steen Hegelund 2021-06-24  559  =

3cfa11bac9bbed Steen Hegelund 2021-06-24  560  static int sparx5_start(stru=
ct sparx5 *sparx5)
3cfa11bac9bbed Steen Hegelund 2021-06-24  561  {
b37a1bae742f92 Steen Hegelund 2021-06-24  562  	u8 broadcast[ETH_ALEN] =3D =
{0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
b37a1bae742f92 Steen Hegelund 2021-06-24  563  	char queue_name[32];
3cfa11bac9bbed Steen Hegelund 2021-06-24  564  	u32 idx;
f3cad2611a77f0 Steen Hegelund 2021-06-24  565  	int err;
3cfa11bac9bbed Steen Hegelund 2021-06-24  566  =

3cfa11bac9bbed Steen Hegelund 2021-06-24  567  	/* Setup own UPSIDs */
3cfa11bac9bbed Steen Hegelund 2021-06-24  568  	for (idx =3D 0; idx < 3; id=
x++) {
3cfa11bac9bbed Steen Hegelund 2021-06-24  569  		spx5_wr(idx, sparx5, ANA_A=
C_OWN_UPSID(idx));
3cfa11bac9bbed Steen Hegelund 2021-06-24  570  		spx5_wr(idx, sparx5, ANA_C=
L_OWN_UPSID(idx));
3cfa11bac9bbed Steen Hegelund 2021-06-24  571  		spx5_wr(idx, sparx5, ANA_L=
2_OWN_UPSID(idx));
3cfa11bac9bbed Steen Hegelund 2021-06-24  572  		spx5_wr(idx, sparx5, REW_O=
WN_UPSID(idx));
3cfa11bac9bbed Steen Hegelund 2021-06-24  573  	}
3cfa11bac9bbed Steen Hegelund 2021-06-24  574  =

3cfa11bac9bbed Steen Hegelund 2021-06-24  575  	/* Enable CPU ports */
3cfa11bac9bbed Steen Hegelund 2021-06-24  576  	for (idx =3D SPX5_PORTS; id=
x < SPX5_PORTS_ALL; idx++)
3cfa11bac9bbed Steen Hegelund 2021-06-24  577  		spx5_rmw(QFWD_SWITCH_PORT_=
MODE_PORT_ENA_SET(1),
3cfa11bac9bbed Steen Hegelund 2021-06-24  578  			 QFWD_SWITCH_PORT_MODE_PO=
RT_ENA,
3cfa11bac9bbed Steen Hegelund 2021-06-24  579  			 sparx5,
3cfa11bac9bbed Steen Hegelund 2021-06-24  580  			 QFWD_SWITCH_PORT_MODE(id=
x));
3cfa11bac9bbed Steen Hegelund 2021-06-24  581  =

78eab33bb68b56 Steen Hegelund 2021-06-24  582  	/* Init masks */
78eab33bb68b56 Steen Hegelund 2021-06-24  583  	sparx5_update_fwd(sparx5);
78eab33bb68b56 Steen Hegelund 2021-06-24  584  =

3cfa11bac9bbed Steen Hegelund 2021-06-24  585  	/* CPU copy CPU pgids */
3cfa11bac9bbed Steen Hegelund 2021-06-24  586  	spx5_wr(ANA_AC_PGID_MISC_CF=
G_PGID_CPU_COPY_ENA_SET(1),
3cfa11bac9bbed Steen Hegelund 2021-06-24  587  		sparx5, ANA_AC_PGID_MISC_C=
FG(PGID_CPU));
3cfa11bac9bbed Steen Hegelund 2021-06-24  588  	spx5_wr(ANA_AC_PGID_MISC_CF=
G_PGID_CPU_COPY_ENA_SET(1),
3cfa11bac9bbed Steen Hegelund 2021-06-24  589  		sparx5, ANA_AC_PGID_MISC_C=
FG(PGID_BCAST));
3cfa11bac9bbed Steen Hegelund 2021-06-24  590  =

3cfa11bac9bbed Steen Hegelund 2021-06-24  591  	/* Recalc injected frame FC=
S */
3cfa11bac9bbed Steen Hegelund 2021-06-24  592  	for (idx =3D SPX5_PORT_CPU_=
0; idx <=3D SPX5_PORT_CPU_1; idx++)
3cfa11bac9bbed Steen Hegelund 2021-06-24  593  		spx5_rmw(ANA_CL_FILTER_CTR=
L_FORCE_FCS_UPDATE_ENA_SET(1),
3cfa11bac9bbed Steen Hegelund 2021-06-24  594  			 ANA_CL_FILTER_CTRL_FORCE=
_FCS_UPDATE_ENA,
3cfa11bac9bbed Steen Hegelund 2021-06-24  595  			 sparx5, ANA_CL_FILTER_CT=
RL(idx));
3cfa11bac9bbed Steen Hegelund 2021-06-24  596  =

b37a1bae742f92 Steen Hegelund 2021-06-24  597  	/* Init MAC table, ageing */
b37a1bae742f92 Steen Hegelund 2021-06-24  598  	sparx5_mact_init(sparx5);
b37a1bae742f92 Steen Hegelund 2021-06-24  599  =

78eab33bb68b56 Steen Hegelund 2021-06-24  600  	/* Setup VLANs */
78eab33bb68b56 Steen Hegelund 2021-06-24  601  	sparx5_vlan_init(sparx5);
b37a1bae742f92 Steen Hegelund 2021-06-24  602  =

b37a1bae742f92 Steen Hegelund 2021-06-24  603  	/* Add host mode BC address=
 (points only to CPU) */
b37a1bae742f92 Steen Hegelund 2021-06-24  604  	sparx5_mact_learn(sparx5, P=
GID_CPU, broadcast, NULL_VID);
b37a1bae742f92 Steen Hegelund 2021-06-24  605  =

3cfa11bac9bbed Steen Hegelund 2021-06-24  606  	/* Enable queue limitation =
watermarks */
3cfa11bac9bbed Steen Hegelund 2021-06-24  607  	sparx5_qlim_set(sparx5);
3cfa11bac9bbed Steen Hegelund 2021-06-24  608  =

f3cad2611a77f0 Steen Hegelund 2021-06-24  609  	/* Resource calendar suppor=
t to be added in later patches */
f3cad2611a77f0 Steen Hegelund 2021-06-24  610  =

b37a1bae742f92 Steen Hegelund 2021-06-24  611  	/* Init mact_sw struct */
b37a1bae742f92 Steen Hegelund 2021-06-24  612  	mutex_init(&sparx5->mact_lo=
ck);
b37a1bae742f92 Steen Hegelund 2021-06-24  613  	INIT_LIST_HEAD(&sparx5->mac=
t_entries);
b37a1bae742f92 Steen Hegelund 2021-06-24  614  	snprintf(queue_name, sizeof=
(queue_name), "%s-mact",
b37a1bae742f92 Steen Hegelund 2021-06-24  615  		 dev_name(sparx5->dev));
b37a1bae742f92 Steen Hegelund 2021-06-24  616  	sparx5->mact_queue =3D crea=
te_singlethread_workqueue(queue_name);
b37a1bae742f92 Steen Hegelund 2021-06-24  617  	INIT_DELAYED_WORK(&sparx5->=
mact_work, sparx5_mact_pull_work);
b37a1bae742f92 Steen Hegelund 2021-06-24  618  	queue_delayed_work(sparx5->=
mact_queue, &sparx5->mact_work,
b37a1bae742f92 Steen Hegelund 2021-06-24  619  			   SPX5_MACT_PULL_DELAY);
b37a1bae742f92 Steen Hegelund 2021-06-24  620  =

f3cad2611a77f0 Steen Hegelund 2021-06-24  621  	err =3D sparx5_register_net=
devs(sparx5);
f3cad2611a77f0 Steen Hegelund 2021-06-24  622  	if (err)
f3cad2611a77f0 Steen Hegelund 2021-06-24  623  		return err;
3cfa11bac9bbed Steen Hegelund 2021-06-24  624  =

3cfa11bac9bbed Steen Hegelund 2021-06-24  625  	sparx5_board_init(sparx5);
d6fce514192969 Steen Hegelund 2021-06-24 @626  	err =3D sparx5_register_not=
ifier_blocks(sparx5);
3cfa11bac9bbed Steen Hegelund 2021-06-24  627  =

f3cad2611a77f0 Steen Hegelund 2021-06-24  628  	/* Start register based INJ=
/XTR */
f3cad2611a77f0 Steen Hegelund 2021-06-24  629  	err =3D -ENXIO;
f3cad2611a77f0 Steen Hegelund 2021-06-24  630  	if (err && sparx5->xtr_irq =
>=3D 0) {
f3cad2611a77f0 Steen Hegelund 2021-06-24  631  		err =3D devm_request_irq(s=
parx5->dev, sparx5->xtr_irq,
f3cad2611a77f0 Steen Hegelund 2021-06-24  632  				       sparx5_xtr_handle=
r, IRQF_SHARED,
f3cad2611a77f0 Steen Hegelund 2021-06-24  633  				       "sparx5-xtr", spa=
rx5);
f3cad2611a77f0 Steen Hegelund 2021-06-24  634  		if (!err)
f3cad2611a77f0 Steen Hegelund 2021-06-24  635  			err =3D sparx5_manual_inj=
ection_mode(sparx5);
f3cad2611a77f0 Steen Hegelund 2021-06-24  636  		if (err)
f3cad2611a77f0 Steen Hegelund 2021-06-24  637  			sparx5->xtr_irq =3D -ENXI=
O;
f3cad2611a77f0 Steen Hegelund 2021-06-24  638  	} else {
f3cad2611a77f0 Steen Hegelund 2021-06-24  639  		sparx5->xtr_irq =3D -ENXIO;
f3cad2611a77f0 Steen Hegelund 2021-06-24  640  	}
f3cad2611a77f0 Steen Hegelund 2021-06-24  641  	return err;
f3cad2611a77f0 Steen Hegelund 2021-06-24  642  }
3cfa11bac9bbed Steen Hegelund 2021-06-24  643  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2827302591929533899==--

