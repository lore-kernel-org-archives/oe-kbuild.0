Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BDD15B963
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Sep 2024 06:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727420304; cv=none; b=QkPSKzbULLuu26FHqnLX/6ZoujT9Ovbiz/TQSHoFshazsRXz+aYFod77hp6aVuScQwHG1v4sk9LX7vvuU1Xchpb03Fv/Fll6O2EwgyCwhFccEz8MW6WC77BYDcA7GEAj6d2HLqn7qZTIxs+VgqYS9nnEOFZMcLWXjiedizq+lEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727420304; c=relaxed/simple;
	bh=vHCjNjjfXjG1kJ2SRd3jySBEXZV2BWR2IrefEoC7EMI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C0uqB1fWaRyRDuyMgfg+N6wHvhOSbI8WpoVyMwrqAagnrROCts9+d5B7MHZoUqAaRE860mrKA0EhRVgyxaBzwZ6mOQnGP30PqddiEYcc46jAeezYcqOThzndd9Y2Wq7EXhrpKR8s7yXLEE6ZyQLoNkhISB2x53zGvMEwjpHXP8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ApyTkVqh; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ApyTkVqh"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37ccc597b96so1297436f8f.3
        for <oe-kbuild@lists.linux.dev>; Thu, 26 Sep 2024 23:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727420300; x=1728025100; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=528yfzq9QIaWWK0275jKpiZVS4g0G4WRmNeKwRTfPQc=;
        b=ApyTkVqhWs35/2ZV/jnpQKi+Ua6yEhcYMNV1F04qEpT3OUlgskvTBwqeW57eULFxpB
         RijPKgHrzBCL7qBw5Iw47LPuw+00rxZ6nvV7t+2CW401memBtIA+BIhxr8rSSZWAOMrX
         SR9LKhvbjaLOS8rWu0Km9jRIBfDYR/DxYZlanhRuj//xTvCssAW7vCklQWApaNTKzyW0
         L0xPK3AkigJdEEk0KyFxnkFaz9FYyO291kudF+wjpbsMQR/h0kFTPDhrrtK7MeJ8qoMa
         ZycC4FVpphZ9xPaewMLJgc5MdbBVh8nuwyA1g+7jKybg1baDg4iEnYEaGxm1rUOTHCt+
         A3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727420300; x=1728025100;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=528yfzq9QIaWWK0275jKpiZVS4g0G4WRmNeKwRTfPQc=;
        b=ZsLevIJLvWqCsKe0LMsjiWI7HjDVJVTn7iMI7N1KSSQuXBOyqsjRReNu2DEPaDfEVM
         xNOTp2PQvXTVV0h61Bsrw9DDN0smYfxrfpg9MpQn6dXOjVYboHnE880p+rh3gpsQQbj3
         qzmbDOFva+4AdLUOGEJSrYH26lgVx9FmNnx+Fia6kEMc6e+D9yzREY5luLERR9P27RV+
         i7Igf0CZIbwkp8pieU3/thcejdvKGSfq6Kxi/9DeQ73EgBecgnBVpfILIwWfkrAxFRTa
         lOxDWmdhMOP4F1FkAYaSO+k8v1ozlrqbAsjolhokbFzxZs2F98C9wMHcwWVwRAKWTmXl
         mpVQ==
X-Gm-Message-State: AOJu0YyJ0k+AckjMMJL0a2wjVstdOJI7aSHj8MsWC5N4hvhLyW8g6i5N
	/OnYV1ugL4pOKLaU/TgXtAhsucd8lkBec0TKO6uBMOqfpfhZiHmSDZAW+mSrm2urmMuy5CfCbs9
	1
X-Google-Smtp-Source: AGHT+IGffb4Xh2jVxmd0DwYrSlnzNSDspszwv178JIbR6qDGZ1mPMDGvzgKMPTaEQTHwXyS2xIUaZg==
X-Received: by 2002:adf:ce8f:0:b0:37c:d179:2f73 with SMTP id ffacd0b85a97d-37cd5a93aeemr1326754f8f.13.1727420299740;
        Thu, 26 Sep 2024 23:58:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd575dd04sm1618345f8f.114.2024.09.26.23.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 23:58:19 -0700 (PDT)
Date: Fri, 27 Sep 2024 09:58:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 5/6]
 drivers/usb/gadget/function/uvc_video.c:518 uvcg_video_pump() warn: can
 'req' even be NULL?
Message-ID: <ee817a3c-97f9-42f0-9a39-4d6f2f915abc@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   bcc435d3749cf5e9ec25c80cdf7172317bc355d6
commit: 82a411cec66480fa8acc14da04823eee581c1324 [5/6] FROMGIT: usb: gadget: uvc: Fix use-after-free for inflight usb_requests
config: x86_64-randconfig-161-20240926 (https://download.01.org/0day-ci/archive/20240927/202409270919.BnY2nmRN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409270919.BnY2nmRN-lkp@intel.com/

smatch warnings:
drivers/usb/gadget/function/uvc_video.c:518 uvcg_video_pump() warn: can 'req' even be NULL?

vim +/req +518 drivers/usb/gadget/function/uvc_video.c

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

This assignment is never read.

fc78941d8169cb drivers/usb/gadget/function/uvc_video.c Michael Grzeschik     2021-06-28  515  		video->req_int_count++;
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  516  	}
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  517  
f9897ec0f6d34e drivers/usb/gadget/function/uvc_video.c Michael Grzeschik     2021-10-17 @518  	if (!req)

req can't be NULL.

f9897ec0f6d34e drivers/usb/gadget/function/uvc_video.c Michael Grzeschik     2021-10-17  519  		return;
f9897ec0f6d34e drivers/usb/gadget/function/uvc_video.c Michael Grzeschik     2021-10-17  520  
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  521  	spin_lock_irqsave(&video->req_lock, flags);
82a411cec66480 drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-11-08  522  	if (video->is_enabled)
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  523  		list_add_tail(&req->list, &video->req_free);
82a411cec66480 drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-11-08  524  	else
82a411cec66480 drivers/usb/gadget/function/uvc_video.c Avichal Rakesh        2023-11-08  525  		uvc_video_free_request(req->context, video->ep);
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  526  	spin_unlock_irqrestore(&video->req_lock, flags);
cdda479f15cd13 drivers/usb/gadget/uvc_video.c          Laurent Pinchart      2010-05-02  527  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

