Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0F363B9
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Dec 2025 08:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766995265; cv=none; b=c3d9aPyOOIM9pILmgPMd17w3fG/mueQCtPQ86NcNnzVML89/HAgS5z0xJnogZvDVMu/kA8k3J4gmwJJC4tfu/0ew2cmMSC7nZhEC7zYxGAEYP4upM2TVjkO2aLBxNr8KhvG3HMyZrnwQgi6NzXKp71l786cirEE529AODQYB7xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766995265; c=relaxed/simple;
	bh=KnLxmktmvMQUY4rhNZINOaE7hOBGi/ccjAYW0GxZKa8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hi8xVRPzDxwF4sstLSToig7eA8PCMVYbdMuBb4WJt2YRLFZjef5pSHV3Lz/4UKonkzWcLU5635UDN8fo/WxTunmgTRlmuUksHiI2cGIuYW77wftfp4iCq4UKNgvMw/6jFORKMX6eO63yPlYrYniYDWQO0XNZoMHVflcU0/IOafE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cPr/PJnJ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cPr/PJnJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766995264; x=1798531264;
  h=date:from:to:subject:message-id:mime-version;
  bh=KnLxmktmvMQUY4rhNZINOaE7hOBGi/ccjAYW0GxZKa8=;
  b=cPr/PJnJcb9haewIXYvE0plq/99x2BstKHsjiUcRZ8e84hW6fv2hEc9g
   u98N6l5KkAP9jqbsJ3H+IWpVGOkIIyYil8Nl8JpNo7zQXveM42rTR69tk
   8eXVNaTd4YTDdEqm6noniyGX92WKrpmA9XSsW1qLT37L0C/hCg2kpTVUU
   1HVP7g8Ys+dknFsWVyeT56CrfLd5OAhCX/KdraA3wjXRuo7n3tTg3p5NL
   298guY+N6a95836rwBpNTQ3n8H7GiCvsJQQcZQt4AfbNUNV1JOOZFCPiv
   T6SkpkS8xtinlzO6Ug2/O7YHfsC587hwAi1QohFz89ZKzFHfHc9y65waV
   g==;
X-CSE-ConnectionGUID: N+UWMAhWTGahaJkGTjZPiA==
X-CSE-MsgGUID: zr8VqltYQsC8LfC+wk5KTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="80057972"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="80057972"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 00:01:04 -0800
X-CSE-ConnectionGUID: iUw6MrYjQ2ukJvN6p3VYPQ==
X-CSE-MsgGUID: /ZcKQnWBTj+Wq1GBcoD6CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="200085659"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 29 Dec 2025 00:01:03 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1va8BY-000000007hx-1lkn
	for oe-kbuild@lists.linux.dev;
	Mon, 29 Dec 2025 08:01:00 +0000
Date: Mon, 29 Dec 2025 09:00:28 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [linux-review:George-Guo/LoongArch-Add-SCQ-support-detection/20251229-144200
 1/4] checkpatch: WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
Message-ID: <202512290901.kkwPp00L-lkp@intel.com>
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
TO: George Guo <guodongtai@kylinos.cn>

tree:   https://github.com/intel-lab-lkp/linux/commits/George-Guo/LoongArch-Add-SCQ-support-detection/20251229-144200
head:   f9a38d5f7d263815f2c405755dd829f9abb7e22c
commit: 9ebeabd45a3932aa0a70c97e332ed6cb5c85ded4 [1/4] LoongArch: Add SCQ support detection
:::::: branch date: 77 minutes ago
:::::: commit date: 77 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251229/202512290901.kkwPp00L-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#83: FILE: arch/loongarch/kernel/proc.c:78:
+	if (cpu_has_scq)        seq_printf(m, " scq");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
