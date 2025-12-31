Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5CD3A1E7E
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Dec 2025 19:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767209454; cv=none; b=eFRieHHaI0zohQVijhB5xUpAnayWjLnC+SJp7McrY+nTJn8f8FWLGpBPpwitw/lI2J+JoigxC9O3nVc7O7w5F3f3EqTYU1fF7Usizdyd+NKO4ae9i6rtn4T+uPh9NFXHjiYc8Gf+mYHu8H8wEtQnZQ48vyUQHu7In5XM33WFirM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767209454; c=relaxed/simple;
	bh=HZA0P6O9h3yCpca6QT7hF2gSoeuE7GnUCAYHCEeVXs0=;
	h=Date:From:To:Subject:Message-ID; b=BEVQ7aDgbw91OBPtLkWFqjw0FcVdAUax7YeuIaPEOLOvkiddM95dRMwMKRKlt0xdGtT46r7XTcBbkS13A741AwHttbhGMxR6qG9uQnBhmRepHya7GDgBLkRV1pYmgHouXpcTQapZ8YVGyayRdewZU56Ia9FGIR0o+DyISfVvtVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eg0xSlEL; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eg0xSlEL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767209453; x=1798745453;
  h=date:from:to:subject:message-id;
  bh=HZA0P6O9h3yCpca6QT7hF2gSoeuE7GnUCAYHCEeVXs0=;
  b=eg0xSlEL6iEA2eZlGsBXoi8sY6/Zkgq9m1hz6VFGclcj6DeeiZbhADhI
   CQTrl9q6o0/iwQBncj3HNJLFOWW2I/HL6M3IgRfpsjN8OFd1hZCJ2zpex
   WvuWRpyQY2SbxuXIPxb/CqUrykpf1MLOa434eIbgLWNaT/Rdxw0Sb9ryG
   shBOgqWScfRPbhjs/KOlilSzmrIKM9W0a6CO3rP8OPZGG9q2riItWnI0a
   +dph3roscYnzaP0tCr8JCih7KgPVqD69MmUwfZoPnHl0v1oMi9Jvwh8jF
   TPirh6EpK34+7tbVQQQ6dIcGn7BNNpcuaAMOq9tHSRD6ucqftCcgYyNE4
   Q==;
X-CSE-ConnectionGUID: qac6azS8T6SFNjzE4peePQ==
X-CSE-MsgGUID: MKM5WwnqROytJmG3TFXr+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="67780684"
X-IronPort-AV: E=Sophos;i="6.21,192,1763452800"; 
   d="scan'208";a="67780684"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 11:30:52 -0800
X-CSE-ConnectionGUID: N08au6iFSgO9Zoie/ocoyg==
X-CSE-MsgGUID: TE8+vEU9QgS8/wOOFaqQrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,192,1763452800"; 
   d="scan'208";a="201502111"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 31 Dec 2025 11:30:52 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vb1uC-0000000006F-2dly
	for oe-kbuild@lists.linux.dev;
	Wed, 31 Dec 2025 19:30:48 +0000
Date: Wed, 31 Dec 2025 20:30:45 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [litex-hub:litex-rebase 15/15] checkpatch: ERROR:SPACING:
 space required before the open parenthesis '('
Message-ID: <202512312032.FqMNN5C0-lkp@intel.com>
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
TO: Gabriel Somlo <gsomlo@gmail.com>

tree:   https://github.com/litex-hub/linux litex-rebase
head:   c113f6e19870fac49ce445bc5692f08a6e6810a7
commit: c113f6e19870fac49ce445bc5692f08a6e6810a7 [15/15] LiteX: LiteSATA block driver
:::::: branch date: 75 minutes ago
:::::: commit date: 75 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251231/202512312032.FqMNN5C0-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open parenthesis '('
#330: FILE: drivers/block/litesata.c:280:
+	for(i = 0;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
