Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678852B9B7
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 00:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764202955; cv=none; b=uYq+U8hbXSNQxHiE3fuxtHvZ7OpqeEz8xjO8DFbzk9Z4CaaSYXW9nbWsougR8TEUpGFRkQFVyL9Bk3Qb9ODvv5G6kk68/HoBTfSi0heBx5LcV6YBW9Uno40gWyk1ldWqMB4+yZ74x1wQFlR49+aA2gRudeR8gXmdtyuzYCQUY9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764202955; c=relaxed/simple;
	bh=M5cHKrQlax+/BX5mTYICW3XoWQOx+HKRhnt8jscMWa4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S+JykepW0xsnxrTZJbtufE61U2jZflbbSk2KN3kaNSUfBWY+83n29o1cG2AlOnoUhoDax8Fy7Sh9nF0cCmS+3hTaHUxiQS+CxwaBBJfGClbeg52Hg/IICgK2+jKGJctnCFWsf+xI6FmJ/EB/t4Fa1UJnvveTK1SND6ejBr6zYOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bGq2YrEb; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bGq2YrEb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764202954; x=1795738954;
  h=date:from:to:subject:message-id:mime-version;
  bh=M5cHKrQlax+/BX5mTYICW3XoWQOx+HKRhnt8jscMWa4=;
  b=bGq2YrEb6fylMMlczt/DAMIiWEhJrVprsNrCDXv2VuH9p+Cv10RGdYld
   J8WOFMA9KCWX9F0ehcvIVL0OclbS2Q6zBobO+rK6wIK0J3EIZzSEHk4nE
   Xz/GDhAeJwRyC7DNEIH9S2vA1PeiBanoiIZefGPHBKToreJtk4oHAGtpi
   ZMXilaWKYGq3LusuTallV8qHFrPL6ZxZg8jbY9OkjJTzl4dn4LpneafFS
   cXz0geIo2CxVfXfZgivK7BDCHBt2aAeBuQF9MWSY9KJPi6U4qvTDaTD/W
   a4HrZ9wLUOeWLqK95IBTW0Z91ZBIhw9PBqWzEtHq/umqxNAJMYrOCRcta
   g==;
X-CSE-ConnectionGUID: ZEScoup+TR6Rd0yRXxPfFg==
X-CSE-MsgGUID: aFYSb1uWRkCEg5QQZZIOgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66195676"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="66195676"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 16:22:33 -0800
X-CSE-ConnectionGUID: Ung101CGTD+dcnZId3q3Ng==
X-CSE-MsgGUID: uCqwZxVrRJWNXmn4FeaMdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="230359642"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 26 Nov 2025 16:22:32 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOPmH-000000001Yv-38gr
	for oe-kbuild@lists.linux.dev;
	Thu, 27 Nov 2025 00:22:29 +0000
Date: Thu, 27 Nov 2025 01:22:17 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [brauner-vfs:vfs-6.19.fd_prepare 2/3] checkpatch:
 WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
Message-ID: <202511270152.InV0LMRZ-lkp@intel.com>
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
TO: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs-6.19.fd_prepare
head:   138027e74e9f602e3bb91112dd38840c7a5007e4
commit: ea2f85c54e81501a25b09e1eaf63f94adf77f591 [2/3] ipc: preserve original file opening pattern
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251127/202511270152.InV0LMRZ-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#52: FILE: ipc/mqueue.c:920:
+	struct filename *name __free(putname) = NULL;;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
