Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6231A6816
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Jul 2026 06:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783060458; cv=none; b=btOgzVdWqwEBLNakKSKlQX/G/mskiSkOwUEvKFETRVgGQv0zsNaUY0PqLE9/8vUbvj4QXxBA5CC4RaVEdajenyhIXyRTBkpbdodyvX5VflECzLJM8SafvFj9PjWqKBlx+i/+cwBtZhtG02RjOo5y0gpnIGAecfsY56B2yE8e+qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783060458; c=relaxed/simple;
	bh=TNPub6VMFOsYhh+Rp8M+JHOytGqJ9bEJACwxo6/2daA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FX0IbYEDxBKBpXo8Wcg6Vug6qytoQo9pOSTnov0FD/khjDLL1EZlC/ky0YA2b9FZjG0+xunwbBj/k9J52sln/D2na0+9kMqfzrTwVJhSTfjrIJR01lUesRCWDgLmLCMi1+HxuVgthHSmbiDOGctYJPqSX2bW1ntNhmfwJq2caqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a7owdoZZ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a7owdoZZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783060457; x=1814596457;
  h=date:from:to:cc:subject:message-id;
  bh=TNPub6VMFOsYhh+Rp8M+JHOytGqJ9bEJACwxo6/2daA=;
  b=a7owdoZZopr20CV0RccFpDfeHS5FlSqAQpKY4bBumL2GEnDx+1gSM7Xq
   O+ca5WDDg3N5hXG9gJNK4uq56iqxjEfYwNNn1ypoINOc33ZLFe1el6YG+
   FDDTlBHKNF8VI9plmZt1a1BWHc70fZSFiTlp1Zmm59Ow5MTiyAAWZv9bv
   809M9BzSR59WG6FZHBZGN63ZWzEycdVBv9bHlnE+m3HIegGGf41AnCoCx
   fNxt/7lNwJI2L7SPaqqpSuMNhrwQoJZT0KPliqwxdooWBNkiuvgiT6EAN
   JMbJeYpiI1+22cireiubiUCM/5u3EBrAPrq9YMrqQ+gOA9yH9z5pqfXmJ
   w==;
X-CSE-ConnectionGUID: WP03eMbAQYWHjy8DRrlYcA==
X-CSE-MsgGUID: FWTpOkSTRGyltAfRuNSLIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83863869"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="83863869"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 23:34:16 -0700
X-CSE-ConnectionGUID: ZZenAGrfTL6yKZkBkx2XHA==
X-CSE-MsgGUID: K595bsCQRt6q70bgY6WPUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="256930636"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 02 Jul 2026 23:34:16 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfXTR-00000000Bl5-3vvT;
	Fri, 03 Jul 2026 06:34:08 +0000
Date: Fri, 03 Jul 2026 14:33:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [sailus-media-tree:metadata 98/105]
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c:853
 ipu6_isys_alloc_stream_firmware() error: double free of 'stream' (line 790)
Message-ID: <202607031449.9y46lBuM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-media@vger.kernel.org
TO: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   a6d4ce993bcd76851cfc7f28cc33aac011a30fa9
commit: 5bd6ad739336637aa65b270823cf43a5a8f2dcab [98/105] media: ipu6: Bridge the gap between streams in V4L2 and IPU6 firmware
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260703/202607031449.9y46lBuM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607031449.9y46lBuM-lkp@intel.com/

smatch warnings:
drivers/media/pci/intel/ipu6/ipu6-isys-video.c:853 ipu6_isys_alloc_stream_firmware() error: double free of 'stream' (line 790)

vim +/stream +853 drivers/media/pci/intel/ipu6/ipu6-isys-video.c

