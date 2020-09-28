Content-Type: multipart/mixed; boundary="===============8299568859936400262=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/cdrom/cdrom.c:2337:9: warning: Identical condition 'ret', second condition is always false
Date: Mon, 28 Sep 2020 09:26:21 +0800
Message-ID: <202009280945.qC2lVZgs%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8299568859936400262==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Jens Axboe <axboe@kernel.dk>
CC: Damien Le Moal <damien.lemoal@wdc.com>
CC: Hannes Reinecke <hare@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a1b8638ba1320e6684aa98233c15255eb803fac7
commit: eaf8e3e4b54a8b778257fc3921ad8f793c941882 cdrom: factor out a cdrom_=
multisession helper
date:   5 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 5 months ago
compiler: sh4-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/iio/dac/ad5755.c:750:9: warning: Variable 'pdata' is reassigned =
a value before the old one has been used. [redundantAssignment]
     pdata =3D ad5755_parse_dt(&spi->dev);
           ^
   drivers/iio/dac/ad5755.c:725:0: note: Variable 'pdata' is reassigned a v=
alue before the old one has been used.
    const struct ad5755_platform_data *pdata =3D dev_get_platdata(&spi->dev=
);
   ^
   drivers/iio/dac/ad5755.c:750:9: note: Variable 'pdata' is reassigned a v=
alue before the old one has been used.
     pdata =3D ad5755_parse_dt(&spi->dev);
           ^
--
>> drivers/cdrom/cdrom.c:2337:9: warning: Identical condition 'ret', second=
 condition is always false [identicalConditionAfterEarlyExit]
    return ret;
           ^
   drivers/cdrom/cdrom.c:2331:6: note: first condition
    if (ret)
        ^
   drivers/cdrom/cdrom.c:2337:9: note: second condition
    return ret;
           ^
>> drivers/cdrom/cdrom.c:1182:8: warning: Variable 'ret' is reassigned a va=
lue before the old one has been used. [redundantAssignment]
      ret =3D 0;
          ^
   drivers/cdrom/cdrom.c:1177:8: note: Variable 'ret' is reassigned a value=
 before the old one has been used.
      ret =3D -EROFS;
          ^
   drivers/cdrom/cdrom.c:1182:8: note: Variable 'ret' is reassigned a value=
 before the old one has been used.
      ret =3D 0;
          ^
>> drivers/mmc/host/usdhi6rol0.c:1120:17: warning: Boolean result is used i=
n bitwise operation. Clarify expression with parentheses. [clarifyCondition]
    return !status ^ !(mmc->caps2 & MMC_CAP2_CD_ACTIVE_HIGH);
                   ^
   drivers/mmc/host/usdhi6rol0.c:1136:17: warning: Boolean result is used i=
n bitwise operation. Clarify expression with parentheses. [clarifyCondition]
    return !status ^ !(mmc->caps2 & MMC_CAP2_RO_ACTIVE_HIGH);
                   ^
>> fs/freevxfs/vxfs_super.c:167:6: warning: Variable 'rc' is reassigned a v=
alue before the old one has been used. [redundantAssignment]
     rc =3D -EINVAL;
        ^
   fs/freevxfs/vxfs_super.c:154:0: note: Variable 'rc' is reassigned a valu=
e before the old one has been used.
    int rc =3D -ENOMEM;
   ^
   fs/freevxfs/vxfs_super.c:167:6: note: Variable 'rc' is reassigned a valu=
e before the old one has been used.
     rc =3D -EINVAL;
        ^
   fs/freevxfs/vxfs_super.c:177:6: warning: Variable 'rc' is reassigned a v=
alue before the old one has been used. [redundantAssignment]
     rc =3D 0;
        ^
   fs/freevxfs/vxfs_super.c:167:6: note: Variable 'rc' is reassigned a valu=
e before the old one has been used.
     rc =3D -EINVAL;
        ^
   fs/freevxfs/vxfs_super.c:177:6: note: Variable 'rc' is reassigned a valu=
e before the old one has been used.
     rc =3D 0;
        ^
--
>> drivers/iio/adc/ti-ads7950.c:449:6: warning: Variable 'ret' is reassigne=
d a value before the old one has been used. [redundantAssignment]
    ret =3D spi_sync(st->spi, &st->scan_single_msg);
        ^
   drivers/iio/adc/ti-ads7950.c:444:6: note: Variable 'ret' is reassigned a=
 value before the old one has been used.
    ret =3D ((st->single_rx >> 12) & BIT(offset)) ? 1 : 0;
        ^
   drivers/iio/adc/ti-ads7950.c:449:6: note: Variable 'ret' is reassigned a=
 value before the old one has been used.
    ret =3D spi_sync(st->spi, &st->scan_single_msg);
        ^
>> sound/soc/codecs/tscs454.c:740:37: warning: Same value in both branches =
of ternary operator. [duplicateValueTernary]
     val =3D pll1 ? FV_PLL1CLKEN_DISABLE : FV_PLL2CLKEN_DISABLE;
                                       ^
>> drivers/mtd/sm_ftl.c:281:6: warning: Variable 'ret' is reassigned a valu=
e before the old one has been used. [redundantAssignment]
    ret =3D mtd_read_oob(mtd, sm_mkoffset(ftl, zone, block, boffset), &ops);
        ^
   drivers/mtd/sm_ftl.c:245:0: note: Variable 'ret' is reassigned a value b=
efore the old one has been used.
    int ret =3D -EIO;
   ^
   drivers/mtd/sm_ftl.c:281:6: note: Variable 'ret' is reassigned a value b=
efore the old one has been used.
    ret =3D mtd_read_oob(mtd, sm_mkoffset(ftl, zone, block, boffset), &ops);
        ^
>> drivers/mtd/devices/phram.c:100:6: warning: Variable 'ret' is reassigned=
 a value before the old one has been used. [redundantAssignment]
    ret =3D -EIO;
        ^
   drivers/mtd/devices/phram.c:94:0: note: Variable 'ret' is reassigned a v=
alue before the old one has been used.
    int ret =3D -ENOMEM;
   ^
   drivers/mtd/devices/phram.c:100:6: note: Variable 'ret' is reassigned a =
value before the old one has been used.
    ret =3D -EIO;
        ^
   drivers/mtd/devices/phram.c:121:6: warning: Variable 'ret' is reassigned=
 a value before the old one has been used. [redundantAssignment]
    ret =3D -EAGAIN;
        ^
   drivers/mtd/devices/phram.c:100:6: note: Variable 'ret' is reassigned a =
value before the old one has been used.
    ret =3D -EIO;
        ^
   drivers/mtd/devices/phram.c:121:6: note: Variable 'ret' is reassigned a =
value before the old one has been used.
    ret =3D -EAGAIN;
        ^
--
>> net/x25/x25_proc.c:52:5: warning: Variable 'rt' is reassigned a value be=
fore the old one has been used. [redundantAssignment]
    rt =3D v;
       ^
   net/x25/x25_proc.c:45:0: note: Variable 'rt' is reassigned a value befor=
e the old one has been used.
    struct x25_route *rt =3D list_entry(v, struct x25_route, node);
   ^
   net/x25/x25_proc.c:52:5: note: Variable 'rt' is reassigned a value befor=
e the old one has been used.
    rt =3D v;
       ^
>> net/x25/x25_proc.c:140:4: warning: Variable 'f' is reassigned a value be=
fore the old one has been used. [redundantAssignment]
    f =3D v;
      ^
   net/x25/x25_proc.c:133:0: note: Variable 'f' is reassigned a value befor=
e the old one has been used.
    struct x25_forward *f =3D list_entry(v, struct x25_forward, node);
   ^
   net/x25/x25_proc.c:140:4: note: Variable 'f' is reassigned a value befor=
e the old one has been used.
    f =3D v;
      ^
--
>> drivers/nfc/st-nci/spi.c:223:34: warning: Either the condition '!dev' is=
 redundant or there is possible null pointer dereference: dev. [nullPointer=
RedundantCheck]
    dev_dbg(&dev->dev, "IRQ: %dn", dev->irq);
                                    ^
   drivers/nfc/st-nci/spi.c:226:6: note: Assuming that condition '!dev' is =
not redundant
    if (!dev) {
        ^
   drivers/nfc/st-nci/spi.c:223:34: note: Null pointer dereference
    dev_dbg(&dev->dev, "IRQ: %dn", dev->irq);
                                    ^
--
>> drivers/nfc/pn533/usb.c:548:5: warning: Variable 'rc' is reassigned a va=
lue before the old one has been used. 'break;' missing? [redundantAssignInS=
witch]
    rc =3D pn533_finalize_setup(priv);
       ^
   drivers/nfc/pn533/usb.c:451:0: note: Variable 'rc' is reassigned a value=
 before the old one has been used. 'break;' missing?
    int rc =3D -ENOMEM;
   ^
   drivers/nfc/pn533/usb.c:548:5: note: Variable 'rc' is reassigned a value=
 before the old one has been used. 'break;' missing?
    rc =3D pn533_finalize_setup(priv);
       ^
--
>> drivers/mtd/nand/raw/diskonchip.c:433:23: warning: Variable 'doc->chips_=
per_floor' is reassigned a value before the old one has been used. [redunda=
ntAssignment]
    doc->chips_per_floor =3D i;
                         ^
   drivers/mtd/nand/raw/diskonchip.c:423:23: note: Variable 'doc->chips_per=
_floor' is reassigned a value before the old one has been used.
    doc->chips_per_floor =3D 4;
                         ^
   drivers/mtd/nand/raw/diskonchip.c:433:23: note: Variable 'doc->chips_per=
_floor' is reassigned a value before the old one has been used.
    doc->chips_per_floor =3D i;
                         ^
>> drivers/mtd/nand/raw/diskonchip.c:894:9: warning: Variable 'dummy' is re=
assigned a value before the old one has been used. [redundantAssignment]
     dummy =3D ReadDOC(docptr, 2k_ECCStatus);
           ^
   drivers/mtd/nand/raw/diskonchip.c:893:9: note: Variable 'dummy' is reass=
igned a value before the old one has been used.
     dummy =3D ReadDOC(docptr, 2k_ECCStatus);
           ^
   drivers/mtd/nand/raw/diskonchip.c:894:9: note: Variable 'dummy' is reass=
igned a value before the old one has been used.
     dummy =3D ReadDOC(docptr, 2k_ECCStatus);
           ^
   drivers/mtd/nand/raw/diskonchip.c:895:9: warning: Variable 'dummy' is re=
assigned a value before the old one has been used. [redundantAssignment]
     dummy =3D ReadDOC(docptr, 2k_ECCStatus);
           ^
   drivers/mtd/nand/raw/diskonchip.c:894:9: note: Variable 'dummy' is reass=
igned a value before the old one has been used.
     dummy =3D ReadDOC(docptr, 2k_ECCStatus);
           ^
   drivers/mtd/nand/raw/diskonchip.c:895:9: note: Variable 'dummy' is reass=
igned a value before the old one has been used.
     dummy =3D ReadDOC(docptr, 2k_ECCStatus);
           ^
   drivers/mtd/nand/raw/diskonchip.c:898:9: warning: Variable 'dummy' is re=
assigned a value before the old one has been used. [redundantAssignment]
     dummy =3D ReadDOC(docptr, Mplus_ECCConf);
           ^
   drivers/mtd/nand/raw/diskonchip.c:897:9: note: Variable 'dummy' is reass=
igned a value before the old one has been used.
     dummy =3D ReadDOC(docptr, Mplus_ECCConf);
           ^
   drivers/mtd/nand/raw/diskonchip.c:898:9: note: Variable 'dummy' is reass=
