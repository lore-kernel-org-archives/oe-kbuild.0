Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8ED51814F
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Oct 2026 12:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792068399; cv=none; b=Cal35HjSX9zC/vWka4A+D4amT2o+LBN+85drP4lyO4m6P3dSmEIJA6rAY4O2o+GPvpMdWYB3eyhbEN+DUC0K0O5YPsTEZ+UDd8YykMnIQXjcGEMz6Amu1dC1Pu8zr92LApvEgT8CTzAeUWtXcjEJxUkmcBmy+j97B6RBpFd733k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792068399; c=relaxed/simple;
	bh=O9R9VZvNwJklBgMZCw0OO6dZxUjEMq9HEdTQiSs0FQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s9DJWg+Dk2Eq/7nduLE9uHzVCZL/cf9WvUI+tFmPD/fWhzsh1Bu0j0pE5Oumd6RrLCelECzOAhhs5ap0Ve0RUw6Pp9knvagEGPhrMtUGRAEEQgLW+hgXqOwjrrvHk7aKdGv1DzJ0oA1M7bJM+A84UpVBSHOe+4mz76v0CC4lqVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IjGhBNuf; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IjGhBNuf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792068397; x=1823604397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O9R9VZvNwJklBgMZCw0OO6dZxUjEMq9HEdTQiSs0FQI=;
  b=IjGhBNuf0TirCPB+Dld/fRMLL7pw5qEyLdS4MTSjlhG7XsJVfXo68SJr
   NhpvzWPDJ3zkNDGvdEGTHqic57hY7YEb9BqXUiINxW/H5Nz+m0bKiGvhI
   TTa0Y3hrUKB6XU6zm8TLt7ntq/lRrg6rXtXIOIYdQWTLLD/RRYS0rHcLR
   Hzh56DZZnEDxMVDZdMpTXrz0DtVgY3dLBvM4j0yVXEq9g3XetRhFsb1Hf
   tzpYcgMyPqsSjtssRb0CxPFLhbinTTwFfATBFxOsYPY17mx5yLBlEVCsX
   +Hz2Kq2v27YA6isRFeUXFttu8hASCdWx6wP6WET4eYdKSQ75OovBifY1X
   A==;
X-CSE-ConnectionGUID: 6Sa5rNAeSOaRduC42Iiaxw==
X-CSE-MsgGUID: ipykTkVqRXKbtXV5Jd7CFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="735994"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="735994"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 05:46:36 -0700
X-CSE-ConnectionGUID: YiVlV2ZeSgquP2AcA/Eq6A==
X-CSE-MsgGUID: XqwbjUYIRJqmGGhu8iQ0+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1702160"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 15 Oct 2026 05:46:36 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHKqv-00000000Bhn-2KcP;
	Thu, 15 Oct 2026 12:46:33 +0000
Date: Thu, 15 Oct 2026 14:45:34 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: cypress,cypd4226: Add
 cypd6129/cypd6229 support
Message-ID: <202610151448.T0qpz4x8-lkp@intel.com>
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
In-Reply-To: <20261012091658.635441-2-akash.kumar@oss.qualcomm.com>
References: <20261012091658.635441-2-akash.kumar@oss.qualcomm.com>
TO: Akash Kumar <akash.kumar@oss.qualcomm.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Dmitry Baryshkov <lumag@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-usb@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org

Hi Akash,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus robh/for-next linus/master v7.3-rc7 next-20261014]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Akash-Kumar/dt-bindings-usb-cypress-cypd4226-Add-cypd6129-cypd6229-support/20261012-144657
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20261012091658.635441-2-akash.kumar%40oss.qualcomm.com
patch subject: [PATCH v3 1/2] dt-bindings: usb: cypress,cypd4226: Add cypd6129/cypd6229 support
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261015/202610151448.T0qpz4x8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610151448.T0qpz4x8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610151448.T0qpz4x8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/monaco.dtsi:5860.27-5929.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/monaco-arduino-monza.dtb: typec@8 (cypress,cypd4226): False schema does not allow [[142]]
   	from schema $id: http://devicetree.org/schemas/usb/cypress,cypd4226.yaml
>> arch/arm64/boot/dts/qcom/monaco-arduino-monza.dtb: typec@8 (cypress,cypd4226): False schema does not allow ['default']
   	from schema $id: http://devicetree.org/schemas/usb/cypress,cypd4226.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
