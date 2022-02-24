Content-Type: multipart/mixed; boundary="===============4595634102839022848=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [helgaas-pci:pci/vga 1/11] drivers/pci/vgaarb.c:235:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 24 Feb 2022 19:04:49 +0800
Message-ID: <202202241915.4hXT9IyN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4595634102839022848==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-pci(a)vger.kernel.org
TO: Bjorn Helgaas <helgaas@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git pci=
/vga
head:   fd2692370d56a7f1c1a806dfd1494c6e1fb01f7a
commit: d6e1898bfa5b100301a9c6d366ac3e32bc8f9a64 [1/11] PCI/VGA: Move vgaar=
b to drivers/pci
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20224/202202241915.4hXT9IyN-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git/c=
ommit/?id=3Dd6e1898bfa5b100301a9c6d366ac3e32bc8f9a64
        git remote add helgaas-pci https://git.kernel.org/pub/scm/linux/ker=
nel/git/helgaas/pci.git
        git fetch --no-tags helgaas-pci pci/vga
        git checkout d6e1898bfa5b100301a9c6d366ac3e32bc8f9a64
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvdimm/security.c:516:3: note: Taking false branch
                   if (sysfs_streq(cmd, ops[i].name))
                   ^
   drivers/nvdimm/security.c:515:2: note: Loop condition is true.  Entering=
 loop body
           for (i =3D 0; i < ARRAY_SIZE(ops); i++)
           ^
   drivers/nvdimm/security.c:516:7: note: Assuming the condition is false
                   if (sysfs_streq(cmd, ops[i].name))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvdimm/security.c:516:3: note: Taking false branch
                   if (sysfs_streq(cmd, ops[i].name))
                   ^
   drivers/nvdimm/security.c:515:2: note: Loop condition is true.  Entering=
 loop body
           for (i =3D 0; i < ARRAY_SIZE(ops); i++)
           ^
   drivers/nvdimm/security.c:516:7: note: Assuming the condition is true
                   if (sysfs_streq(cmd, ops[i].name))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvdimm/security.c:516:3: note: Taking true branch
                   if (sysfs_streq(cmd, ops[i].name))
                   ^
   drivers/nvdimm/security.c:517:4: note:  Execution continues on line 518
                           break;
                           ^
   drivers/nvdimm/security.c:518:2: note: Taking false branch
           if (i >=3D ARRAY_SIZE(ops))
           ^
   drivers/nvdimm/security.c:520:6: note: Assuming field 'args' is <=3D 1
           if (ops[i].args > 1)
               ^~~~~~~~~~~~~~~
   drivers/nvdimm/security.c:520:2: note: Taking false branch
           if (ops[i].args > 1)
           ^
   drivers/nvdimm/security.c:522:6: note: 'rc' is >=3D 0
           if (rc >=3D 0 && ops[i].args > 2)
               ^~
   drivers/nvdimm/security.c:522:6: note: Left side of '&&' is true
   drivers/nvdimm/security.c:522:24: note: Field 'args' is <=3D 2
           if (rc >=3D 0 && ops[i].args > 2)
                                 ^
   drivers/nvdimm/security.c:522:2: note: Taking false branch
           if (rc >=3D 0 && ops[i].args > 2)
           ^
   drivers/nvdimm/security.c:524:6: note: 'rc' is >=3D 0
           if (rc < 0)
               ^~
   drivers/nvdimm/security.c:524:2: note: Taking false branch
           if (rc < 0)
           ^
   drivers/nvdimm/security.c:527:6: note: 'i' is not equal to OP_FREEZE
           if (i =3D=3D OP_FREEZE) {
               ^
   drivers/nvdimm/security.c:527:2: note: Taking false branch
           if (i =3D=3D OP_FREEZE) {
           ^
   drivers/nvdimm/security.c:530:13: note: 'i' is not equal to OP_DISABLE
           } else if (i =3D=3D OP_DISABLE) {
                      ^
   drivers/nvdimm/security.c:530:9: note: Taking false branch
           } else if (i =3D=3D OP_DISABLE) {
                  ^
   drivers/nvdimm/security.c:533:13: note: 'i' is not equal to OP_UPDATE
           } else if (i =3D=3D OP_UPDATE || i =3D=3D OP_MASTER_UPDATE) {
                      ^
   drivers/nvdimm/security.c:533:13: note: Left side of '||' is false
   drivers/nvdimm/security.c:533:31: note: 'i' is not equal to OP_MASTER_UP=
DATE
           } else if (i =3D=3D OP_UPDATE || i =3D=3D OP_MASTER_UPDATE) {
                                        ^
   drivers/nvdimm/security.c:533:9: note: Taking false branch
           } else if (i =3D=3D OP_UPDATE || i =3D=3D OP_MASTER_UPDATE) {
                  ^
   drivers/nvdimm/security.c:537:13: note: 'i' is equal to OP_ERASE
           } else if (i =3D=3D OP_ERASE || i =3D=3D OP_MASTER_ERASE) {
                      ^
   drivers/nvdimm/security.c:537:27: note: Left side of '||' is true
           } else if (i =3D=3D OP_ERASE || i =3D=3D OP_MASTER_ERASE) {
                                    ^
   drivers/nvdimm/security.c:538:3: note: Taking false branch
                   dev_dbg(dev, "%s %u\n", ops[i].name, key);
                   ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/nvdimm/security.c:539:7: note: Assuming the condition is false
                   if (atomic_read(&nvdimm->busy)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvdimm/security.c:539:3: note: Taking false branch
                   if (atomic_read(&nvdimm->busy)) {
                   ^
   drivers/nvdimm/security.c:543:36: note: 'i' is equal to OP_ERASE
                   rc =3D security_erase(nvdimm, key, i =3D=3D OP_ERASE
                                                    ^
   drivers/nvdimm/security.c:543:36: note: '?' condition is true
   drivers/nvdimm/security.c:543:8: note: 2nd function call argument is an =
uninitialized value
                   rc =3D security_erase(nvdimm, key, i =3D=3D OP_ERASE
                        ^                      ~~~
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   kernel/locking/rtmutex.c:313:6: warning: Access to field 'prio' results =
in a dereference of a null pointer (loaded from variable 'left') [clang-ana=
lyzer-core.NullDereference]
           if (left->prio < right->prio)
               ^
   kernel/locking/rtmutex_api.c:459:2: note: Loop condition is false.  Exit=
ing loop
           raw_spin_lock_irqsave(&task->pi_lock, flags);
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   kernel/locking/rtmutex_api.c:462:6: note: Assuming 'waiter' is non-null
           if (!waiter || rt_mutex_waiter_equal(waiter, task_to_waiter(task=
))) {
               ^~~~~~~
   kernel/locking/rtmutex_api.c:462:6: note: Left side of '||' is false
   kernel/locking/rtmutex_api.c:462:2: note: Taking false branch
           if (!waiter || rt_mutex_waiter_equal(waiter, task_to_waiter(task=
))) {
           ^
   kernel/locking/rtmutex_api.c:467:2: note: Loop condition is false.  Exit=
ing loop
           raw_spin_unlock_irqrestore(&task->pi_lock, flags);
           ^
   include/linux/spinlock.h:278:2: note: expanded from macro 'raw_spin_unlo=
ck_irqrestore'
           do {                                                    \
           ^
   kernel/locking/rtmutex_api.c:472:2: note: Calling 'rt_mutex_adjust_prio_=
chain'
           rt_mutex_adjust_prio_chain(task, RT_MUTEX_MIN_CHAINWALK, NULL,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rtmutex.c:600:6: note: Assuming the condition is false
           if (++depth > max_lock_depth) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rtmutex.c:600:2: note: Taking false branch
           if (++depth > max_lock_depth) {
           ^
   kernel/locking/rtmutex.c:644:6: note: Assuming 'waiter' is non-null
           if (!waiter)
               ^~~~~~~
   kernel/locking/rtmutex.c:644:2: note: Taking false branch
           if (!waiter)
           ^
   kernel/locking/rtmutex.c:651:6: note: 'orig_waiter' is null
           if (orig_waiter && !rt_mutex_owner(orig_lock))
               ^~~~~~~~~~~
   kernel/locking/rtmutex.c:651:18: note: Left side of '&&' is false
           if (orig_waiter && !rt_mutex_owner(orig_lock))
                           ^
   kernel/locking/rtmutex.c:663:6: note: Assuming 'next_lock' is equal to f=
ield 'lock'
           if (next_lock !=3D waiter->lock)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rtmutex.c:663:2: note: Taking false branch
           if (next_lock !=3D waiter->lock)
           ^
   kernel/locking/rtmutex.c:688:36: note: Left side of '&&' is false
           if (IS_ENABLED(CONFIG_PREEMPT_RT) && waiter->ww_ctx && detect_de=
adlock)
                                             ^
   kernel/locking/rtmutex.c:696:6: note: 'top_waiter' is null
           if (top_waiter) {
               ^~~~~~~~~~
   kernel/locking/rtmutex.c:696:2: note: Taking false branch

vim +/dev +235 drivers/pci/vgaarb.c

deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
231  =

deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
232  static struct vga_device *__vga_tryget(struct vga_device *vgadev,
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
233  				       unsigned int rsrc)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
234  {
a75d68f62106fe drivers/gpu/vga/vgaarb.c Bjorn Helgaas          2016-11-17 @=
235  	struct device *dev =3D &vgadev->pdev->dev;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
236  	unsigned int wants, legacy_wants, match;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
237  	struct vga_device *conflict;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
238  	unsigned int pci_bits;
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  =
239  	u32 flags =3D 0;
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  =
240  =

deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
241  	/* Account for "normal" resources to lock. If we decode the legacy,
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
242  	 * counterpart, we need to request it as well
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
243  	 */
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
244  	if ((rsrc & VGA_RSRC_NORMAL_IO) &&
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
245  	    (vgadev->decodes & VGA_RSRC_LEGACY_IO))
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
246  		rsrc |=3D VGA_RSRC_LEGACY_IO;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
247  	if ((rsrc & VGA_RSRC_NORMAL_MEM) &&
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
248  	    (vgadev->decodes & VGA_RSRC_LEGACY_MEM))
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
249  		rsrc |=3D VGA_RSRC_LEGACY_MEM;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
250  =

a75d68f62106fe drivers/gpu/vga/vgaarb.c Bjorn Helgaas          2016-11-17  =
251  	vgaarb_dbg(dev, "%s: %d\n", __func__, rsrc);
a75d68f62106fe drivers/gpu/vga/vgaarb.c Bjorn Helgaas          2016-11-17  =
252  	vgaarb_dbg(dev, "%s: owns: %d\n", __func__, vgadev->owns);
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
253  =

deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
254  	/* Check what resources we need to acquire */
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
255  	wants =3D rsrc & ~vgadev->owns;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
256  =

deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
257  	/* We already own everything, just mark locked & bye bye */
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
258  	if (wants =3D=3D 0)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
259  		goto lock_them;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
260  =

deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
261  	/* We don't need to request a legacy resource, we just enable
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
262  	 * appropriate decoding and go
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
263  	 */
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
264  	legacy_wants =3D wants & VGA_RSRC_LEGACY_MASK;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
265  	if (legacy_wants =3D=3D 0)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
266  		goto enable_them;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
267  =

deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
268  	/* Ok, we don't, let's find out how we need to kick off */
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
269  	list_for_each_entry(conflict, &vga_list, list) {
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
270  		unsigned int lwants =3D legacy_wants;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
271  		unsigned int change_bridge =3D 0;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
272  =

deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
273  		/* Don't conflict with myself */
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
274  		if (vgadev =3D=3D conflict)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
275  			continue;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
276  =

deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
277  		/* We have a possible conflict. before we go further, we must
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
278  		 * check if we sit on the same bus as the conflicting device.
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
279  		 * if we don't, then we must tie both IO and MEM resources
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
280  		 * together since there is only a single bit controlling
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
281  		 * VGA forwarding on P2P bridges
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
282  		 */
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
283  		if (vgadev->pdev->bus !=3D conflict->pdev->bus) {
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
284  			change_bridge =3D 1;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
285  			lwants =3D VGA_RSRC_LEGACY_IO | VGA_RSRC_LEGACY_MEM;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
286  		}
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
287  =

deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
288  		/* Check if the guy has a lock on the resource. If he does,
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
289  		 * return the conflicting entry
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
290  		 */
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
291  		if (conflict->locks & lwants)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
292  			return conflict;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
293  =

4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
294  		/* Ok, now check if it owns the resource we want.  We can
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
295  		 * lock resources that are not decoded, therefore a device
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
296  		 * can own resources it doesn't decode.
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
297  		 */
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
298  		match =3D lwants & conflict->owns;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
299  		if (!match)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
300  			continue;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
301  =

deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
302  		/* looks like he doesn't have a lock, we can steal
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
303  		 * them from him
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
304  		 */
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
305  =

3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  =
306  		flags =3D 0;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
307  		pci_bits =3D 0;
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  =
308  =

4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
309  		/* If we can't control legacy resources via the bridge, we
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
310  		 * also need to disable normal decoding.
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
311  		 */
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  =
312  		if (!conflict->bridge_has_one_vga) {
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
313  			if ((match & conflict->decodes) & VGA_RSRC_LEGACY_MEM)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
314  				pci_bits |=3D PCI_COMMAND_MEMORY;
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
315  			if ((match & conflict->decodes) & VGA_RSRC_LEGACY_IO)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
316  				pci_bits |=3D PCI_COMMAND_IO;
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
317  =

f6b1772b255504 drivers/gpu/vga/vgaarb.c Christoph Hellwig      2021-07-16  =
318  			if (pci_bits)
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
319  				flags |=3D PCI_VGA_STATE_CHANGE_DECODES;
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
320  		}
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  =
321  =

3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  =
322  		if (change_bridge)
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  =
323  			flags |=3D PCI_VGA_STATE_CHANGE_BRIDGE;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
324  =

3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  =
325  		pci_set_vga_state(conflict->pdev, false, pci_bits, flags);
f22d776f3e280e drivers/gpu/vga/vgaarb.c Alex Williamson        2013-08-15  =
326  		conflict->owns &=3D ~match;
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
327  =

4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
328  		/* If we disabled normal decoding, reflect it in owns */
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
329  		if (pci_bits & PCI_COMMAND_MEMORY)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
330  			conflict->owns &=3D ~VGA_RSRC_NORMAL_MEM;
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
331  		if (pci_bits & PCI_COMMAND_IO)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
332  			conflict->owns &=3D ~VGA_RSRC_NORMAL_IO;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
333  	}
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
334  =

deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
335  enable_them:
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
336  	/* ok dude, we got it, everybody conflicting has been disabled, let's
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
337  	 * enable us.  Mark any bits in "owns" regardless of whether we
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
338  	 * decoded them.  We can lock resources we don't decode, therefore
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
339  	 * we must track them via "owns".
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
340  	 */
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  =
341  	flags =3D 0;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
342  	pci_bits =3D 0;
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  =
343  =

3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  =
344  	if (!vgadev->bridge_has_one_vga) {
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  =
345  		flags |=3D PCI_VGA_STATE_CHANGE_DECODES;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
346  		if (wants & (VGA_RSRC_LEGACY_MEM|VGA_RSRC_NORMAL_MEM))
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
347  			pci_bits |=3D PCI_COMMAND_MEMORY;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
348  		if (wants & (VGA_RSRC_LEGACY_IO|VGA_RSRC_NORMAL_IO))
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
349  			pci_bits |=3D PCI_COMMAND_IO;
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  =
350  	}
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
351  	if (wants & VGA_RSRC_LEGACY_MASK)
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  =
352  		flags |=3D PCI_VGA_STATE_CHANGE_BRIDGE;
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  =
353  =

3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  =
354  	pci_set_vga_state(vgadev->pdev, true, pci_bits, flags);
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
355  =

4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  =
356  	vgadev->owns |=3D wants;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
357  lock_them:
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
358  	vgadev->locks |=3D (rsrc & VGA_RSRC_LEGACY_MASK);
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
359  	if (rsrc & VGA_RSRC_LEGACY_IO)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
360  		vgadev->io_lock_cnt++;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
361  	if (rsrc & VGA_RSRC_LEGACY_MEM)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
362  		vgadev->mem_lock_cnt++;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
363  	if (rsrc & VGA_RSRC_NORMAL_IO)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
364  		vgadev->io_norm_cnt++;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
365  	if (rsrc & VGA_RSRC_NORMAL_MEM)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
366  		vgadev->mem_norm_cnt++;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
367  =

deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
368  	return NULL;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
369  }
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  =
370  =


:::::: The code at line 235 was first introduced by commit
:::::: a75d68f62106fe66c4b8b96c0ee7155bdafc6f06 vgaarb: Use dev_printk() wh=
en possible

:::::: TO: Bjorn Helgaas <bhelgaas@google.com>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4595634102839022848==--

