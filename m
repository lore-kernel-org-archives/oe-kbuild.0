Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583173AF664
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Mar 2026 09:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773307524; cv=none; b=cI7n5UR+eMScnpoFXhvqFhDkZrq1M6loQJoCVJqeQZt4muQqSz81sEn1P9wqZ5u85SYT3dhh3G0f6LpSxpWU0pNWrlLaABitJ53E+Jrt/Q72OaD2/HpIZJZRW26I8S9rlIqg5AZRiQwvkLNzW/oax4XjBYx+/0FSyuwnk+S26yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773307524; c=relaxed/simple;
	bh=SgXJUuXTdT6esWb1/6CfUpu7mmEehPiv883Uqj36yS8=;
	h=Date:From:To:Subject:Message-ID; b=pSuBZFHunDGQvTvv1CjekDelQwTA7fLUqqI0GaAKOQnMf1CSCG+iusKA5XiSKg2fLERXKcR/9yDkFpmVSOrVM/LLYdKtgL0qeoSqywr0DnPYSLiYHguMdGSnuyAREOBHyOniLcfK5tPT0yvbq3rR73WKiFZ8vIJ9JBv2iNAl5cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X+Rluop6; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X+Rluop6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773307522; x=1804843522;
  h=date:from:to:subject:message-id;
  bh=SgXJUuXTdT6esWb1/6CfUpu7mmEehPiv883Uqj36yS8=;
  b=X+Rluop6EGoLCcgKH48dGpn1RtsqGxeFvHOZ4pn7mhTigj1rbFqm0I6m
   KAqPpLOM5QdpcfVXe1UgtLx0bWBNzj4t2qucXhyjhQxfkzIyDc97j1SFG
   Uj8M0TNKRzbflwFcZ7kKEG/Z3YehD7i/emRPuUHvnJa18X/rJJXZjKNEv
   BxZFHlLZPJ2gN+lS3z9bQyib1PFsxj47MBW0ozLJNvuabfw0ZcEApNg0Z
   iz9w9N2IQtSBTGcBjuAuPWB5IlnQNUnqL5LCyEc7R9Tov6ZFdgphWrDac
   m9Ei6XfuwVtwmPDvYZsoMiHhGkMWl1B8wBdq999Ufm6XTNdNdGFoNytLs
   g==;
X-CSE-ConnectionGUID: bqbTUZprT9yRlXoeYEIXbA==
X-CSE-MsgGUID: 454dWiDCTGGS1rR3Rq/3tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85020841"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="85020841"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 02:25:03 -0700
X-CSE-ConnectionGUID: 9kG4h5swScOaBBLD1bJVMA==
X-CSE-MsgGUID: 5BoMxkwsQ4GE9ZrCnJicwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="220710966"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 12 Mar 2026 02:25:03 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0cHs-000000003U5-1qd8
	for oe-kbuild@lists.linux.dev;
	Thu, 12 Mar 2026 09:25:00 +0000
Date: Thu, 12 Mar 2026 10:24:18 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arm-integrator:b4/aarch64-dynamic-kernel-stacks-v7.0-rc1
 7/13] checkpatch: ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202603121023.rE9Oh3Yt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Pasha Tatashin <pasha.tatashin@soleen.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/aarch64-dynamic-kernel-stacks-v7.0-rc1
head:   3ea8b0381a0759fa0c71abae5274db2414b58e78
commit: d2ee0928bdd182aed09a1eabb9c008eef73bb442 [7/13] fork: Dynamic Kernel Stacks
:::::: branch date: 27 minutes ago
:::::: commit date: 27 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260312/202603121023.rE9Oh3Yt-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#293: FILE: kernel/fork.c:362:
+static struct page * noinstr dynamic_stack_get_page(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
