Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCED43E4C88
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Mar 2026 21:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774561308; cv=none; b=HYSERzC5qXs5Dw1GLfcE0FIb+8zJ3ASeeZ8eFcpbhD1Yv54bWSkbvA/FGlacTw1Rj4l/d08o416CSldMGyZx2Po7MJO72l/3POBHD93HNsu9u3uuxEPdatZ5AamJqcFbHhClh7zNoUwORA9Vn4JZhIAJw8ul+qomP1FMRK7GlMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774561308; c=relaxed/simple;
	bh=ehMGmv94vYYDce8t/2TehARg/N+8sRkjotnedFPzKcU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LVX8KZNtGod3G2SMJOgaxjUdGeCwoARTVHozpNJCGxM64Zo+4A6FsJqPrgcu6q/FujIbmdIewNRsCuybEtOeRnRjztCFh3AsXXyByjv7n211eSRCotIAkOrYDZrllXchg2sMJqIZHJ1PJNHKVu+xcFPaY/vZ1XO07rtb8EjjJnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E+vsF4mH; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E+vsF4mH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774561307; x=1806097307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ehMGmv94vYYDce8t/2TehARg/N+8sRkjotnedFPzKcU=;
  b=E+vsF4mHuTliVVP80B/dks/11OazoTvRdYQqBfCdcKb5hQXVP65G73TK
   meU6vWZ35gcWsMe3iT0hAN2y+FNmNcrGQGIucguIrikCEDAEwzBBusvO9
   4HG2nzk8nTSgoil9HJJURdVl3jL0VpNEWPbDwtBsq4iWyl6MMS9W9FeA6
   4hcreXrmIKLS3qYaAZbph9IfeFPVPpjdN3hvUdP/tOaUuV3rG4Yl/3u7q
   b3vHty7EtQdQi8nAJj4Fl1l5JUitCGhVdKbwKbWfincU7AVVwRhu1olBf
   jTem2fJTyA12faxH52dplxt02maKEWUXIw5Sr6Agy9KL3ncLtIJHfFaVE
   A==;
X-CSE-ConnectionGUID: Of+3uOtKQ22OWXG9W0CbXw==
X-CSE-MsgGUID: 0J7ScfkpQTeG1KvvZ3DVQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="63190820"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="63190820"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 14:41:46 -0700
X-CSE-ConnectionGUID: XszOgYWCTq+TVr/Udwxd/A==
X-CSE-MsgGUID: lC9qmRZETrKOcaPhYG4ieg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="225128752"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 26 Mar 2026 14:41:45 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5sSU-000000007L3-2qD4;
	Thu, 26 Mar 2026 21:41:42 +0000
Date: Thu, 26 Mar 2026 22:40:52 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3] dt-bindings: arm: mediatek: mediatek,g3dsys: Convert
 to DT schema
Message-ID: <202603262256.pghVlnTN-lkp@intel.com>
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
In-Reply-To: <20260325181509.3430-1-challauday369@gmail.com>
References: <20260325181509.3430-1-challauday369@gmail.com>
TO: Udaya Kiran Challa <challauday369@gmail.com>
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: skhan@linuxfoundation.org
CC: Udaya Kiran Challa <challauday369@gmail.com>

Hi Udaya,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16-rc1 next-20260326]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Udaya-Kiran-Challa/dt-bindings-arm-mediatek-mediatek-g3dsys-Convert-to-DT-schema/20260326-174611
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260325181509.3430-1-challauday369%40gmail.com
patch subject: [PATCH v3] dt-bindings: arm: mediatek: mediatek,g3dsys: Convert to DT schema
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: arc-randconfig-2051-20260326 (https://download.01.org/0day-ci/archive/20260326/202603262256.pghVlnTN-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 9.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603262256.pghVlnTN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603262256.pghVlnTN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/soc/mediatek/mediatek,mt2701-g3dsys.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
    	 $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt2701-g3dsys.yaml
    	file: Documentation/devicetree/bindings/soc/mediatek/mediatek,mt2701-g3dsys.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
