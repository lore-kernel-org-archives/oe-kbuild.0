Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C50205E26
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Nov 2025 01:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762220069; cv=none; b=Gg847wm+gE3L9926EhONyUFdNOV7732mbHOZGPr6P+OVZxxSFcmUa1ts0HRgsNxmpLgbTMtNSWdNWehTIfb1kw3cwvWOm1tbdvtIfOhI5HXIjaO8KZpGGsANFJWLFxGN7iiAtP/eIY185eyhyVxFGCPkGLdHpzasp28xMGUnkdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762220069; c=relaxed/simple;
	bh=3B83MulzzrzXRyVcXYrFDAtD6FxZugrNnlAjBKRHvuA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y8iwn5GBNlsRQzJJckSbwI7S6lZVY/VIA/3Nfqa8EYCeVPlQGFxBs6f6UGWFHrigsyBwCsTcb4NtUPNIK1p59H+aZVcDnnGvH7bpBQVwRBA45v3Z0cXJAud+wrQ6+bxMN2FfErXydxsPn/XI0EFnetDPhDmE/M4a2nGWYnAugxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IEGBNF4i; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IEGBNF4i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762220067; x=1793756067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3B83MulzzrzXRyVcXYrFDAtD6FxZugrNnlAjBKRHvuA=;
  b=IEGBNF4iImcxYOLjR8uJc2pkDDFhTxx71wwrNH1yg2JUX90CZO6Rb4S+
   3+fOmx7uNeUtXg440TdBZFsMI2ct8roa+iGTFE8FjNdPtffYaOTeL5E2v
   KE5TwNUfbE8Dki2la15yZqTU1lF7eE1/BLCry93zkBnhwsJZudYX9NBtM
   XLH7Hj7Rlga/8Ls1WK9ZgacYw0GEYCWJsAkdPVmUr4eFpJkLTFJgZi2mL
   WlvUxMR2NvhrLltIYh/vAEZ4F9BakUqCXL25JsTtFJV/tSrSHafDRyMzS
   Cv9BQjHrlWGEQGs/3neFQV6zm7JvJjbbt1DQkCLOIGnxYThdYDdL1uqUo
   A==;
X-CSE-ConnectionGUID: /aoqqbZ6T4iIgky6jZuAMA==
X-CSE-MsgGUID: 7utNzLRVRSSqHtVb2vAKpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="63510096"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="63510096"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 17:34:26 -0800
X-CSE-ConnectionGUID: g2JB2tz+QNq3kYE4hlEGBw==
X-CSE-MsgGUID: 8Y/+HoSIS1uYxYkNeP7sxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="186707180"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 03 Nov 2025 17:34:25 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vG5w1-000Qj6-07;
	Tue, 04 Nov 2025 01:34:13 +0000
Date: Tue, 4 Nov 2025 09:34:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] crash: export crashkernel CMA reservation to
 userspace
Message-ID: <202511040916.4kKqIhwj-lkp@intel.com>
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
In-Reply-To: <20251103035859.1267318-3-sourabhjain@linux.ibm.com>
References: <20251103035859.1267318-3-sourabhjain@linux.ibm.com>
TO: Sourabh Jain <sourabhjain@linux.ibm.com>
TO: linux-kernel@vger.kernel.org
CC: Sourabh Jain <sourabhjain@linux.ibm.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Baoquan he <bhe@redhat.com>
CC: Jiri Bohac <jbohac@suse.cz>
CC: Shivang Upadhyay <shivangu@linux.ibm.com>
CC: linuxppc-dev@lists.ozlabs.org
CC: kexec@lists.infradead.org

Hi Sourabh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.18-rc4 next-20251103]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sourabh-Jain/Documentation-ABI-add-kexec-and-kdump-sysfs-interface/20251103-120104
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251103035859.1267318-3-sourabhjain%40linux.ibm.com
patch subject: [PATCH 2/2] crash: export crashkernel CMA reservation to userspace
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: i386-randconfig-141-20251103 (https://download.01.org/0day-ci/archive/20251104/202511040916.4kKqIhwj-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511040916.4kKqIhwj-lkp@intel.com/

smatch warnings:
kernel/ksysfs.c:145 kexec_crash_cma_ranges_show() warn: we never enter this loop

vim +145 kernel/ksysfs.c

1f3b3cc7e1954c Sourabh Jain 2025-11-03  141  
1f3b3cc7e1954c Sourabh Jain 2025-11-03  142  	ssize_t len = 0;
1f3b3cc7e1954c Sourabh Jain 2025-11-03  143  	int i;
1f3b3cc7e1954c Sourabh Jain 2025-11-03  144  
1f3b3cc7e1954c Sourabh Jain 2025-11-03 @145  	for (i = 0; i < crashk_cma_cnt; ++i) {
1f3b3cc7e1954c Sourabh Jain 2025-11-03  146  		len += sysfs_emit_at(buf, len, "%08llx-%08llx\n",
1f3b3cc7e1954c Sourabh Jain 2025-11-03  147  				     crashk_cma_ranges[i].start,
1f3b3cc7e1954c Sourabh Jain 2025-11-03  148  				     crashk_cma_ranges[i].end);
1f3b3cc7e1954c Sourabh Jain 2025-11-03  149  	}
1f3b3cc7e1954c Sourabh Jain 2025-11-03  150  	return len;
1f3b3cc7e1954c Sourabh Jain 2025-11-03  151  }
1f3b3cc7e1954c Sourabh Jain 2025-11-03  152  KERNEL_ATTR_RO(kexec_crash_cma_ranges);
1f3b3cc7e1954c Sourabh Jain 2025-11-03  153  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
