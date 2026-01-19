Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83D3330320
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 05:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768800374; cv=none; b=uW8Q+jZvvHdDZfgeHvkT13cl6gmW/jL9quBgLQRYAdzcYwKYJF1mLnd9GqoeB2NJgZvc6k+shLkTS1AVaf0I/5cMR96YmO+WxXfldqj4eZlJ6rVCICXu9HhZWhmz+XMuDXCw5mYUXX8zncAalP6Q8Wavh0zboLlVJMZ78SsLDQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768800374; c=relaxed/simple;
	bh=6uOkxWGugW3RtmeNd0GZX0VvluI+KzooNxzerfGU850=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ukDz84kdxe1tGn+tejzCk2B02Ej8mwKt2KdnZnMtb5tHO6iWswjXq8fvt+31hqj/R0jNknqXAKKQfwvYniTml4TxbSIVqDx0CdElK4O/BpuJtvpX+HLG09luP0LYmHsTtwBkD2Uo87dqBaAXpKhYuZ1C0BL6qZiUweYRI6xUlyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JggnMnfr; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JggnMnfr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768800372; x=1800336372;
  h=date:from:to:cc:subject:message-id;
  bh=6uOkxWGugW3RtmeNd0GZX0VvluI+KzooNxzerfGU850=;
  b=JggnMnfrF0AjYtViCjvIFJEHvZM766lQj+e5UmOGp6DDjMcATB/C9GcO
   uPUCP/CzvjCXqQytsRPt9VEfeA7TUgU9lj3e0VOiAGtB6KpgyZYSlvWHb
   CLKxaSscE/w88GfAYtlKfkWAiuu36kouAzOk0Sf/RuHQXmoaDNc5UqxB1
   +4MX/3Ej+Fvg88XIT6+kng3ZjmHIDde5ST3Z/+VCGKNplfK7S1j55b7Ej
   U+s1kMZb3zRdQFcU8r0UfIZsJ9fQzghTeHbSOsjs4SscoL5hvN//gQscA
   cdEcVH1T6RwjOj2vEl137zyviIuGZlFqY7GMS+FAMz/ciJfETowJqwV1n
   g==;
X-CSE-ConnectionGUID: ANJA3onTTIW3o4Axz1kbbw==
X-CSE-MsgGUID: oDBprlyOROWkwq/xDum7+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="70058265"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="70058265"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 21:26:11 -0800
X-CSE-ConnectionGUID: u9xanOByQ2CfrdWCoTC8Bg==
X-CSE-MsgGUID: J4ER4DC+SFKJzkJufBY62A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="210258430"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Jan 2026 21:26:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhhmB-00000000NTz-3O5A;
	Mon, 19 Jan 2026 05:26:07 +0000
Date: Mon, 19 Jan 2026 13:25:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1582/6849]
 drivers/gpu/drm/xe/xe_guc_ads.c:353:9: sparse: sparse: Trying to use reserved
 word 'if' as identifier
