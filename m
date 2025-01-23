Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7292820FA99
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Jan 2025 14:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737643547; cv=none; b=Sdbk3uUUGoWnNDDMh2AFy1R71fppfUh3kdY2tLi1MYuzpv9JfJ++YGmnSWE0jRmyf309jsB6H/uvyipfRzfo8jNaC/OLu37geKoibWMtj96rU0repO15PEY7ynytjBZGYGBmETvgnIGC+g8WIYcnTnBkqxznjMwK+Nt6hu7kWaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737643547; c=relaxed/simple;
	bh=RR9wZwoEoWEqhd3B9G6Vi6NiaMxIwz0BDyEY3wRtPCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QB6bFmKB49ULPXlyKvHziHyALFxuV75ahTibFA9Cp7yiQUzbFsE2k5IKcp5Nw5hHUJGgTOdjVwHDkUhlfvswSEr36+0ZVQ6hDw+avPbsjbup0CWV3QEbF8TwryjSn5qwSZLnHQw1toI1kT3isF3vwJwZ94eBmo+Uu7CsNhCMMJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H3byynSs; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H3byynSs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737643545; x=1769179545;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RR9wZwoEoWEqhd3B9G6Vi6NiaMxIwz0BDyEY3wRtPCQ=;
  b=H3byynSsz0+93s65scLbNiQ+EdwM5rzWMb3fyNJPkuLh7h/sA6eaZjxd
   OWmJ/+9aLnNeuJXcdJlXr63UXIyaoLaFSyi1b4SMZEJZ3v4DJdBRnuf3E
   sgrhZ9isKqpQdGXmxq6rTug7U/fYNyDIBnzosrnn4ZN9uD80VefgtEla8
   x7jhpljM13g+OYNLHAiJ5ozo0WaNdqb26RSjE4LPXQ0ovdXswsHMraJMl
   /0ZbojOu3a1myPw5iSHYL2KLYnaiS8VVTOAI6GNMtOeJ0jQudje+G++Tu
   x9Xg5LFNDRscDJ0doUtLX+goz4T5ouImYB67W0yOu7msp3WepTYSZugtk
   A==;
X-CSE-ConnectionGUID: 9UgyeaKXRqW0uUSHoj/r0g==
X-CSE-MsgGUID: LD3chXdKSJKE08Xi/gmpKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="48642274"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="48642274"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 06:45:42 -0800
X-CSE-ConnectionGUID: CaPLhIGCSHGW6njQVXxYdQ==
X-CSE-MsgGUID: Jx5h2499TheBjHitKBcLLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="107394753"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Jan 2025 06:45:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taySi-000bIH-0D;
	Thu, 23 Jan 2025 14:45:40 +0000
Date: Thu, 23 Jan 2025 22:45:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:b4/sm8750-display-dts-and-panel 31/74]
 arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/remoteproc@4080000: failed
 to match any schema with compatible: ['qcom,sm8750-mpss-pas']
Message-ID: <202501232209.I4rneGeZ-lkp@intel.com>
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
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

tree:   https://github.com/krzk/linux b4/sm8750-display-dts-and-panel
head:   3d4ec7553fa4310579528818ee68ffff4b614b66
commit: 9f8baac898d48c91509d050f98425f22ea9bb852 [31/74] arm64: dts: qcom: sm8750: Add Modem / MPSS
:::::: branch date: 26 hours ago
:::::: commit date: 27 hours ago
config: arm64-randconfig-051-20250123 (https://download.01.org/0day-ci/archive/20250123/202501232209.I4rneGeZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501232209.I4rneGeZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501232209.I4rneGeZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: remoteproc@32300000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-cdsp-pas', 'qcom,sm8650-cdsp-pas'] is too long
   	'qcom,sm8750-cdsp-pas' is not one of ['qcom,sdx75-mpss-pas', 'qcom,sm8550-adsp-pas', 'qcom,sm8550-cdsp-pas', 'qcom,sm8550-mpss-pas', 'qcom,sm8650-adsp-pas', 'qcom,sm8650-cdsp-pas', 'qcom,sm8650-mpss-pas', 'qcom,x1e80100-adsp-pas', 'qcom,x1e80100-cdsp-pas']
   	'qcom,sm8750-adsp-pas' was expected
   	'qcom,sm8550-adsp-pas' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml#
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/remoteproc@32300000: failed to match any schema with compatible: ['qcom,sm8750-cdsp-pas', 'qcom,sm8650-cdsp-pas']
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/remoteproc@4080000: failed to match any schema with compatible: ['qcom,sm8750-mpss-pas']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
