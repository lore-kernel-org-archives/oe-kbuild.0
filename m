Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18467E0FF
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Jan 2026 21:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767733251; cv=none; b=K6D7PrdVJcKl/npx+3qCAilIKu0t05h2QaUpxe/1HkN7hgCspth2gG3NllKLynZLQ/nxCGuYw3BNDPrP5g0I+w7Th6f0grhbVEcMcj9Fp0ADVXhdbJx3gem277XcIF6LLbWz10xtWWlk95EQS6OYtal3a6xKBFAvCd8ku01LXFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767733251; c=relaxed/simple;
	bh=GVAk2dyp3Af7KEryByycVdCSU4g/RSXH0yzUhqj2CJo=;
	h=Date:From:To:Subject:Message-ID; b=BYYzy2F/lapgV9BxH9AtweHJUMYhZevDl1ccRZAR/VqYvfh47xNDn8d0aN3gThrYHL/9dI+utdsndQZ6n7ZO0mtbU5iiYyGhHU0C1iY/iDQ6lbgRo34WH+KtvORYU3hELL2o5PE3OFAPuZDU5sGpWb4Dlxxhor0nKxoU5cbGzc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kKJRi6jX; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kKJRi6jX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767733250; x=1799269250;
  h=date:from:to:subject:message-id;
  bh=GVAk2dyp3Af7KEryByycVdCSU4g/RSXH0yzUhqj2CJo=;
  b=kKJRi6jXQbvm9C8VCPkegs5ccLP7i2/Pd40jtQdUO9X5KmkP2ok/eZeo
   zSD2OdBft2C0xkNNZrlYHbTMbIDnKHM9zokf1AI3cweSua8cSllTRkw+z
   h8ri7Kz2A9W1KCB3o5VSYl1eBwCPOotGfsQqRl6t63tLI2nAlF4Z51rRR
   eBo9dVabfSj/Yh1UK2Okc1gvhWr5xNdrrsIRljGL2PJyv6yGvHcbSUy0D
   6H2qgvTZuZhipFSfu+NxhT3MLp0g7du6pDdbFY5+vpn9gmnjTGcZGEeGv
   7ftHG4Wzkp8xSZeitD/NGkBF9RBzYWUYsXin5EZfcK165RC011o6yHB5M
   w==;
X-CSE-ConnectionGUID: 09SEFrbTROq1wgUvxEXGow==
X-CSE-MsgGUID: Bl1g87Q3TfK2kfOSTb4ojw==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69150587"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="69150587"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 13:00:49 -0800
X-CSE-ConnectionGUID: 2oNYIRbJSQGIZFaFrzfzmA==
X-CSE-MsgGUID: KMT2o7LCSJSY0ibUKPBn/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="207811069"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 06 Jan 2026 13:00:49 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdEAY-000000001Mj-0uZN
	for oe-kbuild@lists.linux.dev;
	Tue, 06 Jan 2026 21:00:46 +0000
Date: Tue, 06 Jan 2026 22:00:22 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [cilium:pr/netkit-iouring8 4/13] checkpatch:
 WARNING:BAD_SIGN_OFF: Co-developed-by: should not be used to attribute
 nominal patch author 'Daniel Borkmann <daniel@iogearbox.net>'
Message-ID: <202601062155.eRlo1Bn8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Daniel Borkmann <daniel@iogearbox.net>

tree:   https://github.com/cilium/linux.git pr/netkit-iouring8
head:   5f26bd213fae9a23f5f8ed04672b1f5e33d3456e
commit: 39f187374634e7899e277c6d429f5961dfe00d5e [4/13] net: Add peer info to queue-get response
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260106/202601062155.eRlo1Bn8-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Co-developed-by: should not be used to attribute nominal patch author 'Daniel Borkmann <daniel@iogearbox.net>'
#65: 
Co-developed-by: Daniel Borkmann <daniel@iogearbox.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
