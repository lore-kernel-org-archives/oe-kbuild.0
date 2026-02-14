Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84D324676D
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Feb 2026 04:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771042858; cv=none; b=PMIGB5sM2SC5iXp/5AhKHlvaAmUo5O3BsQDWOfziSwVG7j/guzvcX/yoZ0cvWFeHcTm1e3H4dzyiP6o6WkshuI8gNApFUS6MIlvAOGiwiMxu14NrCMncz3bAcxPOtnfoA/qBR0Ik/SfeBY7uhtCKFwGHLLzbrI4QFoB4Bg5fPPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771042858; c=relaxed/simple;
	bh=mrj7lLt6lez5lZu7QUXLGggZZ9hH1nymQObWAGFSY5w=;
	h=Date:From:To:Subject:Message-ID; b=a7hS1tKDIj78b6PklQk/4RcinQWjT61tT7ibp4BxGLGWKAIRmxgK/RwGLd6JB/YiAWQexcGeRWL35/oDRpMQ+LJ6p0l8T0WL5pNmdvuDOvNfSJpM94TMk8GOTILUH2Mvwlu1pOGmcuQXvLDnV3thIuSL64TF6ZQ6fZeQj/JtRk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iMxG32i6; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iMxG32i6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771042856; x=1802578856;
  h=date:from:to:subject:message-id;
  bh=mrj7lLt6lez5lZu7QUXLGggZZ9hH1nymQObWAGFSY5w=;
  b=iMxG32i6DOba0oUaJHYo5Py38/T/G9v4CTlDRgKgOCvd239I6U3Xj4IC
   eCJ16TnTHQrZ5Ex9q/ktvz0ljY4npSWC9QRXqjRJeM8PDgfF4MIowg7ib
   F5srdwRgm0Ws7tkm4kwkcT5IPj9YjAE4pG+m1B9Xq1QRRWeodSdM4xVLu
   2dVbmuJOqTaMNfB6EfMjE3fUalyK3j6SBXk5cr8BWBoRGYu6KwxHQNnf/
   e98xFQSgf3ESB9xLNX8Q0W6MfO7TJzlwHBXbhgDxzEQnkQcAM+5ebIV3f
   PoY3aOTwajMEkQGOgDKCmc877Xo1c4lffPFSdzacTbEm0REQQPOHiGqAm
   A==;
X-CSE-ConnectionGUID: XJOokaXUTMCxXnM4b9kF7A==
X-CSE-MsgGUID: rZH8wgorRwmyWnpu03Dvrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72214570"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="72214570"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 20:20:55 -0800
X-CSE-ConnectionGUID: 7OObbxzLQayOnL4ES5PQ3Q==
X-CSE-MsgGUID: RkIL4GCHTm+8IoLg8p8nQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="212939558"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 13 Feb 2026 20:20:55 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr79I-000000001lJ-20yB
	for oe-kbuild@lists.linux.dev;
	Sat, 14 Feb 2026 04:20:52 +0000
Date: Sat, 14 Feb 2026 05:19:58 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 389/389] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LordKitsuna (IRC)'
Message-ID: <202602140530.ET8YUy6Y-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   ebe812e1b1d429df7620135f05cd856eaff6ee89
commit: ebe812e1b1d429df7620135f05cd856eaff6ee89 [389/389] bcachefs: write dirty superblock before going rw
:::::: branch date: 36 minutes ago
:::::: commit date: 36 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260214/202602140530.ET8YUy6Y-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LordKitsuna (IRC)'
#22: 
Reported-by: LordKitsuna (IRC)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
