Content-Type: multipart/mixed; boundary="===============5296170301196165681=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.10 9944/9999] drivers/usb/host/xhci-ring.c:1612:2: warning: Value stored to 'usbsts' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 16 Jan 2022 19:31:58 +0800
Message-ID: <202201161909.9JwrCd7Z-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5296170301196165681==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.10
head:   a34fc0a18f7e71d743c7231ef8186bf3779b5b11
commit: 1a21d3d8ad8806803aea723a3bf14ff90be08771 [9944/9999] FROMGIT: xhci:=
 use generic command timer for stop endpoint commands.
:::::: branch date: 5 hours ago
:::::: commit date: 3 days ago
config: arm-randconfig-c002-20220113 (https://download.01.org/0day-ci/archi=
ve/20220116/202201161909.9JwrCd7Z-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 650fc4=
0b6d8d9a5869b4fca525d5f237b0ee2803)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add chrome-os https://chromium.googlesource.com/chromium=
os/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.10
        git checkout 1a21d3d8ad8806803aea723a3bf14ff90be08771
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   drivers/usb/host/xhci-ring.c:559:3: note: Returning pointer, which parti=
cipates in a condition later
                   return ep->ring;
                   ^~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:587:9: note: Returning from 'xhci_virt_ep_t=
o_ring'
           return xhci_virt_ep_to_ring(xhci, ep, stream_id);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:587:2: note: Returning pointer, which parti=
cipates in a condition later
           return xhci_virt_ep_to_ring(xhci, ep, stream_id);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:635:12: note: Returning from 'xhci_triad_to=
