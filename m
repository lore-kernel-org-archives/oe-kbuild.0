Content-Type: multipart/mixed; boundary="===============3317017042957177930=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 7422/9759] drivers/net/phy/micrel.c:2729:26: warning: Value stored to 'ptp_priv' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 07 May 2022 13:53:37 +0800
Message-ID: <202205071319.HiwwB9ql-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3317017042957177930==
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
:::::: branch date: 21 hours ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20507/202205071319.HiwwB9ql-lkp(a)intel.com/config)
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
   74 warnings generated.
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
   Suppressed 72 warnings (72 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   72 warnings generated.
   Suppressed 72 warnings (72 in non-user code).
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
   95 warnings generated.
   drivers/scsi/scsi_sysfs.c:139:8: warning: Call to function 'sscanf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           res =3D sscanf(str, "%10s %10s %16s %c", s1, s2, s3, &junk);
                 ^~~~~~
   drivers/scsi/scsi_sysfs.c:139:8: note: Call to function 'sscanf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sscanf_s' in case of C11
           res =3D sscanf(str, "%10s %10s %16s %c", s1, s2, s3, &junk);
                 ^~~~~~
   drivers/scsi/scsi_sysfs.c:231:9: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, 20, "%s\n", name);
                  ^~~~~~~~
   drivers/scsi/scsi_sysfs.c:231:9: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, 20, "%s\n", name);
                  ^~~~~~~~
   drivers/scsi/scsi_sysfs.c:244:9: warning: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffer=
