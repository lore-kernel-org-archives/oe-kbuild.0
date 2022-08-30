Content-Type: multipart/mixed; boundary="===============0751840869059850687=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/freescale/fman/fman_port.c:841:48: warning: Parameter 'cfg' can be declared with const [constParameter]
Date: Tue, 30 Aug 2022 23:34:41 +0800
Message-ID: <202208302358.dCAsZlfu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0751840869059850687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/net/ethernet/freescale/fman/fman_port.c:841:48: warning: Parameter=
 'cfg' can be declared with const [constParameter]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Huacai Chen <chenhuacai@loongson.cn>
CC: WANG Xuerui <git@xen0n.name>
CC: Jianmin Lv <lvjianmin@loongson.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   dcf8e5633e2e69ad60b730ab5905608b756a032f
commit: 57fc7323a8e7c2e7c1d5795ab63cb3ffea3cfdfb LoongArch: Add PCI control=
ler support
date:   3 weeks ago
:::::: branch date: 19 hours ago
:::::: commit date: 3 weeks ago
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 57fc7323a8e7c2e7c1d5795ab63cb3ffea3cfdfb
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/ethernet/freescale/fman/fman_port.c:841:48: warning: Paramet=
er 'cfg' can be declared with const [constParameter]
   static bool is_init_done(struct fman_port_cfg *cfg)
                                                  ^
>> drivers/net/ethernet/freescale/fman/fman.c:1208:43: warning: Parameter '=
cfg' can be declared with const [constParameter]
   static bool is_init_done(struct fman_cfg *cfg)
                                             ^
>> drivers/net/ethernet/freescale/fman/fman.c:1551:65: warning: Parameter '=
size_of_fifo' can be declared with const [constParameter]
   static int set_size_of_fifo(struct fman *fman, u8 port_id, u32 *size_of_=
fifo,
                                                                   ^
>> drivers/net/ethernet/freescale/fman/fman.c:1552:13: warning: Parameter '=
extra_size_of_fifo' can be declared with const [constParameter]
          u32 *extra_size_of_fifo)
               ^
>> drivers/net/ethernet/freescale/fman/fman.c:1591:64: warning: Parameter '=
num_of_tasks' can be declared with const [constParameter]
   static int set_num_of_tasks(struct fman *fman, u8 port_id, u8 *num_of_ta=
sks,
                                                                  ^
>> drivers/net/ethernet/freescale/fman/fman.c:1592:12: warning: Parameter '=
num_of_extra_tasks' can be declared with const [constParameter]
          u8 *num_of_extra_tasks)
              ^
--
   In file included from drivers/net/ethernet/freescale/fman/fman_tgec.c:
>> drivers/net/ethernet/freescale/fman/fman_tgec.c:413:43: warning: Paramet=
er 'cfg' can be declared with const [constParameter]
   static bool is_init_done(struct tgec_cfg *cfg)
                                             ^
>> drivers/net/ethernet/freescale/fman/fman_dtsec.c:659:44: warning: Parame=
ter 'dtsec_drv_params' can be declared with const [constParameter]
   static bool is_init_done(struct dtsec_cfg *dtsec_drv_params)
                                              ^
>> drivers/net/ethernet/freescale/fman/mac.c:102:30: warning: Syntax Error:=
 AST broken, 'params' doesn't have a parent. [internalAstError]
    params->base_addr =3D (typeof(params->base_addr))
                                ^
--
>> drivers/net/ethernet/intel/ice/ice_lag.c:219:72: warning: Parameter 'net=
dev' can be declared with const [constParameter]
   static void ice_lag_unregister(struct ice_lag *lag, struct net_device *n=
etdev)
                                                                          ^
--
   In file included from drivers/net/ethernet/freescale/fman/fman_memac.c:
>> drivers/net/ethernet/freescale/fman/fman_memac.c:706:44: warning: Parame=
ter 'memac_drv_params' can be declared with const [constParameter]
   static bool is_init_done(struct memac_cfg *memac_drv_params)
                                              ^
