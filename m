Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5186263C9F
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Feb 2026 20:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771272514; cv=none; b=Y1oVZ5nOhmzRLRYlrQ2Tg9TXbVPEXrw18hc5r7EuuhVEZndTxaK689IrLgz+6fKac2/PKAe8C5qnRJvOyq0V4FuPwYjcDBpd5XqaI/iYpwdR8eLAJtB1cLVKyZzbV7GqOLhcvdJNnsj3OcPn6xDBm0yNio/URESy8utMpcoi1qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771272514; c=relaxed/simple;
	bh=Q7jUBHRhn+PIpVv2RHH8BIJDAedfp+O7Fc3HZhGOYGY=;
	h=Date:From:To:Subject:Message-ID; b=B5MTh/ESs7Js4epR1Mhk1nh+9JiYAfrBFcmGdOLIuJOvvvyn5dXrkrEbpAedkZxLLlTH9OyABfMolzlXoWWCaDu9XCFz2FSS6IIYt7iO7UkO4lZ3cjGChALuY6YV3HlBftKdYmsDchiDRBgTD0tDDFbt5a5lsDcnY3Z5UvCXMcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MXkDqKa4; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MXkDqKa4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771272513; x=1802808513;
  h=date:from:to:subject:message-id;
  bh=Q7jUBHRhn+PIpVv2RHH8BIJDAedfp+O7Fc3HZhGOYGY=;
  b=MXkDqKa4dwbGzuInfX9NGeTvBkbXb34j76n1cneGyHfC23zeMEtaV1LK
   h2fmSDi5WJA+vzWpQzf/JSnPlH4KcuJzHdZH5laDsLW2yy4GbMFfuE8y8
   yNmUjOP9ZzsckaDUmqXwptoDnLBzuhRVZ1VdMCIso7erkOFKNX0Jb32Zr
   EwfTJM2TKYERgDAX8tWAtEe20XqYizl8RhdZLpGICsbgd6J5kEg3H6Z5L
   5m35nnHMhET+hGcDkjA8h7KjGpainiPo1CmWvNx2wMslLkguT1ip2Pglo
   iG4cfTpV2LiwavjnE9mCQ22eaJktffxX4HBwj1hcGVDZX1Ajc6Qk4iFtj
   g==;
X-CSE-ConnectionGUID: 6e3NmIfdQJCTSELfz0GPcA==
X-CSE-MsgGUID: 6QsBmto1RjOdLINSWdmMfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72422265"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="72422265"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 12:08:32 -0800
X-CSE-ConnectionGUID: HVh6UylUSFGZw4g4GkBx+g==
X-CSE-MsgGUID: zy8QgrqvTzC5LXIkge2FZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="212788238"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 16 Feb 2026 12:08:31 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vs4tR-000000002Xl-0eJg
	for oe-kbuild@lists.linux.dev;
	Mon, 16 Feb 2026 20:08:29 +0000
Date: Mon, 16 Feb 2026 21:07:53 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [agd5f:drm-next 105/120] checkpatch: WARNING:ONE_SEMICOLON:
 Statements terminations use 1 semicolon
Message-ID: <202602162138.IYKNjaln-lkp@intel.com>
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
TO: Charlene Liu <Charlene.Liu@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   51961061a1714549d6ab5333c9c76e41b86b6c9c
commit: bdde3e33d8e89c91f8a6dd6c2df03d18d76b9b56 [105/120] drm/amd/display: Disable SR feature on eDP1 by default
:::::: branch date: 78 minutes ago
:::::: commit date: 84 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260216/202602162138.IYKNjaln-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#42: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c:1166:
+			link->panel_config.psr.disallow_psrsu = true;;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
