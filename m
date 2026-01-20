Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D213D667F
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Jan 2026 14:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768919362; cv=none; b=Hotst2K4Rtht9qcDNIn7zwgDztrVTNURvrJSQKhUVPpvz+xVGjGNy+k2hyUzUj8p5EuHcAibiGjcQyhoszxIzn9z8VNSvUdolTSEqmpJT+WUNNC1W1Sr9z6SoceMqJX2dmHSaTt6vm6Y1gXWLpmLIuR/hwjeIrHojtHsGFc67Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768919362; c=relaxed/simple;
	bh=G2iYx0sK7hjZachp9auFg6Slq3xm9GR5o9FqBcIQ6BE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NqlmH9elbkKGlY8ptVq3x01htv8QLvUU2bKVwm+MMkvlHVEDd4P7WPwxVA7qFDUHcdjtSQtTHQ1BAMayQwISgowSNeI+7OyY6cKHbhFTipwThx+yC0a24S8qe2CmEED4OqPa7CKir5TkuTDgDLZvEfiRDbxr20t+POmRvMoc5wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bFvLH4zf; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bFvLH4zf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768919360; x=1800455360;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G2iYx0sK7hjZachp9auFg6Slq3xm9GR5o9FqBcIQ6BE=;
  b=bFvLH4zfdJgRO0gKtlz/PESFWkglIJ6xkjequMcsJleERfFJG5gX1kwn
   dkuyH1g1jig7+PCSWHjhqbH/+aukke3EeSiF+5XnX+hBHMRLzU44x9Bp7
   3oyKh+BM1DtY57+J3xPw9C4pm6AWLrOursA5GK2ovNBGrfp+KyJLWJL+u
   8wlx1x/q7E14f1N6TxOa8l3+uP4R3aC3CkFkqbYAqlJ8a93zEZV1keotH
   Ofsyt91btG6GPhQq4kgNYcSNFOwrnweGWPrDdoO4ZPZM1FQfsU5PJbPyb
   NMbLbH9i97JvAht4nMifW+gPUW6y9mLDFkeLEQWViI/HsAy+LtZtvyBq8
   g==;
X-CSE-ConnectionGUID: T/vir+X/QLSHyBDHO+yE7Q==
X-CSE-MsgGUID: bhwqja8DQMyH+ANXwCd0nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70028336"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="70028336"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 06:29:19 -0800
X-CSE-ConnectionGUID: AAiL891MRIOQEvtVdbjccQ==
X-CSE-MsgGUID: x2NP3skqRHiCzPXvyxEs9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="205755313"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Jan 2026 06:29:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viCjM-00000000P5J-24uF;
	Tue, 20 Jan 2026 14:29:16 +0000
Date: Tue, 20 Jan 2026 22:28:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 4/6] ASoC: sophgo: add CV1800B internal ADC codec
 driver
Message-ID: <202601202249.6qSKIByF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: sound/soc/sophgo/cv1800b-sound-adc.c:320:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260119-cv1800b-i2s-driver-v3-4-04006f4111d7@gmail.com>
References: <20260119-cv1800b-i2s-driver-v3-4-04006f4111d7@gmail.com>
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
patch link:    https://lore.kernel.org/r/20260119-cv1800b-i2s-driver-v3-4-04006f4111d7%40gmail.com
patch subject: [PATCH v3 4/6] ASoC: sophgo: add CV1800B internal ADC codec driver
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: arc-randconfig-r131-20260120 (https://download.01.org/0day-ci/archive/20260120/202601202249.6qSKIByF-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601202249.6qSKIByF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601202249.6qSKIByF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/sophgo/cv1800b-sound-adc.c:320:1: sparse: sparse: bad integer constant expression
   sound/soc/sophgo/cv1800b-sound-adc.c:320:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   sound/soc/sophgo/cv1800b-sound-adc.c:321:1: sparse: sparse: bad integer constant expression
   sound/soc/sophgo/cv1800b-sound-adc.c:321:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   sound/soc/sophgo/cv1800b-sound-adc.c:322:1: sparse: sparse: bad integer constant expression
   sound/soc/sophgo/cv1800b-sound-adc.c:322:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   sound/soc/sophgo/cv1800b-sound-adc.c:322:1: sparse: sparse: bad integer constant expression
   sound/soc/sophgo/cv1800b-sound-adc.c:322:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +320 sound/soc/sophgo/cv1800b-sound-adc.c

4d0d113dd2d0d3 Anton D. Stavinskii 2026-01-19  319  
4d0d113dd2d0d3 Anton D. Stavinskii 2026-01-19 @320  MODULE_DESCRIPTION("ADC codec for CV1800B");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
