Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD35818A6D8
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Sep 2024 14:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727274330; cv=none; b=D5tUuXNZH2iHN85IntD5DN48eUcT8KnI38PU9uIfbvm6mU3uoRbXpu2M7zhLxvK9txyT/bb5Uvs6EHz9oSqg+vEGvpqZlKslFU4XvqpnjbhpFbJXNG8VSAFIQJEhLx4bIR3o5L/vj0Easjk9/UPE1tC/3AHKYYsuWvJ94Co9VWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727274330; c=relaxed/simple;
	bh=IXbDjkO+xE1GmUWEWQvAK9ysw2aHI5l7Wwc4NxRThyw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WzC6kWJGg1pmDXs7jnUR0RJ4MsX2OYOc9R0znwmsc/cvHu/VLd2PmbFPdITj611YeWIHfTGsWJEZe51blWfs4BpzQFPpsxk2bEb3OYJkzdJoq5EOPsmDbFsG5uaD5t0Pr/sxIa5J0eckLdZNrTpO9olVNQ9LWvsFEpKFH/R0Vsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YEf4WbNg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YEf4WbNg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727274328; x=1758810328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IXbDjkO+xE1GmUWEWQvAK9ysw2aHI5l7Wwc4NxRThyw=;
  b=YEf4WbNgisVwtcQPI7Xm6PsA0q6Lbq2unZW7RDjSQPEJo3RAqmczGHu5
   hKI5hjSXnH2P+ZXL8zXjI4f4R6FF+PH3w5ry/R3BY/UnLJOn4XdyNmvPV
   UFbO2kHBdjIUDoLGyEQTWyVgGGSz1nEGvj8ZGSXyKMpKu7DBGt7HYPJtf
   nydH3P96G1rsUlbFNeBiBWtvb2Vq87g3QxObmn8RNK7qzlWm2SW1Plih1
   IjVDWQgy06e3tvObe1YzjVwPtIvGse4eEBIe97ROR7WfEOWRWRQu5+6Bi
   3nHT+l7k1jrREpOJXV5M5uHkXg7sUV29/DwQmz6Nmxl0Z2Ec0MIbRo8Lw
   Q==;
X-CSE-ConnectionGUID: DXmyTUHaTombSsfW+VLZ4A==
X-CSE-MsgGUID: X9ewYaz0RRuc8nW9QZo+sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="30036726"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="30036726"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 07:25:22 -0700
X-CSE-ConnectionGUID: i/FqhybGT9CfiEKSn0+SIA==
X-CSE-MsgGUID: k31U6vHISUKx4nE07Lf8dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="95119423"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Sep 2024 07:25:20 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stSxC-000Jaz-0a;
	Wed, 25 Sep 2024 14:25:18 +0000
Date: Wed, 25 Sep 2024 22:24:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [mnyman-xhci:for-usb-next 9/10] drivers/usb/host/xhci-ring.c:1405
 xhci_handle_cmd_set_deq() error: uninitialized symbol 'stream_ctx'.
