Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0F51CEEA6
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Sep 2024 09:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726307878; cv=none; b=JW6Ry8ABM6tBpuWWhv4Gqs7c8AClDtz3BQA7baOeBXfRgPC4fszU3Wr5/8/h/3DIZuDovXRYIwWN6tH/UPFQQyr2iWLbU5zcmjC6l7raD17iXMvQ2CnwKqm4uYPM/yFeZwd3u/+vX2NjsL+uzrxUM8Rob9aEUbPBoT7jScgSTIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726307878; c=relaxed/simple;
	bh=eh10AlF4A+i8e8SGMtRNA2p+h19kZjJwR16KfwdhA30=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bBBkADxBXYLM0xHPenGexAnWqpvDLQkxMXPMmx3lMLQN+3CF2g6tM/u+W2LMSLMdv/+bgrCx+36PVA6EswaWdqtcFBwWP1DzDuCkePZQlsBiWqcrAx25TzzrAlUG4VbAON/veok8axGewstb9+xnJbNqlTBeyJBgI8SMZTTb8mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VIkdMWsS; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VIkdMWsS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726307875; x=1757843875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eh10AlF4A+i8e8SGMtRNA2p+h19kZjJwR16KfwdhA30=;
  b=VIkdMWsS3Q3CGE07r4Hf+/s5D4gSYy0ltdlAKKHZakdSEpX7PeuSYxRa
   /sihE0N3Z1ZaS+bGPU8cSwN1nn++zB3rfbSbh0Iv83+qys7k0V9VO1GX8
   Vi0HOh+v0+6iyjGnLI5frZH72wFxvICQ0rWgtEWvIdPQ7zbDa41EFh6xK
   X4AYgLEhHS4tldptVHyXqcf4P/L+wq8/d6pXmgVE7dgMK0XRkqOxCmuTc
   AP95Vp7WHgKInBCPEo+IXtAzkxUAmqaVIVnZz9ytcbIs8OH04cqoUUCMU
   DIK3TLYqmUMBxwa7gLC26zTmYIVz4CecAe2JVu49RN6nY9+pU77xIsrPl
   g==;
X-CSE-ConnectionGUID: 5WjrKL79TO+IB9UoSnL/KA==
X-CSE-MsgGUID: E9FDNmLPQfahdZ3JXem9eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="35783516"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="35783516"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 02:57:55 -0700
X-CSE-ConnectionGUID: fTnJbaFzS/yWMnWELbkXxw==
X-CSE-MsgGUID: eN1ILlRGSWmUGG2dLsx8ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="68687458"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Sep 2024 02:57:53 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spPXL-0007bi-1Q;
	Sat, 14 Sep 2024 09:57:51 +0000
Date: Sat, 14 Sep 2024 17:57:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] usb: chipidea: udc: create bounce buffer for problem
 sglist entries if possible
Message-ID: <202409141707.TOsGfePE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240912045150.915573-2-xu.yang_2@nxp.com>
References: <20240912045150.915573-2-xu.yang_2@nxp.com>
TO: Xu Yang <xu.yang_2@nxp.com>
TO: peter.chen@kernel.org
TO: gregkh@linuxfoundation.org
CC: linux-usb@vger.kernel.org
CC: imx@lists.linux.dev
CC: jun.li@nxp.com

