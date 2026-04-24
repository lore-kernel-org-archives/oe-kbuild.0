Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124373BADBD
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Apr 2026 12:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777032485; cv=none; b=COOH+zX2/XWQQxMN8u6Tz00Jm5DvFAcZ+ecgoBV0AvgjCu7mkSncbDujLh0/k4rNbOxgYZfA2sKR3uJKbZo64SQAqE6JfML1RqwMl6qVmikKJv4uCe0eo7bIwyINwbAHTBRbywx3Ju4Ua9o1j7N2qcMyQiwHcG8KfYagCa4Nvyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777032485; c=relaxed/simple;
	bh=fwr/XQCtUPlUA2dwlR7VgGyb7NNll2zTOzrOqvULb/Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Rw3ijof/38sQkg8cyylZ9f1vdfewNgFs2nfEuAViOlLlIaUi2Zs9a0/v7uTnIyDf6O+b0N1409UBLvVTsZDKXR5LmXd3zkUzZ+OcCkn+QU2aXjI6D7P0ZENxgYa552KQartAwHi007TGYJhWcO8TZDXSZjgDQl6f6zixgY+39CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fEZvtFQ1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fEZvtFQ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777032481; x=1808568481;
  h=date:from:to:cc:subject:message-id;
  bh=fwr/XQCtUPlUA2dwlR7VgGyb7NNll2zTOzrOqvULb/Q=;
  b=fEZvtFQ1eGYPk0lmfXUx307Pr/KYAwKBOZ7VCHTfBF6bUNB6N+CZH6M1
   O6v0DhSozSleck0zNA9SclpYKKCgKYtXheYT3K9wNkpdYTvygxO2w7BbS
   O82JiCIYJDPIFcrnG2uhVnK84x1xSC+6v8z6xgtKn3X6jSASLV4YQbKR+
   7mMY0afCc79rz0SlY4H6F07lc8+9x4NyZXvMlb0P0PUp2u5k0IPJ85Sfr
   gh0sW6lWi7icCgq7WvMW/ZkMaqVDDdIDxlRflvg1vVmxZ9CwXtwiY95wk
   gHGfwaW4orKOcJr1ZoqYB4BRzz+NZGKTx7IMREDzxFozyrfRfI0s/m5fU
   w==;
X-CSE-ConnectionGUID: 7kcd5hf0SAynxrn0buyMjQ==
X-CSE-MsgGUID: /wVc1DVUQK695uOVcXk8hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="77714408"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="77714408"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 05:08:01 -0700
X-CSE-ConnectionGUID: V+tRW9VITECvZk19ql8JGA==
X-CSE-MsgGUID: Oq2MUfY4TFSgKgRejvU7Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="237934480"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 24 Apr 2026 05:08:01 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGFKB-000000003FV-29Hp;
	Fri, 24 Apr 2026 12:07:59 +0000
Date: Fri, 24 Apr 2026 14:07:32 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ./include/linux/dax.h:128:57: warning: 'struct dev_dax'
 declared inside parameter list will not be visible outside of this definition
 or declaration
Message-ID: <202604241425.Olr5CRyG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Dave Jiang <dave.jiang@intel.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Dave-Jiang/dax-rate-limit-dev_dax_huge_fault-output/20260424-144914
head:   f8b7f4f5432fa1c0c2c4ef2cb58a045a0d731b17
commit: 47020bf7b7d299052892066672b32b2fe6598a9e dax: Add dax_get_dev_dax() helper function
date:   5 hours ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260424/202604241425.Olr5CRyG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260424/202604241425.Olr5CRyG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604241425.Olr5CRyG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/filemap.c:15:
>> ./include/linux/dax.h:128:57: warning: 'struct dev_dax' declared inside parameter list will not be visible outside of this definition or declaration
     128 | static inline struct dax_device *dax_get_dev_dax(struct dev_dax *dev_dax)
         |                                                         ^~~~~~~


vim +128 ./include/linux/dax.h

