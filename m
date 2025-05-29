Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F145C8EB
	for <oe-kbuild@lists.linux.dev>; Thu, 29 May 2025 07:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748502465; cv=none; b=d91RtdQgjzz7Wh1cECFRXJeEgdratERngMnwKBGaqTOubAZXMk96Jcq2vierAHhIOQ/rGvFAIw2l1mrflN/6KIogsKhU14yG37W0feYz8KTC4apA1fd1J5yN8w6rA9lkUCcHwiIb+gPFPDITrUSh/fdFpaJLCTRrRWeQOzSIs8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748502465; c=relaxed/simple;
	bh=LAZBNGYGltJM9LgWqECNkmlA5VcXkf2X/7F6anB8G7s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QtrxCv91uYpwTur9yILv82r7IUIaYGmYNnN5KpfCOUa6RWUn8RNJiio6kHoDNFnNXzBtTjK/SmmVpbVH1AZZjPHAfjDl/txxR1/cVPgV6dT1BrFq3l2P+jUjw1ej2FxLij7iNXu72XqMFbj58NynxCjwEKFy+eNVfW+rvGXKEZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DHsDKWrf; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DHsDKWrf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748502463; x=1780038463;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LAZBNGYGltJM9LgWqECNkmlA5VcXkf2X/7F6anB8G7s=;
  b=DHsDKWrfwyP7f2PPDALR3Jh4P9KW/jUrYgeE9QpCgXmHbKYMc7dM7RiC
   m/dzH63P76iOU1hsV/cVQjwbAGasG7VdDtHVwOiiXVQFlKvLSbUKpu71l
   o9i6fQEBTNLQq56r7mrACtsfsokcXD0xTTovHrTWR8TphbAAbcntAqvkB
   kSx6XlirZbj+Y6QfOWvqmDxk1YUN5ITe2hmJM970ocehafMybnO+57vti
   1TBk831zzkxSXRtzOYjn6E80J/6FQR+bIAeu5ForiCViku8MKmTBaSlRu
   05nElfAcqa0aNTMr/TqApsiFut5FudXyOEX2cXhx0X/2Qeaj1Kg883pfS
   g==;
X-CSE-ConnectionGUID: YJ9Wu5VxS2CzphgvC+kK0g==
X-CSE-MsgGUID: TCI/umxvSq2crBRGTnpPEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="38175229"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; 
   d="scan'208";a="38175229"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 00:07:41 -0700
X-CSE-ConnectionGUID: CFldEJzISwynY+p6eGxZdg==
X-CSE-MsgGUID: y/ivvOIgTQaLPBs0QssMuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; 
   d="scan'208";a="144117483"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 May 2025 00:07:41 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKXMY-000WPy-1I;
	Thu, 29 May 2025 07:07:38 +0000
Date: Thu, 29 May 2025 15:07:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [openeuler:OLK-5.10 2932/2932]
 Documentation/devicetree/bindings/iio/addac/adi,ad74413r.yaml: adi,ch-func:
 Missing additionalProperties/unevaluatedProperties constraint
Message-ID: <202505291536.8a44hWAc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/iio/addac/adi,ad74413r.yaml: adi,ch-func: Missing additionalProperties/unevaluatedProperties constraint"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   575aae1f5e3c68beaad52ec2ae01c5f4f9959245
commit: e25e57f7c34051c1abec1fe6060a4af915f71b5f [2932/2932] dt-bindings: iio: add AD74413R
:::::: branch date: 6 hours ago
:::::: commit date: 1 year, 3 months ago
config: arm64-randconfig-052-20250529 (https://download.01.org/0day-ci/archive/20250529/202505291536.8a44hWAc-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250529/202505291536.8a44hWAc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505291536.8a44hWAc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-axi-clk.yaml: title: 'Allwinner A10 AXI Clock Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/thermal/imx-thermal.yaml: title: 'NXP i.MX Thermal Binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/net/can/can-controller.yaml: title: 'CAN Controller Generic Binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/iio/addac/adi,ad74413r.yaml: adi,ch-func: Missing additionalProperties/unevaluatedProperties constraint

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
