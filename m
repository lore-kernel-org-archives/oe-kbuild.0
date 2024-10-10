Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F24ADF44
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Oct 2024 00:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728520779; cv=none; b=kQbv57KlsH6orR9oF4YQYE/ZlGC3wqrrxVm9gAnq7Yz+nxLd+yFzUGPzjarwNZd+pcGmxhBDeAZdyUxl0lyLLkbRm/u/hy2QQmEHRftbtTqFLcwhEh6ePQHQy6Ofpu8mWzDLNZUdFCFBY0q49FPD2GpQH3o8qY/Nj9cpjauDDGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728520779; c=relaxed/simple;
	bh=bR4ejAVDpRvmD3wXB2wwv2NdJJ5H7yZ5xb3RbMwdevs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ltocbfEsLozl0BcdrrUdO+0eDU77AseQvS0SCdoTx12UTPS59jWvIDM6e4UYdmvR+O99qAGYDF52NGqH5lUpn6+NoFBhGuS1gY/uwHofuyrA0LwRH4kjfpuAMYNpvvG9qJxs0AKEpsDiHEczQfXCNyLCmy0LJmW04PvtODOTRNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IedL1MI4; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IedL1MI4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728520777; x=1760056777;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bR4ejAVDpRvmD3wXB2wwv2NdJJ5H7yZ5xb3RbMwdevs=;
  b=IedL1MI4jmuPvVBo1+ExH+YRbiFwOEbK8FtdnjVszs06yYMykvT+Kw9T
   e35yhcImhCCRKKlUFVMYOfLhZW0p1XxlrRz2dujQdIbbRrOdYQCtB1sRe
   Z6qDp0qOi/YOJgY/M7GQKjsIKH3dcH/0VMaZN3fUDQG79AWRG3BTVRfYn
   N9uFOihbTxBNnDtJDJai5+0/nHf7LKU3K8HeiYBuvR3tqcfqKSuO7IIuV
   gtwEgbH0X1VVchnB15QQVn2u/q5JE3I9ZurTYM5RVxX3oMQuhO3d8MqbM
   Rtj5kvcFSvHg65E44KVkMZ/HQgBQ54qtC3BhYyNZAkKwyNfmlRiVKQTSo
   Q==;
X-CSE-ConnectionGUID: BE04fgdXSDeRYBsj5QxP6Q==
X-CSE-MsgGUID: +Iy1o/trT7iwQxWry8d1Cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27805824"
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; 
   d="scan'208";a="27805824"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 17:39:37 -0700
X-CSE-ConnectionGUID: X7pb/6RyTpiptvZkXUl6lw==
X-CSE-MsgGUID: 0J7uvfJ/S3+LBlLKou2zug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; 
   d="scan'208";a="80944323"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Oct 2024 17:39:35 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syhDJ-0009z5-1i;
	Thu, 10 Oct 2024 00:39:33 +0000
Date: Thu, 10 Oct 2024 08:39:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 6/9] drm/i915/display: iterare through channels if no
 feasible frequencies
Message-ID: <202410100801.8jZBRn3y-lkp@intel.com>
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
In-Reply-To: <20241008082327.342020-7-vinod.govindapillai@intel.com>
References: <20241008082327.342020-7-vinod.govindapillai@intel.com>
TO: Vinod Govindapillai <vinod.govindapillai@intel.com>
TO: intel-gfx@lists.freedesktop.org
CC: vinod.govindapillai@intel.com
CC: jani.nikula@intel.com
CC: ville.syrjala@intel.com
CC: kai.vehmanen@intel.com
CC: jani.saarinen@intel.com

Hi Vinod,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.12-rc2 next-20241009]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vinod-Govindapillai/drm-i915-display-get-rid-of-encoder-param-in-intel_audio_compute_config/20241008-163033
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20241008082327.342020-7-vinod.govindapillai%40intel.com
patch subject: [PATCH 6/9] drm/i915/display: iterare through channels if no feasible frequencies
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20241009 (https://download.01.org/0day-ci/archive/20241010/202410100801.8jZBRn3y-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410100801.8jZBRn3y-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/display/intel_audio.c:789 intel_audio_compute_sad() error: uninitialized symbol 'sad_freq'.

vim +/sad_freq +789 drivers/gpu/drm/i915/display/intel_audio.c

0f1adcd58da8c47 Vinod Govindapillai 2024-10-08  763  
0f1adcd58da8c47 Vinod Govindapillai 2024-10-08  764  static void intel_audio_compute_sad(struct drm_i915_private *i915,
0f1adcd58da8c47 Vinod Govindapillai 2024-10-08  765  				    int line_freq_khz, int hblank_slots_lanes,
0f1adcd58da8c47 Vinod Govindapillai 2024-10-08  766  				    int avail_overhead, int req_overhead,
0f1adcd58da8c47 Vinod Govindapillai 2024-10-08  767  				    struct cea_sad *sad)
0f1adcd58da8c47 Vinod Govindapillai 2024-10-08  768  {
e2675520fb74591 Vinod Govindapillai 2024-10-08  769  	u8 channels;
0f1adcd58da8c47 Vinod Govindapillai 2024-10-08  770  	u8 sad_freq;
0f1adcd58da8c47 Vinod Govindapillai 2024-10-08  771  
e2675520fb74591 Vinod Govindapillai 2024-10-08  772  	/*
e2675520fb74591 Vinod Govindapillai 2024-10-08  773  	 * If we don't find any supported audio frequencies for a channel,
e2675520fb74591 Vinod Govindapillai 2024-10-08  774  	 * reduce the channel and try
e2675520fb74591 Vinod Govindapillai 2024-10-08  775  	 */
e2675520fb74591 Vinod Govindapillai 2024-10-08  776  	for (channels = sad->channels + 1; channels >= 1; channels--) {
0f1adcd58da8c47 Vinod Govindapillai 2024-10-08  777  		sad_freq = intel_audio_get_pruned_audfreq(i915, line_freq_khz,
0f1adcd58da8c47 Vinod Govindapillai 2024-10-08  778  							  hblank_slots_lanes,
0f1adcd58da8c47 Vinod Govindapillai 2024-10-08  779  							  avail_overhead,
e2675520fb74591 Vinod Govindapillai 2024-10-08  780  							  req_overhead,
e2675520fb74591 Vinod Govindapillai 2024-10-08  781  							  channels,
0f1adcd58da8c47 Vinod Govindapillai 2024-10-08  782  							  sad->freq);
0f1adcd58da8c47 Vinod Govindapillai 2024-10-08  783  
e2675520fb74591 Vinod Govindapillai 2024-10-08  784  		/* Supported frequencies exist! No need to proceed further */
e2675520fb74591 Vinod Govindapillai 2024-10-08  785  		if (sad_freq)
e2675520fb74591 Vinod Govindapillai 2024-10-08  786  			break;
e2675520fb74591 Vinod Govindapillai 2024-10-08  787  	}
e2675520fb74591 Vinod Govindapillai 2024-10-08  788  
0f1adcd58da8c47 Vinod Govindapillai 2024-10-08 @789  	sad->freq = sad_freq;
e2675520fb74591 Vinod Govindapillai 2024-10-08  790  	sad->channels = channels ? channels - 1 : 0;
0f1adcd58da8c47 Vinod Govindapillai 2024-10-08  791  }
0f1adcd58da8c47 Vinod Govindapillai 2024-10-08  792  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
