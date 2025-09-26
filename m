Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A920A1BD9CE
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Sep 2025 01:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758851747; cv=none; b=Zh7NL0Hpii/B+8CrXj0zABmvU5K+Gmt7UuglZzJE4RSjxlzNlDsXMsIoufLxyw9Dq8iwdS+N63zLnxQ7xUoYgh5I92C6Jqmv5co9uOduES/zs+2WzNhmlr7TeJxunVyyRszmtedMCOdybHUsFEE0csf/BbnzvddpVMcyvO7B+5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758851747; c=relaxed/simple;
	bh=JBIbZ9uApbxOFMh7YVlIi/+HpxdWm6JAcD6RZr8LUVk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oH9O8ToqGC7j69GBNlGGv1odYMc0vxPQQwnnru/3kSuxc7RUeLzCknWSqxMJdBLSGOHU14mfTKmbAAx4azUrA6JN2hxem2llyKzz1AC6vMmXhxIMEHDqMOUYh8NFuAAyh3136fH+++7XCP38jOYCnqwZR5D7xjid2gzRbtiaUHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B+qXcGb4; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B+qXcGb4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758851745; x=1790387745;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JBIbZ9uApbxOFMh7YVlIi/+HpxdWm6JAcD6RZr8LUVk=;
  b=B+qXcGb4JqkAS8KplIwygIB5FNidPTTYA3U9uNrIyy5/yzMJCtu62ok+
   sFWdsYWj4piGNCrP+AZOa6an33vA3Aq7e2UOGJroh/TuNSeHavYEeJUBs
   5yRhs+uL6Jj8jlw3DxHbtx59QXWmW51DuUPL2QA3LurL8VKbORGNjV02f
   WQhbcNjrymp4CJsSMXvmRSSDRjJ/oBckM1fFw7ri2y0zF/6iIiObayIza
   ILbFBDUWzY3P572fI1aOcw4R5BDVVJnmyc1IM6E6+B7YxWrUtZ+B6sa7l
   G8X5bIFuaZviLh6J+eAJFgWaUt6W7BT2wXvA5FpCGAz6rcoUTjz2p9KCy
   w==;
X-CSE-ConnectionGUID: bdUywBOnSgSQFdtMC/D7Lw==
X-CSE-MsgGUID: 07bxssb4T+CVu+G0HfNkKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="63814111"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; 
   d="scan'208";a="63814111"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 18:55:44 -0700
X-CSE-ConnectionGUID: 1Ibahj2NSber9jHsk5UbUQ==
X-CSE-MsgGUID: mxW2xP4CSw6lHe7TWve65g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; 
   d="scan'208";a="181785853"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 25 Sep 2025 18:55:44 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v1xgT-00000000577-1WX1;
	Fri, 26 Sep 2025 01:55:41 +0000
Date: Fri, 26 Sep 2025 03:55:28 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: add LinkEase EasePi R1
Message-ID: <202509260308.zG2oLCkq-lkp@intel.com>
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
In-Reply-To: <20250925055906.83375-3-jjm2473@gmail.com>
References: <20250925055906.83375-3-jjm2473@gmail.com>
TO: Liangbin Lian <jjm2473@gmail.com>
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: heiko@sntech.de
TO: quentin.schulz@cherry.de
TO: kever.yang@rock-chips.com
TO: naoki@radxa.com
TO: honyuenkwun@gmail.com
TO: inindev@gmail.com
TO: ivan8215145640@gmail.com
TO: neil.armstrong@linaro.org
TO: mani@kernel.org
TO: dsimic@manjaro.org
TO: pbrobinson@gmail.com
TO: alchark@gmail.com
TO: didi.debian@cknow.org
TO: jjm2473@gmail.com
TO: jbx6244@gmail.com
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Liangbin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on rockchip/for-next linus/master v6.17-rc7 next-20250925]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Liangbin-Lian/dt-bindings-arm-rockchip-Add-LinkEase-EasePi-R1/20250925-140131
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250925055906.83375-3-jjm2473%40gmail.com
patch subject: [PATCH 3/3] arm64: dts: rockchip: add LinkEase EasePi R1
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: arm64-randconfig-2052-20250925 (https://download.01.org/0day-ci/archive/20250926/202509260308.zG2oLCkq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250926/202509260308.zG2oLCkq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509260308.zG2oLCkq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3568-easepi-r1.dtb: mmc@fe000000 (rockchip,rk3568-dw-mshc): status: 'oneOf' conditional failed, one must be fixed:
   	['disable'] is not of type 'object'
   	'disable' is not one of ['okay', 'disabled', 'reserved', 'fail', 'fail-needs-probe']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-easepi-r1.dtb: mmc@fe2b0000 (rockchip,rk3568-dw-mshc): status: 'oneOf' conditional failed, one must be fixed:
   	['disable'] is not of type 'object'
   	'disable' is not one of ['okay', 'disabled', 'reserved', 'fail', 'fail-needs-probe']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
