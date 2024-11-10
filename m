Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239232CAB
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Nov 2024 03:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731207733; cv=none; b=mbjqSNmYayqsDBR6tYf0ROhVZI4v+j2YrRv1egIV9RF+HGYxoN6249BE4eAToq+i1OsFSfbstga1pQUmOslQUv+GMqmTEainkmprWr6IewiZOFj+jMzl+S5XoR1u1uhn+s+YrI1ZVOzp8o8ya6qOCdB41Ado3ttVRrU83a8WsTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731207733; c=relaxed/simple;
	bh=N5JVQ06PFJq7KTgHwDHMSS7rTh/6IdPUVJw36Ektzck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CXf4xqW1KLvO1SfBZe3HbXg4/j1Z117cEM6bnBdUltZ12DeLV6PrJ619IbsFEdeh7ot9hecxcArbC0nnh/BcBrqAdfgsV7/RIzwcrNStfKZNajrcOvDi4DqBnKi2Mmre7zEvLITYJUWpAoFS+necb45xhCg/MKkGjhtD/v6aM+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JGrq80Yi; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JGrq80Yi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731207731; x=1762743731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N5JVQ06PFJq7KTgHwDHMSS7rTh/6IdPUVJw36Ektzck=;
  b=JGrq80YiQpf2SCZSHi4EjSqX0TF5E6YCY3+H4bb5/uzZI5NdWtq7T4ll
   OfJHDIMIZJUIlNjGcAi5yGDnIilWOH5kGC2n8NAJlyGmzkXIykSJ7qRS7
   kzxMC+4RJngiM0KR5o9zJbasht81g/dqQebb/LHUMAc+5kjiK7T7DWcIF
   uA24FMUGorFGGXZCWgDzRbzEQCOX60c5EofGgmmDmbyRro49F8A9AQsSa
   e2GJzn/nweHRgP234sWNa8GSE5cemQ7lJ1I37OCvCKcylPWuho03220GF
   rBb81TM7ghRaaQxDWw+O7PQ6u2O7t7ItI44phToGonzC44nn16s8ABlc+
   A==;
X-CSE-ConnectionGUID: OVibukWdSs+1NCFFSjZ9Hw==
X-CSE-MsgGUID: w7zaThrbQVuzlPEsnUP15g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41611845"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41611845"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 19:02:11 -0800
X-CSE-ConnectionGUID: eNV1qn5FREe0EOICMNwOQg==
X-CSE-MsgGUID: lIzE3ierTmiMW4OS3R/d5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="90189069"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Nov 2024 19:02:09 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9yDH-000srm-0n;
	Sun, 10 Nov 2024 03:02:07 +0000
Date: Sun, 10 Nov 2024 11:01:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/usb/mixer_scarlett2.c:4972
 scarlett2_ioctl_select_flash_segment() warn: potential spectre issue
 'private->flash_segment_nums' [r] (local cap)
Message-ID: <202411101058.RkdgFPCg-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: "Geoffrey D. Bennett" <g@b4.vu>
CC: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   de2f378f2b771b39594c04695feee86476743a69
commit: 6a7508e64ee3e8320c886020bcdcd70f7fcbff2c ALSA: scarlett2: Add ioctl commands to erase flash segments
date:   11 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-161-20241110 (https://download.01.org/0day-ci/archive/20241110/202411101058.RkdgFPCg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411101058.RkdgFPCg-lkp@intel.com/

smatch warnings:
sound/usb/mixer_scarlett2.c:4972 scarlett2_ioctl_select_flash_segment() warn: potential spectre issue 'private->flash_segment_nums' [r] (local cap)
sound/usb/mixer_scarlett2.c:4973 scarlett2_ioctl_select_flash_segment() warn: possible spectre second half.  'segment_num'

vim +4972 sound/usb/mixer_scarlett2.c

337b2f0e778f78 Geoffrey D. Bennett 2023-12-20  4956  
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4957  /* Select a flash segment for erasing (and possibly writing to) */
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4958  static int scarlett2_ioctl_select_flash_segment(
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4959  	struct usb_mixer_interface *mixer,
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4960  	unsigned long arg)
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4961  {
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4962  	struct scarlett2_data *private = mixer->private_data;
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4963  	int segment_id, segment_num;
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4964  
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4965  	if (get_user(segment_id, (int __user *)arg))
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4966  		return -EFAULT;
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4967  
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4968  	/* Check the segment ID and segment number */
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4969  	if (segment_id < 0 || segment_id >= SCARLETT2_SEGMENT_ID_COUNT)
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4970  		return -EINVAL;
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4971  
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20 @4972  	segment_num = private->flash_segment_nums[segment_id];
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20 @4973  	if (segment_num < SCARLETT2_SEGMENT_NUM_MIN ||
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4974  	    segment_num > SCARLETT2_SEGMENT_NUM_MAX) {
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4975  		usb_audio_err(mixer->chip,
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4976  			      "%s: invalid segment number %d\n",
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4977  			      __func__, segment_id);
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4978  		return -EFAULT;
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4979  	}
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4980  
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4981  	/* If erasing, wait for it to complete */
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4982  	if (private->flash_write_state == SCARLETT2_FLASH_WRITE_STATE_ERASING) {
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4983  		int err = scarlett2_wait_for_erase(mixer);
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4984  
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4985  		if (err < 0)
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4986  			return err;
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4987  	}
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4988  
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4989  	/* Save the selected segment ID and set the state to SELECTED */
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4990  	private->selected_flash_segment_id = segment_id;
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4991  	private->flash_write_state = SCARLETT2_FLASH_WRITE_STATE_SELECTED;
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4992  
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4993  	return 0;
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4994  }
6a7508e64ee3e8 Geoffrey D. Bennett 2023-12-20  4995  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
