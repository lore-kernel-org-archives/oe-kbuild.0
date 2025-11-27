Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3712226E165
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 02:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764211116; cv=none; b=cubQdrLZZUjRDdmjL/kE/cbos6H+cCzkcnMfjvOp+CIbaOtDXYPdHop+gfCjpMU9E4CyHvHBqtXwPoK8umPeQVL44LaJ0b1q1LvDdaMsNwMwakdHVKw+pP00m4sWGM97/XAq8FfcgdM346JlMXnneMf4T7Z34Qhv1r9+Ht/K6jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764211116; c=relaxed/simple;
	bh=iOkihD6NaDvjSp2kQkbuwoUanbCwDXg6LgHT17QzmTg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JjfnjTNG1nWzIxvylCBDsNRZ9kx6/FNCb+gEnV+B5e4wPRnoK0oZYADvkHjz+BBPWpmxVlDFBPUjQkORH/ODejqSl7AV8/t9X0nxrro62R8wOtjH7DZELdTgIbE9eGArXSijjJ8HDfsO9MXrKzSak3P64qNZaBwEAPmUZ7DxDUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GdZ1eVuj; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GdZ1eVuj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764211113; x=1795747113;
  h=date:from:to:subject:message-id:mime-version;
  bh=iOkihD6NaDvjSp2kQkbuwoUanbCwDXg6LgHT17QzmTg=;
  b=GdZ1eVujFnciiZ9o1eHpyo34URJdAf7pYf9WE5zLlFwetROSmTwOQaMF
   E8Tz8mOuB7xLn1p9wdl/rmJ6jEaQZdB9s56jF8SEanj7YB8UJwdGOLV8b
   Pl6DlfRcf76nv+E0XZxYcG9LQpA9RfdaqG/vhYQSOBglJNK/fbMxQ1kgQ
   4raX+DbtVd0umrk0TL+JAAqb74yyJNzBYgVCqQ4S4ASlcqb9lcS+nh6bg
   mGIyrJuBYL9wC6b1ghx2W1H5Q8AagsmsbU83HqpNUlv/GshYThC0iHtUB
   XdGclUTRDqyguNwiGurdTyhElyaJBCEvExMtwwwtUMHGTJQRg0qqXwBif
   Q==;
X-CSE-ConnectionGUID: ZcmTtYeaT/SjECxFm6xYoA==
X-CSE-MsgGUID: yVZRjwhgTuWP8kbf5mpekw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="88899855"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="88899855"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 18:38:33 -0800
X-CSE-ConnectionGUID: RLNy2EOjQmawn62rn1+iuA==
X-CSE-MsgGUID: HvuNBWocQGmYsCus0zKJSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="192765376"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 26 Nov 2025 18:38:32 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vORtu-000000001aX-44Kw
	for oe-kbuild@lists.linux.dev;
	Thu, 27 Nov 2025 02:38:30 +0000
Date: Thu, 27 Nov 2025 03:38:27 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [djwong-xfs:fuse-service-container 10/82] checkpatch: ERROR:SPACING:
 space required before the open brace '{'
Message-ID: <202511270315.67igC93b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-service-container
head:   69ff58bd20a3f25ce91f1ff72a2063b65463142b
commit: 997453783cc3aaef29d9153a8483f17374538bf8 [10/82] xfs: convey metadata health events to the health monitor
:::::: branch date: 34 minutes ago
:::::: commit date: 34 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251127/202511270315.67igC93b-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#531: FILE: fs/xfs/xfs_healthmon.c:214:
+			if (existing->group == new->group){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
