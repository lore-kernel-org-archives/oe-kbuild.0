Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B151BC3F
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Aug 2024 06:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724825143; cv=none; b=uAat+W7/SgMRGWzAdTdNw9WQdCAJEE1gzrWiTh5TVA2MwoGn3V5xm+4oyzMa80JODwxgprp9q52Zl/vjNF0Q5Mga65EqejTTeuyIWz7RFa12Jd7BhBeM1jZdXCnPdHVLTtYJX+Bt6x0vk+GiJD0NBuwoQ+hTTOKO3ph2VdwFFVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724825143; c=relaxed/simple;
	bh=/m/c62KtXK9TRLJIFlOozAPAUNWhxsm9BYUCrnbaY5s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AUjtzK1lrJn3F4nmSJtAV2DPVbA2/tpauvZ2aQXrMvWMF4ou0qsboD0yugwVT23wOmFHbVPe//5Ije+QOTW4uTeH3paE1LZRyleK4O0CsGIYvlN5AHeO24bb4yCp9RNQWXuDNFbh/RvpsnSfJAdLgZqV9kQmjci/3jTI103ZKh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bJLODbUr; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bJLODbUr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724825142; x=1756361142;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/m/c62KtXK9TRLJIFlOozAPAUNWhxsm9BYUCrnbaY5s=;
  b=bJLODbUr/2+MgKBvK5qe4+0unSEfcQi35C9/SHayny+aKtkDFgbANH6Q
   n1gU0H9+l6222y3pa/LH/Z9aW+dnwDdD2W2XCK/inqYfJ82nJ4bPiK5c5
   fnB05RnfJ6XIWWu1KDRCNdvnC8OMmRGbLGpaGCu216ptLK4fDnWd4Gvje
   ZmY41mTC/AGaTvAlxYCwN6sjwIr01F6Qz9OYM7FZt+FjhcUu298P3N1XG
   AdL2vrjQAFhcaVJba0yI81E0WZbDgmBcRS7jXPaj7D8kG+REha0+Lc2rg
   Q6VWrTzVPmbBekcu4sel11s7bogDWvqiB97h2o2VPOeeQR8uqYHbt3xv4
   w==;
X-CSE-ConnectionGUID: Mtj4GravT8eHxH7Av0p71Q==
X-CSE-MsgGUID: EakVOq+sSV+cShnHW8NVhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="45854111"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="45854111"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 23:05:41 -0700
X-CSE-ConnectionGUID: vsL8j6onRqmVowXmMIKZxQ==
X-CSE-MsgGUID: NXYoQrEkSsmAA00MdffM5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="67265720"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Aug 2024 23:05:40 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjBoI-000KXA-0U;
	Wed, 28 Aug 2024 06:05:38 +0000
Date: Wed, 28 Aug 2024 14:04:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5] arm64: dts: renesas: r9a07g043u11-smarc: Enable DU
Message-ID: <202408281313.Jg2CS4lk-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240826101648.176647-1-biju.das.jz@bp.renesas.com>
References: <20240826101648.176647-1-biju.das.jz@bp.renesas.com>
TO: Biju Das <biju.das.jz@bp.renesas.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Biju Das <biju.das.jz@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Magnus Damm <magnus.damm@gmail.com>
CC: linux-renesas-soc@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Biju,

kernel test robot noticed the following build warnings:

[auto build test WARNING on geert-renesas-devel/next]
[also build test WARNING on krzk/for-next krzk-dt/for-next linus/master v6.11-rc5 next-20240827]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Biju-Das/arm64-dts-renesas-r9a07g043u11-smarc-Enable-DU/20240826-181830
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
patch link:    https://lore.kernel.org/r/20240826101648.176647-1-biju.das.jz%40bp.renesas.com
patch subject: [PATCH v5] arm64: dts: renesas: r9a07g043u11-smarc: Enable DU
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240828/202408281313.Jg2CS4lk-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 08e5a1de8227512d4774a534b91cb2353cef6284)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408281313.Jg2CS4lk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408281313.Jg2CS4lk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi:28.10-32.5: Warning (unit_address_vs_reg): /fragment@1/__overlay__/ports/port@0: node has a unit name, but no reg or ranges property

vim +28 arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi

7d71144818dfb9 Biju Das 2024-08-26  21  
7d71144818dfb9 Biju Das 2024-08-26  22  &du {
7d71144818dfb9 Biju Das 2024-08-26  23  	pinctrl-0 = <&du_pins>;
7d71144818dfb9 Biju Das 2024-08-26  24  	pinctrl-names = "default";
7d71144818dfb9 Biju Das 2024-08-26  25  	status = "okay";
7d71144818dfb9 Biju Das 2024-08-26  26  
7d71144818dfb9 Biju Das 2024-08-26  27  	ports {
7d71144818dfb9 Biju Das 2024-08-26 @28  		port@0 {
7d71144818dfb9 Biju Das 2024-08-26  29  			du_out_rgb: endpoint {
7d71144818dfb9 Biju Das 2024-08-26  30  				remote-endpoint = <&adv7513_in>;
7d71144818dfb9 Biju Das 2024-08-26  31  			};
7d71144818dfb9 Biju Das 2024-08-26  32  		};
7d71144818dfb9 Biju Das 2024-08-26  33  	};
7d71144818dfb9 Biju Das 2024-08-26  34  };
7d71144818dfb9 Biju Das 2024-08-26  35  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
