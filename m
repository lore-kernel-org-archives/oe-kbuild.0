Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA38A13B2B8
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Jan 2025 06:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737180394; cv=none; b=jp39EMfGjyeO5xYULlQpGmwdhgKWxQ1Y/JtU6O06kDZbhLO42+kRJGA9Nrbc0NNudCDWxXFxtVoNN+/ORUP84bLPlB9K6rzRKcN/INHjg9VAExedEMf/5HW1DTWWfh/KKP2+j334pZOju5p2HQdP2UKFcDghcP1zvKOegC9cXQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737180394; c=relaxed/simple;
	bh=Cc6KY54/47Pm4n59Sofr1aKB3zRhq+cYVxx5pprqgNc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u+Yn5/QSvcnZqSMkDkqjnsIqgiNCSZZcEHrM2mt83DrEgb9FH4iIO83uBrNOUGVYMaQqnfEIWVCkegNREgBLqVLGHwnL2DAHseD3KAwdy2YH3vzSBwcN8ONOxHPV9IBypyYjh9fWDMGNRosa93Hmg4uD3cC/k4yKbA22XstaePU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M5gBTGKs; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M5gBTGKs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737180393; x=1768716393;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cc6KY54/47Pm4n59Sofr1aKB3zRhq+cYVxx5pprqgNc=;
  b=M5gBTGKsuqhgFCkS0pt3mwNSyrskXroZbOuxxPeomhaexZa6XG/UsfzX
   XwtRdgLWRkgCAJ78xN/yOzuGNQBL3c9gALyChoUvz0ol/yNF5RapR+W+v
   uLP9nTjXtiqgK5/cxemjdTiDzZ4113zXQ0DUZ705/AtjRASsLyWwCVAxx
   Ujc9MssUPWi3Z5ZEBgFCptOnRt2wO7iZ1SlMQn/nCPtnFp5niCyuCCAqM
   IiORCv1a5lT1FMuQijrsVy2OJuRvPB92Tiw1nv7+UEH2v7Lov4Z3R7cTI
   FPhxzBhl7AaQFSGajyW3JbsQqJM2QQ1JALjkxYt/kMV5gAM3yRSK4fXEp
   A==;
X-CSE-ConnectionGUID: G+AN3gmFT9CAgN+/qH9TEA==
X-CSE-MsgGUID: CEwVvIRaS1SjRGGD+gJ+ZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="48616538"
X-IronPort-AV: E=Sophos;i="6.13,214,1732608000"; 
   d="scan'208";a="48616538"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 22:06:30 -0800
X-CSE-ConnectionGUID: XB2C602TQhquEwyT9mlcjg==
X-CSE-MsgGUID: 31sueQjeSueOb905Esimqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,214,1732608000"; 
   d="scan'208";a="105960173"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Jan 2025 22:06:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZ1yU-000U8t-25;
	Sat, 18 Jan 2025 06:06:26 +0000
Date: Sat, 18 Jan 2025 14:06:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/3] SUNRPC: add ability to remove specific server
 transport
Message-ID: <202501181309.JDrzOa1M-lkp@intel.com>
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
In-Reply-To: <20250115232406.44815-3-okorniev@redhat.com>
References: <20250115232406.44815-3-okorniev@redhat.com>
TO: Olga Kornievskaia <okorniev@redhat.com>
TO: chuck.lever@oracle.com
TO: jlayton@kernel.org
CC: linux-nfs@vger.kernel.org
CC: Olga Kornievskaia <okorniev@redhat.com>

Hi Olga,

kernel test robot noticed the following build warnings:

