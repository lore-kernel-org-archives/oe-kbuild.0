Content-Type: multipart/mixed; boundary="===============7734291820926787200=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [mnyman-xhci:for-usb-next 2/4] drivers/usb/host/xhci-ring.c:1605:2: warning: Value stored to 'usbsts' is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 02 Dec 2021 12:59:56 +0800
Message-ID: <202112021235.mhsJ8X7t-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7734291820926787200==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mathias Nyman <mathias.nyman@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git for=
-usb-next
head:   5cf6ae95cffdd02531901c4b9e314c48a3606e13
commit: edef9ed7ed75d2aaa437b9ac96d77e4d5984cbbd [2/4] xhci: use generic co=
mmand timer for stop endpoint commands.
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm-randconfig-c002-20211128 (https://download.01.org/0day-ci/archi=
ve/20211202/202112021235.mhsJ8X7t-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4b5532=
97ef3ee4dc2119d5429adf3072e90fac38)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/c=
ommit/?id=3Dedef9ed7ed75d2aaa437b9ac96d77e4d5984cbbd
        git remote add mnyman-xhci https://git.kernel.org/pub/scm/linux/ker=
nel/git/mnyman/xhci.git
        git fetch --no-tags mnyman-xhci for-usb-next
        git checkout edef9ed7ed75d2aaa437b9ac96d77e4d5984cbbd
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   drivers/usb/host/xhci-ring.c:504:3: note: Returning pointer, which parti=
cipates in a condition later
                   return ep->ring;
                   ^~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:532:9: note: Returning from 'xhci_virt_ep_t=
o_ring'
           return xhci_virt_ep_to_ring(xhci, ep, stream_id);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:532:2: note: Returning pointer, which parti=
cipates in a condition later
           return xhci_virt_ep_to_ring(xhci, ep, stream_id);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:580:12: note: Returning from 'xhci_triad_to=
