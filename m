Content-Type: multipart/mixed; boundary="===============6298208591232422612=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [frank-w-bpi-r2-4.14:5.17-prepare 4/13] drivers/net/phy/rtl8367s_mdio.c:409:5: warning: Value stored to 'type' is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 09 Feb 2022 09:46:56 +0800
Message-ID: <202202090932.Ctx5XBbl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6298208591232422612==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 5.17-prepare
head:   184c5d6eb630c7813afa7d0b061daf73b5fe342b
commit: 763d02319f60ea15e7af71c8222bbe099d39fa7f [4/13] net: phy: add rtl83=
67 reduced phy driver
:::::: branch date: 11 days ago
:::::: commit date: 2 weeks ago
config: riscv-randconfig-c006-20220207 (https://download.01.org/0day-ci/arc=
hive/20220209/202202090932.Ctx5XBbl-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0d8850=
ae2cae85d49bea6ae0799fa41c7202c05c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/frank-w/BPI-R2-4.14/commit/763d02319f60ea15e7a=
f71c8222bbe099d39fa7f
        git remote add frank-w-bpi-r2-4.14 https://github.com/frank-w/BPI-R=
2-4.14
        git fetch --no-tags frank-w-bpi-r2-4.14 5.17-prepare
        git checkout 763d02319f60ea15e7af71c8222bbe099d39fa7f
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/usb/serial/ir-usb.c:209:2: warning: Value stored to 'rates' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           rates =3D le16_to_cpu(irda_desc->wBaudRate);
           ^
   drivers/usb/serial/ir-usb.c:209:2: note: Value stored to 'rates' is neve=
r read
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
   5 warnings generated.
   drivers/media/i2c/adv7170.c:361:3: warning: Value stored to 'i' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   i =3D adv7170_write(sd, 0x07, TR0MODE | TR0RST);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/adv7170.c:361:3: note: Value stored to 'i' is never re=
ad
                   i =3D adv7170_write(sd, 0x07, TR0MODE | TR0RST);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/adv7170.c:362:3: warning: Value stored to 'i' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   i =3D adv7170_write(sd, 0x07, TR0MODE);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/adv7170.c:362:3: note: Value stored to 'i' is never re=
ad
                   i =3D adv7170_write(sd, 0x07, TR0MODE);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   drivers/net/wireless/mediatek/mt76/mt76x02_usb_core.c:157:2: warning: Va=
lue stored to 'tsf' is never read [clang-analyzer-deadcode.DeadStores]
           tsf =3D (u64)dw0 << 32 | dw1;
           ^     ~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt76x02_usb_core.c:157:2: note: Value=
 stored to 'tsf' is never read
           tsf =3D (u64)dw0 << 32 | dw1;
           ^     ~~~~~~~~~~~~~~~~~~~~
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
   drivers/net/phy/mscc/mscc_ptp.c:1446:2: warning: Value stored to 'val' i=
s never read [clang-analyzer-deadcode.DeadStores]
           val =3D vsc85xx_ts_read_csr(phydev, PROCESSOR, MSCC_PHY_PTP_VERS=
ION_CODE);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/net/phy/mscc/mscc_ptp.c:1446:2: note: Value stored to 'val' is n=
ever read
           val =3D vsc85xx_ts_read_csr(phydev, PROCESSOR, MSCC_PHY_PTP_VERS=
ION_CODE);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> drivers/net/phy/rtl8367s_mdio.c:409:5: warning: Value stored to 'type' i=
s never read [clang-analyzer-deadcode.DeadStores]
       type =3D 0;
       ^      ~
   drivers/net/phy/rtl8367s_mdio.c:409:5: note: Value stored to 'type' is n=
ever read
       type =3D 0;
       ^      ~
   drivers/net/phy/rtl8367s_mdio.c:766:40: warning: The left operand of '<<=
' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
       reg_data |=3D pPortAbility->mstfault << 9;
                                          ^
   drivers/net/phy/rtl8367s_mdio.c:2391:6: note: Assuming 'mdio' is non-null
           if (!mdio)
               ^~~~~
   drivers/net/phy/rtl8367s_mdio.c:2391:2: note: Taking false branch
           if (!mdio)
           ^
   drivers/net/phy/rtl8367s_mdio.c:2396:6: note: Assuming 'mdio_bus' is non=
-null
           if (!mdio_bus)
               ^~~~~~~~~
   drivers/net/phy/rtl8367s_mdio.c:2396:2: note: Taking false branch
           if (!mdio_bus)
           ^
   drivers/net/phy/rtl8367s_mdio.c:2401:6: note: Assuming 'gsw' is non-null
           if (!gsw)
               ^~~~
   drivers/net/phy/rtl8367s_mdio.c:2401:2: note: Taking false branch
           if (!gsw)
           ^
   drivers/net/phy/rtl8367s_mdio.c:2409:7: note: 'ret' is 0
           if (!ret)
                ^~~
   drivers/net/phy/rtl8367s_mdio.c:2409:2: note: Taking true branch
           if (!ret)
           ^
   drivers/net/phy/rtl8367s_mdio.c:2416:6: note: Assuming field 'reset_pin'=
 is >=3D 0
           if (gsw->reset_pin < 0)
               ^~~~~~~~~~~~~~~~~~
   drivers/net/phy/rtl8367s_mdio.c:2416:2: note: Taking false branch
           if (gsw->reset_pin < 0)
           ^
   drivers/net/phy/rtl8367s_mdio.c:2421:2: note: Calling 'init_gsw'
           init_gsw(gsw);
           ^~~~~~~~~~~~~
   drivers/net/phy/rtl8367s_mdio.c:2349:2: note: Taking true branch
           if (rtl8367s_hw_init(gsw))
           ^
   drivers/net/phy/rtl8367s_mdio.c:2350:3: note: Loop condition is false.  =
Exiting loop
                   printk("RTL8367RB Switch Init Failure !!!\n");
                   ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/net/phy/rtl8367s_mdio.c:2355:6: note: Assuming 'ret' is 0
           if (!ret && (!strcasecmp(pm, "rgmii,rgmii")))
               ^~~~
   drivers/net/phy/rtl8367s_mdio.c:2355:6: note: Left side of '&&' is true
   drivers/net/phy/rtl8367s_mdio.c:2355:2: note: Taking true branch
           if (!ret && (!strcasecmp(pm, "rgmii,rgmii")))
           ^
   drivers/net/phy/rtl8367s_mdio.c:2358:3: note: Loop condition is false.  =
Exiting loop
                   printk(KERN_ALERT "DEBUG: Passed %s %d rgmii+rgmii\n",__=
FUNCTION__,__LINE__);
                   ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/net/phy/rtl8367s_mdio.c:2359:3: note: Calling 'set_rtl8367s_rgmi=
i_ep0'
                   set_rtl8367s_rgmii_ep0(gsw);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/rtl8367s_mdio.c:2319:2: note: Calling 'rtk_port_macForce=
LinkExt_set'
           rtk_port_macForceLinkExt_set(EXT_PORT0, mode, &mac_cfg);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/rtl8367s_mdio.c:1270:5: note: Assuming 'init_state' is e=
qual to INIT_COMPLETED
       RTK_CHK_INIT_STATE();
       ^
   drivers/net/phy/rtl8367s_mdio.h:361:6: note: expanded from macro 'RTK_CH=
K_INIT_STATE'
                   if(init_state !=3D INIT_COMPLETED)        \
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/rtl8367s_mdio.c:1270:5: note: Taking false branch
       RTK_CHK_INIT_STATE();
       ^
   drivers/net/phy/rtl8367s_mdio.h:361:3: note: expanded from macro 'RTK_CH=
K_INIT_STATE'
                   if(init_state !=3D INIT_COMPLETED)        \
                   ^
   drivers/net/phy/rtl8367s_mdio.c:1270:5: note: Loop condition is false.  =
Exiting loop
       RTK_CHK_INIT_STATE();
       ^
   drivers/net/phy/rtl8367s_mdio.h:359:2: note: expanded from macro 'RTK_CH=
K_INIT_STATE'
           do                                              \
           ^
   drivers/net/phy/rtl8367s_mdio.c:1273:5: note: Taking false branch

vim +/type +409 drivers/net/phy/rtl8367s_mdio.c

763d02319f60ea Frank Wunderlich 2022-01-15  377  =

763d02319f60ea Frank Wunderlich 2022-01-15  378  /* rtl8367c_setAsicPortExt=
Mode  Set external interface mode configuration */
763d02319f60ea Frank Wunderlich 2022-01-15  379  static ret_t rtl8367c_setA=
sicPortExtMode(rtk_uint32 id, rtk_uint32 mode)
763d02319f60ea Frank Wunderlich 2022-01-15  380  {
763d02319f60ea Frank Wunderlich 2022-01-15  381      ret_t   retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  382      rtk_uint32 i, regValue=
, type, option;
763d02319f60ea Frank Wunderlich 2022-01-15  383      rtk_uint32 idx;
763d02319f60ea Frank Wunderlich 2022-01-15  384      rtk_uint32 redData[][2=
] =3D   { {0x04D7, 0x0480}, {0xF994, 0x0481}, {0x21A2, 0x0482}, {0x6960, 0x=
0483}, {0x9728, 0x0484}, {0x9D85, 0x0423}, {0xD810, 0x0424}, {0x83F2, 0x002=
E} };
763d02319f60ea Frank Wunderlich 2022-01-15  385      rtk_uint32 redDataSB[]=
[2] =3D { {0x04D7, 0x0480}, {0xF994, 0x0481}, {0x31A2, 0x0482}, {0x6960, 0x=
0483}, {0x9728, 0x0484}, {0x9D85, 0x0423}, {0xD810, 0x0424}, {0x83F2, 0x002=
E} };
763d02319f60ea Frank Wunderlich 2022-01-15  386      rtk_uint32 redData1[][=
2] =3D  { {0x82F1, 0x0500}, {0xF195, 0x0501}, {0x31A2, 0x0502}, {0x796C, 0x=
0503}, {0x9728, 0x0504}, {0x9D85, 0x0423}, {0xD810, 0x0424}, {0x0F80, 0x000=
1}, {0x83F2, 0x002E} };
763d02319f60ea Frank Wunderlich 2022-01-15  387      rtk_uint32 redData5[][=
2] =3D  { {0x82F1, 0x0500}, {0xF195, 0x0501}, {0x31A2, 0x0502}, {0x796C, 0x=
0503}, {0x9728, 0x0504}, {0x9D85, 0x0423}, {0xD810, 0x0424}, {0x0F80, 0x000=
1}, {0x83F2, 0x002E} };
763d02319f60ea Frank Wunderlich 2022-01-15  388      rtk_uint32 redData6[][=
2] =3D  { {0x82F1, 0x0500}, {0xF195, 0x0501}, {0x31A2, 0x0502}, {0x796C, 0x=
0503}, {0x9728, 0x0504}, {0x9D85, 0x0423}, {0xD810, 0x0424}, {0x0F80, 0x000=
1}, {0x83F2, 0x002E} };
763d02319f60ea Frank Wunderlich 2022-01-15  389      rtk_uint32 redData8[][=
2] =3D  { {0x82F1, 0x0500}, {0xF995, 0x0501}, {0x31A2, 0x0502}, {0x796C, 0x=
0503}, {0x9728, 0x0504}, {0x9D85, 0x0423}, {0xD810, 0x0424}, {0x0F80, 0x000=
1}, {0x83F2, 0x002E} };
763d02319f60ea Frank Wunderlich 2022-01-15  390      rtk_uint32 redData9[][=
2] =3D  { {0x82F1, 0x0500}, {0xF995, 0x0501}, {0x31A2, 0x0502}, {0x796C, 0x=
0503}, {0x9728, 0x0504}, {0x9D85, 0x0423}, {0xD810, 0x0424}, {0x0F80, 0x000=
1}, {0x83F2, 0x002E} };
763d02319f60ea Frank Wunderlich 2022-01-15  391      rtk_uint32 redDataHB[]=
[2] =3D { {0x82F0, 0x0500}, {0xF195, 0x0501}, {0x31A2, 0x0502}, {0x7960, 0x=
0503}, {0x9728, 0x0504}, {0x9D85, 0x0423}, {0xD810, 0x0424}, {0x0F80, 0x000=
1}, {0x83F2, 0x002E} };
763d02319f60ea Frank Wunderlich 2022-01-15  392  =

763d02319f60ea Frank Wunderlich 2022-01-15  393      if(id >=3D RTL8367C_EX=
TNO)
763d02319f60ea Frank Wunderlich 2022-01-15  394          return RT_ERR_OUT_=
OF_RANGE;
763d02319f60ea Frank Wunderlich 2022-01-15  395  =

763d02319f60ea Frank Wunderlich 2022-01-15  396      if(mode >=3D EXT_END)
763d02319f60ea Frank Wunderlich 2022-01-15  397          return RT_ERR_OUT_=
OF_RANGE;
763d02319f60ea Frank Wunderlich 2022-01-15  398  =

763d02319f60ea Frank Wunderlich 2022-01-15  399      /* magic number*/
763d02319f60ea Frank Wunderlich 2022-01-15  400      if((retVal =3D rtl8367=
c_setAsicReg(0x13C2, 0x0249)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  401          return retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  402      /* Chip num */
763d02319f60ea Frank Wunderlich 2022-01-15  403      if((retVal =3D rtl8367=
c_getAsicReg(0x1300, &regValue)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  404          return retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  405  =

763d02319f60ea Frank Wunderlich 2022-01-15  406      if((retVal =3D rtl8367=
c_setAsicReg(0x13C2, 0x0000)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  407          return retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  408  =

763d02319f60ea Frank Wunderlich 2022-01-15 @409      type =3D 0;
763d02319f60ea Frank Wunderlich 2022-01-15  410  =

763d02319f60ea Frank Wunderlich 2022-01-15  411      switch (regValue)
763d02319f60ea Frank Wunderlich 2022-01-15  412      {
763d02319f60ea Frank Wunderlich 2022-01-15  413          case 0x0276:
763d02319f60ea Frank Wunderlich 2022-01-15  414          case 0x0597:
763d02319f60ea Frank Wunderlich 2022-01-15  415          case 0x6367:
763d02319f60ea Frank Wunderlich 2022-01-15  416              type =3D 1;
763d02319f60ea Frank Wunderlich 2022-01-15  417              break;
763d02319f60ea Frank Wunderlich 2022-01-15  418          case 0x0652:
763d02319f60ea Frank Wunderlich 2022-01-15  419          case 0x6368:
763d02319f60ea Frank Wunderlich 2022-01-15  420              type =3D 2;
763d02319f60ea Frank Wunderlich 2022-01-15  421              break;
763d02319f60ea Frank Wunderlich 2022-01-15  422          case 0x0801:
763d02319f60ea Frank Wunderlich 2022-01-15  423          case 0x6511:
763d02319f60ea Frank Wunderlich 2022-01-15  424              type =3D 3;
763d02319f60ea Frank Wunderlich 2022-01-15  425              break;
763d02319f60ea Frank Wunderlich 2022-01-15  426          default:
763d02319f60ea Frank Wunderlich 2022-01-15  427              return RT_ERR_=
FAILED;
763d02319f60ea Frank Wunderlich 2022-01-15  428      }
763d02319f60ea Frank Wunderlich 2022-01-15  429  =

763d02319f60ea Frank Wunderlich 2022-01-15  430  =

763d02319f60ea Frank Wunderlich 2022-01-15  431      if (1=3D=3Dtype)
763d02319f60ea Frank Wunderlich 2022-01-15  432      {
763d02319f60ea Frank Wunderlich 2022-01-15  433          if((mode =3D=3D EX=
T_1000X_100FX) || (mode =3D=3D EXT_1000X) || (mode =3D=3D EXT_100FX))
763d02319f60ea Frank Wunderlich 2022-01-15  434          {
763d02319f60ea Frank Wunderlich 2022-01-15  435              if((retVal =3D=
 rtl8367c_setAsicRegBit(RTL8367C_REG_REG_TO_ECO4, 5, 1)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  436                  return ret=
Val;
763d02319f60ea Frank Wunderlich 2022-01-15  437  =

763d02319f60ea Frank Wunderlich 2022-01-15  438              if((retVal =3D=
 rtl8367c_setAsicRegBit(RTL8367C_REG_REG_TO_ECO4, 7, 1)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  439                  return ret=
Val;
763d02319f60ea Frank Wunderlich 2022-01-15  440  =

763d02319f60ea Frank Wunderlich 2022-01-15  441              if ((retVal =
=3D rtl8367c_setAsicRegBit(RTL8367C_REG_CHIP_RESET, RTL8367C_DW8051_RST_OFF=
SET, 1)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  442                  return ret=
Val;
763d02319f60ea Frank Wunderlich 2022-01-15  443  =

763d02319f60ea Frank Wunderlich 2022-01-15  444              if ((retVal =
=3D rtl8367c_setAsicRegBit(RTL8367C_REG_MISCELLANEOUS_CONFIGURE0, RTL8367C_=
DW8051_EN_OFFSET, 1)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  445                  return ret=
Val;
763d02319f60ea Frank Wunderlich 2022-01-15  446  =

763d02319f60ea Frank Wunderlich 2022-01-15  447              if ((retVal =
=3D rtl8367c_setAsicRegBit(RTL8367C_REG_DW8051_RDY, RTL8367C_ACS_IROM_ENABL=
E_OFFSET, 1)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  448                  return ret=
Val;
763d02319f60ea Frank Wunderlich 2022-01-15  449  =

763d02319f60ea Frank Wunderlich 2022-01-15  450              if ((retVal =
=3D rtl8367c_setAsicRegBit(RTL8367C_REG_DW8051_RDY, RTL8367C_IROM_MSB_OFFSE=
T, 0)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  451                  return ret=
Val;
763d02319f60ea Frank Wunderlich 2022-01-15  452  /*
763d02319f60ea Frank Wunderlich 2022-01-15  453              if(mode =3D=3D=
 EXT_1000X_100FX)
763d02319f60ea Frank Wunderlich 2022-01-15  454              {
763d02319f60ea Frank Wunderlich 2022-01-15  455                  for(idx =
=3D 0; idx < FIBER2_AUTO_INIT_SIZE; idx++)
763d02319f60ea Frank Wunderlich 2022-01-15  456                  {
763d02319f60ea Frank Wunderlich 2022-01-15  457                      if ((r=
etVal =3D rtl8367c_setAsicReg(0xE000 + idx, (rtk_uint32)Fiber2_Auto[idx])) =
!=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  458                          re=
turn retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  459                  }
763d02319f60ea Frank Wunderlich 2022-01-15  460              }
763d02319f60ea Frank Wunderlich 2022-01-15  461  =

763d02319f60ea Frank Wunderlich 2022-01-15  462              if(mode =3D=3D=
 EXT_1000X)
763d02319f60ea Frank Wunderlich 2022-01-15  463              {
763d02319f60ea Frank Wunderlich 2022-01-15  464                  for(idx =
=3D 0; idx < FIBER2_1G_INIT_SIZE; idx++)
763d02319f60ea Frank Wunderlich 2022-01-15  465                  {
763d02319f60ea Frank Wunderlich 2022-01-15  466                      if ((r=
etVal =3D rtl8367c_setAsicReg(0xE000 + idx, (rtk_uint32)Fiber2_1G[idx])) !=
=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  467                          re=
turn retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  468                  }
763d02319f60ea Frank Wunderlich 2022-01-15  469              }
763d02319f60ea Frank Wunderlich 2022-01-15  470  =

763d02319f60ea Frank Wunderlich 2022-01-15  471              if(mode =3D=3D=
 EXT_100FX)
763d02319f60ea Frank Wunderlich 2022-01-15  472              {
763d02319f60ea Frank Wunderlich 2022-01-15  473                  for(idx =
=3D 0; idx < FIBER2_100M_INIT_SIZE; idx++)
763d02319f60ea Frank Wunderlich 2022-01-15  474                  {
763d02319f60ea Frank Wunderlich 2022-01-15  475                      if ((r=
etVal =3D rtl8367c_setAsicReg(0xE000 + idx, (rtk_uint32)Fiber2_100M[idx])) =
!=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  476                          re=
turn retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  477                  }
763d02319f60ea Frank Wunderlich 2022-01-15  478              }
763d02319f60ea Frank Wunderlich 2022-01-15  479  */
763d02319f60ea Frank Wunderlich 2022-01-15  480              if ((retVal =
=3D rtl8367c_setAsicRegBit(RTL8367C_REG_DW8051_RDY, RTL8367C_IROM_MSB_OFFSE=
T, 0)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  481                  return ret=
Val;
763d02319f60ea Frank Wunderlich 2022-01-15  482  =

763d02319f60ea Frank Wunderlich 2022-01-15  483              if ((retVal =
=3D rtl8367c_setAsicRegBit(RTL8367C_REG_DW8051_RDY, RTL8367C_ACS_IROM_ENABL=
E_OFFSET, 0)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  484                  return ret=
Val;
763d02319f60ea Frank Wunderlich 2022-01-15  485  =

763d02319f60ea Frank Wunderlich 2022-01-15  486              if ((retVal =
=3D rtl8367c_setAsicRegBit(RTL8367C_REG_CHIP_RESET, RTL8367C_DW8051_RST_OFF=
SET, 0)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  487                  return ret=
Val;
763d02319f60ea Frank Wunderlich 2022-01-15  488          }
763d02319f60ea Frank Wunderlich 2022-01-15  489  =

763d02319f60ea Frank Wunderlich 2022-01-15  490          if(mode =3D=3D EXT=
_GMII)
763d02319f60ea Frank Wunderlich 2022-01-15  491          {
763d02319f60ea Frank Wunderlich 2022-01-15  492              if( (retVal =
=3D rtl8367c_setAsicRegBit(RTL8367C_REG_EXT0_RGMXF, RTL8367C_EXT0_RGTX_INV_=
OFFSET, 1)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  493                  return ret=
Val;
763d02319f60ea Frank Wunderlich 2022-01-15  494  =

763d02319f60ea Frank Wunderlich 2022-01-15  495              if( (retVal =
=3D rtl8367c_setAsicRegBit(RTL8367C_REG_EXT1_RGMXF, RTL8367C_EXT1_RGTX_INV_=
OFFSET, 1)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  496                  return ret=
Val;
763d02319f60ea Frank Wunderlich 2022-01-15  497  =

763d02319f60ea Frank Wunderlich 2022-01-15  498              if( (retVal =
=3D rtl8367c_setAsicRegBits(RTL8367C_REG_EXT_TXC_DLY, RTL8367C_EXT1_GMII_TX=
_DELAY_MASK, 5)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  499                  return ret=
Val;
763d02319f60ea Frank Wunderlich 2022-01-15  500  =

763d02319f60ea Frank Wunderlich 2022-01-15  501              if( (retVal =
=3D rtl8367c_setAsicRegBits(RTL8367C_REG_EXT_TXC_DLY, RTL8367C_EXT0_GMII_TX=
_DELAY_MASK, 6)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  502                  return ret=
Val;
763d02319f60ea Frank Wunderlich 2022-01-15  503          }
763d02319f60ea Frank Wunderlich 2022-01-15  504  =

763d02319f60ea Frank Wunderlich 2022-01-15  505          /* Serdes reset */
763d02319f60ea Frank Wunderlich 2022-01-15  506          if( (mode =3D=3D E=
XT_TMII_MAC) || (mode =3D=3D EXT_TMII_PHY) )
763d02319f60ea Frank Wunderlich 2022-01-15  507          {
763d02319f60ea Frank Wunderlich 2022-01-15  508              if( (retVal =
=3D rtl8367c_setAsicRegBit(RTL8367C_REG_BYPASS_LINE_RATE, id, 1)) !=3D RT_E=
RR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  509                  return ret=
Val;
763d02319f60ea Frank Wunderlich 2022-01-15  510          }
763d02319f60ea Frank Wunderlich 2022-01-15  511          else
763d02319f60ea Frank Wunderlich 2022-01-15  512          {
763d02319f60ea Frank Wunderlich 2022-01-15  513              if( (retVal =
=3D rtl8367c_setAsicRegBit(RTL8367C_REG_BYPASS_LINE_RATE, id, 0)) !=3D RT_E=
RR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  514                  return ret=
Val;
763d02319f60ea Frank Wunderlich 2022-01-15  515          }
763d02319f60ea Frank Wunderlich 2022-01-15  516  =

763d02319f60ea Frank Wunderlich 2022-01-15  517          if( (mode =3D=3D E=
XT_SGMII) || (mode =3D=3D EXT_HSGMII) )
763d02319f60ea Frank Wunderlich 2022-01-15  518          {
763d02319f60ea Frank Wunderlich 2022-01-15  519              if(id !=3D 1)
763d02319f60ea Frank Wunderlich 2022-01-15  520                  return RT_=
ERR_PORT_ID;
763d02319f60ea Frank Wunderlich 2022-01-15  521  =

763d02319f60ea Frank Wunderlich 2022-01-15  522              if((retVal =3D=
 rtl8367c_setAsicReg(0x13C0, 0x0249)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  523                  return ret=
Val;
763d02319f60ea Frank Wunderlich 2022-01-15  524  =

763d02319f60ea Frank Wunderlich 2022-01-15  525              if((retVal =3D=
 rtl8367c_getAsicReg(0x13C1, &option)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  526                  return ret=
Val;
763d02319f60ea Frank Wunderlich 2022-01-15  527  =

763d02319f60ea Frank Wunderlich 2022-01-15  528              if((retVal =3D=
 rtl8367c_setAsicReg(0x13C0, 0x0000)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  529                  return ret=
Val;
763d02319f60ea Frank Wunderlich 2022-01-15  530          }
763d02319f60ea Frank Wunderlich 2022-01-15  531  =

763d02319f60ea Frank Wunderlich 2022-01-15  532          if(mode =3D=3D EXT=
_SGMII)
763d02319f60ea Frank Wunderlich 2022-01-15  533          {
763d02319f60ea Frank Wunderlich 2022-01-15  534              if(option =3D=
=3D 0)
763d02319f60ea Frank Wunderlich 2022-01-15  535              {
763d02319f60ea Frank Wunderlich 2022-01-15  536                  for(i =3D =
0; i <=3D 7; i++)
763d02319f60ea Frank Wunderlich 2022-01-15  537                  {
763d02319f60ea Frank Wunderlich 2022-01-15  538                      if( (r=
etVal =3D rtl8367c_setAsicReg(RTL8367C_REG_SDS_INDACS_DATA, redData[i][0]))=
 !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  539                          re=
turn retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  540  =

763d02319f60ea Frank Wunderlich 2022-01-15  541                      if( (r=
etVal =3D rtl8367c_setAsicReg(RTL8367C_REG_SDS_INDACS_ADR, redData[i][1])) =
!=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  542                          re=
turn retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  543  =

763d02319f60ea Frank Wunderlich 2022-01-15  544                      if( (r=
etVal =3D rtl8367c_setAsicReg(RTL8367C_REG_SDS_INDACS_CMD, 0x00C0)) !=3D RT=
_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  545                          re=
turn retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  546                  }
763d02319f60ea Frank Wunderlich 2022-01-15  547              }
763d02319f60ea Frank Wunderlich 2022-01-15  548              else
763d02319f60ea Frank Wunderlich 2022-01-15  549              {
763d02319f60ea Frank Wunderlich 2022-01-15  550                  for(i =3D =
0; i <=3D 7; i++)
763d02319f60ea Frank Wunderlich 2022-01-15  551                  {
763d02319f60ea Frank Wunderlich 2022-01-15  552                      if( (r=
etVal =3D rtl8367c_setAsicReg(RTL8367C_REG_SDS_INDACS_DATA, redDataSB[i][0]=
)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  553                          re=
turn retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  554  =

763d02319f60ea Frank Wunderlich 2022-01-15  555                      if( (r=
etVal =3D rtl8367c_setAsicReg(RTL8367C_REG_SDS_INDACS_ADR, redDataSB[i][1])=
) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  556                          re=
turn retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  557  =

763d02319f60ea Frank Wunderlich 2022-01-15  558                      if( (r=
etVal =3D rtl8367c_setAsicReg(RTL8367C_REG_SDS_INDACS_CMD, 0x00C0)) !=3D RT=
_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  559                          re=
turn retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  560                  }
763d02319f60ea Frank Wunderlich 2022-01-15  561              }
763d02319f60ea Frank Wunderlich 2022-01-15  562          }
763d02319f60ea Frank Wunderlich 2022-01-15  563  =

763d02319f60ea Frank Wunderlich 2022-01-15  564          if(mode =3D=3D EXT=
_HSGMII)
763d02319f60ea Frank Wunderlich 2022-01-15  565          {
763d02319f60ea Frank Wunderlich 2022-01-15  566              if(option =3D=
=3D 0)
763d02319f60ea Frank Wunderlich 2022-01-15  567              {
763d02319f60ea Frank Wunderlich 2022-01-15  568                  if( (retVa=
l =3D rtl8367c_setAsicReg(0x13c2, 0x0249)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  569                      return=
 retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  570  =

763d02319f60ea Frank Wunderlich 2022-01-15  571                  if( (retVa=
l =3D rtl8367c_getAsicReg(0x1301, &regValue)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  572                      return=
 retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  573  =

763d02319f60ea Frank Wunderlich 2022-01-15  574                  if( (retVa=
l =3D rtl8367c_setAsicReg(0x13c2, 0x0000)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  575                      return=
 retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  576  =

763d02319f60ea Frank Wunderlich 2022-01-15  577                  if ( ((reg=
Value & 0x00F0) >> 4) =3D=3D 0x0001)
763d02319f60ea Frank Wunderlich 2022-01-15  578                  {
763d02319f60ea Frank Wunderlich 2022-01-15  579                      for(i =
=3D 0; i <=3D 8; i++)
763d02319f60ea Frank Wunderlich 2022-01-15  580                      {
763d02319f60ea Frank Wunderlich 2022-01-15  581                          if=
( (retVal =3D rtl8367c_setAsicReg(RTL8367C_REG_SDS_INDACS_DATA, redData1[i]=
[0])) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  582                            =
  return retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  583  =

763d02319f60ea Frank Wunderlich 2022-01-15  584                          if=
( (retVal =3D rtl8367c_setAsicReg(RTL8367C_REG_SDS_INDACS_ADR, redData1[i][=
1])) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  585                            =
  return retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  586  =

763d02319f60ea Frank Wunderlich 2022-01-15  587                          if=
( (retVal =3D rtl8367c_setAsicReg(RTL8367C_REG_SDS_INDACS_CMD, 0x00C0)) !=
=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  588                            =
  return retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  589                      }
763d02319f60ea Frank Wunderlich 2022-01-15  590                  }
763d02319f60ea Frank Wunderlich 2022-01-15  591                  else if ( =
((regValue & 0x00F0) >> 4) =3D=3D 0x0005)
763d02319f60ea Frank Wunderlich 2022-01-15  592                  {
763d02319f60ea Frank Wunderlich 2022-01-15  593                      for(i =
=3D 0; i <=3D 8; i++)
763d02319f60ea Frank Wunderlich 2022-01-15  594                      {
763d02319f60ea Frank Wunderlich 2022-01-15  595                          if=
( (retVal =3D rtl8367c_setAsicReg(RTL8367C_REG_SDS_INDACS_DATA, redData5[i]=
[0])) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  596                            =
  return retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  597  =

763d02319f60ea Frank Wunderlich 2022-01-15  598                          if=
( (retVal =3D rtl8367c_setAsicReg(RTL8367C_REG_SDS_INDACS_ADR, redData5[i][=
1])) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  599                            =
  return retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  600  =

763d02319f60ea Frank Wunderlich 2022-01-15  601                          if=
( (retVal =3D rtl8367c_setAsicReg(RTL8367C_REG_SDS_INDACS_CMD, 0x00C0)) !=
=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  602                            =
  return retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  603                      }
763d02319f60ea Frank Wunderlich 2022-01-15  604                  }
763d02319f60ea Frank Wunderlich 2022-01-15  605                  else if ( =
((regValue & 0x00F0) >> 4) =3D=3D 0x0006)
763d02319f60ea Frank Wunderlich 2022-01-15  606                  {
763d02319f60ea Frank Wunderlich 2022-01-15  607                      for(i =
=3D 0; i <=3D 8; i++)
763d02319f60ea Frank Wunderlich 2022-01-15  608                      {
763d02319f60ea Frank Wunderlich 2022-01-15  609                          if=
( (retVal =3D rtl8367c_setAsicReg(RTL8367C_REG_SDS_INDACS_DATA, redData6[i]=
[0])) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  610                            =
  return retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  611  =

763d02319f60ea Frank Wunderlich 2022-01-15  612                          if=
( (retVal =3D rtl8367c_setAsicReg(RTL8367C_REG_SDS_INDACS_ADR, redData6[i][=
1])) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  613                            =
  return retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  614  =

763d02319f60ea Frank Wunderlich 2022-01-15  615                          if=
( (retVal =3D rtl8367c_setAsicReg(RTL8367C_REG_SDS_INDACS_CMD, 0x00C0)) !=
=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  616                            =
  return retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  617                      }
763d02319f60ea Frank Wunderlich 2022-01-15  618                  }
763d02319f60ea Frank Wunderlich 2022-01-15  619                  else if ( =
((regValue & 0x00F0) >> 4) =3D=3D 0x0008)
763d02319f60ea Frank Wunderlich 2022-01-15  620                  {
763d02319f60ea Frank Wunderlich 2022-01-15  621                      for(i =
=3D 0; i <=3D 8; i++)
763d02319f60ea Frank Wunderlich 2022-01-15  622                      {
763d02319f60ea Frank Wunderlich 2022-01-15  623                          if=
( (retVal =3D rtl8367c_setAsicReg(RTL8367C_REG_SDS_INDACS_DATA, redData8[i]=
[0])) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  624                            =
  return retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  625  =

763d02319f60ea Frank Wunderlich 2022-01-15  626                          if=
( (retVal =3D rtl8367c_setAsicReg(RTL8367C_REG_SDS_INDACS_ADR, redData8[i][=
1])) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  627                            =
  return retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  628  =

763d02319f60ea Frank Wunderlich 2022-01-15  629                          if=
( (retVal =3D rtl8367c_setAsicReg(RTL8367C_REG_SDS_INDACS_CMD, 0x00C0)) !=
=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  630                            =
  return retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  631                      }
763d02319f60ea Frank Wunderlich 2022-01-15  632                  }
763d02319f60ea Frank Wunderlich 2022-01-15  633                  else if ( =
((regValue & 0x00F0) >> 4) =3D=3D 0x0009)
763d02319f60ea Frank Wunderlich 2022-01-15  634                  {
763d02319f60ea Frank Wunderlich 2022-01-15  635                      for(i =
=3D 0; i <=3D 8; i++)
763d02319f60ea Frank Wunderlich 2022-01-15  636                      {
763d02319f60ea Frank Wunderlich 2022-01-15  637                          if=
( (retVal =3D rtl8367c_setAsicReg(RTL8367C_REG_SDS_INDACS_DATA, redData9[i]=
[0])) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  638                            =
  return retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  639  =

763d02319f60ea Frank Wunderlich 2022-01-15  640                          if=
( (retVal =3D rtl8367c_setAsicReg(RTL8367C_REG_SDS_INDACS_ADR, redData9[i][=
1])) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  641                            =
  return retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  642  =

763d02319f60ea Frank Wunderlich 2022-01-15  643                          if=
( (retVal =3D rtl8367c_setAsicReg(RTL8367C_REG_SDS_INDACS_CMD, 0x00C0)) !=
=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  644                            =
  return retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  645                      }
763d02319f60ea Frank Wunderlich 2022-01-15  646                  }
763d02319f60ea Frank Wunderlich 2022-01-15  647              }
763d02319f60ea Frank Wunderlich 2022-01-15  648              else
763d02319f60ea Frank Wunderlich 2022-01-15  649              {
763d02319f60ea Frank Wunderlich 2022-01-15  650                  for(i =3D =
0; i <=3D 8; i++)
763d02319f60ea Frank Wunderlich 2022-01-15  651                  {
763d02319f60ea Frank Wunderlich 2022-01-15  652                      if( (r=
etVal =3D rtl8367c_setAsicReg(RTL8367C_REG_SDS_INDACS_DATA, redDataHB[i][0]=
)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  653                          re=
turn retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  654  =

763d02319f60ea Frank Wunderlich 2022-01-15  655                      if( (r=
etVal =3D rtl8367c_setAsicReg(RTL8367C_REG_SDS_INDACS_ADR, redDataHB[i][1])=
) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  656                          re=
turn retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  657  =

763d02319f60ea Frank Wunderlich 2022-01-15  658                      if( (r=
etVal =3D rtl8367c_setAsicReg(RTL8367C_REG_SDS_INDACS_CMD, 0x00C0)) !=3D RT=
_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  659                          re=
turn retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  660                  }
763d02319f60ea Frank Wunderlich 2022-01-15  661              }
763d02319f60ea Frank Wunderlich 2022-01-15  662          }
763d02319f60ea Frank Wunderlich 2022-01-15  663  =

763d02319f60ea Frank Wunderlich 2022-01-15  664          /* Only one ext po=
rt should care SGMII setting */
763d02319f60ea Frank Wunderlich 2022-01-15  665          if(id =3D=3D 1)
763d02319f60ea Frank Wunderlich 2022-01-15  666          {
763d02319f60ea Frank Wunderlich 2022-01-15  667  =

763d02319f60ea Frank Wunderlich 2022-01-15  668              if(mode =3D=3D=
 EXT_SGMII)
763d02319f60ea Frank Wunderlich 2022-01-15  669              {
763d02319f60ea Frank Wunderlich 2022-01-15  670                  if( (retVa=
l =3D rtl8367c_setAsicRegBit(RTL8367C_REG_SDS_MISC, RTL8367C_CFG_MAC8_SEL_S=
GMII_OFFSET, 1)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  671                      return=
 retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  672  =

763d02319f60ea Frank Wunderlich 2022-01-15  673                  if( (retVa=
l =3D rtl8367c_setAsicRegBit(RTL8367C_REG_SDS_MISC, RTL8367C_CFG_MAC8_SEL_H=
SGMII_OFFSET, 0)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  674                      return=
 retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  675              }
763d02319f60ea Frank Wunderlich 2022-01-15  676              else if(mode =
=3D=3D EXT_HSGMII)
763d02319f60ea Frank Wunderlich 2022-01-15  677              {
763d02319f60ea Frank Wunderlich 2022-01-15  678                  if( (retVa=
l =3D rtl8367c_setAsicRegBit(RTL8367C_REG_SDS_MISC, RTL8367C_CFG_MAC8_SEL_S=
GMII_OFFSET, 0)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  679                      return=
 retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  680  =

763d02319f60ea Frank Wunderlich 2022-01-15  681                  if( (retVa=
l =3D rtl8367c_setAsicRegBit(RTL8367C_REG_SDS_MISC, RTL8367C_CFG_MAC8_SEL_H=
SGMII_OFFSET, 1)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  682                      return=
 retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  683              }
763d02319f60ea Frank Wunderlich 2022-01-15  684              else
763d02319f60ea Frank Wunderlich 2022-01-15  685              {
763d02319f60ea Frank Wunderlich 2022-01-15  686  =

763d02319f60ea Frank Wunderlich 2022-01-15  687                  if((mode !=
=3D EXT_1000X_100FX) && (mode !=3D EXT_1000X) && (mode !=3D EXT_100FX))
763d02319f60ea Frank Wunderlich 2022-01-15  688                  {
763d02319f60ea Frank Wunderlich 2022-01-15  689                      if( (r=
etVal =3D rtl8367c_setAsicRegBit(RTL8367C_REG_SDS_MISC, RTL8367C_CFG_MAC8_S=
EL_SGMII_OFFSET, 0)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  690                          re=
turn retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  691  =

763d02319f60ea Frank Wunderlich 2022-01-15  692                      if( (r=
etVal =3D rtl8367c_setAsicRegBit(RTL8367C_REG_SDS_MISC, RTL8367C_CFG_MAC8_S=
EL_HSGMII_OFFSET, 0)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  693                          re=
turn retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  694                  }
763d02319f60ea Frank Wunderlich 2022-01-15  695              }
763d02319f60ea Frank Wunderlich 2022-01-15  696          }
763d02319f60ea Frank Wunderlich 2022-01-15  697  =

763d02319f60ea Frank Wunderlich 2022-01-15  698          if(0 =3D=3D id || =
1 =3D=3D id)
763d02319f60ea Frank Wunderlich 2022-01-15  699          {
763d02319f60ea Frank Wunderlich 2022-01-15  700              if((retVal =3D=
 rtl8367c_setAsicRegBits(RTL8367C_REG_DIGITAL_INTERFACE_SELECT, RTL8367C_SE=
LECT_GMII_0_MASK << (id * RTL8367C_SELECT_GMII_1_OFFSET), mode)) !=3D RT_ER=
R_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  701                  return ret=
Val;
763d02319f60ea Frank Wunderlich 2022-01-15  702          }
763d02319f60ea Frank Wunderlich 2022-01-15  703          else
763d02319f60ea Frank Wunderlich 2022-01-15  704          {
763d02319f60ea Frank Wunderlich 2022-01-15  705              if((retVal =3D=
 rtl8367c_setAsicRegBits(RTL8367C_REG_DIGITAL_INTERFACE_SELECT_1, RTL8367C_=
SELECT_GMII_2_MASK, mode)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  706                  return ret=
Val;
763d02319f60ea Frank Wunderlich 2022-01-15  707          }
763d02319f60ea Frank Wunderlich 2022-01-15  708  =

763d02319f60ea Frank Wunderlich 2022-01-15  709          /* Serdes not rese=
t */
763d02319f60ea Frank Wunderlich 2022-01-15  710          if( (mode =3D=3D E=
XT_SGMII) || (mode =3D=3D EXT_HSGMII) )
763d02319f60ea Frank Wunderlich 2022-01-15  711          {
763d02319f60ea Frank Wunderlich 2022-01-15  712              if( (retVal =
=3D rtl8367c_setAsicReg(RTL8367C_REG_SDS_INDACS_DATA, 0x7106)) !=3D RT_ERR_=
OK)
763d02319f60ea Frank Wunderlich 2022-01-15  713                  return ret=
Val;
763d02319f60ea Frank Wunderlich 2022-01-15  714  =

763d02319f60ea Frank Wunderlich 2022-01-15  715              if( (retVal =
=3D rtl8367c_setAsicReg(RTL8367C_REG_SDS_INDACS_ADR, 0x0003)) !=3D RT_ERR_O=
K)
763d02319f60ea Frank Wunderlich 2022-01-15  716                  return ret=
Val;
763d02319f60ea Frank Wunderlich 2022-01-15  717  =

763d02319f60ea Frank Wunderlich 2022-01-15  718              if( (retVal =
=3D rtl8367c_setAsicReg(RTL8367C_REG_SDS_INDACS_CMD, 0x00C0)) !=3D RT_ERR_O=
K)
763d02319f60ea Frank Wunderlich 2022-01-15  719                  return ret=
Val;
763d02319f60ea Frank Wunderlich 2022-01-15  720          }
763d02319f60ea Frank Wunderlich 2022-01-15  721  =

763d02319f60ea Frank Wunderlich 2022-01-15  722          if( (mode =3D=3D E=
XT_SGMII) || (mode =3D=3D EXT_HSGMII) )
763d02319f60ea Frank Wunderlich 2022-01-15  723          {
763d02319f60ea Frank Wunderlich 2022-01-15  724              if ((retVal =
=3D rtl8367c_setAsicRegBit(RTL8367C_REG_CHIP_RESET, RTL8367C_DW8051_RST_OFF=
SET, 1)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  725                  return ret=
Val;
763d02319f60ea Frank Wunderlich 2022-01-15  726  =

763d02319f60ea Frank Wunderlich 2022-01-15  727              if ((retVal =
=3D rtl8367c_setAsicRegBit(RTL8367C_REG_MISCELLANEOUS_CONFIGURE0, RTL8367C_=
DW8051_EN_OFFSET, 1)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  728                  return ret=
Val;
763d02319f60ea Frank Wunderlich 2022-01-15  729  =

763d02319f60ea Frank Wunderlich 2022-01-15  730              if ((retVal =
=3D rtl8367c_setAsicRegBit(RTL8367C_REG_DW8051_RDY, RTL8367C_ACS_IROM_ENABL=
E_OFFSET, 1)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  731                  return ret=
Val;
763d02319f60ea Frank Wunderlich 2022-01-15  732  =

763d02319f60ea Frank Wunderlich 2022-01-15  733              if ((retVal =
=3D rtl8367c_setAsicRegBit(RTL8367C_REG_DW8051_RDY, RTL8367C_IROM_MSB_OFFSE=
T, 0)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  734                  return ret=
Val;
763d02319f60ea Frank Wunderlich 2022-01-15  735  =

763d02319f60ea Frank Wunderlich 2022-01-15  736              for(idx =3D 0;=
 idx < SGMII_INIT_SIZE; idx++)
763d02319f60ea Frank Wunderlich 2022-01-15  737              {
763d02319f60ea Frank Wunderlich 2022-01-15  738                  if ((retVa=
l =3D rtl8367c_setAsicReg(0xE000 + idx, (rtk_uint32)Sgmii_Init[idx])) !=3D =
RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  739                      return=
 retVal;
763d02319f60ea Frank Wunderlich 2022-01-15  740              }
763d02319f60ea Frank Wunderlich 2022-01-15  741  =

763d02319f60ea Frank Wunderlich 2022-01-15  742              if ((retVal =
=3D rtl8367c_setAsicRegBit(RTL8367C_REG_DW8051_RDY, RTL8367C_IROM_MSB_OFFSE=
T, 0)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  743                  return ret=
Val;
763d02319f60ea Frank Wunderlich 2022-01-15  744  =

763d02319f60ea Frank Wunderlich 2022-01-15  745              if ((retVal =
=3D rtl8367c_setAsicRegBit(RTL8367C_REG_DW8051_RDY, RTL8367C_ACS_IROM_ENABL=
E_OFFSET, 0)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  746                  return ret=
Val;
763d02319f60ea Frank Wunderlich 2022-01-15  747  =

763d02319f60ea Frank Wunderlich 2022-01-15  748              if ((retVal =
=3D rtl8367c_setAsicRegBit(RTL8367C_REG_CHIP_RESET, RTL8367C_DW8051_RST_OFF=
SET, 0)) !=3D RT_ERR_OK)
763d02319f60ea Frank Wunderlich 2022-01-15  749                  return ret=
Val;
763d02319f60ea Frank Wunderlich 2022-01-15  750          }
763d02319f60ea Frank Wunderlich 2022-01-15  751      }
763d02319f60ea Frank Wunderlich 2022-01-15  752  =

763d02319f60ea Frank Wunderlich 2022-01-15  753      return RT_ERR_OK;
763d02319f60ea Frank Wunderlich 2022-01-15  754  }
763d02319f60ea Frank Wunderlich 2022-01-15  755  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============6298208591232422612==--

