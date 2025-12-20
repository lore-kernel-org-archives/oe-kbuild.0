Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984602DC770
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Dec 2025 01:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766195557; cv=none; b=jeIiqJx8lsZsNLk3uY+fEqzQhiysfoLUy+9XCU1sIvel3lzBquwInPAdoZBaxlKNyLFplTn0mNp4z+c3iu4PTFHMMk4IplYfo5mvgKHdxtHh/9a8AabpLSmjBbsGbNo+sVj/rdnEjdnPqwEExMwzOCRUuB4mz3tr1FBujrZKvyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766195557; c=relaxed/simple;
	bh=nRb5BC9DzVJEB+nFf4i3V8l1pbjmQBcVChv65zJnTI0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DGBJ44URN+MEIy6sPlAfv0KqoXF+7EqV7wBasbaicdxS17i8duBX3G1KLlM2zT02lP+PwnafXtNbyJujGY/wGfuiYP7YfdhmfccJHwtssy4fBSLDHOO80lf2zzicVJtBIZjuOEurInMixVZcKjR/wNfz+DgXgS66Dy92Qe+fbEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CZ3s/v4b; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CZ3s/v4b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766195556; x=1797731556;
  h=date:from:to:subject:message-id:mime-version;
  bh=nRb5BC9DzVJEB+nFf4i3V8l1pbjmQBcVChv65zJnTI0=;
  b=CZ3s/v4bcZgKcjrw351fy9uPaQQq0dxQ+/14vFEhgN/RZMbx0HbQJ6rw
   //x2zIwuBsBgaTknfcd2a5Ye3gUR2jg4KHG/N1FyAhXhvW7qFh19s3/JH
   +3u9wXvNBMjHQuuCLeoDuy7Y8GHhs93eKxtno1d5bCWc2dkfZ36owjT7j
   T/nmI4DcQbKy0DFUm0bRe+jh8ZQ/SIrUzJNFiLJpo9dO8uerMWfbYsVxk
   Hqt92dhQxD0aGUEvJaokRlOyXqwAwnJgqUMDnV1FSoIx6v+M4g90r7cYe
   Z6F0HoKuLFDo/AcidtKps0tNnJpA/XEfVEhbbCrc7LDVgV8lOcksgQn/n
   Q==;
X-CSE-ConnectionGUID: CxCDK1okTAe6GpI69zVYQg==
X-CSE-MsgGUID: Zeg1QQtvRz6SZkLl1aeZvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="71788860"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="71788860"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 17:52:33 -0800
X-CSE-ConnectionGUID: fmryTpaFRNODEqehCUpFjg==
X-CSE-MsgGUID: eyGsPV9IStCe8UrwQSUDJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="198593188"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 19 Dec 2025 17:52:31 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWm8z-000000004RG-0eUS
	for oe-kbuild@lists.linux.dev;
	Sat, 20 Dec 2025 01:52:29 +0000
Date: Sat, 20 Dec 2025 02:52:06 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arm-platforms:kvm-arm64/gicv5-full 40/82] checkpatch:
 WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
Message-ID: <202512200240.nU0bDzA6-lkp@intel.com>
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
commit: 4db0a40af6b89ed7b05cd45c7e8ba230190eefca [40/82] irqchip/gic-v5: Extract virt caps and add IF for KVM
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251220/202512200240.nU0bDzA6-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#61: FILE: drivers/irqchip/irq-gic-v5-irs.c:392:
+	istmd = !!FIELD_GET(GICV5_IRS_IDR2_ISTMD, idr);;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
