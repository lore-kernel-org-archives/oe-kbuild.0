Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C3433D6FA
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Mar 2026 19:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774727952; cv=none; b=YZQANAnjpKdQCjNKnVAEqd0Z7YF032nuNe/LkRAh79MZRgyF+DiCHZYH/tn/+fPOHew2bcPKPge12MIagd7uBCEig7ySCtw7/VRiyTJMvwwIQGIs59c2Aa0c/NtPHgtfmDczU7sTNnHPvBebzGgL93y+UV5Y53obS7nQcx82kSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774727952; c=relaxed/simple;
	bh=H8rep5WiOQ0vsT4j2vHMmhm63RRJ/jl72FevxIgWzjs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sEUjGxbmd0+08j6z4UKPNmf1LdvAtldrSsiQc7gqRrljBHqt7ULQ1X8h5eVoTEIpsXK9kL1MnJMZ599eq2CKJDvBy0q6lG4BFiaXEsD0o8nUorV/wTo3TKm1w57lOzGp4vHw7ohcCu8mhC+u0qOpsXS1WzTh+QocyVZurSCbcpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hvr0L4ZZ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hvr0L4ZZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774727951; x=1806263951;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=H8rep5WiOQ0vsT4j2vHMmhm63RRJ/jl72FevxIgWzjs=;
  b=hvr0L4ZZU1RdwXrcJyqoCH4LEW5YyogwXq6L4lEsqS9gegyfSRK1jBDP
   MEjVC86C+Z9NRQFVV4uuAQMGQszc1mXso7BR6vYeM1hiWf3igbwafzZMo
   kgL4MpdxQdvTzTF5U408Gy6fLe7znrGEc7v787ABTDuR+pl/uvCK3csvq
   4TzMr+o+3NRKEzqwNJO5Kf64zgJUUJa47IghzrM6QHwKzcWvmQeYRJtEz
   kGvXiugMGRtwfuYQoTD6wJ6gasTsOXWrpd/MbyWJMIgZegA0XRzhmj2+V
   BWAG1+tFqVqhmRfXIt/hMowZKJzAn9cXbumSRalf4d0FhaGtjoW2Kg0lm
   g==;
X-CSE-ConnectionGUID: x7lfZNCbT2emSAWmVS63Cw==
X-CSE-MsgGUID: guqaehmZRNS/S8EO2Q8lGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75741419"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="75741419"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 12:59:08 -0700
X-CSE-ConnectionGUID: dXPeI85gRWSCO4g4LZG2Qw==
X-CSE-MsgGUID: +eaFSppORwCVr4p6IO3hLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="263569018"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 28 Mar 2026 12:59:07 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6ZoG-000000007jF-2iHc
	for oe-kbuild@lists.linux.dev;
	Sat, 28 Mar 2026 19:59:04 +0000
Date: Sat, 28 Mar 2026 20:58:24 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH 11/20] drbd: rework sender for DRBD 9 multi-peer
Message-ID: <202603282000.olrMpXPM-lkp@intel.com>
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
In-Reply-To: <20260327223820.2244227-12-christoph.boehmwalder@linbit.com>
References: <20260327223820.2244227-12-christoph.boehmwalder@linbit.com>
TO: "Christoph Böhmwalder" <christoph.boehmwalder@linbit.com>
TO: Jens Axboe <axboe@kernel.dk>

Hi Christoph,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 67807fbaf12719fca46a622d759484652b79c7c3]

url:    https://github.com/intel-lab-lkp/linux/commits/Christoph-B-hmwalder/drbd-mark-as-BROKEN-during-DRBD-9-rework/20260328-153634
base:   67807fbaf12719fca46a622d759484652b79c7c3
patch link:    https://lore.kernel.org/r/20260327223820.2244227-12-christoph.boehmwalder%40linbit.com
patch subject: [PATCH 11/20] drbd: rework sender for DRBD 9 multi-peer
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260328/202603282000.olrMpXPM-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'to'
#247: FILE: drivers/block/drbd/drbd_sender.c:189:
+		 * This only applies to to application writes, not to resync. */

WARNING:SPACING: space prohibited before semicolon
#3644: FILE: drivers/block/drbd/drbd_sender.c:2829:
+		/* do nothing */ ;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
