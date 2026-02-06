Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1021F03D7
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Feb 2026 02:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770344014; cv=none; b=jFUKcBB3o6RZihRQ91a+uDP3yKde3u1egcrf8TxJrkiX+AcTkWqROnF279tnbg7VavCed7S96w1Ud8PBpxl11Lrj0g9aVgSTl4j2WMGZF3hPOTj51JPqbhG0MZl6PE3Z7idyprGu3hmCBv34TgOfjevfiObr9Z1JhmE+VLKyJi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770344014; c=relaxed/simple;
	bh=Y8aWIntHrmZO8YTJKe5R+uZCgwLN0a9UlbIrwcOIxW8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SwetDJ7YoelnG9e5482hdBMuP74L1wZgREzmknlqa0w39k0AhkQHgtYX86/7d5Q8AM4SYSLDPYOqrbrsqHKbcAe68OwrnHt0nk1clQ8lk/jS/Toh5Vi/3XGETZYOBWWbQXw1qiL9a12uCCprXvXMZlJ8GEAnuYAe2Go2QAZAvUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YIv+L21p; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YIv+L21p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770344014; x=1801880014;
  h=date:from:to:cc:subject:message-id;
  bh=Y8aWIntHrmZO8YTJKe5R+uZCgwLN0a9UlbIrwcOIxW8=;
  b=YIv+L21ppJu3vZP36mgOw40gREltssnrlDfaIt5UGzOTkXzLpbiYdQD+
   jZPmmM9jAGvJo+a+m90LznW2iQy18hyNioNchzcGiuTUZZyKWcDwTVy55
   DAJLP3Dcjzwrerrrv860KQ2tojJXDse9fVNbvqFuWT6ikF7EqujNoCcDX
   EPQfsYL3EeZenE9uu7WGoTw0XhPvLULe2X93t63yYPIAK1j0d2hUSWYiw
   nSMbuWkOOqk4+XRt/qYMmlidyKhbGN9KObZxSTvnE9EIYepQawhsN5zgy
   yjlz9Y8p9Lrtk+a2iWlvXbwNVoFbOQYD8jLOQU+287RkY+R641vr94yjB
   w==;
X-CSE-ConnectionGUID: 42HpeIwiT/mGQhXNahh/oQ==
X-CSE-MsgGUID: yHm+ZMyqQdS33OVtMjKGNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="81869212"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="81869212"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 18:13:34 -0800
X-CSE-ConnectionGUID: 3O2xArpXRquoDDAl7Gjc4g==
X-CSE-MsgGUID: cQaziHnTRi2FZNq+6TZlrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="214904811"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 05 Feb 2026 18:13:33 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voBLe-000000004JF-1ONm;
	Fri, 06 Feb 2026 02:13:30 +0000
Date: Fri, 06 Feb 2026 03:13:05 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [superna9999:topic/sm8650/ayaneo-pocket-s2/pmos-fosdem26
 15/23] arch/arm64/boot/dts/qcom/sm8650-hdk.dtb:
 displayport-controller@af54000 (qcom,sm8650-dp): Unevaluated properties are
 not allowed ('sound-name-prefix' was unexpected)
Message-ID: <202602060338.I32p6LMc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Neil Armstrong <neil.armstrong@linaro.org>

tree:   https://github.com/superna9999/linux topic/sm8650/ayaneo-pocket-s2/pmos-fosdem26
head:   5120936633b5138a0543b06adff90d3c8312b965
commit: a18f498bacb78723ee3a33e368c0ddd03036a82a [15/23] arm64: dts: qcom: sm8650: Add sound DAI prefix for DP
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm64-randconfig-2054-20260202 (https://download.01.org/0day-ci/archive/20260206/202602060338.I32p6LMc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260206/202602060338.I32p6LMc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602060338.I32p6LMc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5563.27-5638.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5660.27-5716.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8650-hdk.dts:834.9-845.5: Warning (graph_child_address): /soc@0/geniqup@ac0000/i2c@a8c000/typec-mux@e/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: displayport-controller@af54000 (qcom,sm8650-dp): Unevaluated properties are not allowed ('sound-name-prefix' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5660.27-5716.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: displayport-controller@af54000 (qcom,sm8650-dp): Unevaluated properties are not allowed ('sound-name-prefix' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml
--
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: displayport-controller@af54000 (qcom,sm8650-dp): Unevaluated properties are not allowed ('sound-name-prefix' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
