Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBFB4E1C6
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Dec 2023 20:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JcLZ4d2P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701980636; x=1733516636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XvqDWQpZ79+Z6n4J3PjD1yYGf2/lhboDqQlJOiILzRc=;
  b=JcLZ4d2P0sbqfFUjeyICVixDJS7AUtuTFrqRRNwd01KYaWuWn6keUxKc
   t/fuxqVeqd0WHLX7OTy0Zcs4j+awra+NXYKVuvM58ET3dFHLjhuo7SpBn
   3rCJT2AupsZLlrNFQhI5VZ98mCjzg5/AfemV+qq840pQmW7ZlmwHQR+fB
   JKGgeinZrlAEtTsuCvmAnW0pr+euXiJYvlFp6T5CvSAd59gcL2abVEIqt
   uSY1xOOCv3W7iWqQkQScD/VFApon42n8jNPVEl8MsPCopiz+0XaFJLsGl
   tbbUBFRvU2sNujw8P7N09iOjmuFkmEKYCFm64JSl1OaFM2IjEPE7PPf7X
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1369523"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="1369523"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 12:23:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="748094962"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="748094962"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 07 Dec 2023 12:23:53 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBKuV-000Cn5-01;
	Thu, 07 Dec 2023 20:23:51 +0000
Date: Fri, 8 Dec 2023 04:22:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/seq_file.c:938:9: sparse:    struct list_head [noderef] __rcu *
Message-ID: <202312080406.BXoED6g7-lkp@intel.com>
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
date:   1 year, 7 months ago
:::::: branch date: 3 days ago
:::::: commit date: 1 year, 7 months ago
config: x86_64-alldefconfig (https://download.01.org/0day-ci/archive/20231208/202312080406.BXoED6g7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231208/202312080406.BXoED6g7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312080406.BXoED6g7-lkp@intel.com/

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
