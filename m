Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999F213FEE
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Jan 2026 02:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767667305; cv=none; b=lkgkCG//XV6A4G0PH03RU5VGfH9qGG9rtABuutIYSdWBHWdf5KBwgfNTd/s7ls9rJHr44UvFWRUg55ZTwyelYa1FTIaQaVR044oBB1/WHGXYfsbNVODXfPUaZOglnejtKqQuf0J6JJWDJP5KryU28nLbQtM8oEznEbaowyeZF3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767667305; c=relaxed/simple;
	bh=uvk6h8J+oKlM2Y104jGY8Pz/vA/aybg+LyiyU5oJKZQ=;
	h=Date:From:To:Subject:Message-ID; b=pEbikWosf8nX6sBfRE08dpJKy18HXhxg3jc5mk8PacVKMWwE5Dg1XxQvRT/s2SUNNp/zDHG6qIKpDLr5lRU3s2noSgXUmsX12cQUPU+zTXbPb7M+QICKVwvfI5F+YRc5+F/sYIT766E0uypn/cGQGcUK8mKiCcPGSMRYaFl9RHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ps7Zvnxd; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ps7Zvnxd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767667304; x=1799203304;
  h=date:from:to:subject:message-id;
  bh=uvk6h8J+oKlM2Y104jGY8Pz/vA/aybg+LyiyU5oJKZQ=;
  b=Ps7ZvnxdcBcQybP+k9tFrstdA++lOw2IyDO7DXG5yPworE/Rae7wxk77
   9Ei9y5xiDiBclt1DnSkjLRQGWRxkfcHsoe8JsZDPBr+jIn5lRC1lZM1pA
   Txl6h/uGCV0FjIQkXFbnHkdkysT9Gs450NqNoek85+1g45IHoMo5Lj/ha
   735H0A1607uS5BdsCBGNE949hzRTozLczhni0HbSSEgOEAPY6HaFt3zkV
   Jkc7W/zGpa8Tgh11JSzQhAvWSLh43tHwEuRVdwm5JVCW2jxQCyBdxvCwa
   vjuYbOZZAWIEKBX+pR562Tq1Al066jMZU8LOhtoXQ1TfYJNBx00nETR9G
   A==;
X-CSE-ConnectionGUID: iBnyxbLNQSWwk5DwSqCRZA==
X-CSE-MsgGUID: 4E+0R31VTDmnG/cmrtNiSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="86623751"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="86623751"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 18:41:43 -0800
X-CSE-ConnectionGUID: UTNHBIb8T3OJipZuhr13wQ==
X-CSE-MsgGUID: 9AESNo+TTRaLP29vRS9Bvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="202438497"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 05 Jan 2026 18:41:42 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcx0u-000000001En-1jhs
	for oe-kbuild@lists.linux.dev;
	Tue, 06 Jan 2026 02:41:40 +0000
Date: Tue, 06 Jan 2026 03:41:28 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [cxl:fixes 2/2] checkpatch: WARNING:BAD_SIGN_OFF: Unexpected
 content after email: 'Dave Jiang <dave.jiang@intel.com>> ---', should be:
 'Dave Jiang <dave.jiang@intel.com> (---)'
Message-ID: <202601060302.5zVw755J-lkp@intel.com>
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
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git fixes
head:   88c72bab77aaf389beccf762e112828253ca0564
commit: 88c72bab77aaf389beccf762e112828253ca0564 [2/2] cxl/region: fix format string for resource_size_t
:::::: branch date: 89 minutes ago
:::::: commit date: 89 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260106/202601060302.5zVw755J-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Dave Jiang <dave.jiang@intel.com>> ---', should be: 'Dave Jiang <dave.jiang@intel.com> (---)'
#12: 
Reviewed-by: Dave Jiang <dave.jiang@intel.com>> ---

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
