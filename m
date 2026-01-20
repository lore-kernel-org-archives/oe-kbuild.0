Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1177436344
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Jan 2026 13:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768916893; cv=none; b=a5JMPRbQZPZMtCWnqkDfck9D47t5Jop31bLB+oyS7mq3SgJWo79gaZlY7JvHPqRae9ehVDyz7EQLqaRzgntpzQ/RZ6PEHsPrgmGJwS3daUwHaTjjpTWzRqoOvSGmCsPl6dpcRKO01XD03GS1naHzzBy0fXPLnVS1fg7c3e29/Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768916893; c=relaxed/simple;
	bh=CBXO6C08E0xnLm0y/6GNeZAaPV0dCESCV/2t9qkYOfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gXauLkFapJV8GnCYSbQSsNeTbVMalA38djmGLgKNBQCJ4gf392FIvdT9mCe76+p4aZkaqCzItW3u1l6t7kTDs4iS5uEAswst9S0NvVLwJ9T7qBDYLTGR506B58tkFqBrF1GO5Cbe1rR3TdTqymk4XU6Y1DXx/PmaEoOtS7HvMy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CDR0OPzn; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CDR0OPzn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768916892; x=1800452892;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CBXO6C08E0xnLm0y/6GNeZAaPV0dCESCV/2t9qkYOfQ=;
  b=CDR0OPznVk9usyPR8Fn5QdrDbsewyIRpBAviw/GwDrR5+yt9ebQtywMS
   teZKol09WLEaztDNzynk21F6SFDgN21GItItCmG4JXRf9v1AXIpAk5oXL
   Qc3dZeV5v5Ml00fzaXL9t8S3qZ0nh19puX+f+tpK7LS4UARfgXJVZ3s/e
   YW4vYdXi1Q3Lslsl08cVyk0drkn5sTiFmazmYHrTuyhQ5jIvUx1vi+gVi
   3xRpAoGM2vU8bF+ifMjgfN3uo8tYGFraD2w2BrLR5cHN26RHSrneaPCPB
   JsKVc7n54rBRtHB774oW8/sItf1hd824Sf6gRJBpDoeYw7BG8OsDUTBOC
   g==;
X-CSE-ConnectionGUID: OsTNTW9VSmWmCNkWpcm30g==
X-CSE-MsgGUID: XLRKWUASR6y9DKuiG1UMtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70096166"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="70096166"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 05:48:11 -0800
X-CSE-ConnectionGUID: Z1mtxgYPSTicBGEsfmUULA==
X-CSE-MsgGUID: 584UWySGTM2tkSpezxijPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="211131182"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Jan 2026 05:48:11 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viC5Y-00000000P2j-0ojz;
	Tue, 20 Jan 2026 13:48:08 +0000
Date: Tue, 20 Jan 2026 21:47:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/6] ASoC: sophgo: add CV1800B I2S/TDM controller
 driver
Message-ID: <202601202159.aa0GmtdR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: sound/soc/sophgo/cv1800b-tdm.c:714:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260119-cv1800b-i2s-driver-v3-2-04006f4111d7@gmail.com>
References: <20260119-cv1800b-i2s-driver-v3-2-04006f4111d7@gmail.com>
TO: "Anton D. Stavinskii" <stavinsky@gmail.com>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Chen Wang <unicorn_wang@outlook.com>
TO: Inochi Amaoto <inochiama@gmail.com>
TO: Jaroslav Kysela <perex@perex.cz>
TO: Takashi Iwai <tiwai@suse.com>
TO: Paul Walmsley <pjw@kernel.org>
TO: Palmer Dabbelt <palmer@dabbelt.com>
TO: Albert Ou <aou@eecs.berkeley.edu>
TO: Alexandre Ghiti <alex@ghiti.fr>
CC: linux-sound@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: sophgo@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: "Anton D. Stavinskii" <stavinsky@gmail.com>

Hi Anton,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7a52965b6976c936f413eebeee3f78c6faf09012]

url:    https://github.com/intel-lab-lkp/linux/commits/Anton-D-Stavinskii/ASoC-dt-bindings-sophgo-cv1800b-add-I2S-TDM-controller/20260120-010026
base:   7a52965b6976c936f413eebeee3f78c6faf09012
patch link:    https://lore.kernel.org/r/20260119-cv1800b-i2s-driver-v3-2-04006f4111d7%40gmail.com
patch subject: [PATCH v3 2/6] ASoC: sophgo: add CV1800B I2S/TDM controller driver
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: riscv-randconfig-r123-20260120 (https://download.01.org/0day-ci/archive/20260120/202601202159.aa0GmtdR-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601202159.aa0GmtdR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601202159.aa0GmtdR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> sound/soc/sophgo/cv1800b-tdm.c:714:1: sparse: sparse: bad integer constant expression
   sound/soc/sophgo/cv1800b-tdm.c:714:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   sound/soc/sophgo/cv1800b-tdm.c:715:1: sparse: sparse: bad integer constant expression
   sound/soc/sophgo/cv1800b-tdm.c:715:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   sound/soc/sophgo/cv1800b-tdm.c:716:1: sparse: sparse: bad integer constant expression
   sound/soc/sophgo/cv1800b-tdm.c:716:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   sound/soc/sophgo/cv1800b-tdm.c:716:1: sparse: sparse: bad integer constant expression
   sound/soc/sophgo/cv1800b-tdm.c:716:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +714 sound/soc/sophgo/cv1800b-tdm.c

e6e8fec61f92f0 Anton D. Stavinskii 2026-01-19  713  
e6e8fec61f92f0 Anton D. Stavinskii 2026-01-19 @714  MODULE_DESCRIPTION("Sophgo cv1800b I2S/TDM driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
