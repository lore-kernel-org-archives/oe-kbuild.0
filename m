Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2340629E11B
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Dec 2025 01:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766195794; cv=none; b=mqu8voWs0KtvvheKt54hNgH3ktjSUpsWMioXm5g025Zyk8iqj/wXfFMlxFh+e69TDCVdpqWSejOEHTSxoOhaTk4HDrOa6//ooL8FGQRMhRiQs9cnJ2ZiSk3CXkKtIU4eh0dfc6LVUnJjEPrahczlPo7K1PJWgG3VXWd1X8vpXVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766195794; c=relaxed/simple;
	bh=rv02esXqcdoVao9DUQdkv3HAwfg7de/KEqvTG3yN2q4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rw/I0grXB/RIqQMXV1ZT27zM8AFj7hvTMv7heBPhpfQNB42mUbOHFxS0XIAac/Q2jz1W2JQAsh3EtelSjJbCU5ZfbLXmVL302ynVeUgQC7UYxG25RN8zlIiiK0dPW3vDld/yzcYr6WwhIhDQe8P1vMO8vj4W8GK3WiQVeBV0VY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JWSAA/rC; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JWSAA/rC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766195793; x=1797731793;
  h=date:from:to:subject:message-id:mime-version;
  bh=rv02esXqcdoVao9DUQdkv3HAwfg7de/KEqvTG3yN2q4=;
  b=JWSAA/rCc+n50YM0l2DJzj+gasRxPAeBIPQX7rF3Qc9Ht6uYzvc0KZPB
   pa8rXyM3FdDqgnggrfJOpEE6ct/Mt3/IFSWQEKC4Et6OKzGEG40BeCrFH
   oQzrrJLEJ7DoB1HsY+JpScSTRAkd5p4D7eHq+QSVnJtu+t6jdE/9Bcleb
   frzOq9YOBbCdGUu4DVyYf+UVoL+FMsc5AvTKc0od2OcH8qDWlr9p6nJLr
   9ZHI+8jjPT7mpw3b4NLY7CO+hOfG+xLb93moobuYikWOQzbpC/RTLRiWa
   AwoYbo0edGRaydcYXsUCzqTtTKZspxnNcFWtIT4m9JY0MIe9/XRwgiRa7
   A==;
X-CSE-ConnectionGUID: 1hOPhF8USPqOSmKXMBiY8g==
X-CSE-MsgGUID: JGd5lLHjQ0S1avhljFVxLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="68307384"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="68307384"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 17:56:32 -0800
X-CSE-ConnectionGUID: hoJevIs3RbKi9vFYkdRODA==
X-CSE-MsgGUID: MyeninM5Tr+EP5Krha3BJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="198762604"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 19 Dec 2025 17:56:32 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWmCr-000000004SN-3ab6
	for oe-kbuild@lists.linux.dev;
	Sat, 20 Dec 2025 01:56:29 +0000
Date: Sat, 20 Dec 2025 02:56:23 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arm-platforms:kvm-arm64/gicv5-full 75/82] checkpatch:
 ERROR:SPACING: space required before the open parenthesis '('
Message-ID: <202512200210.ace4wJX4-lkp@intel.com>
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
TO: Sascha Bischoff <sascha.bischoff@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/gicv5-full
head:   1426b88096b597395df4c82f089b87c62bab45da
commit: 887ff8950ca0e485e32e6e57b2a3ed56d0ffa00a [75/82] KVM: arm64: Rework vgic-debug into a state machine
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251220/202512200210.ace4wJX4-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open parenthesis '('
#67: FILE: arch/arm64/kvm/vgic/vgic-debug.c:55:
+	switch(iter->state) {

ERROR:SPACING: space required before the open parenthesis '('
#108: FILE: arch/arm64/kvm/vgic/vgic-debug.c:91:
+	switch(iter->state) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
