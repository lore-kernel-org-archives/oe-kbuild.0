Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795497821;
	b=XxwtCrwe7VwzbxHV1Wm+Xs3sadCtv6KkW/2LaxOwUuPpz/rcZsmrcddSSQTzunMdX5hl
	 966FUigdAxQdBQwBAqdWYfeSicCB+BByLPembgV3sNTKj1eYS87DDMCSfAoDBBjaccK17
	 O+E/Txl3c/W1r4l2CKR+nTGp+2O3JJJdhKdMonJILxaN5xuKgapT4mLDZoRJHiHI2aXZk
	 Om/jYvjLTmNDw6bRZK/UQuAmXmyqlklnlUUoMV4vf+Grddd6SBx1tS99THhZ7Ed6KKhFH
	 jGUSF7CzeDwW5DZy8LyF8i5XizBVPERdmcQ7floe71fttySzltbOKimWRJFj4ErBsag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795497821;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=vx6s3pbnFTT85XGviMYVQ7MJWx9nezhlJrwCm94tcR0=;
	b=oW6dLZSXi2B7MALb1CD7FVKNre477sAXLt2KJUpzxKlvHyQ3CIRW7v6FPBcNIfr9wm9C
	 oGVW7P5MCjn9cKrPZVtLQke7WCItYFSpFjZ4wWzXwqLvFD9loH0YBfKDFC59wnn5vRtxi
	 7q9Yh3uA5qxUMRRrlk7dGaJc81K8p3kGr1ZWlIrSQylqIUebTzKCvDljr9dQh4WYUBBlP
	 51in7mFwyPkTvn/a2axflryYOa3JfTXdCBVQ/LqyPlOKnH65icRCZosw2hv4X9PD8rjQ1
	 4IH45XDbwUs3Nq4LuL93pvQNh16lmmHBhqrqUoSbGilsxWBVB4Zhg9ihkHHgBef6sJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OEyibZoD;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CAF606A32C
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Nov 2026 05:23:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84CAF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OEyibZoD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795497821; x=1827033821;
  h=date:from:to:cc:subject:message-id;
  bh=8Xd12rhBK8qmRkXOmrZRJUc4/XBoM3+chWN3HqkYxNM=;
  b=OEyibZoDES/J5DUB0sJ67g2TkhhY9YDpwdMguDuHM9xFmmRDtlS5f+Bo
   9IDMk+nTTaNb8s3NKUkIjNrr9YOVP5XmudOatM4d5w7uwnAEjXzFnHRoC
   AhK1j8JDcflekxQcScBqropJ4yoapscxce/aJ6FdR32lEKRTtfy/p+RPm
   MtuZ9E2YQtIeZZ+bz0161JyJazBQ++pmF4vCrccXI7z66hmyu9N/1V8qP
   GQ9g0T9aMAoI/V/XO4U8lbc3LTXrJXRtjMn66gv5fXFHqlRYnxZ4jhbLr
   7FVqh5k7vuE1OZd4eKtI2IQAYdrsfnjwF41JmNEAQuwmB/feWXJXzYAZN
   w==;
X-CSE-ConnectionGUID: gPbnAhxCTAKAecICAZ0gzA==
X-CSE-MsgGUID: C0OnCGVIQMqtaGLVLM4F6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4374479"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4374479"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 21:23:05 -0800
X-CSE-ConnectionGUID: pX+PujH2R+ajZcndbKl5nA==
X-CSE-MsgGUID: NTgmv7IiSmWgMuTN+Exa0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="13467845"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 23 Nov 2026 21:23:03 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVizc-0000000058R-27oh;
	Tue, 24 Nov 2026 05:23:00 +0000
Date: Tue, 24 Nov 2026 06:22:47 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sashal-next:soc-next 1124/1154]
 arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: mcde@a0350000 (ste,mcde):
 'epod-supply' is a required property
