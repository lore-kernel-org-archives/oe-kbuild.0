Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E47934E74E
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Jan 2026 15:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767628781; cv=none; b=ceyaEI/lNyyw6QStTtq5qqYrErzPhP3i4NL8neB0cJQ/hXEkEsP0abOOALpocMlqFxE09dj+OgMn92m6R1lsHYqmFLLTosKrwxMD3wS4/dTxVYmN8kfAv3CwJMtjnSkK2D3I2J4aJbFWZBu6lPdJiH5HU+qFh/JGReyYKZhR31I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767628781; c=relaxed/simple;
	bh=l/rV/pJowCBRGIp1DBjjI+Gi0TAGvKRCKguMZNMhuiU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q6SsJaKtRyQAKDhyIlX6lcTjt2gXtnqWyL6PTBRunod64PT7EZsOY+dB+2mUPgN+D/8NeKwToYKuKkljasZDYteTtyLvV2xJBw34KBLAk0BmaMYalTdfMO4fSOh4VQwIKF4vmXfi6Qqd++F9NfhYfcXu39u7NKwsZjKE/HAEYhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e+vPZHaS; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e+vPZHaS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767628781; x=1799164781;
  h=date:from:to:cc:subject:message-id;
  bh=l/rV/pJowCBRGIp1DBjjI+Gi0TAGvKRCKguMZNMhuiU=;
  b=e+vPZHaSFBPW8ZSrprC08B/g7K1IGCZXvgULCxqZvH5U1KvvTJUbWb8b
   tN/4kioNGwb3ar6QjVYCZEHtNt1LqWQowJD+BRfeL4WlpzVnlg2bBT0eO
   YadX2eoWaB64IXnHrQCsnrUTXQ4BTuBk+yWqYpLCrUjLa3+FqxLzPZbtz
   FdXwtJClZALnXD1cxqVYrjUKSOOYRUwOh5F58gq4ZclXDG1YJ9JDi+45/
   DtCnDT1nKH7/lbqfpyAsogOwbZwwkLPrlOZoruXXm2g2L1oOyfoR4LPnD
   eqSpBJILJ1gbs0wpRnxtQn2xllBi60IQP6VE+TlZWhC9G+e/24TT7A5K8
   Q==;
X-CSE-ConnectionGUID: zOZA5JRBRY+SLqcD48tGQA==
X-CSE-MsgGUID: eF3gLyjIS4G80iCaOUJ/IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="79298797"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="79298797"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 07:59:40 -0800
X-CSE-ConnectionGUID: hddHY939TSmn/B3fGfVbVg==
X-CSE-MsgGUID: SYYGiGJ5SImQXqD73tfIjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="201540454"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 05 Jan 2026 07:59:39 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcmzY-0000000019l-2DGK;
	Mon, 05 Jan 2026 15:59:36 +0000
Date: Mon, 05 Jan 2026 16:59:31 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.20 22/100]
 arch/arm64/boot/dts/qcom/sm8650-hdk-display-card-rear-camera-card.dtb:
 /soc@0/cci@ac16000/i2c-bus@0/sensor@56: failed to match any schema with
 compatible: ['samsung,s5kjn1']
Message-ID: <202601051600.8lC0zAlg-lkp@intel.com>
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
TO: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.20
head:   3af51501e2b8c87564b5cda43b0e5c316cf54717
commit: 1c20a021de58a23bdc264b91d75e944d19e49ba2 [22/100] arm64: dts: qcom: sm8650-hdk: Add support for the Rear Camera Card overlay
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2051-20260104 (https://download.01.org/0day-ci/archive/20260105/202601051600.8lC0zAlg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260105/202601051600.8lC0zAlg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601051600.8lC0zAlg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card-rear-camera-card.dtb: /soc@0/cci@ac16000/i2c-bus@0/sensor@56: failed to match any schema with compatible: ['samsung,s5kjn1']
--
>> arch/arm64/boot/dts/qcom/sm8650-hdk-rear-camera-card.dtb: /soc@0/cci@ac16000/i2c-bus@0/sensor@56: failed to match any schema with compatible: ['samsung,s5kjn1']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
