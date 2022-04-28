Content-Type: multipart/mixed; boundary="===============6855705025249833718=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/asix/ax88796c_main.c:548:21: warning: Value stored to 'ndev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 29 Apr 2022 02:58:47 +0800
Message-ID: <202204290236.qMtDvWen-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6855705025249833718==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "=C5=81ukasz Stelmach" <l.stelmach@samsung.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8f4dd16603ce834d1c5c4da67803ea82dd282511
commit: a97c69ba4f30e46abb9cc7be8b98227cb468fdf9 net: ax88796c: ASIX AX8879=
6C SPI Ethernet Adapter Driver
date:   6 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 6 months ago
config: riscv-randconfig-c006-20220427 (https://download.01.org/0day-ci/arc=
hive/20220429/202204290236.qMtDvWen-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcf=
dc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Da97c69ba4f30e46abb9cc7be8b98227cb468fdf9
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a97c69ba4f30e46abb9cc7be8b98227cb468fdf9
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/usb/gadget/udc/dummy_hcd.c:2837:8: warning: Access to field 'hs_=
hcd' results in a dereference of a null pointer [clang-analyzer-core.NullDe=
reference]
                   if (!dum[i]->hs_hcd ||
                        ^~~~~~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2772:2: note: Initializing to a null =
pointer value
           struct  dummy *dum[MAX_NUM_UDC] =3D {};
           ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2774:6: note: Assuming the condition =
is false
           if (usb_disabled())
               ^~~~~~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2774:2: note: Taking false branch
           if (usb_disabled())
           ^
   drivers/usb/gadget/udc/dummy_hcd.c:2777:6: note: Assuming field 'is_high=
_speed' is true
           if (!mod_data.is_high_speed && mod_data.is_super_speed)
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2777:30: note: Left side of '&&' is f=
alse
           if (!mod_data.is_high_speed && mod_data.is_super_speed)
                                       ^
   drivers/usb/gadget/udc/dummy_hcd.c:2780:6: note: Assuming field 'num' is=
 >=3D 1
           if (mod_data.num < 1 || mod_data.num > MAX_NUM_UDC) {
               ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2780:6: note: Left side of '||' is fa=
lse
   drivers/usb/gadget/udc/dummy_hcd.c:2780:26: note: Assuming field 'num' i=
s <=3D MAX_NUM_UDC
           if (mod_data.num < 1 || mod_data.num > MAX_NUM_UDC) {
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2780:2: note: Taking false branch
           if (mod_data.num < 1 || mod_data.num > MAX_NUM_UDC) {
           ^
   drivers/usb/gadget/udc/dummy_hcd.c:2786:14: note: 'i' is < field 'num'
           for (i =3D 0; i < mod_data.num; i++) {
                       ^
   drivers/usb/gadget/udc/dummy_hcd.c:2786:2: note: Loop condition is true.=
  Entering loop body
           for (i =3D 0; i < mod_data.num; i++) {
           ^
   drivers/usb/gadget/udc/dummy_hcd.c:2788:7: note: Assuming the condition =
is false
                   if (!the_hcd_pdev[i]) {
                       ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2788:3: note: Taking false branch
                   if (!the_hcd_pdev[i]) {
                   ^
   drivers/usb/gadget/udc/dummy_hcd.c:2786:14: note: Assuming 'i' is >=3D f=
ield 'num'
           for (i =3D 0; i < mod_data.num; i++) {
                       ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2786:2: note: Loop condition is false=
. Execution continues on line 2795
           for (i =3D 0; i < mod_data.num; i++) {
           ^
   drivers/usb/gadget/udc/dummy_hcd.c:2795:14: note: Assuming 'i' is >=3D f=
ield 'num'
           for (i =3D 0; i < mod_data.num; i++) {
                       ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2795:2: note: Loop condition is false=
. Execution continues on line 2804
           for (i =3D 0; i < mod_data.num; i++) {
           ^
   drivers/usb/gadget/udc/dummy_hcd.c:2804:2: note: Loop condition is false=
. Execution continues on line 2820
           for (i =3D 0; i < mod_data.num; i++) {
           ^
   drivers/usb/gadget/udc/dummy_hcd.c:2821:6: note: Assuming 'retval' is >=
=3D 0
           if (retval < 0)
               ^~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2821:2: note: Taking false branch
           if (retval < 0)
           ^
   drivers/usb/gadget/udc/dummy_hcd.c:2824:6: note: Assuming 'retval' is >=
=3D 0
           if (retval < 0)
               ^~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2824:2: note: Taking false branch
           if (retval < 0)
           ^
   drivers/usb/gadget/udc/dummy_hcd.c:2827:14: note: Assuming 'i' is < fiel=
d 'num'
           for (i =3D 0; i < mod_data.num; i++) {
                       ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2827:2: note: Loop condition is true.=
  Entering loop body
           for (i =3D 0; i < mod_data.num; i++) {
           ^
   drivers/usb/gadget/udc/dummy_hcd.c:2829:7: note: Assuming 'retval' is >=
=3D 0
                   if (retval < 0) {
                       ^~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2829:3: note: Taking false branch
                   if (retval < 0) {
                   ^
   drivers/usb/gadget/udc/dummy_hcd.c:2827:14: note: Assuming 'i' is >=3D f=
ield 'num'
           for (i =3D 0; i < mod_data.num; i++) {
                       ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2827:2: note: Loop condition is false=
. Execution continues on line 2836
           for (i =3D 0; i < mod_data.num; i++) {
           ^
   drivers/usb/gadget/udc/dummy_hcd.c:2836:7: note: The value 0 is assigned=
 to 'i'
           for (i =3D 0; i < mod_data.num; i++) {
                ^~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2836:14: note: Assuming 'i' is < fiel=
d 'num'
           for (i =3D 0; i < mod_data.num; i++) {
                       ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2836:2: note: Loop condition is true.=
  Entering loop body
           for (i =3D 0; i < mod_data.num; i++) {
           ^
   drivers/usb/gadget/udc/dummy_hcd.c:2837:8: note: Access to field 'hs_hcd=
' results in a dereference of a null pointer
                   if (!dum[i]->hs_hcd ||
                        ^~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> drivers/net/ethernet/asix/ax88796c_main.c:548:21: warning: Value stored =
to 'ndev' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
           struct net_device *ndev =3D ax_local->ndev;
                              ^~~~   ~~~~~~~~~~~~~~
   drivers/net/ethernet/asix/ax88796c_main.c:548:21: note: Value stored to =
'ndev' during its initialization is never read
           struct net_device *ndev =3D ax_local->ndev;
                              ^~~~   ~~~~~~~~~~~~~~
   include/asm-generic/bitops/non-atomic.h:118:16: warning: Array access (f=
rom variable 'addr') results in a null pointer dereference [clang-analyzer-=
core.NullDereference]
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^
   drivers/net/ethernet/asix/ax88796c_main.c:801:6: note: Assuming 'ret' is=
 0
           if (ret) {
               ^~~
   drivers/net/ethernet/asix/ax88796c_main.c:801:2: note: Taking false bran=
ch
           if (ret) {
           ^
   drivers/net/ethernet/asix/ax88796c_main.c:810:6: note: Assuming 'ret' is=
 >=3D 0
           if (ret < 0) {
               ^~~~~~~
   drivers/net/ethernet/asix/ax88796c_main.c:810:2: note: Taking false bran=
ch
           if (ret < 0) {
           ^
   drivers/net/ethernet/asix/ax88796c_main.c:851:6: note: Assuming the cond=
ition is false
           if (ax_local->phydev->advertising &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/asix/ax88796c_main.c:851:36: note: Left side of '&&=
' is false
           if (ax_local->phydev->advertising &&
                                             ^
   drivers/net/ethernet/asix/ax88796c_main.c:859:5: note: Passing null poin=
ter value via 2nd parameter 'addr'
                                   ax_local->phydev->advertising) ? AX_FC_R=
X : 0;
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/asix/ax88796c_main.c:858:8: note: Calling 'linkmode=
_test_bit'
           fc |=3D linkmode_test_bit(ETHTOOL_LINK_MODE_Pause_BIT,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/linkmode.h:76:22: note: Passing null pointer value via 2nd=
 parameter 'addr'
           return test_bit(nr, addr);
                               ^~~~
   include/linux/linkmode.h:76:9: note: Calling 'arch_test_bit'
           return test_bit(nr, addr);
                  ^
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   include/asm-generic/bitops/non-atomic.h:118:16: note: Array access (from=
 variable 'addr') results in a null pointer dereference
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^~~~
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/net/ethernet/cadence/macb_main.c:1507:13: warning: Access to fie=
ld 'addr' results in a dereference of a null pointer (loaded from variable =
'desc') [clang-analyzer-core.NullDereference]
           desc->addr |=3D MACB_BIT(RX_WRAP);
                      ^
   drivers/net/ethernet/cadence/macb_main.c:2438:2: note: Calling 'macb_ini=
t_rx_ring'
           macb_init_rx_ring(&bp->queues[0]);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/cadence/macb_main.c:1497:2: note: 'desc' initialize=
d to a null pointer value
           struct macb_dma_desc *desc =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/cadence/macb_main.c:1501:14: note: Assuming 'i' is =
>=3D field 'rx_ring_size'
           for (i =3D 0; i < bp->rx_ring_size; i++) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/cadence/macb_main.c:1501:2: note: Loop condition is=
 false. Execution continues on line 1507
           for (i =3D 0; i < bp->rx_ring_size; i++) {
           ^
   drivers/net/ethernet/cadence/macb_main.c:1507:13: note: Access to field =
'addr' results in a dereference of a null pointer (loaded from variable 'de=
sc')
           desc->addr |=3D MACB_BIT(RX_WRAP);
           ~~~~       ^
   drivers/net/ethernet/cadence/macb_main.c:2421:14: warning: Access to fie=
ld 'ctrl' results in a dereference of a null pointer (loaded from variable =
'desc') [clang-analyzer-core.NullDereference]
                   desc->ctrl |=3D MACB_BIT(TX_WRAP);
                   ~~~~       ^
   drivers/net/ethernet/cadence/macb_main.c:2411:2: note: 'desc' initialize=
d to a null pointer value
           struct macb_dma_desc *desc =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/cadence/macb_main.c:2415:34: note: Assuming 'q' is =
< field 'num_queues'
           for (q =3D 0, queue =3D bp->queues; q < bp->num_queues; ++q, ++q=
ueue) {
                                           ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/cadence/macb_main.c:2415:2: note: Loop condition is=
 true.  Entering loop body
           for (q =3D 0, queue =3D bp->queues; q < bp->num_queues; ++q, ++q=
ueue) {
           ^
   drivers/net/ethernet/cadence/macb_main.c:2416:15: note: Assuming 'i' is =
>=3D field 'tx_ring_size'
                   for (i =3D 0; i < bp->tx_ring_size; i++) {
                               ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/cadence/macb_main.c:2416:3: note: Loop condition is=
 false. Execution continues on line 2421
                   for (i =3D 0; i < bp->tx_ring_size; i++) {
                   ^
   drivers/net/ethernet/cadence/macb_main.c:2421:14: note: Access to field =
'ctrl' results in a dereference of a null pointer (loaded from variable 'de=
sc')
                   desc->ctrl |=3D MACB_BIT(TX_WRAP);
                   ~~~~       ^
   drivers/net/ethernet/cadence/macb_main.c:2447:13: warning: Access to fie=
ld 'ctrl' results in a dereference of a null pointer (loaded from variable =
'desc') [clang-analyzer-core.NullDereference]
           desc->ctrl |=3D MACB_BIT(TX_WRAP);
           ~~~~       ^
   drivers/net/ethernet/cadence/macb_main.c:2436:2: note: 'desc' initialize=
d to a null pointer value
           struct macb_dma_desc *desc =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/cadence/macb_main.c:2440:14: note: Assuming 'i' is =
>=3D field 'tx_ring_size'
           for (i =3D 0; i < bp->tx_ring_size; i++) {

vim +/ndev +548 drivers/net/ethernet/asix/ax88796c_main.c

a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20  545  =

a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20  546  static int ax88796c_p=
rocess_isr(struct ax88796c_device *ax_local)
a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20  547  {
a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20 @548  	struct net_device *n=
dev =3D ax_local->ndev;
a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20  549  	int todo =3D 0;
a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20  550  	u16 isr;
a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20  551  =

a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20  552  	lockdep_assert_held(=
&ax_local->spi_lock);
a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20  553  =

a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20  554  	isr =3D AX_READ(&ax_=
local->ax_spi, P0_ISR);
a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20  555  	AX_WRITE(&ax_local->=
ax_spi, isr, P0_ISR);
a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20  556  =

a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20  557  	netif_dbg(ax_local, =
intr, ndev, "  ISR 0x%04x\n", isr);
a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20  558  =

a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20  559  	if (isr & ISR_TXERR)=
 {
a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20  560  		netif_dbg(ax_local,=
 intr, ndev, "  TXERR interrupt\n");
a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20  561  		AX_WRITE(&ax_local-=
>ax_spi, TXNR_TXB_REINIT, P0_TSNR);
a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20  562  		ax_local->seq_num =
=3D 0x1f;
a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20  563  	}
a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20  564  =

a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20  565  	if (isr & ISR_TXPAGE=
S) {
a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20  566  		netif_dbg(ax_local,=
 intr, ndev, "  TXPAGES interrupt\n");
a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20  567  		set_bit(EVENT_TX, &=
ax_local->flags);
a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20  568  	}
a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20  569  =

a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20  570  	if (isr & ISR_LINK) {
a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20  571  		netif_dbg(ax_local,=
 intr, ndev, "  Link change interrupt\n");
a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20  572  		phy_mac_interrupt(a=
x_local->ndev->phydev);
a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20  573  	}
a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20  574  =

a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20  575  	if (isr & ISR_RXPKT)=
 {
a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20  576  		netif_dbg(ax_local,=
 intr, ndev, "  RX interrupt\n");
a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20  577  		todo =3D ax88796c_r=
eceive(ax_local->ndev);
a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20  578  	}
a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20  579  =

a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20  580  	return todo;
a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20  581  }
a97c69ba4f30e46 =C5=81ukasz Stelmach 2021-10-20  582  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6855705025249833718==--

