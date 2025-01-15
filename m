Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7362459B0
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Jan 2025 13:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736946243; cv=none; b=jXNdpyB7A/fMIChElR7yUzjdNGbrkHLoyJlELzNTU3HBWfevQtQlXgRcJFpS/39fgTPvK+h4oXCtwG7BCz2X6YSksXFWYTseP8kkkzK/CMOI8H/Pj9kILpxuW0Y2U0oMj/o5dPaisdFcpKA1PVXTgrBtASPhVLV1FdewKYlLi3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736946243; c=relaxed/simple;
	bh=BY5iBNeOZwxlSgFX1+mCkRDFp/70cxT6fdosMsQdK0A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QZ+KTHbIJzTWuTFEVcAsdGW3wldYIHa0Z2rkSzNHxLWCR+zFE184eVpmhCbVV1s20KVCYmgF65Od6/LCCWwmjWX3HxrdOIxS8PuqVkvM+I1EYcNl0w0FmN6LKCcO1t9oCpczvC7MbT9bhsuAvPprJiywN4nsKZ1QX9H0hZu6mFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hpTW5gDM; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hpTW5gDM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736946241; x=1768482241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BY5iBNeOZwxlSgFX1+mCkRDFp/70cxT6fdosMsQdK0A=;
  b=hpTW5gDM9E8CmtCllm4AfCwsAhfNt+gl0DyZWit/5Fh1tWzn0mGD0clw
   qXBOIrAmDy2XYzQFko43Swa0OnSu6a1tqI7vgZtYXaqsgossaI+5MVcsn
   7hzhs7rPcEdvHnUDRM+EFgbsowxX5t3WNx5MpXl+Lj6WGdYEntKICZZdZ
   Gyw+NKtQg7EHn8oL6G7EKQrrbg0VSPYZhcnJAX/4cSjBRoaBYAI0kDC9o
   xR1ugkZvI9gg4tkTxw90H45srS3VUb1KW3uIJ5LrsPAtHvnMzCWx1ziEY
   b8RRs1d4AdG/+CgRJuP3YY/atFVne7QHse0p/cim6bG68nrT2YIZiBbvT
   w==;
X-CSE-ConnectionGUID: /K2M632+SNaEtzdW9eAgTg==
X-CSE-MsgGUID: hSOFmGnwQu2A12LDlbgiUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="59759796"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; 
   d="scan'208";a="59759796"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 05:04:01 -0800
X-CSE-ConnectionGUID: nJ4zG0F5TCGChpGq5S97Wg==
X-CSE-MsgGUID: MxiKb8GBQpGPZEWXSlp6cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; 
   d="scan'208";a="110111113"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Jan 2025 05:04:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tY33t-000QM3-17;
	Wed, 15 Jan 2025 13:03:57 +0000
Date: Wed, 15 Jan 2025 21:03:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:sound-sample-2025-01-14 20/20]
 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb:
 audio-graph-card2-custom-sample1: 'broken-usage-of-incorrect-compatible' is
 a required property
