Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A74E1A9FB5
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Nov 2025 16:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764348149; cv=none; b=jzo1uOJSzyNLxU+6Vvr5CqoKqeTDLiHYED2v8c8z+snPgIW0COrOhCHBSrR0EDaazfo6ja2hgmGe0js1+bKMZyxvugSAijMU9yX9IfV7cum4PynlN31eqO7jZSkVnT7qzx7kgdJ6VQ0VJc+QFVoXhdFb4VjXdgfFWr/BgS2qwKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764348149; c=relaxed/simple;
	bh=g4KqNcdp7kClviNd1qFkzXZktqBE3N6aZUnsPBj9hzE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y80sP4Rrbg5RJXNn6tkYhVsbH4efN75fJ2Yodr0BqVqUiUBpu535xpJCwUnYEGKCIn235TIY5jB5iAsUZeQBdKvm7Ldu6ybZC+tntaie9P6QZjUE4PqKAKF1Q7PzAMffl1mi+6JsKtrrzMaXQYinQHupyUwEtv1LifLYgq8Ws38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VsssXRNf; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VsssXRNf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764348147; x=1795884147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g4KqNcdp7kClviNd1qFkzXZktqBE3N6aZUnsPBj9hzE=;
  b=VsssXRNfEOnWOdThxLAe6uZSejkkE687OnABLbAEX0l9U3d6APU78Kq7
   c7/Q9B7Osc2sIK25CZtrJ9d55ouOtzp/0ZezIS2WyaLmXiRUmQT5G1j2K
   pe7paoydCMsBts1WAw4FJdjhfB/VlVosLEWo8uk+vkUFlxS+yyFDWu55D
   iM7iebhRRo85krAq8Mc/8q1KWCWisHu+qvIi8/F1B0q/kajfZ7aIbjhFC
   KjwXgjxM14BOgePzE4qVYp0l+2+2hL5lUCNcTXwJiJP9Fm2OxvuyEn1qu
   Lsh1oplyhORq51V5Jzgg32RMdHH5DXhKU+JSSY9g330y4LdhqbpmnaBE1
   Q==;
X-CSE-ConnectionGUID: ozlknnAqSWmzLdzzq6Nojw==
X-CSE-MsgGUID: m6G1i5rqSHis3gnXcLr0ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="76704886"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; 
   d="scan'208";a="76704886"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 08:42:27 -0800
X-CSE-ConnectionGUID: aA5fpgEjSA6Ej2rR/eKpMg==
X-CSE-MsgGUID: lKK+znl9Scq2NEPnFYVfjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; 
   d="scan'208";a="192615993"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Nov 2025 08:42:26 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vP1Y7-000000006ZZ-0DRW;
	Fri, 28 Nov 2025 16:42:23 +0000
Date: Sat, 29 Nov 2025 00:41:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] media: usb: uvc: Fix NULL pointer dereference during
 USB device hot-unplug
Message-ID: <202511290057.kQLrar4L-lkp@intel.com>
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
In-Reply-To: <20251122072558.2604753-1-dengjie03@kylinos.cn>
References: <20251122072558.2604753-1-dengjie03@kylinos.cn>
TO: Jie Deng <dengjie03@kylinos.cn>
TO: laurent.pinchart@ideasonboard.com
CC: hansg@kernel.org
CC: mchehab@kernel.org
CC: kieran.bingham@ideasonboard.com
CC: linux-media@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Jie Deng <dengjie03@kylinos.cn>

