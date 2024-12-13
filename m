Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F71B190696
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Dec 2024 23:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734134031; cv=none; b=MbqBPwB6BD1Y4qtjwilJdnS/uU5uLg8kLk9917ICn7YShKz4iBcHESqjktwNnR/kWXuhnrExHYGul/jWWmC7aM4RZXJo0xhK4hF6BUL90Pz7a9Q/HsKwehiRmIPX6GfJxToZV+7qN1SmsYmo6FJIZQzSttXv2d4EYbhFsgnEQf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734134031; c=relaxed/simple;
	bh=mKXVlSKKqORXoruaAbcahC9c4IHmfILq6jA8ClJs/t4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bsKeSf8vm4NpWLVIDNxao2oUpKW5f3rNBagAgN7eeF5Xa5B/AJgQ4sCv0jO/Jv0oc7AEcyx74Rk+35kl7st5Mkf3oKHKkATotKX70IuIS1SEencXYa4ce0hZpzaxWHZeAZodiZphTSHkMTODbb2EwLhQAV/rUXtQj4b+ku7hp3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q0zQDIWl; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q0zQDIWl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734134028; x=1765670028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mKXVlSKKqORXoruaAbcahC9c4IHmfILq6jA8ClJs/t4=;
  b=Q0zQDIWlUpe8YnHRITEmiJ6uvQmow+/jOJ95TpJgzApKQ6XEcLYGMqBn
   E7lbmxkAerGzxeC66hdtN4c3WD96G1Hr5C71VRY/AFFrnBBnUItckEGqu
   VNi0vJa++oFiyhMzhS0FTgWWS5tdxxGP7fIxPo3GJS6AoMPfPBJWeiha1
   DV64ZHONhQ0Jf08JrARACS/b1ekdWC8dof883CpPUXZ4chyNVvKPW9WI7
   gyRGBi4Hq9Bf6IpYnPSFgd8B+IvkaCF1+Z+8k+Jm++k5dkMPugprYsfhQ
   OB99bJZRXlWrEN1NxchOBLE2CFA2faYkvF0wI9uNxChFdR3hRnNo2Sgtl
   Q==;
X-CSE-ConnectionGUID: +tNsswciSr6mkoQpph2vHQ==
X-CSE-MsgGUID: vUu+D6C2QGOJieCw92zQGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34831339"
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; 
   d="scan'208";a="34831339"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 15:53:46 -0800
X-CSE-ConnectionGUID: HqJ8d4FHSUKVGx37KHI0cQ==
X-CSE-MsgGUID: jql4ihbPQd25+SaUMP1/Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101242736"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Dec 2024 15:53:45 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMFTa-000CYA-2g;
	Fri, 13 Dec 2024 23:53:42 +0000
Date: Sat, 14 Dec 2024 07:53:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android15-6.6 28/33]
 drivers/usb/host/xhci-ring.c:2751:27-34: ERROR: ep_ring is NULL but
 dereferenced.
