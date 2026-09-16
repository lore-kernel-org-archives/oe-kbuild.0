Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839EF483833
	for <oe-kbuild@lists.linux.dev>; Wed, 16 Sep 2026 21:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789594943; cv=none; b=f5hK1p0H+n3vKL/YGVXx2FYS9qviUp235uQTaTnv0tGpz/+ym2IXeFVs2mAwyWvixe5In44z15yBPRL8a/MJoRx/bsH1nkpAeaAEMfiGYThFfbPboRbpB/aPQeI2yj+PT40JhcBJI5A3wUjq3ZbMH4imEzDfj59oPY3AiU9IsME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789594943; c=relaxed/simple;
	bh=GIKaIHE7Zc5vrXfVYbkkOIQxvsjIhcHYgfbFPOxadfY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bWjOGaCmU7TdqqOU49eGDjCxoev6ZJx8mlwI99OxtPaEZalylRGn9ofX3PZtbSxLBPe2m682hnRBkkuZxcywp/9zdIuUVqvW3rPXMFVKlV2hc13bCEidxwIaatnbXsrKX4QbHVQXSX/ciCtu+16R3LSDiKshlWTEAigXrkIUGr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DoCl+9Sq; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DoCl+9Sq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789594934; x=1821130934;
  h=date:from:to:cc:subject:message-id;
  bh=GIKaIHE7Zc5vrXfVYbkkOIQxvsjIhcHYgfbFPOxadfY=;
  b=DoCl+9SqrK9oD+fXuWnUNBU+AZDIYO/v7A3Gq6aJ1Quextil5KWhakZ1
   L3VdnEs8eFXVlBEY7+yRyHHgUDxBF+mHKM47wI5FZOvCHdUzoipUrVyi/
   YOCfUt4dxjAuzkHVFxDqcJ5zGEZCEPkFSps1xuQl5zBnna84EUaRiDPrh
   kx1I/zud9rPkszZd5fgcl1uo4rMdIK57ilmCHzVGiS7MaRWKZRhNk2OdY
   Pt23f7lM4tSezXtDTjCW9lhBmp01lqVKhh2hT7Zv7CweNHq26sjDquPjJ
   SmbpNOrSDoxouEo51bAlOo3Pf7/4yuUuBfnPKOvaPUz7BcOqOTFPaY9eY
   Q==;
X-CSE-ConnectionGUID: auP1F2GTSqCx+oJJsJJABQ==
X-CSE-MsgGUID: janRa0MwT1WkUqAPVNvDWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90003108"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90003108"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 14:42:11 -0700
X-CSE-ConnectionGUID: VdzAFUw7SXGmLeKBLNFRug==
X-CSE-MsgGUID: TnyleGUDQCa87iM1T5T1Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="272991567"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Sep 2026 14:42:10 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6xOK-000000006jl-0D6B;
	Wed, 16 Sep 2026 21:42:08 +0000
Date: Thu, 17 Sep 2026 05:41:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:sched/core 18/25] include/linux/jump_label.h:262:9:
 sparse: sparse: Trying to use reserved word 'return' as identifier
