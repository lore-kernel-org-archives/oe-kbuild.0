Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1112C38D
	for <oe-kbuild@lists.linux.dev>; Thu, 21 May 2026 00:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779321829; cv=none; b=egprkISgYkq4Krx98MzB2uAmnKnnK72IKFQA7qwST/eZTfVQWGYfoB7osvn+arkws6V13QSgn8eVqnaRXQFT9qK0Np7tzkv8FGPQ+sXmI6Zd10lYWOpN1bXJ+bv1t1sQRqWWTp5mZ0FBf3jKVYCSQ//kio09Y1NGIwyg8FADiSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779321829; c=relaxed/simple;
	bh=Xb1B85as2r27vtjVl9pDL0w0jOp8Ljw60w+B+iwPLPk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ijs5YWqA6CnVVip/oEtl0U1M8Y+ojuShdMJu/uzy+193Gy1MC7xOu6krxtXuK08DY6dBROr/+UE5Z5KQJTeOYw9/zINM38+bL5TPGcxF2yCNWnkOpKi3Mg7n2QDRCX/vyDvubksBxfc+ggWbtOUwnXju4YdScpiO+E9oYkxL+/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f0x/ANw3; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f0x/ANw3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779321829; x=1810857829;
  h=date:from:to:cc:subject:message-id;
  bh=Xb1B85as2r27vtjVl9pDL0w0jOp8Ljw60w+B+iwPLPk=;
  b=f0x/ANw3WSKSURSmEkHq5z7RwR+rU4+R74aVgVGo0MIqO8vKf6PREmi4
   d/TP33HzBcdfu3vzfKyzlMw6oaLJUq4qfvm8XZCvXDwVhmJfa2dysCgd5
   B75cNbSyO1N0uovxFcitVtwKu4lLGpPSTuWOquPCDUozhoZnVjN7TqBX7
   z8U0pVpfezPfD9YWCumlRXUML68EMqXOF0F7x3AYjYNQCD+wrOgg/t/69
   H0dTQLLhoMKmE+jr/k8727Faf7MwEMFB/w0ePt+h3lTiOex5uO+pQAJte
   bJ2xHTKkIvwCZa940zyKWdoKk/Uxno9cpBhjgNYkQmv7KXnoLj2okWBQc
   g==;
X-CSE-ConnectionGUID: KKNHhq6wSQKA7zULqY7EcA==
X-CSE-MsgGUID: FC/hYS1IQ6Si94ea3UMyQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="91707527"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="91707527"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 17:03:48 -0700
X-CSE-ConnectionGUID: JlGKYnMPQ1mz+XPJJAAQYw==
X-CSE-MsgGUID: MXNB7685RSmzWUgZ4WP0Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="240599086"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 20 May 2026 17:03:47 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPqt6-00000000Ahl-0swO;
	Thu, 21 May 2026 00:03:44 +0000
Date: Thu, 21 May 2026 02:03:08 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [spacemit:dt-for-next 21/28]
 arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb:
 /soc/dma-controller@d4000000: failed to match any schema with compatible:
 ['spacemit,k3-pdma']
Message-ID: <202605210116.6IsQ0FZG-lkp@intel.com>
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
CC: Yixun Lan <dlan@gentoo.org>
TO: Troy Mitchell <troy.mitchell@linux.spacemit.com>
CC: Yixun Lan <dlan@kernel.org>

tree:   https://github.com/spacemit-com/linux dt-for-next
head:   6edd9a0d32e1ef81133b8cb5b3bb3157a44da4d1
commit: 3f47ca8bb3c3f4a71688451a0cb7350d3e1e1059 [21/28] riscv: dts: spacemit: Add PDMA controller node for K3 SoC
:::::: branch date: 15 hours ago
:::::: commit date: 16 hours ago
config: riscv-randconfig-2051 (https://download.01.org/0day-ci/archive/20260521/202605210116.6IsQ0FZG-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605210116.6IsQ0FZG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605210116.6IsQ0FZG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/phy@c0a20000: failed to match any schema with compatible: ['spacemit,k3-usb2-phy']
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/dma-controller@d4000000: failed to match any schema with compatible: ['spacemit,k3-pdma']
--
   arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/phy@c0a20000: failed to match any schema with compatible: ['spacemit,k3-usb2-phy']
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/dma-controller@d4000000: failed to match any schema with compatible: ['spacemit,k3-pdma']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