_transfer_ring'
           ep_ring =3D xhci_triad_to_transfer_ring(xhci, slot_id,
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:637:6: note: Assuming 'ep_ring' is non-null
           if (!ep_ring) {
               ^~~~~~~~
   drivers/usb/host/xhci-ring.c:637:2: note: Taking false branch
           if (!ep_ring) {
           ^
   drivers/usb/host/xhci-ring.c:649:6: note: Assuming 'td' is non-null
           if (!td) {
               ^~~
   drivers/usb/host/xhci-ring.c:649:2: note: Taking false branch
           if (!td) {
           ^
   drivers/usb/host/xhci-ring.c:663:2: note: Value assigned to 'new_seg'
           new_seg =3D ep_ring->deq_seg;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:671:6: note: Assuming the condition is false
           if (xhci->quirks & XHCI_EP_CTX_BROKEN_DCS &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:671:44: note: Left side of '&&' is false
           if (xhci->quirks & XHCI_EP_CTX_BROKEN_DCS &&
                                                     ^
   drivers/usb/host/xhci-ring.c:676:6: note: 'halted_seg' is null
           if (halted_seg) {
               ^~~~~~~~~~
   drivers/usb/host/xhci-ring.c:676:2: note: Taking false branch
           if (halted_seg) {
           ^
   drivers/usb/host/xhci-ring.c:694:8: note: 'cycle_found' is false
                   if (!cycle_found && xhci_trb_virt_to_dma(new_seg, new_de=
q)
                        ^~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:694:7: note: Left side of '&&' is true
                   if (!cycle_found && xhci_trb_virt_to_dma(new_seg, new_de=
q)
                       ^
   drivers/usb/host/xhci-ring.c:694:23: note: Calling 'xhci_trb_virt_to_dma'
                   if (!cycle_found && xhci_trb_virt_to_dma(new_seg, new_de=
q)
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/usb/host/xhci-ring.c:74:6: note: Assuming 'seg' is null
           if (!seg || !trb || trb < seg->trbs)
               ^~~~
   drivers/usb/host/xhci-ring.c:74:11: note: Left side of '||' is true
           if (!seg || !trb || trb < seg->trbs)
                    ^
   drivers/usb/host/xhci-ring.c:694:23: note: Returning from 'xhci_trb_virt=
_to_dma'
                   if (!cycle_found && xhci_trb_virt_to_dma(new_seg, new_de=
q)
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/usb/host/xhci-ring.c:694:23: note: Assuming the condition is fal=
se
                   if (!cycle_found && xhci_trb_virt_to_dma(new_seg, new_de=
q)
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/usb/host/xhci-ring.c:694:3: note: Taking false branch
                   if (!cycle_found && xhci_trb_virt_to_dma(new_seg, new_de=
q)
                   ^
   drivers/usb/host/xhci-ring.c:700:7: note: Assuming 'new_deq' is not equa=
l to field 'last_trb'
                   if (new_deq =3D=3D td->last_trb)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:700:3: note: Taking false branch
                   if (new_deq =3D=3D td->last_trb)
                   ^
   drivers/usb/host/xhci-ring.c:703:7: note: 'cycle_found' is false
                   if (cycle_found && trb_is_link(new_deq) &&
                       ^~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:703:19: note: Left side of '&&' is false
                   if (cycle_found && trb_is_link(new_deq) &&
                                   ^
   drivers/usb/host/xhci-ring.c:707:3: note: Calling 'next_trb'
                   next_trb(xhci, ep_ring, &new_seg, &new_deq);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:147:6: note: Calling 'trb_is_link'
           if (trb_is_link(*trb)) {
               ^~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:90:9: note: Assuming the condition is true
           return TRB_TYPE_LINK_LE32(trb->link.control);
                  ^
   drivers/usb/host/xhci.h:1501:32: note: expanded from macro 'TRB_TYPE_LIN=
K_LE32'
   #define TRB_TYPE_LINK_LE32(x)   (((x) & cpu_to_le32(TRB_TYPE_BITMASK)) =
=3D=3D \
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/usb/host/xhci-ring.c:90:2: note: Returning the value 1, which pa=
rticipates in a condition later
           return TRB_TYPE_LINK_LE32(trb->link.control);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:147:6: note: Returning from 'trb_is_link'
           if (trb_is_link(*trb)) {
               ^~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:147:2: note: Taking true branch
           if (trb_is_link(*trb)) {
           ^
   drivers/usb/host/xhci-ring.c:148:10: note: Access to field 'next' result=
s in a dereference of a null pointer
                   *seg =3D (*seg)->next;
                          ^~~~~~~~~~~~
>> drivers/usb/host/xhci-ring.c:1612:2: warning: Value stored to 'usbsts' i=
s never read [clang-analyzer-deadcode.DeadStores]
           usbsts =3D readl(&xhci->op_regs->status);
           ^
   drivers/usb/host/xhci-ring.c:1612:2: note: Value stored to 'usbsts' is n=
ever read
   drivers/usb/host/xhci-ring.c:3680:3: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   ret =3D prepare_transfer(xhci, xhci->devs[slot_id],
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:3680:3: note: Value stored to 'ret' is neve=
r read
                   ret =3D prepare_transfer(xhci, xhci->devs[slot_id],
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   fs/btrfs/relocation.c:1923:2: warning: Value stored to 'root' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           root =3D rc->extent_root;
           ^      ~~~~~~~~~~~~~~~
   fs/btrfs/relocation.c:1923:2: note: Value stored to 'root' is never read
           root =3D rc->extent_root;
           ^      ~~~~~~~~~~~~~~~
   include/linux/list.h:135:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   fs/btrfs/relocation.c:548:6: note: Assuming field 'last_trans' is <=3D 0
           if (cache->last_trans > 0)
               ^~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/relocation.c:548:2: note: Taking false branch
           if (cache->last_trans > 0)
           ^
   fs/btrfs/relocation.c:552:6: note: Assuming 'rb_node' is non-null
           if (rb_node) {
               ^~~~~~~
   fs/btrfs/relocation.c:552:2: note: Taking true branch
           if (rb_node) {
           ^
   fs/btrfs/relocation.c:553:10: note: Left side of '&&' is false
                   node =3D rb_entry(rb_node, struct btrfs_backref_node, rb=
_node);
                          ^
   include/linux/rbtree.h:38:37: note: expanded from macro 'rb_entry'
   #define rb_entry(ptr, type, member) container_of(ptr, type, member)
                                       ^
   include/linux/kernel.h:853:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   fs/btrfs/relocation.c:553:10: note: Taking false branch
                   node =3D rb_entry(rb_node, struct btrfs_backref_node, rb=
_node);
                          ^
   include/linux/rbtree.h:38:37: note: expanded from macro 'rb_entry'
   #define rb_entry(ptr, type, member) container_of(ptr, type, member)
                                       ^
   include/linux/kernel.h:853:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:295:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   fs/btrfs/relocation.c:553:10: note: Loop condition is false.  Exiting lo=
op
                   node =3D rb_entry(rb_node, struct btrfs_backref_node, rb=
_node);
                          ^
   include/linux/rbtree.h:38:37: note: expanded from macro 'rb_entry'
   #define rb_entry(ptr, type, member) container_of(ptr, type, member)
                                       ^
   include/linux/kernel.h:853:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:293:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   fs/btrfs/relocation.c:554:7: note: Assuming field 'detached' is 0
                   if (node->detached)
                       ^~~~~~~~~~~~~~
   fs/btrfs/relocation.c:554:3: note: Taking false branch
                   if (node->detached)
                   ^
   fs/btrfs/relocation.c:557:11: note: Assuming field 'new_bytenr' is equal=
 to field 'start'
                           BUG_ON(node->new_bytenr !=3D reloc_root->node->s=
tart);
                                  ^
   include/asm-generic/bug.h:63:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'

vim +/usbsts +1612 drivers/usb/host/xhci-ring.c

c9aa1a2de4cbf7 Mathias Nyman  2014-05-08  1588  =

cb4d5ce588c5ff OGAWA Hirofumi 2017-01-03  1589  void xhci_handle_command_ti=
meout(struct work_struct *work)
c311e391a7efd1 Mathias Nyman  2014-05-08  1590  {
c311e391a7efd1 Mathias Nyman  2014-05-08  1591  	struct xhci_hcd	*xhci;
c311e391a7efd1 Mathias Nyman  2014-05-08  1592  	unsigned long	flags;
1a21d3d8ad8806 Mathias Nyman  2021-09-28  1593  	char		str[XHCI_MSG_MAX];
c311e391a7efd1 Mathias Nyman  2014-05-08  1594  	u64		hw_ring_state;
1a21d3d8ad8806 Mathias Nyman  2021-09-28  1595  	u32		cmd_field3;
1a21d3d8ad8806 Mathias Nyman  2021-09-28  1596  	u32		usbsts;
cb4d5ce588c5ff OGAWA Hirofumi 2017-01-03  1597  =

cb4d5ce588c5ff OGAWA Hirofumi 2017-01-03  1598  	xhci =3D container_of(to_d=
elayed_work(work), struct xhci_hcd, cmd_timer);
c311e391a7efd1 Mathias Nyman  2014-05-08  1599  =

c311e391a7efd1 Mathias Nyman  2014-05-08  1600  	spin_lock_irqsave(&xhci->l=
ock, flags);
2b985467371a58 Lu Baolu       2017-01-03  1601  =

a5a1b951415443 Mathias Nyman  2017-01-03  1602  	/*
a5a1b951415443 Mathias Nyman  2017-01-03  1603  	 * If timeout work is pend=
ing, or current_cmd is NULL, it means we
a5a1b951415443 Mathias Nyman  2017-01-03  1604  	 * raced with command comp=
letion. Command is handled so just return.
a5a1b951415443 Mathias Nyman  2017-01-03  1605  	 */
cb4d5ce588c5ff OGAWA Hirofumi 2017-01-03  1606  	if (!xhci->current_cmd || =
delayed_work_pending(&xhci->cmd_timer)) {
2b985467371a58 Lu Baolu       2017-01-03  1607  		spin_unlock_irqrestore(&x=
hci->lock, flags);
2b985467371a58 Lu Baolu       2017-01-03  1608  		return;
2b985467371a58 Lu Baolu       2017-01-03  1609  	}
1a21d3d8ad8806 Mathias Nyman  2021-09-28  1610  =

1a21d3d8ad8806 Mathias Nyman  2021-09-28  1611  	cmd_field3 =3D le32_to_cpu=
(xhci->current_cmd->command_trb->generic.field[3]);
1a21d3d8ad8806 Mathias Nyman  2021-09-28 @1612  	usbsts =3D readl(&xhci->op=
_regs->status);
1a21d3d8ad8806 Mathias Nyman  2021-09-28  1613  	xhci_dbg(xhci, "Command ti=
meout, USBSTS:%s\n", xhci_decode_usbsts(str, usbsts));
1a21d3d8ad8806 Mathias Nyman  2021-09-28  1614  =

1a21d3d8ad8806 Mathias Nyman  2021-09-28  1615  	/* Bail out and tear down =
xhci if a stop endpoint command failed */
1a21d3d8ad8806 Mathias Nyman  2021-09-28  1616  	if (TRB_FIELD_TO_TYPE(cmd_=
field3) =3D=3D TRB_STOP_RING) {
1a21d3d8ad8806 Mathias Nyman  2021-09-28  1617  		struct xhci_virt_ep	*ep;
1a21d3d8ad8806 Mathias Nyman  2021-09-28  1618  =

1a21d3d8ad8806 Mathias Nyman  2021-09-28  1619  		xhci_warn(xhci, "xHCI hos=
t not responding to stop endpoint command\n");
1a21d3d8ad8806 Mathias Nyman  2021-09-28  1620  =

1a21d3d8ad8806 Mathias Nyman  2021-09-28  1621  		ep =3D xhci_get_virt_ep(x=
hci, TRB_TO_SLOT_ID(cmd_field3),
1a21d3d8ad8806 Mathias Nyman  2021-09-28  1622  				      TRB_TO_EP_INDEX(c=
md_field3));
1a21d3d8ad8806 Mathias Nyman  2021-09-28  1623  		if (ep)
1a21d3d8ad8806 Mathias Nyman  2021-09-28  1624  			ep->ep_state &=3D ~EP_ST=
OP_CMD_PENDING;
1a21d3d8ad8806 Mathias Nyman  2021-09-28  1625  =

1a21d3d8ad8806 Mathias Nyman  2021-09-28  1626  		xhci_halt(xhci);
1a21d3d8ad8806 Mathias Nyman  2021-09-28  1627  		xhci_hc_died(xhci);
1a21d3d8ad8806 Mathias Nyman  2021-09-28  1628  		goto time_out_completed;
1a21d3d8ad8806 Mathias Nyman  2021-09-28  1629  	}
1a21d3d8ad8806 Mathias Nyman  2021-09-28  1630  =

2b985467371a58 Lu Baolu       2017-01-03  1631  	/* mark this command to be=
 cancelled */
0b7c105a04ca79 Felipe Balbi   2017-01-23  1632  	xhci->current_cmd->status =
=3D COMP_COMMAND_ABORTED;
c311e391a7efd1 Mathias Nyman  2014-05-08  1633  =

c311e391a7efd1 Mathias Nyman  2014-05-08  1634  	/* Make sure command ring =
is running before aborting it */
c311e391a7efd1 Mathias Nyman  2014-05-08  1635  	hw_ring_state =3D xhci_rea=
d_64(xhci, &xhci->op_regs->cmd_ring);
d9f11ba9f107aa Mathias Nyman  2017-04-07  1636  	if (hw_ring_state =3D=3D ~=
(u64)0) {
d9f11ba9f107aa Mathias Nyman  2017-04-07  1637  		xhci_hc_died(xhci);
d9f11ba9f107aa Mathias Nyman  2017-04-07  1638  		goto time_out_completed;
d9f11ba9f107aa Mathias Nyman  2017-04-07  1639  	}
d9f11ba9f107aa Mathias Nyman  2017-04-07  1640  =

c311e391a7efd1 Mathias Nyman  2014-05-08  1641  	if ((xhci->cmd_ring_state =
& CMD_RING_STATE_RUNNING) &&
c311e391a7efd1 Mathias Nyman  2014-05-08  1642  	    (hw_ring_state & CMD_R=
ING_RUNNING))  {
1c111b6c3844a1 OGAWA Hirofumi 2017-01-03  1643  		/* Prevent new doorbell, =
and start command abort */
1c111b6c3844a1 OGAWA Hirofumi 2017-01-03  1644  		xhci->cmd_ring_state =3D =
CMD_RING_STATE_ABORTED;
c311e391a7efd1 Mathias Nyman  2014-05-08  1645  		xhci_dbg(xhci, "Command t=
imeout\n");
d9f11ba9f107aa Mathias Nyman  2017-04-07  1646  		xhci_abort_cmd_ring(xhci,=
 flags);
4dea70778c0f48 Lu Baolu       2017-01-03  1647  		goto time_out_completed;
4dea70778c0f48 Lu Baolu       2017-01-03  1648  	}
4dea70778c0f48 Lu Baolu       2017-01-03  1649  =

1c111b6c3844a1 OGAWA Hirofumi 2017-01-03  1650  	/* host removed. Bail out =
*/
1c111b6c3844a1 OGAWA Hirofumi 2017-01-03  1651  	if (xhci->xhc_state & XHCI=
_STATE_REMOVING) {
1c111b6c3844a1 OGAWA Hirofumi 2017-01-03  1652  		xhci_dbg(xhci, "host remo=
ved, ring start fail?\n");
3425aa03f484d4 Mathias Nyman  2016-06-01  1653  		xhci_cleanup_command_queu=
e(xhci);
4dea70778c0f48 Lu Baolu       2017-01-03  1654  =

4dea70778c0f48 Lu Baolu       2017-01-03  1655  		goto time_out_completed;
3425aa03f484d4 Mathias Nyman  2016-06-01  1656  	}
3425aa03f484d4 Mathias Nyman  2016-06-01  1657  =

c311e391a7efd1 Mathias Nyman  2014-05-08  1658  	/* command timeout on stop=
ped ring, ring can't be aborted */
c311e391a7efd1 Mathias Nyman  2014-05-08  1659  	xhci_dbg(xhci, "Command ti=
meout on stopped ring\n");
c311e391a7efd1 Mathias Nyman  2014-05-08  1660  	xhci_handle_stopped_cmd_ri=
ng(xhci, xhci->current_cmd);
4dea70778c0f48 Lu Baolu       2017-01-03  1661  =

4dea70778c0f48 Lu Baolu       2017-01-03  1662  time_out_completed:
c311e391a7efd1 Mathias Nyman  2014-05-08  1663  	spin_unlock_irqrestore(&xh=
ci->lock, flags);
c311e391a7efd1 Mathias Nyman  2014-05-08  1664  	return;
c311e391a7efd1 Mathias Nyman  2014-05-08  1665  }
c311e391a7efd1 Mathias Nyman  2014-05-08  1666  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5296170301196165681==--

