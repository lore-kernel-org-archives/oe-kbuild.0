Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31854374DE
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Sep 2023 14:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695133906; x=1726669906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A7UV+5zTYqBuqaTKslNo2XsP6xfdF2KjiwY/gGxKpA0=;
  b=Rx/osHzaRmFOT9YfS0DY7uDqVaDk4JRw+adMJpcuzRkzqVOo4y2qZ6n8
   n5+xbHpzCk4igcTUwkfg5pcS4YqF1dm8qDeJTs2scq9bvwZPsT0ywEI7r
   +XiN1rmEMBgYAxsy7sfojxvOc6oAYhG3XKCaEz+B/Xg8Ev4II0pWXVIre
   qZfmUDgNfAlpO+ZhaUFIpsvMDy5ghzogis+dI21/XxSJLuaHU9v3sX+cj
   eNYtdy5d6xfom9NomyUOplJn2LgkLAz/DOINa83p5M4BN3xVs0za782CK
   BjAtYPl+BfLTFTrgC0EZmz0cClI2tkhz/AI814x3XXeIKCvtBBGbSctyo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="466280466"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="466280466"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 07:31:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="919895100"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="919895100"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 19 Sep 2023 07:31:26 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qibl6-0007Su-00;
	Tue, 19 Sep 2023 14:31:24 +0000
Date: Tue, 19 Sep 2023 22:30:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [mnyman-xhci:for-usb-next 14/17]
 drivers/usb/host/xhci-ring.c:2751:27-34: ERROR: ep_ring is NULL but
 dereferenced.
