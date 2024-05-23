Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B32D13C9DC
	for <oe-kbuild@lists.linux.dev>; Thu, 23 May 2024 10:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716459580; cv=none; b=aLXBzqQObiDKHA4aMqPVEPGwv95Ou0Nc7y7oDg3ePrEC35Y09DgbiGFPciCifqWPbCxSp9ObqAeKJm48o95lXou9jg1uHNV2pR8Qn+Zx435Uw91Zi7TLSR+Y/F178GLIu9m7sum8Yia9i7ZrYEUwIoiF8jUze2L44zrLqbX/MoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716459580; c=relaxed/simple;
	bh=ioIugdIFWdZEm20p+2t3M+Z3WTKiYuoNL5mSiMyot30=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NwPMmRL1aS3cnK90SlyzhUYaA2Wl0qUXwMlYJlnppR5Ws0CGMZF5UXWR9RzNI8SNzq6LeDG9giVoeJ/tATYoqRAhp20oNaaWyQhQGuR7A4R4lRknQkCspm1NXDipLwZRirW7O7cUiDe4eIMYjqP4f5RNgoK+aBUPipiie7szIEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n2oM7ZkS; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n2oM7ZkS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716459579; x=1747995579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ioIugdIFWdZEm20p+2t3M+Z3WTKiYuoNL5mSiMyot30=;
  b=n2oM7ZkSFFAfu0wsTOWM6bpKG+urVLnOKdin4QXP5CraT+4L3HYMRUZw
   NWimnl59+y5rZSYhFghxStiIjQTM9ZfYOUHDC2JU2fTw2folyuHmwFlJo
   5F2pRJGPqd3L9IFblm821v2qAueq7jQfIJgjBgKZuWVzHMn3RRJP2EHLO
   U1W2QaixrGIICdao8z9+4QkyGmGez6zpAnR1MHsntf4DN6l7KQjkBBTTW
   0JD7FG6poxzEauwD3+XuLMxce6QkMGa1MnjqzI6tghz9NtvZ9vbWOL3vD
   PEnXWkBSbbeCseCtYDp8PHRarp3Lc0OsawW2bdzwhCa/ybmMPl15p9MjY
   A==;
X-CSE-ConnectionGUID: 5OQXaIAQQZmmSuqoa8/NNQ==
X-CSE-MsgGUID: g2KeHK+TRTWOOaUzQw5Dww==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="16555069"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="16555069"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 03:19:38 -0700
X-CSE-ConnectionGUID: 2wfJsBWxTIKHD+1TJ+WfEw==
X-CSE-MsgGUID: H5BuzwRgQL642niBNhDDug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="38450813"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 23 May 2024 03:19:37 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sA5Xo-0002ij-0K;
	Thu, 23 May 2024 10:19:33 +0000
Date: Thu, 23 May 2024 18:18:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:mirror-chromeos-5.10-arcvm 10794/30000]
 sound/virtio/virtio_pcm_msg.c:149:27-28: WARNING: Use struct_size
