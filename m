Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D5768B62
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Dec 2023 17:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IIEnnxlu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701797710; x=1733333710;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zbIs58J2MCqFcIDJ1q9FLYJ7zh9e/FL1BsSL3kFN8LA=;
  b=IIEnnxluJJs8fgAlyXVpzHGj5POZsv8E3xnSWymQdhYj0JOHwvAgSn+8
   s8JNlr8NhnlnXWiGXmDkNLlZugGxZXglX6pZGWMsy+j+F4GSUY3zvdx5n
   22wuYUaUezzKSarVcBEUWN0fdSFub7N+z7AjVQgFI0PcgKi+xCyGzCd2X
   IYPXqKw3vG3vZYBPFB5HENiUo3AIJod3oEUm94rszKLrdwIfgSWcrQifY
   446C16OLV7AkzMWYvR6bzI8iU0RgjPdjPps3/OzjPOYevf4+JhboAAeWm
   tAGhDif/21OELRKjlMRaMeAjpCCWniizTzI+1EqfwAwuH1L3xleGWFkwg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="807532"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="807532"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 09:35:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="889013726"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="889013726"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 05 Dec 2023 09:35:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAZK5-0009SQ-0I;
	Tue, 05 Dec 2023 17:35:05 +0000
Date: Wed, 6 Dec 2023 01:34:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/seq_file.c:938:9: sparse:    struct list_head [noderef] __rcu *
Message-ID: <202312060114.AIH2hMlu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/seq_file.c:938:9: sparse:    struct list_head [noderef] __rcu *"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: ad25f5cb39872ca14bcbe00816ae65c22fe04b89 rxrpc: Fix locking issue
date:   1 year, 6 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 1 year, 6 months ago
config: x86_64-alldefconfig (https://download.01.org/0day-ci/archive/20231206/202312060114.AIH2hMlu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060114.AIH2hMlu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312060114.AIH2hMlu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/seq_file.c:938:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
>> fs/seq_file.c:938:9: sparse:    struct list_head [noderef] __rcu *
>> fs/seq_file.c:938:9: sparse:    struct list_head *
   fs/seq_file.c:938:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
>> fs/seq_file.c:938:9: sparse:    struct list_head [noderef] __rcu *
>> fs/seq_file.c:938:9: sparse:    struct list_head *
>> fs/seq_file.c:960:12: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct list_head *lh @@     got struct list_head [noderef] __rcu * @@
   fs/seq_file.c:960:12: sparse:     expected struct list_head *lh
   fs/seq_file.c:960:12: sparse:     got struct list_head [noderef] __rcu *
   fs/seq_file.c:1087:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/seq_file.c:1087:24: sparse:    struct hlist_node [noderef] __rcu *
   fs/seq_file.c:1087:24: sparse:    struct hlist_node *
   fs/seq_file.c:1089:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/seq_file.c:1089:24: sparse:    struct hlist_node [noderef] __rcu *
   fs/seq_file.c:1089:24: sparse:    struct hlist_node *

vim +938 fs/seq_file.c

66655de6d132b7 Li Zefan      2010-02-08  933  
ad25f5cb39872c David Howells 2022-05-21  934  struct list_head *seq_list_start_rcu(struct list_head *head, loff_t pos)
ad25f5cb39872c David Howells 2022-05-21  935  {
ad25f5cb39872c David Howells 2022-05-21  936  	struct list_head *lh;
ad25f5cb39872c David Howells 2022-05-21  937  
ad25f5cb39872c David Howells 2022-05-21 @938  	list_for_each_rcu(lh, head)
ad25f5cb39872c David Howells 2022-05-21  939  		if (pos-- == 0)
ad25f5cb39872c David Howells 2022-05-21  940  			return lh;
ad25f5cb39872c David Howells 2022-05-21  941  
ad25f5cb39872c David Howells 2022-05-21  942  	return NULL;
ad25f5cb39872c David Howells 2022-05-21  943  }
ad25f5cb39872c David Howells 2022-05-21  944  EXPORT_SYMBOL(seq_list_start_rcu);
ad25f5cb39872c David Howells 2022-05-21  945  
ad25f5cb39872c David Howells 2022-05-21  946  struct list_head *seq_list_start_head_rcu(struct list_head *head, loff_t pos)
ad25f5cb39872c David Howells 2022-05-21  947  {
ad25f5cb39872c David Howells 2022-05-21  948  	if (!pos)
ad25f5cb39872c David Howells 2022-05-21  949  		return head;
ad25f5cb39872c David Howells 2022-05-21  950  
ad25f5cb39872c David Howells 2022-05-21  951  	return seq_list_start_rcu(head, pos - 1);
ad25f5cb39872c David Howells 2022-05-21  952  }
ad25f5cb39872c David Howells 2022-05-21  953  EXPORT_SYMBOL(seq_list_start_head_rcu);
ad25f5cb39872c David Howells 2022-05-21  954  
ad25f5cb39872c David Howells 2022-05-21  955  struct list_head *seq_list_next_rcu(void *v, struct list_head *head,
ad25f5cb39872c David Howells 2022-05-21  956  				    loff_t *ppos)
ad25f5cb39872c David Howells 2022-05-21  957  {
ad25f5cb39872c David Howells 2022-05-21  958  	struct list_head *lh;
ad25f5cb39872c David Howells 2022-05-21  959  
ad25f5cb39872c David Howells 2022-05-21 @960  	lh = list_next_rcu((struct list_head *)v);
ad25f5cb39872c David Howells 2022-05-21  961  	++*ppos;
ad25f5cb39872c David Howells 2022-05-21  962  	return lh == head ? NULL : lh;
ad25f5cb39872c David Howells 2022-05-21  963  }
ad25f5cb39872c David Howells 2022-05-21  964  EXPORT_SYMBOL(seq_list_next_rcu);
ad25f5cb39872c David Howells 2022-05-21  965  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
