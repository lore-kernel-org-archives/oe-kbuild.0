Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA544246793
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Oct 2025 07:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761376470; cv=none; b=HsUsXCLyMauZf03Fmub7KpvbgJxnS2n3Ns4WgxAfJsuGvyk2TvKkCnyfoIyvsaenBoohR4IyFzCIf4T2AR/RJc+xs1eRFkn/6Nh2EvnQLbxrCvkk0E+TRONsxYACO3980x1ImxNp1FG5IEnlaHsBv7tscj+kb1GVgdBC9vYFeyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761376470; c=relaxed/simple;
	bh=Z1coF86qEzI1YikUenVHC91i9DfGvDjHNKS+yoVkqZo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eZnn/IXKTPmRcrF4+iviIv3QcYGFB6XNWq2SOKcc/GO0Fp6VndL/QUtgRvwqDXxgidhck+cJLWcNSn1aTutgoKIh2LPgL+kpDeSApGtRT/10zcYfuSRNlFf4+xPIiPuPPeR4j9ykftKOeI86OxglDxwhvGUZ9Lv13ft9gTz2Avc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aE7kGiqY; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aE7kGiqY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761376469; x=1792912469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z1coF86qEzI1YikUenVHC91i9DfGvDjHNKS+yoVkqZo=;
  b=aE7kGiqYI1MpralZfRYwU/SSx1YfAyLI7z8BkLKJU5AwsziXM191TrDl
   2W3wOc7jX89dGh3WTMZpxid9Dp2z6yAA6+JK9k2ckkz5pxfBlS/z/9AqP
   yFKSyJEZZzD108l8CD27qVR2vzoKoOvt6/GpdYmbSxFjPHNJKLvzsK6z1
   MrgLa7Th/HeG/ygbZwPGNlfTHYQTxpIZvZ7o161VQpYPfIs2rfCHJOPDT
   Y+ymcYgyzBCrhbx1KH3ymZJAGwpj3+gVEVeSJG62riWDicm/TWIDR/e4k
   5UZYlqFitP1qyanLkzgRtkOlyl3sYDxMwvY3KNGtdeEOrPJ84nbQGkZ56
   Q==;
X-CSE-ConnectionGUID: jVQ0OECPSv6GNTewkLN3WQ==
X-CSE-MsgGUID: x33WRHl/Rtqyv3MG98DZPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63245977"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="63245977"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 00:14:28 -0700
X-CSE-ConnectionGUID: +thKLJ80QD69QWTSThv8Bw==
X-CSE-MsgGUID: Hvn9HgF6TCG1PSh6mDpoEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="188665569"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 25 Oct 2025 00:14:27 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCYTp-000FAT-04;
	Sat, 25 Oct 2025 07:14:25 +0000
Date: Sat, 25 Oct 2025 15:14:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next 10/13] dt-bindings: net: dsa: lantiq,gswip: add
 support for MaxLinear GSW1xx switches
Message-ID: <202510251557.FS2kslve-lkp@intel.com>
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
In-Reply-To: <c8580eb023b99447e33d5b95624440c0af602f89.1761324950.git.daniel@makrotopia.org>
References: <c8580eb023b99447e33d5b95624440c0af602f89.1761324950.git.daniel@makrotopia.org>
TO: Daniel Golle <daniel@makrotopia.org>
TO: Hauke Mehrtens <hauke@hauke-m.de>
TO: Andrew Lunn <andrew@lunn.ch>
TO: Vladimir Oltean <olteanv@gmail.com>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Simon Horman <horms@kernel.org>
TO: Russell King <linux@armlinux.org.uk>
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: Andreas Schirm <andreas.schirm@siemens.com>
CC: Lukas Stockmann <lukas.stockmann@siemens.com>
CC: Alexander Sverdlin <alexander.sverdlin@siemens.com>
CC: Peter Christen <peter.christen@siemens.com>
CC: Avinash Jayaraman <ajayaraman@maxlinear.com>
CC: Bing tao Xu <bxu@maxlinear.com>
CC: Liang Xu <lxu@maxlinear.com>
CC: Juraj Povazanec <jpovazanec@maxlinear.com>
CC: "Fanni (Fang-Yi) Chan" <fchan@maxlinear.com>
CC: "Benny (Ying-Tsan) Weng" <yweng@maxlinear.com>
CC: "Livia M. Rosu" <lrosu@maxlinear.com>
CC: John Crispin <john@phrozen.org>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Golle/net-dsa-lantiq_gswip-split-into-common-and-MMIO-parts/20251025-010937
base:   net-next/main
patch link:    https://lore.kernel.org/r/c8580eb023b99447e33d5b95624440c0af602f89.1761324950.git.daniel%40makrotopia.org
patch subject: [PATCH net-next 10/13] dt-bindings: net: dsa: lantiq,gswip: add support for MaxLinear GSW1xx switches
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: csky-randconfig-051-20251025 (https://download.01.org/0day-ci/archive/20251025/202510251557.FS2kslve-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510251557.FS2kslve-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510251557.FS2kslve-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml: ignoring, error parsing file

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