Message-ID: <202609170554.az8YW3CT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: include/linux/jump_label.h:262:9: sparse: sparse: Trying to use reserved word 'return' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Mark Rutland <mark.rutland@arm.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Jinjie Ruan <ruanjinjie@huawei.com>
CC: Shrikanth Hegde <sshegde@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
head:   e81ee06308379a5f2ededf997bcf17551bce5db7
commit: 5b9a28eeed37513778ca6b636253aa8dcf39d55f [18/25] sched: dynamic: Remove HAVE_PREEMPT_DYNAMIC_{CALL,KEY}
:::::: branch date: 7 days ago
:::::: commit date: 2 weeks ago
config: powerpc64-randconfig-r1307-20260916 (https://download.01.org/0day-ci/archive/20260917/202609170554.az8YW3CT-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260917/202609170554.az8YW3CT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609170554.az8YW3CT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   include/linux/atomic/atomic-instrumented.h:4482:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4502:42: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4502:42: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4503:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4503:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4503:16: sparse: sparse: got raw_atomic_long_try_cmpxchg_relaxed
   include/linux/atomic/atomic-instrumented.h:4504:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4504:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4521:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4521:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4522:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4522:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4522:16: sparse: sparse: got raw_atomic_long_sub_and_test
   include/linux/atomic/atomic-instrumented.h:4523:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4523:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4539:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4539:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4540:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4540:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4540:16: sparse: sparse: got raw_atomic_long_dec_and_test
   include/linux/atomic/atomic-instrumented.h:4541:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4541:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4557:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4557:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4558:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4558:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4558:16: sparse: sparse: got raw_atomic_long_inc_and_test
   include/linux/atomic/atomic-instrumented.h:4559:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4559:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4576:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4576:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4577:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4577:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4577:16: sparse: sparse: got raw_atomic_long_add_negative
   include/linux/atomic/atomic-instrumented.h:4578:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4578:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4595:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4595:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4595:16: sparse: sparse: got raw_atomic_long_add_negative_acquire
   include/linux/atomic/atomic-instrumented.h:4596:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4596:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4613:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4613:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4614:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4614:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4614:16: sparse: sparse: got raw_atomic_long_add_negative_release
   include/linux/atomic/atomic-instrumented.h:4615:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4615:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4632:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4632:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4632:16: sparse: sparse: got raw_atomic_long_add_negative_relaxed
   include/linux/atomic/atomic-instrumented.h:4633:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4633:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4652:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4652:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4653:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4653:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4653:16: sparse: sparse: got raw_atomic_long_fetch_add_unless
   include/linux/atomic/atomic-instrumented.h:4654:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4654:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4673:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4673:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4674:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4674:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4674:16: sparse: sparse: got raw_atomic_long_add_unless
   include/linux/atomic/atomic-instrumented.h:4675:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4675:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4692:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4692:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4693:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4693:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4693:16: sparse: sparse: got raw_atomic_long_inc_not_zero
   include/linux/atomic/atomic-instrumented.h:4694:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4694:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4711:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4711:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4712:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4712:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4712:16: sparse: sparse: got raw_atomic_long_inc_unless_negative
   include/linux/atomic/atomic-instrumented.h:4713:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4713:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4730:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4730:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4731:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4731:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4731:16: sparse: sparse: got raw_atomic_long_dec_unless_positive
   include/linux/atomic/atomic-instrumented.h:4732:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4732:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4749:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4749:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4750:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4750:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4750:16: sparse: sparse: got raw_atomic_long_dec_if_positive
   include/linux/atomic/atomic-instrumented.h:4751:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4751:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/page_table_check.h, arch/powerpc/include/asm/book3s/64/pgtable.h, arch/powerpc/include/asm/book3s/64/mmu-hash.h, ...):
   include/linux/jump_label.h:249:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:249:1: sparse: sparse: got }
   include/linux/jump_label.h:254:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:254:1: sparse: sparse: got }