[auto build test WARNING on trondmy-nfs/linux-next]
[also build test WARNING on brauner-vfs/vfs.all linus/master v6.13-rc7 next-20250117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Olga-Kornievskaia/llist-add-ability-to-remove-a-particular-entry-from-the-list/20250116-072951
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/20250115232406.44815-3-okorniev%40redhat.com
patch subject: [PATCH 2/3] SUNRPC: add ability to remove specific server transport
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-r071-20250117 (https://download.01.org/0day-ci/archive/20250118/202501181309.JDrzOa1M-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501181309.JDrzOa1M-lkp@intel.com/

smatch warnings:
include/linux/llist.h:282 llist_del_entry() error: uninitialized symbol 'pos'.

vim +/pos +282 include/linux/llist.h

476c5818c37a78 Peter Zijlstra    2020-08-29  255  
fe4067c661ab58 Olga Kornievskaia 2025-01-15  256  /**
fe4067c661ab58 Olga Kornievskaia 2025-01-15  257   * llist_del_entry - remove a particular entry from a lock-less list
fe4067c661ab58 Olga Kornievskaia 2025-01-15  258   * @head: head of the list to remove the entry from
fe4067c661ab58 Olga Kornievskaia 2025-01-15  259   * @entry: entry to be removed from the list
fe4067c661ab58 Olga Kornievskaia 2025-01-15  260   *
fe4067c661ab58 Olga Kornievskaia 2025-01-15  261   * Walk the list, find the given entry and remove it from the list.
fe4067c661ab58 Olga Kornievskaia 2025-01-15  262   * The caller must ensure that nothing can race in and change the
fe4067c661ab58 Olga Kornievskaia 2025-01-15  263   * list while this is running.
fe4067c661ab58 Olga Kornievskaia 2025-01-15  264   *
fe4067c661ab58 Olga Kornievskaia 2025-01-15  265   * Returns true if the entry was found and removed.
fe4067c661ab58 Olga Kornievskaia 2025-01-15  266   */
fe4067c661ab58 Olga Kornievskaia 2025-01-15  267  static inline bool llist_del_entry(struct llist_head *head, struct llist_node *entry)
fe4067c661ab58 Olga Kornievskaia 2025-01-15  268  {
fe4067c661ab58 Olga Kornievskaia 2025-01-15  269  	struct llist_node *pos;
fe4067c661ab58 Olga Kornievskaia 2025-01-15  270  
fe4067c661ab58 Olga Kornievskaia 2025-01-15  271  	if (!head->first)
fe4067c661ab58 Olga Kornievskaia 2025-01-15  272  		return false;
fe4067c661ab58 Olga Kornievskaia 2025-01-15  273  
fe4067c661ab58 Olga Kornievskaia 2025-01-15  274  	/* Is it the first entry? */
fe4067c661ab58 Olga Kornievskaia 2025-01-15  275  	if (head->first == entry) {
fe4067c661ab58 Olga Kornievskaia 2025-01-15  276  		head->first = entry->next;
fe4067c661ab58 Olga Kornievskaia 2025-01-15  277  		entry->next = entry;
fe4067c661ab58 Olga Kornievskaia 2025-01-15  278  		return true;
fe4067c661ab58 Olga Kornievskaia 2025-01-15  279  	}
fe4067c661ab58 Olga Kornievskaia 2025-01-15  280  
fe4067c661ab58 Olga Kornievskaia 2025-01-15  281  	/* Find it in the list */
fe4067c661ab58 Olga Kornievskaia 2025-01-15 @282  	llist_for_each(head->first, pos) {
fe4067c661ab58 Olga Kornievskaia 2025-01-15  283  		if (pos->next == entry) {
fe4067c661ab58 Olga Kornievskaia 2025-01-15  284  			pos->next = entry->next;
fe4067c661ab58 Olga Kornievskaia 2025-01-15  285  			entry->next = entry;
fe4067c661ab58 Olga Kornievskaia 2025-01-15  286  			return true;
fe4067c661ab58 Olga Kornievskaia 2025-01-15  287  		}
fe4067c661ab58 Olga Kornievskaia 2025-01-15  288  	}
fe4067c661ab58 Olga Kornievskaia 2025-01-15  289  	return false;
fe4067c661ab58 Olga Kornievskaia 2025-01-15  290  }
fe4067c661ab58 Olga Kornievskaia 2025-01-15  291  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
