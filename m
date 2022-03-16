Content-Type: multipart/mixed; boundary="===============7954481080824477709=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 11036/12845] drivers/pci/vgaarb.c:235:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 16 Mar 2022 09:22:18 +0800
Message-ID: <202203160941.xIaGxvoZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7954481080824477709==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Bjorn Helgaas <helgaas@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   a32cd981a6da2373c093d471ee4405a915e217d5
commit: 1d38fe6ee6a874675ca3bba6b48e69a0e6176ffc [11036/12845] PCI/VGA: Mov=
e vgaarb to drivers/pci
:::::: branch date: 12 hours ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20316/202203160941.xIaGxvoZ-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6b2f5=
0fb47da3baeee10b1906da6e30ac5d26ec)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D1d38fe6ee6a874675ca3bba6b48e69a0e6176ffc
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 1d38fe6ee6a874675ca3bba6b48e69a0e6176ffc
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/xfs/libxfs/xfs_rmap.c:2677:9: note: Assuming the condition is false
           ASSERT(XFS_RMAP_NON_INODE_OWNER(owner) ||
                  ^
   fs/xfs/libxfs/xfs_format.h:1433:43: note: expanded from macro 'XFS_RMAP_=
NON_INODE_OWNER'
   #define XFS_RMAP_NON_INODE_OWNER(owner) (!!((owner) & (1ULL << 63)))
                                             ^
   fs/xfs/xfs_linux.h:208:10: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : assfail(NULL, #expr, __FILE__, __LINE_=
_))
            ~~~~~~~^~~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   fs/xfs/libxfs/xfs_rmap.c:2677:41: note: Left side of '||' is true
           ASSERT(XFS_RMAP_NON_INODE_OWNER(owner) ||
                                                  ^
   fs/xfs/libxfs/xfs_rmap.c:2677:2: note: '?' condition is true
           ASSERT(XFS_RMAP_NON_INODE_OWNER(owner) ||
           ^
   fs/xfs/xfs_linux.h:208:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : assfail(NULL, #expr, __FILE__, __LINE_=
_))
            ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^
   fs/xfs/libxfs/xfs_rmap.c:2682:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/xfs/libxfs/xfs_rmap.c:2682:2: note: Taking false branch
           if (error)
           ^
   fs/xfs/libxfs/xfs_rmap.c:2684:6: note: Assuming 'has_record' is not equa=
l to 0
           if (!has_record) {
               ^~~~~~~~~~~
   fs/xfs/libxfs/xfs_rmap.c:2684:2: note: Taking false branch
           if (!has_record) {
           ^
   fs/xfs/libxfs/xfs_rmap.c:2689:10: note: Calling 'xfs_rmap_get_rec'
           error =3D xfs_rmap_get_rec(cur, &irec, &has_record);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_rmap.c:209:6: note: Assuming 'error' is 0
           if (error || !*stat)
               ^~~~~
   fs/xfs/libxfs/xfs_rmap.c:209:6: note: Left side of '||' is false
   fs/xfs/libxfs/xfs_rmap.c:209:15: note: Assuming the condition is false
           if (error || !*stat)
                        ^~~~~~
   fs/xfs/libxfs/xfs_rmap.c:209:2: note: Taking false branch
           if (error || !*stat)
           ^
   fs/xfs/libxfs/xfs_rmap.c:212:6: note: Calling 'xfs_rmap_btrec_to_irec'
           if (xfs_rmap_btrec_to_irec(rec, irec))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_rmap.c:190:9: note: Calling 'xfs_rmap_irec_offset_unpa=
ck'
           return xfs_rmap_irec_offset_unpack(be64_to_cpu(rec->rmap.rm_offs=
et),
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/xfs/libxfs/xfs_rmap.h:70:6: note: Assuming the condition is true
           if (offset & ~(XFS_RMAP_OFF_MASK | XFS_RMAP_OFF_FLAGS))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_rmap.h:70:2: note: Taking true branch
           if (offset & ~(XFS_RMAP_OFF_MASK | XFS_RMAP_OFF_FLAGS))
           ^
   fs/xfs/libxfs/xfs_rmap.h:71:3: note: Returning without writing to 'irec-=
>rm_flags'
                   return -EFSCORRUPTED;
                   ^
   fs/xfs/libxfs/xfs_rmap.h:71:3: note: Returning the value -117, which par=
ticipates in a condition later
                   return -EFSCORRUPTED;
                   ^~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_rmap.c:190:9: note: Returning from 'xfs_rmap_irec_offs=
et_unpack'
           return xfs_rmap_irec_offset_unpack(be64_to_cpu(rec->rmap.rm_offs=
et),
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/xfs/libxfs/xfs_rmap.c:190:2: note: Returning without writing to 'irec=
->rm_flags'
           return xfs_rmap_irec_offset_unpack(be64_to_cpu(rec->rmap.rm_offs=
et),
           ^
   fs/xfs/libxfs/xfs_rmap.c:190:2: note: Returning the value -117, which pa=
rticipates in a condition later
           return xfs_rmap_irec_offset_unpack(be64_to_cpu(rec->rmap.rm_offs=
et),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/xfs/libxfs/xfs_rmap.c:212:6: note: Returning from 'xfs_rmap_btrec_to_=
irec'
           if (xfs_rmap_btrec_to_irec(rec, irec))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_rmap.c:212:2: note: Taking true branch
           if (xfs_rmap_btrec_to_irec(rec, irec))
           ^
   fs/xfs/libxfs/xfs_rmap.c:213:3: note: Control jumps to line 241
                   goto out_bad_rec;
                   ^
   fs/xfs/libxfs/xfs_rmap.c:244:2: note: 4th function call argument is an u=
ninitialized value
           xfs_warn(mp,
           ^
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/pci/vgaarb.c:235:17: warning: Value stored to 'dev' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &vgadev->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/pci/vgaarb.c:235:17: note: Value stored to 'dev' during its init=
ialization is never read
           struct device *dev =3D &vgadev->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/pci/vgaarb.c:373:17: warning: Value stored to 'dev' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &vgadev->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/pci/vgaarb.c:373:17: note: Value stored to 'dev' during its init=
ialization is never read
           struct device *dev =3D &vgadev->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/greybus/manifest.c:56:2: warning: Use of memory after it is free=
d [clang-analyzer-unix.Malloc]
           list_for_each_entry_safe(descriptor, next, &intf->manifest_descs=
, links)
           ^
   include/linux/list.h:728:20: note: expanded from macro 'list_for_each_en=
try_safe'
                pos =3D n, n =3D list_next_entry(n, member))
                             ^
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^
   drivers/greybus/manifest.c:464:6: note: Assuming '__ret_warn_on' is 0
           if (WARN_ON(!list_empty(&intf->manifest_descs)))
               ^
   include/asm-generic/bug.h:122:6: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
               ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   drivers/greybus/manifest.c:464:6: note: Taking false branch
           if (WARN_ON(!list_empty(&intf->manifest_descs)))
               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   drivers/greybus/manifest.c:464:2: note: Taking false branch
           if (WARN_ON(!list_empty(&intf->manifest_descs)))
           ^
   drivers/greybus/manifest.c:468:6: note: Assuming the condition is false
           if (size < sizeof(*header)) {
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/greybus/manifest.c:468:2: note: Taking false branch
           if (size < sizeof(*header)) {
           ^
   drivers/greybus/manifest.c:478:6: note: Assuming 'manifest_size' is equa=
l to 'size'
           if (manifest_size !=3D size) {
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/greybus/manifest.c:478:2: note: Taking false branch
           if (manifest_size !=3D size) {
           ^
   drivers/greybus/manifest.c:485:6: note: Assuming field 'version_major' i=
s <=3D GREYBUS_VERSION_MAJOR
           if (header->version_major > GREYBUS_VERSION_MAJOR) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/greybus/manifest.c:485:2: note: Taking false branch
           if (header->version_major > GREYBUS_VERSION_MAJOR) {
           ^
   drivers/greybus/manifest.c:495:2: note: Loop condition is false. Executi=
on continues on line 508
           while (size) {
           ^
   drivers/greybus/manifest.c:508:2: note: Loop condition is true.  Enterin=
g loop body
           list_for_each_entry(descriptor, &intf->manifest_descs, links) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/greybus/manifest.c:509:7: note: Assuming field 'type' is equal t=
o GREYBUS_TYPE_INTERFACE
                   if (descriptor->type =3D=3D GREYBUS_TYPE_INTERFACE)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/greybus/manifest.c:509:3: note: Taking true branch
                   if (descriptor->type =3D=3D GREYBUS_TYPE_INTERFACE)
                   ^
   drivers/greybus/manifest.c:510:4: note: Taking true branch
                           if (!found++)
                           ^
   drivers/greybus/manifest.c:508:2: note: Loop condition is false. Executi=
on continues on line 513
           list_for_each_entry(descriptor, &intf->manifest_descs, links) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/greybus/manifest.c:513:6: note: 'found' is equal to 1
           if (found !=3D 1) {
               ^~~~~
   drivers/greybus/manifest.c:513:2: note: Taking false branch
           if (found !=3D 1) {

vim +/dev +235 drivers/pci/vgaarb.c

deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 231  =

deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 232  static struct vga_device *__vga_tryget(struct vga_device *vgadev,
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 233  				       unsigned int rsrc)
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 234  {
a75d68f62106fe6 drivers/gpu/vga/vgaarb.c Bjorn Helgaas          2016-11-17 =
@235  	struct device *dev =3D &vgadev->pdev->dev;
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 236  	unsigned int wants, legacy_wants, match;
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 237  	struct vga_device *conflict;
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 238  	unsigned int pci_bits;
3448a19da479b6b drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01 =
 239  	u32 flags =3D 0;
3448a19da479b6b drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01 =
 240  =

deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 241  	/* Account for "normal" resources to lock. If we decode the legacy,
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 242  	 * counterpart, we need to request it as well
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 243  	 */
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 244  	if ((rsrc & VGA_RSRC_NORMAL_IO) &&
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 245  	    (vgadev->decodes & VGA_RSRC_LEGACY_IO))
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 246  		rsrc |=3D VGA_RSRC_LEGACY_IO;
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 247  	if ((rsrc & VGA_RSRC_NORMAL_MEM) &&
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 248  	    (vgadev->decodes & VGA_RSRC_LEGACY_MEM))
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 249  		rsrc |=3D VGA_RSRC_LEGACY_MEM;
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 250  =

a75d68f62106fe6 drivers/gpu/vga/vgaarb.c Bjorn Helgaas          2016-11-17 =
 251  	vgaarb_dbg(dev, "%s: %d\n", __func__, rsrc);
a75d68f62106fe6 drivers/gpu/vga/vgaarb.c Bjorn Helgaas          2016-11-17 =
 252  	vgaarb_dbg(dev, "%s: owns: %d\n", __func__, vgadev->owns);
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 253  =

deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 254  	/* Check what resources we need to acquire */
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 255  	wants =3D rsrc & ~vgadev->owns;
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 256  =

deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 257  	/* We already own everything, just mark locked & bye bye */
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 258  	if (wants =3D=3D 0)
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 259  		goto lock_them;
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 260  =

deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 261  	/* We don't need to request a legacy resource, we just enable
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 262  	 * appropriate decoding and go
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 263  	 */
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 264  	legacy_wants =3D wants & VGA_RSRC_LEGACY_MASK;
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 265  	if (legacy_wants =3D=3D 0)
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 266  		goto enable_them;
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 267  =

deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 268  	/* Ok, we don't, let's find out how we need to kick off */
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 269  	list_for_each_entry(conflict, &vga_list, list) {
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 270  		unsigned int lwants =3D legacy_wants;
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 271  		unsigned int change_bridge =3D 0;
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 272  =

deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 273  		/* Don't conflict with myself */
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 274  		if (vgadev =3D=3D conflict)
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 275  			continue;
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 276  =

deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 277  		/* We have a possible conflict. before we go further, we must
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 278  		 * check if we sit on the same bus as the conflicting device.
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 279  		 * if we don't, then we must tie both IO and MEM resources
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 280  		 * together since there is only a single bit controlling
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 281  		 * VGA forwarding on P2P bridges
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 282  		 */
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 283  		if (vgadev->pdev->bus !=3D conflict->pdev->bus) {
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 284  			change_bridge =3D 1;
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 285  			lwants =3D VGA_RSRC_LEGACY_IO | VGA_RSRC_LEGACY_MEM;
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 286  		}
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 287  =

deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 288  		/* Check if the guy has a lock on the resource. If he does,
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 289  		 * return the conflicting entry
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 290  		 */
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 291  		if (conflict->locks & lwants)
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 292  			return conflict;
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 293  =

4e4e7dc55af5aa6 drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03 =
 294  		/* Ok, now check if it owns the resource we want.  We can
4e4e7dc55af5aa6 drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03 =
 295  		 * lock resources that are not decoded, therefore a device
4e4e7dc55af5aa6 drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03 =
 296  		 * can own resources it doesn't decode.
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 297  		 */
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 298  		match =3D lwants & conflict->owns;
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 299  		if (!match)
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 300  			continue;
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 301  =

deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 302  		/* looks like he doesn't have a lock, we can steal
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 303  		 * them from him
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 304  		 */
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 305  =

3448a19da479b6b drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01 =
 306  		flags =3D 0;
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 307  		pci_bits =3D 0;
3448a19da479b6b drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01 =
 308  =

4e4e7dc55af5aa6 drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03 =
 309  		/* If we can't control legacy resources via the bridge, we
4e4e7dc55af5aa6 drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03 =
 310  		 * also need to disable normal decoding.
4e4e7dc55af5aa6 drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03 =
 311  		 */
3448a19da479b6b drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01 =
 312  		if (!conflict->bridge_has_one_vga) {
4e4e7dc55af5aa6 drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03 =
 313  			if ((match & conflict->decodes) & VGA_RSRC_LEGACY_MEM)
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 314  				pci_bits |=3D PCI_COMMAND_MEMORY;
4e4e7dc55af5aa6 drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03 =
 315  			if ((match & conflict->decodes) & VGA_RSRC_LEGACY_IO)
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 316  				pci_bits |=3D PCI_COMMAND_IO;
4e4e7dc55af5aa6 drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03 =
 317  =

f6b1772b255504e drivers/gpu/vga/vgaarb.c Christoph Hellwig      2021-07-16 =
 318  			if (pci_bits)
4e4e7dc55af5aa6 drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03 =
 319  				flags |=3D PCI_VGA_STATE_CHANGE_DECODES;
4e4e7dc55af5aa6 drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03 =
 320  		}
3448a19da479b6b drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01 =
 321  =

3448a19da479b6b drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01 =
 322  		if (change_bridge)
3448a19da479b6b drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01 =
 323  			flags |=3D PCI_VGA_STATE_CHANGE_BRIDGE;
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 324  =

3448a19da479b6b drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01 =
 325  		pci_set_vga_state(conflict->pdev, false, pci_bits, flags);
f22d776f3e280e6 drivers/gpu/vga/vgaarb.c Alex Williamson        2013-08-15 =
 326  		conflict->owns &=3D ~match;
4e4e7dc55af5aa6 drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03 =
 327  =

4e4e7dc55af5aa6 drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03 =
 328  		/* If we disabled normal decoding, reflect it in owns */
4e4e7dc55af5aa6 drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03 =
 329  		if (pci_bits & PCI_COMMAND_MEMORY)
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 330  			conflict->owns &=3D ~VGA_RSRC_NORMAL_MEM;
4e4e7dc55af5aa6 drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03 =
 331  		if (pci_bits & PCI_COMMAND_IO)
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 332  			conflict->owns &=3D ~VGA_RSRC_NORMAL_IO;
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 333  	}
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 334  =

deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 335  enable_them:
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 336  	/* ok dude, we got it, everybody conflicting has been disabled, let's
4e4e7dc55af5aa6 drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03 =
 337  	 * enable us.  Mark any bits in "owns" regardless of whether we
4e4e7dc55af5aa6 drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03 =
 338  	 * decoded them.  We can lock resources we don't decode, therefore
4e4e7dc55af5aa6 drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03 =
 339  	 * we must track them via "owns".
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 340  	 */
3448a19da479b6b drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01 =
 341  	flags =3D 0;
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 342  	pci_bits =3D 0;
3448a19da479b6b drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01 =
 343  =

3448a19da479b6b drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01 =
 344  	if (!vgadev->bridge_has_one_vga) {
3448a19da479b6b drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01 =
 345  		flags |=3D PCI_VGA_STATE_CHANGE_DECODES;
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 346  		if (wants & (VGA_RSRC_LEGACY_MEM|VGA_RSRC_NORMAL_MEM))
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 347  			pci_bits |=3D PCI_COMMAND_MEMORY;
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 348  		if (wants & (VGA_RSRC_LEGACY_IO|VGA_RSRC_NORMAL_IO))
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 349  			pci_bits |=3D PCI_COMMAND_IO;
3448a19da479b6b drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01 =
 350  	}
4e4e7dc55af5aa6 drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03 =
 351  	if (wants & VGA_RSRC_LEGACY_MASK)
3448a19da479b6b drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01 =
 352  		flags |=3D PCI_VGA_STATE_CHANGE_BRIDGE;
3448a19da479b6b drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01 =
 353  =

3448a19da479b6b drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01 =
 354  	pci_set_vga_state(vgadev->pdev, true, pci_bits, flags);
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 355  =

4e4e7dc55af5aa6 drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03 =
 356  	vgadev->owns |=3D wants;
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 357  lock_them:
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 358  	vgadev->locks |=3D (rsrc & VGA_RSRC_LEGACY_MASK);
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 359  	if (rsrc & VGA_RSRC_LEGACY_IO)
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 360  		vgadev->io_lock_cnt++;
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 361  	if (rsrc & VGA_RSRC_LEGACY_MEM)
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 362  		vgadev->mem_lock_cnt++;
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 363  	if (rsrc & VGA_RSRC_NORMAL_IO)
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 364  		vgadev->io_norm_cnt++;
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 365  	if (rsrc & VGA_RSRC_NORMAL_MEM)
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 366  		vgadev->mem_norm_cnt++;
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 367  =

deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 368  	return NULL;
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 369  }
deb2d2ecd43dfc5 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11 =
 370  =


:::::: The code at line 235 was first introduced by commit
:::::: a75d68f62106fe66c4b8b96c0ee7155bdafc6f06 vgaarb: Use dev_printk() wh=
en possible

:::::: TO: Bjorn Helgaas <bhelgaas@google.com>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7954481080824477709==--

