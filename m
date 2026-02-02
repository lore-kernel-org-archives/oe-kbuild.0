Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6742EBDD9
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Feb 2026 18:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770057521; cv=none; b=FCB07n64R9wgjApo4uIPNozpX9NccNHDxiAryrnwhQgwAKqwjE1sm4aSFCacqGn1zq0k6AFi3csDpocXjYmGaCTYSfEGM29PhMI+NgAgkYyIVPutcPh9mhHm6TM94/AhC77ALwMcvstWaBuMqLy9EgLdg/ZZ0HH18RqI60YQZS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770057521; c=relaxed/simple;
	bh=wbD5zGSSwsafNmBrZdEY8qdAdTif7wQECyt5YLKIxFs=;
	h=Date:From:To:Subject:Message-ID; b=Bl0hjDheymmOrIXnhWUwdDxo2JnLj78fiR+/vxj25HW5d6hFHLMCIOh+wNlx7Ia6oA7hRrq+9VagrAuZ1PliwOUpzRed8bic6ivnQAM1WN36sSgIGimdPfYIjRi44pN/u3JKtzJmHRkvVamjty7mkNkYLRdYqaXDTF8AkGofjOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Td/X8G+L; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Td/X8G+L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770057520; x=1801593520;
  h=date:from:to:subject:message-id;
  bh=wbD5zGSSwsafNmBrZdEY8qdAdTif7wQECyt5YLKIxFs=;
  b=Td/X8G+L7ME8O3g2+hz7wbFH17ljQnxLyhkVDQvY4/Kn7k2eq4KfE6kI
   Jf3iK+Y7Q8lJZO4SdN+azetMXYppfxeCxhrAJmyR9e3cAz5J+aThWSDub
   O3EnCMPsG7rMTRSmbX8I8XrfRnIM+L5jtUCWXx/GyaC/Jiw8dC+V+2RBx
   Hec0UPkxd/hBYjaY4OpPpUEkmRixxBcCLEujrf/H99hooDJBGxJUvURXc
   pFAfElVJDEq6pg22oVcvhopSyAAuzwK32thKFoW/Lc76yHTTBYHwBReaV
   aSNHiGnJx4ntGdUqwIE9UoFHwpaD1tQys2HxoTX3sTbwyOmtkUPlDOFuk
   w==;
X-CSE-ConnectionGUID: zsNRA4SyTrm3iMW6i8GtFg==
X-CSE-MsgGUID: Nsm/8HMsTzO06r7ZeB+7eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="70947159"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="70947159"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 10:38:39 -0800
X-CSE-ConnectionGUID: tUN4ARUlS4maQcbKXJKJzw==
X-CSE-MsgGUID: vvhAd3LmQ4+eXe/dIntVyQ==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="209400992"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 02 Feb 2026 10:38:38 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmyom-000000003Bd-1aGa
	for oe-kbuild@lists.linux.dev;
	Mon, 02 Feb 2026 18:38:36 +0000
Date: Mon, 02 Feb 2026 19:38:07 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [dhowells-fs:keys-pqc 6/7] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'that'
Message-ID: <202602021944.GBilLsEa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git keys-pqc
head:   91db696adea4d76017b1e1f45915a5cbf04e8da3
commit: 0ad9a71933e73c8a2af101d28e9a1dc35bae02d5 [6/7] modsign: Enable ML-DSA module signing
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260202/202602021944.GBilLsEa-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'that'
#13: 
applied that fix this[1], but it appears that that will only be available

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