Hi Jie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linuxtv-media-pending/master]
[also build test WARNING on linus/master v6.18-rc7 next-20251128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jie-Deng/media-usb-uvc-Fix-NULL-pointer-dereference-during-USB-device-hot-unplug/20251122-152814
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20251122072558.2604753-1-dengjie03%40kylinos.cn
patch subject: [PATCH v2] media: usb: uvc: Fix NULL pointer dereference during USB device hot-unplug
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-r071-20251128 (https://download.01.org/0day-ci/archive/20251129/202511290057.kQLrar4L-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511290057.kQLrar4L-lkp@intel.com/

smatch warnings:
drivers/media/usb/uvc/uvc_video.c:2357 uvc_video_stop_streaming() error: we previously assumed 'stream' could be null (see line 2323)

vim +/stream +2357 drivers/media/usb/uvc/uvc_video.c

571e70dbd421056 Kieran Bingham   2018-11-05  2317  
571e70dbd421056 Kieran Bingham   2018-11-05  2318  void uvc_video_stop_streaming(struct uvc_streaming *stream)
571e70dbd421056 Kieran Bingham   2018-11-05  2319  {
18ffa9a4cf426a8 Jie Deng         2025-11-22  2320  	struct usb_host_config *config;
18ffa9a4cf426a8 Jie Deng         2025-11-22  2321  	int i;
18ffa9a4cf426a8 Jie Deng         2025-11-22  2322  
18ffa9a4cf426a8 Jie Deng         2025-11-22 @2323  	if (!stream || !stream->dev || !stream->dev->udev || !stream->intf)
18ffa9a4cf426a8 Jie Deng         2025-11-22  2324  		goto cleanup_clock;
18ffa9a4cf426a8 Jie Deng         2025-11-22  2325  
fb58e16bb783833 Kieran Bingham   2018-11-05  2326  	uvc_video_stop_transfer(stream, 1);
571e70dbd421056 Kieran Bingham   2018-11-05  2327  
18ffa9a4cf426a8 Jie Deng         2025-11-22  2328  	config = stream->dev->udev->actconfig;
18ffa9a4cf426a8 Jie Deng         2025-11-22  2329  	if (stream->intf->num_altsetting > 1 && config) {
18ffa9a4cf426a8 Jie Deng         2025-11-22  2330  		/* Security Check: Check if the interface exists and is valid */
18ffa9a4cf426a8 Jie Deng         2025-11-22  2331  		for (i = 0; i < config->desc.bNumInterfaces; i++) {
18ffa9a4cf426a8 Jie Deng         2025-11-22  2332  			if (config->interface[i] &&
18ffa9a4cf426a8 Jie Deng         2025-11-22  2333  			    config->interface[i]->altsetting[0]
18ffa9a4cf426a8 Jie Deng         2025-11-22  2334  				.desc.bInterfaceNumber == stream->intfnum) {
571e70dbd421056 Kieran Bingham   2018-11-05  2335  				usb_set_interface(stream->dev->udev, stream->intfnum, 0);
18ffa9a4cf426a8 Jie Deng         2025-11-22  2336  				break;
18ffa9a4cf426a8 Jie Deng         2025-11-22  2337  			}
18ffa9a4cf426a8 Jie Deng         2025-11-22  2338  		}
571e70dbd421056 Kieran Bingham   2018-11-05  2339  	} else {
699b9a86a3f03ad Laurent Pinchart 2022-06-08  2340  		/*
699b9a86a3f03ad Laurent Pinchart 2022-06-08  2341  		 * UVC doesn't specify how to inform a bulk-based device
571e70dbd421056 Kieran Bingham   2018-11-05  2342  		 * when the video stream is stopped. Windows sends a
571e70dbd421056 Kieran Bingham   2018-11-05  2343  		 * CLEAR_FEATURE(HALT) request to the video streaming
571e70dbd421056 Kieran Bingham   2018-11-05  2344  		 * bulk endpoint, mimic the same behaviour.
571e70dbd421056 Kieran Bingham   2018-11-05  2345  		 */
571e70dbd421056 Kieran Bingham   2018-11-05  2346  		unsigned int epnum = stream->header.bEndpointAddress
571e70dbd421056 Kieran Bingham   2018-11-05  2347  				   & USB_ENDPOINT_NUMBER_MASK;
571e70dbd421056 Kieran Bingham   2018-11-05  2348  		unsigned int dir = stream->header.bEndpointAddress
571e70dbd421056 Kieran Bingham   2018-11-05  2349  				 & USB_ENDPOINT_DIR_MASK;
571e70dbd421056 Kieran Bingham   2018-11-05  2350  		unsigned int pipe;
571e70dbd421056 Kieran Bingham   2018-11-05  2351  
571e70dbd421056 Kieran Bingham   2018-11-05  2352  		pipe = usb_sndbulkpipe(stream->dev->udev, epnum) | dir;
571e70dbd421056 Kieran Bingham   2018-11-05  2353  		usb_clear_halt(stream->dev->udev, pipe);
571e70dbd421056 Kieran Bingham   2018-11-05  2354  	}
571e70dbd421056 Kieran Bingham   2018-11-05  2355  
18ffa9a4cf426a8 Jie Deng         2025-11-22  2356  cleanup_clock:
141270bd95d48ea Ricardo Ribalda  2024-03-23 @2357  	uvc_video_clock_cleanup(&stream->clock);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