Message-ID: <202601191308.et1mWcLe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/xe/xe_guc_ads.c:353:9: sparse: sparse: Trying to use reserved word 'if' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
commit: 09af64eba63ece2d928295e61ab1d56ae264447c [1582/6849] drm/xe/guc: Introduce GUC_FIRMWARE_VER_AT_LEAST helper
:::::: branch date: 3 days ago
:::::: commit date: 5 weeks ago
config: alpha-randconfig-r123-20260118 (https://download.01.org/0day-ci/archive/20260119/202601191308.et1mWcLe-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601191308.et1mWcLe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601191308.et1mWcLe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/xe/xe_guc_ads.c:350:13: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_guc_ads.c:350:13: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_guc_ads.c:350:63: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:350:63: sparse: sparse: got )
   drivers/gpu/drm/xe/xe_guc_ads.c:350:63: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:350:63: sparse: sparse: got &&
   drivers/gpu/drm/xe/xe_guc_ads.c:350:63: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:350:63: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:353:13: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:353:13: sparse: sparse: got (
>> drivers/gpu/drm/xe/xe_guc_ads.c:353:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: got &
>> drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: Trying to use reserved word 'void' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: got 1
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: got (
>> drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: Trying to use reserved word 'void' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: got &&
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:358:43: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:358:43: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_guc_ads.c:360:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:360:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: got &
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: Trying to use reserved word 'void' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: got 1
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: Trying to use reserved word 'void' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: got &&
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:367:13: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:367:13: sparse: sparse: got !
   drivers/gpu/drm/xe/xe_guc_ads.c:367:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: got !
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: got }
>> drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Expected ; at end of declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: got !
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Expected ; at end of declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: got !
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: Expected ; at end of declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:376:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:376:1: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:385:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:385:1: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:396:12: sparse: sparse: Expected ; at end of declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:396:12: sparse: sparse: got ->
   drivers/gpu/drm/xe/xe_guc_ads.c:397:12: sparse: sparse: Expected ; at end of declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:397:12: sparse: sparse: got ->
   drivers/gpu/drm/xe/xe_guc_ads.c:398:12: sparse: sparse: Expected ; at end of declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:398:12: sparse: sparse: got ->
   drivers/gpu/drm/xe/xe_guc_ads.c:399:12: sparse: sparse: Expected ; at end of declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:399:12: sparse: sparse: got ->
   drivers/gpu/drm/xe/xe_guc_ads.c:406:19: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:406:19: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_ads.c:406:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:409:12: sparse: sparse: Expected ; at end of declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:409:12: sparse: sparse: got ->
   drivers/gpu/drm/xe/xe_guc_ads.c:411:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:411:16: sparse: sparse: Expected ; at end of declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:411:16: sparse: sparse: got 0
   drivers/gpu/drm/xe/xe_guc_ads.c:412:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:412:1: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:350:13: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/xe_guc_ads.c:350:63: sparse: sparse: undefined identifier '__gt'
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: undefined identifier '__xe'
   drivers/gpu/drm/xe/xe_guc_ads.c:358:17: sparse: sparse: symbol 'guc_waklv_enable' redeclared with different type (incompatible argument 1 (different base types)):
   drivers/gpu/drm/xe/xe_guc_ads.c:358:17: sparse:    int static [signed] [toplevel] guc_waklv_enable( ... )
   drivers/gpu/drm/xe/xe_guc_ads.c:287:13: sparse: note: previously declared as:
   drivers/gpu/drm/xe/xe_guc_ads.c:287:13: sparse:    void static [toplevel] guc_waklv_enable( ... )
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: undefined identifier '__xe'

vim +/if +353 drivers/gpu/drm/xe/xe_guc_ads.c

c151ff5c905333 Badal Nilawar    2024-04-05  310  
d6da81a4785ca6 Badal Nilawar    2024-04-05  311  static void guc_waklv_init(struct xe_guc_ads *ads)
d6da81a4785ca6 Badal Nilawar    2024-04-05  312  {
c151ff5c905333 Badal Nilawar    2024-04-05  313  	struct xe_gt *gt = ads_to_gt(ads);
d6da81a4785ca6 Badal Nilawar    2024-04-05  314  	u64 addr_ggtt;
d6da81a4785ca6 Badal Nilawar    2024-04-05  315  	u32 offset, remain, size;
d6da81a4785ca6 Badal Nilawar    2024-04-05  316  
d6da81a4785ca6 Badal Nilawar    2024-04-05  317  	offset = guc_ads_waklv_offset(ads);
d6da81a4785ca6 Badal Nilawar    2024-04-05  318  	remain = guc_ads_waklv_size(ads);
d6da81a4785ca6 Badal Nilawar    2024-04-05  319  
83f4151787c5dd Matt Roper       2025-12-12  320  	if (XE_GT_WA(gt, 16021333562))
7c9de25efa7677 Jonathan Cavitt  2025-07-28  321  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
7c9de25efa7677 Jonathan Cavitt  2025-07-28  322  				 GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED);
4d5c98eb77fe51 Matt Atwood      2025-08-07  323  	if (XE_GT_WA(gt, 18024947630))
7c9de25efa7677 Jonathan Cavitt  2025-07-28  324  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
7c9de25efa7677 Jonathan Cavitt  2025-07-28  325  				 GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING);
4d5c98eb77fe51 Matt Atwood      2025-08-07  326  	if (XE_GT_WA(gt, 16022287689))
7c9de25efa7677 Jonathan Cavitt  2025-07-28  327  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
7c9de25efa7677 Jonathan Cavitt  2025-07-28  328  				 GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE);
d6da81a4785ca6 Badal Nilawar    2024-04-05  329  
4d5c98eb77fe51 Matt Atwood      2025-08-07  330  	if (XE_GT_WA(gt, 14022866841))
7c9de25efa7677 Jonathan Cavitt  2025-07-28  331  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
7c9de25efa7677 Jonathan Cavitt  2025-07-28  332  				 GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO);
61ef737db9f284 Vinay Belgaumkar 2024-10-15  333  
2817a1f1bfb1a2 Vinay Belgaumkar 2024-04-16  334  	/*
2817a1f1bfb1a2 Vinay Belgaumkar 2024-04-16  335  	 * On RC6 exit, GuC will write register 0xB04 with the default value provided. As of now,
2817a1f1bfb1a2 Vinay Belgaumkar 2024-04-16  336  	 * the default value for this register is determined to be 0xC40. This could change in the
2817a1f1bfb1a2 Vinay Belgaumkar 2024-04-16  337  	 * future, so GuC depends on KMD to send it the correct value.
2817a1f1bfb1a2 Vinay Belgaumkar 2024-04-16  338  	 */
4d5c98eb77fe51 Matt Atwood      2025-08-07  339  	if (XE_GT_WA(gt, 13011645652)) {
7c9de25efa7677 Jonathan Cavitt  2025-07-28  340  		u32 data = 0xC40;
7c9de25efa7677 Jonathan Cavitt  2025-07-28  341  
19baa830fbb60d Lucas De Marchi  2025-09-12  342  		guc_waklv_enable(ads, &data, 1, &offset, &remain,
7c9de25efa7677 Jonathan Cavitt  2025-07-28  343  				 GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE);
7c9de25efa7677 Jonathan Cavitt  2025-07-28  344  	}
2817a1f1bfb1a2 Vinay Belgaumkar 2024-04-16  345  
4d5c98eb77fe51 Matt Atwood      2025-08-07  346  	if (XE_GT_WA(gt, 14022293748) || XE_GT_WA(gt, 22019794406))
7c9de25efa7677 Jonathan Cavitt  2025-07-28  347  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
7c9de25efa7677 Jonathan Cavitt  2025-07-28  348  				 GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET);
636cdf6fbddff4 Julia Filipchuk  2024-08-05  349  
09af64eba63ece Michal Wajdeczko 2025-12-16  350  	if (GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 44) && XE_GT_WA(gt, 16026508708))
7c9de25efa7677 Jonathan Cavitt  2025-07-28  351  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
7c9de25efa7677 Jonathan Cavitt  2025-07-28  352  				 GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH);
09af64eba63ece Michal Wajdeczko 2025-12-16 @353  	if (GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 47) && XE_GT_WA(gt, 16026007364)) {
7c9de25efa7677 Jonathan Cavitt  2025-07-28  354  		u32 data[] = {
d72779c29d82c6 Sk Anirban       2025-07-16  355  			0x0,
d72779c29d82c6 Sk Anirban       2025-07-16  356  			0xF,
7c9de25efa7677 Jonathan Cavitt  2025-07-28  357  		};
19baa830fbb60d Lucas De Marchi  2025-09-12  358  		guc_waklv_enable(ads, data, ARRAY_SIZE(data), &offset, &remain,
7c9de25efa7677 Jonathan Cavitt  2025-07-28  359  				 GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG);
7c9de25efa7677 Jonathan Cavitt  2025-07-28  360  	}
d3e8349edf7ed9 John Harrison    2025-04-03  361  
29042df3acdc73 Badal Nilawar    2025-08-21  362  	if (XE_GT_WA(gt, 14020001231))
29042df3acdc73 Badal Nilawar    2025-08-21  363  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
29042df3acdc73 Badal Nilawar    2025-08-21  364  				 GUC_WORKAROUND_KLV_DISABLE_PSMI_INTERRUPTS_AT_C6_ENTRY_RESTORE_AT_EXIT);
29042df3acdc73 Badal Nilawar    2025-08-21  365  
d6da81a4785ca6 Badal Nilawar    2024-04-05  366  	size = guc_ads_waklv_size(ads) - remain;
d6da81a4785ca6 Badal Nilawar    2024-04-05  367  	if (!size)
d6da81a4785ca6 Badal Nilawar    2024-04-05  368  		return;
d6da81a4785ca6 Badal Nilawar    2024-04-05  369  
d6da81a4785ca6 Badal Nilawar    2024-04-05  370  	offset = guc_ads_waklv_offset(ads);
d6da81a4785ca6 Badal Nilawar    2024-04-05  371  	addr_ggtt = xe_bo_ggtt_addr(ads->bo) + offset;
d6da81a4785ca6 Badal Nilawar    2024-04-05  372  
d6da81a4785ca6 Badal Nilawar    2024-04-05 @373  	ads_blob_write(ads, ads.wa_klv_addr_lo, lower_32_bits(addr_ggtt));
d6da81a4785ca6 Badal Nilawar    2024-04-05  374  	ads_blob_write(ads, ads.wa_klv_addr_hi, upper_32_bits(addr_ggtt));
d6da81a4785ca6 Badal Nilawar    2024-04-05  375  	ads_blob_write(ads, ads.wa_klv_size, size);
d6da81a4785ca6 Badal Nilawar    2024-04-05  376  }
d6da81a4785ca6 Badal Nilawar    2024-04-05  377  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
