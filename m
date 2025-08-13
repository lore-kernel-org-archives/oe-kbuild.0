Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2362F657B
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Aug 2025 11:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755085130; cv=none; b=SrbK+hc8uRP5UfMY9t23MPyRUnl6iowJjNwJYnS6zy/aqWVSDwAwQ4rrAoILBLQ3gmPJqcs0xqANB4m3l/69xwb7txcP/hMkwUkWaWrrEWHGn+EVexZtHvoMzWz5HwAGRSvg4Tq9oCSRbqHu3VcM17hZjpSH4rfj8Sehx0c5wHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755085130; c=relaxed/simple;
	bh=BqobRZi96pg2HgEMVcq+OZa4sz47ckJjmw7UKdgyYT8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=auKlyTpRuT4AEn/dq6KSEq0WDWJDl5fBKvs0pYxZ3G5f2Tt2Z8Us6nkG6cPHm8pbijzPAAOZKV9zxsqe9D3pGNaRAZlFQs1jrNaoicUIFDAfEAoN7wUsD9q/nA3wLu3uTJa30//gv+CYwf0BsWeXcY88yLd+HIZxjOlZ6yK2aVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bUKdmVzw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bUKdmVzw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755085128; x=1786621128;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BqobRZi96pg2HgEMVcq+OZa4sz47ckJjmw7UKdgyYT8=;
  b=bUKdmVzwv8CuI1Msx4CQOooHXIwcC/uIauWl2Gg1TieiiQtitsgmeOYZ
   +hmefwX6ltCcEliMdclnboP4hGWdesjr3wIFIpz7H2m6mGaM8HdmvyzOT
   Y64qta9NSWABhiY0FiXvSm64w6SiZ7nZr5jAQcLxLLF3Y/6INrjNT81MB
   ABbMk/YrxiLf7ZNFf9Ra5PhTJ1suCi5gxxdj+6hxVkZDUde20BxWYbSnL
   RLHgqGfiuN7s6je7eNglthbYUQsrzcuai9c4ZVKIg01hEuOvciI374Bln
   XJNqaCuEK9SO/wQfgdjE2lsOfbU4JhtJmGdIK47j+yjQdXl6FQhznmihc
   w==;
X-CSE-ConnectionGUID: oPHiL4mSSCq/aWb5xLJbBQ==
X-CSE-MsgGUID: K35P869xQjuCaKgWkN4RIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="59997775"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="59997775"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 04:38:47 -0700
X-CSE-ConnectionGUID: PnynnzcdQ5OWooqHe6s4sg==
X-CSE-MsgGUID: Efb0qeBiRVuvXsk+M15PbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="171706443"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 13 Aug 2025 04:38:46 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1um9oN-0009ps-1R;
	Wed, 13 Aug 2025 11:38:34 +0000
Date: Wed, 13 Aug 2025 19:37:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1644/2153] include/linux/iov_iter.h:190
 iterate_folioq() error: uninitialized symbol 'remain'.
