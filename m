Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B696123183F
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Feb 2026 22:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770416573; cv=none; b=VU2BCOw/cgFPVbrH9Fx7HyMwbkotOLhiMi02N26lMiCtjEb8KX25RfNFhUHDOnhMPSyzxVl+v2v/GHlJtyB1Jsa4twl0cdHOHIfWw07NuhKeTCSF+ibNKBFi/UWgLVraoi1PcCFARvfBeEG77yMAB7Il/8K/VAcCEt2oRjLsZ1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770416573; c=relaxed/simple;
	bh=mx4MzrwaTXZD0wviKV7e1EbsSzFIDanmElCPp6XpGsg=;
	h=Date:From:To:Subject:Message-ID; b=BcvZiMM655XbFjcNbBoV0BJjZBKoXgpy/RQdorMWlIfynBvjvq4w7dCNOIA95Lz2FtPfK92CwrTrbsR36im+l6AkNYlkUUJCnbWrCYSVqWE8I4KcqfAVzDp9oN5otJY6zwRP+rPCmtaOl+RyazxWiWpZ0Bo59w/7EW3OKnTU3bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=co71yxH7; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="co71yxH7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770416573; x=1801952573;
  h=date:from:to:subject:message-id;
  bh=mx4MzrwaTXZD0wviKV7e1EbsSzFIDanmElCPp6XpGsg=;
  b=co71yxH7jdS2Edk2qrdss2XrQB0PYQHtA0h84lni1TsI8jJcIB2hBgGI
   rAA55OsP9hE9CHIZWg2lpD4CCky6TR2SqXY5BKe5uiZwX9WhNtG7My/bN
   fj+8hVAo8kErhMliSssf5q+QOpbo9uyl0NGBoJxTpEeF4qVJy9zyZpeog
   19YtDN+b8BxQaUubx+IjSISBkVO+IMF7zG52/U+AqClkFHqs15OBmHHZT
   PHRMNyKqr6zzWQlVD6fyPPMpoBd2p4QgReJloJudDZQgs+VQS5832wKZL
   6ITnmEVKFE7Qe58zp+vW45aMyMhMX9oT43xbZZw6KN458/5iOCx3ywtUE
   Q==;
X-CSE-ConnectionGUID: IRDOMKpCT72Ej3hzI44RHA==
X-CSE-MsgGUID: Runckv0sTsWJhT25hjP/vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="97087338"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="97087338"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 14:22:52 -0800
X-CSE-ConnectionGUID: Cy31DsT/QGuA5bZnVGqMng==
X-CSE-MsgGUID: l0MGCKuRR0mKZZSRdJSs6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="211039345"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 06 Feb 2026 14:22:52 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voUDx-000000004j7-1Fcy
	for oe-kbuild@lists.linux.dev;
	Fri, 06 Feb 2026 22:22:49 +0000
Date: Fri, 06 Feb 2026 23:22:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [kvms390:next 20/31] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'asce'
Message-ID: <202602062337.xD5CFcYI-lkp@intel.com>
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
TO: Claudio Imbrenda <imbrenda@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git next
head:   f7ab71f178d56447e5efb55b65436feb68662f8f
commit: a2c17f9270cc3f1c55c35e8b1d151f41d75b40f5 [20/31] KVM: s390: New gmap code
:::::: branch date: 12 hours ago
:::::: commit date: 2 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260206/202602062337.xD5CFcYI-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'asce'
#1448: FILE: arch/s390/kvm/gmap.h:239:
+static inline bool gmap_is_shadow_valid(struct gmap *sg, union asce asce, int edat_level)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
