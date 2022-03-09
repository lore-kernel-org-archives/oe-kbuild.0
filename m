Content-Type: multipart/mixed; boundary="===============7467716727872966169=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:bpf/bpf-next/master 34/150] drivers/net/phy/micrel.c:2727:28: warning: Value stored to 'np' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 09 Mar 2022 13:28:19 +0800
Message-ID: <202203091339.Wslq7Xn7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7467716727872966169==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Divya Koppera <Divya.Koppera@microchip.com>

tree:   https://github.com/ammarfaizi2/linux-block bpf/bpf-next/master
head:   d23a8720327d33616f584d76c80824bfa4699be6
commit: ece19502834d84ece2e056db28257ca2aa6e4d48 [34/150] net: phy: micrel:=
 1588 support for LAN8814 phy
:::::: branch date: 14 hours ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20309/202203091339.Wslq7Xn7-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/ece19502834d84e=
ce2e056db28257ca2aa6e4d48
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block bpf/bpf-next/master
        git checkout ece19502834d84ece2e056db28257ca2aa6e4d48
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           if (!nvme_validate_passthru_nsid(ctrl, ns, cmd.nsid))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/ioctl.c:179:6: note: 'ns' is null
           if (ns && nsid !=3D ns->head->ns_id) {
               ^~
   drivers/nvme/host/ioctl.c:179:9: note: Left side of '&&' is false
           if (ns && nsid !=3D ns->head->ns_id) {
                  ^
   drivers/nvme/host/ioctl.c:187:2: note: Returning the value 1, which part=
icipates in a condition later
           return true;
           ^~~~~~~~~~~
   drivers/nvme/host/ioctl.c:205:7: note: Returning from 'nvme_validate_pas=
sthru_nsid'
           if (!nvme_validate_passthru_nsid(ctrl, ns, cmd.nsid))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/ioctl.c:205:2: note: Taking false branch
           if (!nvme_validate_passthru_nsid(ctrl, ns, cmd.nsid))
           ^
   drivers/nvme/host/ioctl.c:221:6: note: Assuming field 'timeout_ms' is 0
           if (cmd.timeout_ms)
               ^~~~~~~~~~~~~~
   drivers/nvme/host/ioctl.c:221:2: note: Taking false branch
           if (cmd.timeout_ms)
           ^
   drivers/nvme/host/ioctl.c:224:32: note: 'ns' is null
           status =3D nvme_submit_user_cmd(ns ? ns->queue : ctrl->admin_q, =
&c,
                                         ^~
   drivers/nvme/host/ioctl.c:224:32: note: '?' condition is false
   drivers/nvme/host/ioctl.c:224:11: note: Calling 'nvme_submit_user_cmd'
           status =3D nvme_submit_user_cmd(ns ? ns->queue : ctrl->admin_q, =
&c,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/ioctl.c:63:30: note: Assuming 'ns' is null
           struct block_device *bdev =3D ns ? ns->disk->part0 : NULL;
                                       ^~
   drivers/nvme/host/ioctl.c:63:30: note: '?' condition is false
   drivers/nvme/host/ioctl.c:70:2: note: Taking true branch
           if (IS_ERR(req))
           ^
   drivers/nvme/host/ioctl.c:71:3: note: Returning without writing to '*res=
ult'
                   return PTR_ERR(req);
                   ^
   drivers/nvme/host/ioctl.c:224:11: note: Returning from 'nvme_submit_user=
_cmd'
           status =3D nvme_submit_user_cmd(ns ? ns->queue : ctrl->admin_q, =
&c,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/ioctl.c:229:6: note: Assuming 'status' is >=3D 0
           if (status >=3D 0) {
               ^~~~~~~~~~~
   drivers/nvme/host/ioctl.c:229:2: note: Taking true branch
           if (status >=3D 0) {
           ^
   drivers/nvme/host/ioctl.c:230:7: note: Assigned value is garbage or unde=
fined
                   if (put_user(result, &ucmd->result))
                       ^
   arch/x86/include/asm/uaccess.h:252:44: note: expanded from macro 'put_us=
er'
   #define put_user(x, ptr) ({ might_fault(); do_put_user_call(put_user,x,p=
tr); })
                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   arch/x86/include/asm/uaccess.h:224:11: note: expanded from macro 'do_put=
_user_call'
           __val_pu =3D (x);                                               =
  \
                    ^ ~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/net/phy/icplus.c:107:3: warning: Value stored to 'err' is never =
read [clang-analyzer-deadcode.DeadStores]
                   err =3D mdiobus_read(phydev->mdio.bus, 30, 0);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/icplus.c:107:3: note: Value stored to 'err' is never read
                   err =3D mdiobus_read(phydev->mdio.bus, 30, 0);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/icplus.c:131:4: warning: Value stored to 'err' is never =
read [clang-analyzer-deadcode.DeadStores]
                           err =3D mdiobus_read(phydev->mdio.bus, i, MII_BM=
CR);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/icplus.c:131:4: note: Value stored to 'err' is never read
                           err =3D mdiobus_read(phydev->mdio.bus, i, MII_BM=
CR);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/net/phy/micrel.c:1285:2: warning: Value stored to 'regval' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           regval =3D phy_read(phydev, KSZ8873MLL_GLOBAL_CONTROL_4);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/micrel.c:1285:2: note: Value stored to 'regval' is never=
 read
           regval =3D phy_read(phydev, KSZ8873MLL_GLOBAL_CONTROL_4);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/phy/micrel.c:2727:28: warning: Value stored to 'np' during i=
ts initialization is never read [clang-analyzer-deadcode.DeadStores]
           const struct device_node *np =3D phydev->mdio.dev.of_node;
                                     ^~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/micrel.c:2727:28: note: Value stored to 'np' during its =
initialization is never read
           const struct device_node *np =3D phydev->mdio.dev.of_node;
                                     ^~   ~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/net/wireless/ath/ath10k/debugfs_sta.c:428:3: warning: Value stor=
ed to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D -ENETDOWN;
                   ^     ~~~~~~~~~
   drivers/net/wireless/ath/ath10k/debugfs_sta.c:428:3: note: Value stored =
to 'ret' is never read
                   ret =3D -ENETDOWN;
                   ^     ~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/net/wireless/ath/ath10k/coredump.c:1587:4: warning: Value stored=
 to 'sofar' is never read [clang-analyzer-deadcode.DeadStores]
                           sofar +=3D sizeof(*dump_tlv) + crash_data->ramdu=
mp_buf_len;
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   drivers/net/wireless/ath/ath10k/coredump.c:1587:4: note: Value stored to=
 'sofar' is never read
                           sofar +=3D sizeof(*dump_tlv) + crash_data->ramdu=
mp_buf_len;
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (13 in non-user code, 3 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   24 warnings generated.
   drivers/net/wireless/ath/ath10k/sdio.c:144:2: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D ath10k_sdio_func0_cmd52_rd_byte(func->card,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath10k/sdio.c:144:2: note: Value stored to 'ret=
' is never read
           ret =3D ath10k_sdio_func0_cmd52_rd_byte(func->card,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath10k/sdio.c:152:2: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D ath10k_sdio_func0_cmd52_wr_byte(func->card,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath10k/sdio.c:152:2: note: Value stored to 'ret=
' is never read
           ret =3D ath10k_sdio_func0_cmd52_wr_byte(func->card,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath10k/sdio.c:157:2: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D ath10k_sdio_func0_cmd52_rd_byte(
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath10k/sdio.c:157:2: note: Value stored to 'ret=
' is never read
           ret =3D ath10k_sdio_func0_cmd52_rd_byte(
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath10k/sdio.c:175:2: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D ath10k_sdio_func0_cmd52_rd_byte(func->card,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath10k/sdio.c:175:2: note: Value stored to 'ret=
' is never read
           ret =3D ath10k_sdio_func0_cmd52_rd_byte(func->card,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath10k/sdio.c:191:2: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D ath10k_sdio_func0_cmd52_rd_byte(func->card,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath10k/sdio.c:191:2: note: Value stored to 'ret=
' is never read
           ret =3D ath10k_sdio_func0_cmd52_rd_byte(func->card,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath10k/sdio.c:198:2: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D ath10k_sdio_func0_cmd52_wr_byte(func->card,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath10k/sdio.c:198:2: note: Value stored to 'ret=
' is never read
           ret =3D ath10k_sdio_func0_cmd52_wr_byte(func->card,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath10k/sdio.c:558:33: warning: The left operand=
 of '>' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResu=
lt]
                   if (le16_to_cpu(htc_hdr->len) > ATH10K_HTC_MBOX_MAX_PAYL=
OAD_LENGTH) {
                                                 ^
   drivers/net/wireless/ath/ath10k/sdio.c:1011:6: note: 'ret' is 0
           if (ret) {
               ^~~
   drivers/net/wireless/ath/ath10k/sdio.c:1011:2: note: Taking false branch
           if (ret) {
           ^
   drivers/net/wireless/ath/ath10k/sdio.c:1016:6: note: Assuming 'host_int_=
status' is not equal to 0
           if (!host_int_status && !lookahead) {
               ^~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath10k/sdio.c:1016:23: note: Left side of '&&' =
is false
           if (!host_int_status && !lookahead) {

vim +/np +2727 drivers/net/phy/micrel.c

ece19502834d84 Divya Koppera 2022-03-04  2724  =

ece19502834d84 Divya Koppera 2022-03-04  2725  static int lan8814_probe(str=
uct phy_device *phydev)
ece19502834d84 Divya Koppera 2022-03-04  2726  {
ece19502834d84 Divya Koppera 2022-03-04 @2727  	const struct device_node *n=
p =3D phydev->mdio.dev.of_node;
ece19502834d84 Divya Koppera 2022-03-04  2728  	struct kszphy_priv *priv;
ece19502834d84 Divya Koppera 2022-03-04  2729  	u16 addr;
ece19502834d84 Divya Koppera 2022-03-04  2730  	int err;
ece19502834d84 Divya Koppera 2022-03-04  2731  =

ece19502834d84 Divya Koppera 2022-03-04  2732  	priv =3D devm_kzalloc(&phyd=
ev->mdio.dev, sizeof(*priv), GFP_KERNEL);
ece19502834d84 Divya Koppera 2022-03-04  2733  	if (!priv)
ece19502834d84 Divya Koppera 2022-03-04  2734  		return -ENOMEM;
ece19502834d84 Divya Koppera 2022-03-04  2735  =

ece19502834d84 Divya Koppera 2022-03-04  2736  	priv->led_mode =3D -1;
ece19502834d84 Divya Koppera 2022-03-04  2737  =

ece19502834d84 Divya Koppera 2022-03-04  2738  	priv->latencies =3D lan8814=
_latencies;
ece19502834d84 Divya Koppera 2022-03-04  2739  =

ece19502834d84 Divya Koppera 2022-03-04  2740  	phydev->priv =3D priv;
ece19502834d84 Divya Koppera 2022-03-04  2741  =

ece19502834d84 Divya Koppera 2022-03-04  2742  	if (!IS_ENABLED(CONFIG_PTP_=
1588_CLOCK) ||
ece19502834d84 Divya Koppera 2022-03-04  2743  	    !IS_ENABLED(CONFIG_NETW=
ORK_PHY_TIMESTAMPING) ||
ece19502834d84 Divya Koppera 2022-03-04  2744  	    of_property_read_bool(n=
p, "lan8814,ignore-ts"))
ece19502834d84 Divya Koppera 2022-03-04  2745  		return 0;
ece19502834d84 Divya Koppera 2022-03-04  2746  =

ece19502834d84 Divya Koppera 2022-03-04  2747  	/* Strap-in value for PHY a=
ddress, below register read gives starting
ece19502834d84 Divya Koppera 2022-03-04  2748  	 * phy address value
ece19502834d84 Divya Koppera 2022-03-04  2749  	 */
ece19502834d84 Divya Koppera 2022-03-04  2750  	addr =3D lanphy_read_page_r=
eg(phydev, 4, 0) & 0x1F;
ece19502834d84 Divya Koppera 2022-03-04  2751  	devm_phy_package_join(&phyd=
ev->mdio.dev, phydev,
ece19502834d84 Divya Koppera 2022-03-04  2752  			      addr, sizeof(struct=
 lan8814_shared_priv));
ece19502834d84 Divya Koppera 2022-03-04  2753  =

ece19502834d84 Divya Koppera 2022-03-04  2754  	if (phy_package_init_once(p=
hydev)) {
ece19502834d84 Divya Koppera 2022-03-04  2755  		err =3D lan8814_ptp_probe_=
once(phydev);
ece19502834d84 Divya Koppera 2022-03-04  2756  		if (err)
ece19502834d84 Divya Koppera 2022-03-04  2757  			return err;
ece19502834d84 Divya Koppera 2022-03-04  2758  	}
ece19502834d84 Divya Koppera 2022-03-04  2759  =

ece19502834d84 Divya Koppera 2022-03-04  2760  	lan8814_parse_latency(phyde=
v);
ece19502834d84 Divya Koppera 2022-03-04  2761  	lan8814_ptp_init(phydev);
ece19502834d84 Divya Koppera 2022-03-04  2762  =

ece19502834d84 Divya Koppera 2022-03-04  2763  	return 0;
ece19502834d84 Divya Koppera 2022-03-04  2764  }
ece19502834d84 Divya Koppera 2022-03-04  2765  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7467716727872966169==--

