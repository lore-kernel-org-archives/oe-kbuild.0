Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6884299923
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Jul 2026 03:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784517982; cv=none; b=iQo1ogsXGaI+RyjxMJgwlgNdgA3GbVP2TKW1RwunyoLj0fW0KDY+Oxc738eX6VYnIHuzHWeKFuSHyKKjrJJIoMVCiKYnS+jv/7De2yHYzchW7ljras2haqDabr+uU2cSCMGe6wvrfDPW29vJZgXDNl4Vth20U066tJCarmarGDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784517982; c=relaxed/simple;
	bh=ivI4HczD5Em7B1Cbg+7XV0vVO92ZcWhGt3XxKpvZwOU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Xx87K5BbDYjnFRWg21S/o6a+swtoDCGyyqRy0cRCHKMpM1AdDFpchayH5+PpJulUzk5upz8gL4+4RTYCtHQogpT4cYEliZhjg/1577LQFsuEAHr0K67Ad82RgFloFxOiLCbQfn6ygsFYeOQEXm2OyPAsKyiUgFt5h5sSgebgYYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k6PO+U18; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k6PO+U18"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784517978; x=1816053978;
  h=date:from:to:cc:subject:message-id;
  bh=ivI4HczD5Em7B1Cbg+7XV0vVO92ZcWhGt3XxKpvZwOU=;
  b=k6PO+U181sEOP3pRwOCDD1xGHefPccAFaPVlDuyefcEvAiWzkyqRAJwx
   XG2jGB1y3wO/vTAGhHYTJM+pVjg5ky+j43UHrtfgbL79mEaS6MwdFRFHY
   V8vNUtgTx6LodMs9n8h0WIinak5GoFZNvEyXoQzuP70IRjZRkAyfEpG2r
   h5rnyxq7MnbDHWThdqx5j/DyRE3dn1QVqaPkEKinmiguLT67vE5hek9k2
   9jN013sjgyNOZibtlZM6i2JA3e+YPXFHX6ykYd06i+MsAk8kX+LKd3vst
   ugEn3Ecxrru77dFnd6nVQIVTx6LB7Eo0A7qQMw+/UlSJkPLsZNg02awEQ
   A==;
X-CSE-ConnectionGUID: 8ghLA8E4RcqQW3OHedIUQw==
X-CSE-MsgGUID: 3NiZ923KTPycrW/yyy4Mgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="85191224"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="85191224"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2026 20:26:18 -0700
X-CSE-ConnectionGUID: 9zQHr4xLSXmH/fLVLTlsJA==
X-CSE-MsgGUID: aPsseiYlQDuUjxElmygbQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="262302350"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 19 Jul 2026 20:26:14 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wledf-00000000VvZ-3tNI;
	Mon, 20 Jul 2026 03:26:00 +0000
Date: Mon, 20 Jul 2026 11:25:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-kiwi-6.1 193/193]
 drivers/usb/gadget/function/uvc_video.c:518 uvcg_video_pump() warn: can 'req'
 even be NULL?
