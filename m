Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5582882DE
	for <oe-kbuild@lists.linux.dev>; Mon, 21 Jul 2025 08:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753086479; cv=none; b=GmiRy2sXY55GbDWGkEB0PBQvCy9OYufGAuMxathTqwe9252zLUWtK4gEB3rWjpB2Y4lGsl8hEFHdZ4fZn4SCBaBL6VPIXccY0lr+5fXN792GRK/atoj+2pRJ+U03xg/sTf/ZXzifalAIc+OTYwuxH+3lLsKRPbGnqAXh3tEUU/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753086479; c=relaxed/simple;
	bh=tRfUUj9RSJuaUyw1bYn+SyS4KoVHE6iA/yP5m/4HDUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GHf+EjwSyWWKFa/y8Mi4jBj9rGnpMuvqcWnWub6ZnP6beO3hoiPTFouBUUJvafNezIgsuswM8Gb+y6p/HzATn6SnyhjvuOsteEtTxhlge7U/hl3orfXVUkfN17oDU+F+f46E+M0FP+5C2He7G7Kal8bXrHhHqOrLz1tmnb3fZPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lOCu2C0d; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lOCu2C0d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753086477; x=1784622477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tRfUUj9RSJuaUyw1bYn+SyS4KoVHE6iA/yP5m/4HDUQ=;
  b=lOCu2C0dLIuLTjnsIg9SPaMorOiVUY/h0QGJ0kJONx+jLmm6FMvjxiJ0
   UPC1KHH1TRf/PL366vjhE1C6EKXoYXOtTCWNrJ44bBQs+BCYJsG+/Bjiq
   YFSuf8/xbL5PqVtVwJW0mHFpFifZ7jImCgeU5lHIciR7YdPd6TleCVojP
   xVrKF8xSudpX8qDkkO88zJXqd670AZ7zw8AmtULudufg7O9xZGZdsaIjd
   ezSW1dJxdYNxeeGKSyEahnL15hIKqHE7OVbsujw1PBc6JEKNfwNtlvqNT
   FVlW7/PZnIZOCdrZsLiaqPUZZ7eqKRIZxQRqQ0sj3b6XYSBKFTEiMIDG+
   A==;
X-CSE-ConnectionGUID: SvQl3Vy7RFGp7fDTC4FvmQ==
X-CSE-MsgGUID: YdKXf4uGSficeXnScE8cVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="59106514"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="59106514"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 01:27:56 -0700
X-CSE-ConnectionGUID: 7i6i4N7vTvKTHeMcwXpI/g==
X-CSE-MsgGUID: lQMYJflET32AlLaY5DPUNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="158546611"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Jul 2025 01:27:55 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udlsG-000Gcj-2w;
	Mon, 21 Jul 2025 08:27:52 +0000
Date: Mon, 21 Jul 2025 16:27:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 1/3] bus: mhi: host: keep bhi buffer through suspend
 cycle
Message-ID: <202507211419.AfVl4nWk-lkp@intel.com>
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
In-Reply-To: <20250715132509.2643305-2-usama.anjum@collabora.com>
References: <20250715132509.2643305-2-usama.anjum@collabora.com>
TO: Muhammad Usama Anjum <usama.anjum@collabora.com>
TO: Manivannan Sadhasivam <mani@kernel.org>
TO: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
TO: Muhammad Usama Anjum <usama.anjum@collabora.com>
TO: Youssef Samir <quic_yabdulra@quicinc.com>
TO: Matthew Leung <quic_mattleun@quicinc.com>
TO: Alexander Wilhelm <alexander.wilhelm@westermo.com>
TO: Kunwu Chan <chentao@kylinos.cn>
TO: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
TO: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
TO: Yan Zhen <yanzhen@vivo.com>
TO: Sujeev Dias <sdias@codeaurora.org>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Siddartha Mohanadoss <smohanad@codeaurora.org>
TO: mhi@lists.linux.dev
TO: linux-arm-msm@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: kernel@collabora.com
CC: stable@vger.kernel.org

Hi Muhammad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mani-mhi/mhi-next]
[also build test WARNING on next-20250718]
[cannot apply to linus/master v6.16-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Muhammad-Usama-Anjum/bus-mhi-host-keep-bhi-buffer-through-suspend-cycle/20250715-213507
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
patch link:    https://lore.kernel.org/r/20250715132509.2643305-2-usama.anjum%40collabora.com
patch subject: [PATCH v2 1/3] bus: mhi: host: keep bhi buffer through suspend cycle
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: microblaze-randconfig-r073-20250720 (https://download.01.org/0day-ci/archive/20250721/202507211419.AfVl4nWk-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507211419.AfVl4nWk-lkp@intel.com/

New smatch warnings:
drivers/bus/mhi/host/boot.c:467 mhi_load_image_bhi() error: we previously assumed '*image' could be null (see line 461)

Old smatch warnings:
drivers/bus/mhi/host/boot.c:606 mhi_fw_load_handler() error: we previously assumed 'mhi_cntrl->fbc_image' could be null (see line 596)

vim +467 drivers/bus/mhi/host/boot.c

f88f1d0998ea2e Matthew Leung        2025-01-17  455  
f88f1d0998ea2e Matthew Leung        2025-01-17  456  static int mhi_load_image_bhi(struct mhi_controller *mhi_cntrl, const u8 *fw_data, size_t size)
f88f1d0998ea2e Matthew Leung        2025-01-17  457  {
777cd2954046a1 Muhammad Usama Anjum 2025-07-15  458  	struct image_info **image = &mhi_cntrl->bhi_image;
f88f1d0998ea2e Matthew Leung        2025-01-17  459  	int ret;
f88f1d0998ea2e Matthew Leung        2025-01-17  460  
777cd2954046a1 Muhammad Usama Anjum 2025-07-15 @461  	if (!(*image)) {
777cd2954046a1 Muhammad Usama Anjum 2025-07-15  462  		ret = mhi_alloc_bhi_buffer(mhi_cntrl, image, size);
f88f1d0998ea2e Matthew Leung        2025-01-17  463  		if (ret)
f88f1d0998ea2e Matthew Leung        2025-01-17  464  			return ret;
f88f1d0998ea2e Matthew Leung        2025-01-17  465  
f88f1d0998ea2e Matthew Leung        2025-01-17  466  		/* Load the firmware into BHI vec table */
777cd2954046a1 Muhammad Usama Anjum 2025-07-15 @467  		memcpy((*image)->mhi_buf->buf, fw_data, size);
777cd2954046a1 Muhammad Usama Anjum 2025-07-15  468  	}
f88f1d0998ea2e Matthew Leung        2025-01-17  469  
777cd2954046a1 Muhammad Usama Anjum 2025-07-15  470  	ret = mhi_fw_load_bhi(mhi_cntrl, &(*image)->mhi_buf[(*image)->entries - 1]);
777cd2954046a1 Muhammad Usama Anjum 2025-07-15  471  	if (ret) {
777cd2954046a1 Muhammad Usama Anjum 2025-07-15  472  		mhi_free_bhi_buffer(mhi_cntrl, *image);
777cd2954046a1 Muhammad Usama Anjum 2025-07-15  473  		*image = NULL;
777cd2954046a1 Muhammad Usama Anjum 2025-07-15  474  	}
f88f1d0998ea2e Matthew Leung        2025-01-17  475  
f88f1d0998ea2e Matthew Leung        2025-01-17  476  	return ret;
f88f1d0998ea2e Matthew Leung        2025-01-17  477  }
f88f1d0998ea2e Matthew Leung        2025-01-17  478  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
