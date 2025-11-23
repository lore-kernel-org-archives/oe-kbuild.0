Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637721F95C
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Nov 2025 04:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763870871; cv=none; b=fl56ZZUPzxREgCPlkiTWnwNM/NYD2nU5qSSAEuT7jA3OMrst28fKNdO5aoaOjuce7Wopm1yiUOUcjblMXkAzGFuWzHzgyn7xbOXOoK3V8RKcvnAWSKjcFa8bZgkYGeL0+y4qgUoSIob8fKrR4DJ/9O+jkyN6Iard/3t3SLcYnAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763870871; c=relaxed/simple;
	bh=v0xO63HkUo5HpSwH1uB88rAL+f0Ygac69CngL5fWOc4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rtpbBK3i4v+89k3GEmdfZk30kuuGyNY8/gZAtm773l6MwXzFGl7E1o1VHQq/k9SK802MyoY1b2znFzO6mMGLvZzTgmJX4GuFCbyFvqLpeA/KdAhZuCfKTcxIZZln9eMLjP+DJk+IbX902oOG8FJg6PTO6tedWE7LpHqaL4oe+6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JWjadqek; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JWjadqek"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763870869; x=1795406869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v0xO63HkUo5HpSwH1uB88rAL+f0Ygac69CngL5fWOc4=;
  b=JWjadqekxX1m/JvDEIS4xqxFOC8H1thSbo6/j+MEcxCAMM5y4RrMrriW
   g2of9YYTKxjJp0FKCCV68gasfXu/GoLIUvwAnIeloO6VHGBv8wk3YOAEM
   7HbaHY4lqtDcyAxRKUj0/b45QpuHj2TAXjFa88o2lRhzM6vor1Uq440gQ
   M7KMnHiKQw4iu7ktXOeKwo3BGz75+r87R/CzX6yWPX+TzTh6HBrLHUuzz
   gsvy8GP/w+3Mp3P3zsYl/gj87mID3uU+ZCtYplteebbDJzcPT4rWnHtAV
   Se1INa3gA0wVfcDJvC5MU1Nf2Jan/BtOJ297nyeSeg1HLo9D+JoxmjBXP
   w==;
X-CSE-ConnectionGUID: 28NDhZdXTmuzPXp8trisUA==
X-CSE-MsgGUID: BTFiE1Z3SuuJkZYXclo2AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="76240983"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="76240983"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 20:07:49 -0800
X-CSE-ConnectionGUID: UvWyudSiQP27aHvWCjtOiA==
X-CSE-MsgGUID: 0NYVVpPHSoSG65vLROCevQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="191212024"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Nov 2025 20:07:48 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vN1O6-000827-00;
	Sun, 23 Nov 2025 04:07:46 +0000
Date: Sun, 23 Nov 2025 12:07:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpoimboe:objtool-disas 32/36] /bin/bash: line 1:
 tools/objtool/arch/x86/lib/cpu-feature-names.c: No such file or directory
Message-ID: <202511231218.9diFdBQ1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Alexandre Chartre <alexandre.chartre@oracle.com>
CC: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-disas
head:   96068f92207e9c2a20b7b8de4809b09a23f5e96a
commit: 1ead04d189cea9f5ccd9b14c87cae01416da1c1c [32/36] objtool: Function to get the name of a CPU feature
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251123/202511231218.9diFdBQ1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511231218.9diFdBQ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511231218.9diFdBQ1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /bin/bash: line 1: tools/objtool/arch/x86/lib/cpu-feature-names.c: No such file or directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
