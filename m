Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2F41FCFEF
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Sep 2025 05:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758865033; cv=none; b=eSFmkYWcR3XZWDgYYflFlSkMrEthJPxlmfRg2n6bPw7TbF2CCaGb/MVY29YwtYLGnbVg1I+DQlsAQhMBV8ttrF08x4yqh3RCWmhwhbgatl+FkNoAPQUh/2JdQTpamDv/6KYbAw0mrAXL0VsfEGJnMQMTZ+m6Om1SFLE/BuFOg0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758865033; c=relaxed/simple;
	bh=MfOdZqKsKBfK4rKOwZ1OGo/xEnqfyioPjW3S514fsIU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UuCwdRW42xLPSwAKUK51QDTn8dEyiNWY1mV5e914nQO/9qMgYOxkLCoFSE4AelErz+9eHg1JG/PFMmw7HhyIMesnKiCM+HSfM5ljE4kItK2TnqSMD9QlGYHrxPDoknSlrew+s5zKv2EXAgjweT+d8wnfKW8aMBdjoAdFVIxUXaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MPE/B1v+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MPE/B1v+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758865031; x=1790401031;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MfOdZqKsKBfK4rKOwZ1OGo/xEnqfyioPjW3S514fsIU=;
  b=MPE/B1v+X9TBbUAQzYUDmAiNx4djwJq4YmeqU8QmIAkLCvBRU/6fu7FN
   qKC+yY+EQxiyAblAqbUg8PozQMVTs9uHVBc7j9dNCS1SGGnGTXawO3qQI
   +KUavWrlLE3sayWk7lxVrLDFQRtIqXAt+04PlgeTTfDyR8kCuEiqYYyrW
   0EsHj5BETV63sBhHInWMDcOBDBA4CDcGi6JTHPXfqG+y/mmM2MTwbDm0p
   X9soUtJgzrEMcxCJtPD6EddHqHsiGh0H8IBs1AegdsR0zETe2RjTlEH0o
   tF1BAILXlrNLSxXURyMhDl2eF+LJmoX0KE1CJmctvDALTCkdfui0ybKXu
   g==;
X-CSE-ConnectionGUID: j6I8E4wxSvS6RRXKPcR6Bg==
X-CSE-MsgGUID: l2Ym7jtfQxCigSHvjgALOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61246172"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61246172"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 22:37:11 -0700
X-CSE-ConnectionGUID: LU3zkHFATdi1KdGBY7XPVQ==
X-CSE-MsgGUID: ktYtA56eR3KiS1rBrJGZWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; 
   d="scan'208";a="182677701"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 25 Sep 2025 22:37:10 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v218l-0005w7-0z;
	Fri, 26 Sep 2025 05:37:07 +0000
Date: Fri, 26 Sep 2025 13:36:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: add LinkEase EasePi R1
Message-ID: <202509261328.Grjhp029-lkp@intel.com>
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
In-Reply-To: <20250925092037.13582-4-jjm2473@gmail.com>
References: <20250925092037.13582-4-jjm2473@gmail.com>
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

url:    https://github.com/intel-lab-lkp/linux/commits/Liangbin-Lian/dt-bindings-vendor-prefixes-Document-LinkEase/20250925-173247
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250925092037.13582-4-jjm2473%40gmail.com
patch subject: [PATCH v2 3/3] arm64: dts: rockchip: add LinkEase EasePi R1
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: arm64-randconfig-051-20250926 (https://download.01.org/0day-ci/archive/20250926/202509261328.Grjhp029-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250926/202509261328.Grjhp029-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509261328.Grjhp029-lkp@intel.com/

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