>> include/linux/jump_label.h:262:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:262:16: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:262:16: sparse: sparse: got false
   include/linux/jump_label.h:263:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:263:1: sparse: sparse: got }
   include/linux/jump_label.h:269:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:269:16: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:269:16: sparse: sparse: got false
   include/linux/jump_label.h:270:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:270:1: sparse: sparse: got }
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ) in nested declarator
   include/linux/jump_label.h:276:9: sparse: sparse: got {
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:276:9: sparse: sparse: got (
>> include/linux/jump_label.h:276:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:276:9: sparse: sparse: got "%s(): static key '%pS' used before call to jump_label_init()"
>> include/linux/jump_label.h:276:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:276:9: sparse: sparse: got {
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:276:9: sparse: sparse: got }
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:276:9: sparse: sparse: got !
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:276:9: sparse: sparse: got }
   include/linux/jump_label.h:282:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:282:12: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:282:12: sparse: sparse: got {
   include/linux/jump_label.h:285:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:285:9: sparse: sparse: got }
   include/linux/jump_label.h:286:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:286:16: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:286:16: sparse: sparse: got true
   include/linux/jump_label.h:287:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:287:1: sparse: sparse: got }
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:292:9: sparse: sparse: got (
   include/linux/jump_label.h:292:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:292:9: sparse: sparse: got "%s(): static key '%pS' used before call to jump_label_init()"
   include/linux/jump_label.h:292:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:292:9: sparse: sparse: got {
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:292:9: sparse: sparse: got }
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:292:9: sparse: sparse: got !
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:292:9: sparse: sparse: got }
   include/linux/jump_label.h:293:20: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:293:20: sparse: sparse: got &
   include/linux/jump_label.h:294:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:294:1: sparse: sparse: got }
   include/linux/jump_label.h:302:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:302:1: sparse: sparse: got }
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:309:9: sparse: sparse: got (
   include/linux/jump_label.h:309:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:309:9: sparse: sparse: got "%s(): static key '%pS' used before call to jump_label_init()"
   include/linux/jump_label.h:309:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:309:9: sparse: sparse: got {
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:309:9: sparse: sparse: got }
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:309:9: sparse: sparse: got !
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:309:9: sparse: sparse: got }
   include/linux/jump_label.h:311:24: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:311:24: sparse: sparse: got (
   include/linux/jump_label.h:311:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:312:17: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:312:17: sparse: sparse: got (
   include/linux/jump_label.h:312:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:312:17: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:312:17: sparse: sparse: got !
   include/linux/jump_label.h:312:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:312:17: sparse: sparse: got }
   include/linux/jump_label.h:313:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:314:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:314:9: sparse: sparse: got }
   include/linux/jump_label.h:316:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:316:1: sparse: sparse: got }
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:320:9: sparse: sparse: got (
   include/linux/jump_label.h:320:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:320:9: sparse: sparse: got "%s(): static key '%pS' used before call to jump_label_init()"
   include/linux/jump_label.h:320:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:320:9: sparse: sparse: got {
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:320:9: sparse: sparse: got }
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:320:9: sparse: sparse: got !
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:320:9: sparse: sparse: got }
   include/linux/jump_label.h:322:24: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:322:24: sparse: sparse: got (
   include/linux/jump_label.h:322:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:323:17: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:323:17: sparse: sparse: got (
   include/linux/jump_label.h:323:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:323:17: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:323:17: sparse: sparse: got !
   include/linux/jump_label.h:323:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:323:17: sparse: sparse: got }
   include/linux/jump_label.h:324:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:325:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:325:9: sparse: sparse: got }
   include/linux/jump_label.h:327:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:327:1: sparse: sparse: got }
   include/linux/jump_label.h:405:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:405:13: sparse: sparse: got ____wrong_branch_error
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:268:20: sparse: sparse: Expected ; at end of declaration
--
   include/linux/atomic/atomic-instrumented.h:4482:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4502:42: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4502:42: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4503:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4503:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4503:16: sparse: sparse: got raw_atomic_long_try_cmpxchg_relaxed
   include/linux/atomic/atomic-instrumented.h:4504:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4504:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4521:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4521:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4522:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4522:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4522:16: sparse: sparse: got raw_atomic_long_sub_and_test
   include/linux/atomic/atomic-instrumented.h:4523:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4523:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4539:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4539:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4540:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4540:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4540:16: sparse: sparse: got raw_atomic_long_dec_and_test
   include/linux/atomic/atomic-instrumented.h:4541:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4541:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4557:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4557:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4558:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4558:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4558:16: sparse: sparse: got raw_atomic_long_inc_and_test
   include/linux/atomic/atomic-instrumented.h:4559:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4559:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4576:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4576:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4577:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4577:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4577:16: sparse: sparse: got raw_atomic_long_add_negative
   include/linux/atomic/atomic-instrumented.h:4578:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4578:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4595:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4595:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4595:16: sparse: sparse: got raw_atomic_long_add_negative_acquire
   include/linux/atomic/atomic-instrumented.h:4596:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4596:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4613:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4613:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4614:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4614:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4614:16: sparse: sparse: got raw_atomic_long_add_negative_release
   include/linux/atomic/atomic-instrumented.h:4615:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4615:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4632:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4632:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4632:16: sparse: sparse: got raw_atomic_long_add_negative_relaxed
   include/linux/atomic/atomic-instrumented.h:4633:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4633:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4652:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4652:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4653:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4653:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4653:16: sparse: sparse: got raw_atomic_long_fetch_add_unless
   include/linux/atomic/atomic-instrumented.h:4654:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4654:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4673:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4673:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4674:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4674:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4674:16: sparse: sparse: got raw_atomic_long_add_unless
   include/linux/atomic/atomic-instrumented.h:4675:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4675:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4692:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4692:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4693:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4693:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4693:16: sparse: sparse: got raw_atomic_long_inc_not_zero
   include/linux/atomic/atomic-instrumented.h:4694:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4694:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4711:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4711:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4712:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4712:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4712:16: sparse: sparse: got raw_atomic_long_inc_unless_negative
   include/linux/atomic/atomic-instrumented.h:4713:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4713:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4730:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4730:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4731:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4731:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4731:16: sparse: sparse: got raw_atomic_long_dec_unless_positive
   include/linux/atomic/atomic-instrumented.h:4732:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4732:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4749:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4749:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4750:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4750:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4750:16: sparse: sparse: got raw_atomic_long_dec_if_positive
   include/linux/atomic/atomic-instrumented.h:4751:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4751:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/page_table_check.h, arch/powerpc/include/asm/book3s/64/pgtable.h, arch/powerpc/include/asm/book3s/64/mmu-hash.h, ...):
   include/linux/jump_label.h:249:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:249:1: sparse: sparse: got }
   include/linux/jump_label.h:254:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:254:1: sparse: sparse: got }
