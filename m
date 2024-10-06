Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E3B4C8C
	for <oe-kbuild@lists.linux.dev>; Sun,  6 Oct 2024 10:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728210075; cv=none; b=J5ALl4VcCtr0wiTY5yPyojqGkeC+BnrnglH6QJy+0HvoxwwPSn84G+H4tjjtCaxZd+iJkIhvgQw2vuDgTTNXykteuJmlE261L7Sb0q2+l80gCcvJmwUJVZs+TEtZmlTRIoGNwSZS/xvi65OaMn94lXM9DTw6Z1u9xrktrMB0CZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728210075; c=relaxed/simple;
	bh=sV6XBVjVlm/PWs7diccbWcRClXpRAxdJlPEqx7ykMkw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GZPb7Ml57Tz460P2gu3xMTdG6vVBuBcmnUqrY5lraRyTDvlAJty7kXiC0Twa1z7SSLVOBK7jSRiDFOtL5cs5d6y0xiBRB13F5xTy//K3nZm8GcngPl3Jj23HIBoCWOT9N41cvsmvrfwYobBmuKlWKy2PC/R+SZs47Wjo6nb5rg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JFaUUcEW; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JFaUUcEW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728210074; x=1759746074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sV6XBVjVlm/PWs7diccbWcRClXpRAxdJlPEqx7ykMkw=;
  b=JFaUUcEWvMIUTsexxvaBKrKNJe3vUd0TwTsqnda6H//SluBNwqXNC4+x
   Y0fob8AA+ue/1TJ5BnHUtBvhiEa6Mi4yZ8AVQeSOt3MV6R13xFgODmPdj
   Rl2gcsNS6OgKT6T1xVFJ8ZyVYdyVdCL87fipCAfl04wZ2yGHScR9R1GyJ
   4kHuY1vFgmCwWw6rzZsV/JmOPZzVJFxXb9vUlJgox5bWtWnJxPNtYwrsR
   dv4yVg1szIL02b9hRosbH2iJsB+QxwTHSMHgmwDL30CZwIPTZs90o6db8
   45Krt4Vq6h89Ak5U9pEbVdmjmYVAuUuYOcgPLHQRIvx9TsdvvwI5/9Bc2
   w==;
X-CSE-ConnectionGUID: GFFaSJMHRDCY78b7/gnGbw==
X-CSE-MsgGUID: 5n0+5DVvQKaQrrsMnpkV9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="44843577"
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="44843577"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2024 03:21:13 -0700
X-CSE-ConnectionGUID: 7U6kl12fQY6kYYgT1VY2Lw==
X-CSE-MsgGUID: Ntl/Xh2eR0q7cz3iEYGV1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="79952576"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Oct 2024 03:21:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxONx-0003me-2V;
	Sun, 06 Oct 2024 10:21:09 +0000
Date: Sun, 6 Oct 2024 18:21:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/netfs/buffered_read.o: warning: objtool:
 netfs_create_singular_buffer+0xc4: unreachable instruction
Message-ID: <202410061813.44voQGIV-lkp@intel.com>
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
TO: David Howells <dhowells@redhat.com>
CC: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f602276d3902642fdc3429b548d73c745446601
commit: ee4cdf7ba857a894ad1650d6ab77669cbbfa329e netfs: Speed up buffered reading
date:   3 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 3 weeks ago
config: loongarch-randconfig-001-20240804 (https://download.01.org/0day-ci/archive/20241006/202410061813.44voQGIV-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410061813.44voQGIV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410061813.44voQGIV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/netfs/buffered_read.o: warning: objtool: __readahead_batch.constprop.0+0x84: unreachable instruction
>> fs/netfs/buffered_read.o: warning: objtool: netfs_create_singular_buffer+0xc4: unreachable instruction
--
>> fs/netfs/read_collect.o: warning: objtool: netfs_unlock_read_folio+0x118: unreachable instruction
--
>> fs/netfs/read_pgpriv2.o: warning: objtool: netfs_pgpriv2_mark_copy_to_cache+0x6c: unreachable instruction


objdump-func vmlinux.o netfs_create_singular_buffer:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
