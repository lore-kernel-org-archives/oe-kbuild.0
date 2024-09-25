Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BF1481B1
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Sep 2024 14:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727274719; cv=none; b=PA7fkoZqwKMyfoGwg/3CuEd895SYDSGaAAycxOQ4OopZFj4fWXVmbL8yhSEszyvll4ZpqqWFZL/ZNZAGZXt6g9lcTvQr6yRfAWjfVm8fGnO7fpF3+IlyyzwbfQA1OOwX6UjqBuWL8tkrMVUgdjCnOT8K4DUEBMDviUdZTqqR/DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727274719; c=relaxed/simple;
	bh=xpkSCyVuAVhnqduAgNZiU/LxcQhcRNALC0AnIPb1kRw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gQTFFTpmjPRnzTZLosiAMgg3m43KthMs2CTbyTnnPvWQejKfR1ZfcdQvaxsQ53CvD8Rih1auDUcdB4PmsrsYnxwl4Bk3YhXWJURI08Dvnc4jv5IH3RwouhUcQ9z8wY+JeuHxmU/AxyllZGOK6AcvupScCTH2zLI8gZWRY2HrT/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tVAJktHx; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tVAJktHx"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42e748f78d6so56955445e9.0
        for <oe-kbuild@lists.linux.dev>; Wed, 25 Sep 2024 07:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727274715; x=1727879515; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bM9SP2rvTqGu03Vlo5S8QNU/05QjrmaE2YALOkKknj4=;
        b=tVAJktHx9eBqXAeNNH4nTb81E6xTysfZOzuAw2AJRZrp7RFtzMFFD/+fliKmR9xraE
         JuV+34+Kt7n8oNs/yZzCkHGHWaoTVKYliqZU550kH6LuANRqiDG3mAxX+TYjuwt46sWf
         8qAS5IJE6TiEr13AjKYo78lifOSJC9n2StRbn95qKxQHuN4//3S3ZG/CbijGb9xYdr/h
         Pxp+CQ9ZUMcpeibgl+mLGXpp63eGMYc6RHDHe2rB/Vn6sVs0IlTQ5XIwAyAUyiMKJDPZ
         odxQZtUs3Iocr2kcA+HYBCSaQyIg6WHx/IPEWtyJ9fkOV1ZHk3nJ1U7whzFVc+alJd9v
         CMPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727274715; x=1727879515;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bM9SP2rvTqGu03Vlo5S8QNU/05QjrmaE2YALOkKknj4=;
        b=J/252QWmlWdW93es+EzmUSxH6SrkkuSOOTzbnzOj6vlVHmJJN5j9o4NDyTCDRvjNKE
         XlBknk46T0fhk5beiV2eUxFzI2VKgfA2up36m5HrabPif8eN0TFsL7HTRLmkjv/WRKE1
         cajukzqHsatuBACIQDUYqyouOlQy1k83QlWm/e7i2bsRMH+To736MisNdoZPV3Ey5IJo
         TCBXytDlusXe3n4+8OJe/EOE42Zcd8wiS++j5lUg7OK2jDMIea+SdOj3zZhb3smXZuEM
         s1Y61txEhXfmQo5LzeTJJpCTu7/r5pJzTUltFSOQdLi3yl0y8OCDhWxk/ViEMpyv76eS
         busg==
X-Gm-Message-State: AOJu0Yx3PHnMNSOT6zgTEIo+zV8RraAVWQB8e5G1BTqcQNR59/ZNM9kU
	TZqXcmRIDKlayzh2qmPvXCDaxrg1uzcMi/XKlsq1OCWLn+3xPoJrBwcpZoWWz3z0+S8BDiheujr
	0
X-Google-Smtp-Source: AGHT+IHbpu5DE6tvjsN90CvUnPNvwrMJZvEHP1NfUsXR82Gz+ZtqJynwkONCTq2mRnoJqR6bj2Xo+w==
X-Received: by 2002:a05:600c:45ce:b0:42b:af1c:66e with SMTP id 5b1f17b1804b1-42e9610c1c6mr19389955e9.9.1727274714978;
        Wed, 25 Sep 2024 07:31:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a36760sm20776975e9.30.2024.09.25.07.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 07:31:54 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:31:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [mnyman-xhci:for-usb-next 9/10] drivers/usb/host/xhci-ring.c:1405
 xhci_handle_cmd_set_deq() error: uninitialized symbol 'stream_ctx'.
Message-ID: <b40140f7-cfd8-4cd4-b442-4d3d4318c5db@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git for-usb-next
head:   645eb2ce6b3e541d3c651f136da8a16f76799526
commit: fdd9a29e9139a8988b65dce295dfc3f089003ae0 [9/10] xhci: trace stream context at Set TR Deq command completion
config: powerpc64-randconfig-r072-20240925 (https://download.01.org/0day-ci/archive/20240925/202409252250.WNZonX5o-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409252250.WNZonX5o-lkp@intel.com/

smatch warnings:
drivers/usb/host/xhci-ring.c:1405 xhci_handle_cmd_set_deq() error: uninitialized symbol 'stream_ctx'.

vim +/stream_ctx +1405 drivers/usb/host/xhci-ring.c

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

stream_ctx is only initialized when ep->stream_info is non-NULL.
Could we change this condition to:
	if ((ep->ep_state & EP_HAS_STREAMS) && cmd_comp_code == COMP_SUCCESS) {
instead?

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
                                                                                          ^^^^^^^^^^
Warning.  My guess is that if cmd_comp_code is success then ep->stream_info but
it's hard to tell without more context...

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

