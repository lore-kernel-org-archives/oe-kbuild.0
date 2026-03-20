Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62A123E35F
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Mar 2026 20:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774037985; cv=none; b=AdUvFYRW6AKRyJp4H3ehdBrtqXVmpAjxXgMEBT7V0C4pnjHLeMjnPjDB1s8aTs/7AAwZOKLHaw/qnlLMX86nL9medzdf5IYQCbvTqllwr/HNl1OhZy0PvuDjDui1S49NBgOus5+LX8NQWeF+5DJqor7n12RB73YL3TNQaVTDks8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774037985; c=relaxed/simple;
	bh=VBay4ktjD/+v5W5U2O23C4+1X1vZEbrepm8hK2HQfao=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MECbzWA19cbxKJnxoxRBQJcrtDPLgysb55dTxDGntAGNlldir9Y+TL1bNeL7/8P8BKsXQTSyrgczrYSvULtGIaNnyflXjnunVUxqg6t3T9rDXTiq1XP9ftB7h3yDw0vaFZhTcjymesj6ONB/FV2qlg/2eQ3wpjXSoSRYssP9tcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tya8FjfX; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tya8FjfX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774037983; x=1805573983;
  h=date:from:to:cc:subject:message-id;
  bh=VBay4ktjD/+v5W5U2O23C4+1X1vZEbrepm8hK2HQfao=;
  b=Tya8FjfXoYsTo/uZPhgWKvomu6zj9Y2wyzU/pWxqDt2KHLkfMvWOCk2B
   kc2QIYae0scoAaFQA9w5N2//Rinf7z+9gNXRInYMP4UOM6sNAlYSZJlQO
   DOq8RC/bYRzcVq+d7beKcwmb/Scz5QLezXWGytUlMet+mkz2BJKgaVs3G
   LakJBEy6uEPfDHx8cnwKCt3U7ZA6d/wNA+7PIwt8zjsiGnuAj7GuLDBVB
   q4odB0aUgUUbrCMOfVkfyBgR479xPL+j2NIweMBrowsy1vylEKBZy+xLT
   wlogyzQCtP3c1tSYc5meKH3Vq2xvcRV8yyAdPa9O5p+8MoQQTEs35mW+h
   Q==;
X-CSE-ConnectionGUID: w9qhaQtsT3ehECx/V5hJJA==
X-CSE-MsgGUID: 6dbZY0aXRmuohYOlZYUJIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="75100769"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="75100769"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 13:19:43 -0700
X-CSE-ConnectionGUID: AQK8XrvqRLabXUmDELl6nQ==
X-CSE-MsgGUID: +d94Y7e7Q7qgClpCd83XXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="228325664"
Received: from lkp-server02.sh.intel.com (HELO ef9b23065726) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 20 Mar 2026 13:19:41 -0700
Received: from kbuild by ef9b23065726 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3gJn-000000000Ax-1f6h;
	Fri, 20 Mar 2026 20:19:39 +0000
Date: Sat, 21 Mar 2026 04:05:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/mpage.o: warning: objtool: mpage_write_folio+0x444:
 unreachable instruction
Message-ID: <202603210336.5zpbn7fQ-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>
CC: Christian Brauner <brauner@kernel.org>
CC: Jan Kara <jack@suse.cz>
CC: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Hi Christoph,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c612261bedd6bbab7109f798715e449c9d20ff2f
commit: bb01e8cc10f0c5b1151a5f047289fcfa5519e351 fs: use writeback_iter directly in mpage_writepages
date:   11 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 11 months ago
config: loongarch-randconfig-r053-20260318 (https://download.01.org/0day-ci/archive/20260321/202603210336.5zpbn7fQ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603210336.5zpbn7fQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603210336.5zpbn7fQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/mpage.o: warning: objtool: mpage_write_folio+0x444: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
