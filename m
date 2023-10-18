Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D8014F76
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Oct 2023 08:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ikd7Zppy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697616628; x=1729152628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QPf0vke86uSMX5glewK0iTnXqGujEreqxO1hSgN8vxE=;
  b=ikd7ZppyGcURIbASH0eu3t1MwuFJHPa6dH9C9CYmNABZdEvUFX0Gaikp
   DfuUiRPZtemD4jWPCWrB9nGuIlXZ0BkpruvFzBMQU/OXdpfHklCuLcAOR
   Djasm0TyZ7EoC/zzbbU0TCRvQzO2VzK8CbUzpaa+69iegu0/lkyIfte8c
   WHSiBK89ABwLcLTo4M+ZUDJv18nf7BYAfGgnRQ25Ank4PNiHj1Zs5q549
   P094wIPVqXy8jMnh1cWMDwm2bkW637YisVmIs0XzeN/ZnrNA8/AaJNfQw
   gXhFanweD+qM4CasrrN0Jx9WGG2x2OcMqEdLOTXEFUi/boKIF/QtvAKI5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="388827749"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="388827749"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 01:10:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="706342195"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="706342195"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Oct 2023 01:10:26 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qt1dI-00006u-0D;
	Wed, 18 Oct 2023 08:10:24 +0000
Date: Wed, 18 Oct 2023 16:10:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 4/8] clk: qcom: apss-ipq6018: ipq5332: add safe source
 switch for a53pll
Message-ID: <202310181650.g8THtfsm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <000c61a028814f08a9fc6d1d5c446e8dad11a650.1697101543.git.quic_varada@quicinc.com>
References: <000c61a028814f08a9fc6d1d5c446e8dad11a650.1697101543.git.quic_varada@quicinc.com>
TO: Varadarajan Narayanan <quic_varada@quicinc.com>
TO: agross@kernel.org
TO: andersson@kernel.org
TO: konrad.dybcio@linaro.org
TO: robh+dt@kernel.org
TO: krzysztof.kozlowski+dt@linaro.org
TO: conor+dt@kernel.org
TO: mturquette@baylibre.com
TO: sboyd@kernel.org
TO: rafael@kernel.org
TO: viresh.kumar@linaro.org
TO: ilia.lin@kernel.org
TO: quic_kathirav@quicinc.com
TO: linux-arm-msm@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-clk@vger.kernel.org
TO: linux-pm@vger.kernel.org
CC: Varadarajan Narayanan <quic_varada@quicinc.com>

Hi Varadarajan,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.6-rc6 next-20231018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Varadarajan-Narayanan/clk-qcom-clk-alpha-pll-introduce-stromer-plus-ops/20231017-104355
base:   linus/master
patch link:    https://lore.kernel.org/r/000c61a028814f08a9fc6d1d5c446e8dad11a650.1697101543.git.quic_varada%40quicinc.com
patch subject: [PATCH v2 4/8] clk: qcom: apss-ipq6018: ipq5332: add safe source switch for a53pll
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: loongarch-randconfig-001-20231018 (https://download.01.org/0day-ci/archive/20231018/202310181650.g8THtfsm-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310181650.g8THtfsm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310181650.g8THtfsm-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/clk/qcom/apss-ipq6018.o: in function `apss_ipq6018_probe':
>> apss-ipq6018.c:(.text+0xd0): undefined reference to `qcom_smem_get_soc_id'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