_transfer_ring'
           ep_ring =3D xhci_triad_to_transfer_ring(xhci, slot_id,
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:582:6: note: Assuming 'ep_ring' is non-null
           if (!ep_ring) {
               ^~~~~~~~
   drivers/usb/host/xhci-ring.c:582:2: note: Taking false branch
           if (!ep_ring) {
           ^
   drivers/usb/host/xhci-ring.c:594:6: note: Assuming 'td' is non-null
           if (!td) {
               ^~~
   drivers/usb/host/xhci-ring.c:594:2: note: Taking false branch
           if (!td) {
           ^
   drivers/usb/host/xhci-ring.c:608:2: note: Value assigned to 'new_seg'
           new_seg =3D ep_ring->deq_seg;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:616:6: note: Assuming the condition is false
           if (xhci->quirks & XHCI_EP_CTX_BROKEN_DCS &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:616:44: note: Left side of '&&' is false
           if (xhci->quirks & XHCI_EP_CTX_BROKEN_DCS &&
                                                     ^
   drivers/usb/host/xhci-ring.c:621:6: note: 'halted_seg' is null
           if (halted_seg) {
               ^~~~~~~~~~
   drivers/usb/host/xhci-ring.c:621:2: note: Taking false branch
           if (halted_seg) {
           ^
   drivers/usb/host/xhci-ring.c:639:8: note: 'cycle_found' is false
                   if (!cycle_found && xhci_trb_virt_to_dma(new_seg, new_de=
q)
                        ^~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:639:7: note: Left side of '&&' is true
                   if (!cycle_found && xhci_trb_virt_to_dma(new_seg, new_de=
q)
                       ^
   drivers/usb/host/xhci-ring.c:639:23: note: Calling 'xhci_trb_virt_to_dma'
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
   drivers/usb/host/xhci-ring.c:639:23: note: Returning from 'xhci_trb_virt=
_to_dma'
                   if (!cycle_found && xhci_trb_virt_to_dma(new_seg, new_de=
q)
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/usb/host/xhci-ring.c:639:23: note: Assuming the condition is fal=
se
                   if (!cycle_found && xhci_trb_virt_to_dma(new_seg, new_de=
q)
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/usb/host/xhci-ring.c:639:3: note: Taking false branch
                   if (!cycle_found && xhci_trb_virt_to_dma(new_seg, new_de=
q)
                   ^
   drivers/usb/host/xhci-ring.c:645:7: note: Assuming 'new_deq' is not equa=
l to field 'last_trb'
                   if (new_deq =3D=3D td->last_trb)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:645:3: note: Taking false branch
                   if (new_deq =3D=3D td->last_trb)
                   ^
   drivers/usb/host/xhci-ring.c:648:7: note: 'cycle_found' is false
                   if (cycle_found && trb_is_link(new_deq) &&
                       ^~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:648:19: note: Left side of '&&' is false
                   if (cycle_found && trb_is_link(new_deq) &&
                                   ^
   drivers/usb/host/xhci-ring.c:652:3: note: Calling 'next_trb'
                   next_trb(xhci, ep_ring, &new_seg, &new_deq);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:147:6: note: Calling 'trb_is_link'
           if (trb_is_link(*trb)) {
               ^~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:90:9: note: Assuming the condition is true
           return TRB_TYPE_LINK_LE32(trb->link.control);
                  ^
   drivers/usb/host/xhci.h:1505:32: note: expanded from macro 'TRB_TYPE_LIN=
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
>> drivers/usb/host/xhci-ring.c:1605:2: warning: Value stored to 'usbsts' i=
s never read [clang-analyzer-deadcode.DeadStores]
           usbsts =3D readl(&xhci->op_regs->status);
           ^
   drivers/usb/host/xhci-ring.c:1605:2: note: Value stored to 'usbsts' is n=
ever read
   drivers/usb/host/xhci-ring.c:3676:3: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   ret =3D prepare_transfer(xhci, xhci->devs[slot_id],
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:3676:3: note: Value stored to 'ret' is neve=
r read
                   ret =3D prepare_transfer(xhci, xhci->devs[slot_id],
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:284:9: warning: Dereference of null pointer [clang-=
analyzer-core.NullDereference]
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^
   drivers/usb/host/xhci-ring.c:2567:6: note: Assuming 'ep' is non-null
           if (!ep) {
               ^~~
   drivers/usb/host/xhci-ring.c:2567:2: note: Taking false branch
           if (!ep) {
           ^
   drivers/usb/host/xhci-ring.c:2572:2: note: Value assigned to 'ep_ring'
           ep_ring =3D xhci_dma_to_transfer_ring(ep, ep_trb_dma);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:2575:6: note: Assuming the condition is fal=
se
           if (GET_EP_CTX_STATE(ep_ctx) =3D=3D EP_STATE_DISABLED) {
               ^
   drivers/usb/host/xhci.h:728:31: note: expanded from macro 'GET_EP_CTX_ST=
ATE'
   #define GET_EP_CTX_STATE(ctx)   (le32_to_cpu((ctx)->ep_info) & EP_STATE_=
MASK)
                                   ^
   drivers/usb/host/xhci-ring.c:2575:2: note: Taking false branch
           if (GET_EP_CTX_STATE(ep_ctx) =3D=3D EP_STATE_DISABLED) {
           ^
   drivers/usb/host/xhci-ring.c:2583:6: note: Assuming 'ep_ring' is null
           if (!ep_ring) {
               ^~~~~~~~
   drivers/usb/host/xhci-ring.c:2583:2: note: Taking true branch
           if (!ep_ring) {
           ^
   drivers/usb/host/xhci-ring.c:2584:3: note: Control jumps to 'case 14:'  =
at line 2592
                   switch (trb_comp_code) {
                   ^
   drivers/usb/host/xhci-ring.c:2595:4: note: Control jumps to line 2884
                           goto cleanup;
                           ^
   drivers/usb/host/xhci-ring.c:2884:26: note: Assuming field 'skip' is true
                   handling_skipped_tds =3D ep->skip &&
                                          ^~~~~~~~
   drivers/usb/host/xhci-ring.c:2884:26: note: Left side of '&&' is true
   drivers/usb/host/xhci-ring.c:2885:4: note: 'trb_comp_code' is not equal =
to COMP_MISSED_SERVICE_ERROR
                           trb_comp_code !=3D COMP_MISSED_SERVICE_ERROR &&
                           ^~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:2884:26: note: Left side of '&&' is true
                   handling_skipped_tds =3D ep->skip &&
                                          ^
   drivers/usb/host/xhci-ring.c:2892:8: note: 'handling_skipped_tds' is true
                   if (!handling_skipped_tds)
                        ^~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:2892:3: note: Taking false branch
                   if (!handling_skipped_tds)
                   ^
   drivers/usb/host/xhci-ring.c:2745:2: note: Loop condition is true. Execu=
tion continues on line 2749
           do {
           ^
   drivers/usb/host/xhci-ring.c:2749:18: note: Passing null pointer value v=
ia 1st parameter 'head'
                   if (list_empty(&ep_ring->td_list)) {
                                  ^~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:2749:7: note: Calling 'list_empty'
                   if (list_empty(&ep_ring->td_list)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:284:9: note: Left side of '||' is false
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   include/linux/list.h:284:9: note: Left side of '||' is false
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   include/linux/list.h:284:9: note: Left side of '||' is true
           return READ_ONCE(head->next) =3D=3D head;
                  ^

vim +/usbsts +1605 drivers/usb/host/xhci-ring.c

c9aa1a2de4cbf7d Mathias Nyman  2014-05-08  1581  =

cb4d5ce588c5ff6 OGAWA Hirofumi 2017-01-03  1582  void xhci_handle_command_t=
imeout(struct work_struct *work)
c311e391a7efd10 Mathias Nyman  2014-05-08  1583  {
c311e391a7efd10 Mathias Nyman  2014-05-08  1584  	struct xhci_hcd	*xhci;
c311e391a7efd10 Mathias Nyman  2014-05-08  1585  	unsigned long	flags;
edef9ed7ed75d2a Mathias Nyman  2021-09-28  1586  	char		str[XHCI_MSG_MAX];
c311e391a7efd10 Mathias Nyman  2014-05-08  1587  	u64		hw_ring_state;
edef9ed7ed75d2a Mathias Nyman  2021-09-28  1588  	u32		cmd_field3;
edef9ed7ed75d2a Mathias Nyman  2021-09-28  1589  	u32		usbsts;
cb4d5ce588c5ff6 OGAWA Hirofumi 2017-01-03  1590  =

cb4d5ce588c5ff6 OGAWA Hirofumi 2017-01-03  1591  	xhci =3D container_of(to_=
delayed_work(work), struct xhci_hcd, cmd_timer);
c311e391a7efd10 Mathias Nyman  2014-05-08  1592  =

c311e391a7efd10 Mathias Nyman  2014-05-08  1593  	spin_lock_irqsave(&xhci->=
lock, flags);
2b985467371a58a Lu Baolu       2017-01-03  1594  =

a5a1b9514154437 Mathias Nyman  2017-01-03  1595  	/*
a5a1b9514154437 Mathias Nyman  2017-01-03  1596  	 * If timeout work is pen=
ding, or current_cmd is NULL, it means we
a5a1b9514154437 Mathias Nyman  2017-01-03  1597  	 * raced with command com=
pletion. Command is handled so just return.
a5a1b9514154437 Mathias Nyman  2017-01-03  1598  	 */
cb4d5ce588c5ff6 OGAWA Hirofumi 2017-01-03  1599  	if (!xhci->current_cmd ||=
 delayed_work_pending(&xhci->cmd_timer)) {
2b985467371a58a Lu Baolu       2017-01-03  1600  		spin_unlock_irqrestore(&=
xhci->lock, flags);
2b985467371a58a Lu Baolu       2017-01-03  1601  		return;
2b985467371a58a Lu Baolu       2017-01-03  1602  	}
edef9ed7ed75d2a Mathias Nyman  2021-09-28  1603  =

edef9ed7ed75d2a Mathias Nyman  2021-09-28  1604  	cmd_field3 =3D le32_to_cp=
u(xhci->current_cmd->command_trb->generic.field[3]);
edef9ed7ed75d2a Mathias Nyman  2021-09-28 @1605  	usbsts =3D readl(&xhci->o=
p_regs->status);
edef9ed7ed75d2a Mathias Nyman  2021-09-28  1606  	xhci_dbg(xhci, "Command t=
imeout, USBSTS:%s\n", xhci_decode_usbsts(str, usbsts));
edef9ed7ed75d2a Mathias Nyman  2021-09-28  1607  =

edef9ed7ed75d2a Mathias Nyman  2021-09-28  1608  	/* Bail out and tear down=
 xhci if a stop endpoint command failed */
edef9ed7ed75d2a Mathias Nyman  2021-09-28  1609  	if (TRB_FIELD_TO_TYPE(cmd=
_field3) =3D=3D TRB_STOP_RING) {
edef9ed7ed75d2a Mathias Nyman  2021-09-28  1610  		struct xhci_virt_ep	*ep;
edef9ed7ed75d2a Mathias Nyman  2021-09-28  1611  =

edef9ed7ed75d2a Mathias Nyman  2021-09-28  1612  		xhci_warn(xhci, "xHCI ho=
st not responding to stop endpoint command\n");
edef9ed7ed75d2a Mathias Nyman  2021-09-28  1613  =

edef9ed7ed75d2a Mathias Nyman  2021-09-28  1614  		ep =3D xhci_get_virt_ep(=
xhci, TRB_TO_SLOT_ID(cmd_field3),
edef9ed7ed75d2a Mathias Nyman  2021-09-28  1615  				      TRB_TO_EP_INDEX(=
cmd_field3));
edef9ed7ed75d2a Mathias Nyman  2021-09-28  1616  		if (ep)
edef9ed7ed75d2a Mathias Nyman  2021-09-28  1617  			ep->ep_state &=3D ~EP_S=
TOP_CMD_PENDING;
edef9ed7ed75d2a Mathias Nyman  2021-09-28  1618  =

edef9ed7ed75d2a Mathias Nyman  2021-09-28  1619  		xhci_halt(xhci);
edef9ed7ed75d2a Mathias Nyman  2021-09-28  1620  		xhci_hc_died(xhci);
edef9ed7ed75d2a Mathias Nyman  2021-09-28  1621  		goto time_out_completed;
edef9ed7ed75d2a Mathias Nyman  2021-09-28  1622  	}
edef9ed7ed75d2a Mathias Nyman  2021-09-28  1623  =

2b985467371a58a Lu Baolu       2017-01-03  1624  	/* mark this command to b=
e cancelled */
0b7c105a04ca793 Felipe Balbi   2017-01-23  1625  	xhci->current_cmd->status=
 =3D COMP_COMMAND_ABORTED;
c311e391a7efd10 Mathias Nyman  2014-05-08  1626  =

c311e391a7efd10 Mathias Nyman  2014-05-08  1627  	/* Make sure command ring=
 is running before aborting it */
c311e391a7efd10 Mathias Nyman  2014-05-08  1628  	hw_ring_state =3D xhci_re=
ad_64(xhci, &xhci->op_regs->cmd_ring);
d9f11ba9f107aa3 Mathias Nyman  2017-04-07  1629  	if (hw_ring_state =3D=3D =
~(u64)0) {
d9f11ba9f107aa3 Mathias Nyman  2017-04-07  1630  		xhci_hc_died(xhci);
d9f11ba9f107aa3 Mathias Nyman  2017-04-07  1631  		goto time_out_completed;
d9f11ba9f107aa3 Mathias Nyman  2017-04-07  1632  	}
d9f11ba9f107aa3 Mathias Nyman  2017-04-07  1633  =

c311e391a7efd10 Mathias Nyman  2014-05-08  1634  	if ((xhci->cmd_ring_state=
 & CMD_RING_STATE_RUNNING) &&
c311e391a7efd10 Mathias Nyman  2014-05-08  1635  	    (hw_ring_state & CMD_=
RING_RUNNING))  {
1c111b6c3844a14 OGAWA Hirofumi 2017-01-03  1636  		/* Prevent new doorbell,=
 and start command abort */
1c111b6c3844a14 OGAWA Hirofumi 2017-01-03  1637  		xhci->cmd_ring_state =3D=
 CMD_RING_STATE_ABORTED;
c311e391a7efd10 Mathias Nyman  2014-05-08  1638  		xhci_dbg(xhci, "Command =
timeout\n");
d9f11ba9f107aa3 Mathias Nyman  2017-04-07  1639  		xhci_abort_cmd_ring(xhci=
, flags);
4dea70778c0f48b Lu Baolu       2017-01-03  1640  		goto time_out_completed;
4dea70778c0f48b Lu Baolu       2017-01-03  1641  	}
4dea70778c0f48b Lu Baolu       2017-01-03  1642  =

1c111b6c3844a14 OGAWA Hirofumi 2017-01-03  1643  	/* host removed. Bail out=
 */
1c111b6c3844a14 OGAWA Hirofumi 2017-01-03  1644  	if (xhci->xhc_state & XHC=
I_STATE_REMOVING) {
1c111b6c3844a14 OGAWA Hirofumi 2017-01-03  1645  		xhci_dbg(xhci, "host rem=
oved, ring start fail?\n");
3425aa03f484d45 Mathias Nyman  2016-06-01  1646  		xhci_cleanup_command_que=
ue(xhci);
4dea70778c0f48b Lu Baolu       2017-01-03  1647  =

4dea70778c0f48b Lu Baolu       2017-01-03  1648  		goto time_out_completed;
3425aa03f484d45 Mathias Nyman  2016-06-01  1649  	}
3425aa03f484d45 Mathias Nyman  2016-06-01  1650  =

c311e391a7efd10 Mathias Nyman  2014-05-08  1651  	/* command timeout on sto=
pped ring, ring can't be aborted */
c311e391a7efd10 Mathias Nyman  2014-05-08  1652  	xhci_dbg(xhci, "Command t=
imeout on stopped ring\n");
c311e391a7efd10 Mathias Nyman  2014-05-08  1653  	xhci_handle_stopped_cmd_r=
ing(xhci, xhci->current_cmd);
4dea70778c0f48b Lu Baolu       2017-01-03  1654  =

4dea70778c0f48b Lu Baolu       2017-01-03  1655  time_out_completed:
c311e391a7efd10 Mathias Nyman  2014-05-08  1656  	spin_unlock_irqrestore(&x=
hci->lock, flags);
c311e391a7efd10 Mathias Nyman  2014-05-08  1657  	return;
c311e391a7efd10 Mathias Nyman  2014-05-08  1658  }
c311e391a7efd10 Mathias Nyman  2014-05-08  1659  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7734291820926787200==--

