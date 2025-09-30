Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7CC34BA42
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Sep 2025 18:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759256732; cv=none; b=g/xKSLFU4mtx8FMsvIp4SDHriUmwcAgDtjD0DGfhaGe3scQ4pbD9L8b8v3ZP5YVDmgD5JlcXVOTDlSHWmcI8/PBGxMjA650i+aWypgjq1sRPrHUdgaLBqA5Rgm7TUXYzpr4CG3Fp4s6paJtjbcKkkBbN5fY6naEQdZrtCfEoGHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759256732; c=relaxed/simple;
	bh=CQwM4mIVDhekQlsoqIsrWvG1aglegVnNmhwRSNpw6lw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JlDNTbxdtPQhQt98uz3zBs1qL2poRjK9oj2PegzciTSq6LNRCy6q7LsFyeAxNt0rbbQyrKdwp4H91rp/02sLdcbbxcmbguN4jwS6rhzSBqqktyQWk0p2gsBwAYA5OrhJ87s4ITUaJNHhmOzbFQl8YRGXWQpq5tUpOXTrVnhEgQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GIp4X6Ue; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GIp4X6Ue"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759256731; x=1790792731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CQwM4mIVDhekQlsoqIsrWvG1aglegVnNmhwRSNpw6lw=;
  b=GIp4X6UePrx6TMfDS1q38VyOnZjDOy5R5/dPmeGe/PIu5FWN/0qotKMZ
   XrVsKvZMkmMvudjIlUsF6B6EsZ+22aApC3VJkbz0COd4AJNbvfCIVNbKf
   l1RmoCaE52c7RjIXuFRAj8LMJVnxWQG8XedxxMvVBH0inwz27YmSl/g6j
   oPFdfYCtd9sLjNu379+L3NhQfrJq7DBJYrBlLiuRWY4ez8lK6KjQrdWGs
   SqZURJNI5lSr8SRPv53a7ELz5UizNTT5MWHv5mBWG2jycVht6F5gTNxs2
   Ha7i12Lg9qvP8l0l0xlFR1QdY3/EP53o4hxUnyT0CiyaAM6soaBtb/MF9
   w==;
X-CSE-ConnectionGUID: vWuWUaULQFOQRZ5abK68FA==
X-CSE-MsgGUID: U6Q1KjzbQPSC7swoOGRucA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="86969743"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; 
   d="scan'208";a="86969743"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 11:25:30 -0700
X-CSE-ConnectionGUID: 7kPy6YZVQmaBWu3stRd0mw==
X-CSE-MsgGUID: H1frBppTRb+PsWt9NUeDgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; 
   d="scan'208";a="202277172"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa002.fm.intel.com with ESMTP; 30 Sep 2025 11:25:30 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v3f2V-000000006Kz-1cp2;
	Tue, 30 Sep 2025 18:25:27 +0000
Date: Tue, 30 Sep 2025 20:25:04 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [steev:lenovo-x13s-linux-6.17.y 28/50]
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb:
 video-codec@aa00000 (qcom,sm8350-venus): 'video-decoder' is a required
 property
Message-ID: <202509302046.hehGzM8e-lkp@intel.com>
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
TO: Steev Klimaszewski <steev@kali.org>

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.17.y
head:   920850f32669833c7d393f69785ac16d0292a10e
commit: b3f3f22bce2dc6d59e32323dc23f718c19d67c50 [28/50] arm64: dts: qcom: sc8280xp: Drop unneeded venus nodes
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: arm64-randconfig-2051-20250930 (https://download.01.org/0day-ci/archive/20250930/202509302046.hehGzM8e-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2e3389abb3a2e4ee27e40f353c5eec476a229f6)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250930/202509302046.hehGzM8e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509302046.hehGzM8e-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4251.12-4255.7: Warning (graph_child_address): /soc@0/camss@ac5a000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: video-codec@aa00000 (qcom,sm8350-venus): 'video-decoder' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8350-venus.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: video-codec@aa00000 (qcom,sm8350-venus): 'video-encoder' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8350-venus.yaml#
--
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: video-codec@aa00000 (qcom,sm8350-venus): 'video-decoder' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8350-venus.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: video-codec@aa00000 (qcom,sm8350-venus): 'video-encoder' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8350-venus.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