>> include/linux/jump_label.h:262:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:262:16: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:262:16: sparse: sparse: got false
   include/linux/jump_label.h:263:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:263:1: sparse: sparse: got }
   include/linux/jump_label.h:269:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:269:16: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:269:16: sparse: sparse: got false
   include/linux/jump_label.h:270:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:270:1: sparse: sparse: got }
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ) in nested declarator
   include/linux/jump_label.h:276:9: sparse: sparse: got {
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:276:9: sparse: sparse: got (
>> include/linux/jump_label.h:276:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:276:9: sparse: sparse: got "%s(): static key '%pS' used before call to jump_label_init()"
>> include/linux/jump_label.h:276:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:276:9: sparse: sparse: got {
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:276:9: sparse: sparse: got }
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:276:9: sparse: sparse: got !
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:276:9: sparse: sparse: got }
   include/linux/jump_label.h:282:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:282:12: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:282:12: sparse: sparse: got {
   include/linux/jump_label.h:285:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:285:9: sparse: sparse: got }
   include/linux/jump_label.h:286:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:286:16: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:286:16: sparse: sparse: got true
   include/linux/jump_label.h:287:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:287:1: sparse: sparse: got }
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:292:9: sparse: sparse: got (
   include/linux/jump_label.h:292:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:292:9: sparse: sparse: got "%s(): static key '%pS' used before call to jump_label_init()"
   include/linux/jump_label.h:292:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:292:9: sparse: sparse: got {
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:292:9: sparse: sparse: got }
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:292:9: sparse: sparse: got !
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:292:9: sparse: sparse: got }
   include/linux/jump_label.h:293:20: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:293:20: sparse: sparse: got &
   include/linux/jump_label.h:294:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:294:1: sparse: sparse: got }
   include/linux/jump_label.h:302:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:302:1: sparse: sparse: got }
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:309:9: sparse: sparse: got (
   include/linux/jump_label.h:309:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:309:9: sparse: sparse: got "%s(): static key '%pS' used before call to jump_label_init()"
   include/linux/jump_label.h:309:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:309:9: sparse: sparse: got {
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:309:9: sparse: sparse: got }
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:309:9: sparse: sparse: got !
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:309:9: sparse: sparse: got }
   include/linux/jump_label.h:311:24: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:311:24: sparse: sparse: got (
   include/linux/jump_label.h:311:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:312:17: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:312:17: sparse: sparse: got (
   include/linux/jump_label.h:312:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:312:17: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:312:17: sparse: sparse: got !
   include/linux/jump_label.h:312:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:312:17: sparse: sparse: got }
   include/linux/jump_label.h:313:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:314:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:314:9: sparse: sparse: got }
   include/linux/jump_label.h:316:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:316:1: sparse: sparse: got }
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:320:9: sparse: sparse: got (
   include/linux/jump_label.h:320:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:320:9: sparse: sparse: got "%s(): static key '%pS' used before call to jump_label_init()"
   include/linux/jump_label.h:320:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:320:9: sparse: sparse: got {
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:320:9: sparse: sparse: got }
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:320:9: sparse: sparse: got !
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:320:9: sparse: sparse: got }
   include/linux/jump_label.h:322:24: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:322:24: sparse: sparse: got (
   include/linux/jump_label.h:322:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:323:17: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:323:17: sparse: sparse: got (
   include/linux/jump_label.h:323:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:323:17: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:323:17: sparse: sparse: got !
   include/linux/jump_label.h:323:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:323:17: sparse: sparse: got }
   include/linux/jump_label.h:324:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:325:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:325:9: sparse: sparse: got }
   include/linux/jump_label.h:327:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:327:1: sparse: sparse: got }
   include/linux/jump_label.h:405:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:405:13: sparse: sparse: got ____wrong_branch_error
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:268:20: sparse: sparse: Expected ; at end of declaration
--
   include/linux/atomic/atomic-instrumented.h:4482:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4502:42: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4502:42: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4503:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4503:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4503:16: sparse: sparse: got raw_atomic_long_try_cmpxchg_relaxed
   include/linux/atomic/atomic-instrumented.h:4504:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4504:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4521:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4521:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4522:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4522:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4522:16: sparse: sparse: got raw_atomic_long_sub_and_test
   include/linux/atomic/atomic-instrumented.h:4523:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4523:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4539:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4539:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4540:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4540:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4540:16: sparse: sparse: got raw_atomic_long_dec_and_test
   include/linux/atomic/atomic-instrumented.h:4541:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4541:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4557:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4557:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4558:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4558:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4558:16: sparse: sparse: got raw_atomic_long_inc_and_test
   include/linux/atomic/atomic-instrumented.h:4559:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4559:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4576:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4576:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4577:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4577:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4577:16: sparse: sparse: got raw_atomic_long_add_negative
   include/linux/atomic/atomic-instrumented.h:4578:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4578:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4595:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4595:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4595:16: sparse: sparse: got raw_atomic_long_add_negative_acquire
   include/linux/atomic/atomic-instrumented.h:4596:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4596:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4613:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4613:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4614:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4614:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4614:16: sparse: sparse: got raw_atomic_long_add_negative_release
   include/linux/atomic/atomic-instrumented.h:4615:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4615:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4632:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4632:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4632:16: sparse: sparse: got raw_atomic_long_add_negative_relaxed
   include/linux/atomic/atomic-instrumented.h:4633:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4633:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4652:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4652:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4653:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4653:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4653:16: sparse: sparse: got raw_atomic_long_fetch_add_unless
   include/linux/atomic/atomic-instrumented.h:4654:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4654:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4673:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4673:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4674:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4674:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4674:16: sparse: sparse: got raw_atomic_long_add_unless
   include/linux/atomic/atomic-instrumented.h:4675:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4675:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4692:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4692:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4693:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4693:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4693:16: sparse: sparse: got raw_atomic_long_inc_not_zero
   include/linux/atomic/atomic-instrumented.h:4694:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4694:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4711:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4711:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4712:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4712:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4712:16: sparse: sparse: got raw_atomic_long_inc_unless_negative
   include/linux/atomic/atomic-instrumented.h:4713:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4713:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4730:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4730:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4731:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4731:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4731:16: sparse: sparse: got raw_atomic_long_dec_unless_positive
   include/linux/atomic/atomic-instrumented.h:4732:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4732:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4749:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4749:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4750:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4750:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4750:16: sparse: sparse: got raw_atomic_long_dec_if_positive
   include/linux/atomic/atomic-instrumented.h:4751:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4751:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/page_table_check.h, arch/powerpc/include/asm/book3s/64/pgtable.h, arch/powerpc/include/asm/book3s/64/mmu-hash.h, ...):
   include/linux/jump_label.h:249:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:249:1: sparse: sparse: got }
   include/linux/jump_label.h:254:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:254:1: sparse: sparse: got }