Message-ID: <202309192204.61GOudSp-lkp@intel.com>
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
head:   6ab4aba518593dae889bc3c5299e229552a5b941
commit: 825c65fabc443ecf9682a4359396e7b00959bbd6 [14/17] xhci: simplify event ring dequeue tracking for transfer events
:::::: branch date: 6 hours ago
:::::: commit date: 8 days ago
config: x86_64-randconfig-101-20230919 (https://download.01.org/0day-ci/archive/20230919/202309192204.61GOudSp-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230919/202309192204.61GOudSp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202309192204.61GOudSp-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/usb/host/xhci-ring.c:2751:27-34: ERROR: ep_ring is NULL but dereferenced.

vim +2751 drivers/usb/host/xhci-ring.c

22405ed2e1bd8d Andiry Xu        2010-07-22  2535  
d0e96f5a71a032 Sarah Sharp      2009-04-27  2536  /*
d0e96f5a71a032 Sarah Sharp      2009-04-27  2537   * If this function returns an error condition, it means it got a Transfer
d0e96f5a71a032 Sarah Sharp      2009-04-27  2538   * event with a corrupted Slot ID, Endpoint ID, or TRB DMA address.
d0e96f5a71a032 Sarah Sharp      2009-04-27  2539   * At this point, the host controller is probably hosed and should be reset.
d0e96f5a71a032 Sarah Sharp      2009-04-27  2540   */
d0e96f5a71a032 Sarah Sharp      2009-04-27  2541  static int handle_tx_event(struct xhci_hcd *xhci,
b17a57f89f6906 Mathias Nyman    2023-02-02  2542  			   struct xhci_interrupter *ir,
d0e96f5a71a032 Sarah Sharp      2009-04-27  2543  			   struct xhci_transfer_event *event)
d0e96f5a71a032 Sarah Sharp      2009-04-27  2544  {
63a0d9abd18cdc Sarah Sharp      2009-09-04  2545  	struct xhci_virt_ep *ep;
d0e96f5a71a032 Sarah Sharp      2009-04-27  2546  	struct xhci_ring *ep_ring;
82d1009f537c2a Sarah Sharp      2009-08-07  2547  	unsigned int slot_id;
d0e96f5a71a032 Sarah Sharp      2009-04-27  2548  	int ep_index;
326b4810cc9952 Randy Dunlap     2010-04-19  2549  	struct xhci_td *td = NULL;
f97c08ae329bcf Mathias Nyman    2016-11-11  2550  	dma_addr_t ep_trb_dma;
f97c08ae329bcf Mathias Nyman    2016-11-11  2551  	struct xhci_segment *ep_seg;
f97c08ae329bcf Mathias Nyman    2016-11-11  2552  	union xhci_trb *ep_trb;
d0e96f5a71a032 Sarah Sharp      2009-04-27  2553  	int status = -EINPROGRESS;
d115b04818e57b John Youn        2009-07-27  2554  	struct xhci_ep_ctx *ep_ctx;
66d1eebce5cca9 Sarah Sharp      2009-08-27  2555  	u32 trb_comp_code;
c2d7b49f42f50d Andiry Xu        2011-09-19  2556  	int td_num = 0;
3b4739b8951d65 Mathias Nyman    2015-10-12  2557  	bool handling_skipped_tds = false;
d0e96f5a71a032 Sarah Sharp      2009-04-27  2558  
28ccd2962c6655 Matt Evans       2011-03-29  2559  	slot_id = TRB_TO_SLOT_ID(le32_to_cpu(event->flags));
b3368382efe6e9 Mathias Nyman    2017-06-15  2560  	ep_index = TRB_TO_EP_ID(le32_to_cpu(event->flags)) - 1;
b3368382efe6e9 Mathias Nyman    2017-06-15  2561  	trb_comp_code = GET_COMP_CODE(le32_to_cpu(event->transfer_len));
b3368382efe6e9 Mathias Nyman    2017-06-15  2562  	ep_trb_dma = le64_to_cpu(event->buffer);
b3368382efe6e9 Mathias Nyman    2017-06-15  2563  
b1adc42d440df3 Mathias Nyman    2021-01-29  2564  	ep = xhci_get_virt_ep(xhci, slot_id, ep_index);
b1adc42d440df3 Mathias Nyman    2021-01-29  2565  	if (!ep) {
b1adc42d440df3 Mathias Nyman    2021-01-29  2566  		xhci_err(xhci, "ERROR Invalid Transfer event\n");
b3368382efe6e9 Mathias Nyman    2017-06-15  2567  		goto err_out;
d0e96f5a71a032 Sarah Sharp      2009-04-27  2568  	}
d0e96f5a71a032 Sarah Sharp      2009-04-27  2569  
b3368382efe6e9 Mathias Nyman    2017-06-15  2570  	ep_ring = xhci_dma_to_transfer_ring(ep, ep_trb_dma);
b1adc42d440df3 Mathias Nyman    2021-01-29  2571  	ep_ctx = xhci_get_ep_ctx(xhci, ep->vdev->out_ctx, ep_index);
b3368382efe6e9 Mathias Nyman    2017-06-15  2572  
ade2e3a148a174 Mathias Nyman    2017-06-15  2573  	if (GET_EP_CTX_STATE(ep_ctx) == EP_STATE_DISABLED) {
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2574  		xhci_err(xhci,
ade2e3a148a174 Mathias Nyman    2017-06-15  2575  			 "ERROR Transfer event for disabled endpoint slot %u ep %u\n",
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2576  			  slot_id, ep_index);
b3368382efe6e9 Mathias Nyman    2017-06-15  2577  		goto err_out;
d0e96f5a71a032 Sarah Sharp      2009-04-27  2578  	}
d0e96f5a71a032 Sarah Sharp      2009-04-27  2579  
ade2e3a148a174 Mathias Nyman    2017-06-15  2580  	/* Some transfer events don't always point to a trb, see xhci 4.17.4 */
ade2e3a148a174 Mathias Nyman    2017-06-15  2581  	if (!ep_ring) {
ade2e3a148a174 Mathias Nyman    2017-06-15  2582  		switch (trb_comp_code) {
ade2e3a148a174 Mathias Nyman    2017-06-15  2583  		case COMP_STALL_ERROR:
ade2e3a148a174 Mathias Nyman    2017-06-15  2584  		case COMP_USB_TRANSACTION_ERROR:
ade2e3a148a174 Mathias Nyman    2017-06-15  2585  		case COMP_INVALID_STREAM_TYPE_ERROR:
ade2e3a148a174 Mathias Nyman    2017-06-15  2586  		case COMP_INVALID_STREAM_ID_ERROR:
a1575120972ecd Mathias Nyman    2022-11-30  2587  			xhci_dbg(xhci, "Stream transaction error ep %u no id\n",
a1575120972ecd Mathias Nyman    2022-11-30  2588  				 ep_index);
a1575120972ecd Mathias Nyman    2022-11-30  2589  			if (ep->err_count++ > MAX_SOFT_RETRY)
7428a253315cef Mathias Nyman    2022-11-30  2590  				xhci_handle_halted_endpoint(xhci, ep, NULL,
a1575120972ecd Mathias Nyman    2022-11-30  2591  							    EP_HARD_RESET);
a1575120972ecd Mathias Nyman    2022-11-30  2592  			else
7428a253315cef Mathias Nyman    2022-11-30  2593  				xhci_handle_halted_endpoint(xhci, ep, NULL,
d70f4231b81eeb Mathias Nyman    2021-01-29  2594  							    EP_SOFT_RESET);
ade2e3a148a174 Mathias Nyman    2017-06-15  2595  			goto cleanup;
ade2e3a148a174 Mathias Nyman    2017-06-15  2596  		case COMP_RING_UNDERRUN:
ade2e3a148a174 Mathias Nyman    2017-06-15  2597  		case COMP_RING_OVERRUN:
d9193efba84fe4 Sandeep Singh    2018-11-09  2598  		case COMP_STOPPED_LENGTH_INVALID:
ade2e3a148a174 Mathias Nyman    2017-06-15  2599  			goto cleanup;
ade2e3a148a174 Mathias Nyman    2017-06-15  2600  		default:
ade2e3a148a174 Mathias Nyman    2017-06-15  2601  			xhci_err(xhci, "ERROR Transfer event for unknown stream ring slot %u ep %u\n",
ade2e3a148a174 Mathias Nyman    2017-06-15  2602  				 slot_id, ep_index);
ade2e3a148a174 Mathias Nyman    2017-06-15  2603  			goto err_out;
ade2e3a148a174 Mathias Nyman    2017-06-15  2604  		}
ade2e3a148a174 Mathias Nyman    2017-06-15  2605  	}
ade2e3a148a174 Mathias Nyman    2017-06-15  2606  
c2d7b49f42f50d Andiry Xu        2011-09-19  2607  	/* Count current td numbers if ep->skip is set */
5220cb493bf418 Andy Shevchenko  2022-11-30  2608  	if (ep->skip)
5220cb493bf418 Andy Shevchenko  2022-11-30  2609  		td_num += list_count_nodes(&ep_ring->td_list);
c2d7b49f42f50d Andiry Xu        2011-09-19  2610  
986a92d44810ca Andiry Xu        2010-07-22  2611  	/* Look for common error cases */
66d1eebce5cca9 Sarah Sharp      2009-08-27  2612  	switch (trb_comp_code) {
b10de142119a67 Sarah Sharp      2009-04-27  2613  	/* Skip codes that require special handling depending on
b10de142119a67 Sarah Sharp      2009-04-27  2614  	 * transfer type
b10de142119a67 Sarah Sharp      2009-04-27  2615  	 */
b10de142119a67 Sarah Sharp      2009-04-27  2616  	case COMP_SUCCESS:
1c11a172cb3049 Vivek Gautam     2013-03-21  2617  		if (EVENT_TRB_LEN(le32_to_cpu(event->transfer_len)) == 0)
1530bbc6272d9d Sarah Sharp      2012-05-08  2618  			break;
7ff11162808cc2 Mathias Nyman    2019-12-11  2619  		if (xhci->quirks & XHCI_TRUST_TX_LENGTH ||
7ff11162808cc2 Mathias Nyman    2019-12-11  2620  		    ep_ring->last_td_was_short)
0b7c105a04ca79 Felipe Balbi     2017-01-23  2621  			trb_comp_code = COMP_SHORT_PACKET;
1530bbc6272d9d Sarah Sharp      2012-05-08  2622  		else
8202ce2e292194 Sarah Sharp      2012-07-25  2623  			xhci_warn_ratelimited(xhci,
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2624  					      "WARN Successful completion on short TX for slot %u ep %u: needs XHCI_TRUST_TX_LENGTH quirk?\n",
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2625  					      slot_id, ep_index);
1d6903a617a221 Nick Desaulniers 2020-11-10  2626  		break;
0b7c105a04ca79 Felipe Balbi     2017-01-23  2627  	case COMP_SHORT_PACKET:
b10de142119a67 Sarah Sharp      2009-04-27  2628  		break;
b3368382efe6e9 Mathias Nyman    2017-06-15  2629  	/* Completion codes for endpoint stopped state */
0b7c105a04ca79 Felipe Balbi     2017-01-23  2630  	case COMP_STOPPED:
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2631  		xhci_dbg(xhci, "Stopped on Transfer TRB for slot %u ep %u\n",
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2632  			 slot_id, ep_index);
ae636747146ea9 Sarah Sharp      2009-04-29  2633  		break;
0b7c105a04ca79 Felipe Balbi     2017-01-23  2634  	case COMP_STOPPED_LENGTH_INVALID:
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2635  		xhci_dbg(xhci,
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2636  			 "Stopped on No-op or Link TRB for slot %u ep %u\n",
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2637  			 slot_id, ep_index);
ae636747146ea9 Sarah Sharp      2009-04-29  2638  		break;
0b7c105a04ca79 Felipe Balbi     2017-01-23  2639  	case COMP_STOPPED_SHORT_PACKET:
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2640  		xhci_dbg(xhci,
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2641  			 "Stopped with short packet transfer detected for slot %u ep %u\n",
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2642  			 slot_id, ep_index);
40a3b775f49c27 Lu Baolu         2015-08-06  2643  		break;
b3368382efe6e9 Mathias Nyman    2017-06-15  2644  	/* Completion codes for endpoint halted state */
0b7c105a04ca79 Felipe Balbi     2017-01-23  2645  	case COMP_STALL_ERROR:
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2646  		xhci_dbg(xhci, "Stalled endpoint for slot %u ep %u\n", slot_id,
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2647  			 ep_index);
b10de142119a67 Sarah Sharp      2009-04-27  2648  		status = -EPIPE;
b10de142119a67 Sarah Sharp      2009-04-27  2649  		break;
0b7c105a04ca79 Felipe Balbi     2017-01-23  2650  	case COMP_SPLIT_TRANSACTION_ERROR:
76eac5d21a7164 Mathias Nyman    2020-03-12  2651  		xhci_dbg(xhci, "Split transaction error for slot %u ep %u\n",
76eac5d21a7164 Mathias Nyman    2020-03-12  2652  			 slot_id, ep_index);
76eac5d21a7164 Mathias Nyman    2020-03-12  2653  		status = -EPROTO;
76eac5d21a7164 Mathias Nyman    2020-03-12  2654  		break;
0b7c105a04ca79 Felipe Balbi     2017-01-23  2655  	case COMP_USB_TRANSACTION_ERROR:
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2656  		xhci_dbg(xhci, "Transfer error for slot %u ep %u on endpoint\n",
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2657  			 slot_id, ep_index);
b10de142119a67 Sarah Sharp      2009-04-27  2658  		status = -EPROTO;
b10de142119a67 Sarah Sharp      2009-04-27  2659  		break;
0b7c105a04ca79 Felipe Balbi     2017-01-23  2660  	case COMP_BABBLE_DETECTED_ERROR:
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2661  		xhci_dbg(xhci, "Babble error for slot %u ep %u on endpoint\n",
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2662  			 slot_id, ep_index);
4a73143ced4678 Sarah Sharp      2009-07-27  2663  		status = -EOVERFLOW;
4a73143ced4678 Sarah Sharp      2009-07-27  2664  		break;
b3368382efe6e9 Mathias Nyman    2017-06-15  2665  	/* Completion codes for endpoint error state */
b3368382efe6e9 Mathias Nyman    2017-06-15  2666  	case COMP_TRB_ERROR:
b3368382efe6e9 Mathias Nyman    2017-06-15  2667  		xhci_warn(xhci,
b3368382efe6e9 Mathias Nyman    2017-06-15  2668  			  "WARN: TRB error for slot %u ep %u on endpoint\n",
b3368382efe6e9 Mathias Nyman    2017-06-15  2669  			  slot_id, ep_index);
b3368382efe6e9 Mathias Nyman    2017-06-15  2670  		status = -EILSEQ;
b3368382efe6e9 Mathias Nyman    2017-06-15  2671  		break;
b3368382efe6e9 Mathias Nyman    2017-06-15  2672  	/* completion codes not indicating endpoint state change */
0b7c105a04ca79 Felipe Balbi     2017-01-23  2673  	case COMP_DATA_BUFFER_ERROR:
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2674  		xhci_warn(xhci,
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2675  			  "WARN: HC couldn't access mem fast enough for slot %u ep %u\n",
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2676  			  slot_id, ep_index);
b10de142119a67 Sarah Sharp      2009-04-27  2677  		status = -ENOSR;
b10de142119a67 Sarah Sharp      2009-04-27  2678  		break;
0b7c105a04ca79 Felipe Balbi     2017-01-23  2679  	case COMP_BANDWIDTH_OVERRUN_ERROR:
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2680  		xhci_warn(xhci,
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2681  			  "WARN: bandwidth overrun event for slot %u ep %u on endpoint\n",
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2682  			  slot_id, ep_index);
986a92d44810ca Andiry Xu        2010-07-22  2683  		break;
0b7c105a04ca79 Felipe Balbi     2017-01-23  2684  	case COMP_ISOCH_BUFFER_OVERRUN:
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2685  		xhci_warn(xhci,
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2686  			  "WARN: buffer overrun event for slot %u ep %u on endpoint",
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2687  			  slot_id, ep_index);
986a92d44810ca Andiry Xu        2010-07-22  2688  		break;
0b7c105a04ca79 Felipe Balbi     2017-01-23  2689  	case COMP_RING_UNDERRUN:
986a92d44810ca Andiry Xu        2010-07-22  2690  		/*
986a92d44810ca Andiry Xu        2010-07-22  2691  		 * When the Isoch ring is empty, the xHC will generate
986a92d44810ca Andiry Xu        2010-07-22  2692  		 * a Ring Overrun Event for IN Isoch endpoint or Ring
986a92d44810ca Andiry Xu        2010-07-22  2693  		 * Underrun Event for OUT Isoch endpoint.
986a92d44810ca Andiry Xu        2010-07-22  2694  		 */
986a92d44810ca Andiry Xu        2010-07-22  2695  		xhci_dbg(xhci, "underrun event on endpoint\n");
986a92d44810ca Andiry Xu        2010-07-22  2696  		if (!list_empty(&ep_ring->td_list))
986a92d44810ca Andiry Xu        2010-07-22  2697  			xhci_dbg(xhci, "Underrun Event for slot %d ep %d "
986a92d44810ca Andiry Xu        2010-07-22  2698  					"still with TDs queued?\n",
28ccd2962c6655 Matt Evans       2011-03-29  2699  				 TRB_TO_SLOT_ID(le32_to_cpu(event->flags)),
28ccd2962c6655 Matt Evans       2011-03-29  2700  				 ep_index);
986a92d44810ca Andiry Xu        2010-07-22  2701  		goto cleanup;
0b7c105a04ca79 Felipe Balbi     2017-01-23  2702  	case COMP_RING_OVERRUN:
986a92d44810ca Andiry Xu        2010-07-22  2703  		xhci_dbg(xhci, "overrun event on endpoint\n");
986a92d44810ca Andiry Xu        2010-07-22  2704  		if (!list_empty(&ep_ring->td_list))
986a92d44810ca Andiry Xu        2010-07-22  2705  			xhci_dbg(xhci, "Overrun Event for slot %d ep %d "
986a92d44810ca Andiry Xu        2010-07-22  2706  					"still with TDs queued?\n",
28ccd2962c6655 Matt Evans       2011-03-29  2707  				 TRB_TO_SLOT_ID(le32_to_cpu(event->flags)),
28ccd2962c6655 Matt Evans       2011-03-29  2708  				 ep_index);
986a92d44810ca Andiry Xu        2010-07-22  2709  		goto cleanup;
0b7c105a04ca79 Felipe Balbi     2017-01-23  2710  	case COMP_MISSED_SERVICE_ERROR:
d18240db797ed7 Andiry Xu        2010-07-22  2711  		/*
d18240db797ed7 Andiry Xu        2010-07-22  2712  		 * When encounter missed service error, one or more isoc tds
d18240db797ed7 Andiry Xu        2010-07-22  2713  		 * may be missed by xHC.
d18240db797ed7 Andiry Xu        2010-07-22  2714  		 * Set skip flag of the ep_ring; Complete the missed tds as
d18240db797ed7 Andiry Xu        2010-07-22  2715  		 * short transfer when process the ep_ring next time.
d18240db797ed7 Andiry Xu        2010-07-22  2716  		 */
d18240db797ed7 Andiry Xu        2010-07-22  2717  		ep->skip = true;
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2718  		xhci_dbg(xhci,
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2719  			 "Miss service interval error for slot %u ep %u, set skip flag\n",
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2720  			 slot_id, ep_index);
d18240db797ed7 Andiry Xu        2010-07-22  2721  		goto cleanup;
0b7c105a04ca79 Felipe Balbi     2017-01-23  2722  	case COMP_NO_PING_RESPONSE_ERROR:
3b4739b8951d65 Mathias Nyman    2015-10-12  2723  		ep->skip = true;
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2724  		xhci_dbg(xhci,
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2725  			 "No Ping response error for slot %u ep %u, Skip one Isoc TD\n",
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2726  			 slot_id, ep_index);
3b4739b8951d65 Mathias Nyman    2015-10-12  2727  		goto cleanup;
b3368382efe6e9 Mathias Nyman    2017-06-15  2728  
b3368382efe6e9 Mathias Nyman    2017-06-15  2729  	case COMP_INCOMPATIBLE_DEVICE_ERROR:
b3368382efe6e9 Mathias Nyman    2017-06-15  2730  		/* needs disable slot command to recover */
b3368382efe6e9 Mathias Nyman    2017-06-15  2731  		xhci_warn(xhci,
b3368382efe6e9 Mathias Nyman    2017-06-15  2732  			  "WARN: detect an incompatible device for slot %u ep %u",
b3368382efe6e9 Mathias Nyman    2017-06-15  2733  			  slot_id, ep_index);
b3368382efe6e9 Mathias Nyman    2017-06-15  2734  		status = -EPROTO;
b3368382efe6e9 Mathias Nyman    2017-06-15  2735  		break;
b10de142119a67 Sarah Sharp      2009-04-27  2736  	default:
b45b5069112470 Sarah Sharp      2009-12-09  2737  		if (xhci_is_vendor_info_code(xhci, trb_comp_code)) {
5ad6a529c28db3 Sarah Sharp      2009-11-11  2738  			status = 0;
5ad6a529c28db3 Sarah Sharp      2009-11-11  2739  			break;
5ad6a529c28db3 Sarah Sharp      2009-11-11  2740  		}
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2741  		xhci_warn(xhci,
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2742  			  "ERROR Unknown event condition %u for slot %u ep %u , HC probably busted\n",
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2743  			  trb_comp_code, slot_id, ep_index);
986a92d44810ca Andiry Xu        2010-07-22  2744  		goto cleanup;
986a92d44810ca Andiry Xu        2010-07-22  2745  	}
986a92d44810ca Andiry Xu        2010-07-22  2746  
d18240db797ed7 Andiry Xu        2010-07-22  2747  	do {
d18240db797ed7 Andiry Xu        2010-07-22  2748  		/* This TRB should be in the TD at the head of this ring's
d18240db797ed7 Andiry Xu        2010-07-22  2749  		 * TD list.
d18240db797ed7 Andiry Xu        2010-07-22  2750  		 */
986a92d44810ca Andiry Xu        2010-07-22 @2751  		if (list_empty(&ep_ring->td_list)) {
a83d6755814e46 Sarah Sharp      2013-03-18  2752  			/*
e4ec40ec4b260e Mathias Nyman    2017-12-01  2753  			 * Don't print wanings if it's due to a stopped endpoint
e4ec40ec4b260e Mathias Nyman    2017-12-01  2754  			 * generating an extra completion event if the device
e4ec40ec4b260e Mathias Nyman    2017-12-01  2755  			 * was suspended. Or, a event for the last TRB of a
e4ec40ec4b260e Mathias Nyman    2017-12-01  2756  			 * short TD we already got a short event for.
e4ec40ec4b260e Mathias Nyman    2017-12-01  2757  			 * The short TD is already removed from the TD list.
a83d6755814e46 Sarah Sharp      2013-03-18  2758  			 */
e4ec40ec4b260e Mathias Nyman    2017-12-01  2759  
0b7c105a04ca79 Felipe Balbi     2017-01-23  2760  			if (!(trb_comp_code == COMP_STOPPED ||
e4ec40ec4b260e Mathias Nyman    2017-12-01  2761  			      trb_comp_code == COMP_STOPPED_LENGTH_INVALID ||
e4ec40ec4b260e Mathias Nyman    2017-12-01  2762  			      ep_ring->last_td_was_short)) {
a83d6755814e46 Sarah Sharp      2013-03-18  2763  				xhci_warn(xhci, "WARN Event TRB for slot %d ep %d with no TDs queued?\n",
28ccd2962c6655 Matt Evans       2011-03-29  2764  						TRB_TO_SLOT_ID(le32_to_cpu(event->flags)),
28ccd2962c6655 Matt Evans       2011-03-29  2765  						ep_index);
a83d6755814e46 Sarah Sharp      2013-03-18  2766  			}
d18240db797ed7 Andiry Xu        2010-07-22  2767  			if (ep->skip) {
d18240db797ed7 Andiry Xu        2010-07-22  2768  				ep->skip = false;
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2769  				xhci_dbg(xhci, "td_list is empty while skip flag set. Clear skip flag for slot %u ep %u.\n",
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2770  					 slot_id, ep_index);
d18240db797ed7 Andiry Xu        2010-07-22  2771  			}
93ceaa808e8def Mathias Nyman    2020-04-21  2772  			if (trb_comp_code == COMP_STALL_ERROR ||
93ceaa808e8def Mathias Nyman    2020-04-21  2773  			    xhci_requires_manual_halt_cleanup(xhci, ep_ctx,
93ceaa808e8def Mathias Nyman    2020-04-21  2774  							      trb_comp_code)) {
7428a253315cef Mathias Nyman    2022-11-30  2775  				xhci_handle_halted_endpoint(xhci, ep, NULL,
93ceaa808e8def Mathias Nyman    2020-04-21  2776  							    EP_HARD_RESET);
93ceaa808e8def Mathias Nyman    2020-04-21  2777  			}
b10de142119a67 Sarah Sharp      2009-04-27  2778  			goto cleanup;
b10de142119a67 Sarah Sharp      2009-04-27  2779  		}
986a92d44810ca Andiry Xu        2010-07-22  2780  
c2d7b49f42f50d Andiry Xu        2011-09-19  2781  		/* We've skipped all the TDs on the ep ring when ep->skip set */
c2d7b49f42f50d Andiry Xu        2011-09-19  2782  		if (ep->skip && td_num == 0) {
c2d7b49f42f50d Andiry Xu        2011-09-19  2783  			ep->skip = false;
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2784  			xhci_dbg(xhci, "All tds on the ep_ring skipped. Clear skip flag for slot %u ep %u.\n",
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2785  				 slot_id, ep_index);
c2d7b49f42f50d Andiry Xu        2011-09-19  2786  			goto cleanup;
c2d7b49f42f50d Andiry Xu        2011-09-19  2787  		}
c2d7b49f42f50d Andiry Xu        2011-09-19  2788  
04861f83367eaa Felipe Balbi     2017-01-23  2789  		td = list_first_entry(&ep_ring->td_list, struct xhci_td,
04861f83367eaa Felipe Balbi     2017-01-23  2790  				      td_list);
c2d7b49f42f50d Andiry Xu        2011-09-19  2791  		if (ep->skip)
c2d7b49f42f50d Andiry Xu        2011-09-19  2792  			td_num--;
926008c9386dde Dmitry Torokhov  2011-03-23  2793  
986a92d44810ca Andiry Xu        2010-07-22  2794  		/* Is this a TRB in the currently executing TD? */
f97c08ae329bcf Mathias Nyman    2016-11-11  2795  		ep_seg = trb_in_td(xhci, ep_ring->deq_seg, ep_ring->dequeue,
f97c08ae329bcf Mathias Nyman    2016-11-11  2796  				td->last_trb, ep_trb_dma, false);
e1cf486d881d85 Alex He          2011-06-03  2797  
e1cf486d881d85 Alex He          2011-06-03  2798  		/*
e1cf486d881d85 Alex He          2011-06-03  2799  		 * Skip the Force Stopped Event. The event_trb(event_dma) of FSE
e1cf486d881d85 Alex He          2011-06-03  2800  		 * is not in the current TD pointed by ep_ring->dequeue because
e1cf486d881d85 Alex He          2011-06-03  2801  		 * that the hardware dequeue pointer still at the previous TRB
e1cf486d881d85 Alex He          2011-06-03  2802  		 * of the current TD. The previous TRB maybe a Link TD or the
e1cf486d881d85 Alex He          2011-06-03  2803  		 * last TRB of the previous TD. The command completion handle
e1cf486d881d85 Alex He          2011-06-03  2804  		 * will take care the rest.
e1cf486d881d85 Alex He          2011-06-03  2805  		 */
0b7c105a04ca79 Felipe Balbi     2017-01-23  2806  		if (!ep_seg && (trb_comp_code == COMP_STOPPED ||
0b7c105a04ca79 Felipe Balbi     2017-01-23  2807  			   trb_comp_code == COMP_STOPPED_LENGTH_INVALID)) {
e1cf486d881d85 Alex He          2011-06-03  2808  			goto cleanup;
e1cf486d881d85 Alex He          2011-06-03  2809  		}
e1cf486d881d85 Alex He          2011-06-03  2810  
f97c08ae329bcf Mathias Nyman    2016-11-11  2811  		if (!ep_seg) {
926008c9386dde Dmitry Torokhov  2011-03-23  2812  			if (!ep->skip ||
926008c9386dde Dmitry Torokhov  2011-03-23  2813  			    !usb_endpoint_xfer_isoc(&td->urb->ep->desc)) {
ad808333d8201d Sarah Sharp      2011-05-25  2814  				/* Some host controllers give a spurious
ad808333d8201d Sarah Sharp      2011-05-25  2815  				 * successful event after a short transfer.
ad808333d8201d Sarah Sharp      2011-05-25  2816  				 * Ignore it.
ad808333d8201d Sarah Sharp      2011-05-25  2817  				 */
ad808333d8201d Sarah Sharp      2011-05-25  2818  				if ((xhci->quirks & XHCI_SPURIOUS_SUCCESS) &&
ad808333d8201d Sarah Sharp      2011-05-25  2819  						ep_ring->last_td_was_short) {
ad808333d8201d Sarah Sharp      2011-05-25  2820  					ep_ring->last_td_was_short = false;
ad808333d8201d Sarah Sharp      2011-05-25  2821  					goto cleanup;
ad808333d8201d Sarah Sharp      2011-05-25  2822  				}
986a92d44810ca Andiry Xu        2010-07-22  2823  				/* HC is busted, give up! */
926008c9386dde Dmitry Torokhov  2011-03-23  2824  				xhci_err(xhci,
926008c9386dde Dmitry Torokhov  2011-03-23  2825  					"ERROR Transfer event TRB DMA ptr not "
cffb9be80f8a6d Hans de Goede    2014-08-20  2826  					"part of current TD ep_index %d "
cffb9be80f8a6d Hans de Goede    2014-08-20  2827  					"comp_code %u\n", ep_index,
cffb9be80f8a6d Hans de Goede    2014-08-20  2828  					trb_comp_code);
cffb9be80f8a6d Hans de Goede    2014-08-20  2829  				trb_in_td(xhci, ep_ring->deq_seg,
cffb9be80f8a6d Hans de Goede    2014-08-20  2830  					  ep_ring->dequeue, td->last_trb,
f97c08ae329bcf Mathias Nyman    2016-11-11  2831  					  ep_trb_dma, true);
986a92d44810ca Andiry Xu        2010-07-22  2832  				return -ESHUTDOWN;
986a92d44810ca Andiry Xu        2010-07-22  2833  			}
986a92d44810ca Andiry Xu        2010-07-22  2834  
a6ccd1fd4bd4fc Mathias Nyman    2021-01-29  2835  			skip_isoc_td(xhci, td, ep, status);
926008c9386dde Dmitry Torokhov  2011-03-23  2836  			goto cleanup;
926008c9386dde Dmitry Torokhov  2011-03-23  2837  		}
0b7c105a04ca79 Felipe Balbi     2017-01-23  2838  		if (trb_comp_code == COMP_SHORT_PACKET)
ad808333d8201d Sarah Sharp      2011-05-25  2839  			ep_ring->last_td_was_short = true;
ad808333d8201d Sarah Sharp      2011-05-25  2840  		else
ad808333d8201d Sarah Sharp      2011-05-25  2841  			ep_ring->last_td_was_short = false;
926008c9386dde Dmitry Torokhov  2011-03-23  2842  
926008c9386dde Dmitry Torokhov  2011-03-23  2843  		if (ep->skip) {
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2844  			xhci_dbg(xhci,
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2845  				 "Found td. Clear skip flag for slot %u ep %u.\n",
b7f769ae1b1260 Zhengjun Xing    2017-04-07  2846  				 slot_id, ep_index);
926008c9386dde Dmitry Torokhov  2011-03-23  2847  			ep->skip = false;
926008c9386dde Dmitry Torokhov  2011-03-23  2848  		}
926008c9386dde Dmitry Torokhov  2011-03-23  2849  
f97c08ae329bcf Mathias Nyman    2016-11-11  2850  		ep_trb = &ep_seg->trbs[(ep_trb_dma - ep_seg->dma) /
f97c08ae329bcf Mathias Nyman    2016-11-11  2851  						sizeof(*ep_trb)];
a37c3f76e6a6b5 Felipe Balbi     2017-01-23  2852  
a37c3f76e6a6b5 Felipe Balbi     2017-01-23  2853  		trace_xhci_handle_transfer(ep_ring,
a37c3f76e6a6b5 Felipe Balbi     2017-01-23  2854  				(struct xhci_generic_trb *) ep_trb);
a37c3f76e6a6b5 Felipe Balbi     2017-01-23  2855  
d18240db797ed7 Andiry Xu        2010-07-22  2856  		/*
810a624bd1b64b Lu Baolu         2017-10-06  2857  		 * No-op TRB could trigger interrupts in a case where
810a624bd1b64b Lu Baolu         2017-10-06  2858  		 * a URB was killed and a STALL_ERROR happens right
810a624bd1b64b Lu Baolu         2017-10-06  2859  		 * after the endpoint ring stopped. Reset the halted
810a624bd1b64b Lu Baolu         2017-10-06  2860  		 * endpoint. Otherwise, the endpoint remains stalled
810a624bd1b64b Lu Baolu         2017-10-06  2861  		 * indefinitely.
d18240db797ed7 Andiry Xu        2010-07-22  2862  		 */
a6ccd1fd4bd4fc Mathias Nyman    2021-01-29  2863  
f97c08ae329bcf Mathias Nyman    2016-11-11  2864  		if (trb_is_noop(ep_trb)) {
810a624bd1b64b Lu Baolu         2017-10-06  2865  			if (trb_comp_code == COMP_STALL_ERROR ||
810a624bd1b64b Lu Baolu         2017-10-06  2866  			    xhci_requires_manual_halt_cleanup(xhci, ep_ctx,
810a624bd1b64b Lu Baolu         2017-10-06  2867  							      trb_comp_code))
7428a253315cef Mathias Nyman    2022-11-30  2868  				xhci_handle_halted_endpoint(xhci, ep, td,
7428a253315cef Mathias Nyman    2022-11-30  2869  							    EP_HARD_RESET);
d18240db797ed7 Andiry Xu        2010-07-22  2870  			goto cleanup;
d18240db797ed7 Andiry Xu        2010-07-22  2871  		}
d18240db797ed7 Andiry Xu        2010-07-22  2872  
a6ccd1fd4bd4fc Mathias Nyman    2021-01-29  2873  		td->status = status;
a6ccd1fd4bd4fc Mathias Nyman    2021-01-29  2874  
0c03d89d0c7172 Mathias Nyman    2016-11-11  2875  		/* update the urb's actual_length and give back to the core */
22405ed2e1bd8d Andiry Xu        2010-07-22  2876  		if (usb_endpoint_xfer_control(&td->urb->ep->desc))
e9fcb07704fcef Mathias Nyman    2021-04-06  2877  			process_ctrl_td(xhci, ep, ep_ring, td, ep_trb, event);
04e51901dd44f4 Andiry Xu        2010-07-22  2878  		else if (usb_endpoint_xfer_isoc(&td->urb->ep->desc))
e9fcb07704fcef Mathias Nyman    2021-04-06  2879  			process_isoc_td(xhci, ep, ep_ring, td, ep_trb, event);
2f697f6cbff155 Sarah Sharp      2009-08-28  2880  		else
e9fcb07704fcef Mathias Nyman    2021-04-06  2881  			process_bulk_intr_td(xhci, ep, ep_ring, td, ep_trb, event);
4422da61550b2f Andiry Xu        2010-07-22  2882  cleanup:
3b4739b8951d65 Mathias Nyman    2015-10-12  2883  		handling_skipped_tds = ep->skip &&
0b7c105a04ca79 Felipe Balbi     2017-01-23  2884  			trb_comp_code != COMP_MISSED_SERVICE_ERROR &&
0b7c105a04ca79 Felipe Balbi     2017-01-23  2885  			trb_comp_code != COMP_NO_PING_RESPONSE_ERROR;
3b4739b8951d65 Mathias Nyman    2015-10-12  2886  
d18240db797ed7 Andiry Xu        2010-07-22  2887  	/*
d18240db797ed7 Andiry Xu        2010-07-22  2888  	 * If ep->skip is set, it means there are missed tds on the
d18240db797ed7 Andiry Xu        2010-07-22  2889  	 * endpoint ring need to take care of.
d18240db797ed7 Andiry Xu        2010-07-22  2890  	 * Process them as short transfer until reach the td pointed by
d18240db797ed7 Andiry Xu        2010-07-22  2891  	 * the event.
d18240db797ed7 Andiry Xu        2010-07-22  2892  	 */
3b4739b8951d65 Mathias Nyman    2015-10-12  2893  	} while (handling_skipped_tds);
d18240db797ed7 Andiry Xu        2010-07-22  2894  
d0e96f5a71a032 Sarah Sharp      2009-04-27  2895  	return 0;
b3368382efe6e9 Mathias Nyman    2017-06-15  2896  
b3368382efe6e9 Mathias Nyman    2017-06-15  2897  err_out:
b3368382efe6e9 Mathias Nyman    2017-06-15  2898  	xhci_err(xhci, "@%016llx %08x %08x %08x %08x\n",
b3368382efe6e9 Mathias Nyman    2017-06-15  2899  		 (unsigned long long) xhci_trb_virt_to_dma(
b17a57f89f6906 Mathias Nyman    2023-02-02  2900  			 ir->event_ring->deq_seg,
b17a57f89f6906 Mathias Nyman    2023-02-02  2901  			 ir->event_ring->dequeue),
b3368382efe6e9 Mathias Nyman    2017-06-15  2902  		 lower_32_bits(le64_to_cpu(event->buffer)),
b3368382efe6e9 Mathias Nyman    2017-06-15  2903  		 upper_32_bits(le64_to_cpu(event->buffer)),
b3368382efe6e9 Mathias Nyman    2017-06-15  2904  		 le32_to_cpu(event->transfer_len),
b3368382efe6e9 Mathias Nyman    2017-06-15  2905  		 le32_to_cpu(event->flags));
b3368382efe6e9 Mathias Nyman    2017-06-15  2906  	return -ENODEV;
d0e96f5a71a032 Sarah Sharp      2009-04-27  2907  }
d0e96f5a71a032 Sarah Sharp      2009-04-27  2908  

:::::: The code at line 2751 was first introduced by commit
:::::: 986a92d44810cad915279fdc942e2fd2c2857499 USB: xHCI: adds new cases to trb_comp_code switch

:::::: TO: Andiry Xu <andiry.xu@amd.com>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