Message-ID: <202405231835.y5s8EHH4-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   e1783de1ef5d7b659e9ebc7767064ac4dddd409d
commit: 919db70d73aafe9450ab5704abbebc149608749e [10794/30000] UPSTREAM: ALSA: virtio: handling control and I/O messages for the PCM device
:::::: branch date: 31 hours ago
:::::: commit date: 2 years, 9 months ago
config: x86_64-randconfig-104-20240523 (https://download.01.org/0day-ci/archive/20240523/202405231835.y5s8EHH4-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202405231835.y5s8EHH4-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/virtio/virtio_pcm_msg.c:149:27-28: WARNING: Use struct_size

vim +149 sound/virtio/virtio_pcm_msg.c

919db70d73aafe Anton Yakovlev 2021-03-02  119  
919db70d73aafe Anton Yakovlev 2021-03-02  120  /**
919db70d73aafe Anton Yakovlev 2021-03-02  121   * virtsnd_pcm_msg_alloc() - Allocate I/O messages.
919db70d73aafe Anton Yakovlev 2021-03-02  122   * @vss: VirtIO PCM substream.
919db70d73aafe Anton Yakovlev 2021-03-02  123   * @periods: Current number of periods.
919db70d73aafe Anton Yakovlev 2021-03-02  124   * @period_bytes: Current period size in bytes.
919db70d73aafe Anton Yakovlev 2021-03-02  125   *
919db70d73aafe Anton Yakovlev 2021-03-02  126   * The function slices the buffer into @periods parts (each with the size of
919db70d73aafe Anton Yakovlev 2021-03-02  127   * @period_bytes), and creates @periods corresponding I/O messages.
919db70d73aafe Anton Yakovlev 2021-03-02  128   *
919db70d73aafe Anton Yakovlev 2021-03-02  129   * Context: Any context that permits to sleep.
919db70d73aafe Anton Yakovlev 2021-03-02  130   * Return: 0 on success, -ENOMEM on failure.
919db70d73aafe Anton Yakovlev 2021-03-02  131   */
919db70d73aafe Anton Yakovlev 2021-03-02  132  int virtsnd_pcm_msg_alloc(struct virtio_pcm_substream *vss,
919db70d73aafe Anton Yakovlev 2021-03-02  133  			  unsigned int periods, unsigned int period_bytes)
919db70d73aafe Anton Yakovlev 2021-03-02  134  {
919db70d73aafe Anton Yakovlev 2021-03-02  135  	struct snd_pcm_runtime *runtime = vss->substream->runtime;
919db70d73aafe Anton Yakovlev 2021-03-02  136  	unsigned int i;
919db70d73aafe Anton Yakovlev 2021-03-02  137  
919db70d73aafe Anton Yakovlev 2021-03-02  138  	vss->msgs = kcalloc(periods, sizeof(*vss->msgs), GFP_KERNEL);
919db70d73aafe Anton Yakovlev 2021-03-02  139  	if (!vss->msgs)
919db70d73aafe Anton Yakovlev 2021-03-02  140  		return -ENOMEM;
919db70d73aafe Anton Yakovlev 2021-03-02  141  
919db70d73aafe Anton Yakovlev 2021-03-02  142  	vss->nmsgs = periods;
919db70d73aafe Anton Yakovlev 2021-03-02  143  
919db70d73aafe Anton Yakovlev 2021-03-02  144  	for (i = 0; i < periods; ++i) {
919db70d73aafe Anton Yakovlev 2021-03-02  145  		u8 *data = runtime->dma_area + period_bytes * i;
919db70d73aafe Anton Yakovlev 2021-03-02  146  		int sg_num = virtsnd_pcm_sg_num(data, period_bytes);
919db70d73aafe Anton Yakovlev 2021-03-02  147  		struct virtio_pcm_msg *msg;
919db70d73aafe Anton Yakovlev 2021-03-02  148  
919db70d73aafe Anton Yakovlev 2021-03-02 @149  		msg = kzalloc(sizeof(*msg) + sizeof(*msg->sgs) * (sg_num + 2),
919db70d73aafe Anton Yakovlev 2021-03-02  150  			      GFP_KERNEL);
919db70d73aafe Anton Yakovlev 2021-03-02  151  		if (!msg)
919db70d73aafe Anton Yakovlev 2021-03-02  152  			return -ENOMEM;
919db70d73aafe Anton Yakovlev 2021-03-02  153  
919db70d73aafe Anton Yakovlev 2021-03-02  154  		msg->substream = vss;
919db70d73aafe Anton Yakovlev 2021-03-02  155  		sg_init_one(&msg->sgs[PCM_MSG_SG_XFER], &msg->xfer,
919db70d73aafe Anton Yakovlev 2021-03-02  156  			    sizeof(msg->xfer));
919db70d73aafe Anton Yakovlev 2021-03-02  157  		sg_init_one(&msg->sgs[PCM_MSG_SG_STATUS], &msg->status,
919db70d73aafe Anton Yakovlev 2021-03-02  158  			    sizeof(msg->status));
919db70d73aafe Anton Yakovlev 2021-03-02  159  		msg->length = period_bytes;
919db70d73aafe Anton Yakovlev 2021-03-02  160  		virtsnd_pcm_sg_from(&msg->sgs[PCM_MSG_SG_DATA], sg_num, data,
919db70d73aafe Anton Yakovlev 2021-03-02  161  				    period_bytes);
919db70d73aafe Anton Yakovlev 2021-03-02  162  
919db70d73aafe Anton Yakovlev 2021-03-02  163  		vss->msgs[i] = msg;
919db70d73aafe Anton Yakovlev 2021-03-02  164  	}
919db70d73aafe Anton Yakovlev 2021-03-02  165  
919db70d73aafe Anton Yakovlev 2021-03-02  166  	return 0;
919db70d73aafe Anton Yakovlev 2021-03-02  167  }
919db70d73aafe Anton Yakovlev 2021-03-02  168  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
