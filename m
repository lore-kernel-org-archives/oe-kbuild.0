Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426FB3C5DA5
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Mar 2026 17:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774288470; cv=none; b=NAYpJxmpxsMCP5CbC44rKGs34OuS5rdvUpLBsFwM/KuAMEBOA4b5ljPoLsH87Y/iaushYGI/5NUq+0hLSJKq73mxwbvaYvp/kySrta9b1+hcWoFmvzdst64/WEulcckZipCu5U5hvfaMONyBx3qjuCAKJ2IDG8kPlmQAoPeQiGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774288470; c=relaxed/simple;
	bh=THmI2Lwm7SyTfeiMErF3MfknQcsesmL/L5t47rx+Cvs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QM9qYHNcV7U6tHY1b7MgJOXlUUJJdobzVxV3gwfGcoE22jSzRkKvzN8gmaKo7AYadFuj1VS6l96s8WA2ckxecOxuZ5EBqCA8oVzI02AtbIk/Lvv+A6G/u7rjlm4/dMdohYancZDeqkv9fUDMcm7piQGWA9bzBvrbiBQHQeGTclA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eBFdcFjt; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eBFdcFjt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774288468; x=1805824468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=THmI2Lwm7SyTfeiMErF3MfknQcsesmL/L5t47rx+Cvs=;
  b=eBFdcFjtRBO1es0iF3WJoYt42PtH42ubPUCQF9ROWZuMYoissMx1B8p9
   YL5XpnVta4wAfGROprtIZ5EAqATzW96khSlGMzJrQVmRET6Zb1ZlROB6V
   ekXtSHieLxO/Xkd5SZ3tKa9pHgXCYbVUjyJdnYar0rGjPkl2tnz+42LpX
   DWeuaUSB+L66WJm3juuzhUnUfvyJBe8yWhTdLFPpjWQPDuueXUT+yTyrl
   /riJQi5rP9fgG7OLzwYDP8UeWJUkGfawZKMc7iY8wmPAzXIXfKUKdG0xb
   KP2U+jY0+ttQsFAwMztI0B90OZ9bjjBPM3x06pn4l6aDYvTkYW1C7DVLV
   g==;
X-CSE-ConnectionGUID: VyIHp8ZLTzGevZoRwcIC/Q==
X-CSE-MsgGUID: 2hNgQwQSSeS3YsRpguqTqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="92868159"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="92868159"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 10:54:27 -0700
X-CSE-ConnectionGUID: BZbKJgONS+ubJewTINIzSQ==
X-CSE-MsgGUID: FgOmhNwURVGQ1j74BE+6eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="224069014"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Mar 2026 10:54:26 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4jTr-000000002wv-0XV2;
	Mon, 23 Mar 2026 17:54:23 +0000
Date: Tue, 24 Mar 2026 01:53:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Message-ID: <202603240138.ZNq5FcFq-lkp@intel.com>
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
In-Reply-To: <20260323122512.2019893-2-mathias.nyman@linux.intel.com>
References: <20260323122512.2019893-2-mathias.nyman@linux.intel.com>
TO: Mathias Nyman <mathias.nyman@linux.intel.com>

