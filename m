Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854E28F6F
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Jan 2024 07:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705649038; cv=none; b=TRpDHYgJ9hEuj6zIu6jgz89nnAC2WVFsaTWOTAN8i3vT5ZQ01TNOAVpRX+f2tKNqmQcjtXecr0v2uiQG4tiOnLKM6fwpXz+Hyr2jCrnDLrrSUor7EtGlObVsv9AYDLdI+EEO9cvgVs7Gi++ccp1fL75K+RJ8bs9iiLth+Bu5gGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705649038; c=relaxed/simple;
	bh=+V+60qPpRLf5QRMy8gsIITpKPnkXaTtj5sa9oJxoM6o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mEXuupA+mECykZ8kzrbEQ8k8LXkRx1usxhJae+xAWbZz+MtfDl7EhSkmIBjuSy6w5Wo5IJGBxSzqIs9gL1ltbUA8wBdPlDcPxqGyx3R08spdquaw9QSRe2YL0QhMBy6o1jiPjZL6WzeDKZNWrj/6FbEK0P+Piukb14zqCysPBN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jHV3vqjt; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jHV3vqjt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705649036; x=1737185036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+V+60qPpRLf5QRMy8gsIITpKPnkXaTtj5sa9oJxoM6o=;
  b=jHV3vqjt5dfSAd0lyDsLGYe0nlFja5d+ZIPJdj9gZ7zrdjCZPkqXg81M
   wztNM4aZN9Ve2c7D/im4nnjd0O1Kl+A6l2PZNmhz4X6npsD0E93gV2Pdr
   3wXJov/Y8BLzRonRy7b+auyQ0iYNg54jeZ+/xRb/W/oZvdEOXOhD+0xzr
   tYH5AdinY40XAOy7MifxQvTh9C5WJSntkqUqfKUnFvabkQYOCJdEx81WL
   BjMOfoBLJXjjH8/LbbVFwwm40Bha2+2daO76PYLgalWn2BA437oCJrsed
   XJngMDsMsfkjWW8bplzAlYX7S3rlpQ3MaUYYic2ayu07WkfcX+hqiZlWr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="431852765"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="431852765"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 23:23:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="785008326"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="785008326"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 18 Jan 2024 23:23:50 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQjEB-0003kn-1i;
	Fri, 19 Jan 2024 07:23:47 +0000
Date: Fri, 19 Jan 2024 15:23:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/usb/mixer_scarlett2.c:4972
 scarlett2_ioctl_select_flash_segment() warn: potential spectre issue
 'private->flash_segment_nums' [r] (local cap)
Message-ID: <202401191535.Sptdb0tv-lkp@intel.com>
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
head:   9d1694dc91ce7b80bc96d6d8eaf1a1eca668d847
commit: 6a7508e64ee3e8320c886020bcdcd70f7fcbff2c ALSA: scarlett2: Add ioctl commands to erase flash segments
date:   3 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 weeks ago
config: nios2-randconfig-r081-20240118 (https://download.01.org/0day-ci/archive/20240119/202401191535.Sptdb0tv-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401191535.Sptdb0tv-lkp@intel.com/

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
