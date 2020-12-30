Content-Type: multipart/mixed; boundary="===============4653032894378350668=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/usb/gadget/function/u_ether.c:233:13: warning: Either the condition 'if(skb)' is redundant or there is possible null pointer dereference: skb.
Date: Thu, 31 Dec 2020 05:13:30 +0800
Message-ID: <202012310518.omp5UNVf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4653032894378350668==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   139711f033f636cc78b6aaf7363252241b9698ef
commit: df8df5e4bc37e39010cfdf5d50cf726fe08aae5b usb: get rid of 'choice' f=
or legacy gadget drivers
date:   10 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 10 months ago
compiler: xtensa-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/usb/gadget/function/u_ether.c:233:13: warning: Either the condit=
ion 'if(skb)' is redundant or there is possible null pointer dereference: s=
kb. [nullPointerRedundantCheck]
    req->buf =3D skb->data;
               ^
   drivers/usb/gadget/function/u_ether.c:244:6: note: Assuming that conditi=
on 'if(skb)' is not redundant
     if (skb)
        ^
   drivers/usb/gadget/function/u_ether.c:233:13: note: Null pointer derefer=
ence
    req->buf =3D skb->data;
               ^

vim +233 drivers/usb/gadget/function/u_ether.c

2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  173  =

2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  174  static int
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  175  rx_submit(struct eth_dev *dev, struct usb_request *req, g=
fp_t gfp_flags)
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  176  {
387f869d2579e37 drivers/usb/gadget/function/u_ether.c Felipe Balbi         =
 2017-03-22  177  	struct usb_gadget *g =3D dev->gadget;
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  178  	struct sk_buff	*skb;
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  179  	int		retval =3D -ENOMEM;
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  180  	size_t		size =3D 0;
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  181  	struct usb_ep	*out;
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  182  	unsigned long	flags;
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  183  =

2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  184  	spin_lock_irqsave(&dev->lock, flags);
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  185  	if (dev->port_usb)
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  186  		out =3D dev->port_usb->out_ep;
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  187  	else
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  188  		out =3D NULL;
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  189  =

2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  190  	if (!out)
d29fcf7078bc8be drivers/usb/gadget/function/u_ether.c Kiruthika Varadarajan=
 2019-06-18  191  	{
d29fcf7078bc8be drivers/usb/gadget/function/u_ether.c Kiruthika Varadarajan=
 2019-06-18  192  		spin_unlock_irqrestore(&dev->lock, flags);
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  193  		return -ENOTCONN;
d29fcf7078bc8be drivers/usb/gadget/function/u_ether.c Kiruthika Varadarajan=
 2019-06-18  194  	}
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  195  =

2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  196  	/* Padding up to RX_EXTRA handles minor disagreements wi=
th host.
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  197  	 * Normally we use the USB "terminate on short read" con=
vention;
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  198  	 * so allow up to (N*maxpacket), since that memory is no=
rmally
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  199  	 * already allocated.  Some hardware doesn't deal well w=
ith short
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  200  	 * reads (e.g. DMA must be N*maxpacket), so for now don'=
t trim a
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  201  	 * byte off the end (to force hardware errors on overflo=
w).
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  202  	 *
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  203  	 * RNDIS uses internal framing, and explicitly allows se=
nders to
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  204  	 * pad to end-of-packet.  That's potentially nice for sp=
eed, but
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  205  	 * means receivers can't recover lost synch on their own=
 (because
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  206  	 * new packets don't only start after a short RX).
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  207  	 */
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  208  	size +=3D sizeof(struct ethhdr) + dev->net->mtu + RX_EXT=
RA;
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  209  	size +=3D dev->port_usb->header_len;
387f869d2579e37 drivers/usb/gadget/function/u_ether.c Felipe Balbi         =
 2017-03-22  210  =

387f869d2579e37 drivers/usb/gadget/function/u_ether.c Felipe Balbi         =
 2017-03-22  211  	if (g->quirk_ep_out_aligned_size) {
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  212  		size +=3D out->maxpacket - 1;
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  213  		size -=3D size % out->maxpacket;
387f869d2579e37 drivers/usb/gadget/function/u_ether.c Felipe Balbi         =
 2017-03-22  214  	}
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  215  =

5c1168dbc508282 drivers/usb/gadget/u_ether.c          Yauheni Kaliuta      =
 2010-12-08  216  	if (dev->port_usb->is_fixed)
45d1b7ae205e39e drivers/usb/gadget/u_ether.c          Stephen Hemminger    =
 2011-03-01  217  		size =3D max_t(size_t, size, dev->port_usb->fixed_out_l=
en);
d29fcf7078bc8be drivers/usb/gadget/function/u_ether.c Kiruthika Varadarajan=
 2019-06-18  218  	spin_unlock_irqrestore(&dev->lock, flags);
5c1168dbc508282 drivers/usb/gadget/u_ether.c          Yauheni Kaliuta      =
 2010-12-08  219  =

18d4689643b08c6 drivers/usb/gadget/function/u_ether.c Torsten Polle        =
 2016-09-19  220  	skb =3D __netdev_alloc_skb(dev->net, size + NET_IP_ALIGN=
, gfp_flags);
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  221  	if (skb =3D=3D NULL) {
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  222  		DBG(dev, "no rx skb\n");
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  223  		goto enomem;
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  224  	}
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  225  =

2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  226  	/* Some platforms perform better when IP packets are ali=
gned,
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  227  	 * but on at least one, checksumming fails otherwise.  N=
ote:
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  228  	 * RNDIS headers involve variable numbers of LE32 values.
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  229  	 */
05f6b0ff68429bb drivers/usb/gadget/function/u_ether.c Yoshihiro Shimoda    =
 2016-08-22  230  	if (likely(!dev->no_skb_reserve))
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  231  		skb_reserve(skb, NET_IP_ALIGN);
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  232  =

2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19 @233  	req->buf =3D skb->data;
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  234  	req->length =3D size;
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  235  	req->complete =3D rx_complete;
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  236  	req->context =3D skb;
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  237  =

2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  238  	retval =3D usb_ep_queue(out, req, gfp_flags);
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  239  	if (retval =3D=3D -ENOMEM)
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  240  enomem:
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  241  		defer_kevent(dev, WORK_RX_MEMORY);
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  242  	if (retval) {
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  243  		DBG(dev, "rx submit --> %d\n", retval);
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  244  		if (skb)
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  245  			dev_kfree_skb_any(skb);
9189a330936fe05 drivers/usb/gadget/u_ether.c          Felipe Balbi         =
 2014-04-21  246  		spin_lock_irqsave(&dev->req_lock, flags);
9189a330936fe05 drivers/usb/gadget/u_ether.c          Felipe Balbi         =
 2014-04-21  247  		list_add(&req->list, &dev->rx_reqs);
9189a330936fe05 drivers/usb/gadget/u_ether.c          Felipe Balbi         =
 2014-04-21  248  		spin_unlock_irqrestore(&dev->req_lock, flags);
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  249  	}
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  250  	return retval;
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  251  }
2b3d942c4878084 drivers/usb/gadget/u_ether.c          David Brownell       =
 2008-06-19  252  =


:::::: The code at line 233 was first introduced by commit
:::::: 2b3d942c4878084a37991a65e66512c02b8fa2ad usb ethernet gadget: split =
out network core

:::::: TO: David Brownell <dbrownell@users.sourceforge.net>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4653032894378350668==--

