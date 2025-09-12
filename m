Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E1626D4EF
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Sep 2025 23:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757720621; cv=none; b=c6ukCCsyxrVKQBjn/dJV/CXOO5+kJ/sny+Yx4YBKgiLpIlGe47qlr/kBepOSNpQMx+JTZ9K7Ki0n+XX1TO7osm9OTKOgS7tdtWJjoAwJ5J2rSfQ5r2Je70zhy+q6g1oXa8Q7hUflUjoYier6UrIH7xLZu3L/Kd2lNYKj+cG8a7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757720621; c=relaxed/simple;
	bh=Wjtw+envCNH3S6Iq2LdW82AHZ6g4NnUa4K0AwQ4kAsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bXRZB13WLu2vOfzNMt8hFrdFfkyEYv0PSl2gLrYqZ0FNQl8D0oT5q9CRhras9kn1BJ+c1PYIEaG1nNT6tT1W/QK8pjU5pSLsXGzisPZ0QEhSljl8IYvqafQ4m/mN7RWy71zz3pLCHVzx1FwGpo8TytAoaqxvtdzZxIn31IyJPKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l0cb1xCE; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l0cb1xCE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757720620; x=1789256620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wjtw+envCNH3S6Iq2LdW82AHZ6g4NnUa4K0AwQ4kAsQ=;
  b=l0cb1xCEdrsXDWpJ6Hk7Z0IRDJDFzlRGd0A0tsl3M5TmqTRqxN3HSjsV
   dlLn52O79MW9kdpL0aoatx8d4DBoCuC7PUpcfknY1YJn7g7T0y5f7LhPS
   WL6XFHv6Wy6vV4xOzooANMLu94XnvR75/e6Av7KREy7c/X8ko89JxImNM
   o5To4ooON0CD/fA5TwISJT3e1df0r1O0iATQr3xOddlYPso71dZ3v6iIc
   6vl2MITJ7R/B9ECA13t/lCT6+xnPojXhuE1LdF4p92omdjaXdfGVpfRtp
   FoqllkZDTyiSwFwtk0zXEx/BN5ibvR20+8fx+Nlqa7Pk3mQh2+h9AadBH
   w==;
X-CSE-ConnectionGUID: YI3ixYocTNmuxPepj8xzoA==
X-CSE-MsgGUID: YRlIQSLSQPCg9+prOFXhpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="70752829"
X-IronPort-AV: E=Sophos;i="6.18,260,1751266800"; 
   d="scan'208";a="70752829"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 16:43:39 -0700
X-CSE-ConnectionGUID: o4N+nfYQTrOlPkEu9yDpGA==
X-CSE-MsgGUID: UKfoax7RQECFA/fHrwvoqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,260,1751266800"; 
   d="scan'208";a="179278298"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 12 Sep 2025 16:43:39 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxDQV-0001G0-2g;
	Fri, 12 Sep 2025 23:43:35 +0000
Date: Sat, 13 Sep 2025 07:42:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcm6490: Introduce the Particle
 Tachyon
Message-ID: <202509130703.fL12MzAN-lkp@intel.com>
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
In-Reply-To: <20250910-tachyon-v1-3-5090bfd133e0@oss.qualcomm.com>
References: <20250910-tachyon-v1-3-5090bfd133e0@oss.qualcomm.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Bjorn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 5f540c4aade9f1d58fb7b9490b4b7d5214ec9746]

url:    https://github.com/intel-lab-lkp/linux/commits/Bjorn-Andersson/dt-bindings-vendor-prefixes-Add-Particle-Industries/20250911-070652
base:   5f540c4aade9f1d58fb7b9490b4b7d5214ec9746
patch link:    https://lore.kernel.org/r/20250910-tachyon-v1-3-5090bfd133e0%40oss.qualcomm.com
patch subject: [PATCH 3/3] arm64: dts: qcom: qcm6490: Introduce the Particle Tachyon
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250912 (https://download.01.org/0day-ci/archive/20250913/202509130703.fL12MzAN-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250913/202509130703.fL12MzAN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509130703.fL12MzAN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:5045.26-5118.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4317.10-4327.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dtb: edp@aea0000 (qcom,sc7280-edp): reg: [[0, 183107584, 0, 512], [0, 183108096, 0, 512], [0, 183108608, 0, 3072], [0, 183111680, 0, 1024]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
