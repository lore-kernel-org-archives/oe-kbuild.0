Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3185D410D0F
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Jun 2026 16:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542731; cv=none; b=FFW10+svEPtEfh78xlJhlse8JhisOuIyH+27tJeriaecBDCuFZ4gdEt95fiMewKpCwiZEfhLWpd/ydSEpTBchjYF0BK0FCSdkJ250z0SroLrpHZK/DwCOmJ1Yv7Pmy7iAmuK6Zj9y7vLvHfS4+RuJJ1AyrhAMf00+XtgZ5q/OKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542731; c=relaxed/simple;
	bh=yQt0W6qCwml71q6M3YaUKqDTTpkzI6hu4+gUonAIul4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=m7R3B01jWkcvO2nHx3cUAUESVvW6slRgOy7QQkOGj4Rstv5nDNjloEQq9v7Xqt7iKcNkAclU5r1d8CY46I2WF1Z3wWem6wdCyLUVQGWbIxEZhTOF0qlCODbv74om9fcaHR4aToSar/C6/6SG5UIpu1yh6/HceyPIQXbvfIjN0tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KoUZzy9f; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KoUZzy9f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781542731; x=1813078731;
  h=date:from:to:cc:subject:message-id;
  bh=yQt0W6qCwml71q6M3YaUKqDTTpkzI6hu4+gUonAIul4=;
  b=KoUZzy9fFeqoyukdew5zPj2smglX6+8BmxIWKPTxRYY4CcC682i+21DJ
   XCJtlORb83OgkUdSqn+N7scHKakEu3CRHWrPEs92uqZ0wMHJ3IAFTyX+1
   cGy1nBCSVVv+rJ90g6N6zJtcpSeIZDrgwurqRGPjhgC78i6d4aIHL6elw
   1YzDPOiT8eNmOoq/q06cQfK/zkclW2wcvLyWh4pOpP13dPzx8Vyg2FeKq
   yRWlXBn28tR4YsSbs8HDm9IwA3WFoYx06huHYdeFQGcgVooR+sTJULAvF
   zETomhbaJFvGIHa6wxOWv0ifLjjizKnxCU3mHiM6KKT/UCXWDqn1xz8l3
   w==;
X-CSE-ConnectionGUID: f2/PljoqRO+ns1ZCso98Tw==
X-CSE-MsgGUID: 3jC3ohs8RNWImT5E9dCShQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82354424"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="82354424"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 09:58:50 -0700
X-CSE-ConnectionGUID: tCpfzR1aQ8OdQawU4hBOOw==
X-CSE-MsgGUID: eoyLeIc7SLeVsqG4+UJC+A==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Jun 2026 09:58:48 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZAe6-00000000S9U-1TNQ;
	Mon, 15 Jun 2026 16:58:46 +0000
Date: Tue, 16 Jun 2026 00:58:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/namei.o: warning: objtool: may_delete_dentry+0x114:
 unreachable instruction
Message-ID: <202606160050.rQ7jnjEC-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Filipe Manana <fdmanana@suse.com>
CC: Christian Brauner <brauner@kernel.org>
CC: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e0611827f3349d0a2ac121c023a6d3260dcecdb
commit: 173e937552432db9406f04eb7905541b774ac7cd fs: export may_delete() as may_delete_dentry()
date:   5 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 5 months ago
config: loongarch-randconfig-r064-20260608 (https://download.01.org/0day-ci/archive/20260616/202606160050.rQ7jnjEC-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606160050.rQ7jnjEC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 173e93755243 ("fs: export may_delete() as may_delete_dentry()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606160050.rQ7jnjEC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/namei.o: warning: objtool: try_to_unlazy+0x200: unreachable instruction
>> fs/namei.o: warning: objtool: may_delete_dentry+0x114: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
