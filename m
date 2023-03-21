Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A701FB8
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Mar 2023 08:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679386115; x=1710922115;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pBYZwVcXwj+vg3v3FrSBW6V/S8z2Xj7uKHPeQ9XzcmI=;
  b=kI9b0g99qRkx8yNgFz86szDZdYFrXnxJv+LAzOo15+Xu6QMOBIvtVVSA
   zM2/fduV6mYRF2iRcR4ZZKhAHzz9IzLHUvKO2zWik7Ki28zGK++fIJEPo
   qHgSMHKEBTLOxjaPGF3t/3f/FFRd/EwFyyFEyVOUS0YOYqtF4vUgqXWQY
   UERRhs5KLOmDCrcSWD5AQoj78AFvY3BDDneVPbfU79sdWIwOUURtFokuz
   idWY8m0ePYb9LczNPs8pxl6Zh658h5uXqdTvWcBX9K/HtXao3GDb4bd0k
   kSgDAx/zJB4NxZikiEMME8Bu2yvF7bi5pGbSxW5Xp/R5Kieeoegt0pyso
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="338912214"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="338912214"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 01:08:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="750446038"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="750446038"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Mar 2023 01:08:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peX2Z-000BkO-0g;
	Tue, 21 Mar 2023 08:08:19 +0000
Date: Tue, 21 Mar 2023 16:07:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v12 6/6] usb: gadget: f_ecm: Add suspend/resume and
 remote wakeup support
Message-ID: <202303211515.XaO8YKCz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <1679009888-8239-7-git-send-email-quic_eserrao@quicinc.com>
References: <1679009888-8239-7-git-send-email-quic_eserrao@quicinc.com>
TO: Elson Roy Serrao <quic_eserrao@quicinc.com>
TO: gregkh@linuxfoundation.org
TO: Thinh.Nguyen@synopsys.com
CC: linux-kernel@vger.kernel.org
CC: linux-usb@vger.kernel.org
CC: quic_wcheng@quicinc.com
CC: quic_jackp@quicinc.com
CC: Elson Roy Serrao <quic_eserrao@quicinc.com>

