Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C7D74BE1
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Mar 2026 19:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774727290; cv=none; b=pcgJtbUpF6HnfGK9vEHbnwMZA+5/LVE4hrv1rwGvOJqhGKVkRp5WUYzOE8OYxmiUmnZg0iTiGLYgejj8aamZWZwOIWE8x87bx4iYrE9BELxJRyK/m+KubpVH+aJlsOH52e/xlaxe+qGaxAiXZuyO9uzgYjsuS6qqVSFaakPaHWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774727290; c=relaxed/simple;
	bh=8f1loiPJQveJ54Jr+RuH6nJZWqQPi0rF++1brXEaTDM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pqL2g8rQGs/AWLi/GnP9DpH1sl2HAt/JfJzyrmTjA6A2B+TtXNCQOBGVEIZeI6AT6jDIRRMEWZOAditlSE6Ltlt15tu2AjaUBqT1av+o/40oSq+/y/NHxtqKitr41uvTMPWsrmKrGOJtVG9V7vsCN7A4KzwnkD2dW9ZrmK7S9sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=go4if9Gj; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="go4if9Gj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774727288; x=1806263288;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8f1loiPJQveJ54Jr+RuH6nJZWqQPi0rF++1brXEaTDM=;
  b=go4if9Gjy0IRKIWg4N8QOqewjAhgW4WfxPh06Ial9D0ovJ/cx/m1prTD
   zOsy9GX7uvMeh1A1OH6jq1soUQvhr8g+wAQk2VL0cRojlj7+WuE9ssjx/
   PXdiqogHAitwCrISITlXcrdhQxq+gsJTNfIH4Rl8ruka3NiDJEVXzosh3
   bmCaGhl56/xDkiYh8ibCMMnJflPnJ2kh/WAsmho4sCh6LOeV3JYY+Ps3s
   wc6gBFTXsof/pR0+ZsxR+5xzijYznltZIeqvIpm26M/zbnZaVKLyMlwtg
   bgzqdcQQ1aAbQO7prVEIULBgB4C0vgqm9wmQl92IVLL92yX/lMKRGyHW+
   Q==;
X-CSE-ConnectionGUID: LM49q0eoRtq5LVzg/Ojb0w==
X-CSE-MsgGUID: 81EfxNBzQBGQFrtipXU2oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="79673992"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="79673992"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 12:48:07 -0700
X-CSE-ConnectionGUID: OJNmHUfrRR2UkjisKGenVg==
X-CSE-MsgGUID: u9Gh7HcCT4y4k/Pj4w5/1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="222312831"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 28 Mar 2026 12:48:06 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6Zdc-000000007io-1L7n
	for oe-kbuild@lists.linux.dev;
	Sat, 28 Mar 2026 19:48:04 +0000
Date: Sat, 28 Mar 2026 20:47:40 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH 06/20] drbd: add RDMA transport implementation
Message-ID: <202603282051.4lC524we-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260327223820.2244227-7-christoph.boehmwalder@linbit.com>
References: <20260327223820.2244227-7-christoph.boehmwalder@linbit.com>
TO: "Christoph Böhmwalder" <christoph.boehmwalder@linbit.com>
TO: Jens Axboe <axboe@kernel.dk>

Hi Christoph,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 67807fbaf12719fca46a622d759484652b79c7c3]

url:    https://github.com/intel-lab-lkp/linux/commits/Christoph-B-hmwalder/drbd-mark-as-BROKEN-during-DRBD-9-rework/20260328-153634
base:   67807fbaf12719fca46a622d759484652b79c7c3
patch link:    https://lore.kernel.org/r/20260327223820.2244227-7-christoph.boehmwalder%40linbit.com
patch subject: [PATCH 06/20] drbd: add RDMA transport implementation
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260328/202603282051.4lC524we-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'that'
#2329: FILE: drivers/block/drbd/drbd_transport_rdma.c:2262:
+	   use that that was used longest ago */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
