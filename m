Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98EA2836B1
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Nov 2025 11:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762516106; cv=none; b=Fc5AH+16h3qO8ABoJIlC/TQz8N+8HhWptt3DjpstJuqMBAfRpqtay41KA/p3gdz0y0sdckGpt53J4hPEzUZuo6KaACWxqeKW13HmOHC2KTeqmd1aZhLcA7iKzdFUzNGQ7B5Vyb2t6Bgtgi49BtF61oiKIVqYh0+tKIj1kVCIR9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762516106; c=relaxed/simple;
	bh=h+tugcWAoUYkNSMvF/xA7tyAtEFM89zHE991trIbiYA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lqkirt3xD9JPrWxe5+6x8Rh39ojpJn8fkcGiv+kD8Brn5gRoGtKMqhNwjxg+ZfAT3kXoc7yYMO2g5ThZPtypIdQKDFaYJq5kEkcyqZzGc8Hda5XV2dkXr6J+DrvG+YyaS/ErNThH3a+2XTY52eZym0pKVQ4oHC4n7usmAN0z5h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UMkqiLk3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UMkqiLk3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762516104; x=1794052104;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=h+tugcWAoUYkNSMvF/xA7tyAtEFM89zHE991trIbiYA=;
  b=UMkqiLk3m/ne7Ix9vWqbOJ9pVa7paMAW1Ap/bR6X9Q4CTP5UmP7srXA2
   xZ9aYSPb2OD+gr5xj54NM5jmbo7Zdo2+rAu+yW/lBrCkqbBWWGwNMeb8p
   ItiYfOsKyA23MlIJwEDuc4CGJf3MOna2tHX+Al3CyKJZ/yVJ74eafRNAf
   cIt+vJ2bKeADs+9pus3Kxrqc+0PdpX1wBo57syYxklM+EbBq/T6cDuFuh
   zck12A9OTftCT9z4O9xMw9AjV9y3qb7MtIlgg/ekEpu1aK6gJLmXq5Wbc
   UryyzGd1MUjsn6Wom5ADeclEwMTjl+dk99je8Hp6FVKkSA2XfbRea1w48
   Q==;
X-CSE-ConnectionGUID: pkEyfndPQpqSJDMJgjoAPQ==
X-CSE-MsgGUID: NkO1zS8MStC4u3qSzzDngg==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="64705585"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="64705585"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 03:48:23 -0800
X-CSE-ConnectionGUID: uZo2P03fTXKYbZq+q2I6sg==
X-CSE-MsgGUID: CPr+rAMHQ5u9zlPEACvZWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="188284800"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 07 Nov 2025 03:48:21 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vHKx1-000000003MQ-2tuS
	for oe-kbuild@lists.linux.dev;
	Fri, 07 Nov 2025 11:48:19 +0000
Date: Fri, 7 Nov 2025 12:47:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jimc:dd-cached-prefix 34/36] checkpatch: WARNING: Missing a blank
 line after declarations
Message-ID: <202511071246.44x4j3S2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jim Cromie <jim.cromie@gmail.com>
TO: "Łukasz Bartosik" <ukaszb@chromium.org>

tree:   https://github.com/jimc/linux.git dd-cached-prefix
head:   8da7f6a9ed4c22f80e9356926b91fc43bbd6901c
commit: f187017bcc40988d746c2d4cffc889aaf38976b5 [34/36] dyndbg: cache the dynamic prefixes per callsite
reproduce: (https://download.01.org/0day-ci/archive/20251107/202511071246.44x4j3S2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511071246.44x4j3S2-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:LINE_SPACING: Missing a blank line after declarations
#216: FILE: lib/dynamic_debug.c:921:
+	char *cpy = krealloc(prefix, len + 1, GFP_KERNEL);
+	if (!cpy) {

WARNING:NEEDLESS_IF: kfree(NULL) is safe and this check is probably not required
#249: FILE: lib/dynamic_debug.c:1571:
+	if (prefix) {
+		kfree(prefix);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