Message-ID: <202412140711.EJbOrcYa-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   daaec5035152cdd32538725d8361a20b05434942
commit: b7a1562e2e151612ea31c7ebbb4478a1fe01c064 [28/33] UPSTREAM: xhci: simplify event ring dequeue tracking for transfer events
:::::: branch date: 2 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-102-20241214 (https://download.01.org/0day-ci/archive/20241214/202412140711.EJbOrcYa-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412140711.EJbOrcYa-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/usb/host/xhci-ring.c:2751:27-34: ERROR: ep_ring is NULL but dereferenced.

vim +2751 drivers/usb/host/xhci-ring.c

22405ed2e1bd8d2 Andiry Xu        2010-07-22  2535  
d0e96f5a71a032c Sarah Sharp      2009-04-27  2536  /*
d0e96f5a71a032c Sarah Sharp      2009-04-27  2537   * If this function returns an error condition, it means it got a Transfer
d0e96f5a71a032c Sarah Sharp      2009-04-27  2538   * event with a corrupted Slot ID, Endpoint ID, or TRB DMA address.
d0e96f5a71a032c Sarah Sharp      2009-04-27  2539   * At this point, the host controller is probably hosed and should be reset.
d0e96f5a71a032c Sarah Sharp      2009-04-27  2540   */
d0e96f5a71a032c Sarah Sharp      2009-04-27  2541  static int handle_tx_event(struct xhci_hcd *xhci,
b17a57f89f69069 Mathias Nyman    2023-02-02  2542  			   struct xhci_interrupter *ir,
d0e96f5a71a032c Sarah Sharp      2009-04-27  2543  			   struct xhci_transfer_event *event)
d0e96f5a71a032c Sarah Sharp      2009-04-27  2544  {
63a0d9abd18cdcf Sarah Sharp      2009-09-04  2545  	struct xhci_virt_ep *ep;
d0e96f5a71a032c Sarah Sharp      2009-04-27  2546  	struct xhci_ring *ep_ring;
82d1009f537c2a4 Sarah Sharp      2009-08-07  2547  	unsigned int slot_id;
d0e96f5a71a032c Sarah Sharp      2009-04-27  2548  	int ep_index;
326b4810cc99520 Randy Dunlap     2010-04-19  2549  	struct xhci_td *td = NULL;
f97c08ae329bcf0 Mathias Nyman    2016-11-11  2550  	dma_addr_t ep_trb_dma;
f97c08ae329bcf0 Mathias Nyman    2016-11-11  2551  	struct xhci_segment *ep_seg;
f97c08ae329bcf0 Mathias Nyman    2016-11-11  2552  	union xhci_trb *ep_trb;
d0e96f5a71a032c Sarah Sharp      2009-04-27  2553  	int status = -EINPROGRESS;
d115b04818e57bd John Youn        2009-07-27  2554  	struct xhci_ep_ctx *ep_ctx;
66d1eebce5cca91 Sarah Sharp      2009-08-27  2555  	u32 trb_comp_code;
c2d7b49f42f50d7 Andiry Xu        2011-09-19  2556  	int td_num = 0;
3b4739b8951d650 Mathias Nyman    2015-10-12  2557  	bool handling_skipped_tds = false;
d0e96f5a71a032c Sarah Sharp      2009-04-27  2558  
28ccd2962c66556 Matt Evans       2011-03-29  2559  	slot_id = TRB_TO_SLOT_ID(le32_to_cpu(event->flags));
b3368382efe6e98 Mathias Nyman    2017-06-15  2560  	ep_index = TRB_TO_EP_ID(le32_to_cpu(event->flags)) - 1;
b3368382efe6e98 Mathias Nyman    2017-06-15  2561  	trb_comp_code = GET_COMP_CODE(le32_to_cpu(event->transfer_len));
b3368382efe6e98 Mathias Nyman    2017-06-15  2562  	ep_trb_dma = le64_to_cpu(event->buffer);
b3368382efe6e98 Mathias Nyman    2017-06-15  2563  
b1adc42d440df32 Mathias Nyman    2021-01-29  2564  	ep = xhci_get_virt_ep(xhci, slot_id, ep_index);
b1adc42d440df32 Mathias Nyman    2021-01-29  2565  	if (!ep) {
b1adc42d440df32 Mathias Nyman    2021-01-29  2566  		xhci_err(xhci, "ERROR Invalid Transfer event\n");
b3368382efe6e98 Mathias Nyman    2017-06-15  2567  		goto err_out;
d0e96f5a71a032c Sarah Sharp      2009-04-27  2568  	}
d0e96f5a71a032c Sarah Sharp      2009-04-27  2569  
b3368382efe6e98 Mathias Nyman    2017-06-15  2570  	ep_ring = xhci_dma_to_transfer_ring(ep, ep_trb_dma);
b1adc42d440df32 Mathias Nyman    2021-01-29  2571  	ep_ctx = xhci_get_ep_ctx(xhci, ep->vdev->out_ctx, ep_index);
b3368382efe6e98 Mathias Nyman    2017-06-15  2572  
ade2e3a148a1740 Mathias Nyman    2017-06-15  2573  	if (GET_EP_CTX_STATE(ep_ctx) == EP_STATE_DISABLED) {
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2574  		xhci_err(xhci,
ade2e3a148a1740 Mathias Nyman    2017-06-15  2575  			 "ERROR Transfer event for disabled endpoint slot %u ep %u\n",
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2576  			  slot_id, ep_index);
b3368382efe6e98 Mathias Nyman    2017-06-15  2577  		goto err_out;
d0e96f5a71a032c Sarah Sharp      2009-04-27  2578  	}
d0e96f5a71a032c Sarah Sharp      2009-04-27  2579  
ade2e3a148a1740 Mathias Nyman    2017-06-15  2580  	/* Some transfer events don't always point to a trb, see xhci 4.17.4 */
ade2e3a148a1740 Mathias Nyman    2017-06-15  2581  	if (!ep_ring) {
ade2e3a148a1740 Mathias Nyman    2017-06-15  2582  		switch (trb_comp_code) {
ade2e3a148a1740 Mathias Nyman    2017-06-15  2583  		case COMP_STALL_ERROR:
ade2e3a148a1740 Mathias Nyman    2017-06-15  2584  		case COMP_USB_TRANSACTION_ERROR:
ade2e3a148a1740 Mathias Nyman    2017-06-15  2585  		case COMP_INVALID_STREAM_TYPE_ERROR:
ade2e3a148a1740 Mathias Nyman    2017-06-15  2586  		case COMP_INVALID_STREAM_ID_ERROR:
a1575120972ecd7 Mathias Nyman    2022-11-30  2587  			xhci_dbg(xhci, "Stream transaction error ep %u no id\n",
a1575120972ecd7 Mathias Nyman    2022-11-30  2588  				 ep_index);
a1575120972ecd7 Mathias Nyman    2022-11-30  2589  			if (ep->err_count++ > MAX_SOFT_RETRY)
7428a253315cefa Mathias Nyman    2022-11-30  2590  				xhci_handle_halted_endpoint(xhci, ep, NULL,
a1575120972ecd7 Mathias Nyman    2022-11-30  2591  							    EP_HARD_RESET);
a1575120972ecd7 Mathias Nyman    2022-11-30  2592  			else
7428a253315cefa Mathias Nyman    2022-11-30  2593  				xhci_handle_halted_endpoint(xhci, ep, NULL,
d70f4231b81eeb6 Mathias Nyman    2021-01-29  2594  							    EP_SOFT_RESET);
ade2e3a148a1740 Mathias Nyman    2017-06-15  2595  			goto cleanup;
ade2e3a148a1740 Mathias Nyman    2017-06-15  2596  		case COMP_RING_UNDERRUN:
ade2e3a148a1740 Mathias Nyman    2017-06-15  2597  		case COMP_RING_OVERRUN:
d9193efba84fe4c Sandeep Singh    2018-11-09  2598  		case COMP_STOPPED_LENGTH_INVALID:
ade2e3a148a1740 Mathias Nyman    2017-06-15  2599  			goto cleanup;
ade2e3a148a1740 Mathias Nyman    2017-06-15  2600  		default:
ade2e3a148a1740 Mathias Nyman    2017-06-15  2601  			xhci_err(xhci, "ERROR Transfer event for unknown stream ring slot %u ep %u\n",
ade2e3a148a1740 Mathias Nyman    2017-06-15  2602  				 slot_id, ep_index);
ade2e3a148a1740 Mathias Nyman    2017-06-15  2603  			goto err_out;
ade2e3a148a1740 Mathias Nyman    2017-06-15  2604  		}
ade2e3a148a1740 Mathias Nyman    2017-06-15  2605  	}
ade2e3a148a1740 Mathias Nyman    2017-06-15  2606  
c2d7b49f42f50d7 Andiry Xu        2011-09-19  2607  	/* Count current td numbers if ep->skip is set */
5220cb493bf418c Andy Shevchenko  2022-11-30  2608  	if (ep->skip)
5220cb493bf418c Andy Shevchenko  2022-11-30  2609  		td_num += list_count_nodes(&ep_ring->td_list);
c2d7b49f42f50d7 Andiry Xu        2011-09-19  2610  
986a92d44810cad Andiry Xu        2010-07-22  2611  	/* Look for common error cases */
66d1eebce5cca91 Sarah Sharp      2009-08-27  2612  	switch (trb_comp_code) {
b10de142119a676 Sarah Sharp      2009-04-27  2613  	/* Skip codes that require special handling depending on
b10de142119a676 Sarah Sharp      2009-04-27  2614  	 * transfer type
b10de142119a676 Sarah Sharp      2009-04-27  2615  	 */
b10de142119a676 Sarah Sharp      2009-04-27  2616  	case COMP_SUCCESS:
1c11a172cb30492 Vivek Gautam     2013-03-21  2617  		if (EVENT_TRB_LEN(le32_to_cpu(event->transfer_len)) == 0)
1530bbc6272d9da Sarah Sharp      2012-05-08  2618  			break;
7ff11162808cc2e Mathias Nyman    2019-12-11  2619  		if (xhci->quirks & XHCI_TRUST_TX_LENGTH ||
7ff11162808cc2e Mathias Nyman    2019-12-11  2620  		    ep_ring->last_td_was_short)
0b7c105a04ca793 Felipe Balbi     2017-01-23  2621  			trb_comp_code = COMP_SHORT_PACKET;
1530bbc6272d9da Sarah Sharp      2012-05-08  2622  		else
8202ce2e2921941 Sarah Sharp      2012-07-25  2623  			xhci_warn_ratelimited(xhci,
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2624  					      "WARN Successful completion on short TX for slot %u ep %u: needs XHCI_TRUST_TX_LENGTH quirk?\n",
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2625  					      slot_id, ep_index);
1d6903a617a221f Nick Desaulniers 2020-11-10  2626  		break;
0b7c105a04ca793 Felipe Balbi     2017-01-23  2627  	case COMP_SHORT_PACKET:
b10de142119a676 Sarah Sharp      2009-04-27  2628  		break;
b3368382efe6e98 Mathias Nyman    2017-06-15  2629  	/* Completion codes for endpoint stopped state */
0b7c105a04ca793 Felipe Balbi     2017-01-23  2630  	case COMP_STOPPED:
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2631  		xhci_dbg(xhci, "Stopped on Transfer TRB for slot %u ep %u\n",
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2632  			 slot_id, ep_index);
ae636747146ea97 Sarah Sharp      2009-04-29  2633  		break;
0b7c105a04ca793 Felipe Balbi     2017-01-23  2634  	case COMP_STOPPED_LENGTH_INVALID:
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2635  		xhci_dbg(xhci,
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2636  			 "Stopped on No-op or Link TRB for slot %u ep %u\n",
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2637  			 slot_id, ep_index);
ae636747146ea97 Sarah Sharp      2009-04-29  2638  		break;
0b7c105a04ca793 Felipe Balbi     2017-01-23  2639  	case COMP_STOPPED_SHORT_PACKET:
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2640  		xhci_dbg(xhci,
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2641  			 "Stopped with short packet transfer detected for slot %u ep %u\n",
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2642  			 slot_id, ep_index);
40a3b775f49c278 Lu Baolu         2015-08-06  2643  		break;
b3368382efe6e98 Mathias Nyman    2017-06-15  2644  	/* Completion codes for endpoint halted state */
0b7c105a04ca793 Felipe Balbi     2017-01-23  2645  	case COMP_STALL_ERROR:
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2646  		xhci_dbg(xhci, "Stalled endpoint for slot %u ep %u\n", slot_id,
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2647  			 ep_index);
b10de142119a676 Sarah Sharp      2009-04-27  2648  		status = -EPIPE;
b10de142119a676 Sarah Sharp      2009-04-27  2649  		break;
0b7c105a04ca793 Felipe Balbi     2017-01-23  2650  	case COMP_SPLIT_TRANSACTION_ERROR:
76eac5d21a7164a Mathias Nyman    2020-03-12  2651  		xhci_dbg(xhci, "Split transaction error for slot %u ep %u\n",
76eac5d21a7164a Mathias Nyman    2020-03-12  2652  			 slot_id, ep_index);
76eac5d21a7164a Mathias Nyman    2020-03-12  2653  		status = -EPROTO;
76eac5d21a7164a Mathias Nyman    2020-03-12  2654  		break;
0b7c105a04ca793 Felipe Balbi     2017-01-23  2655  	case COMP_USB_TRANSACTION_ERROR:
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2656  		xhci_dbg(xhci, "Transfer error for slot %u ep %u on endpoint\n",
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2657  			 slot_id, ep_index);
b10de142119a676 Sarah Sharp      2009-04-27  2658  		status = -EPROTO;
b10de142119a676 Sarah Sharp      2009-04-27  2659  		break;
0b7c105a04ca793 Felipe Balbi     2017-01-23  2660  	case COMP_BABBLE_DETECTED_ERROR:
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2661  		xhci_dbg(xhci, "Babble error for slot %u ep %u on endpoint\n",
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2662  			 slot_id, ep_index);
4a73143ced46786 Sarah Sharp      2009-07-27  2663  		status = -EOVERFLOW;
4a73143ced46786 Sarah Sharp      2009-07-27  2664  		break;
b3368382efe6e98 Mathias Nyman    2017-06-15  2665  	/* Completion codes for endpoint error state */
b3368382efe6e98 Mathias Nyman    2017-06-15  2666  	case COMP_TRB_ERROR:
b3368382efe6e98 Mathias Nyman    2017-06-15  2667  		xhci_warn(xhci,
b3368382efe6e98 Mathias Nyman    2017-06-15  2668  			  "WARN: TRB error for slot %u ep %u on endpoint\n",
b3368382efe6e98 Mathias Nyman    2017-06-15  2669  			  slot_id, ep_index);
b3368382efe6e98 Mathias Nyman    2017-06-15  2670  		status = -EILSEQ;
b3368382efe6e98 Mathias Nyman    2017-06-15  2671  		break;
b3368382efe6e98 Mathias Nyman    2017-06-15  2672  	/* completion codes not indicating endpoint state change */
0b7c105a04ca793 Felipe Balbi     2017-01-23  2673  	case COMP_DATA_BUFFER_ERROR:
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2674  		xhci_warn(xhci,
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2675  			  "WARN: HC couldn't access mem fast enough for slot %u ep %u\n",
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2676  			  slot_id, ep_index);
b10de142119a676 Sarah Sharp      2009-04-27  2677  		status = -ENOSR;
b10de142119a676 Sarah Sharp      2009-04-27  2678  		break;
0b7c105a04ca793 Felipe Balbi     2017-01-23  2679  	case COMP_BANDWIDTH_OVERRUN_ERROR:
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2680  		xhci_warn(xhci,
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2681  			  "WARN: bandwidth overrun event for slot %u ep %u on endpoint\n",
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2682  			  slot_id, ep_index);
986a92d44810cad Andiry Xu        2010-07-22  2683  		break;
0b7c105a04ca793 Felipe Balbi     2017-01-23  2684  	case COMP_ISOCH_BUFFER_OVERRUN:
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2685  		xhci_warn(xhci,
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2686  			  "WARN: buffer overrun event for slot %u ep %u on endpoint",
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2687  			  slot_id, ep_index);
986a92d44810cad Andiry Xu        2010-07-22  2688  		break;
0b7c105a04ca793 Felipe Balbi     2017-01-23  2689  	case COMP_RING_UNDERRUN:
986a92d44810cad Andiry Xu        2010-07-22  2690  		/*
986a92d44810cad Andiry Xu        2010-07-22  2691  		 * When the Isoch ring is empty, the xHC will generate
986a92d44810cad Andiry Xu        2010-07-22  2692  		 * a Ring Overrun Event for IN Isoch endpoint or Ring
986a92d44810cad Andiry Xu        2010-07-22  2693  		 * Underrun Event for OUT Isoch endpoint.
986a92d44810cad Andiry Xu        2010-07-22  2694  		 */
986a92d44810cad Andiry Xu        2010-07-22  2695  		xhci_dbg(xhci, "underrun event on endpoint\n");
986a92d44810cad Andiry Xu        2010-07-22  2696  		if (!list_empty(&ep_ring->td_list))
986a92d44810cad Andiry Xu        2010-07-22  2697  			xhci_dbg(xhci, "Underrun Event for slot %d ep %d "
986a92d44810cad Andiry Xu        2010-07-22  2698  					"still with TDs queued?\n",
28ccd2962c66556 Matt Evans       2011-03-29  2699  				 TRB_TO_SLOT_ID(le32_to_cpu(event->flags)),
28ccd2962c66556 Matt Evans       2011-03-29  2700  				 ep_index);
986a92d44810cad Andiry Xu        2010-07-22  2701  		goto cleanup;
0b7c105a04ca793 Felipe Balbi     2017-01-23  2702  	case COMP_RING_OVERRUN:
986a92d44810cad Andiry Xu        2010-07-22  2703  		xhci_dbg(xhci, "overrun event on endpoint\n");
986a92d44810cad Andiry Xu        2010-07-22  2704  		if (!list_empty(&ep_ring->td_list))
986a92d44810cad Andiry Xu        2010-07-22  2705  			xhci_dbg(xhci, "Overrun Event for slot %d ep %d "
986a92d44810cad Andiry Xu        2010-07-22  2706  					"still with TDs queued?\n",
28ccd2962c66556 Matt Evans       2011-03-29  2707  				 TRB_TO_SLOT_ID(le32_to_cpu(event->flags)),
28ccd2962c66556 Matt Evans       2011-03-29  2708  				 ep_index);
986a92d44810cad Andiry Xu        2010-07-22  2709  		goto cleanup;
0b7c105a04ca793 Felipe Balbi     2017-01-23  2710  	case COMP_MISSED_SERVICE_ERROR:
d18240db797ed74 Andiry Xu        2010-07-22  2711  		/*
d18240db797ed74 Andiry Xu        2010-07-22  2712  		 * When encounter missed service error, one or more isoc tds
d18240db797ed74 Andiry Xu        2010-07-22  2713  		 * may be missed by xHC.
d18240db797ed74 Andiry Xu        2010-07-22  2714  		 * Set skip flag of the ep_ring; Complete the missed tds as
d18240db797ed74 Andiry Xu        2010-07-22  2715  		 * short transfer when process the ep_ring next time.
d18240db797ed74 Andiry Xu        2010-07-22  2716  		 */
d18240db797ed74 Andiry Xu        2010-07-22  2717  		ep->skip = true;
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2718  		xhci_dbg(xhci,
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2719  			 "Miss service interval error for slot %u ep %u, set skip flag\n",
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2720  			 slot_id, ep_index);
d18240db797ed74 Andiry Xu        2010-07-22  2721  		goto cleanup;
0b7c105a04ca793 Felipe Balbi     2017-01-23  2722  	case COMP_NO_PING_RESPONSE_ERROR:
3b4739b8951d650 Mathias Nyman    2015-10-12  2723  		ep->skip = true;
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2724  		xhci_dbg(xhci,
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2725  			 "No Ping response error for slot %u ep %u, Skip one Isoc TD\n",
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2726  			 slot_id, ep_index);
3b4739b8951d650 Mathias Nyman    2015-10-12  2727  		goto cleanup;
b3368382efe6e98 Mathias Nyman    2017-06-15  2728  
b3368382efe6e98 Mathias Nyman    2017-06-15  2729  	case COMP_INCOMPATIBLE_DEVICE_ERROR:
b3368382efe6e98 Mathias Nyman    2017-06-15  2730  		/* needs disable slot command to recover */
b3368382efe6e98 Mathias Nyman    2017-06-15  2731  		xhci_warn(xhci,
b3368382efe6e98 Mathias Nyman    2017-06-15  2732  			  "WARN: detect an incompatible device for slot %u ep %u",
b3368382efe6e98 Mathias Nyman    2017-06-15  2733  			  slot_id, ep_index);
b3368382efe6e98 Mathias Nyman    2017-06-15  2734  		status = -EPROTO;
b3368382efe6e98 Mathias Nyman    2017-06-15  2735  		break;
b10de142119a676 Sarah Sharp      2009-04-27  2736  	default:
b45b50691124700 Sarah Sharp      2009-12-09  2737  		if (xhci_is_vendor_info_code(xhci, trb_comp_code)) {
5ad6a529c28db36 Sarah Sharp      2009-11-11  2738  			status = 0;
5ad6a529c28db36 Sarah Sharp      2009-11-11  2739  			break;
5ad6a529c28db36 Sarah Sharp      2009-11-11  2740  		}
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2741  		xhci_warn(xhci,
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2742  			  "ERROR Unknown event condition %u for slot %u ep %u , HC probably busted\n",
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2743  			  trb_comp_code, slot_id, ep_index);
986a92d44810cad Andiry Xu        2010-07-22  2744  		goto cleanup;
986a92d44810cad Andiry Xu        2010-07-22  2745  	}
986a92d44810cad Andiry Xu        2010-07-22  2746  
d18240db797ed74 Andiry Xu        2010-07-22  2747  	do {
d18240db797ed74 Andiry Xu        2010-07-22  2748  		/* This TRB should be in the TD at the head of this ring's
d18240db797ed74 Andiry Xu        2010-07-22  2749  		 * TD list.
d18240db797ed74 Andiry Xu        2010-07-22  2750  		 */
986a92d44810cad Andiry Xu        2010-07-22 @2751  		if (list_empty(&ep_ring->td_list)) {
a83d6755814e461 Sarah Sharp      2013-03-18  2752  			/*
e4ec40ec4b260ef Mathias Nyman    2017-12-01  2753  			 * Don't print wanings if it's due to a stopped endpoint
e4ec40ec4b260ef Mathias Nyman    2017-12-01  2754  			 * generating an extra completion event if the device
e4ec40ec4b260ef Mathias Nyman    2017-12-01  2755  			 * was suspended. Or, a event for the last TRB of a
e4ec40ec4b260ef Mathias Nyman    2017-12-01  2756  			 * short TD we already got a short event for.
e4ec40ec4b260ef Mathias Nyman    2017-12-01  2757  			 * The short TD is already removed from the TD list.
a83d6755814e461 Sarah Sharp      2013-03-18  2758  			 */
e4ec40ec4b260ef Mathias Nyman    2017-12-01  2759  
0b7c105a04ca793 Felipe Balbi     2017-01-23  2760  			if (!(trb_comp_code == COMP_STOPPED ||
e4ec40ec4b260ef Mathias Nyman    2017-12-01  2761  			      trb_comp_code == COMP_STOPPED_LENGTH_INVALID ||
e4ec40ec4b260ef Mathias Nyman    2017-12-01  2762  			      ep_ring->last_td_was_short)) {
a83d6755814e461 Sarah Sharp      2013-03-18  2763  				xhci_warn(xhci, "WARN Event TRB for slot %d ep %d with no TDs queued?\n",
28ccd2962c66556 Matt Evans       2011-03-29  2764  						TRB_TO_SLOT_ID(le32_to_cpu(event->flags)),
28ccd2962c66556 Matt Evans       2011-03-29  2765  						ep_index);
a83d6755814e461 Sarah Sharp      2013-03-18  2766  			}
d18240db797ed74 Andiry Xu        2010-07-22  2767  			if (ep->skip) {
d18240db797ed74 Andiry Xu        2010-07-22  2768  				ep->skip = false;
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2769  				xhci_dbg(xhci, "td_list is empty while skip flag set. Clear skip flag for slot %u ep %u.\n",
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2770  					 slot_id, ep_index);
d18240db797ed74 Andiry Xu        2010-07-22  2771  			}
93ceaa808e8defc Mathias Nyman    2020-04-21  2772  			if (trb_comp_code == COMP_STALL_ERROR ||
93ceaa808e8defc Mathias Nyman    2020-04-21  2773  			    xhci_requires_manual_halt_cleanup(xhci, ep_ctx,
93ceaa808e8defc Mathias Nyman    2020-04-21  2774  							      trb_comp_code)) {
7428a253315cefa Mathias Nyman    2022-11-30  2775  				xhci_handle_halted_endpoint(xhci, ep, NULL,
93ceaa808e8defc Mathias Nyman    2020-04-21  2776  							    EP_HARD_RESET);
93ceaa808e8defc Mathias Nyman    2020-04-21  2777  			}
b10de142119a676 Sarah Sharp      2009-04-27  2778  			goto cleanup;
b10de142119a676 Sarah Sharp      2009-04-27  2779  		}
986a92d44810cad Andiry Xu        2010-07-22  2780  
c2d7b49f42f50d7 Andiry Xu        2011-09-19  2781  		/* We've skipped all the TDs on the ep ring when ep->skip set */
c2d7b49f42f50d7 Andiry Xu        2011-09-19  2782  		if (ep->skip && td_num == 0) {
c2d7b49f42f50d7 Andiry Xu        2011-09-19  2783  			ep->skip = false;
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2784  			xhci_dbg(xhci, "All tds on the ep_ring skipped. Clear skip flag for slot %u ep %u.\n",
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2785  				 slot_id, ep_index);
c2d7b49f42f50d7 Andiry Xu        2011-09-19  2786  			goto cleanup;
c2d7b49f42f50d7 Andiry Xu        2011-09-19  2787  		}
c2d7b49f42f50d7 Andiry Xu        2011-09-19  2788  
04861f83367eaa3 Felipe Balbi     2017-01-23  2789  		td = list_first_entry(&ep_ring->td_list, struct xhci_td,
04861f83367eaa3 Felipe Balbi     2017-01-23  2790  				      td_list);
c2d7b49f42f50d7 Andiry Xu        2011-09-19  2791  		if (ep->skip)
c2d7b49f42f50d7 Andiry Xu        2011-09-19  2792  			td_num--;
926008c9386dde0 Dmitry Torokhov  2011-03-23  2793  
986a92d44810cad Andiry Xu        2010-07-22  2794  		/* Is this a TRB in the currently executing TD? */
f97c08ae329bcf0 Mathias Nyman    2016-11-11  2795  		ep_seg = trb_in_td(xhci, ep_ring->deq_seg, ep_ring->dequeue,
f97c08ae329bcf0 Mathias Nyman    2016-11-11  2796  				td->last_trb, ep_trb_dma, false);
e1cf486d881d853 Alex He          2011-06-03  2797  
e1cf486d881d853 Alex He          2011-06-03  2798  		/*
e1cf486d881d853 Alex He          2011-06-03  2799  		 * Skip the Force Stopped Event. The event_trb(event_dma) of FSE
e1cf486d881d853 Alex He          2011-06-03  2800  		 * is not in the current TD pointed by ep_ring->dequeue because
e1cf486d881d853 Alex He          2011-06-03  2801  		 * that the hardware dequeue pointer still at the previous TRB
e1cf486d881d853 Alex He          2011-06-03  2802  		 * of the current TD. The previous TRB maybe a Link TD or the
e1cf486d881d853 Alex He          2011-06-03  2803  		 * last TRB of the previous TD. The command completion handle
e1cf486d881d853 Alex He          2011-06-03  2804  		 * will take care the rest.
e1cf486d881d853 Alex He          2011-06-03  2805  		 */
0b7c105a04ca793 Felipe Balbi     2017-01-23  2806  		if (!ep_seg && (trb_comp_code == COMP_STOPPED ||
0b7c105a04ca793 Felipe Balbi     2017-01-23  2807  			   trb_comp_code == COMP_STOPPED_LENGTH_INVALID)) {
e1cf486d881d853 Alex He          2011-06-03  2808  			goto cleanup;
e1cf486d881d853 Alex He          2011-06-03  2809  		}
e1cf486d881d853 Alex He          2011-06-03  2810  
f97c08ae329bcf0 Mathias Nyman    2016-11-11  2811  		if (!ep_seg) {
926008c9386dde0 Dmitry Torokhov  2011-03-23  2812  			if (!ep->skip ||
926008c9386dde0 Dmitry Torokhov  2011-03-23  2813  			    !usb_endpoint_xfer_isoc(&td->urb->ep->desc)) {
ad808333d8201d5 Sarah Sharp      2011-05-25  2814  				/* Some host controllers give a spurious
ad808333d8201d5 Sarah Sharp      2011-05-25  2815  				 * successful event after a short transfer.
ad808333d8201d5 Sarah Sharp      2011-05-25  2816  				 * Ignore it.
ad808333d8201d5 Sarah Sharp      2011-05-25  2817  				 */
ad808333d8201d5 Sarah Sharp      2011-05-25  2818  				if ((xhci->quirks & XHCI_SPURIOUS_SUCCESS) &&
ad808333d8201d5 Sarah Sharp      2011-05-25  2819  						ep_ring->last_td_was_short) {
ad808333d8201d5 Sarah Sharp      2011-05-25  2820  					ep_ring->last_td_was_short = false;
ad808333d8201d5 Sarah Sharp      2011-05-25  2821  					goto cleanup;
ad808333d8201d5 Sarah Sharp      2011-05-25  2822  				}
986a92d44810cad Andiry Xu        2010-07-22  2823  				/* HC is busted, give up! */
926008c9386dde0 Dmitry Torokhov  2011-03-23  2824  				xhci_err(xhci,
926008c9386dde0 Dmitry Torokhov  2011-03-23  2825  					"ERROR Transfer event TRB DMA ptr not "
cffb9be80f8a6d5 Hans de Goede    2014-08-20  2826  					"part of current TD ep_index %d "
cffb9be80f8a6d5 Hans de Goede    2014-08-20  2827  					"comp_code %u\n", ep_index,
cffb9be80f8a6d5 Hans de Goede    2014-08-20  2828  					trb_comp_code);
cffb9be80f8a6d5 Hans de Goede    2014-08-20  2829  				trb_in_td(xhci, ep_ring->deq_seg,
cffb9be80f8a6d5 Hans de Goede    2014-08-20  2830  					  ep_ring->dequeue, td->last_trb,
f97c08ae329bcf0 Mathias Nyman    2016-11-11  2831  					  ep_trb_dma, true);
986a92d44810cad Andiry Xu        2010-07-22  2832  				return -ESHUTDOWN;
986a92d44810cad Andiry Xu        2010-07-22  2833  			}
986a92d44810cad Andiry Xu        2010-07-22  2834  
a6ccd1fd4bd4fca Mathias Nyman    2021-01-29  2835  			skip_isoc_td(xhci, td, ep, status);
926008c9386dde0 Dmitry Torokhov  2011-03-23  2836  			goto cleanup;
926008c9386dde0 Dmitry Torokhov  2011-03-23  2837  		}
0b7c105a04ca793 Felipe Balbi     2017-01-23  2838  		if (trb_comp_code == COMP_SHORT_PACKET)
ad808333d8201d5 Sarah Sharp      2011-05-25  2839  			ep_ring->last_td_was_short = true;
ad808333d8201d5 Sarah Sharp      2011-05-25  2840  		else
ad808333d8201d5 Sarah Sharp      2011-05-25  2841  			ep_ring->last_td_was_short = false;
926008c9386dde0 Dmitry Torokhov  2011-03-23  2842  
926008c9386dde0 Dmitry Torokhov  2011-03-23  2843  		if (ep->skip) {
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2844  			xhci_dbg(xhci,
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2845  				 "Found td. Clear skip flag for slot %u ep %u.\n",
b7f769ae1b12608 Zhengjun Xing    2017-04-07  2846  				 slot_id, ep_index);
926008c9386dde0 Dmitry Torokhov  2011-03-23  2847  			ep->skip = false;
926008c9386dde0 Dmitry Torokhov  2011-03-23  2848  		}
926008c9386dde0 Dmitry Torokhov  2011-03-23  2849  
f97c08ae329bcf0 Mathias Nyman    2016-11-11  2850  		ep_trb = &ep_seg->trbs[(ep_trb_dma - ep_seg->dma) /
f97c08ae329bcf0 Mathias Nyman    2016-11-11  2851  						sizeof(*ep_trb)];
a37c3f76e6a6b5e Felipe Balbi     2017-01-23  2852  
a37c3f76e6a6b5e Felipe Balbi     2017-01-23  2853  		trace_xhci_handle_transfer(ep_ring,
a37c3f76e6a6b5e Felipe Balbi     2017-01-23  2854  				(struct xhci_generic_trb *) ep_trb);
a37c3f76e6a6b5e Felipe Balbi     2017-01-23  2855  
d18240db797ed74 Andiry Xu        2010-07-22  2856  		/*
810a624bd1b64b1 Lu Baolu         2017-10-06  2857  		 * No-op TRB could trigger interrupts in a case where
810a624bd1b64b1 Lu Baolu         2017-10-06  2858  		 * a URB was killed and a STALL_ERROR happens right
810a624bd1b64b1 Lu Baolu         2017-10-06  2859  		 * after the endpoint ring stopped. Reset the halted
810a624bd1b64b1 Lu Baolu         2017-10-06  2860  		 * endpoint. Otherwise, the endpoint remains stalled
810a624bd1b64b1 Lu Baolu         2017-10-06  2861  		 * indefinitely.
d18240db797ed74 Andiry Xu        2010-07-22  2862  		 */
a6ccd1fd4bd4fca Mathias Nyman    2021-01-29  2863  
f97c08ae329bcf0 Mathias Nyman    2016-11-11  2864  		if (trb_is_noop(ep_trb)) {
810a624bd1b64b1 Lu Baolu         2017-10-06  2865  			if (trb_comp_code == COMP_STALL_ERROR ||
810a624bd1b64b1 Lu Baolu         2017-10-06  2866  			    xhci_requires_manual_halt_cleanup(xhci, ep_ctx,
810a624bd1b64b1 Lu Baolu         2017-10-06  2867  							      trb_comp_code))
7428a253315cefa Mathias Nyman    2022-11-30  2868  				xhci_handle_halted_endpoint(xhci, ep, td,
7428a253315cefa Mathias Nyman    2022-11-30  2869  							    EP_HARD_RESET);
d18240db797ed74 Andiry Xu        2010-07-22  2870  			goto cleanup;
d18240db797ed74 Andiry Xu        2010-07-22  2871  		}
d18240db797ed74 Andiry Xu        2010-07-22  2872  
a6ccd1fd4bd4fca Mathias Nyman    2021-01-29  2873  		td->status = status;
a6ccd1fd4bd4fca Mathias Nyman    2021-01-29  2874  
0c03d89d0c71722 Mathias Nyman    2016-11-11  2875  		/* update the urb's actual_length and give back to the core */
22405ed2e1bd8d2 Andiry Xu        2010-07-22  2876  		if (usb_endpoint_xfer_control(&td->urb->ep->desc))
e9fcb07704fcef6 Mathias Nyman    2021-04-06  2877  			process_ctrl_td(xhci, ep, ep_ring, td, ep_trb, event);
04e51901dd44f40 Andiry Xu        2010-07-22  2878  		else if (usb_endpoint_xfer_isoc(&td->urb->ep->desc))
e9fcb07704fcef6 Mathias Nyman    2021-04-06  2879  			process_isoc_td(xhci, ep, ep_ring, td, ep_trb, event);
2f697f6cbff155b Sarah Sharp      2009-08-28  2880  		else
e9fcb07704fcef6 Mathias Nyman    2021-04-06  2881  			process_bulk_intr_td(xhci, ep, ep_ring, td, ep_trb, event);
4422da61550b2fe Andiry Xu        2010-07-22  2882  cleanup:
3b4739b8951d650 Mathias Nyman    2015-10-12  2883  		handling_skipped_tds = ep->skip &&
0b7c105a04ca793 Felipe Balbi     2017-01-23  2884  			trb_comp_code != COMP_MISSED_SERVICE_ERROR &&
0b7c105a04ca793 Felipe Balbi     2017-01-23  2885  			trb_comp_code != COMP_NO_PING_RESPONSE_ERROR;
3b4739b8951d650 Mathias Nyman    2015-10-12  2886  
d18240db797ed74 Andiry Xu        2010-07-22  2887  	/*
d18240db797ed74 Andiry Xu        2010-07-22  2888  	 * If ep->skip is set, it means there are missed tds on the
d18240db797ed74 Andiry Xu        2010-07-22  2889  	 * endpoint ring need to take care of.
d18240db797ed74 Andiry Xu        2010-07-22  2890  	 * Process them as short transfer until reach the td pointed by
d18240db797ed74 Andiry Xu        2010-07-22  2891  	 * the event.
d18240db797ed74 Andiry Xu        2010-07-22  2892  	 */
3b4739b8951d650 Mathias Nyman    2015-10-12  2893  	} while (handling_skipped_tds);
d18240db797ed74 Andiry Xu        2010-07-22  2894  
d0e96f5a71a032c Sarah Sharp      2009-04-27  2895  	return 0;
b3368382efe6e98 Mathias Nyman    2017-06-15  2896  
b3368382efe6e98 Mathias Nyman    2017-06-15  2897  err_out:
b3368382efe6e98 Mathias Nyman    2017-06-15  2898  	xhci_err(xhci, "@%016llx %08x %08x %08x %08x\n",
b3368382efe6e98 Mathias Nyman    2017-06-15  2899  		 (unsigned long long) xhci_trb_virt_to_dma(
b17a57f89f69069 Mathias Nyman    2023-02-02  2900  			 ir->event_ring->deq_seg,
b17a57f89f69069 Mathias Nyman    2023-02-02  2901  			 ir->event_ring->dequeue),
b3368382efe6e98 Mathias Nyman    2017-06-15  2902  		 lower_32_bits(le64_to_cpu(event->buffer)),
b3368382efe6e98 Mathias Nyman    2017-06-15  2903  		 upper_32_bits(le64_to_cpu(event->buffer)),
b3368382efe6e98 Mathias Nyman    2017-06-15  2904  		 le32_to_cpu(event->transfer_len),
b3368382efe6e98 Mathias Nyman    2017-06-15  2905  		 le32_to_cpu(event->flags));
b3368382efe6e98 Mathias Nyman    2017-06-15  2906  	return -ENODEV;
d0e96f5a71a032c Sarah Sharp      2009-04-27  2907  }
d0e96f5a71a032c Sarah Sharp      2009-04-27  2908  

:::::: The code at line 2751 was first introduced by commit
:::::: 986a92d44810cad915279fdc942e2fd2c2857499 USB: xHCI: adds new cases to trb_comp_code switch

:::::: TO: Andiry Xu <andiry.xu@amd.com>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
