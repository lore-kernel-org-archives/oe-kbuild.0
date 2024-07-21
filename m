Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D904F168C20
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Jul 2024 20:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721593081; cv=none; b=qxqv1oufS6GokkrQkCp4K7wEltA/MiZFr9ohsDVjh5u5H42TcSvBfRLqOV/slNIa0dupCfqL2Ha82T0ifiUEAPMicwd6+5rEmva8l9PM3bdg2L7nT6IpC880Tgxgm7tEfuCrLmBujvE7zd9ASJ272QSbB7xu44Qe1EZJzGSv0fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721593081; c=relaxed/simple;
	bh=LDAEgnNayVwpTmaSgyZpedAkxEKyS80qMITfbNy0p+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JVUoYQDn88WXaPsYYfePFx+e/McM0FB1tuNdHntoCQ35x7RZcFuNh8M047f2CQJTPIiiHBSM9mL0HlyLhq88h6vZGocFivIbSOSVH6qHIIrHQMN6MJOADMt4GK9sa0ewEjUfDcYSDG3mTB0lB8/XNfSi7D0p30JNIQjacYv2TcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NlkEC0qD; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NlkEC0qD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721593079; x=1753129079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LDAEgnNayVwpTmaSgyZpedAkxEKyS80qMITfbNy0p+U=;
  b=NlkEC0qD7p7o/dVY7pN2Nh9fsnDHWjSXDPhQ6q1Ad+xvReWmRCToNXKn
   IQVr0ZIcvAIDhCtFXT9uuKqu4p93FuofVNcaLTGJeBfE+k6VYgAOSrlcQ
   zzTLmFbOkJM9Jo2gm1cxWMSh16UzEGfvYG+kqBV/erlYPu+At6NV6+kqm
   Jb6pSeQd7miF172Qj4ZJgteVGndsaXJUy4UkVA7GtHKuiRjIfDYwslK6V
   Bc6rFTJql0675DoHQWQfgyg4ypDGx92/p22GzXouyIIaftAYgZHDdy0BV
   N4KJqH96wAWHTOFoP4naQOYklykfW6iAzOkvYn4Pn8cBYK510O8ILIjnY
   w==;
X-CSE-ConnectionGUID: jxO1AmQqSHyGXkV/Ze516w==
X-CSE-MsgGUID: 3m1P8iZaQlmshEF3GmGh1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="18769166"
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="18769166"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2024 13:17:58 -0700
X-CSE-ConnectionGUID: vh/TDrdXRNO7XlIUHQ4HGA==
X-CSE-MsgGUID: /OyoXvIDTkSE38XaikQ7kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="55936689"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 Jul 2024 13:17:57 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVd0F-000kYQ-12;
	Sun, 21 Jul 2024 20:17:55 +0000
Date: Mon, 22 Jul 2024 04:17:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 06/14] arm64: dts: rockchip: enable sata1+2 on
 Qnap-TS433
Message-ID: <202407220417.lc5cYQg8-lkp@intel.com>
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
In-Reply-To: <20240721173723.919961-7-heiko@sntech.de>
References: <20240721173723.919961-7-heiko@sntech.de>
TO: Heiko Stuebner <heiko@sntech.de>
TO: heiko@sntech.de
CC: ukleinek@debian.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Heiko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on linus/master v6.10 next-20240719]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiko-Stuebner/arm64-dts-rockchip-add-PCIe-supply-regulator-to-Qnap-TS433/20240722-014202
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20240721173723.919961-7-heiko%40sntech.de
patch subject: [PATCH v2 06/14] arm64: dts: rockchip: enable sata1+2 on Qnap-TS433
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: arm64-randconfig-051-20240722 (https://download.01.org/0day-ci/archive/20240722/202407220417.lc5cYQg8-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240722/202407220417.lc5cYQg8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407220417.lc5cYQg8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dtb: sata@fc400000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/rockchip,dwc-ahci.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dtb: sata@fc800000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/rockchip,dwc-ahci.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
