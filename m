Content-Type: multipart/mixed; boundary="===============0951526138080251104=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [joro-iommu:core 11/30] drivers/iommu/iommu.c:191:57: warning: Parameter 'data' can be declared with const [constParameter]
Date: Mon, 12 Sep 2022 01:26:24 +0800
Message-ID: <202209120115.D0tzNWPP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0951526138080251104==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/i=
ommu/iommu.c:191:57: warning: Parameter 'data' can be declared with const [=
constParameter]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: iommu(a)lists.linux-foundation.org
TO: Robin Murphy <robin.murphy@arm.com>
CC: Joerg Roedel <jroedel@suse.de>
CC: Krishna Reddy <vdumpa@nvidia.com>
CC: Kevin Tian <kevin.tian@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git core
head:   c7883f8d2b0ab4b8e4df8cf37861523ad9ad1407
commit: 57365a04c92126525a58bf7a1599ddfa832415e9 [11/30] iommu: Move bus se=
tup to IOMMU device registration
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 57365a04c92126525a58bf7a1599ddfa832415e9
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

cppcheck warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/3com/3c509.c:802:9: warning: Local variable 'i' sha=
dows outer variable [shadowVariable]
       int i =3D 4;
           ^
   drivers/net/ethernet/3com/3c509.c:767:6: note: Shadowed declaration
    int i =3D max_interrupt_work;
        ^
   drivers/net/ethernet/3com/3c509.c:802:9: note: Shadow variable
       int i =3D 4;
           ^
>> drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:974:9: warning: Local va=
riable 'queue' shadows outer variable [shadowVariable]
       u16 queue =3D cqe_fp->queue_index;
           ^
   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:916:17: note: Shadowed d=
eclaration
     u16 len, pad, queue;
                   ^
   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:974:9: note: Shadow vari=
able
       u16 queue =3D cqe_fp->queue_index;
           ^
>> drivers/net/ethernet/broadcom/bnx2.c:2890:26: warning: Local variable 't=
x_buf' shadows outer variable [shadowVariable]
      struct bnx2_sw_tx_bd *tx_buf;
                            ^
   drivers/net/ethernet/broadcom/bnx2.c:2857:25: note: Shadowed declaration
     struct bnx2_sw_tx_bd *tx_buf;
                           ^
   drivers/net/ethernet/broadcom/bnx2.c:2890:26: note: Shadow variable
      struct bnx2_sw_tx_bd *tx_buf;
                            ^
>> drivers/net/ethernet/broadcom/bnx2.c:4020:7: warning: Local variable 'va=
l' shadows outer variable [shadowVariable]
     u32 val;
         ^
   drivers/net/ethernet/broadcom/bnx2.c:3948:6: note: Shadowed declaration
    u32 val, wol_msg;
        ^
   drivers/net/ethernet/broadcom/bnx2.c:4020:7: note: Shadow variable
     u32 val;
         ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/ethernet/altera/altera_tse_main.c:1383:7: warning: Redundant=
 initialization for 'ret'. The initialized value is overwritten before it i=
s read. [redundantInitialization]
     ret =3D request_and_map(pdev, "s1", &dma_res, &descmap);
         ^
   drivers/net/ethernet/altera/altera_tse_main.c:1354:10: note: ret is init=
ialized
    int ret =3D -ENODEV;
            ^
   drivers/net/ethernet/altera/altera_tse_main.c:1383:7: note: ret is overw=
ritten
     ret =3D request_and_map(pdev, "s1", &dma_res, &descmap);
         ^
