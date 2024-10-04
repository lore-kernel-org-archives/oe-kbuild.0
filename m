Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E624517758
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Oct 2024 09:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728033194; cv=none; b=ZxCBV5HoPNSDUgff2g7DyRoh5LaJ8diyu4pcGG6AjUn69LN40itThUPXmv3U91GV7FTQvCUdiQyDHgeO9geSBLodCvyBxX0LuNCduD+Y6rJ1U5MTDYFqOU67VTfH13ZfWg89vyVXpe9CUqBB/r0vHoJ4TTBQPKhFYaGa1cqdMYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728033194; c=relaxed/simple;
	bh=Z3J1F7rH0EmXHxvSN06YfLcXSb4x4HBbMOOv9UGvRG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YvX7b7roL1a35M2rfH2otLIoQdyPyQovfDcN/JoKrJLuH0oUSzHgsgXDBzrrC90xf8Y+3kBRWjF0lAb0nb73Gjndjpd2p8cwD+YarBjClp9pNLoOQ1fWgkqQB1Kf+8gbcO3Tfal7TKf5Kbt0YzP7GgDQvSLEsU+G2npjCu8/qTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ipQ567Cz; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ipQ567Cz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728033192; x=1759569192;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z3J1F7rH0EmXHxvSN06YfLcXSb4x4HBbMOOv9UGvRG4=;
  b=ipQ567Cz+QJGfgfkSErA3lxb4pJ4BphMlnJRZ1IpRrBJpfrkaJfngwXJ
   e6qA9Q7LstfOBeXKI7nZ2MK/V4pFhfg01yO/pm/UxvZW4RDs5ZpctiPw6
   UPDo4KjoVWIJld2oytjJr0UuYwEKJ2m7jdoKdn9a6UyneMb/d6I52FZU8
   m7e07E18vRMzlF2brbtNNtgL/mLZ2xTwxBW/mTpDj+IdwH9+cXNGs4bFD
   EoTlfqgDhFFERzGwjsMyu1nH/ZXSvoLOtdOFlWXnYLwuqh7+r9ifx3VbJ
   Gc46v8s4odSYCHRf8oA6upOsJOiD7GO/62WQhsw78DTCnECUfvVzWyH31
   A==;
X-CSE-ConnectionGUID: eGa/YqXGRQOrDPcO2jpsdA==
X-CSE-MsgGUID: Zf/rLMSuQ62hYihwNTAO1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27194782"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="27194782"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:13:12 -0700
X-CSE-ConnectionGUID: UXZVQpsxT0OfcOZP19kxNQ==
X-CSE-MsgGUID: ol1Z18faT0WAGrDvqzT9Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="79207849"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Oct 2024 02:13:10 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sweN2-0001PK-0S;
	Fri, 04 Oct 2024 09:13:08 +0000
Date: Fri, 4 Oct 2024 17:12:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/seccomp.o: warning: objtool: seccomp_sync_threads+0x50:
 unreachable instruction
Message-ID: <202410041745.GyngLq3h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Andrei Vagin <avagin@google.com>
CC: Kees Cook <kees@kernel.org>
CC: Oleg Nesterov <oleg@redhat.com>
CC: Tycho Andersen <tandersen@netflix.com>

Hi Andrei,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0c559323bbaabee7346c12e74b497e283aaafef5
commit: bfafe5efa9754ebc991750da0bcca2a6694f3ed3 seccomp: release task filters when the task exits
date:   3 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 3 months ago
config: loongarch-randconfig-001-20240804 (https://download.01.org/0day-ci/archive/20241004/202410041745.GyngLq3h-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410041745.GyngLq3h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410041745.GyngLq3h-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/seccomp.o: warning: objtool: seccomp_sync_threads+0x50: unreachable instruction
   kernel/seccomp.o: warning: objtool: seccomp_attach_filter+0x5c: unreachable instruction


objdump-func vmlinux.o seccomp_sync_threads:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
