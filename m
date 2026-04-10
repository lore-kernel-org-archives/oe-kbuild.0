Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0C729BDBB
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Apr 2026 01:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775785146; cv=none; b=Bys4R2wdQaUeO2duGRkpotT3GdnVKklR6KfjxuaYF/yNQVt1bjMdNUuc1x5mceN+AlTpnfiroJPBnQVs0QDIALZFtuGPScWL328Nl1iuOoPJdqazOIJ45m/hTDHsjrLEK+B1f2f+Aeyt5dyIbxvQwR8ixoghktKxJbXHEixrWhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775785146; c=relaxed/simple;
	bh=StG1TwNzlsKmnPQp4AJUcwaEm2CSMjIn94FKmB//x9Q=;
	h=Date:From:To:Subject:Message-ID; b=agTkrnPVrsPTi8oz6RhEr8MlmsqCbZ1T7uFTlo2MipmSjOqsef3lBgp0RC/En+FBaXSOf6AkLroRVl0TQqiTeP9n3R1g7RF3+EkBsdaSjwTeAz3GtoKiACGflgVoViRfXVoDv7tS0g8jhQDk4xKz7/vBUxlPNrfOkMsDj8QOnbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1RDbq0E; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1RDbq0E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775785145; x=1807321145;
  h=date:from:to:subject:message-id;
  bh=StG1TwNzlsKmnPQp4AJUcwaEm2CSMjIn94FKmB//x9Q=;
  b=Q1RDbq0E7gTCJBeoJru8c3vptmWjEhipQ6JsjgUT8l56mfksSMTdMk15
   AdfVQaBL5K8QZNMe9Q09PqPQm/MQrRZRs7gHkQc/Tdj08OTaTrxJMihN2
   fU6JbV6tH0hhOFxOAiSMxLTmsVuP/p7rGK4Y/VEwF3XvsvXdj2Dtfa2fg
   TEdefju/6DLgQ2zGlEw0S6TE5m84HLA+Dfz2fcjdy9ELOBl+/Cq3mcpbd
   n+jJwkK0PqX6wvcN+aRHJqkSiTPmL2YHeutqr2WWH39RZrHdWxXxo+4pO
   Pf6P596XhhDw1uV/pQH6okinuQ+FFJvtu4yrD9VFxmn3/8XOYkC7qoZ0a
   g==;
X-CSE-ConnectionGUID: D/yl/zQ8Rgq8oYvEN4Weug==
X-CSE-MsgGUID: E6EaytIKQI+6e5qTWMrgEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76922268"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="76922268"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 18:39:04 -0700
X-CSE-ConnectionGUID: oyok4dK/Qh2echt8eLSbLA==
X-CSE-MsgGUID: ZhRbkB+BSIaJucWCfHLT4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="229227971"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 09 Apr 2026 18:39:03 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wB0pp-00000000Am1-1eDm
	for oe-kbuild@lists.linux.dev;
	Fri, 10 Apr 2026 01:39:01 +0000
Date: Fri, 10 Apr 2026 03:38:01 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:for-7.1/block 84/87] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202604100356.eyXUvIeZ-lkp@intel.com>
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
TO: Ming Lei <tom.leiming@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-7.1/block
head:   539fb773a3f7c07cf7fd00617f33ed4e33058d72
commit: 365ea7cc62447caac508706b429cdf031cc15a9f [84/87] ublk: allow buffer registration before device is started
:::::: branch date: 22 minutes ago
:::::: commit date: 26 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260410/202604100356.eyXUvIeZ-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#44: FILE: drivers/block/ublk_drv.c:5247:
+ * already holds ub->mutex when calling del_gendisk() which freezes the queue.
+*/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
