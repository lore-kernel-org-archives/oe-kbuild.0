Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52191487E9
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Nov 2025 03:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764040659; cv=none; b=eaO1QFxxC29LWWq7JkNNrxl+lVfeW1jrsuakhu2YPf9ONPUBXjhn4j7CU8LWRIkrXqaQdYQJOuuGbRUzfLKTBgZbWfk/vUFB2dxq4gUbbCPuT63ZZQWcBmnJLv1Hyd2ACcEPWTY8e2obc8SZ+SBA2Q3let6EpzRc5XXHhB+pxxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764040659; c=relaxed/simple;
	bh=5NPHOdvXP3XpYgusO/RnkUjT2sWMnI/1zhx4txKFpmc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BqBS1tPe0kzpgs/ZLfIFwGCyKrKGXqIo4tqn/LQBeBpHlQOA7rsR0DK+optyskuPRctin/jvza7Eyf+8wjcu0I1LBOKBz9qvjTUUCFwuYfawQO3mNfqHfv6+6xMNrFRvrMTS3cIgEuCRmTXdzrv3AASszlL4pmV+J6k3xYFeuUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D6yUeKZS; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D6yUeKZS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764040658; x=1795576658;
  h=date:from:to:subject:message-id:mime-version;
  bh=5NPHOdvXP3XpYgusO/RnkUjT2sWMnI/1zhx4txKFpmc=;
  b=D6yUeKZSRVxI6R7sywRniWAslL8hLH9uMx2Ow+Qijj8m5dAHBNUKi73N
   /+/2/n8XC3mxjb39mHMDjNuVbSW1FbILjIMRWquVceQrCe9fFTXy6Qj89
   TjnzONbBRJ5lEY/UP5lPPV6gZ1ACb9esjbeJwRDZGFoCWiqvkC0/Y/I/9
   9/U0+YmBXJ5QWsjevL7QjSCcEhIuvxCO1JZ1g5/sGcBlognugtaUMbduu
   FCQJbMWZvYJnjsApCAmYJnTrZ/dXnCLXU6Aj6cuneoBuWbnsmLEkalBYw
   ZYEu7qQXw2R4c0lxHMHw4pEcrbE5USLXPop491MLJpkiE8IDsO8HFlteu
   Q==;
X-CSE-ConnectionGUID: 9DuR79CUSRmVOC+88fMtzw==
X-CSE-MsgGUID: QXcEyKq7TJCXhOXpynsWUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="77528011"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="77528011"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 19:17:38 -0800
X-CSE-ConnectionGUID: D6PXVOrFTmCnGs2vGeKcJw==
X-CSE-MsgGUID: DOG5ozALTI2ggansigO1Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="192399724"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 24 Nov 2025 19:17:37 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNjYc-000000000On-2i93
	for oe-kbuild@lists.linux.dev;
	Tue, 25 Nov 2025 03:17:34 +0000
Date: Tue, 25 Nov 2025 04:16:42 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [gfs2:withdraw 5/30] checkpatch: WARNING:REPEATED_WORD: Possible
 repeated word: 'calls'
Message-ID: <202511250416.3Db68hrx-lkp@intel.com>
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
TO: Andreas Gruenbacher <agruenba@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git withdraw
head:   45c733b47f9b598c279684b9dcaffa09100d48ec
commit: 427464b1bcdc8e9924ac732630f8a060a724fc34 [5/30] gfs2: Prevent recursive memory reclaim
:::::: branch date: 8 days ago
:::::: commit date: 11 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251125/202511250416.3Db68hrx-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'calls'
#14: 
This calls calls filemap_grab_folio(), which can allocate a new folio,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