>> include/linux/jump_label.h:262:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:262:16: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:262:16: sparse: sparse: got false
   include/linux/jump_label.h:263:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:263:1: sparse: sparse: got }
   include/linux/jump_label.h:269:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:269:16: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:269:16: sparse: sparse: got false
   include/linux/jump_label.h:270:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:270:1: sparse: sparse: got }
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ) in nested declarator
   include/linux/jump_label.h:276:9: sparse: sparse: got {
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:276:9: sparse: sparse: got (
>> include/linux/jump_label.h:276:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:276:9: sparse: sparse: got "%s(): static key '%pS' used before call to jump_label_init()"
>> include/linux/jump_label.h:276:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:276:9: sparse: sparse: got {
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:276:9: sparse: sparse: got }
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:276:9: sparse: sparse: got !
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:276:9: sparse: sparse: got }
   include/linux/jump_label.h:282:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:282:12: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:282:12: sparse: sparse: got {
   include/linux/jump_label.h:285:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:285:9: sparse: sparse: got }
   include/linux/jump_label.h:286:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:286:16: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:286:16: sparse: sparse: got true
   include/linux/jump_label.h:287:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:287:1: sparse: sparse: got }
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:292:9: sparse: sparse: got (
   include/linux/jump_label.h:292:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:292:9: sparse: sparse: got "%s(): static key '%pS' used before call to jump_label_init()"
   include/linux/jump_label.h:292:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:292:9: sparse: sparse: got {
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:292:9: sparse: sparse: got }
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:292:9: sparse: sparse: got !
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:292:9: sparse: sparse: got }
   include/linux/jump_label.h:293:20: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:293:20: sparse: sparse: got &
   include/linux/jump_label.h:294:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:294:1: sparse: sparse: got }
   include/linux/jump_label.h:302:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:302:1: sparse: sparse: got }
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:309:9: sparse: sparse: got (
   include/linux/jump_label.h:309:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:309:9: sparse: sparse: got "%s(): static key '%pS' used before call to jump_label_init()"
   include/linux/jump_label.h:309:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:309:9: sparse: sparse: got {
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:309:9: sparse: sparse: got }
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:309:9: sparse: sparse: got !
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:309:9: sparse: sparse: got }
   include/linux/jump_label.h:311:24: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:311:24: sparse: sparse: got (
   include/linux/jump_label.h:311:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:312:17: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:312:17: sparse: sparse: got (
   include/linux/jump_label.h:312:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:312:17: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:312:17: sparse: sparse: got !
   include/linux/jump_label.h:312:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:312:17: sparse: sparse: got }
   include/linux/jump_label.h:313:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:314:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:314:9: sparse: sparse: got }
   include/linux/jump_label.h:316:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:316:1: sparse: sparse: got }
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:320:9: sparse: sparse: got (
   include/linux/jump_label.h:320:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:320:9: sparse: sparse: got "%s(): static key '%pS' used before call to jump_label_init()"
   include/linux/jump_label.h:320:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:320:9: sparse: sparse: got {
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:320:9: sparse: sparse: got }
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:320:9: sparse: sparse: got !
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:320:9: sparse: sparse: got }
   include/linux/jump_label.h:322:24: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:322:24: sparse: sparse: got (
   include/linux/jump_label.h:322:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:323:17: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:323:17: sparse: sparse: got (
   include/linux/jump_label.h:323:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:323:17: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:323:17: sparse: sparse: got !
   include/linux/jump_label.h:323:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:323:17: sparse: sparse: got }
   include/linux/jump_label.h:324:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:325:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:325:9: sparse: sparse: got }
   include/linux/jump_label.h:327:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:327:1: sparse: sparse: got }
   include/linux/jump_label.h:405:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:405:13: sparse: sparse: got ____wrong_branch_error
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:268:20: sparse: sparse: Expected ; at end of declaration
--
   include/linux/atomic/atomic-instrumented.h:4482:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4502:42: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4502:42: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4503:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4503:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4503:16: sparse: sparse: got raw_atomic_long_try_cmpxchg_relaxed
   include/linux/atomic/atomic-instrumented.h:4504:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4504:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4521:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4521:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4522:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4522:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4522:16: sparse: sparse: got raw_atomic_long_sub_and_test
   include/linux/atomic/atomic-instrumented.h:4523:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4523:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4539:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4539:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4540:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4540:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4540:16: sparse: sparse: got raw_atomic_long_dec_and_test
   include/linux/atomic/atomic-instrumented.h:4541:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4541:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4557:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4557:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4558:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4558:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4558:16: sparse: sparse: got raw_atomic_long_inc_and_test
   include/linux/atomic/atomic-instrumented.h:4559:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4559:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4576:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4576:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4577:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4577:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4577:16: sparse: sparse: got raw_atomic_long_add_negative
   include/linux/atomic/atomic-instrumented.h:4578:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4578:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4595:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4595:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4595:16: sparse: sparse: got raw_atomic_long_add_negative_acquire
   include/linux/atomic/atomic-instrumented.h:4596:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4596:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4613:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4613:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4614:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4614:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4614:16: sparse: sparse: got raw_atomic_long_add_negative_release
   include/linux/atomic/atomic-instrumented.h:4615:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4615:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4632:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4632:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4632:16: sparse: sparse: got raw_atomic_long_add_negative_relaxed
   include/linux/atomic/atomic-instrumented.h:4633:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4633:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4652:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4652:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4653:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4653:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4653:16: sparse: sparse: got raw_atomic_long_fetch_add_unless
   include/linux/atomic/atomic-instrumented.h:4654:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4654:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4673:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4673:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4674:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4674:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4674:16: sparse: sparse: got raw_atomic_long_add_unless
   include/linux/atomic/atomic-instrumented.h:4675:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4675:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4692:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4692:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4693:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4693:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4693:16: sparse: sparse: got raw_atomic_long_inc_not_zero
   include/linux/atomic/atomic-instrumented.h:4694:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4694:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4711:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4711:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4712:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4712:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4712:16: sparse: sparse: got raw_atomic_long_inc_unless_negative
   include/linux/atomic/atomic-instrumented.h:4713:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4713:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4730:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4730:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4731:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4731:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4731:16: sparse: sparse: got raw_atomic_long_dec_unless_positive
   include/linux/atomic/atomic-instrumented.h:4732:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4732:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:4749:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:4749:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:4750:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:4750:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:4750:16: sparse: sparse: got raw_atomic_long_dec_if_positive
   include/linux/atomic/atomic-instrumented.h:4751:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:4751:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/page_table_check.h, arch/powerpc/include/asm/book3s/64/pgtable.h, arch/powerpc/include/asm/book3s/64/mmu-hash.h, ...):
   include/linux/jump_label.h:249:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:249:1: sparse: sparse: got }
   include/linux/jump_label.h:254:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:254:1: sparse: sparse: got }
