Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B132DAFAC
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Dec 2025 09:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764753963; cv=none; b=W0qyZ06KG70FTwAMSnYgMEYhQcVxT4k8GFlZtAtznLHsipzJqZv2prLLrCCF1Z6fTY2fQ93rfWmx6rBjHniyCbQ0oV0MBrfn0G3Lh9IenF+6XsvpTEr1LqWxdAEgpoCqpaUiuP6MeWOCyJBPnzzUEKn/rbo7jJ2pq8NPPOCqH3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764753963; c=relaxed/simple;
	bh=eSOA2cl8At24kximf3D+cznK8ohiNixNzeHTvphhdvc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N6ivcsRt6sAgOfF7erRgXhTAfjhdt7Og7FhEV0hH4sh0icjor2kz107M24ln7ymubWBJomaBEyek//e5oy49tG6gZQLc3MzylvrEsrpoTOAA8CKqTiWJO6PTOxAUSxlkimZPB31GTUKGR5xNIji9b0Q+WrYHDRw2HITuBnHVDWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hV//JrcE; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hV//JrcE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764753962; x=1796289962;
  h=date:from:to:subject:message-id:mime-version;
  bh=eSOA2cl8At24kximf3D+cznK8ohiNixNzeHTvphhdvc=;
  b=hV//JrcEWGYUOQS8P5T+M99ecXGciQ7Il4dpI2HTvp7VJ9CjgnZCLOEE
   sDuYOOohiQmNOGKRJAqFSHKZZh+l9njrxVxj+GFPF9pykLoG5WFKxolqu
   QEaf7XtZ5gx4P2CQADwltMKeI5mH26EGIBRAxGKkDg7iEiWUh56ww8m9y
   6V5Vsv903KicI4akNfwtWKYy8lYiaGNl00l2FiRD2ZL79vm4z/n3srqNG
   K3F/Ltx/QLWkhVcav1R/5WS6NQPsEUzAKSEhC/azpUfiD2xfQb4qXWZI1
   0jo5rzVKOE4VeoVljbMWqJ/sg13NSVK7G5/FSF4j32BkswuKrk7E1Yw2A
   Q==;
X-CSE-ConnectionGUID: pcc97ybjRPu3aXdfhHq9kA==
X-CSE-MsgGUID: M3y8o0lUSGyIVFvZEIvQLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="65929248"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="65929248"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 01:26:01 -0800
X-CSE-ConnectionGUID: oRTZzF7NS3eZ/xgRMo1qbw==
X-CSE-MsgGUID: FBrpm8+CQCSfohFfHyXOEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="194730796"
Received: from igk-lkp-server01.igk.intel.com (HELO b0b5278ab892) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 03 Dec 2025 01:26:00 -0800
Received: from kbuild by b0b5278ab892 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQj7W-0000000002w-0g84
	for oe-kbuild@lists.linux.dev;
	Wed, 03 Dec 2025 09:25:58 +0000
Date: Wed, 3 Dec 2025 10:25:26 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sj:damon/next 58/155] checkpatch: WARNING:REPEATED_WORD: Possible
 repeated word: 'is'
Message-ID: <202512030352.YKSRFhJQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251203092526.c6iopd_SRjlmd0OYkj5tbLn0TWMYDcvy0_whYhdMZx0@z>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: SeongJae Park <sj@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   03c935d3c4cacc96f6c2edefde3686669cba2195
commit: 76ba4814ec818fe2d77ae86f4fc14185ce99feef [58/155] mm/damon: add data structures for access check control
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251203/202512030352.YKSRFhJQ-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'is'
#45: FILE: include/linux/damon.h:827:
+ * @matching:	Whether is is for condition-matching reports.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