Message-ID: <202409252250.WNZonX5o-lkp@intel.com>
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
TO: Mathias Nyman <mathias.nyman@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git for-usb-next
head:   645eb2ce6b3e541d3c651f136da8a16f76799526
commit: fdd9a29e9139a8988b65dce295dfc3f089003ae0 [9/10] xhci: trace stream context at Set TR Deq command completion
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc64-randconfig-r072-20240925 (https://download.01.org/0day-ci/archive/20240925/202409252250.WNZonX5o-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409252250.WNZonX5o-lkp@intel.com/

smatch warnings:
drivers/usb/host/xhci-ring.c:1405 xhci_handle_cmd_set_deq() error: uninitialized symbol 'stream_ctx'.

vim +/stream_ctx +1405 drivers/usb/host/xhci-ring.c

b008df60c6369b Andiry Xu        2012-03-05  1324  
ae636747146ea9 Sarah Sharp      2009-04-29  1325  /*
ae636747146ea9 Sarah Sharp      2009-04-29  1326   * When we get a completion for a Set Transfer Ring Dequeue Pointer command,
ae636747146ea9 Sarah Sharp      2009-04-29  1327   * we need to clear the set deq pending flag in the endpoint ring state, so that
ae636747146ea9 Sarah Sharp      2009-04-29  1328   * the TD queueing code can ring the doorbell again.  We also need to ring the
ae636747146ea9 Sarah Sharp      2009-04-29  1329   * endpoint doorbell to restart the ring, but only if there aren't more
ae636747146ea9 Sarah Sharp      2009-04-29  1330   * cancellations pending.
ae636747146ea9 Sarah Sharp      2009-04-29  1331   */
b8200c9479b804 Xenia Ragiadakou 2013-09-09  1332  static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
c69a059783b241 Xenia Ragiadakou 2013-09-09  1333  		union xhci_trb *trb, u32 cmd_comp_code)
ae636747146ea9 Sarah Sharp      2009-04-29  1334  {
ae636747146ea9 Sarah Sharp      2009-04-29  1335  	unsigned int ep_index;
e9df17eb1408cf Sarah Sharp      2010-04-02  1336  	unsigned int stream_id;
ae636747146ea9 Sarah Sharp      2009-04-29  1337  	struct xhci_ring *ep_ring;
9aad95e292f58d Hans de Goede    2013-10-04  1338  	struct xhci_virt_ep *ep;
d115b04818e57b John Youn        2009-07-27  1339  	struct xhci_ep_ctx *ep_ctx;
d115b04818e57b John Youn        2009-07-27  1340  	struct xhci_slot_ctx *slot_ctx;
fdd9a29e9139a8 Mathias Nyman    2024-09-12  1341  	struct xhci_stream_ctx *stream_ctx;
674f8438c12125 Mathias Nyman    2021-01-29  1342  	struct xhci_td *td, *tmp_td;
5ceac4402f5d97 Hector Martin    2024-06-11  1343  	bool deferred = false;
ae636747146ea9 Sarah Sharp      2009-04-29  1344  
28ccd2962c6655 Matt Evans       2011-03-29  1345  	ep_index = TRB_TO_EP_INDEX(le32_to_cpu(trb->generic.field[3]));
28ccd2962c6655 Matt Evans       2011-03-29  1346  	stream_id = TRB_TO_STREAM_ID(le32_to_cpu(trb->generic.field[2]));
b1adc42d440df3 Mathias Nyman    2021-01-29  1347  	ep = xhci_get_virt_ep(xhci, slot_id, ep_index);
b1adc42d440df3 Mathias Nyman    2021-01-29  1348  	if (!ep)
b1adc42d440df3 Mathias Nyman    2021-01-29  1349  		return;
e9df17eb1408cf Sarah Sharp      2010-04-02  1350  
42f2890aa998d1 Mathias Nyman    2021-01-29  1351  	ep_ring = xhci_virt_ep_to_ring(xhci, ep, stream_id);
e9df17eb1408cf Sarah Sharp      2010-04-02  1352  	if (!ep_ring) {
e587b8b270d370 Oliver Neukum    2014-01-08  1353  		xhci_warn(xhci, "WARN Set TR deq ptr command for freed stream ID %u\n",
e9df17eb1408cf Sarah Sharp      2010-04-02  1354  				stream_id);
e9df17eb1408cf Sarah Sharp      2010-04-02  1355  		/* XXX: Harmless??? */
0d4976ec8ec17f Hans de Goede    2014-08-20  1356  		goto cleanup;
e9df17eb1408cf Sarah Sharp      2010-04-02  1357  	}
e9df17eb1408cf Sarah Sharp      2010-04-02  1358  
b1adc42d440df3 Mathias Nyman    2021-01-29  1359  	ep_ctx = xhci_get_ep_ctx(xhci, ep->vdev->out_ctx, ep_index);
b1adc42d440df3 Mathias Nyman    2021-01-29  1360  	slot_ctx = xhci_get_slot_ctx(xhci, ep->vdev->out_ctx);
19a7d0d65c4a81 Felipe Balbi     2017-04-07  1361  	trace_xhci_handle_cmd_set_deq(slot_ctx);
19a7d0d65c4a81 Felipe Balbi     2017-04-07  1362  	trace_xhci_handle_cmd_set_deq_ep(ep_ctx);
ae636747146ea9 Sarah Sharp      2009-04-29  1363  
fdd9a29e9139a8 Mathias Nyman    2024-09-12  1364  	if (ep->ep_state & EP_HAS_STREAMS && ep->stream_info) {
fdd9a29e9139a8 Mathias Nyman    2024-09-12  1365  		stream_ctx = &ep->stream_info->stream_ctx_array[stream_id];
fdd9a29e9139a8 Mathias Nyman    2024-09-12  1366  		trace_xhci_handle_cmd_set_deq_stream(ep->stream_info, stream_id);
fdd9a29e9139a8 Mathias Nyman    2024-09-12  1367  	}
fdd9a29e9139a8 Mathias Nyman    2024-09-12  1368  
c69a059783b241 Xenia Ragiadakou 2013-09-09  1369  	if (cmd_comp_code != COMP_SUCCESS) {
ae636747146ea9 Sarah Sharp      2009-04-29  1370  		unsigned int ep_state;
ae636747146ea9 Sarah Sharp      2009-04-29  1371  		unsigned int slot_state;
ae636747146ea9 Sarah Sharp      2009-04-29  1372  
c69a059783b241 Xenia Ragiadakou 2013-09-09  1373  		switch (cmd_comp_code) {
0b7c105a04ca79 Felipe Balbi     2017-01-23  1374  		case COMP_TRB_ERROR:
e587b8b270d370 Oliver Neukum    2014-01-08  1375  			xhci_warn(xhci, "WARN Set TR Deq Ptr cmd invalid because of stream ID configuration\n");
ae636747146ea9 Sarah Sharp      2009-04-29  1376  			break;
0b7c105a04ca79 Felipe Balbi     2017-01-23  1377  		case COMP_CONTEXT_STATE_ERROR:
e587b8b270d370 Oliver Neukum    2014-01-08  1378  			xhci_warn(xhci, "WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.\n");
5071e6b279178f Mathias Nyman    2016-11-11  1379  			ep_state = GET_EP_CTX_STATE(ep_ctx);
28ccd2962c6655 Matt Evans       2011-03-29  1380  			slot_state = le32_to_cpu(slot_ctx->dev_state);
ae636747146ea9 Sarah Sharp      2009-04-29  1381  			slot_state = GET_SLOT_STATE(slot_state);
aa50b29061d3df Xenia Ragiadakou 2013-08-14  1382  			xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
aa50b29061d3df Xenia Ragiadakou 2013-08-14  1383  					"Slot state = %u, EP state = %u",
ae636747146ea9 Sarah Sharp      2009-04-29  1384  					slot_state, ep_state);
ae636747146ea9 Sarah Sharp      2009-04-29  1385  			break;
0b7c105a04ca79 Felipe Balbi     2017-01-23  1386  		case COMP_SLOT_NOT_ENABLED_ERROR:
e587b8b270d370 Oliver Neukum    2014-01-08  1387  			xhci_warn(xhci, "WARN Set TR Deq Ptr cmd failed because slot %u was not enabled.\n",
e587b8b270d370 Oliver Neukum    2014-01-08  1388  					slot_id);
ae636747146ea9 Sarah Sharp      2009-04-29  1389  			break;
ae636747146ea9 Sarah Sharp      2009-04-29  1390  		default:
e587b8b270d370 Oliver Neukum    2014-01-08  1391  			xhci_warn(xhci, "WARN Set TR Deq Ptr cmd with unknown completion code of %u.\n",
c69a059783b241 Xenia Ragiadakou 2013-09-09  1392  					cmd_comp_code);
ae636747146ea9 Sarah Sharp      2009-04-29  1393  			break;
ae636747146ea9 Sarah Sharp      2009-04-29  1394  		}
ae636747146ea9 Sarah Sharp      2009-04-29  1395  		/* OK what do we do now?  The endpoint state is hosed, and we
ae636747146ea9 Sarah Sharp      2009-04-29  1396  		 * should never get to this point if the synchronization between
ae636747146ea9 Sarah Sharp      2009-04-29  1397  		 * queueing, and endpoint state are correct.  This might happen
ae636747146ea9 Sarah Sharp      2009-04-29  1398  		 * if the device gets disconnected after we've finished
ae636747146ea9 Sarah Sharp      2009-04-29  1399  		 * cancelling URBs, which might not be an error...
ae636747146ea9 Sarah Sharp      2009-04-29  1400  		 */
ae636747146ea9 Sarah Sharp      2009-04-29  1401  	} else {
9aad95e292f58d Hans de Goede    2013-10-04  1402  		u64 deq;
9aad95e292f58d Hans de Goede    2013-10-04  1403  		/* 4.6.10 deq ptr is written to the stream ctx for streams */
9aad95e292f58d Hans de Goede    2013-10-04  1404  		if (ep->ep_state & EP_HAS_STREAMS) {
fdd9a29e9139a8 Mathias Nyman    2024-09-12 @1405  			deq = le64_to_cpu(stream_ctx->stream_ring) & SCTX_DEQ_MASK;
e5fa8db0be3e87 Pawel Laszczak   2024-09-05  1406  
e5fa8db0be3e87 Pawel Laszczak   2024-09-05  1407  			/*
e5fa8db0be3e87 Pawel Laszczak   2024-09-05  1408  			 * Cadence xHCI controllers store some endpoint state
e5fa8db0be3e87 Pawel Laszczak   2024-09-05  1409  			 * information within Rsvd0 fields of Stream Endpoint
e5fa8db0be3e87 Pawel Laszczak   2024-09-05  1410  			 * context. This field is not cleared during Set TR
e5fa8db0be3e87 Pawel Laszczak   2024-09-05  1411  			 * Dequeue Pointer command which causes XDMA to skip
e5fa8db0be3e87 Pawel Laszczak   2024-09-05  1412  			 * over transfer ring and leads to data loss on stream
e5fa8db0be3e87 Pawel Laszczak   2024-09-05  1413  			 * pipe.
e5fa8db0be3e87 Pawel Laszczak   2024-09-05  1414  			 * To fix this issue driver must clear Rsvd0 field.
e5fa8db0be3e87 Pawel Laszczak   2024-09-05  1415  			 */
e5fa8db0be3e87 Pawel Laszczak   2024-09-05  1416  			if (xhci->quirks & XHCI_CDNS_SCTX_QUIRK) {
fdd9a29e9139a8 Mathias Nyman    2024-09-12  1417  				stream_ctx->reserved[0] = 0;
fdd9a29e9139a8 Mathias Nyman    2024-09-12  1418  				stream_ctx->reserved[1] = 0;
e5fa8db0be3e87 Pawel Laszczak   2024-09-05  1419  			}
9aad95e292f58d Hans de Goede    2013-10-04  1420  		} else {
9aad95e292f58d Hans de Goede    2013-10-04  1421  			deq = le64_to_cpu(ep_ctx->deq) & ~EP_CTX_CYCLE_MASK;
9aad95e292f58d Hans de Goede    2013-10-04  1422  		}
aa50b29061d3df Xenia Ragiadakou 2013-08-14  1423  		xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
9aad95e292f58d Hans de Goede    2013-10-04  1424  			"Successful Set TR Deq Ptr cmd, deq = @%08llx", deq);
9aad95e292f58d Hans de Goede    2013-10-04  1425  		if (xhci_trb_virt_to_dma(ep->queued_deq_seg,
9aad95e292f58d Hans de Goede    2013-10-04  1426  					 ep->queued_deq_ptr) == deq) {
bf161e85fb153c Sarah Sharp      2011-02-23  1427  			/* Update the ring's dequeue segment and dequeue pointer
bf161e85fb153c Sarah Sharp      2011-02-23  1428  			 * to reflect the new position.
bf161e85fb153c Sarah Sharp      2011-02-23  1429  			 */
b1adc42d440df3 Mathias Nyman    2021-01-29  1430  			update_ring_for_set_deq_completion(xhci, ep->vdev,
b008df60c6369b Andiry Xu        2012-03-05  1431  				ep_ring, ep_index);
bf161e85fb153c Sarah Sharp      2011-02-23  1432  		} else {
e587b8b270d370 Oliver Neukum    2014-01-08  1433  			xhci_warn(xhci, "Mismatch between completed Set TR Deq Ptr command & xHCI internal state.\n");
bf161e85fb153c Sarah Sharp      2011-02-23  1434  			xhci_warn(xhci, "ep deq seg = %p, deq ptr = %p\n",
9aad95e292f58d Hans de Goede    2013-10-04  1435  				  ep->queued_deq_seg, ep->queued_deq_ptr);
bf161e85fb153c Sarah Sharp      2011-02-23  1436  		}
ae636747146ea9 Sarah Sharp      2009-04-29  1437  	}
674f8438c12125 Mathias Nyman    2021-01-29  1438  	/* HW cached TDs cleared from cache, give them back */
674f8438c12125 Mathias Nyman    2021-01-29  1439  	list_for_each_entry_safe(td, tmp_td, &ep->cancelled_td_list,
674f8438c12125 Mathias Nyman    2021-01-29  1440  				 cancelled_td_list) {
674f8438c12125 Mathias Nyman    2021-01-29  1441  		ep_ring = xhci_urb_to_transfer_ring(ep->xhci, td->urb);
674f8438c12125 Mathias Nyman    2021-01-29  1442  		if (td->cancel_status == TD_CLEARING_CACHE) {
674f8438c12125 Mathias Nyman    2021-01-29  1443  			td->cancel_status = TD_CLEARED;
0d9b9f533bf1aa Mathias Nyman    2021-08-20  1444  			xhci_dbg(ep->xhci, "%s: Giveback cancelled URB %p TD\n",
0d9b9f533bf1aa Mathias Nyman    2021-08-20  1445  				 __func__, td->urb);
674f8438c12125 Mathias Nyman    2021-01-29  1446  			xhci_td_cleanup(ep->xhci, td, ep_ring, td->status);
5ceac4402f5d97 Hector Martin    2024-06-11  1447  		} else if (td->cancel_status == TD_CLEARING_CACHE_DEFERRED) {
5ceac4402f5d97 Hector Martin    2024-06-11  1448  			deferred = true;
0d9b9f533bf1aa Mathias Nyman    2021-08-20  1449  		} else {
0d9b9f533bf1aa Mathias Nyman    2021-08-20  1450  			xhci_dbg(ep->xhci, "%s: Keep cancelled URB %p TD as cancel_status is %d\n",
0d9b9f533bf1aa Mathias Nyman    2021-08-20  1451  				 __func__, td->urb, td->cancel_status);
674f8438c12125 Mathias Nyman    2021-01-29  1452  		}
674f8438c12125 Mathias Nyman    2021-01-29  1453  	}
0d4976ec8ec17f Hans de Goede    2014-08-20  1454  cleanup:
b1adc42d440df3 Mathias Nyman    2021-01-29  1455  	ep->ep_state &= ~SET_DEQ_PENDING;
b1adc42d440df3 Mathias Nyman    2021-01-29  1456  	ep->queued_deq_seg = NULL;
b1adc42d440df3 Mathias Nyman    2021-01-29  1457  	ep->queued_deq_ptr = NULL;
5ceac4402f5d97 Hector Martin    2024-06-11  1458  
5ceac4402f5d97 Hector Martin    2024-06-11  1459  	if (deferred) {
5ceac4402f5d97 Hector Martin    2024-06-11  1460  		/* We have more streams to clear */
5ceac4402f5d97 Hector Martin    2024-06-11  1461  		xhci_dbg(ep->xhci, "%s: Pending TDs to clear, continuing with invalidation\n",
5ceac4402f5d97 Hector Martin    2024-06-11  1462  			 __func__);
5ceac4402f5d97 Hector Martin    2024-06-11  1463  		xhci_invalidate_cancelled_tds(ep);
5ceac4402f5d97 Hector Martin    2024-06-11  1464  	} else {
e9df17eb1408cf Sarah Sharp      2010-04-02  1465  		/* Restart any rings with pending URBs */
5ceac4402f5d97 Hector Martin    2024-06-11  1466  		xhci_dbg(ep->xhci, "%s: All TDs cleared, ring doorbell\n", __func__);
e9df17eb1408cf Sarah Sharp      2010-04-02  1467  		ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
ae636747146ea9 Sarah Sharp      2009-04-29  1468  	}
5ceac4402f5d97 Hector Martin    2024-06-11  1469  }
ae636747146ea9 Sarah Sharp      2009-04-29  1470  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
