Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E42733F6
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Jun 2024 19:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717527665; cv=none; b=IbB4auF9KjOu6PQ3oAW+EOHlPtWjaGJWav/4XPLH3z1yiShZUjGvDWeITTVMbOJJNnXwPG96X654zeoBW2tjZ7hgVII7Rz7hCE7YmqjTbAFVU0jLEEBwGcRfFORYOvxxgaN8IiGJdOZlwQmTHhotOolKmkqskoEHjT8zEyLc9vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717527665; c=relaxed/simple;
	bh=CwZTjHBXSR1KU4bAxE6Lne/kr0VMD2MLPM07rfOVChY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PaDUod66e23vVEoMehxRYCEHW3fXSRYr/AhwGgjrImltoIDFQtGXcHK+Bn0vXItPhc8Ls0Y27KCoXceHIJ69SBuBSWypw+ZTjUF+/J1AqZaOHvKzVnjY8h/nJYyxXLUA04W2vkRcV+VQY+z9FZm/qY7IiEne85kh2kJ88q7x7OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RD5PYCUF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RD5PYCUF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717527664; x=1749063664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CwZTjHBXSR1KU4bAxE6Lne/kr0VMD2MLPM07rfOVChY=;
  b=RD5PYCUFJSiKQ0CFeo/iauBpHG/KzL+WgL57hHAfuyuGWH/eAjuRZK71
   uzH0MW7fC2I1WZTaV49xTOIaGTBO+pMnSBM39ex1eNfJR0q23zJg4nnij
   e7GFvyVW1QtZf4P5zJrqRwnQOVQ1/wo0BA0HGRBjwgFiV06owQ8bnYNaY
   w+6BBBMISDm3evO3Pzx7OJiw9MdDR4c++ZhjvTHfIkeDZtNUdfnZGQxnM
   3Fg7iffQiQm2W3BfYSrSBO+AURZrENdAHhEkmEfdEnVs8uvK5I+kYBUCx
   Vf6V6ZlC5K1n6F/aKasXY1LnuhDrF9NIsmbqem4H8tEz2bIGIHznSU/Ai
   g==;
X-CSE-ConnectionGUID: pAJd3GvURbOFifgaJhHZ3w==
X-CSE-MsgGUID: HpqlEnaUQKOm5mQ5kt3zBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="13850395"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="13850395"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 12:01:03 -0700
X-CSE-ConnectionGUID: mtTuRDf0RA+v7BCZGf0WKA==
X-CSE-MsgGUID: J+4FTrwiTxu+iOOFD7AY/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="42280189"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 04 Jun 2024 12:01:01 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEZP0-0000Q7-2x;
	Tue, 04 Jun 2024 19:00:58 +0000
Date: Wed, 5 Jun 2024 03:00:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH -next 2/3] mm/hugetlb_cgroup: prepare cftypes based on
 template
Message-ID: <202406050210.OWthxCFt-lkp@intel.com>
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
In-Reply-To: <20240603120506.1837322-3-xiujianfeng@huawei.com>
References: <20240603120506.1837322-3-xiujianfeng@huawei.com>
TO: Xiu Jianfeng <xiujianfeng@huawei.com>
TO: akpm@linux-foundation.org
TO: muchun.song@linux.dev
CC: linux-mm@kvack.org
CC: linux-kernel@vger.kernel.org

Hi Xiu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiu-Jianfeng/mm-hugetlb_cgroup-identify-the-legacy-using-cgroup_subsys_on_dfl/20240603-201513
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240603120506.1837322-3-xiujianfeng%40huawei.com
patch subject: [PATCH -next 2/3] mm/hugetlb_cgroup: prepare cftypes based on template
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: i386-randconfig-r071-20240604 (https://download.01.org/0day-ci/archive/20240605/202406050210.OWthxCFt-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406050210.OWthxCFt-lkp@intel.com/

smatch warnings:
mm/hugetlb_cgroup.c:828 hugetlb_cgroup_cfttypes_init() warn: this array is probably non-NULL. 'tmpl->name'

vim +828 mm/hugetlb_cgroup.c

66bcc9ace99241 Xiu Jianfeng 2024-06-03  814  
66bcc9ace99241 Xiu Jianfeng 2024-06-03  815  static void __init
66bcc9ace99241 Xiu Jianfeng 2024-06-03  816  hugetlb_cgroup_cfttypes_init(struct hstate *h, struct cftype *cft,
66bcc9ace99241 Xiu Jianfeng 2024-06-03  817  			     struct cftype *tmpl, int tmpl_size)
66bcc9ace99241 Xiu Jianfeng 2024-06-03  818  {
66bcc9ace99241 Xiu Jianfeng 2024-06-03  819  	char buf[32];
66bcc9ace99241 Xiu Jianfeng 2024-06-03  820  	int i, idx = hstate_index(h);
66bcc9ace99241 Xiu Jianfeng 2024-06-03  821  
66bcc9ace99241 Xiu Jianfeng 2024-06-03  822  	/* format the size */
66bcc9ace99241 Xiu Jianfeng 2024-06-03  823  	mem_fmt(buf, sizeof(buf), huge_page_size(h));
66bcc9ace99241 Xiu Jianfeng 2024-06-03  824  
66bcc9ace99241 Xiu Jianfeng 2024-06-03  825  	for (i = 0; i < tmpl_size; cft++, tmpl++, i++) {
66bcc9ace99241 Xiu Jianfeng 2024-06-03  826  		*cft = *tmpl;
66bcc9ace99241 Xiu Jianfeng 2024-06-03  827  		/* rebuild the name */
66bcc9ace99241 Xiu Jianfeng 2024-06-03 @828  		if (tmpl->name)
66bcc9ace99241 Xiu Jianfeng 2024-06-03  829  			snprintf(cft->name, MAX_CFTYPE_NAME, "%s.%s", buf, tmpl->name);
66bcc9ace99241 Xiu Jianfeng 2024-06-03  830  		/* rebuild the private */
66bcc9ace99241 Xiu Jianfeng 2024-06-03  831  		if (tmpl->private)
66bcc9ace99241 Xiu Jianfeng 2024-06-03  832  			cft->private = MEMFILE_PRIVATE(idx, tmpl->private);
66bcc9ace99241 Xiu Jianfeng 2024-06-03  833  		/* rebuild the file_offset */
66bcc9ace99241 Xiu Jianfeng 2024-06-03  834  		if (tmpl->file_offset) {
66bcc9ace99241 Xiu Jianfeng 2024-06-03  835  			unsigned int offset = tmpl->file_offset;
66bcc9ace99241 Xiu Jianfeng 2024-06-03  836  
66bcc9ace99241 Xiu Jianfeng 2024-06-03  837  			cft->file_offset = MEMFILE_OFFSET0(offset) +
66bcc9ace99241 Xiu Jianfeng 2024-06-03  838  					   MEMFILE_FIELD_SIZE(offset) * idx;
66bcc9ace99241 Xiu Jianfeng 2024-06-03  839  		}
66bcc9ace99241 Xiu Jianfeng 2024-06-03  840  	}
66bcc9ace99241 Xiu Jianfeng 2024-06-03  841  }
66bcc9ace99241 Xiu Jianfeng 2024-06-03  842  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
