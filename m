Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC826134CF
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 13:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764248623; cv=none; b=DkxJOmqP9LVTKyJF79DtGQLk9TaAAJqYWL+ofOaAtzxEQqWlGN7lF+xt0ZG/fj2063dlIBTX9r4ZJ/qrww7fQVMHzvvOuWX3tY5n7J57pDcbwjJVVWX4uEKQtdHqEBASaWn7yo+ASupvkrgGL8yRK/UWxajSnuPEowJla9OD6DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764248623; c=relaxed/simple;
	bh=olseF5TvWj6eDqw5/SvGqFlSiNkHUEV/E3278e2J+oA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kR0VmY887YVCfbZbDqz5OBbiSP2sfCRSs6HuZmmjwwWtpLxbr3Ud+ED3kS2ahpJOZXbRA/MHvfYYcdn3l8NLmU70gPPoS3uTw1+pUCXlOArwgI+8b0HpoUIY/SZVH4u7DhqbxyxqX4/g66vMUyj7Dxx21T4MFgqoOG5iuSo66uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nNbbvdGt; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nNbbvdGt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764248621; x=1795784621;
  h=date:from:to:subject:message-id:mime-version;
  bh=olseF5TvWj6eDqw5/SvGqFlSiNkHUEV/E3278e2J+oA=;
  b=nNbbvdGtTC8kc2AOGwZrYE88+frcDV31uDiJRwYXV/6sHDSCNYwXowoj
   mDp5OvlarzQ5xKeYtze8hnOxkcGT2S/bHJT1CSddELnP0Nd38zhFyKZhs
   xsBXBuWGhTgVvbiu2Oid/AZKNfzA8yGhkK/r/9uvjJmTZSRAJ6D61WYh0
   tTnhk0nEuQhEfnngwo3OSMAQ0JGicTgkO8AXCa7U7+GnhEfFkuMRbCmVZ
   a7R8Q0/bs3YS28ZTgTx46y2MshUYCTPZOkTt5KOVa22iPUUfftd2NlRjU
   QsHjZvXjR/WdrWrj88F45wj1S/qHxp7ux7HkpNWD7HZw4Zldv9smFrpyz
   A==;
X-CSE-ConnectionGUID: 8KaZd8AeSD+njxfnW/SYbw==
X-CSE-MsgGUID: CooCK1G4T/Ca+gmDp51w8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="70156374"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="70156374"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 05:03:41 -0800
X-CSE-ConnectionGUID: Gas7N4vmSouA3ezd33D4iA==
X-CSE-MsgGUID: gSUTCsVjSimdMNXCAmxQCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="192890454"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 27 Nov 2025 05:03:40 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vObes-000000001k9-1gG1
	for oe-kbuild@lists.linux.dev;
	Thu, 27 Nov 2025 13:03:38 +0000
Date: Thu, 27 Nov 2025 14:02:58 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [conor:pinctrl 20/23] checkpatch: WARNING:SPACING: space prohibited
 between function name and open parenthesis '('
Message-ID: <202511271439.UxAEJ0WT-lkp@intel.com>
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
TO: Conor Dooley <conor+lkp@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl
head:   1e18058c8e8c6b9ff3310a9e9aa10d95e831cab9
commit: d1e55d2a3cf1957dddc465ccf29366853bfb70f1 [20/23] pinctrl: add generic functions + pins mapper
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251127/202511271439.UxAEJ0WT-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#53: FILE: drivers/pinctrl/pinconf.h:164:
+#if defined(CONFIG_GENERIC_PINCTRL_BELLS_AND_WHISTLES) && defined (CONFIG_OF)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
