Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3499483823
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Sep 2026 15:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401386; cv=none; b=qANm9dflfO3p4eJv2IA69geQ43LMtYLP6kQTKE3+yDRt+cmUDepCrtXTl9/9tRAaMLy1w5WsyLzbC6SqXOIU4so/6ERTr8P0e10Rvkuma8W0iVGaxWrcnrmEinoNm1BGmf2GoB7osrkJOD4yRmJ/b6tqpKMx7OR+A7I/t756a08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401386; c=relaxed/simple;
	bh=n1LVxC5hvnznhfqye+VclzTSt/ajmKofRtpcqbQLHjs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e+yW2fVRUMLGfM3i5mubjQWnJsofpjQ5ORCYnclpWqRFpb5SqV6PIUXjjMoMxsEjgvqJYEcSVwBwqTqimhygrX+LQVpPCuGWia1ZeNEyx8N4wbI9gY/rXqSaok9dfTyLLk82ONdtimxjW7d1YWvATc2r0mZUqcvgwR+He2cOHkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TzeA4NAj; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TzeA4NAj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789401385; x=1820937385;
  h=date:from:to:cc:subject:message-id;
  bh=n1LVxC5hvnznhfqye+VclzTSt/ajmKofRtpcqbQLHjs=;
  b=TzeA4NAj2HpvoC43f+WKNGlrWRMrkMkTYb9Hr/SpSLjfnHgBpVTsWCMM
   liCOnz1z6J02iYdPN7XiMSrNoich51CK3Tnl5ku3Yl5Y7q3xyDF+yscS+
   m0/Sq6YzoIfFlgwWZKvRhTy5HLxAElSdtsS4eDvk9xQPjAFVmEzr39twO
   HSZmcIJPjV7xbd5bNG1Y2cXHd8cuo/DwVfWD9E4ytzwj7zRpSgo+Kfme+
   rVhHjvOPANUNlgYeYznLGyN/j77mQJA4HmT/2DMctcj1FobrfNcyuV+Vv
   xxR+tOjXTpv1TuTl1W1jucIUNpmdyVexWTSlexQJHN2lzWI2fmlNpPMgi
   g==;
X-CSE-ConnectionGUID: 6Jax6mrfTuiOaSswWja8UQ==
X-CSE-MsgGUID: ehTihxakQDiV9G2opPaLFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89519427"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89519427"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 08:56:24 -0700
X-CSE-ConnectionGUID: 0KvGEqMJSEeaoj4F6ajTrQ==
X-CSE-MsgGUID: Wc0feK9RRriM22kAVJfdVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="276822521"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 14 Sep 2026 08:56:24 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x692b-000000000DL-2fdd;
	Mon, 14 Sep 2026 15:56:21 +0000
Date: Mon, 14 Sep 2026 17:55:26 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-unstable 385/435] mm/madvise.o: warning:
 objtool: madvise_collapse+0x60: unreachable instruction
Message-ID: <202609141730.imtt0xtM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: David Hildenbrand <david@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: mm-commits@vger.kernel.org
TO: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   6b41451631cabf9ea3b384c2a099088e1598f963
commit: eac44fd55ff6783ef0f7abf4c3b5341dc40ed26d [385/435] mm/collapse: implement MADV_COLLAPSE in madvise.c
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: loongarch-randconfig-r063-20260914 (https://download.01.org/0day-ci/archive/20260914/202609141730.imtt0xtM-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260914/202609141730.imtt0xtM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609141730.imtt0xtM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/madvise.o: warning: objtool: madvise_collapse+0x60: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
