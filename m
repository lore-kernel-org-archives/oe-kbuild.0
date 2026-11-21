Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795235393;
	b=aXWshAApApi88QurtL5X4khHzpwxjPnhse08WZuS6/qOaI4myQZxevPfyo+NecGrDQ6z
	 pcBlwXNlwR2rPXsk+7LPjs0FuyhpwN6hvAbr8K7/A7nrIfywNBhuyIjAWHmTEtQL5NlSy
	 No08KqRgR2iZIWzqqUa3zWuhNv310PFlbI1b5rd5hPEw0ONAZ+JwG1D8r2gsGD22pp3Lt
	 lRSgnDhraqyI3tfcQRVxBUCIBAY1Q/tlxA6og3ZQz/snCqj7eb66SD1gkYDsMaF+eM9mi
	 m7HTuaEPEXKeWgamMql17xlm9MT7w8ZcUmIBgyJW9pZwAs9cQJ4bZkWvrestaWVkgYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795235393;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=0HlYgk22KwfaP+HA8f1MdmmCIp1vegGIELNJOQ0TYTU=;
	b=sgqnAq8snCkGMNb5WLC0kukZgGa6a0Rh8InPYE1l9xIx8HIJ4Fe7pg+y2fH4VbKIymQs
	 YFparViPB0ulNM8Vna40OaCr9uZmXd1ZHHCyuo28BZkze4MLRoCCDvNowhPnw9b3oWRlw
	 PGKjFDzGmn3VpDNWxx8tm2NiZFNhf17SyP8XiNToc5+Jq8toTKz2e9jU21ODnAfLN4ecI
	 2s2QJkhSkMTGHkoPKj6h2va2BN3EEAkCW0etQ5UYpKR2i4EmJ7d2lm+8QDbDBcmiNxiA7
	 9JVQEVqXlFy4dIxht2wRCJLP3HRfXs+jen0FUBSinP4DGi9a9z9T5KHlsNUwK8EWhVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mvy+Qtxi;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2261F606A339
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 04:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2261F606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mvy+Qtxi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795235391; x=1826771391;
  h=date:from:to:cc:subject:message-id;
  bh=jlgen9R0KM3p7N9AqPv33eaLSmHw+Xkrk/cBYKizmjQ=;
  b=mvy+QtxiBD9zIFxWqww+hqu40Kjmlvin1nJn08jIPvHMO4PW2Wul20Id
   pmpIDc+6k3MhFDwIYMEogUJpR/Aul20ybfo89GRO0HiXNXCnPkoxwOpE4
   +r7StqVkdQLkWei/nyktsgOiL4c49eTTbKjn1iotVYz8OjYHDH77Tvcs/
   2VFGonsovEXYmOxlkUu1Y8T2D/0hRQ/g8ess8vAZDaSbtZ2hPNtdzQN3d
   g73g5vC+k/fQyh40yUZS6lTlhgw7QGGtOe1q3jSnLhBd5AL4GF/7IaV0M
   0VDNHy3bz73kBZUJNwIlVaac7aMTwXFOKCrfStPccC3uOWFKGBZdQt5T7
   w==;
X-CSE-ConnectionGUID: V+RhpdZ8RA2HDpCOqulLQg==
X-CSE-MsgGUID: IHzM862xStO9Mu/Qj6oO4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4004016"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4004016"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 20:29:50 -0800
X-CSE-ConnectionGUID: xLTAbeM0SMqpY/K/jdZhIw==
X-CSE-MsgGUID: Z/ea6hZ/RyWkSNlmYAyOqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="11191903"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 20 Nov 2026 20:29:50 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUcjR-000000004Eh-45S2;
	Sat, 21 Nov 2026 04:29:45 +0000
Date: Sat, 21 Nov 2026 05:29:08 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [hare-nvme:dhchap-keyring.v4 4/9] ld.lld: error: undefined
 symbol: nvme_auth_extract_key
Message-ID: <20261121052121.N2VJVAMK-lkp@intel.com>
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
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Hannes Reinecke <hare@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git dhchap-keyring.v4
head:   1b78746d90bfa570d96e88475983421f24c38b0d
commit: 471402e9fa1b77a993d10ccd1568579108ea44e8 [4/9] nvme: parse dhchap keys during option parsing
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: s390-randconfig-2005-20261120 (https://download.01.org/0day-ci/archive/20261121/20261121052121.N2VJVAMK-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8db60b003f961f25c5cafe91ee44176f61374279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121052121.N2VJVAMK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261121052121.N2VJVAMK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: nvme_auth_extract_key
   >>> referenced by fabrics.c:1091 (drivers/nvme/host/fabrics.c:1091)
   >>>               drivers/nvme/host/fabrics.o:(nvmf_dev_write) in archive vmlinux.a
   >>> referenced by fabrics.c:1106 (drivers/nvme/host/fabrics.c:1106)
   >>>               drivers/nvme/host/fabrics.o:(nvmf_dev_write) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
