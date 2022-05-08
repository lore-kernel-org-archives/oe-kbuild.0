Content-Type: multipart/mixed; boundary="===============7956329496945209531=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 7422/9759] drivers/net/phy/micrel.c:2729:26: warning: Value stored to 'ptp_priv' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 08 May 2022 13:55:15 +0800
Message-ID: <202205081329.GCICuRze-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7956329496945209531==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Michael Walle <michael@walle.cc>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   38a288f5941ef03752887ad86f2d85442358c99a
commit: 31d00ca4ce0e1abf5342854606bbe7d20e38c3f8 [7422/9759] net: phy: micr=
el: move the PHY timestamping check
:::::: branch date: 2 days ago
:::::: commit date: 8 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20508/202205081329.GCICuRze-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004f=
b787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D31d00ca4ce0e1abf5342854606bbe7d20e38c3f8
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 31d00ca4ce0e1abf5342854606bbe7d20e38c3f8
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:552:13: note: The left expression of the compound=
 assignment is an uninitialized value. The computed value will also be garb=
age
           map[index] &=3D ~(0xFFUL << offset);
           ~~~~~~~~~~ ^
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/gpio/gpio-pcf857x.c:237:23: warning: Value stored to 'np' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device_node              *np =3D client->dev.of_node;
                                            ^~   ~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-pcf857x.c:237:23: note: Value stored to 'np' during it=
s initialization is never read
           struct device_node              *np =3D client->dev.of_node;
                                            ^~   ~~~~~~~~~~~~~~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   70 warnings generated.
   Suppressed 70 warnings (70 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   77 warnings generated.
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
   Suppressed 70 warnings (70 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   fs/nilfs2/btnode.c:36:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&ii->i_bmap_data, 0, sizeof(struct nilfs_bmap));
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
   fs/nilfs2/btnode.c:36:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(&ii->i_bmap_data, 0, sizeof(struct nilfs_bmap));
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
   fs/nilfs2/btnode.c:61:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(bh->b_data, 0, i_blocksize(inode));
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
   fs/nilfs2/btnode.c:61:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(bh->b_data, 0, i_blocksize(inode));
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
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/virtio/virtio.c:17:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%04x\n", dev->id.device);
                  ^~~~~~~
   drivers/virtio/virtio.c:17:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%04x\n", dev->id.device);
                  ^~~~~~~
   drivers/virtio/virtio.c:25:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%04x\n", dev->id.vendor);
                  ^~~~~~~
   drivers/virtio/virtio.c:25:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%04x\n", dev->id.vendor);
                  ^~~~~~~
   drivers/virtio/virtio.c:33:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%08x\n", dev->config->get_status(dev));
                  ^~~~~~~
   drivers/virtio/virtio.c:33:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%08x\n", dev->config->get_status(dev));
                  ^~~~~~~
   drivers/virtio/virtio.c:41:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "virtio:d%08Xv%08X\n",
                  ^~~~~~~
   drivers/virtio/virtio.c:41:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "virtio:d%08Xv%08X\n",
                  ^~~~~~~
   drivers/virtio/virtio.c:56:10: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   len +=3D sprintf(buf+len, "%c",
                          ^~~~~~~
   drivers/virtio/virtio.c:56:10: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
                   len +=3D sprintf(buf+len, "%c",
                          ^~~~~~~
   drivers/virtio/virtio.c:58:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len +=3D sprintf(buf+len, "\n");
                  ^~~~~~~
   drivers/virtio/virtio.c:58:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           len +=3D sprintf(buf+len, "\n");

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
--===============7956329496945209531==--

