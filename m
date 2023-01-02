Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DA517F1
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Jan 2023 14:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672669958; x=1704205958;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IC011c2qwatRTUxSQ/panxPlAGH+vik9+xfr6RGJ518=;
  b=HljKDcp0zrvQkT0gq2reFFzHRwRCGmPGtb4UgfHNoIbqJHOyiEy4ryoc
   Ht5KDubqTsONZlq/CUqHg3kjB17KQrnPA6SjrqRvTHHIGxkHFeq15zIdy
   qLwHmCxKdRbs3ERS7bdFwQEO1Cp97XJ2i3DtsifEtJKiGPtAP4FM/sArs
   EVBmiFUxpDRpsMHeV9yI8794YrbhhQr94IP5vMuLK6ghI/BvOzGjDASaa
   3RQUZAUVvubiBdeMhVIQSkMEnMEKqhgAD73bHg3/myNbYeaOJGCIOFlSY
   gBb4Ius+Lyhddo9rwqNHpTgpQmK2thaY+bR4cfWV9xTN8qsYdMpyJvRh8
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="383793482"
X-IronPort-AV: E=Sophos;i="5.96,294,1665471600"; 
   d="scan'208";a="383793482"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2023 06:32:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="899893633"
X-IronPort-AV: E=Sophos;i="5.96,294,1665471600"; 
   d="scan'208";a="899893633"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 02 Jan 2023 06:32:36 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pCLrf-000RBV-2M;
	Mon, 02 Jan 2023 14:32:35 +0000
Date: Mon, 2 Jan 2023 22:31:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/130-cpufreq 2/3]
 drivers/cpufreq/apple-soc-cpufreq.c:143:3: warning: Assignment of function
 parameter has no effect outside the function. [uselessAssignmentArg]
Message-ID: <202301022224.HqopMwDG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/cpufreq/apple-soc-cpufreq.c:143:3: warning: Assignment of function parameter has no effect outside the function. [uselessAssignmentArg]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Hector Martin <marcan@marcan.st>

tree:   https://github.com/AsahiLinux/linux bits/130-cpufreq
head:   7e8e9ffcf2a22addd94d17ca073670ad4b081619
commit: c559623fb774e24213e47ef6fa6b7b0821ad851a [2/3] cpufreq: apple-soc: Add new driver to control Apple SoC CPU P-states
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout c559623fb774e24213e47ef6fa6b7b0821ad851a
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/cpufreq/apple-soc-cpufreq.c:143:3: warning: Assignment of function parameter has no effect outside the function. [uselessAssignmentArg]
     index = priv->info->max_pstate;
     ^
>> drivers/mailbox/mailbox.c:564:76: warning: Parameter 'data' can be declared as pointer to const [constParameter]
   static int devm_mbox_controller_match(struct device *dev, void *res, void *data)
                                                                              ^
--
>> drivers/iommu/io-pgtable-arm.c:894:9: warning: Signed integer overflow for expression '0xf4<<(3<<3)'. [integerOverflow]
           << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_INC_OCACHE));
           ^
>> drivers/iommu/io-pgtable-arm.c:1126:46: warning: Parameter 'cookie' can be declared as pointer to const [constParameter]
   static void __init dummy_tlb_flush_all(void *cookie)
                                                ^
   drivers/iommu/io-pgtable-arm.c:1132:30: warning: Parameter 'cookie' can be declared as pointer to const [constParameter]
          size_t granule, void *cookie)
                                ^

vim +143 drivers/cpufreq/apple-soc-cpufreq.c

c559623fb774e2 Hector Martin 2022-02-15  133  
c559623fb774e2 Hector Martin 2022-02-15  134  static int apple_soc_cpufreq_set_target(struct cpufreq_policy *policy,
c559623fb774e2 Hector Martin 2022-02-15  135  					unsigned int index)
c559623fb774e2 Hector Martin 2022-02-15  136  {
c559623fb774e2 Hector Martin 2022-02-15  137  	struct apple_cpu_priv *priv = policy->driver_data;
c559623fb774e2 Hector Martin 2022-02-15  138  	unsigned int pstate = policy->freq_table[index].driver_data;
c559623fb774e2 Hector Martin 2022-02-15  139  	u64 reg;
c559623fb774e2 Hector Martin 2022-02-15  140  
c559623fb774e2 Hector Martin 2022-02-15  141  	/* Fallback for newer SoCs */
c559623fb774e2 Hector Martin 2022-02-15  142  	if (index > priv->info->max_pstate)
c559623fb774e2 Hector Martin 2022-02-15 @143  		index = priv->info->max_pstate;
c559623fb774e2 Hector Martin 2022-02-15  144  
c559623fb774e2 Hector Martin 2022-02-15  145  	if (readq_poll_timeout_atomic(priv->reg_base + APPLE_DVFS_CMD, reg,
c559623fb774e2 Hector Martin 2022-02-15  146  				      !(reg & APPLE_DVFS_CMD_BUSY), 2,
c559623fb774e2 Hector Martin 2022-02-15  147  				      APPLE_DVFS_TRANSITION_TIMEOUT)) {
c559623fb774e2 Hector Martin 2022-02-15  148  		return -EIO;
c559623fb774e2 Hector Martin 2022-02-15  149  	}
c559623fb774e2 Hector Martin 2022-02-15  150  
c559623fb774e2 Hector Martin 2022-02-15  151  	reg &= ~(APPLE_DVFS_CMD_PS1 | APPLE_DVFS_CMD_PS2);
c559623fb774e2 Hector Martin 2022-02-15  152  	reg |= FIELD_PREP(APPLE_DVFS_CMD_PS1, pstate);
c559623fb774e2 Hector Martin 2022-02-15  153  	reg |= FIELD_PREP(APPLE_DVFS_CMD_PS2, pstate);
c559623fb774e2 Hector Martin 2022-02-15  154  	reg |= APPLE_DVFS_CMD_SET;
c559623fb774e2 Hector Martin 2022-02-15  155  
c559623fb774e2 Hector Martin 2022-02-15  156  	writeq_relaxed(reg, priv->reg_base + APPLE_DVFS_CMD);
c559623fb774e2 Hector Martin 2022-02-15  157  
c559623fb774e2 Hector Martin 2022-02-15  158  	return 0;
c559623fb774e2 Hector Martin 2022-02-15  159  }
c559623fb774e2 Hector Martin 2022-02-15  160  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
