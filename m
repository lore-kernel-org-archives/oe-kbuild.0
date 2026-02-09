Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D688A30BF69
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Feb 2026 21:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770671643; cv=none; b=DdLgkZyJU3q9QFtTYylDeLjd4qKBzsGMmAv081ZGUELjvASiCCe+jluvHlrmBqNRvIhKbgVi7P3D/Bkoy+ad1nHcS7W0cLuNFkZbrxNN1hHTeHXltYHob8Gz1pzeO1uv5e3mx7L3bs0e2upDj3hrFJ/4vZrmnPnfY9IIs5Ofztg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770671643; c=relaxed/simple;
	bh=BP56CFjImxVYfEC9LwpXFaWmSJV68MwG5FrWK6Mt57g=;
	h=Date:From:To:Subject:Message-ID; b=lcYztIfocIRLj24kggdYhviKJIRJbs1bcBuSG574pbRjxq/hEy0ujfCOOfKni+p1nSGiVDd6zEtS4QfhL6M4C6qh+JfyV31dCzoniT5uGbgtA2MsGL2lluzFelyl8PJXyFRf8N0m5tFdnB88I1UjnrKoPqEjrVqZGrHHkGeVlDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iPeMnJ6f; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iPeMnJ6f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770671642; x=1802207642;
  h=date:from:to:subject:message-id;
  bh=BP56CFjImxVYfEC9LwpXFaWmSJV68MwG5FrWK6Mt57g=;
  b=iPeMnJ6fjb/Hs/WCkHl6lTjqb9TQM9xBSrn/cHDOZ5rkKsbfOwLDnO3v
   1emc8JA5OSlCLoFUVgEByuM9yQNmgJYb27kKOyggHQYJoNyUMI7pFhwtL
   oaGYpvMP6gnaBiRLwIFDZP9827uDBHqGXRSFyelOvYkegMt717y4HVkwp
   At9KPKxjg9btglQ84b3KbemN52o3eNma7ER0HeylqM7baUCFcAK57fnfE
   J5a3luyr6N3QLZrF9QaelNNDZ6lxecYFCbpLcZK9LBxJVcqZPkcBpKSLr
   NmkLaHI7E/nKshMQA/c3KXbNB0TvVyRou9e6EIl+7e4OkgQeBRPp8T6zd
   g==;
X-CSE-ConnectionGUID: QCUYBMXrSb+puj5l2a+V6g==
X-CSE-MsgGUID: 7YQe4krLRxOcxi0LmsQsQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71688537"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="71688537"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 13:14:01 -0800
X-CSE-ConnectionGUID: Rl8qBsTBRmy3KagMhRiOng==
X-CSE-MsgGUID: qAubzRimStiRU31Os96Olw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="210807175"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 09 Feb 2026 13:14:00 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpYZy-000000000T7-1A7e
	for oe-kbuild@lists.linux.dev;
	Mon, 09 Feb 2026 21:13:58 +0000
Date: Mon, 09 Feb 2026 22:13:14 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:dvb-poll-bug 1/1] checkpatch: ERROR:BAD_SIGN_OFF:
 Unrecognized email address: 'syzbot'
Message-ID: <202602092246.nskEnCax-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git dvb-poll-bug
head:   2e43a19f66745fcaa3789c2eae7fa3d2a95ac639
commit: 2e43a19f66745fcaa3789c2eae7fa3d2a95ac639 [1/1] media: dvb-core: don't reinitialize dvr_buffer waitqueue on open
:::::: branch date: 35 minutes ago
:::::: commit date: 35 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260209/202602092246.nskEnCax-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'syzbot'
#54: 
Reported-by: syzbot

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