Hi Elson,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linus/master v6.3-rc3 next-20230321]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Elson-Roy-Serrao/usb-gadget-Properly-configure-the-device-for-remote-wakeup/20230317-074030
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/1679009888-8239-7-git-send-email-quic_eserrao%40quicinc.com
patch subject: [PATCH v12 6/6] usb: gadget: f_ecm: Add suspend/resume and remote wakeup support
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: riscv-randconfig-m031-20230319 (https://download.01.org/0day-ci/archive/20230321/202303211515.XaO8YKCz-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303211515.XaO8YKCz-lkp@intel.com/

New smatch warnings:
drivers/usb/gadget/function/u_ether.c:474 eth_start_xmit() error: we previously assumed 'dev->port_usb' could be null (see line 466)
drivers/usb/gadget/function/u_ether.c:539 eth_start_xmit() warn: variable dereferenced before check 'dev->port_usb' (see line 474)

Old smatch warnings:
drivers/usb/gadget/function/u_ether.c:553 eth_start_xmit() error: we previously assumed 'skb' could be null (see line 491)

vim +474 drivers/usb/gadget/function/u_ether.c

11f254fc796c87 drivers/usb/gadget/function/u_ether.c Elson Roy Serrao    2023-03-16  453  
25a79c41ce0ce8 drivers/usb/gadget/u_ether.c          Stephen Hemminger   2009-08-31  454  static netdev_tx_t eth_start_xmit(struct sk_buff *skb,
25a79c41ce0ce8 drivers/usb/gadget/u_ether.c          Stephen Hemminger   2009-08-31  455  					struct net_device *net)
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  456  {
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  457  	struct eth_dev		*dev = netdev_priv(net);
6d3865f9d41f15 drivers/usb/gadget/u_ether.c          Jim Baxter          2014-07-07  458  	int			length = 0;
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  459  	int			retval;
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  460  	struct usb_request	*req = NULL;
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  461  	unsigned long		flags;
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  462  	struct usb_ep		*in;
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  463  	u16			cdc_filter;
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  464  
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  465  	spin_lock_irqsave(&dev->lock, flags);
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19 @466  	if (dev->port_usb) {
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  467  		in = dev->port_usb->in_ep;
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  468  		cdc_filter = dev->port_usb->cdc_filter;
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  469  	} else {
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  470  		in = NULL;
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  471  		cdc_filter = 0;
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  472  	}
11f254fc796c87 drivers/usb/gadget/function/u_ether.c Elson Roy Serrao    2023-03-16  473  
11f254fc796c87 drivers/usb/gadget/function/u_ether.c Elson Roy Serrao    2023-03-16 @474  	if (dev->port_usb->is_suspend) {
11f254fc796c87 drivers/usb/gadget/function/u_ether.c Elson Roy Serrao    2023-03-16  475  		DBG(dev, "Port suspended. Triggering wakeup\n");
11f254fc796c87 drivers/usb/gadget/function/u_ether.c Elson Roy Serrao    2023-03-16  476  		netif_stop_queue(net);
11f254fc796c87 drivers/usb/gadget/function/u_ether.c Elson Roy Serrao    2023-03-16  477  		spin_unlock_irqrestore(&dev->lock, flags);
11f254fc796c87 drivers/usb/gadget/function/u_ether.c Elson Roy Serrao    2023-03-16  478  		ether_wakeup_host(dev->port_usb);
11f254fc796c87 drivers/usb/gadget/function/u_ether.c Elson Roy Serrao    2023-03-16  479  		return NETDEV_TX_BUSY;
11f254fc796c87 drivers/usb/gadget/function/u_ether.c Elson Roy Serrao    2023-03-16  480  	}
11f254fc796c87 drivers/usb/gadget/function/u_ether.c Elson Roy Serrao    2023-03-16  481  
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  482  	spin_unlock_irqrestore(&dev->lock, flags);
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  483  
8ae01239609b29 drivers/usb/gadget/function/u_ether.c Maciej Żenczykowski 2021-07-01  484  	if (!in) {
8ae01239609b29 drivers/usb/gadget/function/u_ether.c Maciej Żenczykowski 2021-07-01  485  		if (skb)
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  486  			dev_kfree_skb_any(skb);
6ed106549d1747 drivers/usb/gadget/u_ether.c          Patrick McHardy     2009-06-23  487  		return NETDEV_TX_OK;
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  488  	}
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  489  
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  490  	/* apply outgoing CDC or RNDIS filters */
6d3865f9d41f15 drivers/usb/gadget/u_ether.c          Jim Baxter          2014-07-07  491  	if (skb && !is_promisc(cdc_filter)) {
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  492  		u8		*dest = skb->data;
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  493  
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  494  		if (is_multicast_ether_addr(dest)) {
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  495  			u16	type;
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  496  
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  497  			/* ignores USB_CDC_PACKET_TYPE_MULTICAST and host
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  498  			 * SET_ETHERNET_MULTICAST_FILTERS requests
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  499  			 */
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  500  			if (is_broadcast_ether_addr(dest))
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  501  				type = USB_CDC_PACKET_TYPE_BROADCAST;
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  502  			else
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  503  				type = USB_CDC_PACKET_TYPE_ALL_MULTICAST;
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  504  			if (!(cdc_filter & type)) {
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  505  				dev_kfree_skb_any(skb);
6ed106549d1747 drivers/usb/gadget/u_ether.c          Patrick McHardy     2009-06-23  506  				return NETDEV_TX_OK;
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  507  			}
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  508  		}
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  509  		/* ignores USB_CDC_PACKET_TYPE_DIRECTED */
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  510  	}
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  511  
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  512  	spin_lock_irqsave(&dev->req_lock, flags);
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  513  	/*
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  514  	 * this freelist can be empty if an interrupt triggered disconnect()
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  515  	 * and reconfigured the gadget (shutting down this queue) after the
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  516  	 * network stack decided to xmit but before we got the spinlock.
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  517  	 */
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  518  	if (list_empty(&dev->tx_reqs)) {
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  519  		spin_unlock_irqrestore(&dev->req_lock, flags);
5b548140225c6b drivers/usb/gadget/u_ether.c          Patrick McHardy     2009-06-12  520  		return NETDEV_TX_BUSY;
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  521  	}
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  522  
fea14e68ff5e11 drivers/usb/gadget/function/u_ether.c Felipe Balbi        2017-03-22  523  	req = list_first_entry(&dev->tx_reqs, struct usb_request, list);
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  524  	list_del(&req->list);
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  525  
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  526  	/* temporarily stop TX queue when the freelist empties */
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  527  	if (list_empty(&dev->tx_reqs))
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  528  		netif_stop_queue(net);
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  529  	spin_unlock_irqrestore(&dev->req_lock, flags);
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  530  
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  531  	/* no buffer copies needed, unless the network stack did it
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  532  	 * or the hardware can't use skb buffers.
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  533  	 * or there's not enough space for extra headers we need
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  534  	 */
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  535  	if (dev->wrap) {
9b39e9ddedeef4 drivers/usb/gadget/u_ether.c          Brian Niebuhr       2009-08-14  536  		unsigned long	flags;
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  537  
9b39e9ddedeef4 drivers/usb/gadget/u_ether.c          Brian Niebuhr       2009-08-14  538  		spin_lock_irqsave(&dev->lock, flags);
9b39e9ddedeef4 drivers/usb/gadget/u_ether.c          Brian Niebuhr       2009-08-14 @539  		if (dev->port_usb)
9b39e9ddedeef4 drivers/usb/gadget/u_ether.c          Brian Niebuhr       2009-08-14  540  			skb = dev->wrap(dev->port_usb, skb);
3a383cc0b8cc33 drivers/usb/gadget/function/u_ether.c Greg Kroah-Hartman  2016-09-19  541  		spin_unlock_irqrestore(&dev->lock, flags);
6d3865f9d41f15 drivers/usb/gadget/u_ether.c          Jim Baxter          2014-07-07  542  		if (!skb) {
6d3865f9d41f15 drivers/usb/gadget/u_ether.c          Jim Baxter          2014-07-07  543  			/* Multi frame CDC protocols may store the frame for
6d3865f9d41f15 drivers/usb/gadget/u_ether.c          Jim Baxter          2014-07-07  544  			 * later which is not a dropped frame.
6d3865f9d41f15 drivers/usb/gadget/u_ether.c          Jim Baxter          2014-07-07  545  			 */
88c09eacf560c3 drivers/usb/gadget/function/u_ether.c Peter Chen          2016-07-01  546  			if (dev->port_usb &&
3a383cc0b8cc33 drivers/usb/gadget/function/u_ether.c Greg Kroah-Hartman  2016-09-19  547  					dev->port_usb->supports_multi_frame)
6d3865f9d41f15 drivers/usb/gadget/u_ether.c          Jim Baxter          2014-07-07  548  				goto multiframe;
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  549  			goto drop;
6d3865f9d41f15 drivers/usb/gadget/u_ether.c          Jim Baxter          2014-07-07  550  		}
6d3865f9d41f15 drivers/usb/gadget/u_ether.c          Jim Baxter          2014-07-07  551  	}
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  552  
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  553  	length = skb->len;
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  554  	req->buf = skb->data;
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  555  	req->context = skb;
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  556  	req->complete = tx_complete;
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  557  
5c1168dbc50828 drivers/usb/gadget/u_ether.c          Yauheni Kaliuta     2010-12-08  558  	/* NCM requires no zlp if transfer is dwNtbInMaxSize */
79775f44183840 drivers/usb/gadget/function/u_ether.c Harish Jenny K N    2016-09-09  559  	if (dev->port_usb &&
79775f44183840 drivers/usb/gadget/function/u_ether.c Harish Jenny K N    2016-09-09  560  	    dev->port_usb->is_fixed &&
5c1168dbc50828 drivers/usb/gadget/u_ether.c          Yauheni Kaliuta     2010-12-08  561  	    length == dev->port_usb->fixed_in_len &&
5c1168dbc50828 drivers/usb/gadget/u_ether.c          Yauheni Kaliuta     2010-12-08  562  	    (length % in->maxpacket) == 0)
5c1168dbc50828 drivers/usb/gadget/u_ether.c          Yauheni Kaliuta     2010-12-08  563  		req->zero = 0;
5c1168dbc50828 drivers/usb/gadget/u_ether.c          Yauheni Kaliuta     2010-12-08  564  	else
5c1168dbc50828 drivers/usb/gadget/u_ether.c          Yauheni Kaliuta     2010-12-08  565  		req->zero = 1;
5c1168dbc50828 drivers/usb/gadget/u_ether.c          Yauheni Kaliuta     2010-12-08  566  
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  567  	/* use zlp framing on tx for strict CDC-Ether conformance,
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  568  	 * though any robust network rx path ignores extra padding.
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  569  	 * and some hardware doesn't like to write zlps.
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  570  	 */
5c1168dbc50828 drivers/usb/gadget/u_ether.c          Yauheni Kaliuta     2010-12-08  571  	if (req->zero && !dev->zlp && (length % in->maxpacket) == 0)
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  572  		length++;
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  573  
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  574  	req->length = length;
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  575  
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  576  	retval = usb_ep_queue(in, req, GFP_ATOMIC);
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  577  	switch (retval) {
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  578  	default:
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  579  		DBG(dev, "tx queue err %d\n", retval);
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  580  		break;
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  581  	case 0:
860e9538a9482b drivers/usb/gadget/function/u_ether.c Florian Westphal    2016-05-03  582  		netif_trans_update(net);
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  583  		atomic_inc(&dev->tx_qlen);
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  584  	}
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  585  
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  586  	if (retval) {
9b39e9ddedeef4 drivers/usb/gadget/u_ether.c          Brian Niebuhr       2009-08-14  587  		dev_kfree_skb_any(skb);
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  588  drop:
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  589  		dev->net->stats.tx_dropped++;
6d3865f9d41f15 drivers/usb/gadget/u_ether.c          Jim Baxter          2014-07-07  590  multiframe:
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  591  		spin_lock_irqsave(&dev->req_lock, flags);
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  592  		if (list_empty(&dev->tx_reqs))
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  593  			netif_start_queue(net);
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  594  		list_add(&req->list, &dev->tx_reqs);
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  595  		spin_unlock_irqrestore(&dev->req_lock, flags);
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  596  	}
6ed106549d1747 drivers/usb/gadget/u_ether.c          Patrick McHardy     2009-06-23  597  	return NETDEV_TX_OK;
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  598  }
2b3d942c487808 drivers/usb/gadget/u_ether.c          David Brownell      2008-06-19  599  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