3c1dfb5a69cf83 Bingbu Cao   2024-01-31  769  
5bd6ad73933663 Sakari Ailus 2026-06-26  770  struct ipu6_isys_stream *
5bd6ad73933663 Sakari Ailus 2026-06-26  771  ipu6_isys_alloc_stream_firmware(struct ipu6_isys_csi2 *csi2,
5bd6ad73933663 Sakari Ailus 2026-06-26  772  				struct v4l2_subdev_state *csi2_state,
5bd6ad73933663 Sakari Ailus 2026-06-26  773  				struct v4l2_mbus_frame_desc *desc,
5bd6ad73933663 Sakari Ailus 2026-06-26  774  				u8 vc)
5bd6ad73933663 Sakari Ailus 2026-06-26  775  {
5bd6ad73933663 Sakari Ailus 2026-06-26  776  	struct device *dev = &csi2->isys->adev->auxdev.dev;
5bd6ad73933663 Sakari Ailus 2026-06-26  777  	struct ipu6_isys_stream *stream;
5bd6ad73933663 Sakari Ailus 2026-06-26  778  	struct v4l2_subdev_route *route;
5bd6ad73933663 Sakari Ailus 2026-06-26  779  	int ret;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  780  
5bd6ad73933663 Sakari Ailus 2026-06-26  781  	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  782  	if (!stream) {
5bd6ad73933663 Sakari Ailus 2026-06-26  783  		ret = -ENOMEM;
5bd6ad73933663 Sakari Ailus 2026-06-26  784  		goto err_free_stream;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  785  	}
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  786  
5bd6ad73933663 Sakari Ailus 2026-06-26  787  	ret = ida_alloc_max(&csi2->isys->streams, IPU6_ISYS_MAX_STREAMS - 1,
5bd6ad73933663 Sakari Ailus 2026-06-26  788  			    GFP_KERNEL);
5bd6ad73933663 Sakari Ailus 2026-06-26  789  	if (ret < 0) {
5bd6ad73933663 Sakari Ailus 2026-06-26 @790  		kfree(stream);
5bd6ad73933663 Sakari Ailus 2026-06-26  791  		goto err_free_stream;
5bd6ad73933663 Sakari Ailus 2026-06-26  792  	}
5bd6ad73933663 Sakari Ailus 2026-06-26  793  
5bd6ad73933663 Sakari Ailus 2026-06-26  794  	stream->stream_handle = ret;
5bd6ad73933663 Sakari Ailus 2026-06-26  795  	mutex_init(&stream->mutex);
5bd6ad73933663 Sakari Ailus 2026-06-26  796  	init_completion(&stream->stream_open_completion);
5bd6ad73933663 Sakari Ailus 2026-06-26  797  	init_completion(&stream->stream_close_completion);
5bd6ad73933663 Sakari Ailus 2026-06-26  798  	init_completion(&stream->stream_start_completion);
5bd6ad73933663 Sakari Ailus 2026-06-26  799  	init_completion(&stream->stream_stop_completion);
5bd6ad73933663 Sakari Ailus 2026-06-26  800  	INIT_LIST_HEAD(&stream->queues);
5bd6ad73933663 Sakari Ailus 2026-06-26  801  	stream->isys = csi2->asd.isys;
5bd6ad73933663 Sakari Ailus 2026-06-26  802  	stream->asd = &csi2->asd;
5bd6ad73933663 Sakari Ailus 2026-06-26  803  	stream->vc = vc;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  804  
5bd6ad73933663 Sakari Ailus 2026-06-26  805  	scoped_guard(spinlock_irqsave, &stream->isys->power_lock) {
5bd6ad73933663 Sakari Ailus 2026-06-26  806  		stream->isys->streams_by_handle[stream->stream_handle] =
5bd6ad73933663 Sakari Ailus 2026-06-26  807  			stream;
5bd6ad73933663 Sakari Ailus 2026-06-26  808  		csi2->streams_by_vc[stream->vc] = stream;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  809  	}
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  810  
5bd6ad73933663 Sakari Ailus 2026-06-26  811  	list_add(&stream->csi2_entry, &csi2->streams);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  812  
5bd6ad73933663 Sakari Ailus 2026-06-26  813  	for_each_active_route(&csi2_state->routing, route) {
5bd6ad73933663 Sakari Ailus 2026-06-26  814  		struct media_pad *vdev_pad =
5bd6ad73933663 Sakari Ailus 2026-06-26  815  			media_pad_remote_pad_first(&csi2->asd.pad[route->source_pad]);
5bd6ad73933663 Sakari Ailus 2026-06-26  816  		struct v4l2_mbus_frame_desc_entry *entry = NULL;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  817  
5bd6ad73933663 Sakari Ailus 2026-06-26  818  		for (unsigned int i = 0; i < desc->num_entries; i++) {
5bd6ad73933663 Sakari Ailus 2026-06-26  819  			if (desc->entry[i].stream != route->sink_stream)
5bd6ad73933663 Sakari Ailus 2026-06-26  820  				continue;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  821  
5bd6ad73933663 Sakari Ailus 2026-06-26  822  			entry = &desc->entry[i];
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  823  			break;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  824  		}
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  825  
5bd6ad73933663 Sakari Ailus 2026-06-26  826  		if (!entry) {
5bd6ad73933663 Sakari Ailus 2026-06-26  827  			dev_dbg(dev, "cannot find stream %u in frame desc\n",
5bd6ad73933663 Sakari Ailus 2026-06-26  828  				route->sink_stream);
5bd6ad73933663 Sakari Ailus 2026-06-26  829  			ret = -EINVAL;
5bd6ad73933663 Sakari Ailus 2026-06-26  830  			goto err_ida_free;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  831  		}
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  832  
5bd6ad73933663 Sakari Ailus 2026-06-26  833  		if (entry->bus.csi2.vc != vc)
5bd6ad73933663 Sakari Ailus 2026-06-26  834  			continue;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  835  
5bd6ad73933663 Sakari Ailus 2026-06-26  836  		struct ipu6_isys_video *av =
5bd6ad73933663 Sakari Ailus 2026-06-26  837  			container_of_const(vdev_pad, struct ipu6_isys_video,
5bd6ad73933663 Sakari Ailus 2026-06-26  838  					   pad);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  839  
5bd6ad73933663 Sakari Ailus 2026-06-26  840  		list_add(&av->aq.node, &stream->queues);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  841  
5bd6ad73933663 Sakari Ailus 2026-06-26  842  		stream->nr_output_pins++;
5bd6ad73933663 Sakari Ailus 2026-06-26  843  		av->stream = stream;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  844  	}
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  845  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  846  	return stream;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  847  
5bd6ad73933663 Sakari Ailus 2026-06-26  848  err_ida_free:
5bd6ad73933663 Sakari Ailus 2026-06-26  849  	list_del(&stream->csi2_entry);
5bd6ad73933663 Sakari Ailus 2026-06-26  850  	ida_free(&csi2->isys->streams, stream->stream_handle);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  851  
5bd6ad73933663 Sakari Ailus 2026-06-26  852  err_free_stream:
5bd6ad73933663 Sakari Ailus 2026-06-26 @853  	kfree(stream);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  854  
5bd6ad73933663 Sakari Ailus 2026-06-26  855  	return ERR_PTR(ret);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  856  }
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  857  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