>> drivers/net/ethernet/amazon/ena/ena_ethtool.c:115:39: warning: Parameter=
 'src' can be declared with const [constParameter]
   static void ena_safe_update_stat(u64 *src, u64 *dst,
                                         ^
--
>> drivers/net/ethernet/dnet.c:52:2: warning: Shifting signed 32-bit value =
by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
    dnet_writel(bp, reg | DNET_INTERNAL_WRITE, MACREG_ADDR);
    ^
>> drivers/net/ethernet/dnet.c:52:2: warning: Signed integer overflow for e=
xpression '1<<31'. [integerOverflow]
    dnet_writel(bp, reg | DNET_INTERNAL_WRITE, MACREG_ADDR);
    ^
>> drivers/net/ethernet/intel/ixgbevf/ethtool.c:523:4: warning: %u in forma=
t string (no. 1) requires 'unsigned int' but the argument type is 'signed i=
nt'. [invalidPrintfArgType_uint]
      sprintf(p, "tx_queue_%u_packets", i);
      ^
   drivers/net/ethernet/intel/ixgbevf/ethtool.c:525:4: warning: %u in forma=
t string (no. 1) requires 'unsigned int' but the argument type is 'signed i=
nt'. [invalidPrintfArgType_uint]
      sprintf(p, "tx_queue_%u_bytes", i);
      ^
   drivers/net/ethernet/intel/ixgbevf/ethtool.c:529:4: warning: %u in forma=
t string (no. 1) requires 'unsigned int' but the argument type is 'signed i=
nt'. [invalidPrintfArgType_uint]
      sprintf(p, "xdp_queue_%u_packets", i);
      ^
   drivers/net/ethernet/intel/ixgbevf/ethtool.c:531:4: warning: %u in forma=
t string (no. 1) requires 'unsigned int' but the argument type is 'signed i=
nt'. [invalidPrintfArgType_uint]
      sprintf(p, "xdp_queue_%u_bytes", i);
      ^
   drivers/net/ethernet/intel/ixgbevf/ethtool.c:535:4: warning: %u in forma=
t string (no. 1) requires 'unsigned int' but the argument type is 'signed i=
nt'. [invalidPrintfArgType_uint]
      sprintf(p, "rx_queue_%u_packets", i);
      ^
   drivers/net/ethernet/intel/ixgbevf/ethtool.c:537:4: warning: %u in forma=
t string (no. 1) requires 'unsigned int' but the argument type is 'signed i=
nt'. [invalidPrintfArgType_uint]
      sprintf(p, "rx_queue_%u_bytes", i);
      ^
>> drivers/net/ethernet/dlink/sundance.c:803:31: warning: Shifting signed 3=
2-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBit=
sSigned]
     int dataval =3D (mii_cmd & (1 << i)) ? MDIO_WRITE1 : MDIO_WRITE0;
                                 ^
>> drivers/net/ethernet/dlink/sundance.c:803:31: warning: Signed integer ov=
erflow for expression '1<<i'. [integerOverflow]
     int dataval =3D (mii_cmd & (1 << i)) ? MDIO_WRITE1 : MDIO_WRITE0;
                                 ^
>> drivers/net/ethernet/alacritech/slicoss.c:1525:3: warning: Assignment of=
 function parameter has no effect outside the function. Did you forget dere=
ferencing it? [uselessAssignmentPtrArg]
     data +=3D sizeof(slic_stats_strings);
     ^
>> drivers/iommu/iommu.c:191:57: warning: Parameter 'data' can be declared =
with const [constParameter]
   static int remove_iommu_group(struct device *dev, void *data)
                                                           ^
   drivers/iommu/iommu.c:2021:47: warning: Parameter 'domain' can be declar=
ed with const [constParameter]
   void iommu_detach_device(struct iommu_domain *domain, struct device *dev)
                                                 ^
   drivers/iommu/iommu.c:2642:69: warning: Parameter 'fwnode' can be declar=
ed with const [constParameter]
   const struct iommu_ops *iommu_ops_from_fwnode(struct fwnode_handle *fwno=
de)
                                                                       ^
   drivers/iommu/iommu.c:580:16: warning: Uninitialized variable: device->d=
ev [uninitvar]
     if (!device->dev->iommu)
                  ^
   drivers/iommu/iommu.c:1019:19: warning: Uninitialized variable: tmp_devi=
