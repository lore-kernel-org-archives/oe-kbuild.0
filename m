Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71E31D432D
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Jan 2026 23:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768345255; cv=none; b=OGcq0wbRjt4kw4wMTbjr5WXibb57+EMuCltAMjMFnKsffvDuc58HBJKs7MwcRHRPthY5QxN73gAcy/622dAPTmyac/Or7YtOJjcp2OqSvO7vA99v0icwzw/dxgjuqYG5warbsVACrPA5ocv6qkzO+t10QE7ix1Kb+a6aqNg+uKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768345255; c=relaxed/simple;
	bh=T2TUgv6toCE33wl689/n7gm5FH5yaDyF0saKQ6szz5Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RLSuGDMbX8d3wsk5DO+kGpXNR/X7wOzynKAIA56QSDZk5Uu/qDTXFmATLnP8bqSt4AKnS5OUiIbAxu1pxKl3sk6gWzsIaTqqXxc2/VSFcjc1qGuH3+ueR5ki0aKZnsVjco4ajCqhuI2zfxtIZvxu+f4hTAaTDz8MVRrlQNGBv3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T9YuXnUI; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T9YuXnUI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768345252; x=1799881252;
  h=date:from:to:cc:subject:message-id;
  bh=T2TUgv6toCE33wl689/n7gm5FH5yaDyF0saKQ6szz5Q=;
  b=T9YuXnUI1Ac6TaRJ/vfn+NYRqP0eO4wSzQ882zQkrQA9HXKTtRjPwFOR
   HdOyDWwEm2O8NjDaYUHGd0neDMlVlg/dndqN37ZzmNUkIpOzeLJjADS95
   7a4xlSkRBCvs7xBMpZOGqbjJ8D0/PPWxiwGeltsmz67al70cQwyReo9BB
   g0r30AxUoaV4Xl97EblXUI+PDBKJoaetfBzrh+bvGyHQsRMINC92Ddini
   9DNopyAWZxJG8Oe71ZqWAYLU3LNnTREpsbvSQdr4F3VsRoRIT0s76ee70
   UaQ9E7OMUtP8ki/GHbEzo0TI1df9RzTrEuqsxO+UFa1OhtNDiJveMVGpd
   g==;
X-CSE-ConnectionGUID: Qq7Equb/QN+fA30+XaYtyA==
X-CSE-MsgGUID: OoTbYPrUS7Cx5WPtElRyoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92310891"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="92310891"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 15:00:52 -0800
X-CSE-ConnectionGUID: jS9xQG0+ReKS01jNZbNYBQ==
X-CSE-MsgGUID: lFDAStrJSEyR3f8NDnxnww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="204399092"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Jan 2026 15:00:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfnNY-00000000FT4-1nBf;
	Tue, 13 Jan 2026 23:00:48 +0000
Date: Wed, 14 Jan 2026 07:00:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/gfs2/log.o: warning: objtool: gfs2_ail1_start_one+0x1dc:
 unreachable instruction
Message-ID: <202601140637.CVflfjUo-lkp@intel.com>
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
TO: Andreas Gruenbacher <agruenba@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b54345928fa1dbde534e32ecaa138678fd5d2135
commit: 5a90f8d499225512a385585ffe3e28f687263d47 gfs2: Don't start unnecessary transactions during log flush
date:   8 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 8 months ago
config: loongarch-randconfig-r053-20260108 (https://download.01.org/0day-ci/archive/20260114/202601140637.CVflfjUo-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140637.CVflfjUo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601140637.CVflfjUo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/gfs2/log.o: warning: objtool: gfs2_ail1_start_one+0x1dc: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
