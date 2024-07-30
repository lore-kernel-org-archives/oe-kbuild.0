Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05AA18F2FF
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Jul 2024 12:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722342519; cv=none; b=HLE6ftqZNKCGwlgUyJhvdFHuWkUF+fefFovEMMAPm+Bx4k8OBBMq0Tm+YIgJFHr+p4ZzHIq124uGdp+Ee35+JdglpmGxjif+lTfh4uGHpVeEi9mBnCVtsgPx7wHbs/+NlkTX1uZ30OLxG9Wm2t2AaH+zGezkI/LIk4m70phexU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722342519; c=relaxed/simple;
	bh=ELZNs0OWl9M7KnOFhoEWlrIDy1pqX7rlKwQtDhg8xx0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A6VyIWOBf/FPNVqdtEkJ4JGHb33pY0LdTXBL5gclp92QM1rDdTZ9XW1MPpOoZhvGthGPagDy6+gZ6xWjiZzuxCVmDsbUwL8rgf10YZ+LnRe3g3VM0bNsFZ9GOcqHjreqmN2k7t/IOt3HIXeD5NQPaIDrLuda9eCN/C3iCzEQLUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EseHFNkT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EseHFNkT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722342518; x=1753878518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ELZNs0OWl9M7KnOFhoEWlrIDy1pqX7rlKwQtDhg8xx0=;
  b=EseHFNkT8EgPvVuZVbJT5+wVMVXhcNevp5fT7kB6b7HEql5oAeo1wHBe
   aahGvMhsFIt6gswdPwi4fGrgXeer502tv5XEM8hSQTqT9SO37cegFPZwJ
   YrLSTnJ3GIHEg1kR2u2+iNZb8XNLNjQbCgGlw+UOG+HFaFqb+QKAC5mnx
   rfJQou9W9dYybQeVQ3eaIt5j36xhEr8jtVQsyiHZPKg0iyWky51chcd2y
   u4gpnsx7WfOdVq6iPwaPxRHUSRakJaweDzC3kgZSAC/w0zgepJyU2NejP
   w0KbA57zfS+0z75eFk+1N4bRvsGFWPIq/dppG7BUAKEon6/cMODgHEciA
   Q==;
X-CSE-ConnectionGUID: BTpKEQ0JQla9hbPgHSDIiQ==
X-CSE-MsgGUID: jjh7xJ0mSVe4jo1/l0U0xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="37664922"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="37664922"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 05:28:37 -0700
X-CSE-ConnectionGUID: jJQPML8GSf2TLVDTC80Ing==
X-CSE-MsgGUID: 2xYwQowETJ+2Kg7wnBDojQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="59401088"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Jul 2024 05:28:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYlxx-000spb-2J;
	Tue, 30 Jul 2024 12:28:33 +0000
Date: Tue, 30 Jul 2024 20:28:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mediatek:v6.11-next/dts64 2/5]
 arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic: 'adc' does not match any
 of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202407302005.LFBzvmlU-lkp@intel.com>
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
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git v6.11-next/dts64
head:   98ef7cef1b3a5d73b5023c8661534768810dd941
commit: b0a4ce81f327eae06c1088f1a437edc48a94a3e8 [2/5] arm64: dts: mediatek: Add ADC node on MT6357, MT6358, MT6359 PMICs
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: arm64-randconfig-051-20240730 (https://download.01.org/0day-ci/archive/20240730/202407302005.LFBzvmlU-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ccae7b461be339e717d02f99ac857cf0bc7d17fc)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240730/202407302005.LFBzvmlU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407302005.LFBzvmlU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic: 'adc' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
