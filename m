Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5569C2AEF5
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Mar 2026 19:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774727289; cv=none; b=n5WkOW1DfpjuqpY9tg0UtNh2QVvt8RJJEe+mv9331GTGUK1UZCkn5EWsLEHqhl4N3f9jJS6Ub4EtzJTAaNvkmkBDGT6gig7GTTiaxp2vJUSsl1IEf32JOiSOfg9ylz25nWki4qKOyuKCS24YJFWm/9paC0AVOOJ2fHcrdoOuvUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774727289; c=relaxed/simple;
	bh=yq1dQ+C3HIrQixynU+gRU4vtkU1vvxW3rqxFpPCQ2Wg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F5MUlyZC31Hbu8uK+E64xzKH6rB1ptXbcSLXGMcnTP+ThpC5xoyB9qbnoU0ZNGpN8RuXngM2YXMX7m7hb4M4h9zXFSGUhBOfYKihjSba+Q5i4Br3scolf97Q096JHqzUwPs8345o+Wmb7Cb+p/SPO6arSFOYsF/Rnjgvj2wT3+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nlOcyUNE; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nlOcyUNE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774727287; x=1806263287;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yq1dQ+C3HIrQixynU+gRU4vtkU1vvxW3rqxFpPCQ2Wg=;
  b=nlOcyUNEcDMC683KfVn3BJFd2q9uT7lhKu0/qbWOmJm6JWGkKQMp/DrF
   4Cg3tCzzodanj5hM2P2A/r+oveMdnMfEnXGeldnRmfYSiKxMjlYa3/dqi
   9H9vFFfKdfNYJK+dcAiUaFwtOzFlE5o6BmHpcUAKCVRfu3mpgj/LNPwwf
   +KcoiNkhnmpX/NSXjFEFWzWKie14IGRE2CobNfsVcfdWKT5Ctix9Xufq5
   tFxZxTs2z+eSTFviDKCk1BiOkyEqNHRfygv01QPvjcZwqFAN0p/2a0Efb
   cNeJJSu25l7aHr6L+s61qLwlJj0mUHpAc+BxL5yiBLOI3sgUPa6Z+tWFz
   g==;
X-CSE-ConnectionGUID: pEYQvs+URUWV+m/Z4oe1wQ==
X-CSE-MsgGUID: UiSOG9LOQSaYDm472VGEIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="86461664"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="86461664"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 12:48:06 -0700
X-CSE-ConnectionGUID: U7kdYHwiT1W8aipc4yQ3SQ==
X-CSE-MsgGUID: 4k4SgFTYTt6LWLhUD3ywfQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 28 Mar 2026 12:48:06 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6Zdc-000000007ij-0y0G
	for oe-kbuild@lists.linux.dev;
	Sat, 28 Mar 2026 19:48:04 +0000
Date: Sat, 28 Mar 2026 20:47:38 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH 02/20] drbd: extend wire protocol definitions for DRBD 9
Message-ID: <202603282036.HrhMCPZz-lkp@intel.com>
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
In-Reply-To: <20260327223820.2244227-3-christoph.boehmwalder@linbit.com>
References: <20260327223820.2244227-3-christoph.boehmwalder@linbit.com>
TO: "Christoph Böhmwalder" <christoph.boehmwalder@linbit.com>
TO: Jens Axboe <axboe@kernel.dk>

Hi Christoph,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 67807fbaf12719fca46a622d759484652b79c7c3]

url:    https://github.com/intel-lab-lkp/linux/commits/Christoph-B-hmwalder/drbd-mark-as-BROKEN-during-DRBD-9-rework/20260328-153634
base:   67807fbaf12719fca46a622d759484652b79c7c3
patch link:    https://lore.kernel.org/r/20260327223820.2244227-3-christoph.boehmwalder%40linbit.com
patch subject: [PATCH 02/20] drbd: extend wire protocol definitions for DRBD 9
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260328/202603282036.HrhMCPZz-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#129: FILE: drivers/block/drbd/drbd_protocol.h:98:
+	P_RS_CANCEL_AHEAD     = 0x4a, /* protocol version 115,
+		 * meta: cancel RS_DATA_REQUEST packet if already Ahead again,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
