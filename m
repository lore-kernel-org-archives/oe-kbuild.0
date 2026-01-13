Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E544272E63
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Jan 2026 10:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768300430; cv=none; b=ongI9G9h1gG3fDSejT+i+mTHsemcgxA+Bg762/emuzU51NCSR6oJsPhQ9z9RvgP5Bbv29XXktpUYfkV9ADsIDWGFdHu2KyHPubALBmHAajhV67ANxHdaxL3V82ncJGFOW/Kwvt1eLt7yS+esn+gD+sbNvodgOscfmDq0M+2pFEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768300430; c=relaxed/simple;
	bh=ZuxRB4qIBEWBeE9gcyA0zG+WQ5RS5xK+Q0EI9I9kg2U=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sxqcwMurTfHXr4P892Hl6s+V2NSae+FDN93aeNGv2V5fv9/963Q0UludKahm6iGYB5PO8iaX6klH8GYVx6CEjH8ELN2Rp+A2Mg66vEXEwpLx0qwJr8KUvEO6/a9SnDdoQyYzF+LvEHBe63B7EGB17cQpFpQYMW4z6OVDojqDHlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D5PxYe1k; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D5PxYe1k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768300430; x=1799836430;
  h=date:from:to:subject:message-id:mime-version;
  bh=ZuxRB4qIBEWBeE9gcyA0zG+WQ5RS5xK+Q0EI9I9kg2U=;
  b=D5PxYe1kloWuWJdqQyN4sMyDKgwZa8soAqhxKglIu0Pjj52sNRmtT7/F
   BsEHYS6L5jf4rRrpwFG9VDfiODgc2rexf4pRvPv/C7is96GEhSNIcUMAS
   olwMsVGJJgJOogSL6LzVZ7Ch4FIhgAUDH/m5+9Nc24wBic22VY/w2F6PN
   qWIBvVxJV2ToKgnRgaaoRidhWRzueFmyW8NzUltnoJ33JzHxwiUKFSMcW
   lBGZZfKd8uYq+83mQdJLDUkbjMQCCI8uXA2wE3bFncTjuvI/CQ02B/SLD
   gVkGMQA111fFBtMZqqwwmST98BNKNRXp/LrGXy1gXR7vFZPEdxNEZO80s
   w==;
X-CSE-ConnectionGUID: Rt86dZesRC6eFdHOxJqRUQ==
X-CSE-MsgGUID: V6Ks4d1KQOyCkNGsn5jCAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69504585"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69504585"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 02:33:46 -0800
X-CSE-ConnectionGUID: YI1jbVRTQb2roAYIB9uw2w==
X-CSE-MsgGUID: dl1Tttn2R+uwwNi7u5M2TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204436213"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 13 Jan 2026 02:33:45 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfbiZ-0000000017l-0wnE
	for oe-kbuild@lists.linux.dev;
	Tue, 13 Jan 2026 10:33:43 +0000
Date: Tue, 13 Jan 2026 11:32:49 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH 1/7] btrfs: Use percpu refcounting for block groups
Message-ID: <202601131155.ulOGAl1n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <0102019bb2ff56b7-9302e783-c17d-452d-b6a7-11f773776ae7-000000@eu-west-1.amazonses.com>
References: <0102019bb2ff56b7-9302e783-c17d-452d-b6a7-11f773776ae7-000000@eu-west-1.amazonses.com>
TO: Martin Raiber <martin@urbackup.org>
TO: linux-btrfs@vger.kernel.org

Hi Martin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kdave/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Martin-Raiber/btrfs-Use-percpu-semaphore-for-space-info-groups_sem/20260113-070107
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/0102019bb2ff56b7-9302e783-c17d-452d-b6a7-11f773776ae7-000000%40eu-west-1.amazonses.com
patch subject: [PATCH 1/7] btrfs: Use percpu refcounting for block groups
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260113/202601131155.ulOGAl1n-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#57: FILE: fs/btrfs/block-group.c:166:
+	/*
+	* If there was a failure to cleanup a log tree, very likely due

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#72: FILE: fs/btrfs/block-group.c:177:
+	/*
+	* A block_group shouldn't be on the discard_list anymore.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