>> drivers/net/ethernet/intel/ice/ice_base.c:204:18: warning: Signed intege=
r overflow for expression '0xF<<28'. [integerOverflow]
        (((regval & GLINT_CTL_ITR_GRAN_25_M) >>
                    ^
   drivers/net/ethernet/intel/ice/ice_base.c:215:5: warning: Signed integer=
 overflow for expression '0xF<<28'. [integerOverflow]
       GLINT_CTL_ITR_GRAN_25_M);
       ^
--
>> drivers/net/ethernet/intel/ice/ice_nvm.c:710:34: warning: Signed integer=
 overflow for expression '0xff<<24'. [integerOverflow]
    orom->major =3D (u8)((combo_ver & ICE_OROM_VER_MASK) >> ICE_OROM_VER_SH=
IFT);
                                    ^
--
>> drivers/net/ethernet/intel/ice/ice_tc_lib.c:1489:29: warning: Uninitiali=
zed variable: fltr->src_vsi [uninitvar]
     ice_add_switch_fltr(fltr->src_vsi, fltr);
                               ^
--
>> drivers/net/ethernet/intel/ice/ice_common.c:3296:48: warning: Parameter =
'pi' can be declared with const [constParameter]
   ice_copy_phy_caps_to_cfg(struct ice_port_info *pi,
                                                  ^
>> drivers/net/ethernet/intel/ice/ice_common.c:885:5: warning: Signed integ=
er overflow for expression '0x3<<30'. [integerOverflow]
       GL_PWR_MODE_CTL_CAR_MAX_BW_M) >>
       ^
--
>> drivers/net/ethernet/intel/ice/ice_ethtool.c:573:40: warning: Parameter =
'frame' can be declared with const [constParameter]
   static bool ice_lbtest_check_frame(u8 *frame)
                                          ^
--
>> drivers/net/ethernet/broadcom/tg3.c:9697:43: warning: Parameter 'buf' ca=
n be declared with const [constParameter]
   static inline u32 calc_crc(unsigned char *buf, int len)
                                             ^
>> drivers/net/ethernet/broadcom/tg3.c:6207:3: warning: Shifting signed 32-=
bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsS=
igned]
     tw32(TG3_EAV_REF_CLK_CORRECT_CTL,
     ^
   drivers/net/ethernet/broadcom/tg3.c:6302:4: warning: Shifting signed 32-=
bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsS=
igned]
      tw32(TG3_EAV_WATCHDOG0_MSB,
      ^
>> drivers/net/ethernet/broadcom/tg3.c:6207:3: warning: Signed integer over=
flow for expression '1<<31'. [integerOverflow]
     tw32(TG3_EAV_REF_CLK_CORRECT_CTL,
     ^
   drivers/net/ethernet/broadcom/tg3.c:6302:4: warning: Signed integer over=
flow for expression '1<<31'. [integerOverflow]
      tw32(TG3_EAV_WATCHDOG0_MSB,
      ^

vim +/cfg +841 drivers/net/ethernet/freescale/fman/fman_port.c

18a6c85fcc78ddb Igal Liberman 2015-12-21  840  =

18a6c85fcc78ddb Igal Liberman 2015-12-21 @841  static bool is_init_done(str=
uct fman_port_cfg *cfg)
18a6c85fcc78ddb Igal Liberman 2015-12-21  842  {
18a6c85fcc78ddb Igal Liberman 2015-12-21  843  	/* Checks if FMan port driv=
er parameters were initialized */
18a6c85fcc78ddb Igal Liberman 2015-12-21  844  	if (!cfg)
18a6c85fcc78ddb Igal Liberman 2015-12-21  845  		return true;
18a6c85fcc78ddb Igal Liberman 2015-12-21  846  =

18a6c85fcc78ddb Igal Liberman 2015-12-21  847  	return false;
18a6c85fcc78ddb Igal Liberman 2015-12-21  848  }
18a6c85fcc78ddb Igal Liberman 2015-12-21  849  =


:::::: The code@line 841 was first introduced by commit
:::::: 18a6c85fcc78ddb63b0646a302e5ec8d6a9e29d6 fsl/fman: Add FMan Port Sup=
port

:::::: TO: Igal Liberman <igal.liberman@freescale.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0751840869059850687==--

