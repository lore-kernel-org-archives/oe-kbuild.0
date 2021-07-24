Content-Type: multipart/mixed; boundary="===============8825504964619943686=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [pci:review/vga 1/9] drivers/pci/vgaarb.c:245:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 25 Jul 2021 02:00:46 +0800
Message-ID: <202107250240.b1pVquHj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8825504964619943686==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Bjorn Helgaas <helgaas@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git rev=
iew/vga
head:   d3ff98e99536cd76e77696889600ee06fe5253b2
commit: e7d0ca67cfb1c61feb5fed7632cedb69e7ccdd79 [1/9] PCI/VGA: Move vgaarb=
 to drivers/pci
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c001-20210723 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 9625ca=
5b602616b2f5584e8a49ba93c52c141e40)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git/c=
ommit/?id=3De7d0ca67cfb1c61feb5fed7632cedb69e7ccdd79
        git remote add pci https://git.kernel.org/pub/scm/linux/kernel/git/=
helgaas/pci.git
        git fetch --no-tags pci review/vga
        git checkout e7d0ca67cfb1c61feb5fed7632cedb69e7ccdd79
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross clan=
g-analyzer ARCH=3Dx86_64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                   ^~~~~~
   drivers/acpi/acpica/rscreate.c:327:5: note: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119
                                   strcpy(user_prt->source,
                                   ^~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (2 in non-user code, 29 with check filters).
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
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   fs/kernfs/symlink.c:77:3: warning: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(s, "../");
                   ^~~~~~
   fs/kernfs/symlink.c:77:3: note: Call to function 'strcpy' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcpy'. CWE-119
                   strcpy(s, "../");
                   ^~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   fs/sysfs/file.c:54:2: warning: Null pointer passed as 1st argument to me=
mory set function [clang-analyzer-unix.cstring.NullArg]
           memset(buf, 0, PAGE_SIZE);
           ^      ~~~
   fs/sysfs/file.c:49:10: note: Calling 'seq_get_buf'
           count =3D seq_get_buf(sf, &buf);
                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:65:9: note: Assuming field 'count' is <=3D fiel=
d 'size'
           BUG_ON(m->count > m->size);
                  ^
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/seq_file.h:65:2: note: Taking false branch
           BUG_ON(m->count > m->size);
           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   include/linux/seq_file.h:65:2: note: Loop condition is false.  Exiting l=
oop
           BUG_ON(m->count > m->size);
           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   include/linux/seq_file.h:66:6: note: Assuming field 'count' is >=3D fiel=
d 'size'
           if (m->count < m->size)
               ^~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:66:2: note: Taking false branch
           if (m->count < m->size)
           ^
   include/linux/seq_file.h:69:3: note: Null pointer value stored to 'buf'
                   *bufp =3D NULL;
                   ^~~~~~~~~~~~
   fs/sysfs/file.c:49:10: note: Returning from 'seq_get_buf'
           count =3D seq_get_buf(sf, &buf);
                   ^~~~~~~~~~~~~~~~~~~~~
   fs/sysfs/file.c:50:6: note: Assuming the condition is false
           if (count < PAGE_SIZE) {
               ^~~~~~~~~~~~~~~~~
   fs/sysfs/file.c:50:2: note: Taking false branch
           if (count < PAGE_SIZE) {
           ^
   fs/sysfs/file.c:54:2: note: Null pointer passed as 1st argument to memor=
y set function
           memset(buf, 0, PAGE_SIZE);
           ^      ~~~
   Suppressed 3 warnings (3 in non-user code).
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
>> drivers/pci/vgaarb.c:245:17: warning: Value stored to 'dev' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &vgadev->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/pci/vgaarb.c:245:17: note: Value stored to 'dev' during its init=
ialization is never read
           struct device *dev =3D &vgadev->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/pci/vgaarb.c:394:17: warning: Value stored to 'dev' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &vgadev->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/pci/vgaarb.c:394:17: note: Value stored to 'dev' during its init=
ialization is never read
           struct device *dev =3D &vgadev->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/pci/switch/switchtec.c:118:16: warning: Use of memory after it i=
s freed [clang-analyzer-unix.Malloc]
           stuser->state =3D state;
                         ^
   drivers/pci/switch/switchtec.c:239:10: note: Left side of '&&' is false
           stdev =3D container_of(work, struct switchtec_dev, mrpc_work);
                   ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/pci/switch/switchtec.c:239:10: note: Taking false branch
           stdev =3D container_of(work, struct switchtec_dev, mrpc_work);
                   ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/pci/switch/switchtec.c:239:10: note: Loop condition is false.  E=
xiting loop
           stdev =3D container_of(work, struct switchtec_dev, mrpc_work);
                   ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/pci/switch/switchtec.c:241:2: note: Taking false branch
           dev_dbg(&stdev->dev, "%s\n", __func__);
           ^
   include/linux/dev_printk.h:130:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/pci/switch/switchtec.c:245:2: note: Calling 'mrpc_complete_cmd'
           mrpc_complete_cmd(stdev);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/switch/switchtec.c:192:6: note: Assuming the condition is fa=
lse
           if (list_empty(&stdev->mrpc_queue))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/switch/switchtec.c:192:2: note: Taking false branch
           if (list_empty(&stdev->mrpc_queue))
           ^
   drivers/pci/switch/switchtec.c:195:11: note: Left side of '&&' is false
           stuser =3D list_entry(stdev->mrpc_queue.next, struct switchtec_u=
ser,
                    ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/pci/switch/switchtec.c:195:11: note: Taking false branch
           stuser =3D list_entry(stdev->mrpc_queue.next, struct switchtec_u=
ser,
                    ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)

vim +/dev +245 drivers/pci/vgaarb.c

deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
241  =

deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
242  static struct vga_device *__vga_tryget(struct vga_device *vgadev,
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
243  				       unsigned int rsrc)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
244  {
a75d68f62106fe drivers/gpu/vga/vgaarb.c Bjorn Helgaas          2016-11-17 @=
245  	struct device *dev =3D &vgadev->pdev->dev;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
246  	unsigned int wants, legacy_wants, match;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
247  	struct vga_device *conflict;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
248  	unsigned int pci_bits;
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  =
249  	u32 flags =3D 0;
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  =
250  =

deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
251  	/* Account for "normal" resources to lock. If we decode the legacy,
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
252  	 * counterpart, we need to request it as well
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
253  	 */
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
254  	if ((rsrc & VGA_RSRC_NORMAL_IO) &&
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
255  	    (vgadev->decodes & VGA_RSRC_LEGACY_IO))
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
256  		rsrc |=3D VGA_RSRC_LEGACY_IO;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
257  	if ((rsrc & VGA_RSRC_NORMAL_MEM) &&
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
258  	    (vgadev->decodes & VGA_RSRC_LEGACY_MEM))
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
259  		rsrc |=3D VGA_RSRC_LEGACY_MEM;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
260  =

a75d68f62106fe drivers/gpu/vga/vgaarb.c Bjorn Helgaas          2016-11-17  =
261  	vgaarb_dbg(dev, "%s: %d\n", __func__, rsrc);
a75d68f62106fe drivers/gpu/vga/vgaarb.c Bjorn Helgaas          2016-11-17  =
262  	vgaarb_dbg(dev, "%s: owns: %d\n", __func__, vgadev->owns);
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
263  =

deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
264  	/* Check what resources we need to acquire */
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
265  	wants =3D rsrc & ~vgadev->owns;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
266  =

deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
267  	/* We already own everything, just mark locked & bye bye */
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
268  	if (wants =3D=3D 0)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
269  		goto lock_them;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
270  =

deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
271  	/* We don't need to request a legacy resource, we just enable
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
272  	 * appropriate decoding and go
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
273  	 */
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
274  	legacy_wants =3D wants & VGA_RSRC_LEGACY_MASK;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
275  	if (legacy_wants =3D=3D 0)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
276  		goto enable_them;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
277  =

deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
278  	/* Ok, we don't, let's find out how we need to kick off */
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
279  	list_for_each_entry(conflict, &vga_list, list) {
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
280  		unsigned int lwants =3D legacy_wants;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
281  		unsigned int change_bridge =3D 0;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
282  =

deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
283  		/* Don't conflict with myself */
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
284  		if (vgadev =3D=3D conflict)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
285  			continue;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
286  =

deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
287  		/* Check if the architecture allows a conflict between those
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
288  		 * 2 devices or if they are on separate domains
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
289  		 */
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
290  		if (!vga_conflicts(vgadev->pdev, conflict->pdev))
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
291  			continue;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
292  =

deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
293  		/* We have a possible conflict. before we go further, we must
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
294  		 * check if we sit on the same bus as the conflicting device.
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
295  		 * if we don't, then we must tie both IO and MEM resources
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
296  		 * together since there is only a single bit controlling
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
297  		 * VGA forwarding on P2P bridges
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
298  		 */
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
299  		if (vgadev->pdev->bus !=3D conflict->pdev->bus) {
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
300  			change_bridge =3D 1;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
301  			lwants =3D VGA_RSRC_LEGACY_IO | VGA_RSRC_LEGACY_MEM;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
302  		}
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
303  =

deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
304  		/* Check if the guy has a lock on the resource. If he does,
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
305  		 * return the conflicting entry
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
306  		 */
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
307  		if (conflict->locks & lwants)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
308  			return conflict;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
309  =

4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
310  		/* Ok, now check if it owns the resource we want.  We can
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
311  		 * lock resources that are not decoded, therefore a device
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
312  		 * can own resources it doesn't decode.
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
313  		 */
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
314  		match =3D lwants & conflict->owns;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
315  		if (!match)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
316  			continue;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
317  =

deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
318  		/* looks like he doesn't have a lock, we can steal
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
319  		 * them from him
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
320  		 */
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
321  =

3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  =
322  		flags =3D 0;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
323  		pci_bits =3D 0;
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  =
324  =

4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
325  		/* If we can't control legacy resources via the bridge, we
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
326  		 * also need to disable normal decoding.
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
327  		 */
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  =
328  		if (!conflict->bridge_has_one_vga) {
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
329  			if ((match & conflict->decodes) & VGA_RSRC_LEGACY_MEM)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
330  				pci_bits |=3D PCI_COMMAND_MEMORY;
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
331  			if ((match & conflict->decodes) & VGA_RSRC_LEGACY_IO)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
332  				pci_bits |=3D PCI_COMMAND_IO;
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
333  =

4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
334  			if (pci_bits) {
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
335  				vga_irq_set_state(conflict, false);
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
336  				flags |=3D PCI_VGA_STATE_CHANGE_DECODES;
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
337  			}
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  =
338  		}
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  =
339  =

3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  =
340  		if (change_bridge)
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  =
341  			flags |=3D PCI_VGA_STATE_CHANGE_BRIDGE;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
342  =

3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  =
343  		pci_set_vga_state(conflict->pdev, false, pci_bits, flags);
f22d776f3e280e drivers/gpu/vga/vgaarb.c Alex Williamson        2013-08-15  =
344  		conflict->owns &=3D ~match;
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
345  =

4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
346  		/* If we disabled normal decoding, reflect it in owns */
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
347  		if (pci_bits & PCI_COMMAND_MEMORY)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
348  			conflict->owns &=3D ~VGA_RSRC_NORMAL_MEM;
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
349  		if (pci_bits & PCI_COMMAND_IO)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
350  			conflict->owns &=3D ~VGA_RSRC_NORMAL_IO;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
351  	}
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
352  =

deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
353  enable_them:
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
354  	/* ok dude, we got it, everybody conflicting has been disabled, let's
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
355  	 * enable us.  Mark any bits in "owns" regardless of whether we
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
356  	 * decoded them.  We can lock resources we don't decode, therefore
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
357  	 * we must track them via "owns".
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
358  	 */
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  =
359  	flags =3D 0;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
360  	pci_bits =3D 0;
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  =
361  =

3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  =
362  	if (!vgadev->bridge_has_one_vga) {
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  =
363  		flags |=3D PCI_VGA_STATE_CHANGE_DECODES;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
364  		if (wants & (VGA_RSRC_LEGACY_MEM|VGA_RSRC_NORMAL_MEM))
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
365  			pci_bits |=3D PCI_COMMAND_MEMORY;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
366  		if (wants & (VGA_RSRC_LEGACY_IO|VGA_RSRC_NORMAL_IO))
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
367  			pci_bits |=3D PCI_COMMAND_IO;
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  =
368  	}
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
369  	if (wants & VGA_RSRC_LEGACY_MASK)
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  =
370  		flags |=3D PCI_VGA_STATE_CHANGE_BRIDGE;
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  =
371  =

3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  =
372  	pci_set_vga_state(vgadev->pdev, true, pci_bits, flags);
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
373  =

5d90ccf908bd80 drivers/gpu/vga/vgaarb.c Thierry Reding         2015-08-12  =
374  	if (!vgadev->bridge_has_one_vga)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
375  		vga_irq_set_state(vgadev, true);
5d90ccf908bd80 drivers/gpu/vga/vgaarb.c Thierry Reding         2015-08-12  =
376  =

4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
377  	vgadev->owns |=3D wants;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
378  lock_them:
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
379  	vgadev->locks |=3D (rsrc & VGA_RSRC_LEGACY_MASK);
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
380  	if (rsrc & VGA_RSRC_LEGACY_IO)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
381  		vgadev->io_lock_cnt++;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
382  	if (rsrc & VGA_RSRC_LEGACY_MEM)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
383  		vgadev->mem_lock_cnt++;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
384  	if (rsrc & VGA_RSRC_NORMAL_IO)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
385  		vgadev->io_norm_cnt++;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
386  	if (rsrc & VGA_RSRC_NORMAL_MEM)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
387  		vgadev->mem_norm_cnt++;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
388  =

deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
389  	return NULL;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
390  }
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
391  =


:::::: The code at line 245 was first introduced by commit
:::::: a75d68f62106fe66c4b8b96c0ee7155bdafc6f06 vgaarb: Use dev_printk() wh=
en possible

:::::: TO: Bjorn Helgaas <bhelgaas@google.com>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8825504964619943686==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
/pDyojgpL7X/AZXyZiLYOgIA
--===============8825504964619943686==--

