Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FB141C79
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Nov 2024 16:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732205543; cv=none; b=EKTzdwKNlyxFBUrndyV1fZdlFXqlYBWZhBgVZewwcdtOArZR+ap7CRvLM5nhX09cjHii4c3dkiUNN5/c/56ncKAOCOQ8ZQwNIflXMOBf5knjAqlfGmNMwxAzXIzCcgBX21AgczR+MC6nNrM+4tcY8IpIkSjrE2/SrKNsYo3HuSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732205543; c=relaxed/simple;
	bh=LpkaiqfKml8hGmJhSgRGDPdVbmfFHySaOfgLtfcx+Tw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=COhtL7iMV1bllqj6+fD1JMoYVzzi5gjPtJtUTyu49cCidDUqpznBDLGtA4VTo/4CZSoaYmO5Mc3GohGsQQ24KAtn2hU1BxXkCglYP0HTbIvos6YFVKzuWiEUT9eouHLAj6jqcN9719VZRv5baalywQkoYRYT49ssiU2l8nA1ySM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gsBQpygu; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gsBQpygu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732205542; x=1763741542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LpkaiqfKml8hGmJhSgRGDPdVbmfFHySaOfgLtfcx+Tw=;
  b=gsBQpyguD/P6N2olR/WeIpm9zjqEqQmskzwlVswdJPqs6R5L+7t+cg7H
   l+bwdEIG0WsTHxWd/AglRn/XUPdiFUieoTqU0zD3lXhYacoOLdGk9IgXb
   f7g29fh+K4VJO87t79kbbWYU3Q57PVhrRbMflPf9hbwlRMX4do5nwRv3y
   ben6+dcKZauFpbo69MLpqpRJuLsPdtj2NLOKgXpGVXVcK9g0CvSZrWgpg
   +o6M/cw2kYN1NIexmFcX6cfhogssKk79AdLuwCaGA3kFOSSl3hmK1btwI
   PSTXIgeMVXVQNDUxoqG1T54F1cU1So6EZ293/fcaH07RLTw9CKFdKGLQ0
   A==;
X-CSE-ConnectionGUID: o+f7ULPrTyems4pQE9DxVg==
X-CSE-MsgGUID: gbb0+Y+fQJiP8AzOazljCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32076754"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="32076754"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 08:12:21 -0800
X-CSE-ConnectionGUID: Ac9d4fPASWqp2VLtHGgnrw==
X-CSE-MsgGUID: suZu/fPKSgKRVNCEwBaFog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="91102598"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Nov 2024 08:12:20 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tE9mz-00038t-1X;
	Thu, 21 Nov 2024 16:12:17 +0000
Date: Fri, 22 Nov 2024 00:11:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 2/9] riscv: dts: Add display property
Message-ID: <202411212311.TMkrPObX-lkp@intel.com>
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
In-Reply-To: <20241120061848.196754-3-keith.zhao@starfivetech.com>
References: <20241120061848.196754-3-keith.zhao@starfivetech.com>
TO: keith zhao <keith.zhao@starfivetech.com>
TO: devicetree@vger.kernel.org
TO: dri-devel@lists.freedesktop.org
CC: andrzej.hajda@intel.com
CC: neil.armstrong@linaro.org
CC: rfoss@kernel.org
CC: Laurent.pinchart@ideasonboard.com
CC: jonas@kwiboo.se
CC: jernej.skrabec@gmail.com
CC: maarten.lankhorst@linux.intel.com
CC: mripard@kernel.org
CC: tzimmermann@suse.de
CC: airlied@gmail.com
CC: simona@ffwll.ch
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: hjc@rock-chips.com
CC: heiko@sntech.de
CC: andy.yan@rock-chips.com
CC: william.qiu@starfivetech.com
CC: xingyu.wu@starfivetech.com
CC: kernel@esmil.dk
CC: paul.walmsley@sifive.com
CC: palmer@dabbelt.com
CC: aou@eecs.berkeley.edu
CC: p.zabel@pengutronix.de
CC: changhuang.liang@starfivetech.com
CC: keith.zhao@starfivetech.com
CC: jack.zhu@starfivetech.com
CC: linux-kernel@vger.kernel.org

Hi keith,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on drm-misc/drm-misc-next v6.12 next-20241121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/keith-zhao/dt-bindings-display-bindings-for-starfive-JH7110-display-pipeline/20241121-145710
base:   linus/master
patch link:    https://lore.kernel.org/r/20241120061848.196754-3-keith.zhao%40starfivetech.com
patch subject: [PATCH v5 2/9] riscv: dts: Add display property
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: riscv-randconfig-052-20241121 (https://download.01.org/0day-ci/archive/20241121/202411212311.TMkrPObX-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev1+gcabb5b9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411212311.TMkrPObX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411212311.TMkrPObX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/starfive/jh7110-common.dtsi:107.19-117.5: Warning (graph_child_address): /soc/lcd-controller@29400000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary

vim +107 arch/riscv/boot/dts/starfive/jh7110-common.dtsi

ac9a37e2d6b637 Jisheng Zhang 2024-04-29  100  
231c32e8f23388 keith zhao    2024-11-20  101  &dc8200 {
231c32e8f23388 keith zhao    2024-11-20  102  	status = "okay";
231c32e8f23388 keith zhao    2024-11-20  103  	crtc_out: ports {
231c32e8f23388 keith zhao    2024-11-20  104  		#address-cells = <1>;
231c32e8f23388 keith zhao    2024-11-20  105  		#size-cells = <0>;
231c32e8f23388 keith zhao    2024-11-20  106  
231c32e8f23388 keith zhao    2024-11-20 @107  		dc_out0: port@0 {
231c32e8f23388 keith zhao    2024-11-20  108  			reg = <0>;
231c32e8f23388 keith zhao    2024-11-20  109  			#address-cells = <1>;
231c32e8f23388 keith zhao    2024-11-20  110  			#size-cells = <0>;
231c32e8f23388 keith zhao    2024-11-20  111  
231c32e8f23388 keith zhao    2024-11-20  112  			dc_out_dpi0: endpoint@0 {
231c32e8f23388 keith zhao    2024-11-20  113  				reg = <0>;
231c32e8f23388 keith zhao    2024-11-20  114  				remote-endpoint = <&hdmi_enc>;
231c32e8f23388 keith zhao    2024-11-20  115  			};
231c32e8f23388 keith zhao    2024-11-20  116  
231c32e8f23388 keith zhao    2024-11-20  117  		};
231c32e8f23388 keith zhao    2024-11-20  118  
231c32e8f23388 keith zhao    2024-11-20  119  		dc_out1: port@1 {
231c32e8f23388 keith zhao    2024-11-20  120  			reg = <1>;
231c32e8f23388 keith zhao    2024-11-20  121  			#address-cells = <1>;
231c32e8f23388 keith zhao    2024-11-20  122  			#size-cells = <0>;
231c32e8f23388 keith zhao    2024-11-20  123  
231c32e8f23388 keith zhao    2024-11-20  124  			dc_out_dpi1: endpoint@1 {
231c32e8f23388 keith zhao    2024-11-20  125  				reg = <1>;
231c32e8f23388 keith zhao    2024-11-20  126  				//remote-endpoint = <&dsi_enc>;
231c32e8f23388 keith zhao    2024-11-20  127  			};
231c32e8f23388 keith zhao    2024-11-20  128  
231c32e8f23388 keith zhao    2024-11-20  129  		};
231c32e8f23388 keith zhao    2024-11-20  130  	};
231c32e8f23388 keith zhao    2024-11-20  131  };
231c32e8f23388 keith zhao    2024-11-20  132  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