Message-ID: <202501152014.57YT9OvF-lkp@intel.com>
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
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://github.com/morimoto/linux sound-sample-2025-01-14
head:   d1ff21853791f7db49a754b9f290024c37ef058f
commit: d1ff21853791f7db49a754b9f290024c37ef058f [20/20] hoge
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: arm64-randconfig-051-20250115 (https://download.01.org/0day-ci/archive/20250115/202501152014.57YT9OvF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250115/202501152014.57YT9OvF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501152014.57YT9OvF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb: audio-graph-card2-custom-sample1: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb: audio-graph-card2-custom-sample1: 'links', 'multi' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb: audio-graph-card2-custom-sample2: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb: audio-graph-card2-custom-sample2: 'codec2codec', 'dpcm', 'links', 'multi', 'routing' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb: audio-graph-card2-custom-sample1: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb: audio-graph-card2-custom-sample1: 'links', 'multi' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb: audio-graph-card2-custom-sample2: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb: audio-graph-card2-custom-sample2: 'codec2codec', 'dpcm', 'links', 'multi', 'routing' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77961-ulcb.dtb: audio-graph-card2-custom-sample1: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/arm64/boot/dts/renesas/r8a77961-ulcb.dtb: audio-graph-card2-custom-sample1: 'links', 'multi' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/arm64/boot/dts/renesas/r8a77961-ulcb.dtb: audio-graph-card2-custom-sample2: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/arm64/boot/dts/renesas/r8a77961-ulcb.dtb: audio-graph-card2-custom-sample2: 'codec2codec', 'dpcm', 'links', 'multi', 'routing' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dtb: audio-graph-card2-custom-sample1: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dtb: audio-graph-card2-custom-sample1: 'links', 'multi' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dtb: audio-graph-card2-custom-sample2: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dtb: audio-graph-card2-custom-sample2: 'codec2codec', 'dpcm', 'links', 'multi', 'routing' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77965-ulcb.dtb: audio-graph-card2-custom-sample1: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/arm64/boot/dts/renesas/r8a77965-ulcb.dtb: audio-graph-card2-custom-sample1: 'links', 'multi' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/arm64/boot/dts/renesas/r8a77965-ulcb.dtb: audio-graph-card2-custom-sample2: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/arm64/boot/dts/renesas/r8a77965-ulcb.dtb: audio-graph-card2-custom-sample2: 'codec2codec', 'dpcm', 'links', 'multi', 'routing' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dtb: audio-graph-card2-custom-sample1: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dtb: audio-graph-card2-custom-sample1: 'links', 'multi' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dtb: audio-graph-card2-custom-sample2: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dtb: audio-graph-card2-custom-sample2: 'codec2codec', 'dpcm', 'links', 'multi', 'routing' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dtb: audio-graph-card2-custom-sample1: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dtb: audio-graph-card2-custom-sample1: 'links', 'multi' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dtb: audio-graph-card2-custom-sample2: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dtb: audio-graph-card2-custom-sample2: 'codec2codec', 'dpcm', 'links', 'multi', 'routing' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dtb: audio-graph-card2-custom-sample1: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dtb: audio-graph-card2-custom-sample1: 'links', 'multi' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dtb: audio-graph-card2-custom-sample2: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dtb: audio-graph-card2-custom-sample2: 'codec2codec', 'dpcm', 'links', 'multi', 'routing' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77951-ulcb.dtb: audio-graph-card2-custom-sample1: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/arm64/boot/dts/renesas/r8a77951-ulcb.dtb: audio-graph-card2-custom-sample1: 'links', 'multi' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/arm64/boot/dts/renesas/r8a77951-ulcb.dtb: audio-graph-card2-custom-sample2: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/arm64/boot/dts/renesas/r8a77951-ulcb.dtb: audio-graph-card2-custom-sample2: 'codec2codec', 'dpcm', 'links', 'multi', 'routing' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: audio-graph-card2-custom-sample1: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: audio-graph-card2-custom-sample1: 'links', 'multi' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: audio-graph-card2-custom-sample2: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: audio-graph-card2-custom-sample2: 'codec2codec', 'dpcm', 'links', 'multi', 'routing' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a779m1-ulcb.dtb: audio-graph-card2-custom-sample1: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/arm64/boot/dts/renesas/r8a779m1-ulcb.dtb: audio-graph-card2-custom-sample1: 'links', 'multi' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/arm64/boot/dts/renesas/r8a779m1-ulcb.dtb: audio-graph-card2-custom-sample2: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/arm64/boot/dts/renesas/r8a779m1-ulcb.dtb: audio-graph-card2-custom-sample2: 'codec2codec', 'dpcm', 'links', 'multi', 'routing' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dtb: audio-graph-card2-custom-sample1: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dtb: audio-graph-card2-custom-sample1: 'links', 'multi' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dtb: audio-graph-card2-custom-sample2: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dtb: audio-graph-card2-custom-sample2: 'codec2codec', 'dpcm', 'links', 'multi', 'routing' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
