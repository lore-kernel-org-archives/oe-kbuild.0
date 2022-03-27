Content-Type: multipart/mixed; boundary="===============5153494859705205323=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 336/1029] drivers/usb/host/xhci-ring.c:1286:3: warning: Value stored to 'stream_id' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 27 Mar 2022 22:53:30 +0800
Message-ID: <202203272213.jddCKGys-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5153494859705205323==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Piyush Mehta <piyush.mehta@xilinx.com>
CC: Manish Narani <manish.narani@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   1870e0fa79a9d58c6748c34550f3ccea0b515933
commit: b93ce7fead6731a072aca8f2c268025f01226cb1 [336/1029] usb: xhci: Add =
workaround for fixing ep stream ring hang issue
:::::: branch date: 3 days ago
:::::: commit date: 8 weeks ago
config: arm-randconfig-c002-20220327 (https://download.01.org/0day-ci/archi=
ve/20220327/202203272213.jddCKGys-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/Xilinx/linux-xlnx/commit/b93ce7fead6731a072aca=
8f2c268025f01226cb1
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout b93ce7fead6731a072aca8f2c268025f01226cb1
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
   drivers/usb/host/xhci.h:1507:32: note: expanded from macro 'TRB_TYPE_LIN=
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
>> drivers/usb/host/xhci-ring.c:1286:3: warning: Value stored to 'stream_id=
' is never read [clang-analyzer-deadcode.DeadStores]
                   stream_id =3D ep_ring->stream_id;
                   ^           ~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:1286:3: note: Value stored to 'stream_id' i=
s never read
                   stream_id =3D ep_ring->stream_id;
                   ^           ~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:3806:3: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   ret =3D prepare_transfer(xhci, xhci->devs[slot_id],
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:3806:3: note: Value stored to 'ret' is neve=
r read
                   ret =3D prepare_transfer(xhci, xhci->devs[slot_id],
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:4433:19: warning: Access to field 'command_=
trb' results in a dereference of a null pointer (loaded from variable 'cmd'=
) [clang-analyzer-core.NullDereference]
           cmd->command_trb =3D xhci->cmd_ring->enqueue;
                            ^
   drivers/usb/host/xhci-ring.c:3248:9: note: Calling 'xhci_irq'
           return xhci_irq(hcd);
                  ^~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:3176:6: note: Assuming the condition is fal=
se
           if (status =3D=3D ~(u32)0) {
               ^~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:3176:2: note: Taking false branch
           if (status =3D=3D ~(u32)0) {
           ^
   drivers/usb/host/xhci-ring.c:3182:6: note: Assuming the condition is fal=
se
           if (!(status & STS_EINT))
               ^~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:3182:2: note: Taking false branch
           if (!(status & STS_EINT))
           ^
   drivers/usb/host/xhci-ring.c:3185:6: note: Assuming the condition is fal=
se
           if (status & STS_FATAL) {
               ^~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:3185:2: note: Taking false branch
           if (status & STS_FATAL) {
           ^
   drivers/usb/host/xhci-ring.c:3200:6: note: Assuming field 'msi_enabled' =
is not equal to 0
           if (!hcd->msi_enabled) {
               ^~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:3200:2: note: Taking false branch
           if (!hcd->msi_enabled) {
           ^
   drivers/usb/host/xhci-ring.c:3207:6: note: Assuming the condition is fal=
se
           if (xhci->xhc_state & XHCI_STATE_DYING ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:3207:6: note: Left side of '||' is false
   drivers/usb/host/xhci-ring.c:3208:6: note: Assuming the condition is fal=
se
               xhci->xhc_state & XHCI_STATE_HALTED) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:3207:2: note: Taking false branch
           if (xhci->xhc_state & XHCI_STATE_DYING ||
           ^
   drivers/usb/host/xhci-ring.c:3225:9: note: Calling 'xhci_handle_event'
           while (xhci_handle_event(xhci) > 0) {
                  ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:3061:13: note: Field 'event_ring' is non-nu=
ll
           if (!xhci->event_ring || !xhci->event_ring->dequeue) {
                      ^
   drivers/usb/host/xhci-ring.c:3061:6: note: Left side of '||' is false
           if (!xhci->event_ring || !xhci->event_ring->dequeue) {
               ^
   drivers/usb/host/xhci-ring.c:3061:27: note: Assuming field 'dequeue' is =
non-null
           if (!xhci->event_ring || !xhci->event_ring->dequeue) {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:3061:2: note: Taking false branch
           if (!xhci->event_ring || !xhci->event_ring->dequeue) {
           ^
   drivers/usb/host/xhci-ring.c:3068:6: note: Assuming the condition is fal=
se
           if ((le32_to_cpu(event->event_cmd.flags) & TRB_CYCLE) !=3D
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:3068:2: note: Taking false branch
           if ((le32_to_cpu(event->event_cmd.flags) & TRB_CYCLE) !=3D
           ^
   drivers/usb/host/xhci-ring.c:3082:2: note: Control jumps to 'case 33:'  =
at line 3083
           switch (trb_type) {
           ^
   drivers/usb/host/xhci-ring.c:3084:3: note: Calling 'handle_cmd_completio=
n'
                   handle_cmd_completion(xhci, &event->event_cmd);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:1797:6: note: Assuming 'slot_id' is < MAX_H=
C_SLOTS
           if (slot_id >=3D MAX_HC_SLOTS) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:1797:2: note: Taking false branch
           if (slot_id >=3D MAX_HC_SLOTS) {
           ^
   drivers/usb/host/xhci-ring.c:1813:6: note: Assuming 'cmd_dequeue_dma' is=
 not equal to 0
           if (!cmd_dequeue_dma || cmd_dma !=3D (u64)cmd_dequeue_dma) {
               ^~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:1813:6: note: Left side of '||' is false
   drivers/usb/host/xhci-ring.c:1813:26: note: Assuming 'cmd_dma' is equal =
to 'cmd_dequeue_dma'
           if (!cmd_dequeue_dma || cmd_dma !=3D (u64)cmd_dequeue_dma) {
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:1813:2: note: Taking false branch
           if (!cmd_dequeue_dma || cmd_dma !=3D (u64)cmd_dequeue_dma) {
           ^
   drivers/usb/host/xhci-ring.c:1819:8: note: Left side of '&&' is false
           cmd =3D list_first_entry(&xhci->cmd_list, struct xhci_command, c=
md_list);
                 ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
--
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
   drivers/usb/host/xhci.h:1507:32: note: expanded from macro 'TRB_TYPE_LIN=
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
>> drivers/usb/host/xhci-ring.c:1286:3: warning: Value stored to 'stream_id=
' is never read [clang-analyzer-deadcode.DeadStores]
                   stream_id =3D ep_ring->stream_id;
                   ^           ~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:1286:3: note: Value stored to 'stream_id' i=
s never read
                   stream_id =3D ep_ring->stream_id;
                   ^           ~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:3806:3: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   ret =3D prepare_transfer(xhci, xhci->devs[slot_id],
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:3806:3: note: Value stored to 'ret' is neve=
r read
                   ret =3D prepare_transfer(xhci, xhci->devs[slot_id],
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:4433:19: warning: Access to field 'command_=
trb' results in a dereference of a null pointer (loaded from variable 'cmd'=
) [clang-analyzer-core.NullDereference]
           cmd->command_trb =3D xhci->cmd_ring->enqueue;
                            ^
   drivers/usb/host/xhci-ring.c:3248:9: note: Calling 'xhci_irq'
           return xhci_irq(hcd);
                  ^~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:3176:6: note: Assuming the condition is fal=
se
           if (status =3D=3D ~(u32)0) {
               ^~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:3176:2: note: Taking false branch
           if (status =3D=3D ~(u32)0) {
           ^
   drivers/usb/host/xhci-ring.c:3182:6: note: Assuming the condition is fal=
se
           if (!(status & STS_EINT))
               ^~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:3182:2: note: Taking false branch
           if (!(status & STS_EINT))
           ^
   drivers/usb/host/xhci-ring.c:3185:6: note: Assuming the condition is fal=
se
           if (status & STS_FATAL) {
               ^~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:3185:2: note: Taking false branch
           if (status & STS_FATAL) {
           ^
   drivers/usb/host/xhci-ring.c:3200:6: note: Assuming field 'msi_enabled' =
is not equal to 0
           if (!hcd->msi_enabled) {
               ^~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:3200:2: note: Taking false branch
           if (!hcd->msi_enabled) {
           ^
   drivers/usb/host/xhci-ring.c:3207:6: note: Assuming the condition is fal=
se
           if (xhci->xhc_state & XHCI_STATE_DYING ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:3207:6: note: Left side of '||' is false
   drivers/usb/host/xhci-ring.c:3208:6: note: Assuming the condition is fal=
se
               xhci->xhc_state & XHCI_STATE_HALTED) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:3207:2: note: Taking false branch
           if (xhci->xhc_state & XHCI_STATE_DYING ||
           ^
   drivers/usb/host/xhci-ring.c:3225:9: note: Calling 'xhci_handle_event'
           while (xhci_handle_event(xhci) > 0) {
                  ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:3061:13: note: Field 'event_ring' is non-nu=
ll
           if (!xhci->event_ring || !xhci->event_ring->dequeue) {
                      ^
   drivers/usb/host/xhci-ring.c:3061:6: note: Left side of '||' is false
           if (!xhci->event_ring || !xhci->event_ring->dequeue) {
               ^
   drivers/usb/host/xhci-ring.c:3061:27: note: Assuming field 'dequeue' is =
non-null
           if (!xhci->event_ring || !xhci->event_ring->dequeue) {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:3061:2: note: Taking false branch
           if (!xhci->event_ring || !xhci->event_ring->dequeue) {
           ^
   drivers/usb/host/xhci-ring.c:3068:6: note: Assuming the condition is fal=
se
           if ((le32_to_cpu(event->event_cmd.flags) & TRB_CYCLE) !=3D
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:3068:2: note: Taking false branch
           if ((le32_to_cpu(event->event_cmd.flags) & TRB_CYCLE) !=3D
           ^
   drivers/usb/host/xhci-ring.c:3082:2: note: Control jumps to 'case 33:'  =
at line 3083
           switch (trb_type) {
           ^
   drivers/usb/host/xhci-ring.c:3084:3: note: Calling 'handle_cmd_completio=
n'
                   handle_cmd_completion(xhci, &event->event_cmd);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:1797:6: note: Assuming 'slot_id' is < MAX_H=
C_SLOTS
           if (slot_id >=3D MAX_HC_SLOTS) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:1797:2: note: Taking false branch
           if (slot_id >=3D MAX_HC_SLOTS) {
           ^
   drivers/usb/host/xhci-ring.c:1813:6: note: Assuming 'cmd_dequeue_dma' is=
 not equal to 0
           if (!cmd_dequeue_dma || cmd_dma !=3D (u64)cmd_dequeue_dma) {
               ^~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:1813:6: note: Left side of '||' is false
   drivers/usb/host/xhci-ring.c:1813:26: note: Assuming 'cmd_dma' is equal =
to 'cmd_dequeue_dma'
           if (!cmd_dequeue_dma || cmd_dma !=3D (u64)cmd_dequeue_dma) {
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:1813:2: note: Taking false branch
           if (!cmd_dequeue_dma || cmd_dma !=3D (u64)cmd_dequeue_dma) {
           ^
   drivers/usb/host/xhci-ring.c:1819:8: note: Left side of '&&' is false
           cmd =3D list_first_entry(&xhci->cmd_list, struct xhci_command, c=
md_list);
                 ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^

vim +/stream_id +1286 drivers/usb/host/xhci-ring.c

d9f11ba9f107aa Mathias Nyman        2017-04-07  1252  =

b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1253  /* This function is c=
alled when the stream ring timer gets timedout.
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1254   * dwc3 host controll=
er has an issue where it doesn't process the BULK IN
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1255   * stream ring TD's(o=
nce in a while) even after ringing DoorBell for that
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1256   * stream ring. Becau=
se of this behaviour there will be no transfer events
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1257   * generated by the c=
ontroller on the stream ring, resulting in the hang
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1258   * condition. xhci_st=
ream_timeout() solves this issue by sending a stop
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1259   * command on the str=
eam ring after stream timer gets timedout.
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1260   */
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1261  void xhci_stream_time=
out(struct timer_list *arg)
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1262  {
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1263  	struct xhci_hcd *xhc=
i;
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1264  	struct xhci_virt_ep =
*ep;
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1265  	struct xhci_ring *ep=
_ring;
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1266  	unsigned int slot_id=
, ep_index, stream_id;
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1267  	struct xhci_td *td =
=3D NULL;
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1268  	struct urb *urb =3D =
NULL;
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1269  	struct urb_priv *urb=
_priv;
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1270  	struct xhci_command =
*command;
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1271  	unsigned long flags;
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1272  	int i;
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1273  =

b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1274  	ep_ring =3D from_tim=
er(ep_ring, arg, stream_timer);
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1275  	xhci =3D ep_ring->xh=
ci;
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1276  =

b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1277  	spin_lock_irqsave(&x=
hci->lock, flags);
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1278  =

b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1279  	if (!list_empty(&ep_=
ring->td_list)) {
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1280  		td =3D list_entry(e=
p_ring->td_list.next, struct xhci_td, td_list);
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1281  		urb =3D td->urb;
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1282  		urb_priv =3D urb->h=
cpriv;
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1283  =

b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1284  		slot_id =3D urb->de=
v->slot_id;
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1285  		ep_index =3D xhci_g=
et_endpoint_index(&urb->ep->desc);
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26 @1286  		stream_id =3D ep_ri=
ng->stream_id;
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1287  		ep =3D &xhci->devs[=
slot_id]->eps[ep_index];
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1288  		ep_ring->stream_tim=
eout_handler =3D true;
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1289  =

b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1290  		/* Delete the strea=
m ring timer */
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1291  		del_timer(&ep_ring-=
>stream_timer);
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1292  =

b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1293  		for (i =3D 0; i < u=
rb_priv->num_tds; i++) {
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1294  			td =3D &urb_priv->=
td[i];
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1295  			list_add_tail(&td-=
>cancelled_td_list,
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1296  					&ep->cancelled_t=
d_list);
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1297  		}
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1298  =

b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1299  		/* Queue a stop end=
point command, but only if this is
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1300  		 * the first cancel=
lation to be handled.
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1301  		 */
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1302  		if (!(ep->ep_state =
& EP_STOP_CMD_PENDING)) {
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1303  			command =3D xhci_a=
lloc_command(xhci, false,
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1304  					GFP_ATOMIC);
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1305  			if (!command) {
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1306  				xhci_warn(xhci,
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1307  					"%s: Failed to a=
llocate command\n",
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1308  						__func__);
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1309  				spin_unlock_irqre=
store(&xhci->lock, flags);
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1310  				return;
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1311  			}
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1312  =

b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1313  			ep->ep_state |=3D =
EP_STOP_CMD_PENDING;
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1314  			ep->stop_cmd_timer=
.expires =3D jiffies +
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1315  				XHCI_STOP_EP_CMD_=
TIMEOUT * HZ;
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1316  			add_timer(&ep->sto=
p_cmd_timer);
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1317  			xhci_queue_stop_en=
dpoint(xhci, command,
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1318  					urb->dev->slot_i=
d, ep_index, 0);
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1319  			xhci_ring_cmd_db(x=
hci);
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1320  		}
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1321  =

b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1322  		spin_unlock_irqrest=
ore(&xhci->lock, flags);
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1323  		return;
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1324  	}
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1325  =

b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1326  	spin_unlock_irqresto=
re(&xhci->lock, flags);
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1327  	/* let the SCSI stac=
k take care */
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1328  	del_timer(&ep_ring->=
stream_timer);
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1329  }
b93ce7fead6731 Anurag Kumar Vulisha 2022-01-26  1330  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5153494859705205323==--

