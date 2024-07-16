Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B17956B7C
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Jul 2024 22:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721167223; cv=none; b=iH4Ntjy+o6zqkNzFdBOSP7k0di/TFjFeUR9J8L6ka3YZErGCo918DGFEk+my1D8z6TrwvCpN2revtUpcT+v6LjuVGCkIFPT6vAxE9fw2r/1Z6yxAUbdqlyNpH8LFl8S6wZ2a8I+1FPhzzIIOGKEGeTqxOkJruc4oZuoefDbEP6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721167223; c=relaxed/simple;
	bh=oo2AT8VFL+nQsJJs1Q0F8Pkw7+1Jk6X1taowzVph1Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j7tUDR0WKVNnVfSi3fUfkwRgMJaVU+lQmey5pXdWE6dLsNoZ/hCv5HjcAjkCF61HvQnMgk+X4K+bvo1dULHBV2XRp67NgMscMz/KdoALuznDKUcyuO5uKaMYeuLtZLGRM6gypT+zBLPczaRganQjNx8OzucgTq3IysvLz+RtsTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kw2Nrqw9; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kw2Nrqw9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721167221; x=1752703221;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oo2AT8VFL+nQsJJs1Q0F8Pkw7+1Jk6X1taowzVph1Tg=;
  b=kw2Nrqw9LWNJUmNUTzkhss+Ndw7yhr6j7QA/3slOHaXhLRiHoRtXpw6K
   /oXwJgn9/PBsUoDHPyDZw3b/lGXYumfMgmxbiEmlqsIqdFZWmvkvTx2a8
   p4Ef1E8seh+dv7Wv7xkMuDcfjmTJZVvE7Ostl/+FZHEKLYuKJhb/eLB11
   3ccVQ5dkxjEv2aW2An6w0v/S1KYvXR6FGkxjYD3sImEQemsfKiF5q12Jb
   L5aI6Bi8Sqjy0EcwNah9v5sX/B/BgNBSQ2LiLwB0BMJtm3dVSfOuzwXf9
   vCmT2AtO9YhiFxvorkdomRl6WFRhIwzUKYftrkePOoAYT5EobMPRie7rV
   g==;
X-CSE-ConnectionGUID: q46YlgXYRaaWyFu52yNk/w==
X-CSE-MsgGUID: NOFuTyUGRZqP1xXM/a2RrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="29312242"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="29312242"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 15:00:19 -0700
X-CSE-ConnectionGUID: x1Nd1dnDRweVBHD3WT7MHQ==
X-CSE-MsgGUID: IMtt87DzRM2N6fEWDqhbqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="50901289"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Jul 2024 15:00:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTqDX-000fi2-3D;
	Tue, 16 Jul 2024 22:00:15 +0000
Date: Wed, 17 Jul 2024 05:59:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: add Firefly CORE PX30 JD4
Message-ID: <202407170524.Pc8MMP6B-lkp@intel.com>
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
In-Reply-To: <20240716-rockchip-px30-firefly-v1-2-60cdad3023a3@collabora.com>
References: <20240716-rockchip-px30-firefly-v1-2-60cdad3023a3@collabora.com>
TO: Christopher Obbard <chris.obbard@collabora.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Heiko Stuebner <heiko@sntech.de>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Kever Yang <kever.yang@rock-chips.com>
CC: Christopher Obbard <chris.obbard@collabora.com>

Hi Christopher,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d67978318827d06f1c0fa4c31343a279e9df6fde]

