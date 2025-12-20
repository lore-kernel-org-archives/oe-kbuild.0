Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A0E2DC35F
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Dec 2025 01:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766195674; cv=none; b=qvObxpjn+N6Eznp8M8TZjCW/CwLJH2bkVLfhN6IoFrbd0xYiKODxQ7qhwb7PeAbMvzYh63+rBzX6B/3Y4a7hvfUhPRb5mz/vAS+YTG9GhepTUxRWRkfK34proe7EfozKNd4rethDB5CsaTPwdtymx3wSe2eJf9h3TONzoSWIo7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766195674; c=relaxed/simple;
	bh=aXQMGdOYZ7JyIKGmMsNaPl/dCo7PA7odTBP2POpMz+g=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DvwKvtnPeXS+aAOKICDowjvt/8rF8wuPf+Gq1ttI85CMo1ENvJfvsDS6dhFcQbiHQlPcN19qB5kB2KpZI8ba2OHtvXeXTJLkX2sfyv77R3mPykEJzAFnOavPmPfXX1GevZyMHl8eit4uszXAx3R17hQMHr3aEbuAxXx0Y0/LG+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n4ZqfBqp; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n4ZqfBqp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766195672; x=1797731672;
  h=date:from:to:subject:message-id:mime-version;
  bh=aXQMGdOYZ7JyIKGmMsNaPl/dCo7PA7odTBP2POpMz+g=;
  b=n4ZqfBqpDOuhs0+4V8jva67ALLrYCS2R2GSnAKvdAzLvKhgO26QklOJ0
   86saHdb0AI93Sia2sKOa9OV1PCA/I/7iKbSwANfAEtTlQJtDCp9K16PNx
   5m5G7qzm8/XzJVXXl9q7VFKrY4xP1+HqlwyCymJIQRcM9VA6eNkeoHZsu
   EEGgouRX3GRjc92UatsQLrUxYObFd7tJuAolnUmXj68ncsGblHB/yl+w5
   QPlOFPcYsRTqbZDlFkjS2MtNyEtKOzNn/IJKQ3GTeCe4mJLT4kg91VE6o
   7eDpltV5uDTgzqPUY064AYLBY3BCK+j2KY2O86h1D3Gnv4ilroDUB3myt
   A==;
X-CSE-ConnectionGUID: /RzbdkRlQTi0HR/qbx+Fyw==
X-CSE-MsgGUID: PSKlTJZ0R7q7QwKfzQpwCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="68201607"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="68201607"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 17:54:32 -0800
X-CSE-ConnectionGUID: sDwe9Nf/S8+TqW3Jrs9/1w==
X-CSE-MsgGUID: tmFi1Yb9TFivMbTDGlNjcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="199517147"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 19 Dec 2025 17:54:31 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWmAv-000000004Rs-2Aag
	for oe-kbuild@lists.linux.dev;
	Sat, 20 Dec 2025 01:54:29 +0000
Date: Sat, 20 Dec 2025 02:53:53 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arm-platforms:kvm-arm64/gicv5-full 53/82] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202512200240.KEdgivho-lkp@intel.com>
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
commit: 9a7c22c0916bb32691a0d1e727ced05e66777620 [53/82] KVM: arm64: gic-v5: Support setting the number of SPIs for vgic_v5
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251220/202512200240.KEdgivho-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#39: FILE: arch/arm64/kvm/vgic/vgic-kvm-device.c:231:
+			/*
+			* We require:

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#62: FILE: arch/arm64/kvm/vgic/vgic-kvm-device.c:243:
+			/*
+			* Either userspace has already configured NR_IRQS or

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