ce->dev [uninitvar]
     if (tmp_device->dev =3D=3D dev) {
                     ^
   drivers/iommu/iommu.c:1012:6: note: Assuming condition is false
    if (!group)
        ^
   drivers/iommu/iommu.c:1019:19: note: Uninitialized variable: tmp_device-=
>dev
     if (tmp_device->dev =3D=3D dev) {
                     ^
   drivers/iommu/iommu.c:1807:35: warning: Uninitialized variables: group.k=
obj, group.devices_kobj, group.devices, group.iommu_data, group.iommu_data_=
release, group.name, group.id, group.default_domain, group.blocking_domain,=
 group.domain, group.owner_cnt, group.owner [uninitvar]
     probe_alloc_default_domain(bus, group);
                                     ^
   drivers/iommu/iommu.c:1797:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1797:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1797:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1797:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1797:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1797:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1797:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1797:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1797:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1797:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1797:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1797:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1807:35: note: Uninitialized variables: group.kobj=
, group.devices_kobj, group.devices, group.iommu_data, group.iommu_data_rel=
ease, group.name, group.id, group.default_domain, group.blocking_domain, gr=
oup.domain, group.owner_cnt, group.owner
     probe_alloc_default_domain(bus, group);
                                     ^
--
>> drivers/net/ethernet/alteon/acenic.c:2671:14: warning: Local variable 'c=
md' shadows outer argument [shadowArgument]
     struct cmd cmd;
                ^
   drivers/net/ethernet/alteon/acenic.c:2627:44: note: Shadowed declaration
         const struct ethtool_link_ksettings *cmd)
                                              ^
   drivers/net/ethernet/alteon/acenic.c:2671:14: note: Shadow variable
     struct cmd cmd;
                ^
>> drivers/net/ethernet/intel/e1000/e1000_ethtool.c:123:6: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
    if (er32(STATUS) & E1000_STATUS_LU) {
        ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:336:18: warning: Same v=
alue in both branches of ternary operator. [duplicateValueTernary]
    regs_buff[0]  =3D er32(CTRL);
                    ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:337:18: warning: Same v=
alue in both branches of ternary operator. [duplicateValueTernary]
    regs_buff[1]  =3D er32(STATUS);
                    ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:339:18: warning: Same v=
alue in both branches of ternary operator. [duplicateValueTernary]
    regs_buff[2]  =3D er32(RCTL);
                    ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:345:18: warning: Same v=
alue in both branches of ternary operator. [duplicateValueTernary]
    regs_buff[7]  =3D er32(TCTL);
                    ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:408:19: warning: Same v=
alue in both branches of ternary operator. [duplicateValueTernary]
     regs_buff[26] =3D er32(MANC);
                     ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:730:11: warning: Same v=
alue in both branches of ternary operator. [duplicateValueTernary]
    before =3D er32(STATUS);
             ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:731:11: warning: Same v=
alue in both branches of ternary operator. [duplicateValueTernary]
    value =3D (er32(STATUS) & toggle);
             ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:732:2: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
    ew32(STATUS, toggle);
    ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:733:10: warning: Same v=
alue in both branches of ternary operator. [duplicateValueTernary]
    after =3D er32(STATUS) & toggle;
            ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:741:2: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
    ew32(STATUS, before);
    ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:743:2: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
    REG_PATTERN_TEST(FCAL, 0xFFFFFFFF, 0xFFFFFFFF);
    ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:744:2: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
    REG_PATTERN_TEST(FCAH, 0x0000FFFF, 0xFFFFFFFF);
    ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:745:2: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
    REG_PATTERN_TEST(FCT, 0x0000FFFF, 0xFFFFFFFF);
    ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:746:2: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
    REG_PATTERN_TEST(VET, 0x0000FFFF, 0xFFFFFFFF);
    ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:754:2: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
    REG_PATTERN_TEST(FCTTV, 0x0000FFFF, 0x0000FFFF);
    ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:755:2: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
    REG_PATTERN_TEST(TIPG, 0x3FFFFFFF, 0x3FFFFFFF);
    ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:759:2: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
    REG_SET_AND_CHECK(RCTL, 0xFFFFFFFF, 0x00000000);
    ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:762:2: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
    REG_SET_AND_CHECK(RCTL, before, 0x003FFFFB);
    ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:763:2: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
    REG_SET_AND_CHECK(TCTL, 0xFFFFFFFF, 0x00000000);
    ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:766:3: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
     REG_SET_AND_CHECK(RCTL, before, 0xFFFFFFFF);
     ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:768:3: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
     REG_PATTERN_TEST(TXCW, 0xC000FFFF, 0x0000FFFF);
     ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:777:3: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
     REG_SET_AND_CHECK(RCTL, 0xFFFFFFFF, 0x01FFFFFF);
     ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:779:3: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
     REG_PATTERN_TEST(TXCW, 0x0000FFFF, 0x0000FFFF);
     ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:821:23: warning: Same v=
alue in both branches of ternary operator. [duplicateValueTernary]
    adapter->test_icr |=3D er32(ICR);
                         ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:851:2: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
    ew32(IMC, 0xFFFFFFFF);
    ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:852:2: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
    E1000_WRITE_FLUSH();
    ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:868:4: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
      ew32(IMC, mask);
      ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:869:4: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
      ew32(ICS, mask);
      ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:870:4: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
      E1000_WRITE_FLUSH();
      ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:886:3: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
     ew32(IMS, mask);
     ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:887:3: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
     ew32(ICS, mask);
     ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:888:3: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
     E1000_WRITE_FLUSH();
     ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:904:4: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
      ew32(IMC, ~mask & 0x00007FFF);
--
   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.h:992:26: warning: Paramet=
er 'mac' can be declared with const [constParameter]
         __le16 *fw_lo, u8 *mac)
                            ^
>> drivers/net/ethernet/broadcom/bnx2x/bnx2x_ethtool.c:1664:65: warning: Pa=
rameter 'data_buf' can be declared with const [constParameter]
   static int bnx2x_nvram_write1(struct bnx2x *bp, u32 offset, u8 *data_buf,
                                                                   ^
>> drivers/net/ethernet/broadcom/bnx2x/bnx2x_ethtool.c:2189:31: warning: Sh=
ifting signed 32-bit value by 31 bits is implementation-defined behaviour [=
shiftTooManyBitsSigned]
     bp->link_params.eee_mode |=3D EEE_MODE_ADV_LPI;
                                 ^
   drivers/net/ethernet/broadcom/bnx2x/bnx2x_ethtool.c:2191:32: warning: Sh=
ifting signed 32-bit value by 31 bits is implementation-defined behaviour [=
shiftTooManyBitsSigned]
     bp->link_params.eee_mode &=3D ~EEE_MODE_ADV_LPI;
                                  ^
>> drivers/net/ethernet/broadcom/bnx2x/bnx2x_ethtool.c:2189:31: warning: Si=
gned integer overflow for expression '1<<31'. [integerOverflow]
     bp->link_params.eee_mode |=3D EEE_MODE_ADV_LPI;
                                 ^
   drivers/net/ethernet/broadcom/bnx2x/bnx2x_ethtool.c:2191:32: warning: Si=
gned integer overflow for expression '1<<31'. [integerOverflow]
     bp->link_params.eee_mode &=3D ~EEE_MODE_ADV_LPI;
                                  ^
   drivers/net/ethernet/broadcom/bnx2x/bnx2x_ethtool.c:2620:3: warning: Sig=
ned integer overflow for expression '0x3<<30'. [integerOverflow]
     SET_FLAG(parsing_data,
     ^
--
>> drivers/net/ethernet/amazon/ena/ena_netdev.c:1262:28: warning: Parameter=
 'tx_info' can be declared with const [constParameter]
        struct ena_tx_buffer *tx_info, bool is_xdp)
                              ^
   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.h:992:26: warning: Paramet=
er 'mac' can be declared with const [constParameter]
         __le16 *fw_lo, u8 *mac)
                            ^
>> drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:4598:4: warning: Divisio=
n by result of sizeof(). memset() expects a size in bytes, did you intend t=
o multiply instead? [sizeofDivisionMemfunc]
      BNX2X_PCI_FALLOC(&bnx2x_fp(bp, index, rx_comp_mapping),
      ^
>> drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:4014:3: warning: Signed =
integer overflow for expression '0x3<<30'. [integerOverflow]
     SET_FLAG(pbd_e2_parsing_data,
     ^
--
>> drivers/net/ethernet/broadcom/bnx2.c:1982:12: warning: Shifting signed 3=
2-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBit=
sSigned]
    if (msg & BNX2_LINK_STATUS_HEART_BEAT_EXPIRED)
              ^
   drivers/net/ethernet/broadcom/bnx2.c:1985:10: warning: Shifting signed 3=
2-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBit=
sSigned]
    msg &=3D ~BNX2_LINK_STATUS_HEART_BEAT_EXPIRED;
            ^
   drivers/net/ethernet/broadcom/bnx2.c:3266:12: warning: Shifting signed 3=
2-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBit=
sSigned]
              L2_FHDR_ERRORS_UDP_XSUM)) =3D=3D 0))
              ^
