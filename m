Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0A920E6
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Jul 2024 02:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719972584; cv=none; b=B+3MdIWbXM4PtLm6PJQcxg5398usNJQcw4lVc122lvdU1QwaOHiMV6gSpKdO0VDI50JFfU4OWSgdBaJMsyFYXEsJY80puaVG/NH4AGVwuXBJmOreHNc/uE0Ftd3mT9HZJG7lGbMt2o4OD7lqTdXs5dM3tTa99YMzl5HdFC9D8z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719972584; c=relaxed/simple;
	bh=nbcuK+vES2vgg3BsLSfC/JiCRgyzSe5TwqLIjbhWANo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WPsYTEi6UeuIPRAGtH1YFLtvcfgLwg8TW35V/vjvPdmGWUt5hveDi0dYf1fuAr5J3T8U0ymDZvjCYPnZLzy2s5CU7RsPKs7bfZbFOuZsbUqYnq/7Yehiyw2/o12ZIRsMRZr5dTSC0u9ZCeV9zEkcCndJZmGMIKX80P7URsejllg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YYfqKP3x; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YYfqKP3x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719972582; x=1751508582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nbcuK+vES2vgg3BsLSfC/JiCRgyzSe5TwqLIjbhWANo=;
  b=YYfqKP3x1DOs606AxDnu5YVkpRbfOv84VZTnUGBJu8B/5BibFlwam041
   3tpjHXRMMFxEtltao+rW1C5TrQB1rFg4ULfQ8jnRxcqoSpaZnBwMehFxh
   m1xLYg0t3O4Rn9DHhfrzC6yat0Pyc8vWrVoJWLukOfkFM1mNaHeT/gAY+
   8izYFNF+qdrfUuzjmERY2XDbeoQeCPVO5wvsryn0Qyjl4IobeOpS3qkwP
   wqw/DTlVxh0t1byCuLKt+k788myBp+sT5YEYkONUv6iD8opRI37aGVEyY
   Yo1gmR+1/aV5R7OE4kfMzHNvsIuthD7Xk4qoUWtnSU/i+3zD3Yrhw+U7w
   g==;
X-CSE-ConnectionGUID: sL61uqjNSc6HEkMTfpVFKg==
X-CSE-MsgGUID: d/3BS/I1RpOmiIJYXe1XrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="42606827"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="42606827"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 19:09:42 -0700
X-CSE-ConnectionGUID: r2QScSIYQUqdpBPRdHduTQ==
X-CSE-MsgGUID: xIG2qR90R/iiBrS0/XCzEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="50702296"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Jul 2024 19:09:40 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOpRC-000P8f-2K;
	Wed, 03 Jul 2024 02:09:38 +0000
Date: Wed, 3 Jul 2024 10:08:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [l1k:cma_v2 16/18] lib/spdm/req-sysfs.c:561 (null)() warn: (struct
 ctl_table)->procname cannot be NULL. Expression :
 spdm_ctl_table[1]->procname
Message-ID: <202407030953.sCqcnOH7-lkp@intel.com>
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
TO: Lukas Wunner <lukas@wunner.de>

tree:   https://github.com/l1k/linux cma_v2
head:   ee3248f9f8d60cff9106a5a46c5f5d53ac81e60a
commit: 2e6ee6670a5d450bc880e77a892ea0227a2cc3b4 [16/18] spdm: Limit memory consumed by log of received signatures
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: alpha-randconfig-r081-20240703 (https://download.01.org/0day-ci/archive/20240703/202407030953.sCqcnOH7-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407030953.sCqcnOH7-lkp@intel.com/

smatch warnings:
lib/spdm/req-sysfs.c:561 (null)() warn: (struct ctl_table)->procname cannot be NULL. Expression : spdm_ctl_table[1]->procname
lib/spdm/req-sysfs.c:561 (null)() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : spdm_ctl_table[1]->proc_handler

vim +561 lib/spdm/req-sysfs.c

2e6ee6670a5d45 Lukas Wunner 2024-06-22  560  
2e6ee6670a5d45 Lukas Wunner 2024-06-22 @561  static struct ctl_table spdm_ctl_table[] = {
2e6ee6670a5d45 Lukas Wunner 2024-06-22  562  	{
2e6ee6670a5d45 Lukas Wunner 2024-06-22  563  		.procname	= "max_signatures_size",
2e6ee6670a5d45 Lukas Wunner 2024-06-22  564  		.data		= &spdm_max_log_sz,
2e6ee6670a5d45 Lukas Wunner 2024-06-22  565  		.maxlen		= sizeof(spdm_max_log_sz),
2e6ee6670a5d45 Lukas Wunner 2024-06-22  566  		.mode		= 0644,
2e6ee6670a5d45 Lukas Wunner 2024-06-22  567  		.proc_handler	= proc_max_log_sz,
2e6ee6670a5d45 Lukas Wunner 2024-06-22  568  		.extra1		= SYSCTL_ZERO,
2e6ee6670a5d45 Lukas Wunner 2024-06-22  569  				  /*
2e6ee6670a5d45 Lukas Wunner 2024-06-22  570  				   * 2 GiB limit avoids filename collision on
2e6ee6670a5d45 Lukas Wunner 2024-06-22  571  				   * wraparound of unsigned 32-bit log_counter
2e6ee6670a5d45 Lukas Wunner 2024-06-22  572  				   */
2e6ee6670a5d45 Lukas Wunner 2024-06-22  573  		.extra2		= SYSCTL_INT_MAX,
2e6ee6670a5d45 Lukas Wunner 2024-06-22  574  	},
2e6ee6670a5d45 Lukas Wunner 2024-06-22  575  	{ }
2e6ee6670a5d45 Lukas Wunner 2024-06-22  576  };
2e6ee6670a5d45 Lukas Wunner 2024-06-22  577  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