Hi Xu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linus/master v6.11-rc7 next-20240913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xu-Yang/usb-chipidea-udc-create-bounce-buffer-for-problem-sglist-entries-if-possible/20240912-125251
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20240912045150.915573-2-xu.yang_2%40nxp.com
patch subject: [PATCH 2/2] usb: chipidea: udc: create bounce buffer for problem sglist entries if possible
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20240914 (https://download.01.org/0day-ci/archive/20240914/202409141707.TOsGfePE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409141707.TOsGfePE-lkp@intel.com/

New smatch warnings:
drivers/usb/chipidea/udc.c:704 _hardware_enqueue() error: uninitialized symbol 'bounced_size'.

Old smatch warnings:
drivers/usb/chipidea/udc.c:2112 ci_udc_start() warn: missing error code? 'retval'

vim +/bounced_size +704 drivers/usb/chipidea/udc.c

91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  663  
aa69a8093ff985 drivers/usb/gadget/ci13xxx_udc.c David Lopo         2008-11-17  664  /**
e46fed9fb3a12b drivers/usb/chipidea/udc.c       Felipe F. Tonello  2015-09-18  665   * _hardware_enqueue: configures a request at hardware level
2dbc5c4c831418 drivers/usb/chipidea/udc.c       Alexander Shishkin 2013-06-13  666   * @hwep:   endpoint
e46fed9fb3a12b drivers/usb/chipidea/udc.c       Felipe F. Tonello  2015-09-18  667   * @hwreq:  request
aa69a8093ff985 drivers/usb/gadget/ci13xxx_udc.c David Lopo         2008-11-17  668   *
aa69a8093ff985 drivers/usb/gadget/ci13xxx_udc.c David Lopo         2008-11-17  669   * This function returns an error code
aa69a8093ff985 drivers/usb/gadget/ci13xxx_udc.c David Lopo         2008-11-17  670   */
8e22978c57087a drivers/usb/chipidea/udc.c       Alexander Shishkin 2013-06-24  671  static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
aa69a8093ff985 drivers/usb/gadget/ci13xxx_udc.c David Lopo         2008-11-17  672  {
8e22978c57087a drivers/usb/chipidea/udc.c       Alexander Shishkin 2013-06-24  673  	struct ci_hdrc *ci = hwep->ci;
0e6ca1998e4c80 drivers/usb/gadget/ci13xxx_udc.c Pavankumar Kondeti 2011-02-18  674  	int ret = 0;
cc9e6c495b0a37 drivers/usb/chipidea/udc.c       Michael Grzeschik  2013-06-13  675  	struct td_node *firstnode, *lastnode;
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  676  	unsigned int bounced_size;
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  677  	struct scatterlist *sg;
aa69a8093ff985 drivers/usb/gadget/ci13xxx_udc.c David Lopo         2008-11-17  678  
aa69a8093ff985 drivers/usb/gadget/ci13xxx_udc.c David Lopo         2008-11-17  679  	/* don't queue twice */
2dbc5c4c831418 drivers/usb/chipidea/udc.c       Alexander Shishkin 2013-06-13  680  	if (hwreq->req.status == -EALREADY)
aa69a8093ff985 drivers/usb/gadget/ci13xxx_udc.c David Lopo         2008-11-17  681  		return -EALREADY;
aa69a8093ff985 drivers/usb/gadget/ci13xxx_udc.c David Lopo         2008-11-17  682  
2dbc5c4c831418 drivers/usb/chipidea/udc.c       Alexander Shishkin 2013-06-13  683  	hwreq->req.status = -EALREADY;
aa69a8093ff985 drivers/usb/gadget/ci13xxx_udc.c David Lopo         2008-11-17  684  
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  685  	if (hwreq->req.num_sgs && hwreq->req.length) {
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  686  		ret = sglist_get_invalid_entry(ci->dev->parent, hwep->dir,
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  687  					&hwreq->req);
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  688  		if (ret < hwreq->req.num_sgs) {
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  689  			ret = sglist_do_bounce(hwreq, ret, hwep->dir == TX,
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  690  					&bounced_size);
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  691  			if (ret)
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  692  				return ret;
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  693  		}
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  694  	}
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  695  
aeb78cda51005f drivers/usb/chipidea/udc.c       Arnd Bergmann      2017-03-13  696  	ret = usb_gadget_map_request_by_dev(ci->dev->parent,
aeb78cda51005f drivers/usb/chipidea/udc.c       Arnd Bergmann      2017-03-13  697  					    &hwreq->req, hwep->dir);
5e0aa49ec61e88 drivers/usb/chipidea/udc.c       Alexander Shishkin 2012-05-11  698  	if (ret)
5e0aa49ec61e88 drivers/usb/chipidea/udc.c       Alexander Shishkin 2012-05-11  699  		return ret;
5e0aa49ec61e88 drivers/usb/chipidea/udc.c       Alexander Shishkin 2012-05-11  700  
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  701  	if (hwreq->sgt.sgl) {
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  702  		/* We've mapped a bigger buffer, now recover the actual size */
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  703  		sg = sg_last(hwreq->req.sg, hwreq->req.num_sgs);
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12 @704  		sg_dma_len(sg) = min(sg_dma_len(sg), bounced_size);
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  705  	}
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  706  
e48aa1eb443f80 drivers/usb/chipidea/udc.c       Peter Chen         2020-02-21  707  	if (hwreq->req.num_mapped_sgs)
e48aa1eb443f80 drivers/usb/chipidea/udc.c       Peter Chen         2020-02-21  708  		ret = prepare_td_for_sg(hwep, hwreq);
e48aa1eb443f80 drivers/usb/chipidea/udc.c       Peter Chen         2020-02-21  709  	else
e48aa1eb443f80 drivers/usb/chipidea/udc.c       Peter Chen         2020-02-21  710  		ret = prepare_td_for_non_sg(hwep, hwreq);
aa69a8093ff985 drivers/usb/gadget/ci13xxx_udc.c David Lopo         2008-11-17  711  
e48aa1eb443f80 drivers/usb/chipidea/udc.c       Peter Chen         2020-02-21  712  	if (ret)
e48aa1eb443f80 drivers/usb/chipidea/udc.c       Peter Chen         2020-02-21  713  		return ret;
cc9e6c495b0a37 drivers/usb/chipidea/udc.c       Michael Grzeschik  2013-06-13  714  
2dbc5c4c831418 drivers/usb/chipidea/udc.c       Alexander Shishkin 2013-06-13  715  	lastnode = list_entry(hwreq->tds.prev,
cc9e6c495b0a37 drivers/usb/chipidea/udc.c       Michael Grzeschik  2013-06-13  716  		struct td_node, td);
cc9e6c495b0a37 drivers/usb/chipidea/udc.c       Michael Grzeschik  2013-06-13  717  
cc9e6c495b0a37 drivers/usb/chipidea/udc.c       Michael Grzeschik  2013-06-13  718  	lastnode->ptr->next = cpu_to_le32(TD_TERMINATE);
2dbc5c4c831418 drivers/usb/chipidea/udc.c       Alexander Shishkin 2013-06-13  719  	if (!hwreq->req.no_interrupt)
cc9e6c495b0a37 drivers/usb/chipidea/udc.c       Michael Grzeschik  2013-06-13  720  		lastnode->ptr->token |= cpu_to_le32(TD_IOC);
b4c5d446a65566 drivers/usb/chipidea/udc.c       Peter Chen         2020-03-25  721  
b4c5d446a65566 drivers/usb/chipidea/udc.c       Peter Chen         2020-03-25  722  	list_for_each_entry_safe(firstnode, lastnode, &hwreq->tds, td)
b4c5d446a65566 drivers/usb/chipidea/udc.c       Peter Chen         2020-03-25  723  		trace_ci_prepare_td(hwep, hwreq, firstnode);
b4c5d446a65566 drivers/usb/chipidea/udc.c       Peter Chen         2020-03-25  724  
b4c5d446a65566 drivers/usb/chipidea/udc.c       Peter Chen         2020-03-25  725  	firstnode = list_first_entry(&hwreq->tds, struct td_node, td);
b4c5d446a65566 drivers/usb/chipidea/udc.c       Peter Chen         2020-03-25  726  
a9c174302b1590 drivers/usb/chipidea/udc.c       Michael Grzeschik  2013-04-04  727  	wmb();
a9c174302b1590 drivers/usb/chipidea/udc.c       Michael Grzeschik  2013-04-04  728  
2dbc5c4c831418 drivers/usb/chipidea/udc.c       Alexander Shishkin 2013-06-13  729  	hwreq->req.actual = 0;
2dbc5c4c831418 drivers/usb/chipidea/udc.c       Alexander Shishkin 2013-06-13  730  	if (!list_empty(&hwep->qh.queue)) {
8e22978c57087a drivers/usb/chipidea/udc.c       Alexander Shishkin 2013-06-24  731  		struct ci_hw_req *hwreqprev;
2dbc5c4c831418 drivers/usb/chipidea/udc.c       Alexander Shishkin 2013-06-13  732  		int n = hw_ep_bit(hwep->num, hwep->dir);
0e6ca1998e4c80 drivers/usb/gadget/ci13xxx_udc.c Pavankumar Kondeti 2011-02-18  733  		int tmp_stat;
cc9e6c495b0a37 drivers/usb/chipidea/udc.c       Michael Grzeschik  2013-06-13  734  		struct td_node *prevlastnode;
cc9e6c495b0a37 drivers/usb/chipidea/udc.c       Michael Grzeschik  2013-06-13  735  		u32 next = firstnode->dma & TD_ADDR_MASK;
0e6ca1998e4c80 drivers/usb/gadget/ci13xxx_udc.c Pavankumar Kondeti 2011-02-18  736  
2dbc5c4c831418 drivers/usb/chipidea/udc.c       Alexander Shishkin 2013-06-13  737  		hwreqprev = list_entry(hwep->qh.queue.prev,
8e22978c57087a drivers/usb/chipidea/udc.c       Alexander Shishkin 2013-06-24  738  				struct ci_hw_req, queue);
2dbc5c4c831418 drivers/usb/chipidea/udc.c       Alexander Shishkin 2013-06-13  739  		prevlastnode = list_entry(hwreqprev->tds.prev,
cc9e6c495b0a37 drivers/usb/chipidea/udc.c       Michael Grzeschik  2013-06-13  740  				struct td_node, td);
cc9e6c495b0a37 drivers/usb/chipidea/udc.c       Michael Grzeschik  2013-06-13  741  
cc9e6c495b0a37 drivers/usb/chipidea/udc.c       Michael Grzeschik  2013-06-13  742  		prevlastnode->ptr->next = cpu_to_le32(next);
0e6ca1998e4c80 drivers/usb/gadget/ci13xxx_udc.c Pavankumar Kondeti 2011-02-18  743  		wmb();
05735f0854e1e2 drivers/usb/chipidea/udc.c       Piyush Mehta       2021-09-13  744  
05735f0854e1e2 drivers/usb/chipidea/udc.c       Piyush Mehta       2021-09-13  745  		if (ci->rev == CI_REVISION_22) {
05735f0854e1e2 drivers/usb/chipidea/udc.c       Piyush Mehta       2021-09-13  746  			if (!hw_read(ci, OP_ENDPTSTAT, BIT(n)))
05735f0854e1e2 drivers/usb/chipidea/udc.c       Piyush Mehta       2021-09-13  747  				reprime_dtd(ci, hwep, prevlastnode);
05735f0854e1e2 drivers/usb/chipidea/udc.c       Piyush Mehta       2021-09-13  748  		}
05735f0854e1e2 drivers/usb/chipidea/udc.c       Piyush Mehta       2021-09-13  749  
26c696c678c4ce drivers/usb/chipidea/udc.c       Richard Zhao       2012-07-07  750  		if (hw_read(ci, OP_ENDPTPRIME, BIT(n)))
0e6ca1998e4c80 drivers/usb/gadget/ci13xxx_udc.c Pavankumar Kondeti 2011-02-18  751  			goto done;
0e6ca1998e4c80 drivers/usb/gadget/ci13xxx_udc.c Pavankumar Kondeti 2011-02-18  752  		do {
26c696c678c4ce drivers/usb/chipidea/udc.c       Richard Zhao       2012-07-07  753  			hw_write(ci, OP_USBCMD, USBCMD_ATDTW, USBCMD_ATDTW);
26c696c678c4ce drivers/usb/chipidea/udc.c       Richard Zhao       2012-07-07  754  			tmp_stat = hw_read(ci, OP_ENDPTSTAT, BIT(n));
26c696c678c4ce drivers/usb/chipidea/udc.c       Richard Zhao       2012-07-07  755  		} while (!hw_read(ci, OP_USBCMD, USBCMD_ATDTW));
26c696c678c4ce drivers/usb/chipidea/udc.c       Richard Zhao       2012-07-07  756  		hw_write(ci, OP_USBCMD, USBCMD_ATDTW, 0);
0e6ca1998e4c80 drivers/usb/gadget/ci13xxx_udc.c Pavankumar Kondeti 2011-02-18  757  		if (tmp_stat)
0e6ca1998e4c80 drivers/usb/gadget/ci13xxx_udc.c Pavankumar Kondeti 2011-02-18  758  			goto done;
0e6ca1998e4c80 drivers/usb/gadget/ci13xxx_udc.c Pavankumar Kondeti 2011-02-18  759  	}
0e6ca1998e4c80 drivers/usb/gadget/ci13xxx_udc.c Pavankumar Kondeti 2011-02-18  760  
0e6ca1998e4c80 drivers/usb/gadget/ci13xxx_udc.c Pavankumar Kondeti 2011-02-18  761  	/*  QH configuration */
2dbc5c4c831418 drivers/usb/chipidea/udc.c       Alexander Shishkin 2013-06-13  762  	hwep->qh.ptr->td.next = cpu_to_le32(firstnode->dma);
2dbc5c4c831418 drivers/usb/chipidea/udc.c       Alexander Shishkin 2013-06-13  763  	hwep->qh.ptr->td.token &=
080ff5f4719e21 drivers/usb/chipidea/udc.c       Michael Grzeschik  2013-03-30  764  		cpu_to_le32(~(TD_STATUS_HALTED|TD_STATUS_ACTIVE));
aa69a8093ff985 drivers/usb/gadget/ci13xxx_udc.c David Lopo         2008-11-17  765  
2fc5a7dace3c43 drivers/usb/chipidea/udc.c       Peter Chen         2014-01-10  766  	if (hwep->type == USB_ENDPOINT_XFER_ISOC && hwep->dir == RX) {
2dbc5c4c831418 drivers/usb/chipidea/udc.c       Alexander Shishkin 2013-06-13  767  		u32 mul = hwreq->req.length / hwep->ep.maxpacket;
e4ce4ecd962e17 drivers/usb/chipidea/udc.c       Michael Grzeschik  2013-06-13  768  
2fc5a7dace3c43 drivers/usb/chipidea/udc.c       Peter Chen         2014-01-10  769  		if (hwreq->req.length == 0
2fc5a7dace3c43 drivers/usb/chipidea/udc.c       Peter Chen         2014-01-10  770  				|| hwreq->req.length % hwep->ep.maxpacket)
e4ce4ecd962e17 drivers/usb/chipidea/udc.c       Michael Grzeschik  2013-06-13  771  			mul++;
34445fb4333f47 drivers/usb/chipidea/udc.c       Stephen Boyd       2016-09-13  772  		hwep->qh.ptr->cap |= cpu_to_le32(mul << __ffs(QH_MULT));
e4ce4ecd962e17 drivers/usb/chipidea/udc.c       Michael Grzeschik  2013-06-13  773  	}
e4ce4ecd962e17 drivers/usb/chipidea/udc.c       Michael Grzeschik  2013-06-13  774  
2dbc5c4c831418 drivers/usb/chipidea/udc.c       Alexander Shishkin 2013-06-13  775  	ret = hw_ep_prime(ci, hwep->num, hwep->dir,
2dbc5c4c831418 drivers/usb/chipidea/udc.c       Alexander Shishkin 2013-06-13  776  			   hwep->type == USB_ENDPOINT_XFER_CONTROL);
0e6ca1998e4c80 drivers/usb/gadget/ci13xxx_udc.c Pavankumar Kondeti 2011-02-18  777  done:
0e6ca1998e4c80 drivers/usb/gadget/ci13xxx_udc.c Pavankumar Kondeti 2011-02-18  778  	return ret;
aa69a8093ff985 drivers/usb/gadget/ci13xxx_udc.c David Lopo         2008-11-17  779  }
aa69a8093ff985 drivers/usb/gadget/ci13xxx_udc.c David Lopo         2008-11-17  780  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