url:    https://github.com/intel-lab-lkp/linux/commits/Christopher-Obbard/dt-bindings-arm-rockchip-add-Firefly-CORE-PX30-JD4/20240717-042608
base:   d67978318827d06f1c0fa4c31343a279e9df6fde
patch link:    https://lore.kernel.org/r/20240716-rockchip-px30-firefly-v1-2-60cdad3023a3%40collabora.com
patch subject: [PATCH 2/2] arm64: dts: rockchip: add Firefly CORE PX30 JD4
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: arm64-randconfig-051-20240717 (https://download.01.org/0day-ci/archive/20240717/202407170524.Pc8MMP6B-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240717/202407170524.Pc8MMP6B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407170524.Pc8MMP6B-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/px30.dtsi:351.26-371.4: Warning (avoid_unnecessary_addr_size): /syscon@ff010000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/px30.dtsi:453.23-497.4: Warning (avoid_unnecessary_addr_size): /syscon@ff140000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/px30-firefly-core-px30-jd4.dts:142.9-153.5: Warning (graph_child_address): /dsi@ff450000/panel@0/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/px30-firefly-core-px30-jd4.dtb: /dsi@ff450000/panel@0: failed to match any schema with compatible: ['sitronix,st7703']

vim +142 arch/arm64/boot/dts/rockchip/px30-firefly-core-px30-jd4.dts

28e7b005c693279 Christopher Obbard 2024-07-16  121  
28e7b005c693279 Christopher Obbard 2024-07-16  122  &dsi {
28e7b005c693279 Christopher Obbard 2024-07-16  123  	status = "okay";
28e7b005c693279 Christopher Obbard 2024-07-16  124  
28e7b005c693279 Christopher Obbard 2024-07-16  125  	ports {
28e7b005c693279 Christopher Obbard 2024-07-16  126  		mipi_out: port@1 {
28e7b005c693279 Christopher Obbard 2024-07-16  127  			reg = <1>;
28e7b005c693279 Christopher Obbard 2024-07-16  128  
28e7b005c693279 Christopher Obbard 2024-07-16  129  			mipi_out_panel: endpoint {
28e7b005c693279 Christopher Obbard 2024-07-16  130  				remote-endpoint = <&mipi_in_panel>;
28e7b005c693279 Christopher Obbard 2024-07-16  131  			};
28e7b005c693279 Christopher Obbard 2024-07-16  132  		};
28e7b005c693279 Christopher Obbard 2024-07-16  133  	};
28e7b005c693279 Christopher Obbard 2024-07-16  134  
28e7b005c693279 Christopher Obbard 2024-07-16  135  	panel@0 {
28e7b005c693279 Christopher Obbard 2024-07-16  136  		compatible = "sitronix,st7703";
28e7b005c693279 Christopher Obbard 2024-07-16  137  		reg = <0>;
28e7b005c693279 Christopher Obbard 2024-07-16  138  		backlight = <&backlight>;
28e7b005c693279 Christopher Obbard 2024-07-16  139  		iovcc-supply = <&vcc_1v8>;
28e7b005c693279 Christopher Obbard 2024-07-16  140  		vci-supply = <&vcc3v3_lcd>;
28e7b005c693279 Christopher Obbard 2024-07-16  141  
28e7b005c693279 Christopher Obbard 2024-07-16 @142  		ports {
28e7b005c693279 Christopher Obbard 2024-07-16  143  			#address-cells = <1>;
28e7b005c693279 Christopher Obbard 2024-07-16  144  			#size-cells = <0>;
28e7b005c693279 Christopher Obbard 2024-07-16  145  
28e7b005c693279 Christopher Obbard 2024-07-16  146  			port@0 {
28e7b005c693279 Christopher Obbard 2024-07-16  147  				reg = <0>;
28e7b005c693279 Christopher Obbard 2024-07-16  148  
28e7b005c693279 Christopher Obbard 2024-07-16  149  				mipi_in_panel: endpoint {
28e7b005c693279 Christopher Obbard 2024-07-16  150  					remote-endpoint = <&mipi_out_panel>;
28e7b005c693279 Christopher Obbard 2024-07-16  151  				};
28e7b005c693279 Christopher Obbard 2024-07-16  152  			};
28e7b005c693279 Christopher Obbard 2024-07-16  153  		};
28e7b005c693279 Christopher Obbard 2024-07-16  154  	};
28e7b005c693279 Christopher Obbard 2024-07-16  155  };
28e7b005c693279 Christopher Obbard 2024-07-16  156  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