igned a value before the old one has been used.
     dummy =3D ReadDOC(docptr, Mplus_ECCConf);
           ^
   drivers/mtd/nand/raw/diskonchip.c:899:9: warning: Variable 'dummy' is re=
assigned a value before the old one has been used. [redundantAssignment]
     dummy =3D ReadDOC(docptr, Mplus_ECCConf);
           ^
   drivers/mtd/nand/raw/diskonchip.c:898:9: note: Variable 'dummy' is reass=
igned a value before the old one has been used.
     dummy =3D ReadDOC(docptr, Mplus_ECCConf);
           ^
   drivers/mtd/nand/raw/diskonchip.c:899:9: note: Variable 'dummy' is reass=
igned a value before the old one has been used.
     dummy =3D ReadDOC(docptr, Mplus_ECCConf);
           ^
   drivers/mtd/nand/raw/diskonchip.c:902:9: warning: Variable 'dummy' is re=
assigned a value before the old one has been used. [redundantAssignment]
     dummy =3D ReadDOC(docptr, ECCConf);
           ^
   drivers/mtd/nand/raw/diskonchip.c:901:9: note: Variable 'dummy' is reass=
igned a value before the old one has been used.
     dummy =3D ReadDOC(docptr, ECCConf);
           ^
   drivers/mtd/nand/raw/diskonchip.c:902:9: note: Variable 'dummy' is reass=
igned a value before the old one has been used.
     dummy =3D ReadDOC(docptr, ECCConf);
           ^
   drivers/mtd/nand/raw/diskonchip.c:903:9: warning: Variable 'dummy' is re=
assigned a value before the old one has been used. [redundantAssignment]
     dummy =3D ReadDOC(docptr, ECCConf);
           ^
   drivers/mtd/nand/raw/diskonchip.c:902:9: note: Variable 'dummy' is reass=
igned a value before the old one has been used.
     dummy =3D ReadDOC(docptr, ECCConf);
           ^
   drivers/mtd/nand/raw/diskonchip.c:903:9: note: Variable 'dummy' is reass=
igned a value before the old one has been used.
     dummy =3D ReadDOC(docptr, ECCConf);
           ^
>> drivers/mtd/nand/raw/diskonchip.c:195:17: warning: Shifting a negative v=
alue is technically undefined behaviour [shiftNegativeLHS]
      index =3D (pos >> 3) ^ 1;
                   ^
   drivers/mtd/nand/raw/diskonchip.c:203:18: warning: Shifting a negative v=
alue is technically undefined behaviour [shiftNegativeLHS]
      index =3D ((pos >> 3) + 1) ^ 1;
                    ^
   drivers/mtd/ubi/ubi.h:1077:18: warning: Either the condition 'buf' is re=
dundant or there is pointer arithmetic with NULL pointer. [nullPointerArith=
meticRedundantCheck]
    vidb->hdr =3D buf + ubi->vid_hdr_shift;
                    ^
   drivers/mtd/ubi/ubi.h:1073:6: note: Assuming that condition 'buf' is not=
 redundant
    if (buf)
        ^
   drivers/mtd/ubi/ubi.h:1077:18: note: Null pointer addition
    vidb->hdr =3D buf + ubi->vid_hdr_shift;
                    ^
>> drivers/mtd/ubi/cdev.c:452:7: warning: Variable 'err' is reassigned a va=
lue before the old one has been used. [redundantAssignment]
     err =3D get_exclusive(desc);
         ^
   drivers/mtd/ubi/cdev.c:447:7: note: Variable 'err' is reassigned a value=
 before the old one has been used.
     err =3D -EINVAL;
         ^
   drivers/mtd/ubi/cdev.c:452:7: note: Variable 'err' is reassigned a value=
 before the old one has been used.
     err =3D get_exclusive(desc);
         ^
>> drivers/mtd/nftlmount.c:291:6: warning: Variable 'ret' is reassigned a v=
alue before the old one has been used. [redundantAssignment]
    ret =3D 0;
        ^
   drivers/mtd/nftlmount.c:274:6: note: Variable 'ret' is reassigned a valu=
e before the old one has been used.
    ret =3D -1;
        ^
   drivers/mtd/nftlmount.c:291:6: note: Variable 'ret' is reassigned a valu=
e before the old one has been used.
    ret =3D 0;
        ^
>> drivers/mtd/inftlmount.c:352:6: warning: Variable 'ret' is reassigned a =
value before the old one has been used. [redundantAssignment]
    ret =3D 0;
        ^
   drivers/mtd/inftlmount.c:335:6: note: Variable 'ret' is reassigned a val=
ue before the old one has been used.
    ret =3D -1;
        ^
   drivers/mtd/inftlmount.c:352:6: note: Variable 'ret' is reassigned a val=
ue before the old one has been used.
    ret =3D 0;
        ^
