Content-Type: multipart/mixed; boundary="===============3787848893945382892=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1022/1176] arch/x86/pci/acpi.c:304:2: warning: There is an unknown macro here somewhere. Configuration is required. If resource_list_for_each_entry is a macro then please configure it. [unknownMacro]
Date: Tue, 05 Apr 2022 09:45:38 +0800
Message-ID: <202204050933.hK51sGIE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3787848893945382892==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Bjorn Helgaas <helgaas@kernel.org>
CC: Hans de Goede <hdegoede@redhat.com>
CC: Mika Westerberg <mika.westerberg@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   696206280c5e5c028caf9fd259999cb72b1f6127
commit: cdede81acc276fabbfc685a3e80b2ff469ae032a [1022/1176] x86/PCI: Log h=
ost bridge window clipping for E820 regions
:::::: branch date: 23 hours ago
:::::: commit date: 2 days ago
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/pci/pci-acpi.c:207:70: warning: Parameter 'hpx' can be declared =
with const [constParameter]
   static void program_hpx_type1(struct pci_dev *dev, struct hpx_type1 *hpx)
                                                                        ^
>> arch/x86/pci/acpi.c:304:2: warning: There is an unknown macro here somew=
here. Configuration is required. If resource_list_for_each_entry is a macro=
 then please configure it. [unknownMacro]
    resource_list_for_each_entry(entry, &ci->resources)
    ^
--
>> drivers/video/fbdev/aty/atyfb_base.c:3977:11: warning: Same expression o=
n both sides of '&&' because 'err1' and 'err2' represent the same value. [k=
nownConditionTrueFalse]
    if (err1 && err2)
             ^
   drivers/video/fbdev/aty/atyfb_base.c:3961:13: note: 'err1' is assigned v=
alue '1' here.
    int err1 =3D 1, err2 =3D 1;
               ^
   drivers/video/fbdev/aty/atyfb_base.c:3961:23: note: 'err2' is assigned v=
alue '1' here.
    int err1 =3D 1, err2 =3D 1;
                         ^
   drivers/video/fbdev/aty/atyfb_base.c:3977:11: note: Same expression on b=
oth sides of '&&' because 'err1' and 'err2' represent the same value.
    if (err1 && err2)
             ^
>> drivers/video/fbdev/aty/atyfb_base.c:2367:5: warning: Unused variable: d=
ac_type [unusedVariable]
    u8 dac_type;
       ^
>> drivers/video/fbdev/aty/atyfb_base.c:3578:5: warning: Redundant initiali=
zation for 'rc'. The initialized value is overwritten before it is read. [r=
edundantInitialization]
    rc =3D atyfb_setup_generic(pdev, info, addr);
       ^
   drivers/video/fbdev/aty/atyfb_base.c:3537:9: note: rc is initialized
    int rc =3D -ENOMEM;
           ^
   drivers/video/fbdev/aty/atyfb_base.c:3578:5: note: rc is overwritten
    rc =3D atyfb_setup_generic(pdev, info, addr);
       ^
>> fs/ocfs2/ocfs2_fs.h:1582:25: warning: Either the condition 'type<=3DGROU=
P_QUOTA_SYSTEM_INODE' is redundant or the array 'ocfs2_system_inodes[15]' i=
s accessed@index 15, which is out of bounds. [arrayIndexOutOfBoundsCond]
        ocfs2_system_inodes[type].si_name,
                           ^
   fs/ocfs2/ocfs2_fs.h:1577:11: note: Assuming that condition 'type<=3DGROU=
P_QUOTA_SYSTEM_INODE' is not redundant
    if (type <=3D OCFS2_LAST_GLOBAL_SYSTEM_INODE)
             ^
   fs/ocfs2/ocfs2_fs.h:1582:25: note: Array index out of bounds
        ocfs2_system_inodes[type].si_name,
                           ^
