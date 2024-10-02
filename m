Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3751D0DC4
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Oct 2024 15:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727883983; cv=none; b=YdBgDddmyYkDL0gvPPadh9hwnsPoRcOiBoY6xScwoWKIcf7ktX2RKwzZxrBch5GnIUyoHmsZRA1t2ifJjfp75FvnSYvMWtLEu2299wp8DJjiic9WSGt+dMvvig8ZGX4e89uzNAf1E2VrjcvQxbN7e5LLBMV7Ls7jWngX5RT20pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727883983; c=relaxed/simple;
	bh=jW2Fe4bNjyw5TxCT1cHticIIejCFyWhlHcO1Zajrkl4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bSniXYtwiW5JBmvMW7ggcZmhUIDeSyy+MCXnkchXnbkyY5yYxaGwpMYQvbiZBCJL1pcNJHFwzkGrtX6H0lmZgvmC5TtqSEobEUX/qV8FkeFLOpbj57ggmAAPZevxiQo9HVM9vBt6/ORsOcndWPi9wsw7MvJGv3ynAM2q3+Trcws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aFJebzpf; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aFJebzpf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727883981; x=1759419981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jW2Fe4bNjyw5TxCT1cHticIIejCFyWhlHcO1Zajrkl4=;
  b=aFJebzpf2qDMb5NhPaNDhgTyMb6jbVeW8tZXf6Y8fkNJMFl4cOi4mZOL
   +2KcLXZwbSGgNbmlw504+a/Ll/ahETfURI8+bbs6+X1kezqE/0zsM54Yp
   u5yqSVmJ5ehClWH++qTsg9XBy09UQGx2wZ4CMXPAoRiRU4DFhcz62wIMX
   PGCqMqgd7U9wDLgwOGpjsAkXOn1X14X2J/GCbK0jXV04gPlUxjG8xCXp1
   BcyBVS8p4cu1QOgAlIqHYcSjYMAQ8PephawJr2/cO2RQGUdO6BqLEdACJ
   sRj6XQuTxowhgS/WMdGFeIn73sTtp2tZ4I166NJPS+l2+KtTl+bYE0Ems
   w==;
X-CSE-ConnectionGUID: 1ENyzUj7TJ2nwjzc55/XUg==
X-CSE-MsgGUID: HHcWJ4ShTda7kMQbCDYnhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="49578268"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="49578268"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 08:46:20 -0700
X-CSE-ConnectionGUID: pnG/A92kQXeO75RrdRG/tg==
X-CSE-MsgGUID: d3RbbAUCSICO0HO4ag27eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="74281132"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 Oct 2024 08:46:19 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sw1YP-000UAl-0Y;
	Wed, 02 Oct 2024 15:46:17 +0000
Date: Wed, 2 Oct 2024 23:45:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] md: Testing new CI system - do not review
Message-ID: <202410022313.2ElZYApq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only Makefile file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241001225349.9161-1-paulluselinux@gmail.com>
References: <20241001225349.9161-1-paulluselinux@gmail.com>
TO: Paul Luse <paulluselinux@gmail.com>
TO: linux-raid@vger.kernel.org
CC: paul.e.luse@intel.com
CC: Paul Luse <paulluselinux@gmail.com>

Hi Paul,

kernel test robot noticed the following build errors:

[auto build test ERROR on masahiroy-kbuild/for-next]
[also build test ERROR on masahiroy-kbuild/fixes song-md/md-next linus/master v6.12-rc1 next-20241002]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Luse/md-Testing-new-CI-system-do-not-review/20241002-065554
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
patch link:    https://lore.kernel.org/r/20241001225349.9161-1-paulluselinux%40gmail.com
patch subject: [PATCH] md: Testing new CI system - do not review
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: x86_64-rhel-8.3-rust (attached as .config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410022313.2ElZYApq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410022313.2ElZYApq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Makefile:3: *** missing separator.  Stop.
--
>> Makefile:3: *** missing separator.  Stop.
--
>> Makefile:3: *** missing separator.  Stop.


vim +3 Makefile

a27e5598af87c6 Paul Luse 2024-10-01  2  
a27e5598af87c6 Paul Luse 2024-10-01 @3  xxxxxxxxxxxxx
a27e5598af87c6 Paul Luse 2024-10-01  4  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
