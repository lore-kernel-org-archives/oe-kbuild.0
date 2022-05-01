Content-Type: multipart/mixed; boundary="===============7697391538622192896=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:netdev/net-next/master 2/4] drivers/net/phy/micrel.c:2729:26: warning: Value stored to 'ptp_priv' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 01 May 2022 19:45:40 +0800
Message-ID: <202205011920.EFDWrVUv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7697391538622192896==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Michael Walle <michael@walle.cc>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://github.com/ammarfaizi2/linux-block netdev/net-next/master
head:   48cec73a891cca087fbc7791c4753784180991a9
commit: 31d00ca4ce0e1abf5342854606bbe7d20e38c3f8 [2/4] net: phy: micrel: mo=
ve the PHY timestamping check
:::::: branch date: 21 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20501/202205011920.EFDWrVUv-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 400775=
649969b9baf3bc2a510266e7912bb16ae9)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/31d00ca4ce0e1ab=
f5342854606bbe7d20e38c3f8
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block netdev/net-next/master
        git checkout 31d00ca4ce0e1abf5342854606bbe7d20e38c3f8
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   73 warnings generated.
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
   Suppressed 71 warnings (71 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   71 warnings generated.
   Suppressed 71 warnings (71 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   69 warnings generated.
   Suppressed 69 warnings (69 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   76 warnings generated.
   drivers/net/phy/micrel.c:1280:2: warning: Value stored to 'regval' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           regval =3D phy_read(phydev, KSZ8873MLL_GLOBAL_CONTROL_4);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/micrel.c:1280:2: note: Value stored to 'regval' is never=
 read
           regval =3D phy_read(phydev, KSZ8873MLL_GLOBAL_CONTROL_4);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/micrel.c:2222:3: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(shhwtstamps, 0, sizeof(*shhwtstamps));
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/net/phy/micrel.c:2222:3: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
                   memset(shhwtstamps, 0, sizeof(*shhwtstamps));
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/net/phy/micrel.c:2530:3: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&shhwtstamps, 0, sizeof(shhwtstamps));
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/net/phy/micrel.c:2530:3: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
                   memset(&shhwtstamps, 0, sizeof(shhwtstamps));
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/net/phy/micrel.c:2576:3: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(shhwtstamps, 0, sizeof(*shhwtstamps));
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/net/phy/micrel.c:2576:3: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
                   memset(shhwtstamps, 0, sizeof(*shhwtstamps));
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
>> drivers/net/phy/micrel.c:2729:26: warning: Value stored to 'ptp_priv' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct kszphy_ptp_priv *ptp_priv =3D &priv->ptp_priv;
                                   ^~~~~~~~   ~~~~~~~~~~~~~~~
   drivers/net/phy/micrel.c:2729:26: note: Value stored to 'ptp_priv' durin=
g its initialization is never read
           struct kszphy_ptp_priv *ptp_priv =3D &priv->ptp_priv;
                                   ^~~~~~~~   ~~~~~~~~~~~~~~~
>> drivers/net/phy/micrel.c:2772:30: warning: Value stored to 'shared' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct lan8814_shared_priv *shared =3D phydev->shared->priv;
                                       ^~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/micrel.c:2772:30: note: Value stored to 'shared' during =
its initialization is never read
           struct lan8814_shared_priv *shared =3D phydev->shared->priv;
                                       ^~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/micrel.c:2782:2: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(shared->ptp_clock_info.name, 30, "%s", phydev->drv->nam=
e);
           ^~~~~~~~
   drivers/net/phy/micrel.c:2782:2: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
           snprintf(shared->ptp_clock_info.name, 30, "%s", phydev->drv->nam=
e);
           ^~~~~~~~
   Suppressed 69 warnings (69 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   78 warnings generated.
   drivers/net/wireless/ath/ath10k/htt.c:295:2: warning: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&conn_req, 0, sizeof(conn_req));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath10k/htt.c:295:2: note: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11
           memset(&conn_req, 0, sizeof(conn_req));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath10k/htt.c:296:2: warning: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&conn_resp, 0, sizeof(conn_resp));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath10k/htt.c:296:2: note: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11
           memset(&conn_resp, 0, sizeof(conn_resp));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 76 warnings (76 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   79 warnings generated.
   net/tipc/eth_media.c:47:2: warning: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(strbuf, "%pM", addr->value);
           ^~~~~~~
   net/tipc/eth_media.c:47:2: note: Call to function 'sprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sprintf_s' in case of C11
           sprintf(strbuf, "%pM", addr->value);
           ^~~~~~~
   net/tipc/eth_media.c:54:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(msg, 0, TIPC_MEDIA_INFO_SIZE);
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   net/tipc/eth_media.c:54:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(msg, 0, TIPC_MEDIA_INFO_SIZE);
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   net/tipc/eth_media.c:56:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(msg + TIPC_MEDIA_ADDR_OFFSET, addr->value, ETH_ALEN);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \

vim +/ptp_priv +2729 drivers/net/phy/micrel.c

b3ec7248f1f4b9 Divya Koppera 2021-12-21  2725  =

ece19502834d84 Divya Koppera 2022-03-04  2726  static void lan8814_ptp_init=
(struct phy_device *phydev)
ece19502834d84 Divya Koppera 2022-03-04  2727  {
ece19502834d84 Divya Koppera 2022-03-04  2728  	struct kszphy_priv *priv =
=3D phydev->priv;
ece19502834d84 Divya Koppera 2022-03-04 @2729  	struct kszphy_ptp_priv *ptp=
_priv =3D &priv->ptp_priv;
ece19502834d84 Divya Koppera 2022-03-04  2730  	u32 temp;
ece19502834d84 Divya Koppera 2022-03-04  2731  =

31d00ca4ce0e1a Michael Walle 2022-04-27  2732  	if (!IS_ENABLED(CONFIG_PTP_=
1588_CLOCK) ||
31d00ca4ce0e1a Michael Walle 2022-04-27  2733  	    !IS_ENABLED(CONFIG_NETW=
ORK_PHY_TIMESTAMPING))
31d00ca4ce0e1a Michael Walle 2022-04-27  2734  		return;
31d00ca4ce0e1a Michael Walle 2022-04-27  2735  =

ece19502834d84 Divya Koppera 2022-03-04  2736  	lanphy_write_page_reg(phyde=
v, 5, TSU_HARD_RESET, TSU_HARD_RESET_);
ece19502834d84 Divya Koppera 2022-03-04  2737  =

ece19502834d84 Divya Koppera 2022-03-04  2738  	temp =3D lanphy_read_page_r=
eg(phydev, 5, PTP_TX_MOD);
ece19502834d84 Divya Koppera 2022-03-04  2739  	temp |=3D PTP_TX_MOD_BAD_UD=
PV4_CHKSUM_FORCE_FCS_DIS_;
ece19502834d84 Divya Koppera 2022-03-04  2740  	lanphy_write_page_reg(phyde=
v, 5, PTP_TX_MOD, temp);
ece19502834d84 Divya Koppera 2022-03-04  2741  =

ece19502834d84 Divya Koppera 2022-03-04  2742  	temp =3D lanphy_read_page_r=
eg(phydev, 5, PTP_RX_MOD);
ece19502834d84 Divya Koppera 2022-03-04  2743  	temp |=3D PTP_RX_MOD_BAD_UD=
PV4_CHKSUM_FORCE_FCS_DIS_;
ece19502834d84 Divya Koppera 2022-03-04  2744  	lanphy_write_page_reg(phyde=
v, 5, PTP_RX_MOD, temp);
ece19502834d84 Divya Koppera 2022-03-04  2745  =

ece19502834d84 Divya Koppera 2022-03-04  2746  	lanphy_write_page_reg(phyde=
v, 5, PTP_RX_PARSE_CONFIG, 0);
ece19502834d84 Divya Koppera 2022-03-04  2747  	lanphy_write_page_reg(phyde=
v, 5, PTP_TX_PARSE_CONFIG, 0);
ece19502834d84 Divya Koppera 2022-03-04  2748  =

ece19502834d84 Divya Koppera 2022-03-04  2749  	/* Removing default registe=
rs configs related to L2 and IP */
ece19502834d84 Divya Koppera 2022-03-04  2750  	lanphy_write_page_reg(phyde=
v, 5, PTP_TX_PARSE_L2_ADDR_EN, 0);
ece19502834d84 Divya Koppera 2022-03-04  2751  	lanphy_write_page_reg(phyde=
v, 5, PTP_RX_PARSE_L2_ADDR_EN, 0);
ece19502834d84 Divya Koppera 2022-03-04  2752  	lanphy_write_page_reg(phyde=
v, 5, PTP_TX_PARSE_IP_ADDR_EN, 0);
ece19502834d84 Divya Koppera 2022-03-04  2753  	lanphy_write_page_reg(phyde=
v, 5, PTP_RX_PARSE_IP_ADDR_EN, 0);
ece19502834d84 Divya Koppera 2022-03-04  2754  =

ece19502834d84 Divya Koppera 2022-03-04  2755  	skb_queue_head_init(&ptp_pr=
iv->tx_queue);
ece19502834d84 Divya Koppera 2022-03-04  2756  	skb_queue_head_init(&ptp_pr=
iv->rx_queue);
ece19502834d84 Divya Koppera 2022-03-04  2757  	INIT_LIST_HEAD(&ptp_priv->r=
x_ts_list);
ece19502834d84 Divya Koppera 2022-03-04  2758  	spin_lock_init(&ptp_priv->r=
x_ts_lock);
ece19502834d84 Divya Koppera 2022-03-04  2759  =

ece19502834d84 Divya Koppera 2022-03-04  2760  	ptp_priv->phydev =3D phydev;
ece19502834d84 Divya Koppera 2022-03-04  2761  =

ece19502834d84 Divya Koppera 2022-03-04  2762  	ptp_priv->mii_ts.rxtstamp =
=3D lan8814_rxtstamp;
ece19502834d84 Divya Koppera 2022-03-04  2763  	ptp_priv->mii_ts.txtstamp =
=3D lan8814_txtstamp;
ece19502834d84 Divya Koppera 2022-03-04  2764  	ptp_priv->mii_ts.hwtstamp =
=3D lan8814_hwtstamp;
ece19502834d84 Divya Koppera 2022-03-04  2765  	ptp_priv->mii_ts.ts_info  =
=3D lan8814_ts_info;
ece19502834d84 Divya Koppera 2022-03-04  2766  =

ece19502834d84 Divya Koppera 2022-03-04  2767  	phydev->mii_ts =3D &ptp_pri=
v->mii_ts;
ece19502834d84 Divya Koppera 2022-03-04  2768  }
ece19502834d84 Divya Koppera 2022-03-04  2769  =

ece19502834d84 Divya Koppera 2022-03-04  2770  static int lan8814_ptp_probe=
_once(struct phy_device *phydev)
ece19502834d84 Divya Koppera 2022-03-04  2771  {
ece19502834d84 Divya Koppera 2022-03-04 @2772  	struct lan8814_shared_priv =
*shared =3D phydev->shared->priv;
ece19502834d84 Divya Koppera 2022-03-04  2773  =

31d00ca4ce0e1a Michael Walle 2022-04-27  2774  	if (!IS_ENABLED(CONFIG_PTP_=
1588_CLOCK) ||
31d00ca4ce0e1a Michael Walle 2022-04-27  2775  	    !IS_ENABLED(CONFIG_NETW=
ORK_PHY_TIMESTAMPING))
31d00ca4ce0e1a Michael Walle 2022-04-27  2776  		return 0;
31d00ca4ce0e1a Michael Walle 2022-04-27  2777  =

ece19502834d84 Divya Koppera 2022-03-04  2778  	/* Initialise shared lock f=
or clock*/
ece19502834d84 Divya Koppera 2022-03-04  2779  	mutex_init(&shared->shared_=
lock);
ece19502834d84 Divya Koppera 2022-03-04  2780  =

ece19502834d84 Divya Koppera 2022-03-04  2781  	shared->ptp_clock_info.owne=
r =3D THIS_MODULE;
ece19502834d84 Divya Koppera 2022-03-04  2782  	snprintf(shared->ptp_clock_=
info.name, 30, "%s", phydev->drv->name);
ece19502834d84 Divya Koppera 2022-03-04  2783  	shared->ptp_clock_info.max_=
adj =3D 31249999;
ece19502834d84 Divya Koppera 2022-03-04  2784  	shared->ptp_clock_info.n_al=
arm =3D 0;
ece19502834d84 Divya Koppera 2022-03-04  2785  	shared->ptp_clock_info.n_ex=
t_ts =3D 0;
ece19502834d84 Divya Koppera 2022-03-04  2786  	shared->ptp_clock_info.n_pi=
ns =3D 0;
ece19502834d84 Divya Koppera 2022-03-04  2787  	shared->ptp_clock_info.pps =
=3D 0;
ece19502834d84 Divya Koppera 2022-03-04  2788  	shared->ptp_clock_info.pin_=
config =3D NULL;
ece19502834d84 Divya Koppera 2022-03-04  2789  	shared->ptp_clock_info.adjf=
ine =3D lan8814_ptpci_adjfine;
ece19502834d84 Divya Koppera 2022-03-04  2790  	shared->ptp_clock_info.adjt=
ime =3D lan8814_ptpci_adjtime;
ece19502834d84 Divya Koppera 2022-03-04  2791  	shared->ptp_clock_info.gett=
ime64 =3D lan8814_ptpci_gettime64;
ece19502834d84 Divya Koppera 2022-03-04  2792  	shared->ptp_clock_info.sett=
ime64 =3D lan8814_ptpci_settime64;
ece19502834d84 Divya Koppera 2022-03-04  2793  	shared->ptp_clock_info.getc=
rosststamp =3D NULL;
ece19502834d84 Divya Koppera 2022-03-04  2794  =

ece19502834d84 Divya Koppera 2022-03-04  2795  	shared->ptp_clock =3D ptp_c=
lock_register(&shared->ptp_clock_info,
ece19502834d84 Divya Koppera 2022-03-04  2796  					       &phydev->mdio.de=
v);
ece19502834d84 Divya Koppera 2022-03-04  2797  	if (IS_ERR_OR_NULL(shared->=
ptp_clock)) {
ece19502834d84 Divya Koppera 2022-03-04  2798  		phydev_err(phydev, "ptp_cl=
ock_register failed %lu\n",
ece19502834d84 Divya Koppera 2022-03-04  2799  			   PTR_ERR(shared->ptp_cl=
ock));
ece19502834d84 Divya Koppera 2022-03-04  2800  		return -EINVAL;
ece19502834d84 Divya Koppera 2022-03-04  2801  	}
ece19502834d84 Divya Koppera 2022-03-04  2802  =

ece19502834d84 Divya Koppera 2022-03-04  2803  	phydev_dbg(phydev, "success=
fully registered ptp clock\n");
ece19502834d84 Divya Koppera 2022-03-04  2804  =

ece19502834d84 Divya Koppera 2022-03-04  2805  	shared->phydev =3D phydev;
ece19502834d84 Divya Koppera 2022-03-04  2806  =

ece19502834d84 Divya Koppera 2022-03-04  2807  	/* The EP.4 is shared betwe=
en all the PHYs in the package and also it
ece19502834d84 Divya Koppera 2022-03-04  2808  	 * can be accessed by any o=
f the PHYs
ece19502834d84 Divya Koppera 2022-03-04  2809  	 */
ece19502834d84 Divya Koppera 2022-03-04  2810  	lanphy_write_page_reg(phyde=
v, 4, LTC_HARD_RESET, LTC_HARD_RESET_);
ece19502834d84 Divya Koppera 2022-03-04  2811  	lanphy_write_page_reg(phyde=
v, 4, PTP_OPERATING_MODE,
ece19502834d84 Divya Koppera 2022-03-04  2812  			      PTP_OPERATING_MODE_=
STANDALONE_);
ece19502834d84 Divya Koppera 2022-03-04  2813  =

ece19502834d84 Divya Koppera 2022-03-04  2814  	return 0;
ece19502834d84 Divya Koppera 2022-03-04  2815  }
ece19502834d84 Divya Koppera 2022-03-04  2816  =


:::::: The code at line 2729 was first introduced by commit
:::::: ece19502834d84ece2e056db28257ca2aa6e4d48 net: phy: micrel: 1588 supp=
ort for LAN8814 phy

:::::: TO: Divya Koppera <Divya.Koppera@microchip.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7697391538622192896==--