>> fs/ocfs2/quota_local.c:388:15: warning: Variable 'feature' can be declar=
ed with const [constVariable]
    unsigned int feature[OCFS2_MAXQUOTAS] =3D {
                 ^
>> fs/ocfs2/quota_local.c:487:33: warning: Uninitialized variable: rchunk->=
rc_bitmap [uninitvar]
     for_each_set_bit(bit, rchunk->rc_bitmap, ol_chunk_entries(sb)) {
                                   ^
   fs/ocfs2/quota_local.c:482:7: note: Assuming condition is false
     if (status) {
         ^
   fs/ocfs2/quota_local.c:487:33: note: Uninitialized variable: rchunk->rc_=
bitmap
     for_each_set_bit(bit, rchunk->rc_bitmap, ol_chunk_entries(sb)) {
                                   ^
>> fs/ocfs2/quota_local.c:823:14: warning: Uninitialized variable: chunk->q=
c_headerbh [uninitvar]
        (chunk->qc_headerbh->b_data);
                ^
   fs/ocfs2/quota_local.c:932:14: warning: Uninitialized variable: chunk->q=
c_headerbh [uninitvar]
         chunk->qc_headerbh->b_data;
                ^
--
   In file included from fs/ocfs2/namei.c:
>> fs/ocfs2/ocfs2_fs.h:1582:25: warning: Either the condition 'type<=3DGROU=
P_QUOTA_SYSTEM_INODE' is redundant or the array 'ocfs2_system_inodes[15]' i=
s accessed@index 15, which is out of bounds. [arrayIndexOutOfBoundsCond]
        ocfs2_system_inodes[type].si_name,
                           ^
   fs/ocfs2/ocfs2_fs.h:1577:11: note: Assuming that condition 'type<=3DGROU=
P_QUOTA_SYSTEM_INODE' is not redundant
    if (type <=3D OCFS2_LAST_GLOBAL_SYSTEM_INODE)
             ^
   fs/ocfs2/ocfs2_fs.h:1582:25: note: Array index out of bounds
        ocfs2_system_inodes[type].si_name,
                           ^
>> fs/ocfs2/namei.c:2217:6: warning: The if condition is the same as the pr=
evious if condition [duplicateCondition]
    if (ret)
        ^
   fs/ocfs2/namei.c:2211:6: note: First condition
    if (ret) {
        ^
   fs/ocfs2/namei.c:2217:6: note: Second condition
    if (ret)
        ^
>> fs/ocfs2/ocfs2_fs.h:1582:25: warning: Either the condition 'type<=3DGROU=
P_QUOTA_SYSTEM_INODE' is redundant or the array 'ocfs2_system_inodes[15]' i=
s accessed@index 15, which is out of bounds. [arrayIndexOutOfBoundsCond]
        ocfs2_system_inodes[type].si_name,
                           ^
   fs/ocfs2/ocfs2_fs.h:1577:11: note: Assuming that condition 'type<=3DGROU=
P_QUOTA_SYSTEM_INODE' is not redundant
    if (type <=3D OCFS2_LAST_GLOBAL_SYSTEM_INODE)
             ^
   fs/ocfs2/ocfs2_fs.h:1582:25: note: Array index out of bounds
        ocfs2_system_inodes[type].si_name,
                           ^
>> fs/ocfs2/xattr.c:1221:6: warning: Redundant initialization for 'ret'. Th=
e initialized value is overwritten before it is read. [redundantInitializat=
ion]
    ret =3D ocfs2_xattr_block_find(inode, name_index, name, xs);
        ^
   fs/ocfs2/xattr.c:1211:10: note: ret is initialized
    int ret =3D -ENODATA, name_offset, name_len, i;
            ^
   fs/ocfs2/xattr.c:1221:6: note: ret is overwritten
    ret =3D ocfs2_xattr_block_find(inode, name_index, name, xs);
        ^
>> fs/ocfs2/xattr.c:1627:48: warning: Local variable 'namevalue_size' shado=
ws outer function [shadowFunction]
    int namevalue_offset, first_namevalue_offset, namevalue_size;
                                                  ^
   fs/ocfs2/xattr.c:218:12: note: Shadowed declaration
   static int namevalue_size(int name_len, uint64_t value_len)
              ^
   fs/ocfs2/xattr.c:1627:48: note: Shadow variable
    int namevalue_offset, first_namevalue_offset, namevalue_size;
                                                  ^
>> fs/ocfs2/xattr.c:6681:26: warning: Parameter 'bh' can be declared with c=
onst [constParameter]
        struct buffer_head *bh,
                            ^

vim +304 arch/x86/pci/acpi.c

2c62e8492ed735 Jiang Liu     2015-04-30  294  =

4d6b4e69a245e9 Jiang Liu     2015-10-14  295  static int pci_acpi_root_prep=
are_resources(struct acpi_pci_root_info *ci)
62f420f828249f Gary Hade     2007-10-03  296  {
4d6b4e69a245e9 Jiang Liu     2015-10-14  297  	struct acpi_device *device =
=3D ci->bridge;
4d6b4e69a245e9 Jiang Liu     2015-10-14  298  	int busnum =3D ci->root->sec=
ondary.start;
63f1789ec71677 Jiang Liu     2015-03-04  299  	struct resource_entry *entry=
, *tmp;
4d6b4e69a245e9 Jiang Liu     2015-10-14  300  	int status;
62f420f828249f Gary Hade     2007-10-03  301  =

4d6b4e69a245e9 Jiang Liu     2015-10-14  302  	status =3D acpi_pci_probe_ro=
ot_resources(ci);
cdede81acc276f Bjorn Helgaas 2022-03-03  303  =

cdede81acc276f Bjorn Helgaas 2022-03-03 @304  	resource_list_for_each_entry=
(entry, &ci->resources)
cdede81acc276f Bjorn Helgaas 2022-03-03  305  		remove_e820_regions(&device=
->dev, entry->res);
cdede81acc276f Bjorn Helgaas 2022-03-03  306  =

4d6b4e69a245e9 Jiang Liu     2015-10-14  307  	if (pci_use_crs) {
4d6b4e69a245e9 Jiang Liu     2015-10-14  308  		resource_list_for_each_entr=
y_safe(entry, tmp, &ci->resources)
4d6b4e69a245e9 Jiang Liu     2015-10-14  309  			if (resource_is_pcicfg_iop=
ort(entry->res))
4d6b4e69a245e9 Jiang Liu     2015-10-14  310  				resource_list_destroy_ent=
ry(entry);
4d6b4e69a245e9 Jiang Liu     2015-10-14  311  		return status;
4d6b4e69a245e9 Jiang Liu     2015-10-14  312  	}
4d6b4e69a245e9 Jiang Liu     2015-10-14  313  =

4d6b4e69a245e9 Jiang Liu     2015-10-14  314  	resource_list_for_each_entry=
_safe(entry, tmp, &ci->resources) {
4d6b4e69a245e9 Jiang Liu     2015-10-14  315  		dev_printk(KERN_DEBUG, &dev=
ice->dev,
4d6b4e69a245e9 Jiang Liu     2015-10-14  316  			   "host bridge window %pR=
 (ignored)\n", entry->res);
63f1789ec71677 Jiang Liu     2015-03-04  317  		resource_list_destroy_entry=
(entry);
62f420f828249f Gary Hade     2007-10-03  318  	}
4d6b4e69a245e9 Jiang Liu     2015-10-14  319  	x86_pci_root_bus_resources(b=
usnum, &ci->resources);
4d6b4e69a245e9 Jiang Liu     2015-10-14  320  =

4d6b4e69a245e9 Jiang Liu     2015-10-14  321  	return 0;
63f1789ec71677 Jiang Liu     2015-03-04  322  }
62f420f828249f Gary Hade     2007-10-03  323  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3787848893945382892==--

