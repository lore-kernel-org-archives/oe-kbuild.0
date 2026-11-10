Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333364;
	b=y+aF8QWL0P8i54znBu24sa/R+xzU5V2myqd4vH2S5FhFF6JZlEQS10Vw7tjO4rlsJpvj
	 AMFqRp5zZNzkBynC5pgolzoC4mOvpRJY2pb9LeUp5QHqmR4MilfpEh2+UTcMdvXkU6BhJ
	 oT8986YH0nlvyYBo8Pf1AIGHOwqXVCoGT4cY/Y7MV/CetglolPkoDfXtd1P8X8UblZdW3
	 1JxCdK8Jhs7n3cDIz6+gYFMqJ5hZkYyOT+K+jxFUR39SRtMm4TXr71us8kKXLwnJle5bv
	 gnA8rArvL0Ihk3l6ZGoSeD8nSQuhVkaZM4vyJRhYMzwfIYkM/h8adH9Hq2oE5atbN1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333364;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=BxB+RkmTK0a5mO0rY1onFEONlaN3YfaR5qWz1zFuxKs=;
	b=swguhzGw0y+jybZ7/BHWA7WQ5/NbYWM6UuNwK7kUkldYmGShFmT+ZeTMQ00retDfGorR
	 eiC7d4TLdQFXrtpqzaLWHVmZs8FaIPWJmcqivuQ7bENKkU6sGoMd+f8rGkINyU1Oy2sHY
	 J1dH2bvkM83z+N7OgK/uPWH4hs2PxpGB1mmUMToQlQNa8O5fEBYHGrDbF5s7bDj+WdniZ
	 Q5BM6zHSeUQdlLF5UUG2yqfSOPoxy2eVsNr7UyOMLxfIQWN61gdiAe7hT2JZWOvmR7xUy
	 RWkt5Vn/IrmR+83wVaeDMCfJptpDOonJRmdkPrAEX/QI+U1TvxkXegJxyicgLA6ATVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R1Tefwjq;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6248606A206
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Nov 2026 17:56:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6248606A206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R1Tefwjq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794333364; x=1825869364;
  h=date:from:to:cc:subject:message-id;
  bh=62n4Y0a/fCCf9ZXpO0E6TDV94RSebLH1HIzEGzzBKFU=;
  b=R1TefwjqeC2Nq+sUC41ZSFNq4lXcXF1z4o6BCII2upEAy6nwOYGLBgg5
   Q40p0qPfCrCxt92TW7ZR1iuwIEuDww51xlBCfHmVdJkBJN4usjIm5jF2C
   wH6yg3S31GylftK6e3PS6FPcvHlhTAc9mWmo8KhH7WspCI0DudvdQeMTO
   GLrmiGJZkLJL5syK5dxnG/cCLFeovnonVGLxJ6v5W9fzDLaudBUblRuLu
   gsvozXrZIpcWli5hNSqgVoD5eCwObdoZjAvF+GjgC0VIQg3qesjw0iVz8
   oAkb86H2zdBcvCce6OQLFiCHXCWYY8VNSaw8JTeodQgzAsSkHgrxWnr1u
   g==;
X-CSE-ConnectionGUID: RW4l0BwVR1WKXsgmRUoz1w==
X-CSE-MsgGUID: Kc3LTTVDS0WVriOdGrayhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3115526"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3115526"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 09:56:04 -0800
X-CSE-ConnectionGUID: 4D6oIqhsQDyTfQliRLB+TQ==
X-CSE-MsgGUID: HbqF2yrxTOO2mdP4GbWb1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="10084610"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 10 Nov 2026 09:56:03 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQq4e-000000000Jz-1JvO;
	Tue, 10 Nov 2026 17:56:00 +0000
Date: Tue, 10 Nov 2026 18:55:27 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm32-for-7.5 1/33]
 arch/arm/boot/dts/qcom/qcom-kuno-idp.dtb: / (qcom,kuno-idp): False schema
 does not allow {'device_type': ['memory'], 'reg': [[0, 0]]}
Message-ID: <202611101833.G7LTXoJv-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Dmitry Baryshkov <lumag@kernel.org>
CC: Linus Walleij <linusw@kernel.org>
CC: Abel Vesa <abel.vesa@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm32-for-7.5
head:   ae2005cea2e4f84692268e54199bb03f5c6f4558
commit: 7f6a63bc5fc9bed3fac66ac57000882926d25f84 [1/33] ARM: dts: qcom: Add initial device tree for Kuno SoC
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261110/202611101833.G7LTXoJv-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261110/202611101833.G7LTXoJv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611101833.G7LTXoJv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/qcom/qcom-kuno.dtsi:89.9-93.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/qcom/qcom-kuno-idp.dtb: / (qcom,kuno-idp): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/qcom/qcom-kuno-idp.dtb: geniqup@9c0000 (qcom,geni-se-qup): #address-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
   arch/arm/boot/dts/qcom/qcom-kuno-idp.dtb: geniqup@9c0000 (qcom,geni-se-qup): #size-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