Handling]
                   len =3D sprintf(buf, "%s", "Initiator");
                         ^~~~~~~
   drivers/scsi/scsi_sysfs.c:244:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11
                   len =3D sprintf(buf, "%s", "Initiator");
                         ^~~~~~~
   drivers/scsi/scsi_sysfs.c:247:10: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
                   len +=3D sprintf(buf + len, "%s%s", len ? ", " : "", "Ta=
rget");
                          ^~~~~~~
   drivers/scsi/scsi_sysfs.c:247:10: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
                   len +=3D sprintf(buf + len, "%s%s", len ? ", " : "", "Ta=
rget");
                          ^~~~~~~
   drivers/scsi/scsi_sysfs.c:249:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len +=3D sprintf(buf + len, "\n");
                  ^~~~~~~
   drivers/scsi/scsi_sysfs.c:249:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           len +=3D sprintf(buf + len, "\n");
                  ^~~~~~~
   drivers/scsi/scsi_sysfs.c:277:10: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return snprintf(buf, 20, "unknown\n");
                          ^~~~~~~~
   drivers/scsi/scsi_sysfs.c:277:10: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
                   return snprintf(buf, 20, "unknown\n");
                          ^~~~~~~~
   drivers/scsi/scsi_sysfs.c:327:10: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return snprintf(buf, strlen("off") + 2, "off\n");
                          ^~~~~~~~
   drivers/scsi/scsi_sysfs.c:327:10: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
                   return snprintf(buf, strlen("off") + 2, "off\n");
                          ^~~~~~~~
   drivers/scsi/scsi_sysfs.c:328:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", shost->eh_deadline / HZ);
                  ^~~~~~~
   drivers/scsi/scsi_sysfs.c:328:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", shost->eh_deadline / HZ);
                  ^~~~~~~
   drivers/scsi/scsi_sysfs.c:372:1: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   shost_rd_attr(unique_id, "%u\n");
   ^
   drivers/scsi/scsi_sysfs.c:177:45: note: expanded from macro 'shost_rd_at=
tr'
   #define shost_rd_attr(field, format_string) \
                                               ^
   drivers/scsi/scsi_sysfs.c:174:2: note: expanded from macro '\shost_rd_at=
tr2'
           shost_show_function(name, field, format_string)                 \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_sysfs.c:166:9: note: expanded from macro 'shost_show_f=
unction'
           return snprintf (buf, 20, format_string, shost->field);         \
                  ^~~~~~~~
   drivers/scsi/scsi_sysfs.c:372:1: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
   shost_rd_attr(unique_id, "%u\n");
   ^
   drivers/scsi/scsi_sysfs.c:177:45: note: expanded from macro 'shost_rd_at=
tr'
   #define shost_rd_attr(field, format_string) \
                                               ^
   drivers/scsi/scsi_sysfs.c:174:2: note: expanded from macro '\shost_rd_at=
tr2'
           shost_show_function(name, field, format_string)                 \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_sysfs.c:166:9: note: expanded from macro 'shost_show_f=
unction'
           return snprintf (buf, 20, format_string, shost->field);         \
                  ^~~~~~~~
   drivers/scsi/scsi_sysfs.c:373:1: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   shost_rd_attr(cmd_per_lun, "%hd\n");
   ^
   drivers/scsi/scsi_sysfs.c:177:45: note: expanded from macro 'shost_rd_at=
tr'
   #define shost_rd_attr(field, format_string) \
                                               ^
   drivers/scsi/scsi_sysfs.c:174:2: note: expanded from macro '\shost_rd_at=
tr2'
           shost_show_function(name, field, format_string)                 \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_sysfs.c:166:9: note: expanded from macro 'shost_show_f=
unction'
           return snprintf (buf, 20, format_string, shost->field);         \
                  ^~~~~~~~
   drivers/scsi/scsi_sysfs.c:373:1: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
   shost_rd_attr(cmd_per_lun, "%hd\n");

vim +/ptp_priv +2729 drivers/net/phy/micrel.c

b3ec7248f1f4b9d Divya Koppera 2021-12-21  2725  =

ece19502834d84e Divya Koppera 2022-03-04  2726  static void lan8814_ptp_ini=
t(struct phy_device *phydev)
ece19502834d84e Divya Koppera 2022-03-04  2727  {
ece19502834d84e Divya Koppera 2022-03-04  2728  	struct kszphy_priv *priv =
=3D phydev->priv;
ece19502834d84e Divya Koppera 2022-03-04 @2729  	struct kszphy_ptp_priv *pt=
p_priv =3D &priv->ptp_priv;
ece19502834d84e Divya Koppera 2022-03-04  2730  	u32 temp;
ece19502834d84e Divya Koppera 2022-03-04  2731  =

31d00ca4ce0e1ab Michael Walle 2022-04-27  2732  	if (!IS_ENABLED(CONFIG_PTP=
_1588_CLOCK) ||
31d00ca4ce0e1ab Michael Walle 2022-04-27  2733  	    !IS_ENABLED(CONFIG_NET=
WORK_PHY_TIMESTAMPING))
31d00ca4ce0e1ab Michael Walle 2022-04-27  2734  		return;
31d00ca4ce0e1ab Michael Walle 2022-04-27  2735  =

ece19502834d84e Divya Koppera 2022-03-04  2736  	lanphy_write_page_reg(phyd=
ev, 5, TSU_HARD_RESET, TSU_HARD_RESET_);
ece19502834d84e Divya Koppera 2022-03-04  2737  =

ece19502834d84e Divya Koppera 2022-03-04  2738  	temp =3D lanphy_read_page_=
reg(phydev, 5, PTP_TX_MOD);
ece19502834d84e Divya Koppera 2022-03-04  2739  	temp |=3D PTP_TX_MOD_BAD_U=
DPV4_CHKSUM_FORCE_FCS_DIS_;
ece19502834d84e Divya Koppera 2022-03-04  2740  	lanphy_write_page_reg(phyd=
ev, 5, PTP_TX_MOD, temp);
ece19502834d84e Divya Koppera 2022-03-04  2741  =

ece19502834d84e Divya Koppera 2022-03-04  2742  	temp =3D lanphy_read_page_=
reg(phydev, 5, PTP_RX_MOD);
ece19502834d84e Divya Koppera 2022-03-04  2743  	temp |=3D PTP_RX_MOD_BAD_U=
DPV4_CHKSUM_FORCE_FCS_DIS_;
ece19502834d84e Divya Koppera 2022-03-04  2744  	lanphy_write_page_reg(phyd=
ev, 5, PTP_RX_MOD, temp);
ece19502834d84e Divya Koppera 2022-03-04  2745  =

ece19502834d84e Divya Koppera 2022-03-04  2746  	lanphy_write_page_reg(phyd=
ev, 5, PTP_RX_PARSE_CONFIG, 0);
ece19502834d84e Divya Koppera 2022-03-04  2747  	lanphy_write_page_reg(phyd=
ev, 5, PTP_TX_PARSE_CONFIG, 0);
ece19502834d84e Divya Koppera 2022-03-04  2748  =

ece19502834d84e Divya Koppera 2022-03-04  2749  	/* Removing default regist=
ers configs related to L2 and IP */
ece19502834d84e Divya Koppera 2022-03-04  2750  	lanphy_write_page_reg(phyd=
ev, 5, PTP_TX_PARSE_L2_ADDR_EN, 0);
ece19502834d84e Divya Koppera 2022-03-04  2751  	lanphy_write_page_reg(phyd=
ev, 5, PTP_RX_PARSE_L2_ADDR_EN, 0);
ece19502834d84e Divya Koppera 2022-03-04  2752  	lanphy_write_page_reg(phyd=
ev, 5, PTP_TX_PARSE_IP_ADDR_EN, 0);
ece19502834d84e Divya Koppera 2022-03-04  2753  	lanphy_write_page_reg(phyd=
ev, 5, PTP_RX_PARSE_IP_ADDR_EN, 0);
ece19502834d84e Divya Koppera 2022-03-04  2754  =

ece19502834d84e Divya Koppera 2022-03-04  2755  	skb_queue_head_init(&ptp_p=
riv->tx_queue);
ece19502834d84e Divya Koppera 2022-03-04  2756  	skb_queue_head_init(&ptp_p=
riv->rx_queue);
ece19502834d84e Divya Koppera 2022-03-04  2757  	INIT_LIST_HEAD(&ptp_priv->=
rx_ts_list);
ece19502834d84e Divya Koppera 2022-03-04  2758  	spin_lock_init(&ptp_priv->=
rx_ts_lock);
ece19502834d84e Divya Koppera 2022-03-04  2759  =

ece19502834d84e Divya Koppera 2022-03-04  2760  	ptp_priv->phydev =3D phyde=
v;
ece19502834d84e Divya Koppera 2022-03-04  2761  =

ece19502834d84e Divya Koppera 2022-03-04  2762  	ptp_priv->mii_ts.rxtstamp =
=3D lan8814_rxtstamp;
ece19502834d84e Divya Koppera 2022-03-04  2763  	ptp_priv->mii_ts.txtstamp =
=3D lan8814_txtstamp;
ece19502834d84e Divya Koppera 2022-03-04  2764  	ptp_priv->mii_ts.hwtstamp =
=3D lan8814_hwtstamp;
ece19502834d84e Divya Koppera 2022-03-04  2765  	ptp_priv->mii_ts.ts_info  =
=3D lan8814_ts_info;
ece19502834d84e Divya Koppera 2022-03-04  2766  =

ece19502834d84e Divya Koppera 2022-03-04  2767  	phydev->mii_ts =3D &ptp_pr=
iv->mii_ts;
ece19502834d84e Divya Koppera 2022-03-04  2768  }
ece19502834d84e Divya Koppera 2022-03-04  2769  =

ece19502834d84e Divya Koppera 2022-03-04  2770  static int lan8814_ptp_prob=
e_once(struct phy_device *phydev)
ece19502834d84e Divya Koppera 2022-03-04  2771  {
ece19502834d84e Divya Koppera 2022-03-04 @2772  	struct lan8814_shared_priv=
 *shared =3D phydev->shared->priv;
ece19502834d84e Divya Koppera 2022-03-04  2773  =

31d00ca4ce0e1ab Michael Walle 2022-04-27  2774  	if (!IS_ENABLED(CONFIG_PTP=
_1588_CLOCK) ||
31d00ca4ce0e1ab Michael Walle 2022-04-27  2775  	    !IS_ENABLED(CONFIG_NET=
WORK_PHY_TIMESTAMPING))
31d00ca4ce0e1ab Michael Walle 2022-04-27  2776  		return 0;
31d00ca4ce0e1ab Michael Walle 2022-04-27  2777  =

ece19502834d84e Divya Koppera 2022-03-04  2778  	/* Initialise shared lock =
for clock*/
ece19502834d84e Divya Koppera 2022-03-04  2779  	mutex_init(&shared->shared=
_lock);
ece19502834d84e Divya Koppera 2022-03-04  2780  =

ece19502834d84e Divya Koppera 2022-03-04  2781  	shared->ptp_clock_info.own=
er =3D THIS_MODULE;
ece19502834d84e Divya Koppera 2022-03-04  2782  	snprintf(shared->ptp_clock=
_info.name, 30, "%s", phydev->drv->name);
ece19502834d84e Divya Koppera 2022-03-04  2783  	shared->ptp_clock_info.max=
_adj =3D 31249999;
ece19502834d84e Divya Koppera 2022-03-04  2784  	shared->ptp_clock_info.n_a=
larm =3D 0;
ece19502834d84e Divya Koppera 2022-03-04  2785  	shared->ptp_clock_info.n_e=
xt_ts =3D 0;
ece19502834d84e Divya Koppera 2022-03-04  2786  	shared->ptp_clock_info.n_p=
ins =3D 0;
ece19502834d84e Divya Koppera 2022-03-04  2787  	shared->ptp_clock_info.pps=
 =3D 0;
ece19502834d84e Divya Koppera 2022-03-04  2788  	shared->ptp_clock_info.pin=
_config =3D NULL;
ece19502834d84e Divya Koppera 2022-03-04  2789  	shared->ptp_clock_info.adj=
fine =3D lan8814_ptpci_adjfine;
ece19502834d84e Divya Koppera 2022-03-04  2790  	shared->ptp_clock_info.adj=
time =3D lan8814_ptpci_adjtime;
ece19502834d84e Divya Koppera 2022-03-04  2791  	shared->ptp_clock_info.get=
time64 =3D lan8814_ptpci_gettime64;
ece19502834d84e Divya Koppera 2022-03-04  2792  	shared->ptp_clock_info.set=
time64 =3D lan8814_ptpci_settime64;
ece19502834d84e Divya Koppera 2022-03-04  2793  	shared->ptp_clock_info.get=
crosststamp =3D NULL;
ece19502834d84e Divya Koppera 2022-03-04  2794  =

ece19502834d84e Divya Koppera 2022-03-04  2795  	shared->ptp_clock =3D ptp_=
clock_register(&shared->ptp_clock_info,
ece19502834d84e Divya Koppera 2022-03-04  2796  					       &phydev->mdio.d=
ev);
ece19502834d84e Divya Koppera 2022-03-04  2797  	if (IS_ERR_OR_NULL(shared-=
>ptp_clock)) {
ece19502834d84e Divya Koppera 2022-03-04  2798  		phydev_err(phydev, "ptp_c=
lock_register failed %lu\n",
ece19502834d84e Divya Koppera 2022-03-04  2799  			   PTR_ERR(shared->ptp_c=
lock));
ece19502834d84e Divya Koppera 2022-03-04  2800  		return -EINVAL;
ece19502834d84e Divya Koppera 2022-03-04  2801  	}
ece19502834d84e Divya Koppera 2022-03-04  2802  =

ece19502834d84e Divya Koppera 2022-03-04  2803  	phydev_dbg(phydev, "succes=
sfully registered ptp clock\n");
ece19502834d84e Divya Koppera 2022-03-04  2804  =

ece19502834d84e Divya Koppera 2022-03-04  2805  	shared->phydev =3D phydev;
ece19502834d84e Divya Koppera 2022-03-04  2806  =

ece19502834d84e Divya Koppera 2022-03-04  2807  	/* The EP.4 is shared betw=
een all the PHYs in the package and also it
ece19502834d84e Divya Koppera 2022-03-04  2808  	 * can be accessed by any =
of the PHYs
ece19502834d84e Divya Koppera 2022-03-04  2809  	 */
ece19502834d84e Divya Koppera 2022-03-04  2810  	lanphy_write_page_reg(phyd=
ev, 4, LTC_HARD_RESET, LTC_HARD_RESET_);
ece19502834d84e Divya Koppera 2022-03-04  2811  	lanphy_write_page_reg(phyd=
ev, 4, PTP_OPERATING_MODE,
ece19502834d84e Divya Koppera 2022-03-04  2812  			      PTP_OPERATING_MODE=
_STANDALONE_);
ece19502834d84e Divya Koppera 2022-03-04  2813  =

ece19502834d84e Divya Koppera 2022-03-04  2814  	return 0;
ece19502834d84e Divya Koppera 2022-03-04  2815  }
ece19502834d84e Divya Koppera 2022-03-04  2816  =


:::::: The code at line 2729 was first introduced by commit
:::::: ece19502834d84ece2e056db28257ca2aa6e4d48 net: phy: micrel: 1588 supp=
ort for LAN8814 phy

:::::: TO: Divya Koppera <Divya.Koppera@microchip.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3317017042957177930==--

