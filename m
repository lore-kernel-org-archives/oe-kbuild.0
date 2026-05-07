Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04A8344DB4
	for <oe-kbuild@lists.linux.dev>; Thu,  7 May 2026 21:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778189385; cv=none; b=OwulBpD09njhva7sxw4fkTE700rp9D+h6ba760+N+3LsZH207hSeQZ1Yk4B+UU5FH9Sn+uogkaP3386xTq+G2zzymzTMmhaPP0giKo4P2kWeVYbnzOH9Mpentqdweu1X/1zkS9227KGmBW3f2i38a1M8McHaQwVT+W/glDGTUkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778189385; c=relaxed/simple;
	bh=oa2EfsZo0/OAyFK0kWXUkrjqIFvRQWTpQWzN5hZhiR0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GJMYujAOLs/7z/0pYnCxmjMNDGbdqeyYnbvhXiQQKiqXmSlLDGMLWyrjYxwXUTDo9x8/c3KLYPppU7ZSaea05agJkn3wPQNn8+mBNoHrcEhQxUlZqqll6ZgPAIMeohT3jVCTlVs+VHY3n3H/D5Fs6s/jYal1Mf8GLh46xP9ibk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TNoVnzpl; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TNoVnzpl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778189384; x=1809725384;
  h=date:from:to:cc:subject:message-id;
  bh=oa2EfsZo0/OAyFK0kWXUkrjqIFvRQWTpQWzN5hZhiR0=;
  b=TNoVnzpl4eg2bjBuW356LDKHDWYycC+u1utyPSe9F7OzYSpy1nklzpK0
   eVEeheefpxGNEADXxzefu5e/591eGIRQGPHJbvIuzFkmrNuAbhhOg7WSa
   LdLwcSZ3bxM6K2aM2yO7xEz0ehD+3VrToCxYBzl35JjREhDAe/bS3Itz4
   OEZfz+U/43uZoQIOdm5bMrP7fqETZbBHVz3RUTomk7WHmnyt5ocuexk8k
   0HrDbTdyqPgdqkRlhXmqE35NSneZ96CPg0h1mr0DkGZgal36PngwXQ7jD
   JO7UKanb+9AiESwzSd782eIs5rnmIQnb5iC16zzgKVsr+V1/C4W5QZXTi
   w==;
X-CSE-ConnectionGUID: 1oFdsnr4SUWXKhrTRe5A2w==
X-CSE-MsgGUID: 8E7rLVohT0GPkgcU0s8elg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="89851179"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="89851179"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 14:29:43 -0700
X-CSE-ConnectionGUID: 8RXsQVmESlivn+xeawfpTQ==
X-CSE-MsgGUID: JY7W0W9QR2OxNBvhjNRKCA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 07 May 2026 14:29:42 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL6Hr-000000006wn-49kl;
	Thu, 07 May 2026 21:29:39 +0000
Date: Thu, 07 May 2026 23:28:57 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb:
 wifi@0 (pci17cb,1103): 'vddwlmx-supply' is a required property
Message-ID: <202605072306.VIKANNwL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Nikita Travkin <nikita@trvn.ru>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f09079bd04a924c72d555cd97942d5f8d7eca98c
commit: 263780f3189730f2efa511181c3970384e54afde arm64: dts: qcom: sc8280xp: Add EL2 overlay for WoA devices
date:   1 year ago
:::::: branch date: 11 months ago
:::::: commit date: 1 year ago
config: arm64-randconfig-2055-20260506 (https://download.01.org/0day-ci/archive/20260507/202605072306.VIKANNwL-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605072306.VIKANNwL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 263780f31897 ("arm64: dts: qcom: sc8280xp: Add EL2 overlay for WoA devices")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605072306.VIKANNwL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: bluetooth (qcom,wcn6855-bt): 'vddbtcmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfacmn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddaon-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfa0p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
