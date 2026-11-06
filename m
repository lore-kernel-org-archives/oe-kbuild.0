Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793999267;
	b=ZD5lBTmM/q36If439ozxK17f9g7x+aeXL9IjXPdKY1X5I04EhbK+S7T5QCL8wVBoJSzz
	 0GWoiLZfpnFy4nwbjjoRq1WnvjeOeDP2TRWHNgEq8ulgdpNzsEDmqESfM7bOYR9stTpR/
	 DugfwOpSKf7hrA3Y3Rg+5hNWYXT3zFWOtj0RF4pklt4nyc5kGWYBpzlP33153LZ/3L1Kw
	 HfLf8iYLNTPcJgITmtbYiE0yxArwzaHLD4ks0F5mGkyYwg3YjKxVAJ7MvYs/FropxSFSf
	 bPiKqRfhrXFEpjfs1uyN2dJV6J+Twvqcd0dlFb+rDo3i1lIX8kLfKYu16bNxy+W+yOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793999267;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=BKhZvBp5cO+/lHtvuN0PZGAB+jQn2wMvXkQysEeTsAQ=;
	b=ELXnS4wTAjrIGIFFM0h+Ex2eiiY+e2MDe9wt1pQiodleDK6dEJM/GeCF9maGuJ5CZiN6
	 8WrRSg4YD/lLO0fMizdsZNr8bTgD/JBw0WrXhPjMALJ5kmZ34kZHxIG70dqYtVU0NaQOb
	 QJ7O8tTiX0x63Fr7/z8HQOD1xSXnvjnA81nwdGznJpy+HMpA4xU62Xx2w5grVTHVG7CJ1
	 IdirmjgIjLZttSfQSoqJtZV+0AM4lVXTduo8a0C2V/83Wfa078i2Ewkmzld35WBUyEeyF
	 PH/Fz9P1UNb9zQaqJXv+8wJeQk5oRXzBVKL8qq5Jo1ASE9rsYfG9mQsVVy17jnVU3zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TCmuCmjk;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AB0606A329
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Nov 2026 21:07:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89AB0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TCmuCmjk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793999265; x=1825535265;
  h=date:from:to:cc:subject:message-id;
  bh=TJTsdUvivWTG8S9jgKUq3Ll84orVnoZ52bOb+3cPpAs=;
  b=TCmuCmjkd7oA423oCWuL2puD3bKEfMnm8QzuJ6mGMgi9payY8r2JeYpe
   rTZTDITElRFQnrKZpZb+fDt8asYirlCwLxFR+OMAuztc4fdkg521MEMpB
   eBDARdHwZNdWlK8AmGg/kl2jGw+BtbYyWdUkqyKVDL5Fm2rx2y1viyXS9
   5bru0zMZoF/gvT3Cjt1kYylxgu/a04nsDtU7vJqzFCGXf0syHr+3qzCNe
   2t/oQl7MKp+s1pIQqztHFxwFx/MYNlfql+yJEzR/VNRy2d5T6k/3tfXd5
   nAupaSXRCqrF9ST+S7uwwRsBUeant+G8lTiF4z/qDxEDbWXxGIoUA9096
   A==;
X-CSE-ConnectionGUID: ydbZdHsVSiK00iHENx9olA==
X-CSE-MsgGUID: wJgkMPjJQ+GgVmT4u0MLYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2719717"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2719717"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 13:07:45 -0800
X-CSE-ConnectionGUID: sPKT2heNS+GWWr26cHji8A==
X-CSE-MsgGUID: ZH4WRghvTHqjtVks4vbS6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7355635"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 06 Nov 2026 13:07:43 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPR9x-00000000AMh-00wR;
	Fri, 06 Nov 2026 21:07:41 +0000
Date: Fri, 06 Nov 2026 22:06:55 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [davidhildenbrand:b4/uffd_marker_loss 3/4]
 mm/userfaultfd.c:236 mfill_get_vma() warn: bitwise AND condition is false
 here
Message-ID: <202611062242.DHsJsdWZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "David Hildenbrand (Arm)" <david@kernel.org>

