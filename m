Content-Type: multipart/mixed; boundary="===============5785243968616732085=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH V1 RESEND 1/4] pci: add interface to create pci-ep device tree node
Date: Wed, 09 Mar 2022 14:51:03 +0800
Message-ID: <202203091459.fdySi5dj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5785243968616732085==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220305052304.726050-2-lizhi.hou@xilinx.com>
References: <20220305052304.726050-2-lizhi.hou@xilinx.com>
TO: Lizhi Hou <lizhi.hou@xilinx.com>
TO: linux-pci(a)vger.kernel.org
TO: devicetree(a)vger.kernel.org
TO: robh(a)kernel.org
CC: Lizhi Hou <lizhi.hou@xilinx.com>
CC: yilun.xu(a)intel.com
CC: maxz(a)xilinx.com
CC: sonal.santan(a)xilinx.com
CC: yliu(a)xilinx.com
CC: michal.simek(a)xilinx.com
CC: stefanos(a)xilinx.com
CC: trix(a)redhat.com
CC: mdf(a)kernel.org
CC: dwmw2(a)infradead.org
CC: linux-kernel(a)vger.kernel.org
CC: Max Zhen <max.zhen@xilinx.com>

Hi Lizhi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on helgaas-pci/next linus/master pinchartl-media/d=
rm/du/next v5.17-rc7 next-20220308]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Lizhi-Hou/Infrastructure-t=
o-define-apertures-in-a-PCIe-device-with-a-flattened-device-tree/20220307-1=
41939
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c007-20220307 (https://download.01.org/0day-ci/ar=
chive/20220309/202203091459.fdySi5dj-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/3a2c08c0f0ef77bf1db2f1677=
721dd87f46df294
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Lizhi-Hou/Infrastructure-to-define=
-apertures-in-a-PCIe-device-with-a-flattened-device-tree/20220307-141939
        git checkout 3a2c08c0f0ef77bf1db2f1677721dd87f46df294
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/acpi/acexcep.h:58:41: note: expanded from macro 'ACPI_FAILURE'
   #define ACPI_FAILURE(a)                 (a)
                                           ^~~
   drivers/acpi/acpica/hwsleep.c:75:2: note: Taking false branch
           if (ACPI_FAILURE(status)) {
           ^
   drivers/acpi/acpica/hwsleep.c:78:20: note: Assuming the condition is fal=
se
           ACPI_DEBUG_PRINT((ACPI_DB_INIT,
                             ^
   include/acpi/acoutput.h:115:37: note: expanded from macro 'ACPI_DB_INIT'
   #define ACPI_DB_INIT                ACPI_DEBUG_LEVEL (ACPI_LV_INIT)
                                       ^
   include/acpi/acoutput.h:107:37: note: expanded from macro 'ACPI_DEBUG_LE=
VEL'
   #define ACPI_DEBUG_LEVEL(dl)        (u32) dl,ACPI_DEBUG_PARAMETERS
                                       ^
   include/acpi/acoutput.h:313:59: note: expanded from macro 'ACPI_DEBUG_PR=
INT'
   #define ACPI_DEBUG_PRINT(plist)         ACPI_ACTUAL_DEBUG plist
                                           ~~~~~~~~~~~~~~~~~~^~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/acpi/acoutput.h:299:30: note: expanded from macro 'ACPI_DO_DEBUG=
_PRINT'
                   if (ACPI_IS_DEBUG_ENABLED (level, component)) \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
   include/acpi/acoutput.h:263:4: note: expanded from macro 'ACPI_IS_DEBUG_=
ENABLED'
           ((level & acpi_dbg_level) && (component & acpi_dbg_layer))
             ^
   include/acpi/acoutput.h:281:44: note: expanded from macro 'ACPI_DO_WHILE=
0'
   #define ACPI_DO_WHILE0(a)               do a while(0)
                                              ^
   drivers/acpi/acpica/hwsleep.c:78:2: note: Left side of '&&' is false
           ACPI_DEBUG_PRINT((ACPI_DB_INIT,
           ^
   include/acpi/acoutput.h:313:41: note: expanded from macro 'ACPI_DEBUG_PR=
INT'
   #define ACPI_DEBUG_PRINT(plist)         ACPI_ACTUAL_DEBUG plist
                                           ^
   include/acpi/acoutput.h:306:2: note: expanded from macro 'ACPI_ACTUAL_DE=
BUG'
           ACPI_DO_DEBUG_PRINT (acpi_debug_print, level, line, \
           ^
   include/acpi/acoutput.h:299:7: note: expanded from macro 'ACPI_DO_DEBUG_=
PRINT'
                   if (ACPI_IS_DEBUG_ENABLED (level, component)) \
                       ^
   include/acpi/acoutput.h:263:28: note: expanded from macro 'ACPI_IS_DEBUG=
_ENABLED'
           ((level & acpi_dbg_level) && (component & acpi_dbg_layer))
                                     ^
   drivers/acpi/acpica/hwsleep.c:78:2: note: Loop condition is false.  Exit=
ing loop
           ACPI_DEBUG_PRINT((ACPI_DB_INIT,
           ^
   include/acpi/acoutput.h:313:41: note: expanded from macro 'ACPI_DEBUG_PR=
INT'
   #define ACPI_DEBUG_PRINT(plist)         ACPI_ACTUAL_DEBUG plist
                                           ^
   include/acpi/acoutput.h:306:2: note: expanded from macro 'ACPI_ACTUAL_DE=
BUG'
           ACPI_DO_DEBUG_PRINT (acpi_debug_print, level, line, \
           ^
   include/acpi/acoutput.h:298:2: note: expanded from macro 'ACPI_DO_DEBUG_=
PRINT'
           ACPI_DO_WHILE0 ({ \
           ^
   include/acpi/acoutput.h:281:41: note: expanded from macro 'ACPI_DO_WHILE=
0'
   #define ACPI_DO_WHILE0(a)               do a while(0)
                                           ^
   drivers/acpi/acpica/hwsleep.c:102:6: note: Assuming 'status' is 0
           if (ACPI_FAILURE(status)) {
               ^
   include/acpi/acexcep.h:58:41: note: expanded from macro 'ACPI_FAILURE'
   #define ACPI_FAILURE(a)                 (a)
                                           ^~~
   drivers/acpi/acpica/hwsleep.c:102:2: note: Taking false branch
           if (ACPI_FAILURE(status)) {
           ^
   drivers/acpi/acpica/hwsleep.c:113:6: note: Assuming 'sleep_state' is < A=
CPI_STATE_S4
           if (sleep_state < ACPI_STATE_S4) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/acpica/hwsleep.c:113:2: note: Taking true branch
           if (sleep_state < ACPI_STATE_S4) {
           ^
   drivers/acpi/acpica/hwsleep.c:114:3: note: Calling 'wbinvd'
                   ACPI_FLUSH_CPU_CACHE();
                   ^
   arch/x86/include/asm/acenv.h:16:32: note: expanded from macro 'ACPI_FLUS=
H_CPU_CACHE'
   #define ACPI_FLUSH_CPU_CACHE()  wbinvd()
                                   ^~~~~~~~
   arch/x86/include/asm/paravirt.h:183:2: note: Assigned value is garbage o=
r undefined
           PVOP_ALT_VCALL0(cpu.wbinvd, "wbinvd", ALT_NOT(X86_FEATURE_XENPV)=
);
           ^
   arch/x86/include/asm/paravirt_types.h:516:2: note: expanded from macro '=
PVOP_ALT_VCALL0'
           __PVOP_ALT_VCALL(op, alt, cond)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:496:8: note: expanded from macro '=
__PVOP_ALT_VCALL'
           (void)____PVOP_ALT_CALL(, op, alt, cond, CLBR_ANY,              \
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:461:3: note: expanded from macro '=
____PVOP_ALT_CALL'
                   PVOP_CALL_ARGS;                                         \
                   ^~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:405:16: note: expanded from macro =
'PVOP_CALL_ARGS'
           unsigned long __edi =3D __edi, __esi =3D __esi,             \
                         ^       ~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/pci/of.c:762:2: warning: Argument to kfree() is the address of a=
 global variable, which is not memory allocated by malloc() [clang-analyzer=
-unix.Malloc]
           kfree(prop);
           ^     ~~~~
   drivers/pci/of.c:689:7: note: 'node' is non-null
           if (!node)
                ^~~~
   drivers/pci/of.c:689:2: note: Taking false branch
           if (!node)
           ^
   drivers/pci/of.c:695:6: note: 'ret' is -12
           if (ret)
               ^~~
   drivers/pci/of.c:695:2: note: Taking true branch
           if (ret)
           ^
   drivers/pci/of.c:696:3: note: Control jumps to line 762
                   goto cleanup;
                   ^
   drivers/pci/of.c:762:2: note: Argument to kfree() is the address of a gl=
obal variable, which is not memory allocated by malloc()
           kfree(prop);
           ^     ~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   include/linux/fsnotify_backend.h:279:18: warning: Access to field 'dentr=
y' results in a dereference of a null pointer (loaded from variable 'data')=
 [clang-analyzer-core.NullDereference]
                   return d_inode(((const struct path *)data)->dentry);
                                  ^
   fs/notify/fsnotify.c:184:22: note: Assuming 'path' is null
           struct mount *mnt =3D path ? real_mount(path->mnt) : NULL;
                               ^~~~
   fs/notify/fsnotify.c:184:22: note: '?' condition is false
   fs/notify/fsnotify.c:199:6: note: Assuming field 'i_fsnotify_marks' is n=
on-null
           if (!inode->i_fsnotify_marks && !inode->i_sb->s_fsnotify_marks &&
               ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/notify/fsnotify.c:199:31: note: Left side of '&&' is false
           if (!inode->i_fsnotify_marks && !inode->i_sb->s_fsnotify_marks &&
                                        ^
   fs/notify/fsnotify.c:204:18: note: Calling 'fsnotify_event_needs_parent'
           parent_needed =3D fsnotify_event_needs_parent(inode, mnt, mask);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/notify/fsnotify.c:152:6: note: Assuming the condition is true
           if (mask & FS_ISDIR)
               ^~~~~~~~~~~~~~~
   fs/notify/fsnotify.c:152:2: note: Taking true branch
           if (mask & FS_ISDIR)
           ^
   fs/notify/fsnotify.c:153:3: note: Returning zero, which participates in =
a condition later
                   return false;
                   ^~~~~~~~~~~~
   fs/notify/fsnotify.c:204:18: note: Returning from 'fsnotify_event_needs_=
parent'
           parent_needed =3D fsnotify_event_needs_parent(inode, mnt, mask);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/notify/fsnotify.c:205:6: note: Assuming 'parent_watched' is true
           if (!parent_watched && !parent_needed)
               ^~~~~~~~~~~~~~~
   fs/notify/fsnotify.c:205:22: note: Left side of '&&' is false
           if (!parent_watched && !parent_needed)
                               ^
   fs/notify/fsnotify.c:212:15: note: 'parent_watched' is true
           if (unlikely(parent_watched && !p_mask))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/notify/fsnotify.c:212:15: note: Left side of '&&' is true
           if (unlikely(parent_watched && !p_mask))
                        ^
   fs/notify/fsnotify.c:212:33: note: Assuming 'p_mask' is not equal to 0
           if (unlikely(parent_watched && !p_mask))
                                          ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/notify/fsnotify.c:212:2: note: Taking false branch
           if (unlikely(parent_watched && !p_mask))
           ^
   fs/notify/fsnotify.c:220:6: note: 'parent_needed' is false
           if (parent_needed || parent_interested) {
               ^~~~~~~~~~~~~
   fs/notify/fsnotify.c:220:6: note: Left side of '||' is false
   fs/notify/fsnotify.c:220:23: note: Assuming 'parent_interested' is true
           if (parent_needed || parent_interested) {
                                ^~~~~~~~~~~~~~~~~
   fs/notify/fsnotify.c:220:2: note: Taking true branch
           if (parent_needed || parent_interested) {
           ^
   fs/notify/fsnotify.c:222:45: note: Passing null pointer value via 1st pa=
rameter 'data'
                   WARN_ON_ONCE(inode !=3D fsnotify_data_inode(data, data_t=
ype));
                                                             ^
   include/asm-generic/bug.h:104:25: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_on =3D !!(condition);                      \
                                  ^~~~~~~~~

vim +762 drivers/pci/of.c

3a2c08c0f0ef77b Lizhi Hou 2022-03-04  663  =

3a2c08c0f0ef77b Lizhi Hou 2022-03-04  664  /**
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  665   * devm_of_pci_create_bus_endpoi=
nt - Create a device node for the given pci device.
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  666   * @pdev: PCI device pointer.
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  667   *
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  668   * For PCI device which uses fla=
ttened device tree to describe apertures in its BARs,
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  669   * a device node for the given p=
ci device is required. Then the flattened device tree
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  670   * overlay from the device can b=
e applied to the base tree.
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  671   * The device node is under root=
 node and act like bus node. It contains a "ranges"
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  672   * property which is used for ad=
dress translation of its children. Each child node
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  673   * corresponds an aperture and u=
se BAR index and offset as its address.
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  674  =

3a2c08c0f0ef77b Lizhi Hou 2022-03-04  675   * Returns 0 on success or a neg=
ative error-code on failure.
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  676   */
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  677  int devm_of_pci_create_bus_endpo=
int(struct pci_dev *pdev)
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  678  {
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  679  	struct property *proplist =3D N=
ULL;
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  680  	struct device *dev =3D &pdev->d=
ev;
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  681  	int range_ncells, addr_ncells;
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  682  	struct device_node *node;
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  683  	void *prop =3D NULL;
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  684  	u32 *range_cell;
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  685  	__be32 val;
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  686  	int i, ret;
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  687  =

3a2c08c0f0ef77b Lizhi Hou 2022-03-04  688  	node =3D of_ep_alloc_node(pdev,=
 "pci-ep-bus");
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  689  	if (!node)
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  690  		return -ENOMEM;
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  691  =

3a2c08c0f0ef77b Lizhi Hou 2022-03-04  692  	/* the endpoint node works as '=
simple-bus' to translate aperture addresses. */
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  693  	prop =3D "simple-bus";
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  694  	ret =3D of_ep_add_property(dev,=
 &proplist, "compatible", strlen(prop) + 1, prop);
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  695  	if (ret)
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  696  		goto cleanup;
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  697  =

3a2c08c0f0ef77b Lizhi Hou 2022-03-04  698  	/* The address and size cells o=
f nodes underneath are 2 */
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  699  	val =3D cpu_to_be32(2);
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  700  	ret =3D of_ep_add_property(dev,=
 &proplist, "#address-cells", sizeof(u32), &val);
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  701  	if (ret)
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  702  		goto cleanup;
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  703  =

3a2c08c0f0ef77b Lizhi Hou 2022-03-04  704  	ret =3D of_ep_add_property(dev,=
 &proplist, "#size-cells", sizeof(u32), &val);
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  705  	if (ret)
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  706  		goto cleanup;
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  707  =

3a2c08c0f0ef77b Lizhi Hou 2022-03-04  708  	/* child address format: 0xIooo=
oooo oooooooo, I =3D bar index, o =3D offset on bar */
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  709  	addr_ncells =3D of_n_addr_cells=
(node);
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  710  	if (addr_ncells > 2) {
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  711  		/* does not support number of =
address cells greater than 2 */
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  712  		ret =3D -EINVAL;
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  713  		goto cleanup;
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  714  	}
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  715  =

3a2c08c0f0ef77b Lizhi Hou 2022-03-04  716  	/* range cells include <node ad=
dr cells> <child addr cells> <child size cells> */
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  717  	range_ncells =3D addr_ncells + =
4;
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  718  	prop =3D kzalloc(range_ncells *=
 sizeof(u32) * PCI_STD_NUM_BARS, GFP_KERNEL);
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  719  	if (!prop) {
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  720  		ret =3D -ENOMEM;
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  721  		goto cleanup;
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  722  	}
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  723  =

3a2c08c0f0ef77b Lizhi Hou 2022-03-04  724  	range_cell =3D prop;
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  725  	for (i =3D 0; i < PCI_STD_NUM_B=
ARS; i++) {
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  726  		if (!pci_resource_len(pdev, i))
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  727  			continue;
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  728  		/* highest 4 bits of address a=
re bar index */
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  729  		*(__be64 *)range_cell =3D cpu_=
to_be64((u64)i << 60);
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  730  		range_cell +=3D 2;
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  731  		if (addr_ncells =3D=3D 2)
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  732  			*(__be64 *)range_cell =3D cpu=
_to_be64((u64)pci_resource_start(pdev, i));
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  733  		else
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  734  			*(__be32 *)range_cell =3D cpu=
_to_be32((u32)pci_resource_start(pdev, i));
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  735  =

3a2c08c0f0ef77b Lizhi Hou 2022-03-04  736  		range_cell +=3D addr_ncells;
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  737  		*(__be64 *)range_cell =3D cpu_=
to_be64((u64)pci_resource_len(pdev, i));
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  738  		range_cell +=3D 2;
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  739  	}
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  740  =

3a2c08c0f0ef77b Lizhi Hou 2022-03-04  741  	/* error out if there is not PC=
I BAR been found */
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  742  	if ((void *)range_cell =3D=3D p=
rop) {
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  743  		ret =3D -EINVAL;
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  744  		goto cleanup;
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  745  	}
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  746  =

3a2c08c0f0ef77b Lizhi Hou 2022-03-04  747  	ret =3D of_ep_add_property(dev,=
 &proplist, "ranges", (void *)range_cell - prop, prop);
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  748  	kfree(prop);
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  749  	if (ret)
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  750  		goto cleanup;
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  751  =

3a2c08c0f0ef77b Lizhi Hou 2022-03-04  752  	node->properties =3D proplist;
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  753  	ret =3D of_attach_node(node);
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  754  	if (ret)
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  755  		goto cleanup;
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  756  =

3a2c08c0f0ef77b Lizhi Hou 2022-03-04  757  	devres_add(dev, node);
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  758  =

3a2c08c0f0ef77b Lizhi Hou 2022-03-04  759  	return 0;
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  760  =

3a2c08c0f0ef77b Lizhi Hou 2022-03-04  761  cleanup:
3a2c08c0f0ef77b Lizhi Hou 2022-03-04 @762  	kfree(prop);
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  763  	if (node)
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  764  		devres_free(node);
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  765  =

3a2c08c0f0ef77b Lizhi Hou 2022-03-04  766  	return ret;
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  767  }
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  768  EXPORT_SYMBOL_GPL(devm_of_pci_cr=
eate_bus_endpoint);
3a2c08c0f0ef77b Lizhi Hou 2022-03-04  769  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5785243968616732085==--