>> drivers/net/ethernet/broadcom/bnx2.c:1982:12: warning: Signed integer ov=
erflow for expression '1<<31'. [integerOverflow]
    if (msg & BNX2_LINK_STATUS_HEART_BEAT_EXPIRED)
              ^
   drivers/net/ethernet/broadcom/bnx2.c:1985:10: warning: Signed integer ov=
erflow for expression '1<<31'. [integerOverflow]
    msg &=3D ~BNX2_LINK_STATUS_HEART_BEAT_EXPIRED;
            ^
   drivers/net/ethernet/broadcom/bnx2.c:3266:12: warning: Signed integer ov=
erflow for expression '1<<31'. [integerOverflow]
              L2_FHDR_ERRORS_UDP_XSUM)) =3D=3D 0))
              ^

vim +/data +191 drivers/iommu/iommu.c

5fa9e7c5fa50f2 Joerg Roedel 2019-08-19  190  =

57365a04c92126 Robin Murphy 2022-08-15 @191  static int remove_iommu_group(=
struct device *dev, void *data)
57365a04c92126 Robin Murphy 2022-08-15  192  {
57365a04c92126 Robin Murphy 2022-08-15  193  	if (dev->iommu && dev->iommu-=
>iommu_dev =3D=3D data)
57365a04c92126 Robin Murphy 2022-08-15  194  		iommu_release_device(dev);
57365a04c92126 Robin Murphy 2022-08-15  195  =

57365a04c92126 Robin Murphy 2022-08-15  196  	return 0;
57365a04c92126 Robin Murphy 2022-08-15  197  }
57365a04c92126 Robin Murphy 2022-08-15  198  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0951526138080251104==--