Message-ID: <202508131953.HDaThIjM-lkp@intel.com>
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
TO: Dominique Martinet <asmadeus@codewreck.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   43c3c17f0c805882d1b48818b1085747a68c80ec
commit: eacecdbf2789ca7ef688b3cb4955bbdde1c499bf [1644/2153] iov_iter: iterate_folioq: fix handling of offset >= folio size
:::::: branch date: 7 hours ago
:::::: commit date: 30 hours ago
config: x86_64-randconfig-161-20250813 (https://download.01.org/0day-ci/archive/20250813/202508131953.HDaThIjM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508131953.HDaThIjM-lkp@intel.com/

New smatch warnings:
include/linux/iov_iter.h:190 iterate_folioq() error: uninitialized symbol 'remain'.
include/linux/iov_iter.h:190 iterate_folioq() error: uninitialized symbol 'remain'.

Old smatch warnings:
net/core/skbuff.c:4812 skb_segment() error: we previously assumed 'list_skb' could be null (see line 4747)

vim +/remain +190 include/linux/iov_iter.h

f1982740f5e7709 David Howells      2023-09-25  143  
db0aa2e9566fda2 David Howells      2024-06-19  144  /*
db0aa2e9566fda2 David Howells      2024-06-19  145   * Handle ITER_FOLIOQ.
db0aa2e9566fda2 David Howells      2024-06-19  146   */
db0aa2e9566fda2 David Howells      2024-06-19  147  static __always_inline
db0aa2e9566fda2 David Howells      2024-06-19  148  size_t iterate_folioq(struct iov_iter *iter, size_t len, void *priv, void *priv2,
db0aa2e9566fda2 David Howells      2024-06-19  149  		      iov_step_f step)
db0aa2e9566fda2 David Howells      2024-06-19  150  {
db0aa2e9566fda2 David Howells      2024-06-19  151  	const struct folio_queue *folioq = iter->folioq;
db0aa2e9566fda2 David Howells      2024-06-19  152  	unsigned int slot = iter->folioq_slot;
db0aa2e9566fda2 David Howells      2024-06-19  153  	size_t progress = 0, skip = iter->iov_offset;
db0aa2e9566fda2 David Howells      2024-06-19  154  
db0aa2e9566fda2 David Howells      2024-06-19  155  	if (slot == folioq_nr_slots(folioq)) {
db0aa2e9566fda2 David Howells      2024-06-19  156  		/* The iterator may have been extended. */
db0aa2e9566fda2 David Howells      2024-06-19  157  		folioq = folioq->next;
db0aa2e9566fda2 David Howells      2024-06-19  158  		slot = 0;
db0aa2e9566fda2 David Howells      2024-06-19  159  	}
db0aa2e9566fda2 David Howells      2024-06-19  160  
db0aa2e9566fda2 David Howells      2024-06-19  161  	do {
db0aa2e9566fda2 David Howells      2024-06-19  162  		struct folio *folio = folioq_folio(folioq, slot);
db0aa2e9566fda2 David Howells      2024-06-19  163  		size_t part, remain, consumed;
db0aa2e9566fda2 David Howells      2024-06-19  164  		size_t fsize;
db0aa2e9566fda2 David Howells      2024-06-19  165  		void *base;
db0aa2e9566fda2 David Howells      2024-06-19  166  
db0aa2e9566fda2 David Howells      2024-06-19  167  		if (!folio)
db0aa2e9566fda2 David Howells      2024-06-19  168  			break;
db0aa2e9566fda2 David Howells      2024-06-19  169  
db0aa2e9566fda2 David Howells      2024-06-19  170  		fsize = folioq_folio_size(folioq, slot);
eacecdbf2789ca7 Dominique Martinet 2025-08-11  171  		if (skip >= fsize)
eacecdbf2789ca7 Dominique Martinet 2025-08-11  172  			goto next;
db0aa2e9566fda2 David Howells      2024-06-19  173  		base = kmap_local_folio(folio, skip);
db0aa2e9566fda2 David Howells      2024-06-19  174  		part = umin(len, PAGE_SIZE - skip % PAGE_SIZE);
db0aa2e9566fda2 David Howells      2024-06-19  175  		remain = step(base, progress, part, priv, priv2);
db0aa2e9566fda2 David Howells      2024-06-19  176  		kunmap_local(base);
db0aa2e9566fda2 David Howells      2024-06-19  177  		consumed = part - remain;
db0aa2e9566fda2 David Howells      2024-06-19  178  		len -= consumed;
db0aa2e9566fda2 David Howells      2024-06-19  179  		progress += consumed;
db0aa2e9566fda2 David Howells      2024-06-19  180  		skip += consumed;
db0aa2e9566fda2 David Howells      2024-06-19  181  		if (skip >= fsize) {
eacecdbf2789ca7 Dominique Martinet 2025-08-11  182  next:
db0aa2e9566fda2 David Howells      2024-06-19  183  			skip = 0;
db0aa2e9566fda2 David Howells      2024-06-19  184  			slot++;
db0aa2e9566fda2 David Howells      2024-06-19  185  			if (slot == folioq_nr_slots(folioq) && folioq->next) {
db0aa2e9566fda2 David Howells      2024-06-19  186  				folioq = folioq->next;
db0aa2e9566fda2 David Howells      2024-06-19  187  				slot = 0;
db0aa2e9566fda2 David Howells      2024-06-19  188  			}
db0aa2e9566fda2 David Howells      2024-06-19  189  		}
db0aa2e9566fda2 David Howells      2024-06-19 @190  		if (remain)
db0aa2e9566fda2 David Howells      2024-06-19  191  			break;
db0aa2e9566fda2 David Howells      2024-06-19  192  	} while (len);
db0aa2e9566fda2 David Howells      2024-06-19  193  
db0aa2e9566fda2 David Howells      2024-06-19  194  	iter->folioq_slot = slot;
db0aa2e9566fda2 David Howells      2024-06-19  195  	iter->folioq = folioq;
db0aa2e9566fda2 David Howells      2024-06-19  196  	iter->iov_offset = skip;
db0aa2e9566fda2 David Howells      2024-06-19  197  	iter->count -= progress;
db0aa2e9566fda2 David Howells      2024-06-19  198  	return progress;
db0aa2e9566fda2 David Howells      2024-06-19  199  }
db0aa2e9566fda2 David Howells      2024-06-19  200  

:::::: The code at line 190 was first introduced by commit
:::::: db0aa2e9566fda2d23dc8f6c102856ead95578a4 mm: Define struct folio_queue and ITER_FOLIOQ to handle a sequence of folios

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