>> drivers/mtd/inftlmount.c:715:21: warning: Variable 'logical_block' is re=
assigned a value before the old one has been used. [redundantAssignment]
    for (logical_block =3D 0; logical_block < s->numvunits; logical_block++=
) {
                       ^
   drivers/mtd/inftlmount.c:557:16: note: Variable 'logical_block' is reass=
igned a value before the old one has been used.
    logical_block =3D block =3D BLOCK_NIL;
                  ^
   drivers/mtd/inftlmount.c:715:21: note: Variable 'logical_block' is reass=
igned a value before the old one has been used.
    for (logical_block =3D 0; logical_block < s->numvunits; logical_block++=
) {
                       ^
>> drivers/target/loopback/tcm_loop.c:1176:6: warning: Variable 'ret' is re=
assigned a value before the old one has been used. [redundantAssignment]
    ret =3D tcm_loop_alloc_core_bus();
        ^
   drivers/target/loopback/tcm_loop.c:1161:0: note: Variable 'ret' is reass=
igned a value before the old one has been used.
    int ret =3D -ENOMEM;
   ^
   drivers/target/loopback/tcm_loop.c:1176:6: note: Variable 'ret' is reass=
igned a value before the old one has been used.
    ret =3D tcm_loop_alloc_core_bus();
        ^
>> drivers/target/loopback/tcm_loop.c:104:23: warning: Local variable tl_tp=
g shadows outer function [shadowFunction]
    struct tcm_loop_tpg *tl_tpg;
                         ^
   drivers/target/loopback/tcm_loop.c:448:36: note: Shadowed declaration
   static inline struct tcm_loop_tpg *tl_tpg(struct se_portal_group *se_tpg)
                                      ^
   drivers/target/loopback/tcm_loop.c:104:23: note: Shadow variable
    struct tcm_loop_tpg *tl_tpg;
                         ^
   drivers/target/loopback/tcm_loop.c:241:23: warning: Local variable tl_tp=
g shadows outer function [shadowFunction]
    struct tcm_loop_tpg *tl_tpg;
                         ^
   drivers/target/loopback/tcm_loop.c:448:36: note: Shadowed declaration
   static inline struct tcm_loop_tpg *tl_tpg(struct se_portal_group *se_tpg)
                                      ^
   drivers/target/loopback/tcm_loop.c:241:23: note: Shadow variable
    struct tcm_loop_tpg *tl_tpg;
                         ^
   drivers/target/loopback/tcm_loop.c:261:23: warning: Local variable tl_tp=
g shadows outer function [shadowFunction]
    struct tcm_loop_tpg *tl_tpg;
                         ^
   drivers/target/loopback/tcm_loop.c:448:36: note: Shadowed declaration
   static inline struct tcm_loop_tpg *tl_tpg(struct se_portal_group *se_tpg)
                                      ^
   drivers/target/loopback/tcm_loop.c:261:23: note: Shadow variable
    struct tcm_loop_tpg *tl_tpg;
                         ^
   drivers/target/loopback/tcm_loop.c:278:23: warning: Local variable tl_tp=
g shadows outer function [shadowFunction]
    struct tcm_loop_tpg *tl_tpg;
                         ^
   drivers/target/loopback/tcm_loop.c:448:36: note: Shadowed declaration
   static inline struct tcm_loop_tpg *tl_tpg(struct se_portal_group *se_tpg)
                                      ^
   drivers/target/loopback/tcm_loop.c:278:23: note: Shadow variable
    struct tcm_loop_tpg *tl_tpg;
                         ^
   drivers/target/loopback/tcm_loop.c:505:23: warning: Local variable tl_tp=
g shadows outer function [shadowFunction]
    struct tcm_loop_tpg *tl_tpg =3D container_of(se_tpg, struct tcm_loop_tp=
g,
                         ^
   drivers/target/loopback/tcm_loop.c:448:36: note: Shadowed declaration
   static inline struct tcm_loop_tpg *tl_tpg(struct se_portal_group *se_tpg)
                                      ^
   drivers/target/loopback/tcm_loop.c:505:23: note: Shadow variable
    struct tcm_loop_tpg *tl_tpg =3D container_of(se_tpg, struct tcm_loop_tp=
g,
                         ^
   drivers/target/loopback/tcm_loop.c:630:23: warning: Local variable tl_tp=
g shadows outer function [shadowFunction]
    struct tcm_loop_tpg *tl_tpg =3D container_of(se_tpg,
                         ^
   drivers/target/loopback/tcm_loop.c:448:36: note: Shadowed declaration
   static inline struct tcm_loop_tpg *tl_tpg(struct se_portal_group *se_tpg)
                                      ^
   drivers/target/loopback/tcm_loop.c:630:23: note: Shadow variable
    struct tcm_loop_tpg *tl_tpg =3D container_of(se_tpg,
                         ^
   drivers/target/loopback/tcm_loop.c:650:23: warning: Local variable tl_tp=
g shadows outer function [shadowFunction]
    struct tcm_loop_tpg *tl_tpg;
                         ^
   drivers/target/loopback/tcm_loop.c:448:36: note: Shadowed declaration
   static inline struct tcm_loop_tpg *tl_tpg(struct se_portal_group *se_tpg)
                                      ^
   drivers/target/loopback/tcm_loop.c:650:23: note: Shadow variable
    struct tcm_loop_tpg *tl_tpg;
                         ^
   drivers/target/loopback/tcm_loop.c:679:23: warning: Local variable tl_tp=
g shadows outer function [shadowFunction]
    struct tcm_loop_tpg *tl_tpg =3D container_of(se_tpg, struct tcm_loop_tp=
g,
                         ^
   drivers/target/loopback/tcm_loop.c:448:36: note: Shadowed declaration
   static inline struct tcm_loop_tpg *tl_tpg(struct se_portal_group *se_tpg)
                                      ^
   drivers/target/loopback/tcm_loop.c:679:23: note: Shadow variable
    struct tcm_loop_tpg *tl_tpg =3D container_of(se_tpg, struct tcm_loop_tp=
g,
                         ^
   drivers/target/loopback/tcm_loop.c:689:23: warning: Local variable tl_tp=
g shadows outer function [shadowFunction]
    struct tcm_loop_tpg *tl_tpg =3D container_of(se_tpg, struct tcm_loop_tp=
g,
                         ^
   drivers/target/loopback/tcm_loop.c:448:36: note: Shadowed declaration
   static inline struct tcm_loop_tpg *tl_tpg(struct se_portal_group *se_tpg)
                                      ^
   drivers/target/loopback/tcm_loop.c:689:23: note: Shadow variable
    struct tcm_loop_tpg *tl_tpg =3D container_of(se_tpg, struct tcm_loop_tp=
g,
                         ^
   drivers/target/loopback/tcm_loop.c:719:23: warning: Local variable tl_tp=
g shadows outer function [shadowFunction]
    struct tcm_loop_tpg *tl_tpg =3D container_of(se_tpg,
                         ^
   drivers/target/loopback/tcm_loop.c:448:36: note: Shadowed declaration
   static inline struct tcm_loop_tpg *tl_tpg(struct se_portal_group *se_tpg)
                                      ^
   drivers/target/loopback/tcm_loop.c:719:23: note: Shadow variable
    struct tcm_loop_tpg *tl_tpg =3D container_of(se_tpg,
                         ^
   drivers/target/loopback/tcm_loop.c:794:23: warning: Local variable tl_tp=
g shadows outer function [shadowFunction]
    struct tcm_loop_tpg *tl_tpg =3D container_of(se_tpg,
                         ^
   drivers/target/loopback/tcm_loop.c:448:36: note: Shadowed declaration
   static inline struct tcm_loop_tpg *tl_tpg(struct se_portal_group *se_tpg)
                                      ^
   drivers/target/loopback/tcm_loop.c:794:23: note: Shadow variable
    struct tcm_loop_tpg *tl_tpg =3D container_of(se_tpg,
                         ^
   drivers/target/loopback/tcm_loop.c:813:23: warning: Local variable tl_tp=
g shadows outer function [shadowFunction]
    struct tcm_loop_tpg *tl_tpg =3D container_of(se_tpg,
--
>> drivers/usb/gadget/udc/mv_udc_core.c:1316:48: warning: Uninitialized var=
iable: ep [uninitvar]
    list_for_each_entry(ep, &udc->gadget.ep_list, ep.ep_list) {
                                                  ^
   drivers/usb/gadget/udc/mv_udc_core.c:1334:48: warning: Uninitialized var=
iable: ep [uninitvar]
    list_for_each_entry(ep, &udc->gadget.ep_list, ep.ep_list) {
                                                  ^
>> drivers/scsi/scsi_transport_iscsi.c:3175:7: warning: Variable 'err' is r=
eassigned a value before the old one has been used. [redundantAssignment]
     err =3D iscsi_multicast_skb(skbchap, ISCSI_NL_GRP_ISCSID,
         ^
   drivers/scsi/scsi_transport_iscsi.c:3168:7: note: Variable 'err' is reas=
signed a value before the old one has been used.
     err =3D transport->get_chap(shost, ev->u.get_chap.chap_tbl_idx,
         ^
   drivers/scsi/scsi_transport_iscsi.c:3175:7: note: Variable 'err' is reas=
signed a value before the old one has been used.
     err =3D iscsi_multicast_skb(skbchap, ISCSI_NL_GRP_ISCSID,
         ^
>> drivers/video/backlight/l4f00242t03.c:158:18: warning: Variable 'priv->l=
cd_state' is reassigned a value before the old one has been used. [redundan=
tAssignment]
    priv->lcd_state =3D power;
                    ^
   drivers/video/backlight/l4f00242t03.c:145:20: note: Variable 'priv->lcd_=
state' is reassigned a value before the old one has been used.
      priv->lcd_state =3D FB_BLANK_UNBLANK;
                      ^
   drivers/video/backlight/l4f00242t03.c:158:18: note: Variable 'priv->lcd_=
state' is reassigned a value before the old one has been used.
    priv->lcd_state =3D power;
                    ^
--
>> drivers/usb/gadget/udc/fusb300_udc.c:1225:17: warning: Shifting signed 3=
2-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    if (int_grp1 & FUSB300_IGR1_INTGRP5)
                   ^
--
>> drivers/scsi/ses.c:53:6: warning: Variable 'err' is reassigned a value b=
efore the old one has been used. [redundantAssignment]
    err =3D 0;
        ^
   drivers/scsi/ses.c:48:0: note: Variable 'err' is reassigned a value befo=
re the old one has been used.
    int err =3D -ENODEV;
   ^
   drivers/scsi/ses.c:53:6: note: Variable 'err' is reassigned a value befo=
re the old one has been used.
    err =3D 0;
        ^
>> net/netfilter/xt_addrtype.c:151:55: warning: Boolean result is used in b=
itwise operation. Clarify expression with parentheses. [clarifyCondition]
     ret &=3D match_type(net, dev, iph->daddr, info->dest) ^
                                                         ^
--
>> sound/soc/codecs/cs35l32.c:416:6: warning: Variable 'ret' is reassigned =
a value before the old one has been used. [redundantAssignment]
    ret =3D regmap_read(cs35l32->regmap, CS35L32_DEVID_CD, &reg);
        ^
   sound/soc/codecs/cs35l32.c:413:6: note: Variable 'ret' is reassigned a v=
alue before the old one has been used.
    ret =3D regmap_read(cs35l32->regmap, CS35L32_DEVID_AB, &reg);
        ^
   sound/soc/codecs/cs35l32.c:416:6: note: Variable 'ret' is reassigned a v=
alue before the old one has been used.
    ret =3D regmap_read(cs35l32->regmap, CS35L32_DEVID_CD, &reg);
        ^
   sound/soc/codecs/cs35l32.c:419:6: warning: Variable 'ret' is reassigned =
a value before the old one has been used. [redundantAssignment]
    ret =3D regmap_read(cs35l32->regmap, CS35L32_DEVID_E, &reg);
        ^
   sound/soc/codecs/cs35l32.c:416:6: note: Variable 'ret' is reassigned a v=
alue before the old one has been used.
    ret =3D regmap_read(cs35l32->regmap, CS35L32_DEVID_CD, &reg);
        ^
   sound/soc/codecs/cs35l32.c:419:6: note: Variable 'ret' is reassigned a v=
alue before the old one has been used.
    ret =3D regmap_read(cs35l32->regmap, CS35L32_DEVID_E, &reg);
        ^
   sound/soc/codecs/cs35l32.c:430:6: warning: Variable 'ret' is reassigned =
a value before the old one has been used. [redundantAssignment]
    ret =3D regmap_read(cs35l32->regmap, CS35L32_REV_ID, &reg);
        ^
   sound/soc/codecs/cs35l32.c:419:6: note: Variable 'ret' is reassigned a v=
alue before the old one has been used.
    ret =3D regmap_read(cs35l32->regmap, CS35L32_DEVID_E, &reg);
        ^
   sound/soc/codecs/cs35l32.c:430:6: note: Variable 'ret' is reassigned a v=
alue before the old one has been used.
    ret =3D regmap_read(cs35l32->regmap, CS35L32_REV_ID, &reg);
        ^
   sound/soc/codecs/cs35l32.c:483:6: warning: Variable 'ret' is reassigned =
a value before the old one has been used. [redundantAssignment]
    ret =3D devm_snd_soc_register_component(&i2c_client->dev,
        ^
   sound/soc/codecs/cs35l32.c:481:6: note: Variable 'ret' is reassigned a v=
alue before the old one has been used.
    ret =3D regmap_read(cs35l32->regmap, CS35L32_INT_STATUS_1, &reg);
        ^
   sound/soc/codecs/cs35l32.c:483:6: note: Variable 'ret' is reassigned a v=
alue before the old one has been used.
    ret =3D devm_snd_soc_register_component(&i2c_client->dev,
        ^
--
>> drivers/leds/leds-da9052.c:142:8: warning: Variable 'error' is reassigne=
d a value before the old one has been used. [redundantAssignment]
    error =3D da9052_configure_leds(led->da9052);
          ^
   drivers/leds/leds-da9052.c:95:0: note: Variable 'error' is reassigned a =
value before the old one has been used.
    int error =3D -ENODEV;
   ^
   drivers/leds/leds-da9052.c:142:8: note: Variable 'error' is reassigned a=
 value before the old one has been used.
    error =3D da9052_configure_leds(led->da9052);
          ^
--
>> kernel/power/swap.c:1033:9: warning: Identical condition 'error', second=
 condition is always false [identicalConditionAfterEarlyExit]
    return error;
           ^
   kernel/power/swap.c:1020:6: note: first condition
    if (error)
        ^
   kernel/power/swap.c:1033:9: note: second condition
    return error;
           ^
>> fs/verity/enable.c:191:6: warning: Variable 'err' is reassigned a value =
before the old one has been used. [redundantAssignment]
    err =3D 0;
        ^
   fs/verity/enable.c:160:0: note: Variable 'err' is reassigned a value bef=
ore the old one has been used.
    int err =3D -ENOMEM;
   ^
   fs/verity/enable.c:191:6: note: Variable 'err' is reassigned a value bef=
ore the old one has been used.
    err =3D 0;
        ^
--
>> sound/soc/codecs/cs35l33.c:1195:6: warning: Variable 'ret' is reassigned=
 a value before the old one has been used. [redundantAssignment]
    ret =3D regmap_read(cs35l33->regmap, CS35L33_DEVID_CD, &reg);
        ^
   sound/soc/codecs/cs35l33.c:1193:6: note: Variable 'ret' is reassigned a =
value before the old one has been used.
    ret =3D regmap_read(cs35l33->regmap, CS35L33_DEVID_AB, &reg);
        ^
   sound/soc/codecs/cs35l33.c:1195:6: note: Variable 'ret' is reassigned a =
value before the old one has been used.
    ret =3D regmap_read(cs35l33->regmap, CS35L33_DEVID_CD, &reg);
        ^
   sound/soc/codecs/cs35l33.c:1197:6: warning: Variable 'ret' is reassigned=
 a value before the old one has been used. [redundantAssignment]
    ret =3D regmap_read(cs35l33->regmap, CS35L33_DEVID_E, &reg);
        ^
   sound/soc/codecs/cs35l33.c:1195:6: note: Variable 'ret' is reassigned a =
value before the old one has been used.
    ret =3D regmap_read(cs35l33->regmap, CS35L33_DEVID_CD, &reg);
        ^
   sound/soc/codecs/cs35l33.c:1197:6: note: Variable 'ret' is reassigned a =
value before the old one has been used.
    ret =3D regmap_read(cs35l33->regmap, CS35L33_DEVID_E, &reg);
        ^
   sound/soc/codecs/cs35l33.c:1207:6: warning: Variable 'ret' is reassigned=
 a value before the old one has been used. [redundantAssignment]
    ret =3D regmap_read(cs35l33->regmap, CS35L33_REV_ID, &reg);
        ^
   sound/soc/codecs/cs35l33.c:1197:6: note: Variable 'ret' is reassigned a =
value before the old one has been used.
    ret =3D regmap_read(cs35l33->regmap, CS35L33_DEVID_E, &reg);
        ^
   sound/soc/codecs/cs35l33.c:1207:6: note: Variable 'ret' is reassigned a =
value before the old one has been used.
    ret =3D regmap_read(cs35l33->regmap, CS35L33_REV_ID, &reg);
        ^
>> net/netfilter/xt_conntrack.c:83:44: warning: Boolean result is used in b=
itwise operation. Clarify expression with parentheses. [clarifyCondition]
        (nf_ct_protonum(ct) =3D=3D info->l4proto) ^
                                              ^
   net/netfilter/xt_conntrack.c:89:47: warning: Boolean result is used in b=
itwise operation. Clarify expression with parentheses. [clarifyCondition]
        (tuple->src.u.all =3D=3D info->origsrc_port) ^
                                                 ^
   net/netfilter/xt_conntrack.c:94:47: warning: Boolean result is used in b=
itwise operation. Clarify expression with parentheses. [clarifyCondition]
        (tuple->dst.u.all =3D=3D info->origdst_port) ^
                                                 ^
   net/netfilter/xt_conntrack.c:101:47: warning: Boolean result is used in =
bitwise operation. Clarify expression with parentheses. [clarifyCondition]
        (tuple->src.u.all =3D=3D info->replsrc_port) ^
                                                 ^
   net/netfilter/xt_conntrack.c:106:47: warning: Boolean result is used in =
bitwise operation. Clarify expression with parentheses. [clarifyCondition]
        (tuple->dst.u.all =3D=3D info->repldst_port) ^
                                                 ^
   net/netfilter/xt_conntrack.c:127:44: warning: Boolean result is used in =
bitwise operation. Clarify expression with parentheses. [clarifyCondition]
        (nf_ct_protonum(ct) =3D=3D info->l4proto) ^
                                              ^
   net/netfilter/xt_conntrack.c:186:33: warning: Boolean result is used in =
bitwise operation. Clarify expression with parentheses. [clarifyCondition]
     if (!!(state_mask & statebit) ^
                                   ^
   net/netfilter/xt_conntrack.c:194:49: warning: Boolean result is used in =
bitwise operation. Clarify expression with parentheses. [clarifyCondition]
        (CTINFO2DIR(ctinfo) =3D=3D IP_CT_DIR_ORIGINAL) ^
                                                   ^
   net/netfilter/xt_conntrack.c:199:54: warning: Boolean result is used in =
bitwise operation. Clarify expression with parentheses. [clarifyCondition]
     if (conntrack_mt_origsrc(ct, info, xt_family(par)) ^
                                                        ^
   net/netfilter/xt_conntrack.c:204:54: warning: Boolean result is used in =
bitwise operation. Clarify expression with parentheses. [clarifyCondition]
     if (conntrack_mt_origdst(ct, info, xt_family(par)) ^
                                                        ^
   net/netfilter/xt_conntrack.c:209:54: warning: Boolean result is used in =
bitwise operation. Clarify expression with parentheses. [clarifyCondition]
     if (conntrack_mt_replsrc(ct, info, xt_family(par)) ^
                                                        ^
   net/netfilter/xt_conntrack.c:214:54: warning: Boolean result is used in =
bitwise operation. Clarify expression with parentheses. [clarifyCondition]
     if (conntrack_mt_repldst(ct, info, xt_family(par)) ^
                                                        ^
   net/netfilter/xt_conntrack.c:227:36: warning: Boolean result is used in =
bitwise operation. Clarify expression with parentheses. [clarifyCondition]
        (!!(status_mask & ct->status) ^
                                      ^
   net/netfilter/xt_conntrack.c:235:37: warning: Boolean result is used in =
bitwise operation. Clarify expression with parentheses. [clarifyCondition]
         expires <=3D info->expires_max) ^
                                       ^
--
>> drivers/pinctrl/sh-pfc/core.c:131:16: warning: Possible null pointer der=
eference: r [nullPointer]
    if (enum_id < r->begin)
                  ^
   drivers/pinctrl/sh-pfc/core.c:315:11: note: Assignment 'range=3DNULL', a=
ssigned value is 0
     range =3D NULL;
             ^
   drivers/pinctrl/sh-pfc/core.c:361:46: note: Calling function 'sh_pfc_enu=
m_in_range', 2nd argument 'range' value is 0
       in_range =3D sh_pfc_enum_in_range(enum_id, range);
                                                ^
   drivers/pinctrl/sh-pfc/core.c:131:16: note: Null pointer dereference
    if (enum_id < r->begin)
                  ^
   drivers/pinctrl/sh-pfc/core.c:134:16: warning: Possible null pointer der=
eference: r [nullPointer]
    if (enum_id > r->end)
                  ^
   drivers/pinctrl/sh-pfc/core.c:315:11: note: Assignment 'range=3DNULL', a=
ssigned value is 0
     range =3D NULL;
             ^
   drivers/pinctrl/sh-pfc/core.c:361:46: note: Calling function 'sh_pfc_enu=
m_in_range', 2nd argument 'range' value is 0
       in_range =3D sh_pfc_enum_in_range(enum_id, range);
                                                ^
   drivers/pinctrl/sh-pfc/core.c:134:16: note: Null pointer dereference
    if (enum_id > r->end)
                  ^
>> drivers/pinctrl/sh-pfc/core.c:454:40: warning: Shifting signed 32-bit va=
lue by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
     if (!(pfc->info->pins[i-1].configs & SH_PFC_PIN_CFG_NO_GPIO))
                                          ^
   drivers/pinctrl/sh-pfc/core.c:462:39: warning: Shifting signed 32-bit va=
lue by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    if (!(pfc->info->pins[i-1].configs & SH_PFC_PIN_CFG_NO_GPIO))
                                         ^
>> sound/soc/codecs/cs42l42.c:1823:6: warning: Variable 'ret' is reassigned=
 a value before the old one has been used. [redundantAssignment]
    ret =3D regmap_read(cs42l42->regmap, CS42L42_DEVID_CD, &reg);
        ^
   sound/soc/codecs/cs42l42.c:1820:6: note: Variable 'ret' is reassigned a =
value before the old one has been used.
    ret =3D regmap_read(cs42l42->regmap, CS42L42_DEVID_AB, &reg);
        ^
   sound/soc/codecs/cs42l42.c:1823:6: note: Variable 'ret' is reassigned a =
value before the old one has been used.
    ret =3D regmap_read(cs42l42->regmap, CS42L42_DEVID_CD, &reg);
        ^
   sound/soc/codecs/cs42l42.c:1826:6: warning: Variable 'ret' is reassigned=
 a value before the old one has been used. [redundantAssignment]
    ret =3D regmap_read(cs42l42->regmap, CS42L42_DEVID_E, &reg);
        ^
   sound/soc/codecs/cs42l42.c:1823:6: note: Variable 'ret' is reassigned a =
value before the old one has been used.
    ret =3D regmap_read(cs42l42->regmap, CS42L42_DEVID_CD, &reg);
        ^
   sound/soc/codecs/cs42l42.c:1826:6: note: Variable 'ret' is reassigned a =
value before the old one has been used.
    ret =3D regmap_read(cs42l42->regmap, CS42L42_DEVID_E, &reg);
        ^
   sound/soc/codecs/cs42l42.c:1837:6: warning: Variable 'ret' is reassigned=
 a value before the old one has been used. [redundantAssignment]
    ret =3D regmap_read(cs42l42->regmap, CS42L42_REVID, &reg);
        ^
   sound/soc/codecs/cs42l42.c:1826:6: note: Variable 'ret' is reassigned a =
value before the old one has been used.
    ret =3D regmap_read(cs42l42->regmap, CS42L42_DEVID_E, &reg);
        ^
   sound/soc/codecs/cs42l42.c:1837:6: note: Variable 'ret' is reassigned a =
value before the old one has been used.
    ret =3D regmap_read(cs42l42->regmap, CS42L42_REVID, &reg);
        ^
>> sound/soc/codecs/cs42l56.c:1305:6: warning: Variable 'ret' is reassigned=
 a value before the old one has been used. [redundantAssignment]
    ret =3D  devm_snd_soc_register_component(&i2c_client->dev,
        ^
   sound/soc/codecs/cs42l56.c:1245:6: note: Variable 'ret' is reassigned a =
value before the old one has been used.
    ret =3D regmap_read(cs42l56->regmap, CS42L56_CHIP_ID_1, &reg);
        ^
   sound/soc/codecs/cs42l56.c:1305:6: note: Variable 'ret' is reassigned a =
value before the old one has been used.
    ret =3D  devm_snd_soc_register_component(&i2c_client->dev,
        ^
>> fs/minix/namei.c:159:6: warning: Variable 'err' is reassigned a value be=
fore the old one has been used. [redundantAssignment]
    err =3D minix_delete_entry(de, page);
        ^
   fs/minix/namei.c:150:0: note: Variable 'err' is reassigned a value befor=
e the old one has been used.
    int err =3D -ENOENT;
   ^
   fs/minix/namei.c:159:6: note: Variable 'err' is reassigned a value befor=
e the old one has been used.
    err =3D minix_delete_entry(de, page);
        ^
   fs/minix/namei.c:214:7: warning: Variable 'err' is reassigned a value be=
fore the old one has been used. [redundantAssignment]
     err =3D -ENOTEMPTY;
         ^
   fs/minix/namei.c:194:0: note: Variable 'err' is reassigned a value befor=
e the old one has been used.
    int err =3D -ENOENT;
   ^
   fs/minix/namei.c:214:7: note: Variable 'err' is reassigned a value befor=
e the old one has been used.
     err =3D -ENOTEMPTY;
         ^
   fs/minix/namei.c:214:7: warning: Variable 'err' is reassigned a value be=
fore the old one has been used. [redundantAssignment]
     err =3D -ENOTEMPTY;
         ^
   fs/minix/namei.c:204:7: note: Variable 'err' is reassigned a value befor=
e the old one has been used.
     err =3D -EIO;
         ^
   fs/minix/namei.c:214:7: note: Variable 'err' is reassigned a value befor=
e the old one has been used.
     err =3D -ENOTEMPTY;
         ^
   fs/minix/namei.c:218:7: warning: Variable 'err' is reassigned a value be=
fore the old one has been used. [redundantAssignment]
     err =3D -ENOENT;
         ^
   fs/minix/namei.c:214:7: note: Variable 'err' is reassigned a value befor=
e the old one has been used.
     err =3D -ENOTEMPTY;
         ^
   fs/minix/namei.c:218:7: note: Variable 'err' is reassigned a value befor=
e the old one has been used.
     err =3D -ENOENT;
         ^
--
>> drivers/hid/hid-asus.c:218:3: warning: Variable 'count' is modified but =
its new value is never used. [unreadVariable]
     count++;
     ^
>> fs/hfsplus/dir.c:449:6: warning: Variable 'res' is reassigned a value be=
fore the old one has been used. [redundantAssignment]
    res =3D page_symlink(inode, symname, strlen(symname) + 1);
        ^
   fs/hfsplus/dir.c:442:0: note: Variable 'res' is reassigned a value befor=
e the old one has been used.
    int res =3D -ENOMEM;
   ^
   fs/hfsplus/dir.c:449:6: note: Variable 'res' is reassigned a value befor=
e the old one has been used.
    res =3D page_symlink(inode, symname, strlen(symname) + 1);
        ^
   fs/hfsplus/dir.c:494:6: warning: Variable 'res' is reassigned a value be=
fore the old one has been used. [redundantAssignment]
    res =3D hfsplus_create_cat(inode->i_ino, dir, &dentry->d_name, inode);
        ^
   fs/hfsplus/dir.c:484:0: note: Variable 'res' is reassigned a value befor=
e the old one has been used.
    int res =3D -ENOMEM;
   ^
   fs/hfsplus/dir.c:494:6: note: Variable 'res' is reassigned a value befor=
e the old one has been used.
    res =3D hfsplus_create_cat(inode->i_ino, dir, &dentry->d_name, inode);
        ^
>> fs/sysv/namei.c:79:6: warning: Variable 'err' is reassigned a value befo=
re the old one has been used. [redundantAssignment]
    err =3D PTR_ERR(inode);
        ^
   fs/sysv/namei.c:71:0: note: Variable 'err' is reassigned a value before =
the old one has been used.
    int err =3D -ENAMETOOLONG;
   ^
   fs/sysv/namei.c:79:6: note: Variable 'err' is reassigned a value before =
the old one has been used.
    err =3D PTR_ERR(inode);
        ^
   fs/sysv/namei.c:84:6: warning: Variable 'err' is reassigned a value befo=
re the old one has been used. [redundantAssignment]
    err =3D page_symlink(inode, symname, l);
        ^
   fs/sysv/namei.c:79:6: note: Variable 'err' is reassigned a value before =
the old one has been used.
    err =3D PTR_ERR(inode);
        ^
   fs/sysv/namei.c:84:6: note: Variable 'err' is reassigned a value before =
the old one has been used.
    err =3D page_symlink(inode, symname, l);
        ^
   fs/sysv/namei.c:127:6: warning: Variable 'err' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
    err =3D sysv_make_empty(inode, dir);
        ^
   fs/sysv/namei.c:119:6: note: Variable 'err' is reassigned a value before=
 the old one has been used.
    err =3D PTR_ERR(inode);
        ^
   fs/sysv/namei.c:127:6: note: Variable 'err' is reassigned a value before=
 the old one has been used.
    err =3D sysv_make_empty(inode, dir);
        ^
   fs/sysv/namei.c:159:6: warning: Variable 'err' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
    err =3D sysv_delete_entry (de, page);
        ^
   fs/sysv/namei.c:153:0: note: Variable 'err' is reassigned a value before=
 the old one has been used.
    int err =3D -ENOENT;
   ^
   fs/sysv/namei.c:159:6: note: Variable 'err' is reassigned a value before=
 the old one has been used.
    err =3D sysv_delete_entry (de, page);
        ^
   fs/sysv/namei.c:219:7: warning: Variable 'err' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
     err =3D -ENOTEMPTY;
         ^
   fs/sysv/namei.c:199:0: note: Variable 'err' is reassigned a value before=
 the old one has been used.
    int err =3D -ENOENT;
   ^
   fs/sysv/namei.c:219:7: note: Variable 'err' is reassigned a value before=
 the old one has been used.
     err =3D -ENOTEMPTY;
         ^
   fs/sysv/namei.c:219:7: warning: Variable 'err' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
     err =3D -ENOTEMPTY;
         ^
   fs/sysv/namei.c:209:7: note: Variable 'err' is reassigned a value before=
 the old one has been used.
     err =3D -EIO;
         ^
   fs/sysv/namei.c:219:7: note: Variable 'err' is reassigned a value before=
 the old one has been used.
     err =3D -ENOTEMPTY;
         ^
   fs/sysv/namei.c:223:7: warning: Variable 'err' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
     err =3D -ENOENT;
         ^
   fs/sysv/namei.c:219:7: note: Variable 'err' is reassigned a value before=
 the old one has been used.
     err =3D -ENOTEMPTY;
         ^
   fs/sysv/namei.c:223:7: note: Variable 'err' is reassigned a value before=
 the old one has been used.
     err =3D -ENOENT;
         ^
--
>> fs/sysv/super.c:509:17: warning: Variable 'sbi->s_bytesex' is reassigned=
 a value before the old one has been used. [redundantAssignment]
    sbi->s_bytesex =3D BYTESEX_LE;
                   ^
   fs/sysv/super.c:504:17: note: Variable 'sbi->s_bytesex' is reassigned a =
value before the old one has been used.
    sbi->s_bytesex =3D BYTESEX_PDP;
                   ^
   fs/sysv/super.c:509:17: note: Variable 'sbi->s_bytesex' is reassigned a =
value before the old one has been used.
    sbi->s_bytesex =3D BYTESEX_LE;
                   ^
--
>> fs/nilfs2/namei.c:152:6: warning: Variable 'err' is reassigned a value b=
efore the old one has been used. [redundantAssignment]
    err =3D page_symlink(inode, symname, l);
        ^
   fs/nilfs2/namei.c:144:6: note: Variable 'err' is reassigned a value befo=
re the old one has been used.
    err =3D PTR_ERR(inode);
        ^
   fs/nilfs2/namei.c:152:6: note: Variable 'err' is reassigned a value befo=
re the old one has been used.
    err =3D page_symlink(inode, symname, l);
        ^
   fs/nilfs2/namei.c:227:6: warning: Variable 'err' is reassigned a value b=
efore the old one has been used. [redundantAssignment]
    err =3D nilfs_make_empty(inode, dir);
        ^
   fs/nilfs2/namei.c:217:6: note: Variable 'err' is reassigned a value befo=
re the old one has been used.
    err =3D PTR_ERR(inode);
        ^
   fs/nilfs2/namei.c:227:6: note: Variable 'err' is reassigned a value befo=
re the old one has been used.
    err =3D nilfs_make_empty(inode, dir);
        ^
   fs/nilfs2/namei.c:270:6: warning: Variable 'err' is reassigned a value b=
efore the old one has been used. [redundantAssignment]
    err =3D -EIO;
        ^
   fs/nilfs2/namei.c:264:6: note: Variable 'err' is reassigned a value befo=
re the old one has been used.
    err =3D -ENOENT;
        ^
   fs/nilfs2/namei.c:270:6: note: Variable 'err' is reassigned a value befo=
re the old one has been used.
    err =3D -EIO;
        ^
   fs/nilfs2/namei.c:280:6: warning: Variable 'err' is reassigned a value b=
efore the old one has been used. [redundantAssignment]
    err =3D nilfs_delete_entry(de, page);
        ^
   fs/nilfs2/namei.c:270:6: note: Variable 'err' is reassigned a value befo=
re the old one has been used.
    err =3D -EIO;
        ^
   fs/nilfs2/namei.c:280:6: note: Variable 'err' is reassigned a value befo=
re the old one has been used.
    err =3D nilfs_delete_entry(de, page);
        ^
   fs/nilfs2/namei.c:377:7: warning: Variable 'err' is reassigned a value b=
efore the old one has been used. [redundantAssignment]
     err =3D -ENOTEMPTY;
         ^
   fs/nilfs2/namei.c:361:6: note: Variable 'err' is reassigned a value befo=
re the old one has been used.
    err =3D -ENOENT;
        ^
   fs/nilfs2/namei.c:377:7: note: Variable 'err' is reassigned a value befo=
re the old one has been used.
     err =3D -ENOTEMPTY;
         ^
   fs/nilfs2/namei.c:377:7: warning: Variable 'err' is reassigned a value b=
efore the old one has been used. [redundantAssignment]
     err =3D -ENOTEMPTY;
         ^
   fs/nilfs2/namei.c:367:7: note: Variable 'err' is reassigned a value befo=
re the old one has been used.
     err =3D -EIO;
         ^
   fs/nilfs2/namei.c:377:7: note: Variable 'err' is reassigned a value befo=
re the old one has been used.
     err =3D -ENOTEMPTY;
         ^
   fs/nilfs2/namei.c:381:7: warning: Variable 'err' is reassigned a value b=
efore the old one has been used. [redundantAssignment]
     err =3D -ENOENT;
         ^
   fs/nilfs2/namei.c:377:7: note: Variable 'err' is reassigned a value befo=
re the old one has been used.
     err =3D -ENOTEMPTY;
         ^
   fs/nilfs2/namei.c:381:7: note: Variable 'err' is reassigned a value befo=
re the old one has been used.
     err =3D -ENOENT;
         ^
   fs/nilfs2/namei.c:417:6: warning: Variable 'err' is reassigned a value b=
efore the old one has been used. [redundantAssignment]
    err =3D nilfs_transaction_commit(old_dir->i_sb);
        ^
   fs/nilfs2/namei.c:381:7: note: Variable 'err' is reassigned a value befo=
re the old one has been used.
     err =3D -ENOENT;
         ^
   fs/nilfs2/namei.c:417:6: note: Variable 'err' is reassigned a value befo=
re the old one has been used.
    err =3D nilfs_transaction_commit(old_dir->i_sb);
        ^
--
>> net/netfilter/nf_log.c:549:6: warning: Variable 'ret' is reassigned a va=
lue before the old one has been used. [redundantAssignment]
    ret =3D netfilter_log_sysctl_init(net);
        ^
   net/netfilter/nf_log.c:542:0: note: Variable 'ret' is reassigned a value=
 before the old one has been used.
    int ret =3D -ENOMEM;
   ^
   net/netfilter/nf_log.c:549:6: note: Variable 'ret' is reassigned a value=
 before the old one has been used.
    ret =3D netfilter_log_sysctl_init(net);
        ^
>> drivers/spi/spi-altera.c:211:6: warning: Variable 'err' is reassigned a =
value before the old one has been used. [redundantAssignment]
    err =3D devm_spi_register_master(&pdev->dev, master);
        ^
   drivers/spi/spi-altera.c:173:0: note: Variable 'err' is reassigned a val=
ue before the old one has been used.
    int err =3D -ENODEV;
   ^
   drivers/spi/spi-altera.c:211:6: note: Variable 'err' is reassigned a val=
ue before the old one has been used.
    err =3D devm_spi_register_master(&pdev->dev, master);
        ^
--
>> drivers/spi/spi-oc-tiny.c:262:6: warning: Variable 'err' is reassigned a=
 value before the old one has been used. [redundantAssignment]
    err =3D spi_bitbang_start(&hw->bitbang);
        ^
   drivers/spi/spi-oc-tiny.c:216:0: note: Variable 'err' is reassigned a va=
lue before the old one has been used.
    int err =3D -ENODEV;
   ^
   drivers/spi/spi-oc-tiny.c:262:6: note: Variable 'err' is reassigned a va=
lue before the old one has been used.
    err =3D spi_bitbang_start(&hw->bitbang);
        ^
>> net/netfilter/x_tables.c:1339:22: warning: Variable 'mem' is not assigne=
d a value. [unassignedVariable]
    struct xt_counters *mem;
                        ^
>> drivers/i2c/busses/i2c-viperboard.c:322:8: warning: Variable 'ret' is re=
assigned a value before the old one has been used. [redundantAssignment]
      ret =3D vprbrd_i2c_addr(vb->usb_dev, amsg);
          ^
   drivers/i2c/busses/i2c-viperboard.c:313:8: note: Variable 'ret' is reass=
igned a value before the old one has been used.
      ret =3D vprbrd_i2c_write(vb, pmsg);
          ^
   drivers/i2c/busses/i2c-viperboard.c:322:8: note: Variable 'ret' is reass=
igned a value before the old one has been used.
      ret =3D vprbrd_i2c_addr(vb->usb_dev, amsg);
          ^
>> drivers/cpufreq/sh-cpufreq.c:117:9: warning: Variable 'cpuclk' is reassi=
gned a value before the old one has been used. [redundantAssignment]
    cpuclk =3D clk_get(dev, "cpu_clk");
           ^
   drivers/cpufreq/sh-cpufreq.c:111:0: note: Variable 'cpuclk' is reassigne=
d a value before the old one has been used.
    struct clk *cpuclk =3D &per_cpu(sh_cpuclk, cpu);
   ^
   drivers/cpufreq/sh-cpufreq.c:117:9: note: Variable 'cpuclk' is reassigne=
d a value before the old one has been used.
    cpuclk =3D clk_get(dev, "cpu_clk");
           ^
--
>> drivers/cpufreq/cpufreq_userspace.c:41:6: warning: Variable 'ret' is rea=
ssigned a value before the old one has been used. [redundantAssignment]
    ret =3D __cpufreq_driver_target(policy, freq, CPUFREQ_RELATION_L);
        ^
   drivers/cpufreq/cpufreq_userspace.c:30:0: note: Variable 'ret' is reassi=
gned a value before the old one has been used.
    int ret =3D -EINVAL;
   ^
   drivers/cpufreq/cpufreq_userspace.c:41:6: note: Variable 'ret' is reassi=
gned a value before the old one has been used.
    ret =3D __cpufreq_driver_target(policy, freq, CPUFREQ_RELATION_L);
        ^
--
>> fs/cachefiles/main.c:72:6: warning: Variable 'ret' is reassigned a value=
 before the old one has been used. [redundantAssignment]
    ret =3D cachefiles_proc_init();
        ^
   fs/cachefiles/main.c:60:6: note: Variable 'ret' is reassigned a value be=
fore the old one has been used.
    ret =3D -ENOMEM;
        ^
   fs/cachefiles/main.c:72:6: note: Variable 'ret' is reassigned a value be=
fore the old one has been used.
    ret =3D cachefiles_proc_init();
        ^
--
>> fs/cachefiles/namei.c:220:12: warning: Variable 'requeue' is reassigned =
a value before the old one has been used. [redundantAssignment]
      requeue =3D fscache_object_sleep_till_congested(&timeout);
              ^
   fs/cachefiles/namei.c:214:11: note: Variable 'requeue' is reassigned a v=
alue before the old one has been used.
     requeue =3D false;
             ^
   fs/cachefiles/namei.c:220:12: note: Variable 'requeue' is reassigned a v=
alue before the old one has been used.
      requeue =3D fscache_object_sleep_till_congested(&timeout);
              ^
>> drivers/input/keyboard/stowaway.c:106:6: warning: Variable 'err' is reas=
signed a value before the old one has been used. [redundantAssignment]
    err =3D serio_open(serio, drv);
        ^
   drivers/input/keyboard/stowaway.c:75:0: note: Variable 'err' is reassign=
ed a value before the old one has been used.
    int err =3D -ENOMEM;
   ^
   drivers/input/keyboard/stowaway.c:106:6: note: Variable 'err' is reassig=
ned a value before the old one has been used.
    err =3D serio_open(serio, drv);
        ^
--
>> drivers/usb/host/max3421-hcd.c:1919:9: warning: Variable 'retval' is rea=
ssigned a value before the old one has been used. [redundantAssignment]
    retval =3D usb_add_hcd(hcd, 0, 0);
           ^
   drivers/usb/host/max3421-hcd.c:1850:0: note: Variable 'retval' is reassi=
gned a value before the old one has been used.
    int retval =3D -ENOMEM;
   ^
   drivers/usb/host/max3421-hcd.c:1919:9: note: Variable 'retval' is reassi=
gned a value before the old one has been used.
    retval =3D usb_add_hcd(hcd, 0, 0);
           ^
>> fs/binfmt_misc.c:153:9: warning: Variable 'retval' is reassigned a value=
 before the old one has been used. [redundantAssignment]
    retval =3D -ENOENT;
           ^
   fs/binfmt_misc.c:139:9: note: Variable 'retval' is reassigned a value be=
fore the old one has been used.
    retval =3D -ENOEXEC;
           ^
   fs/binfmt_misc.c:153:9: note: Variable 'retval' is reassigned a value be=
fore the old one has been used.
    retval =3D -ENOENT;
           ^
   fs/binfmt_misc.c:193:9: warning: Variable 'retval' is reassigned a value=
 before the old one has been used. [redundantAssignment]
    retval =3D copy_strings_kernel(1, &bprm->interp, bprm);
           ^
   fs/binfmt_misc.c:153:9: note: Variable 'retval' is reassigned a value be=
fore the old one has been used.
    retval =3D -ENOENT;
           ^
   fs/binfmt_misc.c:193:9: note: Variable 'retval' is reassigned a value be=
fore the old one has been used.
    retval =3D copy_strings_kernel(1, &bprm->interp, bprm);
           ^
   fs/binfmt_misc.c:229:10: warning: Variable 'retval' is reassigned a valu=
e before the old one has been used. [redundantAssignment]
     retval =3D kernel_read(bprm->file, bprm->buf, BINPRM_BUF_SIZE,
            ^
   fs/binfmt_misc.c:216:9: note: Variable 'retval' is reassigned a value be=
fore the old one has been used.
    retval =3D PTR_ERR(interp_file);
           ^
   fs/binfmt_misc.c:229:10: note: Variable 'retval' is reassigned a value b=
efore the old one has been used.
     retval =3D kernel_read(bprm->file, bprm->buf, BINPRM_BUF_SIZE,
            ^
>> fs/binfmt_misc.c:335:6: warning: Variable 'err' is reassigned a value be=
fore the old one has been used. [redundantAssignment]
    err =3D -ENOMEM;
        ^
   fs/binfmt_misc.c:331:6: note: Variable 'err' is reassigned a value befor=
e the old one has been used.
    err =3D -EINVAL;
        ^
   fs/binfmt_misc.c:335:6: note: Variable 'err' is reassigned a value befor=
e the old one has been used.
    err =3D -ENOMEM;
        ^
   fs/binfmt_misc.c:711:6: warning: Variable 'err' is reassigned a value be=
fore the old one has been used. [redundantAssignment]
    err =3D -EEXIST;
        ^
   fs/binfmt_misc.c:707:6: note: Variable 'err' is reassigned a value befor=
e the old one has been used.
    err =3D PTR_ERR(dentry);
        ^
   fs/binfmt_misc.c:711:6: note: Variable 'err' is reassigned a value befor=
e the old one has been used.
    err =3D -EEXIST;
        ^
   fs/binfmt_misc.c:717:6: warning: Variable 'err' is reassigned a value be=
fore the old one has been used. [redundantAssignment]
    err =3D -ENOMEM;
        ^
   fs/binfmt_misc.c:711:6: note: Variable 'err' is reassigned a value befor=
e the old one has been used.
    err =3D -EEXIST;
        ^
   fs/binfmt_misc.c:717:6: note: Variable 'err' is reassigned a value befor=
e the old one has been used.
    err =3D -ENOMEM;
        ^
   fs/binfmt_misc.c:721:6: warning: Variable 'err' is reassigned a value be=
fore the old one has been used. [redundantAssignment]
    err =3D simple_pin_fs(&bm_fs_type, &bm_mnt, &entry_count);
        ^
   fs/binfmt_misc.c:717:6: note: Variable 'err' is reassigned a value befor=
e the old one has been used.
    err =3D -ENOMEM;
        ^
   fs/binfmt_misc.c:721:6: note: Variable 'err' is reassigned a value befor=
e the old one has been used.
    err =3D simple_pin_fs(&bm_fs_type, &bm_mnt, &entry_count);
        ^
>> fs/binfmt_misc.c:157:21: warning: Shifting signed 32-bit value by 31 bit=
s is undefined behaviour [shiftTooManyBitsSigned]
    if (!(fmt->flags & MISC_FMT_PRESERVE_ARGV0)) {
                       ^
   fs/binfmt_misc.c:288:16: warning: Shifting signed 32-bit value by 31 bit=
s is undefined behaviour [shiftTooManyBitsSigned]
      e->flags |=3D MISC_FMT_PRESERVE_ARGV0;
                  ^
   fs/binfmt_misc.c:566:17: warning: Shifting signed 32-bit value by 31 bit=
s is undefined behaviour [shiftTooManyBitsSigned]
    if (e->flags & MISC_FMT_PRESERVE_ARGV0)
                   ^
--
>> drivers/input/mouse/bcm5974.c:974:8: warning: Variable 'error' is reassi=
gned a value before the old one has been used. [redundantAssignment]
    error =3D input_register_device(dev->input);
          ^
   drivers/input/mouse/bcm5974.c:901:0: note: Variable 'error' is reassigne=
d a value before the old one has been used.
    int error =3D -ENOMEM;
   ^
   drivers/input/mouse/bcm5974.c:974:8: note: Variable 'error' is reassigne=
d a value before the old one has been used.
    error =3D input_register_device(dev->input);
          ^
--
>> net/netfilter/nf_conntrack_netlink.c:1387:6: warning: Variable 'err' is =
reassigned a value before the old one has been used. [redundantAssignment]
    err =3D ctnetlink_fill_info(skb2, NETLINK_CB(skb).portid, nlh->nlmsg_se=
q,
        ^
   net/netfilter/nf_conntrack_netlink.c:1380:6: note: Variable 'err' is rea=
ssigned a value before the old one has been used.
    err =3D -ENOMEM;
        ^
   net/netfilter/nf_conntrack_netlink.c:1387:6: note: Variable 'err' is rea=
ssigned a value before the old one has been used.
    err =3D ctnetlink_fill_info(skb2, NETLINK_CB(skb).portid, nlh->nlmsg_se=
q,
        ^
   net/netfilter/nf_conntrack_netlink.c:1991:7: warning: Variable 'err' is =
reassigned a value before the old one has been used. [redundantAssignment]
     err =3D ctnetlink_parse_help(cda[CTA_HELP], &helpname, &helpinfo);
         ^
   net/netfilter/nf_conntrack_netlink.c:1969:0: note: Variable 'err' is rea=
ssigned a value before the old one has been used.
    int err =3D -EINVAL;
   ^
   net/netfilter/nf_conntrack_netlink.c:1991:7: note: Variable 'err' is rea=
ssigned a value before the old one has been used.
     err =3D ctnetlink_parse_help(cda[CTA_HELP], &helpname, &helpinfo);
         ^
   net/netfilter/nf_conntrack_netlink.c:3119:6: warning: Variable 'err' is =
reassigned a value before the old one has been used. [redundantAssignment]
    err =3D ctnetlink_exp_fill_info(skb2, NETLINK_CB(skb).portid,
        ^
   net/netfilter/nf_conntrack_netlink.c:3111:6: note: Variable 'err' is rea=
ssigned a value before the old one has been used.
    err =3D -ENOMEM;
        ^
   net/netfilter/nf_conntrack_netlink.c:3119:6: note: Variable 'err' is rea=
ssigned a value before the old one has been used.
    err =3D ctnetlink_exp_fill_info(skb2, NETLINK_CB(skb).portid,
        ^
>> net/netfilter/nf_conntrack_netlink.c:348:6: warning: Variable 'ret' is r=
eassigned a value before the old one has been used. [redundantAssignment]
    ret =3D 0;
        ^
   net/netfilter/nf_conntrack_netlink.c:339:6: note: Variable 'ret' is reas=
signed a value before the old one has been used.
    ret =3D -1;
        ^
   net/netfilter/nf_conntrack_netlink.c:348:6: note: Variable 'ret' is reas=
signed a value before the old one has been used.
    ret =3D 0;
        ^
>> net/core/lwt_bpf.c:96:7: warning: Variable 'err' is reassigned a value b=
efore the old one has been used. [redundantAssignment]
     err =3D ip_route_input_noref(skb, iph->daddr, iph->saddr,
         ^
   net/core/lwt_bpf.c:88:0: note: Variable 'err' is reassigned a value befo=
re the old one has been used.
    int err =3D -EINVAL;
   ^
   net/core/lwt_bpf.c:96:7: note: Variable 'err' is reassigned a value befo=
re the old one has been used.
     err =3D ip_route_input_noref(skb, iph->daddr, iph->saddr,
         ^
   net/core/lwt_bpf.c:250:6: warning: Variable 'err' is reassigned a value =
before the old one has been used. [redundantAssignment]
    err =3D skb_cow_head(skb, LL_RESERVED_SPACE(dst->dev));
        ^
   net/core/lwt_bpf.c:180:0: note: Variable 'err' is reassigned a value bef=
ore the old one has been used.
    int err =3D -EAFNOSUPPORT;
   ^
   net/core/lwt_bpf.c:250:6: note: Variable 'err' is reassigned a value bef=
ore the old one has been used.
    err =3D skb_cow_head(skb, LL_RESERVED_SPACE(dst->dev));
        ^
>> drivers/mmc/host/mmc_spi.c:1075:9: warning: Variable 'status' is reassig=
ned a value before the old one has been used. [redundantAssignment]
    status =3D mmc_spi_command_send(host, mrq, mrq->cmd, mrq->data !=3D NUL=
L);
           ^
   drivers/mmc/host/mmc_spi.c:1038:0: note: Variable 'status' is reassigned=
 a value before the old one has been used.
    int   status =3D -EINVAL;
   ^
   drivers/mmc/host/mmc_spi.c:1075:9: note: Variable 'status' is reassigned=
 a value before the old one has been used.
    status =3D mmc_spi_command_send(host, mrq, mrq->cmd, mrq->data !=3D NUL=
L);
           ^
>> net/core/failover.c:66:46: warning: Either the condition 'if(fops&&fops-=
>slave_register&&!fops->slave_register(slave_dev,failover_dev))' is redunda=
nt or there is possible null pointer dereference: fops. [nullPointerRedunda=
ntCheck]
    err =3D netdev_rx_handler_register(slave_dev, fops->slave_handle_frame,
                                                ^
   net/core/failover.c:85:5: note: Assuming that condition 'if(fops&&fops->=
slave_register&&!fops->slave_register(slave_dev,failover_dev))' is not redu=
ndant
    if (fops && fops->slave_register &&
       ^
   net/core/failover.c:66:46: note: Null pointer dereference
    err =3D netdev_rx_handler_register(slave_dev, fops->slave_handle_frame,
                                                ^
>> net/netfilter/nf_conntrack_core.c:2556:6: warning: Variable 'ret' is rea=
ssigned a value before the old one has been used. [redundantAssignment]
    ret =3D nf_conntrack_expect_init();
        ^
   net/netfilter/nf_conntrack_core.c:2509:0: note: Variable 'ret' is reassi=
gned a value before the old one has been used.
    int ret =3D -ENOMEM;
   ^
   net/netfilter/nf_conntrack_core.c:2556:6: note: Variable 'ret' is reassi=
gned a value before the old one has been used.
    ret =3D nf_conntrack_expect_init();
        ^
   net/netfilter/nf_conntrack_core.c:2664:6: warning: Variable 'ret' is rea=
ssigned a value before the old one has been used. [redundantAssignment]
    ret =3D nf_conntrack_expect_pernet_init(net);
        ^
   net/netfilter/nf_conntrack_core.c:2641:0: note: Variable 'ret' is reassi=
gned a value before the old one has been used.
    int ret =3D -ENOMEM;
   ^
   net/netfilter/nf_conntrack_core.c:2664:6: note: Variable 'ret' is reassi=
gned a value before the old one has been used.
    ret =3D nf_conntrack_expect_pernet_init(net);
        ^
>> drivers/sh/intc/handle.c:247:8: warning: Variable 'j' is reassigned a va=
lue before the old one has been used. [redundantAssignment]
    i =3D j =3D 0;
          ^
   drivers/sh/intc/handle.c:243:4: note: Variable 'j' is reassigned a value=
 before the old one has been used.
     j++;
      ^
   drivers/sh/intc/handle.c:247:8: note: Variable 'j' is reassigned a value=
 before the old one has been used.
    i =3D j =3D 0;
          ^
--
>> drivers/mmc/host/sh_mmcif.c:500:13: warning: Shifting signed 32-bit valu=
e by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
      if (!((1 << i) & host->clkdiv_map))
               ^
   drivers/mmc/host/sh_mmcif.c:567:15: warning: Shifting signed 32-bit valu=
e by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    if (state1 & STS1_CMDSEQ) {
                 ^
   drivers/mmc/host/sh_mmcif.c:572:12: warning: Shifting signed 32-bit valu=
e by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
            & STS1_CMDSEQ))
              ^
   drivers/mmc/host/sh_mmcif.c:586:15: warning: Shifting signed 32-bit valu=
e by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    if (state2 & STS2_CRC_ERR) {
                 ^
--
>> drivers/usb/gadget/udc/dummy_hcd.c:2421:3: warning: Assignment of functi=
on parameter has no effect outside the function. Did you forget dereferenci=
ng it? [uselessAssignmentPtrArg]
     buf +=3D temp;
     ^
>> drivers/usb/gadget/udc/dummy_hcd.c:628:9: warning: Variable 'retval' is =
reassigned a value before the old one has been used. 'break;' missing? [red=
undantAssignInSwitch]
    retval =3D 0;
           ^
   drivers/usb/gadget/udc/dummy_hcd.c:534:9: note: Variable 'retval' is rea=
ssigned a value before the old one has been used. 'break;' missing?
    retval =3D -EINVAL;
           ^
   drivers/usb/gadget/udc/dummy_hcd.c:628:9: note: Variable 'retval' is rea=
ssigned a value before the old one has been used. 'break;' missing?
    retval =3D 0;
           ^
>> drivers/usb/gadget/udc/dummy_hcd.c:2784:9: warning: Variable 'retval' is=
 reassigned a value before the old one has been used. [redundantAssignment]
    retval =3D platform_driver_register(&dummy_hcd_driver);
           ^
   drivers/usb/gadget/udc/dummy_hcd.c:2734:0: note: Variable 'retval' is re=
assigned a value before the old one has been used.
    int retval =3D -ENOMEM;
   ^
   drivers/usb/gadget/udc/dummy_hcd.c:2784:9: note: Variable 'retval' is re=
assigned a value before the old one has been used.
    retval =3D platform_driver_register(&dummy_hcd_driver);
           ^
>> drivers/input/mouse/elantech.c:1957:8: warning: Variable 'error' is reas=
signed a value before the old one has been used. [redundantAssignment]
    error =3D sysfs_create_group(&psmouse->ps2dev.serio->dev.kobj,
          ^
   drivers/input/mouse/elantech.c:1928:0: note: Variable 'error' is reassig=
ned a value before the old one has been used.
    int error =3D -EINVAL;
   ^
   drivers/input/mouse/elantech.c:1957:8: note: Variable 'error' is reassig=
ned a value before the old one has been used.
    error =3D sysfs_create_group(&psmouse->ps2dev.serio->dev.kobj,
          ^
   drivers/input/mouse/elantech.c:2022:8: warning: Variable 'error' is reas=
signed a value before the old one has been used. [redundantAssignment]
    error =3D elantech_query_info(psmouse, &info);
          ^
   drivers/input/mouse/elantech.c:2018:0: note: Variable 'error' is reassig=
ned a value before the old one has been used.
    int error =3D -EINVAL;
   ^
   drivers/input/mouse/elantech.c:2022:8: note: Variable 'error' is reassig=
ned a value before the old one has been used.
    error =3D elantech_query_info(psmouse, &info);
          ^
   drivers/input/mouse/elantech.c:2043:8: warning: Variable 'error' is reas=
signed a value before the old one has been used. [redundantAssignment]
    error =3D elantech_query_info(psmouse, &info);
          ^
   drivers/input/mouse/elantech.c:2039:0: note: Variable 'error' is reassig=
ned a value before the old one has been used.
    int error =3D -EINVAL;
   ^
   drivers/input/mouse/elantech.c:2043:8: note: Variable 'error' is reassig=
ned a value before the old one has been used.
    error =3D elantech_query_info(psmouse, &info);
          ^
--
>> drivers/usb/atm/ueagle-atm.c:833:6: warning: Variable 'ret' is reassigne=
d a value before the old one has been used. [redundantAssignment]
    ret =3D usb_bulk_msg(sc->usb_dev,
        ^
   drivers/usb/atm/ueagle-atm.c:823:0: note: Variable 'ret' is reassigned a=
 value before the old one has been used.
    int ret =3D -ENOMEM;
   ^
   drivers/usb/atm/ueagle-atm.c:833:6: note: Variable 'ret' is reassigned a=
 value before the old one has been used.
    ret =3D usb_bulk_msg(sc->usb_dev,
        ^
   drivers/usb/atm/ueagle-atm.c:1112:6: warning: Variable 'ret' is reassign=
ed a value before the old one has been used. [redundantAssignment]
    ret =3D usb_control_msg(sc->usb_dev, usb_sndctrlpipe(sc->usb_dev, 0),
        ^
   drivers/usb/atm/ueagle-atm.c:1104:0: note: Variable 'ret' is reassigned =
a value before the old one has been used.
    int ret =3D -ENOMEM;
   ^
   drivers/usb/atm/ueagle-atm.c:1112:6: note: Variable 'ret' is reassigned =
a value before the old one has been used.
    ret =3D usb_control_msg(sc->usb_dev, usb_sndctrlpipe(sc->usb_dev, 0),
        ^
   drivers/usb/atm/ueagle-atm.c:2174:6: warning: Variable 'ret' is reassign=
ed a value before the old one has been used. [redundantAssignment]
    ret =3D usb_submit_urb(sc->urb_int, GFP_KERNEL);
        ^
   drivers/usb/atm/ueagle-atm.c:2130:0: note: Variable 'ret' is reassigned =
a value before the old one has been used.
    int ret =3D -ENOMEM;
   ^
   drivers/usb/atm/ueagle-atm.c:2174:6: note: Variable 'ret' is reassigned =
a value before the old one has been used.
    ret =3D usb_submit_urb(sc->urb_int, GFP_KERNEL);
        ^
   drivers/usb/atm/ueagle-atm.c:2255:6: warning: Variable 'ret' is reassign=
ed a value before the old one has been used. [redundantAssignment]
    ret =3D snprintf(buf, 10, "%08xn", sc->stats.phy.state);
        ^
   drivers/usb/atm/ueagle-atm.c:2248:0: note: Variable 'ret' is reassigned =
a value before the old one has been used.
    int ret =3D -ENODEV;
   ^
   drivers/usb/atm/ueagle-atm.c:2255:6: note: Variable 'ret' is reassigned =
a value before the old one has been used.
    ret =3D snprintf(buf, 10, "%08xn", sc->stats.phy.state);
        ^
   drivers/usb/atm/ueagle-atm.c:2272:6: warning: Variable 'ret' is reassign=
ed a value before the old one has been used. [redundantAssignment]
    ret =3D count;
        ^
   drivers/usb/atm/ueagle-atm.c:2264:0: note: Variable 'ret' is reassigned =
a value before the old one has been used.
    int ret =3D -ENODEV;
   ^
   drivers/usb/atm/ueagle-atm.c:2272:6: note: Variable 'ret' is reassigned =
a value before the old one has been used.
    ret =3D count;
        ^
   drivers/usb/atm/ueagle-atm.c:2367:6: warning: Variable 'ret' is reassign=
ed a value before the old one has been used. [redundantAssignment]
    ret =3D sprintf(buf, "%sn", delin);
        ^
   drivers/usb/atm/ueagle-atm.c:2346:0: note: Variable 'ret' is reassigned =
a value before the old one has been used.
    int ret =3D -ENODEV;
   ^
   drivers/usb/atm/ueagle-atm.c:2367:6: note: Variable 'ret' is reassigned =
a value before the old one has been used.
    ret =3D sprintf(buf, "%sn", delin);
        ^
   drivers/usb/atm/ueagle-atm.c:2397:1: warning: Variable 'ret' is reassign=
ed a value before the old one has been used. [redundantAssignment]
   UEA_ATTR(mflags, 1);
   ^
   drivers/usb/atm/ueagle-atm.c:2397:0: note: Variable 'ret' is reassigned =
a value before the old one has been used.
   UEA_ATTR(mflags, 1);
   ^
   drivers/usb/atm/ueagle-atm.c:2397:1: note: Variable 'ret' is reassigned =
a value before the old one has been used.
   UEA_ATTR(mflags, 1);
   ^
   drivers/usb/atm/ueagle-atm.c:2398:1: warning: Variable 'ret' is reassign=
ed a value before the old one has been used. [redundantAssignment]
   UEA_ATTR(vidcpe, 0);
   ^
   drivers/usb/atm/ueagle-atm.c:2398:0: note: Variable 'ret' is reassigned =
a value before the old one has been used.
   UEA_ATTR(vidcpe, 0);
   ^
   drivers/usb/atm/ueagle-atm.c:2398:1: note: Variable 'ret' is reassigned =
a value before the old one has been used.
   UEA_ATTR(vidcpe, 0);
   ^
   drivers/usb/atm/ueagle-atm.c:2399:1: warning: Variable 'ret' is reassign=
ed a value before the old one has been used. [redundantAssignment]
   UEA_ATTR(usrate, 0);
   ^
   drivers/usb/atm/ueagle-atm.c:2399:0: note: Variable 'ret' is reassigned =
a value before the old one has been used.
   UEA_ATTR(usrate, 0);
   ^
   drivers/usb/atm/ueagle-atm.c:2399:1: note: Variable 'ret' is reassigned =
a value before the old one has been used.
   UEA_ATTR(usrate, 0);
   ^
   drivers/usb/atm/ueagle-atm.c:2400:1: warning: Variable 'ret' is reassign=
ed a value before the old one has been used. [redundantAssignment]
   UEA_ATTR(dsrate, 0);
   ^
   drivers/usb/atm/ueagle-atm.c:2400:0: note: Variable 'ret' is reassigned =
a value before the old one has been used.
   UEA_ATTR(dsrate, 0);
   ^
   drivers/usb/atm/ueagle-atm.c:2400:1: note: Variable 'ret' is reassigned =
a value before the old one has been used.
   UEA_ATTR(dsrate, 0);
   ^
   drivers/usb/atm/ueagle-atm.c:2401:1: warning: Variable 'ret' is reassign=
ed a value before the old one has been used. [redundantAssignment]
   UEA_ATTR(usattenuation, 0);
   ^
   drivers/usb/atm/ueagle-atm.c:2401:0: note: Variable 'ret' is reassigned =
a value before the old one has been used.
   UEA_ATTR(usattenuation, 0);
   ^
   drivers/usb/atm/ueagle-atm.c:2401:1: note: Variable 'ret' is reassigned =
a value before the old one has been used.
   UEA_ATTR(usattenuation, 0);
   ^
   drivers/usb/atm/ueagle-atm.c:2402:1: warning: Variable 'ret' is reassign=
ed a value before the old one has been used. [redundantAssignment]
   UEA_ATTR(dsattenuation, 0);
--
>> drivers/usb/gadget/function/f_ncm.c:1559:1: warning: %d in format string=
 (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPr=
intfArgType_sint]
   USB_ETHERNET_CONFIGFS_ITEM_ATTR_QMULT(ncm);
   ^
>> drivers/usb/gadget/function/f_ncm.c:1109:11: warning: Variable 'ntb_ndp'=
 is reassigned a value before the old one has been used. [redundantAssignme=
nt]
     ntb_ndp =3D skb_put_zero(ncm->skb_tx_ndp, dgram_idx_len);
             ^
   drivers/usb/gadget/function/f_ncm.c:1096:12: note: Variable 'ntb_ndp' is=
 reassigned a value before the old one has been used.
      ntb_ndp +=3D 2;
              ^
   drivers/usb/gadget/function/f_ncm.c:1109:11: note: Variable 'ntb_ndp' is=
 reassigned a value before the old one has been used.
     ntb_ndp =3D skb_put_zero(ncm->skb_tx_ndp, dgram_idx_len);
             ^
>> drivers/usb/gadget/function/f_ncm.c:1478:9: warning: Variable 'status' i=
s reassigned a value before the old one has been used. [redundantAssignment]
    status =3D -ENOMEM;
           ^
   drivers/usb/gadget/function/f_ncm.c:1460:9: note: Variable 'status' is r=
eassigned a value before the old one has been used.
    status =3D -ENODEV;
           ^
   drivers/usb/gadget/function/f_ncm.c:1478:9: note: Variable 'status' is r=
eassigned a value before the old one has been used.
    status =3D -ENOMEM;
           ^
   drivers/usb/gadget/function/f_ncm.c:1505:9: warning: Variable 'status' i=
s reassigned a value before the old one has been used. [redundantAssignment]
    status =3D usb_assign_descriptors(f, ncm_fs_function, ncm_hs_function,
           ^
   drivers/usb/gadget/function/f_ncm.c:1478:9: note: Variable 'status' is r=
eassigned a value before the old one has been used.
    status =3D -ENOMEM;
           ^
   drivers/usb/gadget/function/f_ncm.c:1505:9: note: Variable 'status' is r=
eassigned a value before the old one has been used.
    status =3D usb_assign_descriptors(f, ncm_fs_function, ncm_hs_function,
           ^
--
>> drivers/usb/gadget/function/f_mass_storage.c:3242:11: warning: %d in for=
mat string (no. 1) requires 'int' but the argument type is 'unsigned int'. =
[invalidPrintfArgType_sint]
    result =3D sprintf(page, "%d", opts->common->can_stall);
             ^
>> drivers/hid/usbhid/usbkbd.c:353:8: warning: Variable 'error' is reassign=
ed a value before the old one has been used. [redundantAssignment]
    error =3D input_register_device(kbd->dev);
          ^
   drivers/hid/usbhid/usbkbd.c:270:0: note: Variable 'error' is reassigned =
a value before the old one has been used.
    int error =3D -ENOMEM;
   ^
   drivers/hid/usbhid/usbkbd.c:353:8: note: Variable 'error' is reassigned =
a value before the old one has been used.
    error =3D input_register_device(kbd->dev);
          ^
--
>> drivers/usb/gadget/function/f_ecm.c:840:1: warning: %d in format string =
(no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPri=
ntfArgType_sint]
   USB_ETHERNET_CONFIGFS_ITEM_ATTR_QMULT(ecm);
   ^
>> drivers/usb/gadget/function/f_ecm.c:767:9: warning: Variable 'status' is=
 reassigned a value before the old one has been used. [redundantAssignment]
    status =3D -ENOMEM;
           ^
   drivers/usb/gadget/function/f_ecm.c:745:9: note: Variable 'status' is re=
assigned a value before the old one has been used.
    status =3D -ENODEV;
           ^
   drivers/usb/gadget/function/f_ecm.c:767:9: note: Variable 'status' is re=
assigned a value before the old one has been used.
    status =3D -ENOMEM;
           ^
   drivers/usb/gadget/function/f_ecm.c:793:9: warning: Variable 'status' is=
 reassigned a value before the old one has been used. [redundantAssignment]
    status =3D usb_assign_descriptors(f, ecm_fs_function, ecm_hs_function,
           ^
   drivers/usb/gadget/function/f_ecm.c:767:9: note: Variable 'status' is re=
assigned a value before the old one has been used.
    status =3D -ENOMEM;
           ^
   drivers/usb/gadget/function/f_ecm.c:793:9: note: Variable 'status' is re=
assigned a value before the old one has been used.
    status =3D usb_assign_descriptors(f, ecm_fs_function, ecm_hs_function,
           ^
--
>> drivers/input/touchscreen/raydium_i2c_ts.c:151:18: warning: Possible nul=
l pointer dereference: data [nullPointer]
    memcpy(buf + 1, data, len);
                    ^
   drivers/input/touchscreen/raydium_i2c_ts.c:421:52: note: Calling functio=
n 'raydium_i2c_send', 3rd argument 'NULL' value is 0
    error =3D raydium_i2c_send(client, RM_CMD_BOOT_ACK, NULL, 0);
                                                      ^
   drivers/input/touchscreen/raydium_i2c_ts.c:151:18: note: Null pointer de=
reference
    memcpy(buf + 1, data, len);
                    ^
>> drivers/usb/gadget/function/f_eem.c:294:9: warning: Variable 'status' is=
 reassigned a value before the old one has been used. [redundantAssignment]
    status =3D -ENOMEM;
           ^
   drivers/usb/gadget/function/f_eem.c:281:9: note: Variable 'status' is re=
assigned a value before the old one has been used.
    status =3D -ENODEV;
           ^
   drivers/usb/gadget/function/f_eem.c:294:9: note: Variable 'status' is re=
assigned a value before the old one has been used.
    status =3D -ENOMEM;
           ^
   drivers/usb/gadget/function/f_eem.c:306:9: warning: Variable 'status' is=
 reassigned a value before the old one has been used. [redundantAssignment]
    status =3D usb_assign_descriptors(f, eem_fs_function, eem_hs_function,
           ^
   drivers/usb/gadget/function/f_eem.c:294:9: note: Variable 'status' is re=
assigned a value before the old one has been used.
    status =3D -ENOMEM;
           ^
   drivers/usb/gadget/function/f_eem.c:306:9: note: Variable 'status' is re=
assigned a value before the old one has been used.
    status =3D usb_assign_descriptors(f, eem_fs_function, eem_hs_function,
           ^
--
>> drivers/usb/gadget/function/f_subset.c:398:1: warning: %d in format stri=
ng (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalid=
PrintfArgType_sint]
   USB_ETHERNET_CONFIGFS_ITEM_ATTR_QMULT(gether);
   ^
>> drivers/usb/gadget/function/f_subset.c:360:9: warning: Variable 'status'=
 is reassigned a value before the old one has been used. [redundantAssignme=
nt]
    status =3D usb_assign_descriptors(f, fs_eth_function, hs_eth_function,
           ^
   drivers/usb/gadget/function/f_subset.c:335:9: note: Variable 'status' is=
 reassigned a value before the old one has been used.
    status =3D -ENODEV;
           ^
   drivers/usb/gadget/function/f_subset.c:360:9: note: Variable 'status' is=
 reassigned a value before the old one has been used.
    status =3D usb_assign_descriptors(f, fs_eth_function, hs_eth_function,
           ^

vim +/ret +2337 drivers/cdrom/cdrom.c

eaf8e3e4b54a8b7 Christoph Hellwig 2020-04-25  2319  =

eaf8e3e4b54a8b7 Christoph Hellwig 2020-04-25  2320  static int cdrom_ioctl_=
multisession(struct cdrom_device_info *cdi,
eaf8e3e4b54a8b7 Christoph Hellwig 2020-04-25  2321  		void __user *argp)
eaf8e3e4b54a8b7 Christoph Hellwig 2020-04-25  2322  {
eaf8e3e4b54a8b7 Christoph Hellwig 2020-04-25  2323  	struct cdrom_multisess=
ion info;
eaf8e3e4b54a8b7 Christoph Hellwig 2020-04-25  2324  	int ret;
d2c5d4fc07a41a6 Christoph Hellwig 2006-03-23  2325  =

eaf8e3e4b54a8b7 Christoph Hellwig 2020-04-25  2326  	cd_dbg(CD_DO_IOCTL, "e=
ntering CDROMMULTISESSION\n");
d2c5d4fc07a41a6 Christoph Hellwig 2006-03-23  2327  =

eaf8e3e4b54a8b7 Christoph Hellwig 2020-04-25  2328  	if (copy_from_user(&in=
fo, argp, sizeof(info)))
eaf8e3e4b54a8b7 Christoph Hellwig 2020-04-25  2329  		return -EFAULT;
eaf8e3e4b54a8b7 Christoph Hellwig 2020-04-25  2330  	ret =3D cdrom_multises=
sion(cdi, &info);
eaf8e3e4b54a8b7 Christoph Hellwig 2020-04-25  2331  	if (ret)
eaf8e3e4b54a8b7 Christoph Hellwig 2020-04-25  2332  		return ret;
eaf8e3e4b54a8b7 Christoph Hellwig 2020-04-25  2333  	if (copy_to_user(argp,=
 &info, sizeof(info)))
d2c5d4fc07a41a6 Christoph Hellwig 2006-03-23  2334  		return -EFAULT;
d2c5d4fc07a41a6 Christoph Hellwig 2006-03-23  2335  =

5944b2ce5778f2a Joe Perches       2014-05-04  2336  	cd_dbg(CD_DO_IOCTL, "C=
DROMMULTISESSION successful\n");
eaf8e3e4b54a8b7 Christoph Hellwig 2020-04-25 @2337  	return ret;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2338  }
^1da177e4c3f415 Linus Torvalds    2005-04-16  2339  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8299568859936400262==--