>> include/linux/jump_label.h:262:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:262:16: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:262:16: sparse: sparse: got false
   include/linux/jump_label.h:263:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:263:1: sparse: sparse: got }
   include/linux/jump_label.h:269:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:269:16: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:269:16: sparse: sparse: got false
   include/linux/jump_label.h:270:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:270:1: sparse: sparse: got }
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ) in nested declarator
   include/linux/jump_label.h:276:9: sparse: sparse: got {
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:276:9: sparse: sparse: got (
>> include/linux/jump_label.h:276:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:276:9: sparse: sparse: got "%s(): static key '%pS' used before call to jump_label_init()"
>> include/linux/jump_label.h:276:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:276:9: sparse: sparse: got {
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:276:9: sparse: sparse: got }
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:276:9: sparse: sparse: got !
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:276:9: sparse: sparse: got }
   include/linux/jump_label.h:282:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:282:12: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:282:12: sparse: sparse: got {
   include/linux/jump_label.h:285:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:285:9: sparse: sparse: got }
   include/linux/jump_label.h:286:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:286:16: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:286:16: sparse: sparse: got true
   include/linux/jump_label.h:287:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:287:1: sparse: sparse: got }
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:292:9: sparse: sparse: got (
   include/linux/jump_label.h:292:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:292:9: sparse: sparse: got "%s(): static key '%pS' used before call to jump_label_init()"
   include/linux/jump_label.h:292:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:292:9: sparse: sparse: got {
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:292:9: sparse: sparse: got }
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:292:9: sparse: sparse: got !
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:292:9: sparse: sparse: got }
   include/linux/jump_label.h:293:20: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:293:20: sparse: sparse: got &
   include/linux/jump_label.h:294:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:294:1: sparse: sparse: got }
   include/linux/jump_label.h:302:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:302:1: sparse: sparse: got }
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:309:9: sparse: sparse: got (
   include/linux/jump_label.h:309:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:309:9: sparse: sparse: got "%s(): static key '%pS' used before call to jump_label_init()"
   include/linux/jump_label.h:309:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:309:9: sparse: sparse: got {
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:309:9: sparse: sparse: got }
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:309:9: sparse: sparse: got !
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:309:9: sparse: sparse: got }
   include/linux/jump_label.h:311:24: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:311:24: sparse: sparse: got (
   include/linux/jump_label.h:311:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:312:17: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:312:17: sparse: sparse: got (
   include/linux/jump_label.h:312:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:312:17: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:312:17: sparse: sparse: got !
   include/linux/jump_label.h:312:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:312:17: sparse: sparse: got }
   include/linux/jump_label.h:313:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:314:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:314:9: sparse: sparse: got }
   include/linux/jump_label.h:316:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:316:1: sparse: sparse: got }
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:320:9: sparse: sparse: got (
   include/linux/jump_label.h:320:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:320:9: sparse: sparse: got "%s(): static key '%pS' used before call to jump_label_init()"
   include/linux/jump_label.h:320:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:320:9: sparse: sparse: got {
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:320:9: sparse: sparse: got }
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:320:9: sparse: sparse: got !
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:320:9: sparse: sparse: got }
   include/linux/jump_label.h:322:24: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:322:24: sparse: sparse: got (
   include/linux/jump_label.h:322:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:323:17: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:323:17: sparse: sparse: got (
   include/linux/jump_label.h:323:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:323:17: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:323:17: sparse: sparse: got !
   include/linux/jump_label.h:323:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:323:17: sparse: sparse: got }
   include/linux/jump_label.h:324:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:325:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:325:9: sparse: sparse: got }
   include/linux/jump_label.h:327:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:327:1: sparse: sparse: got }
   include/linux/jump_label.h:405:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:405:13: sparse: sparse: got ____wrong_branch_error
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/book3s/64/mmu-hash.h, arch/powerpc/include/asm/book3s/64/mmu.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/book3s/64/pgtable.h:268:20: sparse: sparse: Expected ; at end of declaration