Message-ID: <20261124062039.pGIsovPp-lkp@intel.com>
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
TO: Linus Walleij <linusw@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-next.git soc-next
head:   15cf567a68ec76fa5331ee8f9a09718ff5b9ea6b
commit: ce2efbd2e360243deaf4b2a7502714da1a50d06d [1124/1154] ARM: dts: ux500: Remove DB8500 EPOD regulators
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261124/20261124062039.pGIsovPp-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261124/20261124062039.pGIsovPp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261124062039.pGIsovPp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: msp@80124000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: msp@80124000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: msp@80125000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: msp@80125000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: mcde@a0350000 (ste,mcde): dsi@a0351000: Unevaluated properties are not allowed ('panel' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/ste,mcde.yaml
>> arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: mcde@a0350000 (ste,mcde): 'epod-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ste,mcde.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: in_nopull: ste,input: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: input_pull_up: ste,input: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: input_pull_down: ste,input: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: output_high: ste,output: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: output_low: ste,output: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: msp@80124000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: msp@80124000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: msp@80125000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: msp@80125000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: mcde@a0350000 (ste,mcde): dsi@a0351000: Unevaluated properties are not allowed ('panel' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/ste,mcde.yaml
>> arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: mcde@a0350000 (ste,mcde): 'epod-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ste,mcde.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: in_nopull: ste,input: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: input_pull_up: ste,input: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: input_pull_down: ste,input: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: output_high: ste,output: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: output_low: ste,output: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: msp@80124000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: msp@80124000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: msp@80125000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: msp@80125000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: mcde@a0350000 (ste,mcde): dsi@a0351000: Unevaluated properties are not allowed ('panel' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/ste,mcde.yaml
>> arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: mcde@a0350000 (ste,mcde): 'epod-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ste,mcde.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: in_nopull: ste,input: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: input_pull_up: ste,input: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: input_pull_down: ste,input: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: output_high: ste,output: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: output_low: ste,output: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: msp@80124000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: msp@80124000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: msp@80125000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: msp@80125000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: mcde@a0350000 (ste,mcde): dsi@a0351000: Unevaluated properties are not allowed ('panel' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/ste,mcde.yaml
>> arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: mcde@a0350000 (ste,mcde): 'epod-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ste,mcde.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: in_nopull: ste,input: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: input_pull_up: ste,input: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: input_pull_down: ste,input: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: output_high: ste,output: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: output_low: ste,output: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: msp@80124000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: msp@80124000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: msp@80125000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: msp@80125000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: mcde@a0350000 (ste,mcde): dsi@a0351000: Unevaluated properties are not allowed ('panel' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/ste,mcde.yaml
>> arch/arm/boot/dts/st/ste-href520-tvk.dtb: mcde@a0350000 (ste,mcde): 'epod-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ste,mcde.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: in_nopull: ste,input: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: input_pull_up: ste,input: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: input_pull_down: ste,input: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: output_high: ste,output: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: output_low: ste,output: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: msp@80124000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: msp@80124000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: msp@80125000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: msp@80125000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: mcde@a0350000 (ste,mcde): 'epod-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ste,mcde.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: panel@0 (samsung,s6e63m0): Unevaluated properties are not allowed ('interrupt-names', 'interrupt-parent', 'interrupts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/samsung,s6e63m0.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: in_nopull: ste,input: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: input_pull_up: ste,input: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: input_pull_down: ste,input: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: output_high: ste,output: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: msp@80124000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: msp@80124000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: msp@80125000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: msp@80125000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: mcde@a0350000 (ste,mcde): 'epod-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ste,mcde.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: in_nopull: ste,input: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: input_pull_up: ste,input: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: input_pull_down: ste,input: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: output_high: ste,output: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: output_low: ste,output: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: msp@80124000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: msp@80124000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: msp@80125000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: msp@80125000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: mcde@a0350000 (ste,mcde): 'epod-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ste,mcde.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: in_nopull: ste,input: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: input_pull_up: ste,input: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: input_pull_down: ste,input: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: output_high: ste,output: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: output_low: ste,output: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: msp@80124000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: msp@80124000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: msp@80125000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: msp@80125000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: mcde@a0350000 (ste,mcde): 'epod-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ste,mcde.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: in_nopull: ste,input: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: input_pull_up: ste,input: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: input_pull_down: ste,input: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: output_high: ste,output: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: output_low: ste,output: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: msp@80124000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: msp@80124000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: msp@80125000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: msp@80125000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: mcde@a0350000 (ste,mcde): 'epod-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ste,mcde.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: in_nopull: ste,input: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: input_pull_up: ste,input: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: input_pull_down: ste,input: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: output_high: ste,output: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: output_low: ste,output: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: msp@80124000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: msp@80124000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: msp@80125000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: msp@80125000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: mcde@a0350000 (ste,mcde): dsi@a0351000: Unevaluated properties are not allowed ('panel' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/ste,mcde.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: mcde@a0350000 (ste,mcde): 'epod-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ste,mcde.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: in_nopull: ste,input: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: input_pull_up: ste,input: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: input_pull_down: ste,input: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: output_high: ste,output: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: output_low: ste,output: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: msp@80124000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: msp@80124000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: msp@80125000 (stericsson,ux500-msp-i2s): 'v-ape-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: msp@80125000 (stericsson,ux500-msp-i2s): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: mcde@a0350000 (ste,mcde): dsi@a0351000: Unevaluated properties are not allowed ('panel' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/ste,mcde.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: mcde@a0350000 (ste,mcde): 'epod-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ste,mcde.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: in_nopull: ste,input: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: input_pull_up: ste,input: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: input_pull_down: ste,input: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: output_high: ste,output: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: output_low: ste,output: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
