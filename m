Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3343A8F7
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 00:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764203855; cv=none; b=rYmDjbZDK/rAC+CBLQjKsNLo1CeilZnN68SRPtjgZlXUq/n/mSFzd6SZ4GKRj42irWoPMPmrm4PLY5PpH9jOHiwWCnLYKbesyvD0J2mf/9jJatB8U9YwTuQPn/xsQs0MixFnXOUjzusVpNWXJdKeGIMYcVDzLGRciEaJAE5ty4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764203855; c=relaxed/simple;
	bh=C/A2iWEZYJR7ehnfNYJY1yiLPSVE83azJPD962GGzVg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YKIzsJBdu+bE4qQJ3QO3tzwd0nbGqCqaBTVLpb7NEfBYFgpzo7h7bVeBHdRmdkUryx/zaZ0DXy5uHWse+jyCoq7V4Yy/3gwZfxenlpYRcVjrRoedyUIQz/z2E18AuG0hrd2bOtqoO2GpSdBxIuwHTkpsGwh17VVY7VvCgxbtYwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a+BL1j6l; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a+BL1j6l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764203853; x=1795739853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C/A2iWEZYJR7ehnfNYJY1yiLPSVE83azJPD962GGzVg=;
  b=a+BL1j6lR45GT0xNo0vTDCndSqruj2aFlFZZ2X86aA0u8mwyje+93DvR
   7RK/5OLYSSig9v7YcQ2IRl34Zfwv0F8MTpz1dKGt01xjb33XFQiEpfOPJ
   1Dm7YYn9Pqk5ZMTk9RppGk8NYep0iwszkXwGhDa/7PuH+qnY2g9bXg4BI
   8csx6+YPCJrrS6TuknIsgfTZCfElRZDZWkxb7/vkkL/C3DXm0qQK6Uh85
   XILUC1pHWfbkuXEZUS6eRP1H07Jyw3ckGmBLoGVPeK/cdk0KxYUE89snA
   CoSILevQSUjtrMMU+1CWIOdjn00Cc0oYOE7SbHS1XhaCmdIix+7wtTr4K
   w==;
X-CSE-ConnectionGUID: szvSEGbTSGCBT1U71AA0Hw==
X-CSE-MsgGUID: WL8bBIlLQ0uq3uGqGGje7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="88893736"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="88893736"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 16:37:32 -0800
X-CSE-ConnectionGUID: FV5Eu/wlR6GJVmTnpWhCaQ==
X-CSE-MsgGUID: jkigxyLzRfGda4CBK+3f3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="197417450"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 26 Nov 2025 16:37:32 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOQ0n-000000001Z3-3XkJ;
	Thu, 27 Nov 2025 00:37:29 +0000
Date: Thu, 27 Nov 2025 01:36:36 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thermal:thermal/linux-next 8/10]
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml: ignoring, error
 parsing file
Message-ID: <202511270103.c5CQ5sw3-lkp@intel.com>
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
TO: Gaurav Kohli <quic_gkohli@quicinc.com>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Akhil P Oommen <akhilpo@oss.qualcomm.com>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/linux-next
head:   c411d8bf06992dade7abb88690dc2d467a868cc4
commit: 1ee90870ce797f314168fb08a5cbb0fba8d4dd65 [8/10] dt-bindings: thermal: tsens: Add QCS8300 compatible
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: microblaze-randconfig-2051-20251127 (https://download.01.org/0day-ci/archive/20251127/202511270103.c5CQ5sw3-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.4.0
dtschema version: 2025.9.dev21+gaa859412c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511270103.c5CQ5sw3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511270103.c5CQ5sw3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/thermal/qcom-tsens.yaml: ignoring, error parsing file

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