vim +/return +262 include/linux/jump_label.h

1f69bf9c6137602 Jason Baron             2016-08-03  245  
656d054e0a15ec3 Peter Zijlstra          2022-05-02  246  static __always_inline int static_key_count(struct static_key *key)
4c5ea0a9cd02d6a Paolo Bonzini           2016-06-21  247  {
0f613bfa8268a89 Mark Rutland            2023-06-05  248  	return raw_atomic_read(&key->enabled);
4c5ea0a9cd02d6a Paolo Bonzini           2016-06-21 @249  }
4c5ea0a9cd02d6a Paolo Bonzini           2016-06-21  250  
97ce2c88f9ad42e Jeremy Fitzhardinge     2011-10-12  251  static __always_inline void jump_label_init(void)
97ce2c88f9ad42e Jeremy Fitzhardinge     2011-10-12  252  {
c4b2c0c5f647aa1 Hannes Frederic Sowa    2013-10-19  253  	static_key_initialized = true;
97ce2c88f9ad42e Jeremy Fitzhardinge     2011-10-12  254  }
97ce2c88f9ad42e Jeremy Fitzhardinge     2011-10-12  255  
91a1d97ef482c1e Peter Zijlstra          2024-03-13  256  static __always_inline void jump_label_init_ro(void) { }
91a1d97ef482c1e Peter Zijlstra          2024-03-13  257  
c5905afb0ee6550 Ingo Molnar             2012-02-24  258  static __always_inline bool static_key_false(struct static_key *key)
c5905afb0ee6550 Ingo Molnar             2012-02-24  259  {
2f0df49c89acaa5 Steven Rostedt (VMware  2020-12-11  260) 	if (unlikely_notrace(static_key_count(key) > 0))
c5905afb0ee6550 Ingo Molnar             2012-02-24  261  		return true;
c5905afb0ee6550 Ingo Molnar             2012-02-24 @262  	return false;
c5905afb0ee6550 Ingo Molnar             2012-02-24  263  }
c5905afb0ee6550 Ingo Molnar             2012-02-24  264  
c5905afb0ee6550 Ingo Molnar             2012-02-24  265  static __always_inline bool static_key_true(struct static_key *key)
d430d3d7e646eb1 Jason Baron             2011-03-16  266  {
2f0df49c89acaa5 Steven Rostedt (VMware  2020-12-11  267) 	if (likely_notrace(static_key_count(key) > 0))
d430d3d7e646eb1 Jason Baron             2011-03-16  268  		return true;
d430d3d7e646eb1 Jason Baron             2011-03-16 @269  	return false;
d430d3d7e646eb1 Jason Baron             2011-03-16 @270  }
bf5438fca2950b0 Jason Baron             2010-09-17  271  
eb8c507296f6038 Dmitry Safonov          2022-11-23  272  static inline bool static_key_fast_inc_not_disabled(struct static_key *key)
d430d3d7e646eb1 Jason Baron             2011-03-16  273  {
eb8c507296f6038 Dmitry Safonov          2022-11-23  274  	int v;
eb8c507296f6038 Dmitry Safonov          2022-11-23  275  
5cdda5117e125e0 Borislav Petkov         2017-10-18 @276  	STATIC_KEY_CHECK_USE(key);
eb8c507296f6038 Dmitry Safonov          2022-11-23  277  	/*
eb8c507296f6038 Dmitry Safonov          2022-11-23  278  	 * Prevent key->enabled getting negative to follow the same semantics
eb8c507296f6038 Dmitry Safonov          2022-11-23  279  	 * as for CONFIG_JUMP_LABEL=y, see kernel/jump_label.c comment.
eb8c507296f6038 Dmitry Safonov          2022-11-23  280  	 */
eb8c507296f6038 Dmitry Safonov          2022-11-23  281  	v = atomic_read(&key->enabled);
eb8c507296f6038 Dmitry Safonov          2022-11-23  282  	do {
eb8c507296f6038 Dmitry Safonov          2022-11-23  283  		if (v < 0 || (v + 1) < 0)
eb8c507296f6038 Dmitry Safonov          2022-11-23  284  			return false;
eb8c507296f6038 Dmitry Safonov          2022-11-23  285  	} while (!likely(atomic_try_cmpxchg(&key->enabled, &v, v + 1)));
eb8c507296f6038 Dmitry Safonov          2022-11-23  286  	return true;
d430d3d7e646eb1 Jason Baron             2011-03-16  287  }
eb8c507296f6038 Dmitry Safonov          2022-11-23  288  #define static_key_slow_inc(key)	static_key_fast_inc_not_disabled(key)
bf5438fca2950b0 Jason Baron             2010-09-17  289  

:::::: The code at line 262 was first introduced by commit
:::::: c5905afb0ee6550b42c49213da1c22d67316c194 static keys: Introduce 'struct static_key', static_key_true()/false() and static_key_slow_[inc|dec]()

:::::: TO: Ingo Molnar <mingo@elte.hu>
:::::: CC: Ingo Molnar <mingo@elte.hu>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
