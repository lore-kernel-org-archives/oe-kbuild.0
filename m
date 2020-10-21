Content-Type: multipart/mixed; boundary="===============2145838111547799791=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xhci:rewrite_invalid_context_at_stop_endpoint 6/7] drivers/usb/host/xhci-ring.c:2129:6: warning: Either the condition 'td' is redundant or there is possible null pointer dereference: td.
Date: Thu, 22 Oct 2020 07:43:00 +0800
Message-ID: <202010220730.BAWjrJUy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2145838111547799791==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Mathias Nyman <mathias.nyman@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git rew=
rite_invalid_context_at_stop_endpoint
head:   713ccf6a9e51951510781a31ab8d81a255da79d0
commit: 6cbbe8dd90029b28a579b2871b383b1e10230c4e [6/7] xhci: introduce a ne=
w move_dequeue_past_td() function to replace old code.
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
compiler: alpha-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from drivers/usb/host/xhci-ring.c:
   drivers/usb/host/xhci.h:2454:11: warning: %d in format string (no. 1) re=
quires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType=
_sint]
      ret +=3D sprintf(str + ret, " %d%s",
             ^
   drivers/usb/host/xhci.h:2466:11: warning: %d in format string (no. 1) re=
quires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType=
_sint]
      ret +=3D sprintf(str + ret, " %d%s",
             ^
>> drivers/usb/host/xhci-ring.c:2129:6: warning: Either the condition 'td' =
is redundant or there is possible null pointer dereference: td. [nullPointe=
rRedundantCheck]
    if (td->urb->dev->tt && !usb_pipeint(td->urb->pipe) &&
        ^
   drivers/usb/host/xhci-ring.c:2158:7: note: Assuming that condition 'td' =
is not redundant
     if (td && list_empty(&td->cancelled_td_list)) {
         ^
   drivers/usb/host/xhci-ring.c:2163:34: note: Calling function 'xhci_clear=
_hub_tt_buffer', 2nd argument 'td' value is 0
     xhci_clear_hub_tt_buffer(xhci, td, ep);
                                    ^
   drivers/usb/host/xhci-ring.c:2129:6: note: Null pointer dereference
    if (td->urb->dev->tt && !usb_pipeint(td->urb->pipe) &&
        ^
   drivers/usb/host/xhci-ring.c:4052:18: warning: Shifting signed 32-bit va=
lue by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
     sia_frame_id =3D TRB_SIA;
                    ^

vim +/td +2129 drivers/usb/host/xhci-ring.c

d0e96f5a71a032c Sarah Sharp 2009-04-27  2121  =

ef513be0a9057cc Jim Lin     2019-06-03  2122  static void xhci_clear_hub_tt=
_buffer(struct xhci_hcd *xhci, struct xhci_td *td,
ef513be0a9057cc Jim Lin     2019-06-03  2123  		struct xhci_virt_ep *ep)
ef513be0a9057cc Jim Lin     2019-06-03  2124  {
ef513be0a9057cc Jim Lin     2019-06-03  2125  	/*
ef513be0a9057cc Jim Lin     2019-06-03  2126  	 * As part of low/full-speed=
 endpoint-halt processing
ef513be0a9057cc Jim Lin     2019-06-03  2127  	 * we must clear the TT buff=
er (USB 2.0 specification 11.17.5).
ef513be0a9057cc Jim Lin     2019-06-03  2128  	 */
ef513be0a9057cc Jim Lin     2019-06-03 @2129  	if (td->urb->dev->tt && !usb=
_pipeint(td->urb->pipe) &&
ef513be0a9057cc Jim Lin     2019-06-03  2130  	    (td->urb->dev->tt->hub !=
=3D xhci_to_hcd(xhci)->self.root_hub) &&
ef513be0a9057cc Jim Lin     2019-06-03  2131  	    !(ep->ep_state & EP_CLEA=
RING_TT)) {
ef513be0a9057cc Jim Lin     2019-06-03  2132  		ep->ep_state |=3D EP_CLEARI=
NG_TT;
ef513be0a9057cc Jim Lin     2019-06-03  2133  		td->urb->ep->hcpriv =3D td-=
>urb->dev;
ef513be0a9057cc Jim Lin     2019-06-03  2134  		if (usb_hub_clear_tt_buffer=
(td->urb))
ef513be0a9057cc Jim Lin     2019-06-03  2135  			ep->ep_state &=3D ~EP_CLEA=
RING_TT;
ef513be0a9057cc Jim Lin     2019-06-03  2136  	}
ef513be0a9057cc Jim Lin     2019-06-03  2137  }
ef513be0a9057cc Jim Lin     2019-06-03  2138  =


:::::: The code at line 2129 was first introduced by commit
:::::: ef513be0a9057cc6baf5d29566aaaefa214ba344 usb: xhci: Add Clear_TT_Buf=
fer

:::::: TO: Jim Lin <jilin@nvidia.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2145838111547799791==--

