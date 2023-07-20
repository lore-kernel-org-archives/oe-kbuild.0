Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0DF2FA49
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Jul 2023 20:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689886250; x=1721422250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q/WRzXqo5IU7wKpFJqcnzqXEk/hPcG0P9KGXoYHMQWM=;
  b=FtU5YfVSBxlueoQq1mNk1/5TX4s2qr2f5ORQZ+3eCAuf86/dQ6+GC3z7
   xexMJRwEGRU0lvqizul2LQJPz9UVSZEmcdfyJ+a9cg/4otTf0LXReBW+Z
   LO/ncjNBXI+yZqIElSoF2WXqKJYz4AFqh1cCmo6TqzR3XV+YgxshvCPQO
   J185303b1bG5sw74Lww0kgiQG9UEJ2qlEoY5glukQEOy5g+Aqy1d9GNpz
   Z26G7k66/KfCNSKO0kLciYQ/83DbwGFsxtN+ME59BD9hj3lFe5erCaqKC
   gUnZGJH+CLiLtmyQ6Zh3SVzPZFc9+hTeuGN4HQykjeS7bFRNQZZ5cUFYc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="370459363"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="370459363"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 13:50:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="971168002"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="971168002"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 20 Jul 2023 13:50:48 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMabn-0006VN-39;
	Thu, 20 Jul 2023 20:50:47 +0000
Date: Fri, 21 Jul 2023 04:50:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 08/15] OPP: Introduce dev_pm_opp_get_freq_indexed() API
Message-ID: <202307210431.3S4SeXVw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230720054100.9940-9-manivannan.sadhasivam@linaro.org>
References: <20230720054100.9940-9-manivannan.sadhasivam@linaro.org>
TO: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
TO: vireshk@kernel.org
TO: nm@ti.com
TO: sboyd@kernel.org
TO: myungjoo.ham@samsung.com
TO: kyungmin.park@samsung.com
TO: cw00.choi@samsung.com
TO: andersson@kernel.org
TO: konrad.dybcio@linaro.org
TO: robh+dt@kernel.org
TO: krzysztof.kozlowski+dt@linaro.org
TO: conor+dt@kernel.org
TO: jejb@linux.ibm.com
TO: martin.petersen@oracle.com
CC: alim.akhtar@samsung.com
CC: avri.altman@wdc.com
CC: bvanassche@acm.org
CC: linux-scsi@vger.kernel.org
CC: linux-pm@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: quic_asutoshd@quicinc.com
CC: quic_cang@quicinc.com
CC: quic_nitirawa@quicinc.com
CC: quic_narepall@quicinc.com
CC: quic_bhaskarv@quicinc.com
CC: quic_richardp@quicinc.com
CC: quic_nguyenb@quicinc.com
CC: quic_ziqichen@quicinc.com
CC: bmasney@redhat.com
CC: krzysztof.kozlowski@linaro.org

Hi Manivannan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on mkp-scsi/for-next jejb-scsi/for-next linus/master v6.5-rc2 next-20230720]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Manivannan-Sadhasivam/dt-bindings-ufs-common-add-OPP-table/20230720-134720
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230720054100.9940-9-manivannan.sadhasivam%40linaro.org
patch subject: [PATCH v2 08/15] OPP: Introduce dev_pm_opp_get_freq_indexed() API
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: i386-randconfig-m041-20230720 (https://download.01.org/0day-ci/archive/20230721/202307210431.3S4SeXVw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307210431.3S4SeXVw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307210431.3S4SeXVw-lkp@intel.com/

New smatch warnings:
drivers/opp/core.c:213 dev_pm_opp_get_freq_indexed() warn: variable dereferenced before IS_ERR check 'opp' (see line 211)

Old smatch warnings:
drivers/opp/core.c:254 dev_pm_opp_get_required_pstate() warn: variable dereferenced before IS_ERR check 'opp' (see line 252)
drivers/opp/core.c:2458 _opp_attach_genpd() warn: passing zero to 'PTR_ERR'

vim +/opp +213 drivers/opp/core.c

e1f60b292ffd61 drivers/base/power/opp.c Nishanth Menon        2010-10-13  199  
a772c36cb3fb41 drivers/opp/core.c       Manivannan Sadhasivam 2023-07-20  200  /**
a772c36cb3fb41 drivers/opp/core.c       Manivannan Sadhasivam 2023-07-20  201   * dev_pm_opp_get_freq_indexed() - Gets the frequency corresponding to an
a772c36cb3fb41 drivers/opp/core.c       Manivannan Sadhasivam 2023-07-20  202   *				   available opp with specified index
a772c36cb3fb41 drivers/opp/core.c       Manivannan Sadhasivam 2023-07-20  203   * @opp: opp for which frequency has to be returned for
a772c36cb3fb41 drivers/opp/core.c       Manivannan Sadhasivam 2023-07-20  204   * @index: index of the frequency within the required opp
a772c36cb3fb41 drivers/opp/core.c       Manivannan Sadhasivam 2023-07-20  205   *
a772c36cb3fb41 drivers/opp/core.c       Manivannan Sadhasivam 2023-07-20  206   * Return: frequency in hertz corresponding to the opp with specified index,
a772c36cb3fb41 drivers/opp/core.c       Manivannan Sadhasivam 2023-07-20  207   * else return 0
a772c36cb3fb41 drivers/opp/core.c       Manivannan Sadhasivam 2023-07-20  208   */
a772c36cb3fb41 drivers/opp/core.c       Manivannan Sadhasivam 2023-07-20  209  unsigned long dev_pm_opp_get_freq_indexed(struct dev_pm_opp *opp, u32 index)
a772c36cb3fb41 drivers/opp/core.c       Manivannan Sadhasivam 2023-07-20  210  {
a772c36cb3fb41 drivers/opp/core.c       Manivannan Sadhasivam 2023-07-20 @211  	struct opp_table *opp_table = opp->opp_table;
a772c36cb3fb41 drivers/opp/core.c       Manivannan Sadhasivam 2023-07-20  212  
a772c36cb3fb41 drivers/opp/core.c       Manivannan Sadhasivam 2023-07-20 @213  	if (IS_ERR_OR_NULL(opp) || index >= opp_table->clk_count) {
a772c36cb3fb41 drivers/opp/core.c       Manivannan Sadhasivam 2023-07-20  214  		pr_err("%s: Invalid parameters\n", __func__);
a772c36cb3fb41 drivers/opp/core.c       Manivannan Sadhasivam 2023-07-20  215  		return 0;
a772c36cb3fb41 drivers/opp/core.c       Manivannan Sadhasivam 2023-07-20  216  	}
a772c36cb3fb41 drivers/opp/core.c       Manivannan Sadhasivam 2023-07-20  217  
a772c36cb3fb41 drivers/opp/core.c       Manivannan Sadhasivam 2023-07-20  218  	return opp->rates[index];
a772c36cb3fb41 drivers/opp/core.c       Manivannan Sadhasivam 2023-07-20  219  }
a772c36cb3fb41 drivers/opp/core.c       Manivannan Sadhasivam 2023-07-20  220  EXPORT_SYMBOL_GPL(dev_pm_opp_get_freq_indexed);
a772c36cb3fb41 drivers/opp/core.c       Manivannan Sadhasivam 2023-07-20  221  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
