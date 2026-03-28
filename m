Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379CD345752
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Mar 2026 19:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774727950; cv=none; b=i8anhi+rwSa9312WMXxNBlWnXAdX9Hh9V/3BKW4V6+T2cUgQyxdPiYq7qlfMEAn20OGyGNvoGhyldobkpvRl4D2nePbcLKxZEWq3mQ4gw7X4q65kEa7QyKbW3SkmwG9qHz0NISUFwB/+SgZOeyQ2bGPk4ukpdZwMasKoE/ja//o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774727950; c=relaxed/simple;
	bh=hvJ33hQZVAt2pVpKCRdqTGGRjJMHj/EYwPO5aTWKrF0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nTM0b14ZdjXAVd4wdHOQ5UEwHP2kMi3nLPtAWF4gIicKiDW6HUJ1B3JOu62q/7zMO8qYFxL3YCJlNAklfQ8Kt7zhRuMFihUuCiXt5uBdswuhk032RZZJaV+Em/EU3RuQgQEgXrzwu5OGv9mA+dlwbBL9QrI0B+vz7mLUoQGi+og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hw+dl0wC; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hw+dl0wC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774727948; x=1806263948;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hvJ33hQZVAt2pVpKCRdqTGGRjJMHj/EYwPO5aTWKrF0=;
  b=hw+dl0wCyFZv08RPaOoROi1wdmpNXV7enzlSSv1uSxyIjnF1ycnxuapa
   m8ZJsCGwRhPULug0qJgjZzVbT625Xk8VBueDXe0+nAR61Jv9itVdyX58V
   wdZC/qosxbo6+NZ3MIGnaTVxyBUa9vM3gYFub90vBFH4oBsz+hN3FBWuU
   twfShDejIuLgVTlMroVGgP6V4EVX+1F3X8YYRLOTcqXzAKXPeBqk/nZG6
   N2+sYcVN9YcZ2t/yBScSJYaX2JQi2o8Ql9/JeQR3De5b8DAcGsgr2U6OR
   5VDvYQgqlegQKJLkrW0O2q2rbOczUleECfHEYNh3pYOhAK/upGv9tBvvZ
   w==;
X-CSE-ConnectionGUID: QD9N6x4RQqaJCrxgzz5AaA==
X-CSE-MsgGUID: MUFJCmO+SfuiqD4Vo7jGKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75741418"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="75741418"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 12:59:08 -0700
X-CSE-ConnectionGUID: XPfWsRXYSlCoSoiprFnYzw==
X-CSE-MsgGUID: 9agXPwczSuG3XIVxw4Vbvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="263569017"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 28 Mar 2026 12:59:07 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6ZoG-000000007jH-2voA
	for oe-kbuild@lists.linux.dev;
	Sat, 28 Mar 2026 19:59:04 +0000
Date: Sat, 28 Mar 2026 20:58:24 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH 12/20] drbd: replace per-device state model with
 multi-peer data structures
Message-ID: <202603282054.DmfSBkNq-lkp@intel.com>
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
In-Reply-To: <20260327223820.2244227-13-christoph.boehmwalder@linbit.com>
References: <20260327223820.2244227-13-christoph.boehmwalder@linbit.com>
TO: "Christoph Böhmwalder" <christoph.boehmwalder@linbit.com>
TO: Jens Axboe <axboe@kernel.dk>

Hi Christoph,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 67807fbaf12719fca46a622d759484652b79c7c3]

url:    https://github.com/intel-lab-lkp/linux/commits/Christoph-B-hmwalder/drbd-mark-as-BROKEN-during-DRBD-9-rework/20260328-153634
base:   67807fbaf12719fca46a622d759484652b79c7c3
patch link:    https://lore.kernel.org/r/20260327223820.2244227-13-christoph.boehmwalder%40linbit.com
patch subject: [PATCH 12/20] drbd: replace per-device state model with multi-peer data structures
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260328/202603282054.DmfSBkNq-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'over'
#2076: FILE: drivers/block/drbd/drbd_int.h:1641:
+	ktime_t pre_submit_kt; /* sum over over all reqs */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
