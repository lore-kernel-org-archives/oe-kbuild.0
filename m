Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795343757;
	b=00J7ns2X08gSBRJSFrPLE9nNvimiNQH7bTrMcKl+bsIUebkuXoMKqQ22m7CqVKZH5g6C
	 tD7kGI0lzdC4O0YUF7TH26gXT6n/JJJtB+/7BtCn0vc9oTvYDktIaTrXwYtYx8E7Aghzz
	 Bn2Cp8kqIbiSoT/ThbxVnw9wtXnxUOzDG635NvvqHfNSn2g3tSI/UhOgJ/Js3STG+8vxM
	 6+ldC1hNG0JKy1A5ObN+Scc/Cdlnn68NNWJarwws6Mi+8R5004qTAsF/qfSZkk5+Lt4Fi
	 arok6G7XGpq65AIl7h/O/cDhPSkSPYpGoGHgKVdVivUsQ37A+ZOnyQxJxp/ltS7YLOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795343757;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=akc9OSdjNMLSzL1zVlAsBRtfhBaroMzaVW/HcG9EgHI=;
	b=pf/pl0iqj9mUGkjDDf5nG10X0E9YtkU63Shkdx1rnFQT+R6wMrIM2jMt9BGdsUB7kuvm
	 vMnkdUpvxBvHaTKsPYWMZDexvFeEe5vhYwG0U+yfyB54DlO9NTUg/jmHfyXGuKCO140ke
	 UqeJcBsiv6myfAXgWFEQuFAyvAQj/a5YAGXglHmkD+uDwY2l4MjcEuoR5+t5xgQeBNvNR
	 eJUpfREej1f22iNfpQ2pYikDc86EyDVkBd+dIO17k/AP+NOKun11dtYYfVTPqYkkhOnsD
	 Y+14hgmpqhbZp6X2qo3wfdze8kedqMAubyDM0eXuGCYWH+016fhbuZSwzNaxbVTXwSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H9b4othj;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C26606A32A
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Nov 2026 10:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7C26606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H9b4othj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795343756; x=1826879756;
  h=date:from:to:cc:subject:message-id;
  bh=MLUSh9J/j4AOcGEDkL7MC3jCpHlDdF5AaXriT1NTZo8=;
  b=H9b4othj2vDcjNWi6mLn+gRfBOiX37YmryM3UUoLWMqW4jf5OzR3KQ6A
   uOKTHmbOjIWtWYY7taitqfoA5h56ZqnDAlwMBW9oLuA3Boc69LfF/iVn4
   Tzi3XGW//W132uY1i6cs4FArx2gFxSTQF6eDd0wWEwFpaGPTLF9hdY+gU
   g+hrBIUfrOD/xELtHlPFA44qBhwgRVCrIIAiCW+DF6jpr587dOwSa5EmG
   MJe+mtnD7lOMmdLLaLQvoFPh1nhPPB7sVrZKzrKJm+fUAv6XPlss5ZnU2
   n7z/gZHrGvv7g+E06IZQ3KeTAUR5XArVjsNlGWRFWbVd5+QSljRB90T+t
   Q==;
X-CSE-ConnectionGUID: DJbcdys1QJWTyTvWXOr79Q==
X-CSE-MsgGUID: 0A06I6iHTx28L2FmjU6wZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4173815"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4173815"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 02:35:55 -0800
X-CSE-ConnectionGUID: /k6/9ImcQsKbLUozhJSxMQ==
X-CSE-MsgGUID: 8l0RQJILQZeKYb94TcOOYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="11392889"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 22 Nov 2026 02:35:55 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xV4vI-000000004Xp-0uqP;
	Sun, 22 Nov 2026 10:35:52 +0000
Date: Sun, 22 Nov 2026 11:34:58 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/alloc_tag.o: warning: objtool: allocinfo_show+0x1e4:
 unreachable instruction
Message-ID: <20261122113051.BEnVko1h-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Lorenzo Stoakes <ljs@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Suren Baghdasaryan <surenb@google.com>
CC: SeongJae Park <sj@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4843f6873f7c4835e62f2c73ba0fd538e57a2f22
commit: 3c77682d80d07e673c7e6eb04f2211688ab494c4 mm: move alloc tag to mm
date:   4 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 4 months ago
config: loongarch-randconfig-r2304-20261122 (https://download.01.org/0day-ci/archive/20261122/20261122113051.BEnVko1h-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/20261122113051.BEnVko1h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3c77682d80d0 ("mm: move alloc tag to mm")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261122113051.BEnVko1h-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/alloc_tag.o: warning: objtool: allocinfo_show+0x1e4: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
