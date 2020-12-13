Content-Type: multipart/mixed; boundary="===============9125133359347490623=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/cdrom/cdrom.c:2337:9: warning: Identical condition 'ret', second condition is always false
Date: Mon, 14 Dec 2020 07:47:12 +0800
Message-ID: <202012140757.wBpBqTCG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9125133359347490623==
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
head:   ec6f5e0e5ca0764b4bc522c9f9d5abf876a0e3e3
commit: eaf8e3e4b54a8b778257fc3921ad8f793c941882 cdrom: factor out a cdrom_=
multisession helper
date:   7 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 7 months ago
compiler: c6x-elf-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/target/iscsi/iscsi_target.c:3449:7: warning: Assignment of funct=
ion parameter has no effect outside the function. [uselessAssignmentArg]
         skip_bytes =3D 0;
         ^
>> net/mac80211/airtime.c:232:0: warning: Syntax Error: AST broken, ternary=
 operator lacks ':'. [internalAstError]
   =

   ^
>> drivers/md/persistent-data/dm-array.c:519:9: warning: Identical conditio=
n 'r', second condition is always false [identicalConditionAfterEarlyExit]
    return r;
           ^
   drivers/md/persistent-data/dm-array.c:513:6: note: first condition
    if (r)
        ^
   drivers/md/persistent-data/dm-array.c:519:9: note: second condition
    return r;
           ^
>> drivers/md/persistent-data/dm-bitset.c:251:9: warning: Identical conditi=
on 'r', second condition is always false [identicalConditionAfterEarlyExit]
    return r;
           ^
   drivers/md/persistent-data/dm-bitset.c:243:6: note: first condition
    if (r)
        ^
   drivers/md/persistent-data/dm-bitset.c:251:9: note: second condition
    return r;
           ^
>> drivers/reset/reset-simple.c:78:30: warning: Boolean result is used in b=
itwise operation. Clarify expression with parentheses. [clarifyCondition]
    return !(reg & BIT(offset)) ^ !data->status_active_low;
                                ^
--
>> drivers/md/persistent-data/dm-btree-remove.c:275:11: warning: Local vari=
able shift shadows outer function [shadowFunction]
    unsigned shift =3D min(max_entries - nr_left, nr_center);
             ^
   drivers/md/persistent-data/dm-btree-remove.c:173:13: note: Shadowed decl=
aration
   static void shift(struct btree_node *left, struct btree_node *right, int=
 count)
               ^
   drivers/md/persistent-data/dm-btree-remove.c:275:11: note: Shadow variab=
le
    unsigned shift =3D min(max_entries - nr_left, nr_center);
             ^
>> drivers/tty/vt/vt.c:807:23: warning: Redundant condition: If 'old_offset=
 >=3D 0', the comparison 'old_offset !=3D -1' is always true. [redundantCon=
