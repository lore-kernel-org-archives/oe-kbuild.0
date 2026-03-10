Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A26943DA5B
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Mar 2026 09:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773134444; cv=none; b=MvpkBPCBD4Za04PZyG/D0O9SEVHbo0T2ZAstrf7PQNDgHsyYotpw9Kb89yaNsT80EONAHddHKuIAr5Phs2UH/5U8cZQjSB/q9Qysisu/DL63NLgWBE2Jxe399ergqtXFNg5IMRDDLCQ2LWUDoKQofXW+aUNr6CMfkQUOrOJNDfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773134444; c=relaxed/simple;
	bh=23GQ+QjnMtBiqSgeklCcVNvmPgfLD7k/7pZU4xlKDL4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CAh0oHzqCrG69FGGQW4aQ+wvjVhwPntPeaQdTxVylMJlIncoMAVwsHFeeR79Nsh2OhKm2NNs+HxHYXZY6oIdVTXvKg8GuFpl3sscn8nuZFu0eupQFFRD6a0lJf5G9ayCebhNwY6Hu4EduXeUskfapcnxS0T5ccnpqHzesybvJkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LaKIiyN9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LaKIiyN9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773134439; x=1804670439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=23GQ+QjnMtBiqSgeklCcVNvmPgfLD7k/7pZU4xlKDL4=;
  b=LaKIiyN9c3lSBMQxpJafBQr22Q37FtSXmzAJcSVDKmRHALcuKM2ty9Jd
   D86SmL21vGt2SuQAmS4bPhAmWP8X0jOZFKKYaacPbor84lVB3KHKHxTW2
   5w/cl9vZSHARoFImtOtWcYAjdS0sUi//2ZMwLtD+ppC+B7i7aKK68tifC
   DIcViBcQBWmoxJ+LVZaf8b2y6ENXQMwYPds7T0cYMCQb/vKrt3vAk840i
   mDCbEv3NeQxMD5zg+OLAe4miPQ4cOuA9PA7Ietejp+ypkGwGhC/ivOLxJ
   K3tShmhzxF5wmLGDzNBuW0L+nacCn/XdkRAeH9z2Bal7FshlV/qnQdH9W
   Q==;
X-CSE-ConnectionGUID: iSkVpozuTqGZMokr3l/p3g==
X-CSE-MsgGUID: fIxHAfSbS0OLLqi4GkptDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="99641823"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="99641823"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 02:20:39 -0700
X-CSE-ConnectionGUID: xcCv25xQRSCOzICppAB0Qw==
X-CSE-MsgGUID: 9cMAT5dcR76Eju9x8y9akg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="243068041"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 10 Mar 2026 02:20:38 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vztGV-00000000321-47Gt;
	Tue, 10 Mar 2026 09:20:35 +0000
Date: Tue, 10 Mar 2026 10:20:08 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/2] dt-bindings: mmc: snps,dwcmshc-sdhci: add HPE GSC
 dwcmshc compatible
Message-ID: <202603101014.MVCACpLt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260309211333.977919-2-nick.hawkins@hpe.com>
References: <20260309211333.977919-2-nick.hawkins@hpe.com>
TO: nick.hawkins@hpe.com
TO: ulf.hansson@linaro.org
TO: adrian.hunter@intel.com
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
CC: jszhang@kernel.org
CC: linux-mmc@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Nick Hawkins <nick.hawkins@hpe.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v7.0-rc3 next-20260309]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/nick-hawkins-hpe-com/dt-bindings-mmc-snps-dwcmshc-sdhci-add-HPE-GSC-dwcmshc-compatible/20260310-051619
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260309211333.977919-2-nick.hawkins%40hpe.com
patch subject: [PATCH v2 1/2] dt-bindings: mmc: snps,dwcmshc-sdhci: add HPE GSC dwcmshc compatible
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: microblaze-randconfig-2051-20260310 (https://download.01.org/0day-ci/archive/20260310/202603101014.MVCACpLt-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 15.1.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260310/202603101014.MVCACpLt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603101014.MVCACpLt-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml: allOf:1:then:properties:clocks: {'maxItems': 1, 'items': [{'description': 'core clock'}]} should not be valid under {'required': ['maxItems']}
   	hint: "maxItems" is not needed with an "items" list
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
>> Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml: allOf:1:then:properties:clock-names: {'maxItems': 1, 'items': [{'const': 'core'}]} should not be valid under {'required': ['maxItems']}
   	hint: "maxItems" is not needed with an "items" list
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
