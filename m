Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA08F423782
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Jul 2026 12:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785412889; cv=none; b=rU/OksOAkAdat5ifL0/fbL0eXzXHzlG8De/y1hpqOw5hI5q2veSEbgmLrBnTTrFVbzcZ6k989X9sS7SFhFb2lRPamAVB1JFB/6ZevdH6oCekOotcpIBicAqsPR79bz/wsAmBWpQ3M2HMcZ4/kA9soSX935dbB27B+Pw5t+bdqUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785412889; c=relaxed/simple;
	bh=malNgSVHd31DCn76vS9IkF/Vk0ni/40c7+Tgza3Cq7k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OMpm/Nbch60F3ypn5F1jWpCSODiWJAjSyylanuwiOY6XJeLna6MFyja8VYyMrlixxa4WoRPmrF65HVWr8SeNNX57e88ExQpycFjLvdKGa9xQIPK+JcvJbiQlwFsNjo1mmguYgZOeCwX1OXeimMgE3/AOaEW1Oj3hRBgkWREFkIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g654MGRU; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g654MGRU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785412888; x=1816948888;
  h=date:from:to:cc:subject:message-id;
  bh=malNgSVHd31DCn76vS9IkF/Vk0ni/40c7+Tgza3Cq7k=;
  b=g654MGRUktl60nPs3qVIs2cbEmvPo9vIUqIgKb1j6S2uKKrH8hmPRxfp
   lNvt5UMQ39ZsgqOglTnXemZMUg6mT6m9Man0sb7bmPmv6RrzyVYoTB/jQ
   Ri90SPL86A7T57wNgDzwi0EbDl8iHTJMH60W4ZXNu81bxtNMHR1AzIMRp
   i7dJu4K5jTd5zehE7dfBej/eQ5Bczv2vIfXNk4G0a2LroQc3m1U55eY9M
   LKlVchNNbIrQwq04ft6TjQFFjtm3Bw1wVAeuV+7MGPXIwhI8pB/p2L/h8
   UPaRdf4iCPUP9PwbyYNbix/PBj6tSY94XQIm+1065RELCHqr49Z0RfKQZ
   w==;
X-CSE-ConnectionGUID: cJVn6wonQSKokEsj1poTYQ==
X-CSE-MsgGUID: zmOzLfBWQzqbeuAHNXwLgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97544140"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="97544140"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 05:01:27 -0700
X-CSE-ConnectionGUID: 1aZLq/2/SJOCeFjI2XL1Pg==
X-CSE-MsgGUID: Qs3ziRokQg+vX5rW67x+0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="260350120"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 30 Jul 2026 05:01:26 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpPS0-000000002Mq-1Nih;
	Thu, 30 Jul 2026 12:01:24 +0000
Date: Thu, 30 Jul 2026 14:01:02 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4-hd702e.dtb:
 typec-portc@22 (fcs,fusb302): 'connector' is a required property
Message-ID: <202607301311.0IDKcu5Z-lkp@intel.com>
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
TO: Robin Murphy <robin.murphy@arm.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   11028ab62899e4191e074ee364c712b77823a9c4
commit: 25afddad23b8e91fcff625756e51a805e288ab38 arm64: dts: rockchip: Add overlay for FriendlyElec HD702E
date:   5 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 5 months ago
config: arm64-randconfig-2054-20260729 (https://download.01.org/0day-ci/archive/20260730/202607301311.0IDKcu5Z-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 9521d0c03324fb5950727522cdf71d94fd3f68b1)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607301311.0IDKcu5Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 25afddad23b8 ("arm64: dts: rockchip: Add overlay for FriendlyElec HD702E")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607301311.0IDKcu5Z-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4-hd702e.dtb: typec-portc@22 (fcs,fusb302): 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
