Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC0128C03B
	for <oe-kbuild@lists.linux.dev>; Mon, 21 Jul 2025 13:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753104092; cv=none; b=s2kZBaCT8Fimq9zP/SF70WGxY7tDA2Sfx9Ok/rCqQqxKuiFKZBcLug2146rAR4JChvtTqZo5Dq8uiUqYy8g+GfZGBGyRncBR5Gsl591CZUZwV3ZLIudLvWU4wN8/h2ttxTg3fg1U/34zLNfJl3/WyJO4kjBzsxE8k3/Qa0Q99e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753104092; c=relaxed/simple;
	bh=yG1jxeMTuEf172S2z2AFPhNwjuTtc6uQMPdOnGhvM1o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Al8StasqF8nmChmpxyqZNwLUZ5ByJPJrcM0AI3/NDMcf0qozIeA+knEZq/9zLDe44pruG9+549LEaWgVhZMgklWKUeJaEf7KSOVa+VdAWBZq/yLkzV2i6bNblWGRFEPVfONzZoIDNK+C8Ce4PxfbyjZOY+s46zp7pGg63l1JFV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DGm3PZiK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DGm3PZiK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753104091; x=1784640091;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yG1jxeMTuEf172S2z2AFPhNwjuTtc6uQMPdOnGhvM1o=;
  b=DGm3PZiKJtiOiDyEhJAznbxhbklQIAB83zOnTS2Xzn36hERN4olgoUvI
   2E/wUOaLT2A55e6sVlZ4WnaQptSLj98l1CFbsQyQ3Gj8qqpDESz2HvSlv
   8KZglJTk2oMeNDCxUGDykIs4sqv24a2+QpC11EqSujA7e4/c0WYs2Uss0
   zl5TtJ4TN6srd8H/kpJg358G3LZpf5xW8kb7Q7iROOOTF+HTu6ro7Vjsv
   HxCjJgQoUnjc90oPPzgcmy377Sf8+vaOCvR/2i3QsfNdiHQlCuKPqs+dR
   D9btQjQBqZtQO6SaIsZCbguExASSGwIHFZiHAdFuDyqfOywkQw3h9IDo6
   g==;
X-CSE-ConnectionGUID: Nppy2T+mQ8aTjN4g4J0nYw==
X-CSE-MsgGUID: sqp2qs0VQQiGV0MzkB5zlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55412312"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="55412312"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 06:21:30 -0700
X-CSE-ConnectionGUID: MykXSJ3ZQRCAcnJciZBpTA==
X-CSE-MsgGUID: hKPmy56ASvq9CWBYp8q+AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="158172679"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Jul 2025 06:21:29 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udqSM-000GpR-16;
	Mon, 21 Jul 2025 13:21:26 +0000
Date: Mon, 21 Jul 2025 21:20:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 2/3] bus: mhi: host: keep bhie buffer through suspend
 cycle
Message-ID: <202507212035.KdorzQHi-lkp@intel.com>
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
In-Reply-To: <20250715132509.2643305-3-usama.anjum@collabora.com>
References: <20250715132509.2643305-3-usama.anjum@collabora.com>
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
[cannot apply to linus/master v6.16-rc7 next-20250721]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Muhammad-Usama-Anjum/bus-mhi-host-keep-bhi-buffer-through-suspend-cycle/20250715-213507
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
patch link:    https://lore.kernel.org/r/20250715132509.2643305-3-usama.anjum%40collabora.com
patch subject: [PATCH v2 2/3] bus: mhi: host: keep bhie buffer through suspend cycle
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: microblaze-randconfig-r073-20250720 (https://download.01.org/0day-ci/archive/20250721/202507212035.KdorzQHi-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507212035.KdorzQHi-lkp@intel.com/

New smatch warnings:
drivers/bus/mhi/host/boot.c:489 mhi_load_image_bhie() error: we previously assumed '*image' could be null (see line 484)

Old smatch warnings:
drivers/bus/mhi/host/boot.c:467 mhi_load_image_bhi() error: we previously assumed '*image' could be null (see line 461)
drivers/bus/mhi/host/boot.c:611 mhi_fw_load_handler() error: we previously assumed 'mhi_cntrl->fbc_image' could be null (see line 601)

vim +489 drivers/bus/mhi/host/boot.c

f88f1d0998ea2e5 Matthew Leung        2025-01-17  478  
f88f1d0998ea2e5 Matthew Leung        2025-01-17  479  static int mhi_load_image_bhie(struct mhi_controller *mhi_cntrl, const u8 *fw_data, size_t size)
f88f1d0998ea2e5 Matthew Leung        2025-01-17  480  {
c46b43146b53aed Muhammad Usama Anjum 2025-07-15  481  	struct image_info **image = &mhi_cntrl->bhie_image;
f88f1d0998ea2e5 Matthew Leung        2025-01-17  482  	int ret;
f88f1d0998ea2e5 Matthew Leung        2025-01-17  483  
c46b43146b53aed Muhammad Usama Anjum 2025-07-15 @484  	if (!(*image)) {
c46b43146b53aed Muhammad Usama Anjum 2025-07-15  485  		ret = mhi_alloc_bhie_table(mhi_cntrl, image, size);
f88f1d0998ea2e5 Matthew Leung        2025-01-17  486  		if (ret)
f88f1d0998ea2e5 Matthew Leung        2025-01-17  487  			return ret;
f88f1d0998ea2e5 Matthew Leung        2025-01-17  488  
c46b43146b53aed Muhammad Usama Anjum 2025-07-15 @489  		mhi_firmware_copy_bhie(mhi_cntrl, fw_data, size, *image);
c46b43146b53aed Muhammad Usama Anjum 2025-07-15  490  	}
f88f1d0998ea2e5 Matthew Leung        2025-01-17  491  
c46b43146b53aed Muhammad Usama Anjum 2025-07-15  492  	ret = mhi_fw_load_bhie(mhi_cntrl, &(*image)->mhi_buf[(*image)->entries - 1]);
c46b43146b53aed Muhammad Usama Anjum 2025-07-15  493  	if (ret) {
c46b43146b53aed Muhammad Usama Anjum 2025-07-15  494  		mhi_free_bhie_table(mhi_cntrl, *image);
c46b43146b53aed Muhammad Usama Anjum 2025-07-15  495  		*image = NULL;
c46b43146b53aed Muhammad Usama Anjum 2025-07-15  496  	}
f88f1d0998ea2e5 Matthew Leung        2025-01-17  497  
f88f1d0998ea2e5 Matthew Leung        2025-01-17  498  	return ret;
f88f1d0998ea2e5 Matthew Leung        2025-01-17  499  }
f88f1d0998ea2e5 Matthew Leung        2025-01-17  500  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
