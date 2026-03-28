Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8294D33E358
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Mar 2026 20:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774728549; cv=none; b=EmFFrVvbnfVGfW2Dc2cKTPPZvAFOuZ4TTuqvCIInvUNSGAMEjtLmOEuNQhrUwPjvLyMVSHtJWXjYSqudE03MxJQbYq+ZG/xAXNNw83tXOb7xTVDihto/sXoIjQ5E1TZBSx+bjtEN8xMk2p04tM35KVAhba9eIPY2xeJZkzAGpfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774728549; c=relaxed/simple;
	bh=6TmoGexKpqVIddlFU1eMSWv8k3EvEpzcZGzSC4hkH1Y=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lzl/A4Pqp3qxXN6KGGyfOUCPATVdB7KSY9/2NKl8rDRLZLU2/u0oWKGPJgSdVI98ubQGCsrdLlkoUWGwheJgS51fM9G+MA0UwbKqbrERrlUC0O6IepUQ1e4eCHIgxieVYyB+9OA5mqLYi2wmSxYabd3mfMvznAftSz4olLOQucQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E64+Haap; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E64+Haap"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774728548; x=1806264548;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6TmoGexKpqVIddlFU1eMSWv8k3EvEpzcZGzSC4hkH1Y=;
  b=E64+HaaptTyWobzxhGN4MGIhAYeNMwB2uoh7hz5IbrGp68Mi+jVau08v
   HgCoBUlZcYQndxVIn3do5hQcgg6UJbvH9zk16nIH9QhU4jP6IJrps5vwT
   GSKXzFt1j9Kyt+t452WTYBqsuOkC8BVYuwmSP7JTcLq0+/V5lYHvVg5KL
   0MBb8Pf8c+yQyEqpTD0X65A7gt8DyEZw7OsRUe1cDN8w2sK8LNWjRmNlk
   n7k6M1mblfey3yMco7jAyrtLWaqxQ76IBUEyHT9zmoiR6EszFE8vYQ0EX
   bxeoSo7sqIs+4uJ1bea1JKA2VJQrcWXB7yNdJzl59eHOMauSap2JboO6a
   A==;
X-CSE-ConnectionGUID: vf3D0aKASs6fjEhOdQEWsQ==
X-CSE-MsgGUID: E4KLgqIbSuiAVcZJ2PooqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="98384215"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="98384215"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 13:09:07 -0700
X-CSE-ConnectionGUID: 89MCTIUnTtiFZrrhIWr/mw==
X-CSE-MsgGUID: 2FlGi84cR96F/r75n3nzCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="256133333"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 28 Mar 2026 13:09:07 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6Zxx-000000007jr-0YNH
	for oe-kbuild@lists.linux.dev;
	Sat, 28 Mar 2026 20:09:05 +0000
Date: Sat, 28 Mar 2026 21:09:00 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH 19/20] drbd: update monitoring interfaces for multi-peer
 topology
Message-ID: <202603282156.ZE0c6xHN-lkp@intel.com>
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
In-Reply-To: <20260327223820.2244227-20-christoph.boehmwalder@linbit.com>
References: <20260327223820.2244227-20-christoph.boehmwalder@linbit.com>
TO: "Christoph Böhmwalder" <christoph.boehmwalder@linbit.com>
TO: Jens Axboe <axboe@kernel.dk>

Hi Christoph,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 67807fbaf12719fca46a622d759484652b79c7c3]

url:    https://github.com/intel-lab-lkp/linux/commits/Christoph-B-hmwalder/drbd-mark-as-BROKEN-during-DRBD-9-rework/20260328-153634
base:   67807fbaf12719fca46a622d759484652b79c7c3
patch link:    https://lore.kernel.org/r/20260327223820.2244227-20-christoph.boehmwalder%40linbit.com
patch subject: [PATCH 19/20] drbd: update monitoring interfaces for multi-peer topology
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260328/202603282156.ZE0c6xHN-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#533: FILE: drivers/block/drbd/drbd_debugfs.c:399:
+	seq_printf(m, "list\t\tminor\tvnr\tsector\tsize\ttype\t\tage\tflags\n");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#741: FILE: drivers/block/drbd/drbd_debugfs.c:556:
+			seq_printf(m, "-\t-\n");

WARNING:SIZEOF_PARENTHESIS: sizeof drbd_interval_type_names should be sizeof(drbd_interval_type_names)
#2258: FILE: drivers/block/drbd/drbd_interval.c:33:
+	unsigned int size = sizeof drbd_interval_type_names / sizeof drbd_interval_type_names[0];

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