Hi Mathias,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus westeri-thunderbolt/next linus/master v7.0-rc5 next-20260320]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mathias-Nyman/xhci-prevent-automatic-endpoint-restart-after-stall-or-error/20260323-224110
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20260323122512.2019893-2-mathias.nyman%40linux.intel.com
patch subject: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after stall or error
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: x86_64-randconfig-161-20260323 (https://download.01.org/0day-ci/archive/20260324/202603240138.ZNq5FcFq-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603240138.ZNq5FcFq-lkp@intel.com/

smatch warnings:
drivers/usb/host/xhci-ring.c:1578 xhci_handle_cmd_set_deq() error: we previously assumed 'ep_ring' could be null (see line 1467)

vim +/ep_ring +1578 drivers/usb/host/xhci-ring.c

02324cb6fadb62 Mathias Nyman    2026-03-23  1440  
ae636747146ea9 Sarah Sharp      2009-04-29  1441  /*
ae636747146ea9 Sarah Sharp      2009-04-29  1442   * When we get a completion for a Set Transfer Ring Dequeue Pointer command,
ae636747146ea9 Sarah Sharp      2009-04-29  1443   * we need to clear the set deq pending flag in the endpoint ring state, so that
ae636747146ea9 Sarah Sharp      2009-04-29  1444   * the TD queueing code can ring the doorbell again.  We also need to ring the
ae636747146ea9 Sarah Sharp      2009-04-29  1445   * endpoint doorbell to restart the ring, but only if there aren't more
ae636747146ea9 Sarah Sharp      2009-04-29  1446   * cancellations pending.
ae636747146ea9 Sarah Sharp      2009-04-29  1447   */
b8200c9479b804 Xenia Ragiadakou 2013-09-09  1448  static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
c69a059783b241 Xenia Ragiadakou 2013-09-09  1449  		union xhci_trb *trb, u32 cmd_comp_code)
ae636747146ea9 Sarah Sharp      2009-04-29  1450  {
ae636747146ea9 Sarah Sharp      2009-04-29  1451  	unsigned int ep_index;
e9df17eb1408cf Sarah Sharp      2010-04-02  1452  	unsigned int stream_id;
ae636747146ea9 Sarah Sharp      2009-04-29  1453  	struct xhci_ring *ep_ring;
9aad95e292f58d Hans de Goede    2013-10-04  1454  	struct xhci_virt_ep *ep;
d115b04818e57b John Youn        2009-07-27  1455  	struct xhci_ep_ctx *ep_ctx;
d115b04818e57b John Youn        2009-07-27  1456  	struct xhci_slot_ctx *slot_ctx;
4aa2e16e052b43 Mathias Nyman    2024-11-06  1457  	struct xhci_stream_ctx *stream_ctx;
674f8438c12125 Mathias Nyman    2021-01-29  1458  	struct xhci_td *td, *tmp_td;
ae636747146ea9 Sarah Sharp      2009-04-29  1459  
28ccd2962c6655 Matt Evans       2011-03-29  1460  	ep_index = TRB_TO_EP_INDEX(le32_to_cpu(trb->generic.field[3]));
28ccd2962c6655 Matt Evans       2011-03-29  1461  	stream_id = TRB_TO_STREAM_ID(le32_to_cpu(trb->generic.field[2]));
b1adc42d440df3 Mathias Nyman    2021-01-29  1462  	ep = xhci_get_virt_ep(xhci, slot_id, ep_index);
b1adc42d440df3 Mathias Nyman    2021-01-29  1463  	if (!ep)
b1adc42d440df3 Mathias Nyman    2021-01-29  1464  		return;
e9df17eb1408cf Sarah Sharp      2010-04-02  1465  
42f2890aa998d1 Mathias Nyman    2021-01-29  1466  	ep_ring = xhci_virt_ep_to_ring(xhci, ep, stream_id);
e9df17eb1408cf Sarah Sharp      2010-04-02 @1467  	if (!ep_ring) {
e587b8b270d370 Oliver Neukum    2014-01-08  1468  		xhci_warn(xhci, "WARN Set TR deq ptr command for freed stream ID %u\n",
e9df17eb1408cf Sarah Sharp      2010-04-02  1469  				stream_id);
e9df17eb1408cf Sarah Sharp      2010-04-02  1470  		/* XXX: Harmless??? */
0d4976ec8ec17f Hans de Goede    2014-08-20  1471  		goto cleanup;
e9df17eb1408cf Sarah Sharp      2010-04-02  1472  	}
e9df17eb1408cf Sarah Sharp      2010-04-02  1473  
b1adc42d440df3 Mathias Nyman    2021-01-29  1474  	ep_ctx = xhci_get_ep_ctx(xhci, ep->vdev->out_ctx, ep_index);
b1adc42d440df3 Mathias Nyman    2021-01-29  1475  	slot_ctx = xhci_get_slot_ctx(xhci, ep->vdev->out_ctx);
19a7d0d65c4a81 Felipe Balbi     2017-04-07  1476  	trace_xhci_handle_cmd_set_deq(slot_ctx);
19a7d0d65c4a81 Felipe Balbi     2017-04-07  1477  	trace_xhci_handle_cmd_set_deq_ep(ep_ctx);
ae636747146ea9 Sarah Sharp      2009-04-29  1478  
4aa2e16e052b43 Mathias Nyman    2024-11-06  1479  	if (ep->ep_state & EP_HAS_STREAMS) {
4aa2e16e052b43 Mathias Nyman    2024-11-06  1480  		stream_ctx = &ep->stream_info->stream_ctx_array[stream_id];
4aa2e16e052b43 Mathias Nyman    2024-11-06  1481  		trace_xhci_handle_cmd_set_deq_stream(ep->stream_info, stream_id);
4aa2e16e052b43 Mathias Nyman    2024-11-06  1482  	}
4aa2e16e052b43 Mathias Nyman    2024-11-06  1483  
c69a059783b241 Xenia Ragiadakou 2013-09-09  1484  	if (cmd_comp_code != COMP_SUCCESS) {
ae636747146ea9 Sarah Sharp      2009-04-29  1485  		unsigned int ep_state;
ae636747146ea9 Sarah Sharp      2009-04-29  1486  		unsigned int slot_state;
ae636747146ea9 Sarah Sharp      2009-04-29  1487  
c69a059783b241 Xenia Ragiadakou 2013-09-09  1488  		switch (cmd_comp_code) {
0b7c105a04ca79 Felipe Balbi     2017-01-23  1489  		case COMP_TRB_ERROR:
e587b8b270d370 Oliver Neukum    2014-01-08  1490  			xhci_warn(xhci, "WARN Set TR Deq Ptr cmd invalid because of stream ID configuration\n");
ae636747146ea9 Sarah Sharp      2009-04-29  1491  			break;
0b7c105a04ca79 Felipe Balbi     2017-01-23  1492  		case COMP_CONTEXT_STATE_ERROR:
e587b8b270d370 Oliver Neukum    2014-01-08  1493  			xhci_warn(xhci, "WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.\n");
5071e6b279178f Mathias Nyman    2016-11-11  1494  			ep_state = GET_EP_CTX_STATE(ep_ctx);
28ccd2962c6655 Matt Evans       2011-03-29  1495  			slot_state = le32_to_cpu(slot_ctx->dev_state);
ae636747146ea9 Sarah Sharp      2009-04-29  1496  			slot_state = GET_SLOT_STATE(slot_state);
aa50b29061d3df Xenia Ragiadakou 2013-08-14  1497  			xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
aa50b29061d3df Xenia Ragiadakou 2013-08-14  1498  					"Slot state = %u, EP state = %u",
ae636747146ea9 Sarah Sharp      2009-04-29  1499  					slot_state, ep_state);
ae636747146ea9 Sarah Sharp      2009-04-29  1500  			break;
0b7c105a04ca79 Felipe Balbi     2017-01-23  1501  		case COMP_SLOT_NOT_ENABLED_ERROR:
e587b8b270d370 Oliver Neukum    2014-01-08  1502  			xhci_warn(xhci, "WARN Set TR Deq Ptr cmd failed because slot %u was not enabled.\n",
e587b8b270d370 Oliver Neukum    2014-01-08  1503  					slot_id);
ae636747146ea9 Sarah Sharp      2009-04-29  1504  			break;
ae636747146ea9 Sarah Sharp      2009-04-29  1505  		default:
e587b8b270d370 Oliver Neukum    2014-01-08  1506  			xhci_warn(xhci, "WARN Set TR Deq Ptr cmd with unknown completion code of %u.\n",
c69a059783b241 Xenia Ragiadakou 2013-09-09  1507  					cmd_comp_code);
ae636747146ea9 Sarah Sharp      2009-04-29  1508  			break;
ae636747146ea9 Sarah Sharp      2009-04-29  1509  		}
ae636747146ea9 Sarah Sharp      2009-04-29  1510  		/* OK what do we do now?  The endpoint state is hosed, and we
ae636747146ea9 Sarah Sharp      2009-04-29  1511  		 * should never get to this point if the synchronization between
ae636747146ea9 Sarah Sharp      2009-04-29  1512  		 * queueing, and endpoint state are correct.  This might happen
ae636747146ea9 Sarah Sharp      2009-04-29  1513  		 * if the device gets disconnected after we've finished
ae636747146ea9 Sarah Sharp      2009-04-29  1514  		 * cancelling URBs, which might not be an error...
ae636747146ea9 Sarah Sharp      2009-04-29  1515  		 */
ae636747146ea9 Sarah Sharp      2009-04-29  1516  	} else {
9aad95e292f58d Hans de Goede    2013-10-04  1517  		u64 deq;
9aad95e292f58d Hans de Goede    2013-10-04  1518  		/* 4.6.10 deq ptr is written to the stream ctx for streams */
9aad95e292f58d Hans de Goede    2013-10-04  1519  		if (ep->ep_state & EP_HAS_STREAMS) {
931e468764b22a Niklas Neronin   2025-09-18  1520  			deq = le64_to_cpu(stream_ctx->stream_ring) & TR_DEQ_PTR_MASK;
e5fa8db0be3e87 Pawel Laszczak   2024-09-05  1521  
e5fa8db0be3e87 Pawel Laszczak   2024-09-05  1522  			/*
e5fa8db0be3e87 Pawel Laszczak   2024-09-05  1523  			 * Cadence xHCI controllers store some endpoint state
e5fa8db0be3e87 Pawel Laszczak   2024-09-05  1524  			 * information within Rsvd0 fields of Stream Endpoint
e5fa8db0be3e87 Pawel Laszczak   2024-09-05  1525  			 * context. This field is not cleared during Set TR
e5fa8db0be3e87 Pawel Laszczak   2024-09-05  1526  			 * Dequeue Pointer command which causes XDMA to skip
e5fa8db0be3e87 Pawel Laszczak   2024-09-05  1527  			 * over transfer ring and leads to data loss on stream
e5fa8db0be3e87 Pawel Laszczak   2024-09-05  1528  			 * pipe.
e5fa8db0be3e87 Pawel Laszczak   2024-09-05  1529  			 * To fix this issue driver must clear Rsvd0 field.
e5fa8db0be3e87 Pawel Laszczak   2024-09-05  1530  			 */
e5fa8db0be3e87 Pawel Laszczak   2024-09-05  1531  			if (xhci->quirks & XHCI_CDNS_SCTX_QUIRK) {
4aa2e16e052b43 Mathias Nyman    2024-11-06  1532  				stream_ctx->reserved[0] = 0;
4aa2e16e052b43 Mathias Nyman    2024-11-06  1533  				stream_ctx->reserved[1] = 0;
e5fa8db0be3e87 Pawel Laszczak   2024-09-05  1534  			}
9aad95e292f58d Hans de Goede    2013-10-04  1535  		} else {
931e468764b22a Niklas Neronin   2025-09-18  1536  			deq = le64_to_cpu(ep_ctx->deq) & TR_DEQ_PTR_MASK;
9aad95e292f58d Hans de Goede    2013-10-04  1537  		}
aa50b29061d3df Xenia Ragiadakou 2013-08-14  1538  		xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
9aad95e292f58d Hans de Goede    2013-10-04  1539  			"Successful Set TR Deq Ptr cmd, deq = @%08llx", deq);
9aad95e292f58d Hans de Goede    2013-10-04  1540  		if (xhci_trb_virt_to_dma(ep->queued_deq_seg,
9aad95e292f58d Hans de Goede    2013-10-04  1541  					 ep->queued_deq_ptr) == deq) {
bf161e85fb153c Sarah Sharp      2011-02-23  1542  			/* Update the ring's dequeue segment and dequeue pointer
bf161e85fb153c Sarah Sharp      2011-02-23  1543  			 * to reflect the new position.
bf161e85fb153c Sarah Sharp      2011-02-23  1544  			 */
856563be98b2e9 Niklas Neronin   2025-03-06  1545  			ep_ring->deq_seg = ep->queued_deq_seg;
856563be98b2e9 Niklas Neronin   2025-03-06  1546  			ep_ring->dequeue = ep->queued_deq_ptr;
bf161e85fb153c Sarah Sharp      2011-02-23  1547  		} else {
e587b8b270d370 Oliver Neukum    2014-01-08  1548  			xhci_warn(xhci, "Mismatch between completed Set TR Deq Ptr command & xHCI internal state.\n");
bf161e85fb153c Sarah Sharp      2011-02-23  1549  			xhci_warn(xhci, "ep deq seg = %p, deq ptr = %p\n",
9aad95e292f58d Hans de Goede    2013-10-04  1550  				  ep->queued_deq_seg, ep->queued_deq_ptr);
bf161e85fb153c Sarah Sharp      2011-02-23  1551  		}
ae636747146ea9 Sarah Sharp      2009-04-29  1552  	}
674f8438c12125 Mathias Nyman    2021-01-29  1553  	/* HW cached TDs cleared from cache, give them back */
674f8438c12125 Mathias Nyman    2021-01-29  1554  	list_for_each_entry_safe(td, tmp_td, &ep->cancelled_td_list,
674f8438c12125 Mathias Nyman    2021-01-29  1555  				 cancelled_td_list) {
674f8438c12125 Mathias Nyman    2021-01-29  1556  		ep_ring = xhci_urb_to_transfer_ring(ep->xhci, td->urb);
674f8438c12125 Mathias Nyman    2021-01-29  1557  		if (td->cancel_status == TD_CLEARING_CACHE) {
674f8438c12125 Mathias Nyman    2021-01-29  1558  			td->cancel_status = TD_CLEARED;
0d9b9f533bf1aa Mathias Nyman    2021-08-20  1559  			xhci_dbg(ep->xhci, "%s: Giveback cancelled URB %p TD\n",
0d9b9f533bf1aa Mathias Nyman    2021-08-20  1560  				 __func__, td->urb);
674f8438c12125 Mathias Nyman    2021-01-29  1561  			xhci_td_cleanup(ep->xhci, td, ep_ring, td->status);
0d9b9f533bf1aa Mathias Nyman    2021-08-20  1562  		} else {
0d9b9f533bf1aa Mathias Nyman    2021-08-20  1563  			xhci_dbg(ep->xhci, "%s: Keep cancelled URB %p TD as cancel_status is %d\n",
0d9b9f533bf1aa Mathias Nyman    2021-08-20  1564  				 __func__, td->urb, td->cancel_status);
674f8438c12125 Mathias Nyman    2021-01-29  1565  		}
674f8438c12125 Mathias Nyman    2021-01-29  1566  	}
0d4976ec8ec17f Hans de Goede    2014-08-20  1567  cleanup:
b1adc42d440df3 Mathias Nyman    2021-01-29  1568  	ep->ep_state &= ~SET_DEQ_PENDING;
b1adc42d440df3 Mathias Nyman    2021-01-29  1569  	ep->queued_deq_seg = NULL;
b1adc42d440df3 Mathias Nyman    2021-01-29  1570  	ep->queued_deq_ptr = NULL;
5ceac4402f5d97 Hector Martin    2024-06-11  1571  
484c3bab2d5dfa Michal Pecio     2024-11-06  1572  	/* Check for deferred or newly cancelled TDs */
484c3bab2d5dfa Michal Pecio     2024-11-06  1573  	if (!list_empty(&ep->cancelled_td_list)) {
5ceac4402f5d97 Hector Martin    2024-06-11  1574  		xhci_dbg(ep->xhci, "%s: Pending TDs to clear, continuing with invalidation\n",
5ceac4402f5d97 Hector Martin    2024-06-11  1575  			 __func__);
5ceac4402f5d97 Hector Martin    2024-06-11  1576  		xhci_invalidate_cancelled_tds(ep);
484c3bab2d5dfa Michal Pecio     2024-11-06  1577  		/* Try to restart the endpoint if all is done */
02324cb6fadb62 Mathias Nyman    2026-03-23 @1578  		if (!next_td_is_tainted(ep_ring))
484c3bab2d5dfa Michal Pecio     2024-11-06  1579  			ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
484c3bab2d5dfa Michal Pecio     2024-11-06  1580  		/* Start giving back any TDs invalidated above */
484c3bab2d5dfa Michal Pecio     2024-11-06  1581  		xhci_giveback_invalidated_tds(ep);
5ceac4402f5d97 Hector Martin    2024-06-11  1582  	} else {
e9df17eb1408cf Sarah Sharp      2010-04-02  1583  		/* Restart any rings with pending URBs */
02324cb6fadb62 Mathias Nyman    2026-03-23  1584  		xhci_dbg(ep->xhci, "%s: All cancelled TDs cleared\n", __func__);
02324cb6fadb62 Mathias Nyman    2026-03-23  1585  		if (!next_td_is_tainted(ep_ring))
e9df17eb1408cf Sarah Sharp      2010-04-02  1586  			ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
ae636747146ea9 Sarah Sharp      2009-04-29  1587  	}
5ceac4402f5d97 Hector Martin    2024-06-11  1588  }
ae636747146ea9 Sarah Sharp      2009-04-29  1589  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
