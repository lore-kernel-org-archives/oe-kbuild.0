Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E26F36B048
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Mar 2026 13:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772630977; cv=none; b=MsDhbN1gcHSDsoRJ6qi/R1D9xRoyhFznuE0PxQzEMJpPGuOYETMsGGmkBzlh0UyU+/o8RPzJRoVbYfZze5NbEjL/6YJuoicnGAm4wUePUwveAVA0xVXP/FzQlrlKIoCa4a4yeuA9j3k8ATgWt+3qHiEITwokK7AVPcXZZuvgygg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772630977; c=relaxed/simple;
	bh=cHeLQrtMchD0I7wXAJCIx88NlCz92GLvcHipLmp3DXo=;
	h=Date:From:To:Subject:Message-ID; b=mwi45fnvZYQBi38IC/c9zVkBi/wO+5bZeYGC29fGaMG6NIJt4gD0OE6ZCzBZzSIgBuIr0aXgWh6novoUyUjTIPeNIY3z/ytvHGbh+LRrspgwxSXpyxTMF0QuLeDcma+lxxopPKRrQQWLL7Cx38WnpJE8NWpZ9mJ+ej6U3naAVMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PAde9BqN; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PAde9BqN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772630975; x=1804166975;
  h=date:from:to:subject:message-id;
  bh=cHeLQrtMchD0I7wXAJCIx88NlCz92GLvcHipLmp3DXo=;
  b=PAde9BqNZ8lcuQCt4dC0LPkfa9FEuVVo0JQn3QJA8QAPKGal9gB0eLEn
   /vtNM8Uyc1CVdcy8Z0ogtN+CCiKygB1nWb03MYv+2AmPoCS25dCVSo9gO
   ccQVcn03XYIKrvc7RvMr/aikfoUAnAGATELk81kuAaJsQXkS/uaA+A8bN
   nul9bYNY2WRCp/sc3LBmRLKRNep0DpXZ1JeZigYHo5CL3Z+Nl/IUXUwIJ
   wzWtv8MUfbnV7V9/Q1obWC6z4TKWF7aBpFVxqQvL8cLwBtQ9dHWKYIwYZ
   JT1oA/XSly28mhkX19wK5tCZ1TzQQl41Lrv1FlIfPRJNqYIYvpt2smxQG
   w==;
X-CSE-ConnectionGUID: enVyCi3ATGWk3AcpGGDteQ==
X-CSE-MsgGUID: uwm4h6XzRcaOSsLGIpiRgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73816015"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="73816015"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 05:29:30 -0800
X-CSE-ConnectionGUID: TDs/D838RCWeghpNKktkeg==
X-CSE-MsgGUID: 4pPghYZvQWWzenygerVD/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="216653451"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 04 Mar 2026 05:29:29 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxmI3-000000001hy-2509
	for oe-kbuild@lists.linux.dev;
	Wed, 04 Mar 2026 13:29:27 +0000
Date: Wed, 04 Mar 2026 14:28:55 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sashal:dedup-lsb128 9/11] checkpatch: ERROR:BAD_SIGN_OFF:
 Unrecognized email address: 'Claude:claude-opus-4-6'
Message-ID: <202603041425.MJJJ2OmX-lkp@intel.com>
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
TO: Sasha Levin <sashal@kernel.org>

Hi Sasha,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git dedup-lsb128
head:   925cdd8d45fb4adec025cfe8e42abfa0dafa9a46
commit: 49a870c0b23878295efb5caab7d83371a13111e2 [9/11] sh: dwarf: use shared leb128.h for DWARF LEB128 decoding
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260304/202603041425.MJJJ2OmX-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude:claude-opus-4-6'
#19: 
Assisted-by: Claude:claude-opus-4-6

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