Message-ID: <202607201118.T7eExmgV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   15bdff0dd01eed4ffc4ae138c5a611d8b102a4b6
commit: 82a411cec66480fa8acc14da04823eee581c1324 [193/193] FROMGIT: usb: gadget: uvc: Fix use-after-free for inflight usb_requests
:::::: branch date: 3 days ago
:::::: commit date: 2 years, 8 months ago
config: arm-randconfig-r073-20260717 (https://download.01.org/0day-ci/archive/20260720/202607201118.T7eExmgV-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5c0dfced1adc55429e32b1db08570abd3a219d85)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607201118.T7eExmgV-lkp@intel.com/

smatch warnings:
drivers/usb/gadget/function/uvc_video.c:518 uvcg_video_pump() warn: can 'req' even be NULL?

vim +/req +518 drivers/usb/gadget/function/uvc_video.c

cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  408  
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  409  /* --------------------------------------------------------------------------
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  410   * Video streaming
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  411   */
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  412  
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  413  /*
7ea95b110811fa drivers/usb/gadget/function/uvc_video.c Andrzej Pietrasiewicz 2014-09-09  414   * uvcg_video_pump - Pump video data into the USB requests
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  415   *
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  416   * This function fills the available USB requests (listed in req_free) with
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  417   * video data from the queued buffers.
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  418   */
43cd0023872efb drivers/usb/gadget/function/uvc_video.c Michael Grzeschik     2020-04-21  419  static void uvcg_video_pump(struct work_struct *work)
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  420  {
43cd0023872efb drivers/usb/gadget/function/uvc_video.c Michael Grzeschik     2020-04-21  421  	struct uvc_video *video = container_of(work, struct uvc_video, pump);
bd52b813a999e4 drivers/usb/gadget/function/uvc_video.c Michael Grzeschik     2014-08-08  422  	struct uvc_video_queue *queue = &video->queue;
defd93f219be7d drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-06-02  423  	/* video->max_payload_size is only set when using bulk transfer */
defd93f219be7d drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-06-02  424  	bool is_bulk = video->max_payload_size;
f9897ec0f6d34e drivers/usb/gadget/function/uvc_video.c Michael Grzeschik     2021-10-17  425  	struct usb_request *req = NULL;
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  426  	struct uvc_buffer *buf;
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  427  	unsigned long flags;
defd93f219be7d drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-06-02  428  	bool buf_done;
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  429  	int ret;
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  430  
82a411cec66480 drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-11-08  431  	while (true) {
82a411cec66480 drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-11-08  432  		if (!video->ep->enabled)
82a411cec66480 drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-11-08  433  			return;
82a411cec66480 drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-11-08  434  
c5d337a358b3e4 drivers/usb/gadget/function/uvc_video.c Laurent Pinchart      2022-06-08  435  		/*
82a411cec66480 drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-11-08  436  		 * Check is_enabled and retrieve the first available USB
82a411cec66480 drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-11-08  437  		 * request, protected by the request lock.
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  438  		 */
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  439  		spin_lock_irqsave(&video->req_lock, flags);
82a411cec66480 drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-11-08  440  		if (!video->is_enabled || list_empty(&video->req_free)) {
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  441  			spin_unlock_irqrestore(&video->req_lock, flags);
43cd0023872efb drivers/usb/gadget/function/uvc_video.c Michael Grzeschik     2020-04-21  442  			return;
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  443  		}
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  444  		req = list_first_entry(&video->req_free, struct usb_request,
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  445  					list);
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  446  		list_del(&req->list);
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  447  		spin_unlock_irqrestore(&video->req_lock, flags);
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  448  
c5d337a358b3e4 drivers/usb/gadget/function/uvc_video.c Laurent Pinchart      2022-06-08  449  		/*
c5d337a358b3e4 drivers/usb/gadget/function/uvc_video.c Laurent Pinchart      2022-06-08  450  		 * Retrieve the first available video buffer and fill the
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  451  		 * request, protected by the video queue irqlock.
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  452  		 */
6dd5b021bd6c73 drivers/usb/gadget/function/uvc_video.c Laurent Pinchart      2014-09-16  453  		spin_lock_irqsave(&queue->irqlock, flags);
6dd5b021bd6c73 drivers/usb/gadget/function/uvc_video.c Laurent Pinchart      2014-09-16  454  		buf = uvcg_queue_head(queue);
82a015300e003e drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-05-08  455  
82a015300e003e drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-05-08  456  		if (buf != NULL) {
82a015300e003e drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-05-08  457  			video->encode(req, video, buf);
defd93f219be7d drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-06-02  458  			buf_done = buf->state == UVC_BUF_STATE_DONE;
82a015300e003e drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-05-08  459  		} else if (!(queue->flags & UVC_QUEUE_DISCONNECTED) && !is_bulk) {
82a015300e003e drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-05-08  460  			/*
82a015300e003e drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-05-08  461  			 * No video buffer available; the queue is still connected and
defd93f219be7d drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-06-02  462  			 * we're transferring over ISOC. Queue a 0 length request to
82a015300e003e drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-05-08  463  			 * prevent missed ISOC transfers.
82a015300e003e drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-05-08  464  			 */
82a015300e003e drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-05-08  465  			req->length = 0;
defd93f219be7d drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-06-02  466  			buf_done = false;
82a015300e003e drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-05-08  467  		} else {
82a015300e003e drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-05-08  468  			/*
defd93f219be7d drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-06-02  469  			 * Either the queue has been disconnected or no video buffer
defd93f219be7d drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-06-02  470  			 * available for bulk transfer. Either way, stop processing
82a015300e003e drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-05-08  471  			 * further.
82a015300e003e drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-05-08  472  			 */
6dd5b021bd6c73 drivers/usb/gadget/function/uvc_video.c Laurent Pinchart      2014-09-16  473  			spin_unlock_irqrestore(&queue->irqlock, flags);
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  474  			break;
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  475  		}
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  476  
c5d337a358b3e4 drivers/usb/gadget/function/uvc_video.c Laurent Pinchart      2022-06-08  477  		/*
defd93f219be7d drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-06-02  478  		 * With USB3 handling more requests at a higher speed, we can't
defd93f219be7d drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-06-02  479  		 * afford to generate an interrupt for every request. Decide to
defd93f219be7d drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-06-02  480  		 * interrupt:
defd93f219be7d drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-06-02  481  		 *
defd93f219be7d drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-06-02  482  		 * - When no more requests are available in the free queue, as
defd93f219be7d drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-06-02  483  		 *   this may be our last chance to refill the endpoint's
defd93f219be7d drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-06-02  484  		 *   request queue.
defd93f219be7d drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-06-02  485  		 *
defd93f219be7d drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-06-02  486  		 * - When this is request is the last request for the video
defd93f219be7d drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-06-02  487  		 *   buffer, as we want to start sending the next video buffer
defd93f219be7d drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-06-02  488  		 *   ASAP in case it doesn't get started already in the next
defd93f219be7d drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-06-02  489  		 *   iteration of this loop.
defd93f219be7d drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-06-02  490  		 *
defd93f219be7d drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-06-02  491  		 * - Four times over the length of the requests queue (as
defd93f219be7d drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-06-02  492  		 *   indicated by video->uvc_num_requests), as a trade-off
defd93f219be7d drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-06-02  493  		 *   between latency and interrupt load.
c5d337a358b3e4 drivers/usb/gadget/function/uvc_video.c Laurent Pinchart      2022-06-08  494  		 */
defd93f219be7d drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-06-02  495  		if (list_empty(&video->req_free) || buf_done ||
fc78941d8169cb drivers/usb/gadget/function/uvc_video.c Michael Grzeschik     2021-06-28  496  		    !(video->req_int_count %
fc78941d8169cb drivers/usb/gadget/function/uvc_video.c Michael Grzeschik     2021-06-28  497  		       DIV_ROUND_UP(video->uvc_num_requests, 4))) {
fc78941d8169cb drivers/usb/gadget/function/uvc_video.c Michael Grzeschik     2021-06-28  498  			video->req_int_count = 0;
fc78941d8169cb drivers/usb/gadget/function/uvc_video.c Michael Grzeschik     2021-06-28  499  			req->no_interrupt = 0;
fc78941d8169cb drivers/usb/gadget/function/uvc_video.c Michael Grzeschik     2021-06-28  500  		} else {
fc78941d8169cb drivers/usb/gadget/function/uvc_video.c Michael Grzeschik     2021-06-28  501  			req->no_interrupt = 1;
fc78941d8169cb drivers/usb/gadget/function/uvc_video.c Michael Grzeschik     2021-06-28  502  		}
fc78941d8169cb drivers/usb/gadget/function/uvc_video.c Michael Grzeschik     2021-06-28  503  
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  504  		/* Queue the USB request */
9d1ff5dcb3cd33 drivers/usb/gadget/function/uvc_video.c Laurent Pinchart      2018-08-10  505  		ret = uvcg_video_ep_queue(video, req);
6dd5b021bd6c73 drivers/usb/gadget/function/uvc_video.c Laurent Pinchart      2014-09-16  506  		spin_unlock_irqrestore(&queue->irqlock, flags);
9d1ff5dcb3cd33 drivers/usb/gadget/function/uvc_video.c Laurent Pinchart      2018-08-10  507  
9d1ff5dcb3cd33 drivers/usb/gadget/function/uvc_video.c Laurent Pinchart      2018-08-10  508  		if (ret < 0) {
7ea95b110811fa drivers/usb/gadget/function/uvc_video.c Andrzej Pietrasiewicz 2014-09-09  509  			uvcg_queue_cancel(queue, 0);
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  510  			break;
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  511  		}
96163f835e65f8 drivers/usb/gadget/function/uvc_video.c Dan Vacura            2022-06-17  512  
96163f835e65f8 drivers/usb/gadget/function/uvc_video.c Dan Vacura            2022-06-17  513  		/* Endpoint now owns the request */
96163f835e65f8 drivers/usb/gadget/function/uvc_video.c Dan Vacura            2022-06-17  514  		req = NULL;
fc78941d8169cb drivers/usb/gadget/function/uvc_video.c Michael Grzeschik     2021-06-28  515  		video->req_int_count++;
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  516  	}
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  517  
f9897ec0f6d34e drivers/usb/gadget/function/uvc_video.c Michael Grzeschik     2021-10-17 @518  	if (!req)
f9897ec0f6d34e drivers/usb/gadget/function/uvc_video.c Michael Grzeschik     2021-10-17  519  		return;
f9897ec0f6d34e drivers/usb/gadget/function/uvc_video.c Michael Grzeschik     2021-10-17  520  
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  521  	spin_lock_irqsave(&video->req_lock, flags);
82a411cec66480 drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-11-08  522  	if (video->is_enabled)
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  523  		list_add_tail(&req->list, &video->req_free);
82a411cec66480 drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-11-08  524  	else
82a411cec66480 drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-11-08  525  		uvc_video_free_request(req->context, video->ep);
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  526  	spin_unlock_irqrestore(&video->req_lock, flags);
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  527  }
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  528  

:::::: The code at line 518 was first introduced by commit
:::::: f9897ec0f6d34e8b2bc2f4c8ab8789351090f3d2 usb: gadget: uvc: only pump video data if necessary

:::::: TO: Michael Grzeschik <m.grzeschik@pengutronix.de>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