47020bf7b7d299 Dave Jiang        2026-04-23   67  
32de1484648a83 Pankaj Gupta      2019-07-05   68  /*
32de1484648a83 Pankaj Gupta      2019-07-05   69   * Check if given mapping is supported by the file / underlying device.
32de1484648a83 Pankaj Gupta      2019-07-05   70   */
0335f6afd3488d Lorenzo Stoakes   2025-06-16   71  static inline bool daxdev_mapping_supported(vm_flags_t vm_flags,
0335f6afd3488d Lorenzo Stoakes   2025-06-16   72  					    const struct inode *inode,
32de1484648a83 Pankaj Gupta      2019-07-05   73  					    struct dax_device *dax_dev)
32de1484648a83 Pankaj Gupta      2019-07-05   74  {
0335f6afd3488d Lorenzo Stoakes   2025-06-16   75  	if (!(vm_flags & VM_SYNC))
32de1484648a83 Pankaj Gupta      2019-07-05   76  		return true;
0335f6afd3488d Lorenzo Stoakes   2025-06-16   77  	if (!IS_DAX(inode))
32de1484648a83 Pankaj Gupta      2019-07-05   78  		return false;
32de1484648a83 Pankaj Gupta      2019-07-05   79  	return dax_synchronous(dax_dev);
32de1484648a83 Pankaj Gupta      2019-07-05   80  }
f5705aa8cfed14 Dan Williams      2017-05-13   81  #else
8012b866085523 Shiyang Ruan      2022-06-03   82  static inline void *dax_holder(struct dax_device *dax_dev)
8012b866085523 Shiyang Ruan      2022-06-03   83  {
8012b866085523 Shiyang Ruan      2022-06-03   84  	return NULL;
8012b866085523 Shiyang Ruan      2022-06-03   85  }
fb08a1908cb119 Christoph Hellwig 2021-11-29   86  static inline struct dax_device *alloc_dax(void *private,
30c6828a17a572 Christoph Hellwig 2021-12-15   87  		const struct dax_operations *ops)
976431b02c2ef9 Dan Williams      2018-03-29   88  {
6d439c18d9b190 Mathieu Desnoyers 2024-02-15   89  	return ERR_PTR(-EOPNOTSUPP);
976431b02c2ef9 Dan Williams      2018-03-29   90  }
f5705aa8cfed14 Dan Williams      2017-05-13   91  static inline void put_dax(struct dax_device *dax_dev)
f5705aa8cfed14 Dan Williams      2017-05-13   92  {
f5705aa8cfed14 Dan Williams      2017-05-13   93  }
976431b02c2ef9 Dan Williams      2018-03-29   94  static inline void kill_dax(struct dax_device *dax_dev)
976431b02c2ef9 Dan Williams      2018-03-29   95  {
976431b02c2ef9 Dan Williams      2018-03-29   96  }
976431b02c2ef9 Dan Williams      2018-03-29   97  static inline void dax_write_cache(struct dax_device *dax_dev, bool wc)
976431b02c2ef9 Dan Williams      2018-03-29   98  {
976431b02c2ef9 Dan Williams      2018-03-29   99  }
976431b02c2ef9 Dan Williams      2018-03-29  100  static inline bool dax_write_cache_enabled(struct dax_device *dax_dev)
976431b02c2ef9 Dan Williams      2018-03-29  101  {
976431b02c2ef9 Dan Williams      2018-03-29  102  	return false;
976431b02c2ef9 Dan Williams      2018-03-29  103  }
fefc1d97fa4b5e Pankaj Gupta      2019-07-05  104  static inline bool dax_synchronous(struct dax_device *dax_dev)
fefc1d97fa4b5e Pankaj Gupta      2019-07-05  105  {
fefc1d97fa4b5e Pankaj Gupta      2019-07-05  106  	return true;
fefc1d97fa4b5e Pankaj Gupta      2019-07-05  107  }
2807c54b3809ca Mathieu Desnoyers 2024-02-15  108  static inline void set_dax_nocache(struct dax_device *dax_dev)
2807c54b3809ca Mathieu Desnoyers 2024-02-15  109  {
2807c54b3809ca Mathieu Desnoyers 2024-02-15  110  }
2807c54b3809ca Mathieu Desnoyers 2024-02-15  111  static inline void set_dax_nomc(struct dax_device *dax_dev)
2807c54b3809ca Mathieu Desnoyers 2024-02-15  112  {
2807c54b3809ca Mathieu Desnoyers 2024-02-15  113  }
fefc1d97fa4b5e Pankaj Gupta      2019-07-05  114  static inline void set_dax_synchronous(struct dax_device *dax_dev)
fefc1d97fa4b5e Pankaj Gupta      2019-07-05  115  {
fefc1d97fa4b5e Pankaj Gupta      2019-07-05  116  }
0335f6afd3488d Lorenzo Stoakes   2025-06-16  117  static inline bool daxdev_mapping_supported(vm_flags_t vm_flags,
0335f6afd3488d Lorenzo Stoakes   2025-06-16  118  					    const struct inode *inode,
32de1484648a83 Pankaj Gupta      2019-07-05  119  					    struct dax_device *dax_dev)
32de1484648a83 Pankaj Gupta      2019-07-05  120  {
0335f6afd3488d Lorenzo Stoakes   2025-06-16  121  	return !(vm_flags & VM_SYNC);
32de1484648a83 Pankaj Gupta      2019-07-05  122  }
047218ec904da1 Jane Chu          2022-04-22  123  static inline size_t dax_recovery_write(struct dax_device *dax_dev,
047218ec904da1 Jane Chu          2022-04-22  124  		pgoff_t pgoff, void *addr, size_t bytes, struct iov_iter *i)
047218ec904da1 Jane Chu          2022-04-22  125  {
047218ec904da1 Jane Chu          2022-04-22  126  	return 0;
047218ec904da1 Jane Chu          2022-04-22  127  }
47020bf7b7d299 Dave Jiang        2026-04-23 @128  static inline struct dax_device *dax_get_dev_dax(struct dev_dax *dev_dax)
47020bf7b7d299 Dave Jiang        2026-04-23  129  {
47020bf7b7d299 Dave Jiang        2026-04-23  130  	return NULL;
47020bf7b7d299 Dave Jiang        2026-04-23  131  }
f5705aa8cfed14 Dan Williams      2017-05-13  132  #endif
f5705aa8cfed14 Dan Williams      2017-05-13  133  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
