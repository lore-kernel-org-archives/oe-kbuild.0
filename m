Content-Type: multipart/mixed; boundary="===============3291984418291170859=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/microchip/lan743x_main.c:2038:21: warning: Value stored to 'netdev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 11 Dec 2021 12:08:11 +0800
Message-ID: <202112111224.6UzWG2P6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3291984418291170859==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Sven Van Asbroeck <thesven73@gmail.com>
CC: Bryan Whitehead <Bryan.Whitehead@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b8a98b6bf66ae35361e987333233d07241642909
commit: a8db76d40e4d568a9e9cc9fb8d81352b5ff530ee lan743x: boost performance=
 on cpu archs w/o dma cache snooping
date:   10 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20211126 (https://download.01.org/0day-ci/archi=
ve/20211211/202112111224.6UzWG2P6-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5162b5=
58d8c0b542e752b037e72a69d5fd51eb1e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Da8db76d40e4d568a9e9cc9fb8d81352b5ff530ee
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a8db76d40e4d568a9e9cc9fb8d81352b5ff530ee
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/gpu/drm/radeon/evergreen.c:2742:7: warning: Branch condition eva=
luates to a garbage value [clang-analyzer-core.uninitialized.Branch]
                   if (save->crtc_enabled[i]) {
                       ^
   drivers/gpu/drm/radeon/evergreen.c:4050:6: note: Assuming 'hard' is true
           if (hard) {
               ^~~~
   drivers/gpu/drm/radeon/evergreen.c:4050:2: note: Taking true branch
           if (hard) {
           ^
   drivers/gpu/drm/radeon/evergreen.c:4051:3: note: Calling 'evergreen_gpu_=
pci_config_reset'
                   evergreen_gpu_pci_config_reset(rdev);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/evergreen.c:4015:2: note: '?' condition is true
           udelay(50);
           ^
   arch/arm/include/asm/delay.h:83:3: note: expanded from macro 'udelay'
           (__builtin_constant_p(n) ?                                      \
            ^
   drivers/gpu/drm/radeon/evergreen.c:4015:2: note: '?' condition is false
           udelay(50);
           ^
   arch/arm/include/asm/delay.h:84:5: note: expanded from macro 'udelay'
             ((n) > (MAX_UDELAY_MS * 1000) ? __bad_udelay() :              \
              ^
   drivers/gpu/drm/radeon/evergreen.c:4025:2: note: '?' condition is true
           udelay(50);
           ^
   arch/arm/include/asm/delay.h:83:3: note: expanded from macro 'udelay'
           (__builtin_constant_p(n) ?                                      \
            ^
   drivers/gpu/drm/radeon/evergreen.c:4025:2: note: '?' condition is false
           udelay(50);
           ^
   arch/arm/include/asm/delay.h:84:5: note: expanded from macro 'udelay'
             ((n) > (MAX_UDELAY_MS * 1000) ? __bad_udelay() :              \
              ^
   drivers/gpu/drm/radeon/evergreen.c:4032:2: note: Calling 'evergreen_mc_s=
top'
           evergreen_mc_stop(rdev, &save);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/evergreen.c:2665:21: note: Assuming field 'family=
' is equal to CHIP_HAINAN
           if (!ASIC_IS_NODCE(rdev)) {
                              ^
   drivers/gpu/drm/radeon/radeon.h:2649:31: note: expanded from macro 'ASIC=
_IS_NODCE'
   #define ASIC_IS_NODCE(rdev) ((rdev->family =3D=3D CHIP_HAINAN))
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/evergreen.c:2665:2: note: Taking false branch
           if (!ASIC_IS_NODCE(rdev)) {
           ^
   drivers/gpu/drm/radeon/evergreen.c:2673:14: note: Assuming 'i' is >=3D f=
ield 'num_crtc'
           for (i =3D 0; i < rdev->num_crtc; i++) {
                       ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/evergreen.c:2673:2: note: Loop condition is false=
. Execution continues on line 2727
           for (i =3D 0; i < rdev->num_crtc; i++) {
           ^
   drivers/gpu/drm/radeon/evergreen.c:2730:6: note: Assuming the condition =
is false
           if ((blackout & BLACKOUT_MODE_MASK) !=3D 1) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/evergreen.c:2730:2: note: Taking false branch
           if ((blackout & BLACKOUT_MODE_MASK) !=3D 1) {
           ^
   drivers/gpu/drm/radeon/evergreen.c:2738:2: note: '?' condition is true
           udelay(100);
           ^
   arch/arm/include/asm/delay.h:83:3: note: expanded from macro 'udelay'
           (__builtin_constant_p(n) ?                                      \
            ^
   drivers/gpu/drm/radeon/evergreen.c:2738:2: note: '?' condition is false
           udelay(100);
           ^
   arch/arm/include/asm/delay.h:84:5: note: expanded from macro 'udelay'
             ((n) > (MAX_UDELAY_MS * 1000) ? __bad_udelay() :              \
              ^
   drivers/gpu/drm/radeon/evergreen.c:2741:7: note: The value 0 is assigned=
 to 'i'
           for (i =3D 0; i < rdev->num_crtc; i++) {
                ^~~~~
   drivers/gpu/drm/radeon/evergreen.c:2741:14: note: Assuming 'i' is < fiel=
d 'num_crtc'
           for (i =3D 0; i < rdev->num_crtc; i++) {
                       ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/evergreen.c:2741:2: note: Loop condition is true.=
  Entering loop body
           for (i =3D 0; i < rdev->num_crtc; i++) {
           ^
   drivers/gpu/drm/radeon/evergreen.c:2742:7: note: Branch condition evalua=
tes to a garbage value
                   if (save->crtc_enabled[i]) {
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/evergreen.c:3978:3: warning: Value stored to 'tmp=
' is never read [clang-analyzer-deadcode.DeadStores]
                   tmp =3D RREG32(GRBM_SOFT_RESET);
                   ^
   drivers/gpu/drm/radeon/evergreen.c:3978:3: note: Value stored to 'tmp' i=
s never read
   drivers/gpu/drm/radeon/evergreen.c:3992:3: warning: Value stored to 'tmp=
' is never read [clang-analyzer-deadcode.DeadStores]
                   tmp =3D RREG32(SRBM_SOFT_RESET);
                   ^
   drivers/gpu/drm/radeon/evergreen.c:3992:3: note: Value stored to 'tmp' i=
s never read
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> drivers/net/ethernet/microchip/lan743x_main.c:2038:21: warning: Value st=
ored to 'netdev' during its initialization is never read [clang-analyzer-de=
adcode.DeadStores]
           struct net_device *netdev =3D rx->adapter->netdev;
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/microchip/lan743x_main.c:2038:21: note: Value store=
d to 'netdev' during its initialization is never read
           struct net_device *netdev =3D rx->adapter->netdev;
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/net/ethernet/microchip/lan743x_ethtool.c:733:26: warning: Value =
stored to 'adapter' during its initialization is never read [clang-analyzer=
-deadcode.DeadStores]
           struct lan743x_adapter *adapter =3D netdev_priv(netdev);
                                   ^~~~~~~   ~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/microchip/lan743x_ethtool.c:733:26: note: Value sto=
red to 'adapter' during its initialization is never read
           struct lan743x_adapter *adapter =3D netdev_priv(netdev);
                                   ^~~~~~~   ~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/net/ethernet/mscc/ocelot.c:49:17: warning: The left operand of '=
<<' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           mach |=3D mac[1] << 0;
                          ^
   drivers/net/ethernet/mscc/ocelot.c:1479:6: note: Assuming 'port' is not =
equal to field 'npi'
           if (port =3D=3D ocelot->npi)
               ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mscc/ocelot.c:1479:2: note: Taking false branch
           if (port =3D=3D ocelot->npi)
           ^
   drivers/net/ethernet/mscc/ocelot.c:1483:6: note: Assuming 'mc' is non-nu=
ll
           if (!mc)
               ^~~
   drivers/net/ethernet/mscc/ocelot.c:1483:2: note: Taking false branch
           if (!mc)
           ^
   drivers/net/ethernet/mscc/ocelot.c:1486:2: note: Calling 'ocelot_encode_=
ports_to_mdb'
           ocelot_encode_ports_to_mdb(addr, mc);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mscc/ocelot.c:1403:2: note: Calling 'ether_addr_cop=
y'
           ether_addr_copy(addr, mc->addr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mscc/ocelot.c:1403:2: note: Returning from 'ether_a=
ddr_copy'
           ether_addr_copy(addr, mc->addr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mscc/ocelot.c:1405:6: note: Assuming field 'entry_t=
ype' is not equal to ENTRYTYPE_MACv4
           if (mc->entry_type =3D=3D ENTRYTYPE_MACv4) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mscc/ocelot.c:1405:2: note: Taking false branch
           if (mc->entry_type =3D=3D ENTRYTYPE_MACv4) {
           ^
   drivers/net/ethernet/mscc/ocelot.c:1409:13: note: Assuming field 'entry_=
type' is not equal to ENTRYTYPE_MACv6
           } else if (mc->entry_type =3D=3D ENTRYTYPE_MACv6) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mscc/ocelot.c:1409:9: note: Taking false branch
           } else if (mc->entry_type =3D=3D ENTRYTYPE_MACv6) {
                  ^
   drivers/net/ethernet/mscc/ocelot.c:1486:2: note: Returning from 'ocelot_=
encode_ports_to_mdb'
           ocelot_encode_ports_to_mdb(addr, mc);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mscc/ocelot.c:1487:2: note: Calling 'ocelot_mact_fo=
rget'
           ocelot_mact_forget(ocelot, addr, vid);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mscc/ocelot.c:93:2: note: Calling 'ocelot_mact_sele=
ct'
           ocelot_mact_select(ocelot, mac, vid);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mscc/ocelot.c:49:17: note: The left operand of '<<'=
 is a garbage value
           mach |=3D mac[1] << 0;
                   ~~~~~~ ^
   drivers/net/ethernet/mscc/ocelot.c:51:17: warning: The left operand of '=
<<' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           macl |=3D mac[3] << 16;
                          ^
   drivers/net/ethernet/mscc/ocelot.c:1479:6: note: Assuming 'port' is not =
equal to field 'npi'
           if (port =3D=3D ocelot->npi)
               ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mscc/ocelot.c:1479:2: note: Taking false branch
           if (port =3D=3D ocelot->npi)
           ^
   drivers/net/ethernet/mscc/ocelot.c:1483:6: note: Assuming 'mc' is non-nu=
ll
           if (!mc)
               ^~~
   drivers/net/ethernet/mscc/ocelot.c:1483:2: note: Taking false branch
           if (!mc)
           ^
   drivers/net/ethernet/mscc/ocelot.c:1486:2: note: Calling 'ocelot_encode_=
ports_to_mdb'
           ocelot_encode_ports_to_mdb(addr, mc);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mscc/ocelot.c:1403:2: note: Calling 'ether_addr_cop=
y'
           ether_addr_copy(addr, mc->addr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mscc/ocelot.c:1403:2: note: Returning from 'ether_a=
ddr_copy'
           ether_addr_copy(addr, mc->addr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mscc/ocelot.c:1405:6: note: Assuming field 'entry_t=
ype' is equal to ENTRYTYPE_MACv4
           if (mc->entry_type =3D=3D ENTRYTYPE_MACv4) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mscc/ocelot.c:1405:2: note: Taking true branch
           if (mc->entry_type =3D=3D ENTRYTYPE_MACv4) {
           ^
   drivers/net/ethernet/mscc/ocelot.c:1486:2: note: Returning from 'ocelot_=
encode_ports_to_mdb'
           ocelot_encode_ports_to_mdb(addr, mc);

vim +/netdev +2038 drivers/net/ethernet/microchip/lan743x_main.c

a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2033  =

a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2034  static int lan743x_rx_pr=
ocess_buffer(struct lan743x_rx *rx)
23f0703c125be4 Bryan Whitehead   2018-03-05  2035  {
462512824f902a Alexey Denisov    2021-01-28  2036  	int current_head_index =
=3D le32_to_cpu(*rx->head_cpu_ptr);
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2037  	struct lan743x_rx_descr=
iptor *descriptor, *desc_ext;
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15 @2038  	struct net_device *netd=
ev =3D rx->adapter->netdev;
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2039  	int result =3D RX_PROCE=
SS_RESULT_NOTHING_TO_DO;
23f0703c125be4 Bryan Whitehead   2018-03-05  2040  	struct lan743x_rx_buffe=
r_info *buffer_info;
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2041  	int frame_length, buffe=
r_length;
23f0703c125be4 Bryan Whitehead   2018-03-05  2042  	int extension_index =3D=
 -1;
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2043  	bool is_last, is_first;
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2044  	struct sk_buff *skb;
23f0703c125be4 Bryan Whitehead   2018-03-05  2045  =

23f0703c125be4 Bryan Whitehead   2018-03-05  2046  	if (current_head_index =
< 0 || current_head_index >=3D rx->ring_size)
23f0703c125be4 Bryan Whitehead   2018-03-05  2047  		goto done;
23f0703c125be4 Bryan Whitehead   2018-03-05  2048  =

23f0703c125be4 Bryan Whitehead   2018-03-05  2049  	if (rx->last_head < 0 |=
| rx->last_head >=3D rx->ring_size)
23f0703c125be4 Bryan Whitehead   2018-03-05  2050  		goto done;
23f0703c125be4 Bryan Whitehead   2018-03-05  2051  =

a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2052  	if (rx->last_head =3D=
=3D current_head_index)
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2053  		goto done;
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2054  =

23f0703c125be4 Bryan Whitehead   2018-03-05  2055  	descriptor =3D &rx->rin=
g_cpu_ptr[rx->last_head];
462512824f902a Alexey Denisov    2021-01-28  2056  	if (le32_to_cpu(descrip=
tor->data0) & RX_DESC_DATA0_OWN_)
23f0703c125be4 Bryan Whitehead   2018-03-05  2057  		goto done;
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2058  	buffer_info =3D &rx->bu=
ffer_info[rx->last_head];
23f0703c125be4 Bryan Whitehead   2018-03-05  2059  =

a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2060  	is_last =3D le32_to_cpu=
(descriptor->data0) & RX_DESC_DATA0_LS_;
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2061  	is_first =3D le32_to_cp=
u(descriptor->data0) & RX_DESC_DATA0_FS_;
23f0703c125be4 Bryan Whitehead   2018-03-05  2062  =

a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2063  	if (is_last && le32_to_=
cpu(descriptor->data0) & RX_DESC_DATA0_EXT_) {
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2064  		/* extension is expect=
ed to follow */
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2065  		int index =3D lan743x_=
rx_next_index(rx, rx->last_head);
23f0703c125be4 Bryan Whitehead   2018-03-05  2066  =

a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2067  		if (index =3D=3D curre=
nt_head_index)
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2068  			/* extension not yet =
available */
23f0703c125be4 Bryan Whitehead   2018-03-05  2069  			goto done;
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2070  		desc_ext =3D &rx->ring=
_cpu_ptr[index];
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2071  		if (le32_to_cpu(desc_e=
xt->data0) & RX_DESC_DATA0_OWN_)
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2072  			/* extension not yet =
available */
23f0703c125be4 Bryan Whitehead   2018-03-05  2073  			goto done;
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2074  		if (!(le32_to_cpu(desc=
_ext->data0) & RX_DESC_DATA0_EXT_))
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2075  			goto move_forward;
23f0703c125be4 Bryan Whitehead   2018-03-05  2076  		extension_index =3D in=
dex;
23f0703c125be4 Bryan Whitehead   2018-03-05  2077  	}
23f0703c125be4 Bryan Whitehead   2018-03-05  2078  =

a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2079  	/* Only the last buffer=
 in a multi-buffer frame contains the total frame
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2080  	 * length. The chip occ=
asionally sends more buffers than strictly
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2081  	 * required to reach th=
e total frame length.
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2082  	 * Handle this by addin=
g all buffers to the skb in their entirety.
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2083  	 * Once the real frame =
length is known, trim the skb.
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2084  	 */
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2085  	frame_length =3D
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2086  		RX_DESC_DATA0_FRAME_LE=
NGTH_GET_(le32_to_cpu(descriptor->data0));
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2087  	buffer_length =3D buffe=
r_info->buffer_length;
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2088  =

a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2089  	netdev_dbg(netdev, "%s%=
schunk: %d/%d",
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2090  		   is_first ? "first "=
 : "      ",
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2091  		   is_last  ? "last  "=
 : "      ",
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2092  		   frame_length, buffe=
r_length);
23f0703c125be4 Bryan Whitehead   2018-03-05  2093  =

a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2094  	/* save existing skb, a=
llocate new skb and map to dma */
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2095  	skb =3D buffer_info->sk=
b;
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2096  	if (lan743x_rx_init_rin=
g_element(rx, rx->last_head)) {
dd9d9f5907bb47 Bryan Whitehead   2019-03-11  2097  		/* failed to allocate =
next skb.
dd9d9f5907bb47 Bryan Whitehead   2019-03-11  2098  		 * Memory is very low.
dd9d9f5907bb47 Bryan Whitehead   2019-03-11  2099  		 * Drop this packet an=
d reuse buffer.
dd9d9f5907bb47 Bryan Whitehead   2019-03-11  2100  		 */
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2101  		lan743x_rx_reuse_ring_=
element(rx, rx->last_head);
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2102  		/* drop packet that wa=
s being assembled */
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2103  		dev_kfree_skb_irq(rx->=
skb_head);
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2104  		rx->skb_head =3D NULL;
dd9d9f5907bb47 Bryan Whitehead   2019-03-11  2105  		goto process_extension;
dd9d9f5907bb47 Bryan Whitehead   2019-03-11  2106  	}
dd9d9f5907bb47 Bryan Whitehead   2019-03-11  2107  =

a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2108  	/* add buffers to skb v=
ia skb->frag_list */
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2109  	if (is_first) {
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2110  		skb_reserve(skb, RX_HE=
AD_PADDING);
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2111  		skb_put(skb, buffer_le=
ngth - RX_HEAD_PADDING);
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2112  		if (rx->skb_head)
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2113  			dev_kfree_skb_irq(rx-=
>skb_head);
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2114  		rx->skb_head =3D skb;
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2115  	} else if (rx->skb_head=
) {
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2116  		skb_put(skb, buffer_le=
ngth);
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2117  		if (skb_shinfo(rx->skb=
_head)->frag_list)
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2118  			rx->skb_tail->next =
=3D skb;
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2119  		else
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2120  			skb_shinfo(rx->skb_he=
ad)->frag_list =3D skb;
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2121  		rx->skb_tail =3D skb;
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2122  		rx->skb_head->len +=3D=
 skb->len;
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2123  		rx->skb_head->data_len=
 +=3D skb->len;
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2124  		rx->skb_head->truesize=
 +=3D skb->truesize;
23f0703c125be4 Bryan Whitehead   2018-03-05  2125  	} else {
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2126  		/* packet to assemble =
has already been dropped because one or
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2127  		 * more of its buffers=
 could not be allocated
23f0703c125be4 Bryan Whitehead   2018-03-05  2128  		 */
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2129  		netdev_dbg(netdev, "dr=
op buffer intended for dropped packet");
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2130  		dev_kfree_skb_irq(skb);
23f0703c125be4 Bryan Whitehead   2018-03-05  2131  	}
23f0703c125be4 Bryan Whitehead   2018-03-05  2132  =

dd9d9f5907bb47 Bryan Whitehead   2019-03-11  2133  process_extension:
23f0703c125be4 Bryan Whitehead   2018-03-05  2134  	if (extension_index >=
=3D 0) {
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2135  		u32 ts_sec;
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2136  		u32 ts_nsec;
23f0703c125be4 Bryan Whitehead   2018-03-05  2137  =

a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2138  		ts_sec =3D le32_to_cpu=
(desc_ext->data1);
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2139  		ts_nsec =3D (le32_to_c=
pu(desc_ext->data2) &
23f0703c125be4 Bryan Whitehead   2018-03-05  2140  			  RX_DESC_DATA2_TS_NS=
_MASK_);
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2141  		if (rx->skb_head)
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2142  			skb_hwtstamps(rx->skb=
_head)->hwtstamp =3D
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2143  				ktime_set(ts_sec, ts=
_nsec);
23f0703c125be4 Bryan Whitehead   2018-03-05  2144  		lan743x_rx_reuse_ring_=
element(rx, extension_index);
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2145  		rx->last_head =3D exte=
nsion_index;
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2146  		netdev_dbg(netdev, "pr=
ocess extension");
23f0703c125be4 Bryan Whitehead   2018-03-05  2147  	}
23f0703c125be4 Bryan Whitehead   2018-03-05  2148  =

a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2149  	if (is_last && rx->skb_=
head)
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2150  		rx->skb_head =3D lan74=
3x_rx_trim_skb(rx->skb_head, frame_length);
23f0703c125be4 Bryan Whitehead   2018-03-05  2151  =

a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2152  	if (is_last && rx->skb_=
head) {
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2153  		rx->skb_head->protocol=
 =3D eth_type_trans(rx->skb_head,
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2154  							rx->adapter->netd=
ev);
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2155  		netdev_dbg(netdev, "se=
nding %d byte frame to OS",
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2156  			   rx->skb_head->len);
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2157  		napi_gro_receive(&rx->=
napi, rx->skb_head);
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2158  		rx->skb_head =3D NULL;
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2159  	}
23f0703c125be4 Bryan Whitehead   2018-03-05  2160  =

23f0703c125be4 Bryan Whitehead   2018-03-05  2161  move_forward:
23f0703c125be4 Bryan Whitehead   2018-03-05  2162  	/* push tail and head f=
orward */
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2163  	rx->last_tail =3D rx->l=
ast_head;
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2164  	rx->last_head =3D lan74=
3x_rx_next_index(rx, rx->last_head);
a8db76d40e4d56 Sven Van Asbroeck 2021-02-15  2165  	result =3D RX_PROCESS_R=
ESULT_BUFFER_RECEIVED;
23f0703c125be4 Bryan Whitehead   2018-03-05  2166  done:
23f0703c125be4 Bryan Whitehead   2018-03-05  2167  	return result;
23f0703c125be4 Bryan Whitehead   2018-03-05  2168  }
23f0703c125be4 Bryan Whitehead   2018-03-05  2169  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3291984418291170859==--

