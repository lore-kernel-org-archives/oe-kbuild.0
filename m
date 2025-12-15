Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D794309DD2
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 14:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765807861; cv=none; b=IKoJojknlOfIN9cNNSgnwq2vcP/zV5LSA0KKsor7184CDuc8kefTkz9UTqZGnuxFLAFu7Zo4H7WZYBE9eVs6hjocSarK+e+OtwwhP2ukQqRJR5aMFtjjfzj1Bvg4Neq6zVlprUHYAZrQm6Ni6v0hcRLnQUxvXOHNquZuYQXTlfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765807861; c=relaxed/simple;
	bh=b8PdYdV0Dch51ZgIJ18aDO74b4UqxhX0AR8nzs3mZr4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FNNY79Qgz4U0h34noGUNawxLgoxtB36PqwS4UGOhKV1ffhw16xi6aE9jHqLp5GBxxNspU/TRJjLQBI+hPUPs88hG4WLItfdlHBpK6Yd0evNjynKJoBQ3vJOFJ38fvbCNvxsLMHrD5h4OFHvyM0Zqyc9GzAX/S5q9VxkUiIjafFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LNy190Xp; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LNy190Xp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765807860; x=1797343860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b8PdYdV0Dch51ZgIJ18aDO74b4UqxhX0AR8nzs3mZr4=;
  b=LNy190Xp4WHvx0Qks3DuUGhykBcJZf7PARAJjTU5awjLB2P+9mRxZMa2
   OzBYum94OLD3OfIdB+WkYBqmv3vX2cHi/U5cFkUNRhnsfO5iUrSYwe1+Q
   eXDsVKBTgEmtRjhqMr3MsO8r2gEVZ9LTR/VROb3uHyUb/2X6KB9qwe0/g
   8IFxfSH6aBY4EhyFlZ6cfXsWzw7aiaDM0at8zOroFeQR1dxyv1koOV/17
   D0489I364Ld/U8kwz9ddQMPowrCVTxtpse7g3jWgUFncZkst6+KK0E4IZ
   65v0agC1chPV0mU/Am7dumzaqC+eMDBeocHif0K8yXB55q0Gh/1G5JWE7
   Q==;
X-CSE-ConnectionGUID: iFUuyeYJTuuPPRqAmKUJIA==
X-CSE-MsgGUID: SyyopD+MRGmRnuRsh4Clhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78823932"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="78823932"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 06:10:59 -0800
X-CSE-ConnectionGUID: +OWuLe4jRM+7BAObal4FTQ==
X-CSE-MsgGUID: Po79XWiSS0iMZYLPNmm1yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="198240281"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 15 Dec 2025 06:10:58 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV9Hs-000000002g0-0Rmr;
	Mon, 15 Dec 2025 14:10:56 +0000
Date: Mon, 15 Dec 2025 15:10:00 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next v1 1/3] dt-bindings: net: micrel: Convert to
 YAML schema
Message-ID: <202512151502.1dJAP8fn-lkp@intel.com>
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
In-Reply-To: <20251212084657.29239-2-eichest@gmail.com>
References: <20251212084657.29239-2-eichest@gmail.com>
TO: Stefan Eichenberger <eichest@gmail.com>
TO: andrew+netdev@lunn.ch
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: hkallweit1@gmail.com
TO: linux@armlinux.org.uk
TO: geert+renesas@glider.be
TO: ben.dooks@codethink.co.uk
CC: netdev@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: francesco.dolcini@toradex.com
CC: rafael.beims@toradex.com
CC: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Hi Stefan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-Eichenberger/dt-bindings-net-micrel-Convert-to-YAML-schema/20251212-165111
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251212084657.29239-2-eichest%40gmail.com
patch subject: [PATCH net-next v1 1/3] dt-bindings: net: micrel: Convert to YAML schema
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: riscv-randconfig-2051-20251215 (https://download.01.org/0day-ci/archive/20251215/202512151502.1dJAP8fn-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ecaf673850beb241957352bd61e95ed34256635f)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512151502.1dJAP8fn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512151502.1dJAP8fn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: ethernet-phy@7 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
