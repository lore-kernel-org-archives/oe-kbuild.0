Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FE7171E69
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Aug 2024 11:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723031657; cv=none; b=guxC24ZLERiK0j7xVwMVl4Dj6ohgFNBzhw60kI4iWWdMp0AgXEVgwhPrag8x/TOcdkjLE952I+4+AeI2FagHIY6VOU29j+VMUNd12QeSj2xFknyc8bhH6txVtI1hJ82vRjU+U6gqwGlBEpDumME8eYrOT11SzB6WDi57l+exWQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723031657; c=relaxed/simple;
	bh=8jmIUJ1aAAeTrtwGagGhQgRkmNpVNE3K1KhFTxJ8kpE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZIn64RmSt6t8BSIrlr0sQreNtlBgw80JD3hW3DkIWhkBUG3ngMlUBs2wjPxs7wHIhFsRyKvKyZ8vZaQrSNcE/riAh5J6YbDb4wwfosSY9q8Rw+ua1loYPGElWK5e+UHAI4g/bF4PssWu6ILycCvIlGUQVW9WB4hTK/gs1IXR6zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JLeDT/1P; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JLeDT/1P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723031657; x=1754567657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8jmIUJ1aAAeTrtwGagGhQgRkmNpVNE3K1KhFTxJ8kpE=;
  b=JLeDT/1PWIMo9WhUWArHx5JKdYkuJcCkc5rJCwxRqSiZi4zrpPw5F6CS
   wQgZ21xgHIzngGAq29l/5CEBl0GFD/INXP7PkoOLLWxHX2UjCh6zHxVq5
   HPDM7hR53TW/vLdUbS8BZ+N20n3PVq1anljGrucfMq7ncTPyCKSswrx1F
   GTPwnE6dATnE+p3jLkk9UiY7Ce5QARfzhhQqnypX8lWxZVsv1Ar6MT5RL
   a99BjWtQl38idWaRaHlbbH78T15EfsXy9Tu83W0Zs5Fo6uUNEhiDv2Vl8
   RwuNh/mRremxrB+Xd7yA2nYkKhG1MkTPpVZ8E/thgvkfeT4K8Y8qIX0ll
   w==;
X-CSE-ConnectionGUID: zme4Nn9XTxiS65PmuPFPvA==
X-CSE-MsgGUID: MUddXpwiTVmFOV4bIrGr7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="21242055"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="21242055"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 04:54:16 -0700
X-CSE-ConnectionGUID: 9+tMIeiCQumo75XzGOXxKQ==
X-CSE-MsgGUID: KIaLwC3nQi+LPWNsPT7YeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="87768433"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 07 Aug 2024 04:54:14 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbfF6-0005Le-0g;
	Wed, 07 Aug 2024 11:54:12 +0000
Date: Wed, 7 Aug 2024 19:53:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:wip/debug/soundwire-wsa884x-interrupts 29894/30000]
 Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml:
 address-cells: missing type definition
Message-ID: <202408071923.RRYgR3RR-lkp@intel.com>
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
TO: Dikshita Agarwal <quic_dikshita@quicinc.com>
CC: Abel Vesa <abel.vesa@linaro.org>
CC: Vikash Garodia <quic_vgarodia@quicinc.com>
CC: linux-doc@vger.kernel.org

tree:   https://github.com/krzk/linux wip/debug/soundwire-wsa884x-interrupts
head:   77aa965762ad9c8711d005628b5c471007e0df82
commit: c338340959227650ac01be812a1e86a8d305aa76 [29894/30000] dt-bindings: media: Add sm8550 dt schema
:::::: branch date: 3 hours ago
:::::: commit date: 3 months ago
config: arc-randconfig-051-20240807 (https://download.01.org/0day-ci/archive/20240807/202408071923.RRYgR3RR-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408071923.RRYgR3RR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408071923.RRYgR3RR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml: address-cells: missing type definition
>> Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml: size-cells: missing type definition
   Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