tree:   https://github.com/davidhildenbrand/linux b4/uffd_marker_loss
head:   f873c4d8fea81d69055efcca51bad3c0dd0a4b04
commit: 4fbc77f3f8866a6ce733498aadfb4504febd08e6 [3/4] mm/userfaultfd: preserve poison markers after unregistering
:::::: branch date: 6 hours ago
:::::: commit date: 9 hours ago
config: microblaze-randconfig-2200-20261106 (https://download.01.org/0day-ci/archive/20261106/202611062242.DHsJsdWZ-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.4.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611062242.DHsJsdWZ-lkp@intel.com/

smatch warnings:
mm/userfaultfd.c:236 mfill_get_vma() warn: bitwise AND condition is false here

vim +236 mm/userfaultfd.c

b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  194) 
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  195) static int mfill_get_vma(struct mfill_state *state)
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  196) {
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  197) 	struct userfaultfd_ctx *ctx = state->ctx;
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  198) 	uffd_flags_t flags = state->flags;
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  199) 	struct vm_area_struct *dst_vma;
dfc4d771820a17 Mike Rapoport (Microsoft  2026-04-02  200) 	const struct vm_uffd_ops *ops;
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  201) 	int err;
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  202) 
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  203) 	/*
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  204) 	 * Make sure the vma is not shared, that the dst range is
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  205) 	 * both valid and fully within a single existing vma.
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  206) 	 */
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  207) 	dst_vma = uffd_mfill_lock(ctx->mm, state->dst_start, state->len);
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  208) 	if (IS_ERR(dst_vma))
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  209) 		return PTR_ERR(dst_vma);
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  210) 
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  211) 	/*
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  212) 	 * If memory mappings are changing because of non-cooperative
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  213) 	 * operation (e.g. mremap) running in parallel, bail out and
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  214) 	 * request the user to retry later
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  215) 	 */
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  216) 	down_read(&ctx->map_changing_lock);
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  217) 	state->vma = dst_vma;
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  218) 	err = -EAGAIN;
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  219) 	if (atomic_read(&ctx->mmap_changing))
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  220) 		goto out_unlock;
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  221) 
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  222) 	err = -EINVAL;
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  223) 
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  224) 	/*
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  225) 	 * shmem_zero_setup is invoked in mmap for MAP_ANONYMOUS|MAP_SHARED but
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  226) 	 * it will overwrite vm_ops, so vma_is_anonymous must return false.
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  227) 	 */
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  228) 	if (WARN_ON_ONCE(vma_is_anonymous(dst_vma) &&
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  229) 	    dst_vma->vm_flags & VM_SHARED))
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  230) 		goto out_unlock;
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  231) 
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  232) 	/*
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  233) 	 * validate 'mode' now that we know the dst_vma: don't allow
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  234) 	 * a wrprotect copy if the userfaultfd didn't register as WP.
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  235) 	 */
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02 @236) 	if ((flags & MFILL_ATOMIC_WP) && !(dst_vma->vm_flags & VM_UFFD_WP))
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  237) 		goto out_unlock;
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  238) 
c911e7ebebf58c Lorenzo Stoakes (ARM      2026-10-13  239) 	if (vma_is_hugetlb(dst_vma))
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  240) 		return 0;
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  241) 
dfc4d771820a17 Mike Rapoport (Microsoft  2026-04-02  242) 	ops = vma_uffd_ops(dst_vma);
dfc4d771820a17 Mike Rapoport (Microsoft  2026-04-02  243) 	if (!ops)
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  244) 		goto out_unlock;
dfc4d771820a17 Mike Rapoport (Microsoft  2026-04-02  245) 
dfc4d771820a17 Mike Rapoport (Microsoft  2026-04-02  246) 	if (uffd_flags_mode_is(flags, MFILL_ATOMIC_CONTINUE) &&
dfc4d771820a17 Mike Rapoport (Microsoft  2026-04-02  247) 	    !ops->get_folio_noalloc)
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  248) 		goto out_unlock;
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  249) 
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  250) 	return 0;
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  251) 
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  252) out_unlock:
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  253) 	mfill_put_vma(state);
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  254) 	return err;
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  255) }
b8c03b7f455821 Mike Rapoport (Microsoft  2026-04-02  256) 

:::::: The code at line 236 was first introduced by commit
:::::: b8c03b7f4558219ca09693b5fa4f5e068041d2c2 userfaultfd: introduce mfill_get_vma() and mfill_put_vma()

:::::: TO: Mike Rapoport (Microsoft) <rppt@kernel.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