dition]
    if (old_offset !=3D -1 && old_offset >=3D 0 &&
                         ^
>> drivers/tty/vt/vt.c:817:19: warning: Redundant condition: If 'offset >=
=3D 0', the comparison 'offset !=3D -1' is always true. [redundantCondition]
    if (offset !=3D -1 && offset >=3D 0 &&
                     ^
>> drivers/video/fbdev/omap2/omapfb/dss/dss.h:470:22: warning: Shifting sig=
ned 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
     if (irqstatus & (1 << b))
                        ^
--
>> drivers/video/fbdev/omap2/omapfb/dss/dss.h:470:22: warning: Shifting sig=
ned 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
     if (irqstatus & (1 << b))
                        ^
--
>> drivers/leds/led-class-flash.c:212:30: warning: Undefined behavior: Vari=
able 'buf' is used as parameter and destination in s[n]printf(). [sprintfOv=
erlappingData]
    return sprintf(buf, "%sn", buf);
                                ^
--
>> drivers/md/dm-snap.c:2505:4: warning: Assignment of function parameter h=
as no effect outside the function. Did you forget dereferencing it? [useles=
sAssignmentPtrArg]
      bio =3D NULL;
      ^
>> drivers/md/dm-cache-background-tracker.c:202:3: warning: Address of loca=
l auto-variable assigned to a function parameter. [autoVariables]
     *pwork =3D &w->work;
     ^
   drivers/md/dm-cache-background-tracker.c:224:2: warning: Address of loca=
l auto-variable assigned to a function parameter. [autoVariables]
    *work =3D &w->work;
    ^
--
>> drivers/video/fbdev/omap2/omapfb/dss/dss.h:470:22: warning: Shifting sig=
ned 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
     if (irqstatus & (1 << b))
                        ^
--
>> drivers/gpu/ipu-v3/ipu-prv.h:146:25: warning: Shifting signed 32-bit val=
ue by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    IPU_CONF_CSI_SEL  =3D (1 << 31),
                           ^
--
   In file included from drivers/gpu/ipu-v3/ipu-cpmem.c:
>> drivers/gpu/ipu-v3/ipu-prv.h:146:25: warning: Shifting signed 32-bit val=
ue by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    IPU_CONF_CSI_SEL  =3D (1 << 31),
                           ^
--
>> drivers/pinctrl/pxa/pinctrl-pxa2xx.c:48:2: warning: Address of local aut=
o-variable assigned to a function parameter. [autoVariables]
    *pins =3D (unsigned *)&group->pin;
    ^
--
>> drivers/gpu/ipu-v3/ipu-prv.h:146:25: warning: Shifting signed 32-bit val=
ue by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    IPU_CONF_CSI_SEL  =3D (1 << 31),
                           ^
--
>> drivers/gpu/drm/rcar-du/rcar_lvds.c:483:12: warning: Same expression on =
both sides of '-'. [duplicateExpression]
     lvdhcr =3D LVDCHCR_CHSEL_CH(0, 0) | LVDCHCR_CHSEL_CH(1, 3)
              ^
   drivers/gpu/drm/rcar-du/rcar_lvds.c:484:12: warning: Same expression on =
both sides of '-'. [duplicateExpression]
            | LVDCHCR_CHSEL_CH(2, 2) | LVDCHCR_CHSEL_CH(3, 1);
              ^
   drivers/gpu/drm/rcar-du/rcar_lvds.c:486:12: warning: Same expression on =
both sides of '-'. [duplicateExpression]
     lvdhcr =3D LVDCHCR_CHSEL_CH(0, 0) | LVDCHCR_CHSEL_CH(1, 1)
              ^
   drivers/gpu/drm/rcar-du/rcar_lvds.c:487:12: warning: Same expression on =
both sides of '-'. [duplicateExpression]
            | LVDCHCR_CHSEL_CH(2, 2) | LVDCHCR_CHSEL_CH(3, 3);
              ^
>> drivers/gpu/ipu-v3/ipu-prv.h:146:25: warning: Shifting signed 32-bit val=
ue by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    IPU_CONF_CSI_SEL  =3D (1 << 31),
                           ^
--
   In file included from drivers/gpu/ipu-v3/ipu-vdi.c:
>> drivers/gpu/ipu-v3/ipu-prv.h:146:25: warning: Shifting signed 32-bit val=
ue by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    IPU_CONF_CSI_SEL  =3D (1 << 31),
                           ^
>> drivers/gpu/ipu-v3/ipu-vdi.c:82:36: warning: Shifting signed 32-bit valu=
e by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
     reg &=3D ~(VDI_C_TOP_FIELD_MAN_1 | VDI_C_TOP_FIELD_AUTO_1);
                                      ^
   drivers/gpu/ipu-v3/ipu-vdi.c:84:34: warning: Shifting signed 32-bit valu=
e by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
     reg |=3D VDI_C_TOP_FIELD_MAN_1 | VDI_C_TOP_FIELD_AUTO_1;
                                    ^
--
>> net/ax25/af_ax25.c:1319:14: warning: Variable 'sock->state' is reassigne=
d a value before the old one has been used. 'break;' missing? [redundantAss=
ignInSwitch]
    sock->state =3D SS_CONNECTED;
                ^
   net/ax25/af_ax25.c:1258:21: note: Variable 'sock->state' is reassigned a=
 value before the old one has been used. 'break;' missing?
    sock->state        =3D SS_CONNECTING;
                       ^
   net/ax25/af_ax25.c:1319:14: note: Variable 'sock->state' is reassigned a=
 value before the old one has been used. 'break;' missing?
    sock->state =3D SS_CONNECTED;
                ^
>> drivers/gpu/ipu-v3/ipu-prv.h:146:25: warning: Shifting signed 32-bit val=
ue by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    IPU_CONF_CSI_SEL  =3D (1 << 31),
                           ^
>> drivers/gpu/ipu-v3/ipu-prg.c:407:9: warning: Shifting signed 32-bit valu=
e by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    val |=3D IPU_PRG_CTL_SHADOW_EN;
           ^
--
>> drivers/fpga/dfl.c:742:9: warning: Identical condition 'ret', second con=
dition is always false [identicalConditionAfterEarlyExit]
    return ret;
           ^
   drivers/fpga/dfl.c:728:6: note: first condition
    if (ret)
        ^
   drivers/fpga/dfl.c:742:9: note: second condition
    return ret;
           ^
>> drivers/video/fbdev/omap2/omapfb/dss/dss.h:470:22: warning: Shifting sig=
ned 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
     if (irqstatus & (1 << b))
                        ^
--
>> drivers/video/fbdev/omap2/omapfb/dss/dss.h:470:22: warning: Shifting sig=
ned 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
     if (irqstatus & (1 << b))
                        ^
--
>> drivers/video/fbdev/omap2/omapfb/dss/dss.h:470:22: warning: Shifting sig=
ned 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
     if (irqstatus & (1 << b))
                        ^
--
>> drivers/video/fbdev/omap2/omapfb/dss/dss.h:470:22: warning: Shifting sig=
ned 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
     if (irqstatus & (1 << b))
                        ^
--
>> drivers/video/fbdev/omap2/omapfb/dss/dss.h:470:22: warning: Shifting sig=
ned 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
     if (irqstatus & (1 << b))
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
>> net/wireless/reg.c:3531:2: warning: Assignment of function parameter has=
 no effect outside the function. Did you forget dereferencing it? [uselessA=
ssignmentPtrArg]
    rd =3D NULL;
    ^
   net/wireless/reg.c:3588:2: warning: Assignment of function parameter has=
 no effect outside the function. Did you forget dereferencing it? [uselessA=
ssignmentPtrArg]
    rd =3D NULL;
    ^
>> net/wireless/reg.c:3813:2: warning: Either the condition 'lr' is redunda=
nt or there is possible null pointer dereference: lr. [nullPointerRedundant=
Check]
    lr->wiphy_idx =3D WIPHY_IDX_INVALID;
    ^
   net/wireless/reg.c:3807:6: note: Assuming that condition 'lr' is not red=
undant
    if (lr)
        ^
   net/wireless/reg.c:3813:2: note: Null pointer dereference
    lr->wiphy_idx =3D WIPHY_IDX_INVALID;
    ^
   net/wireless/reg.c:3814:2: warning: Either the condition 'lr' is redunda=
nt or there is possible null pointer dereference: lr. [nullPointerRedundant=
Check]
    lr->country_ie_env =3D ENVIRON_ANY;
    ^
   net/wireless/reg.c:3807:6: note: Assuming that condition 'lr' is not red=
undant
    if (lr)
        ^
   net/wireless/reg.c:3814:2: note: Null pointer dereference
    lr->country_ie_env =3D ENVIRON_ANY;
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
--===============9125133359347490623==--

