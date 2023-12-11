Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA24547A7B
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Dec 2023 14:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QPHUmU1s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702304668; x=1733840668;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=idr4ckjLbpzBFCFZCSuReP4s3JrOYvvRrJkNSUOog2g=;
  b=QPHUmU1s/ZugPDntq3Vq4TZ1b8DCCkifOHXGZaHXRcsXuZhRxkQYbMNa
   TgS600tObTyeimoddKUFzKSWQkVOuVITpZwG13ta3cCDXsSASuz8LYGsM
   3+YQsHs69GMvdxB7usaJRdp8+HPAsKe2s5Twklm9pAVOtECtYP9EoktCA
   pePFCoFUg1cGlyENBdxJs9tohRKw+sLI58KhG69kplDUBc7W2rM7ktqJF
   VGOc4cNNG97ZMqApDP9MSmWMwfcI7WX16678uL/NFxdQvPVg52k5Ac89H
   hwCVwA1ttzU94tAehuGEGFfiKjBy/ZiGBTgt/3oFqjSVxpblIUK3oLqcz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="379648585"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="379648585"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 06:24:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="722820639"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="722820639"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 11 Dec 2023 06:24:26 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rChCq-000I5k-20;
	Mon, 11 Dec 2023 14:24:24 +0000
Date: Mon, 11 Dec 2023 22:23:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/soc/qcom/smsm.c:152:22: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202312112210.PJrAQM8A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only include/linux/compiler_types.h file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a39b6ac3781d46ba18193c9dbb2110f31e9bffe9
commit: 25fd529c34d063d1bef23742f2e8f8341c639dc3 sparse: group the defines by functionality
date:   3 years, 4 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 3 years, 4 months ago
config: sh-randconfig-r111-20231116 (https://download.01.org/0day-ci/archive/20231211/202312112210.PJrAQM8A-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231211/202312112210.PJrAQM8A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312112210.PJrAQM8A-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/qcom/smsm.c:152:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int [usertype] *local_state @@
   drivers/soc/qcom/smsm.c:152:22: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/soc/qcom/smsm.c:152:22: sparse:     got unsigned int [usertype] *local_state
   drivers/soc/qcom/smsm.c:164:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int [usertype] *local_state @@
   drivers/soc/qcom/smsm.c:164:9: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/soc/qcom/smsm.c:164:9: sparse:     got unsigned int [usertype] *local_state
>> drivers/soc/qcom/smsm.c:174:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int [usertype] * @@
   drivers/soc/qcom/smsm.c:174:23: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/soc/qcom/smsm.c:174:23: sparse:     got unsigned int [usertype] *
>> drivers/soc/qcom/smsm.c:206:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int [usertype] *remote_state @@
   drivers/soc/qcom/smsm.c:206:15: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/soc/qcom/smsm.c:206:15: sparse:     got unsigned int [usertype] *remote_state
   drivers/soc/qcom/smsm.c:245:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int [usertype] * @@
   drivers/soc/qcom/smsm.c:245:23: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/soc/qcom/smsm.c:245:23: sparse:     got unsigned int [usertype] *
   drivers/soc/qcom/smsm.c:247:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int [usertype] * @@
   drivers/soc/qcom/smsm.c:247:17: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/soc/qcom/smsm.c:247:17: sparse:     got unsigned int [usertype] *
   drivers/soc/qcom/smsm.c:272:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int [usertype] * @@
   drivers/soc/qcom/smsm.c:272:23: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/soc/qcom/smsm.c:272:23: sparse:     got unsigned int [usertype] *
   drivers/soc/qcom/smsm.c:274:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int [usertype] * @@
   drivers/soc/qcom/smsm.c:274:17: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/soc/qcom/smsm.c:274:17: sparse:     got unsigned int [usertype] *
   drivers/soc/qcom/smsm.c:569:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int [usertype] * @@
   drivers/soc/qcom/smsm.c:569:17: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/soc/qcom/smsm.c:569:17: sparse:     got unsigned int [usertype] *
--
>> drivers/soc/qcom/smp2p.c:218:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int [usertype] *value @@
   drivers/soc/qcom/smp2p.c:218:23: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/soc/qcom/smp2p.c:218:23: sparse:     got unsigned int [usertype] *value
   drivers/soc/qcom/smp2p.c:325:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int [usertype] *value @@
   drivers/soc/qcom/smp2p.c:325:22: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/soc/qcom/smp2p.c:325:22: sparse:     got unsigned int [usertype] *value
   drivers/soc/qcom/smp2p.c:328:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int [usertype] *value @@
   drivers/soc/qcom/smp2p.c:328:9: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/soc/qcom/smp2p.c:328:9: sparse:     got unsigned int [usertype] *value

vim +152 drivers/soc/qcom/smsm.c

c97c4090ff7229 Bjorn Andersson 2015-09-24  129  
c97c4090ff7229 Bjorn Andersson 2015-09-24  130  /**
c97c4090ff7229 Bjorn Andersson 2015-09-24  131   * smsm_update_bits() - change bit in outgoing entry and inform subscribers
c97c4090ff7229 Bjorn Andersson 2015-09-24  132   * @data:	smsm context pointer
c97c4090ff7229 Bjorn Andersson 2015-09-24  133   * @offset:	bit in the entry
c97c4090ff7229 Bjorn Andersson 2015-09-24  134   * @value:	new value
c97c4090ff7229 Bjorn Andersson 2015-09-24  135   *
c97c4090ff7229 Bjorn Andersson 2015-09-24  136   * Used to set and clear the bits in the outgoing/local entry and inform
c97c4090ff7229 Bjorn Andersson 2015-09-24  137   * subscribers about the change.
c97c4090ff7229 Bjorn Andersson 2015-09-24  138   */
c97c4090ff7229 Bjorn Andersson 2015-09-24  139  static int smsm_update_bits(void *data, u32 mask, u32 value)
c97c4090ff7229 Bjorn Andersson 2015-09-24  140  {
c97c4090ff7229 Bjorn Andersson 2015-09-24  141  	struct qcom_smsm *smsm = data;
c97c4090ff7229 Bjorn Andersson 2015-09-24  142  	struct smsm_host *hostp;
c97c4090ff7229 Bjorn Andersson 2015-09-24  143  	unsigned long flags;
c97c4090ff7229 Bjorn Andersson 2015-09-24  144  	u32 changes;
c97c4090ff7229 Bjorn Andersson 2015-09-24  145  	u32 host;
c97c4090ff7229 Bjorn Andersson 2015-09-24  146  	u32 orig;
c97c4090ff7229 Bjorn Andersson 2015-09-24  147  	u32 val;
c97c4090ff7229 Bjorn Andersson 2015-09-24  148  
c97c4090ff7229 Bjorn Andersson 2015-09-24  149  	spin_lock_irqsave(&smsm->lock, flags);
c97c4090ff7229 Bjorn Andersson 2015-09-24  150  
c97c4090ff7229 Bjorn Andersson 2015-09-24  151  	/* Update the entry */
c97c4090ff7229 Bjorn Andersson 2015-09-24 @152  	val = orig = readl(smsm->local_state);
c97c4090ff7229 Bjorn Andersson 2015-09-24  153  	val &= ~mask;
c97c4090ff7229 Bjorn Andersson 2015-09-24  154  	val |= value;
c97c4090ff7229 Bjorn Andersson 2015-09-24  155  
c97c4090ff7229 Bjorn Andersson 2015-09-24  156  	/* Don't signal if we didn't change the value */
c97c4090ff7229 Bjorn Andersson 2015-09-24  157  	changes = val ^ orig;
c97c4090ff7229 Bjorn Andersson 2015-09-24  158  	if (!changes) {
c97c4090ff7229 Bjorn Andersson 2015-09-24  159  		spin_unlock_irqrestore(&smsm->lock, flags);
c97c4090ff7229 Bjorn Andersson 2015-09-24  160  		goto done;
c97c4090ff7229 Bjorn Andersson 2015-09-24  161  	}
c97c4090ff7229 Bjorn Andersson 2015-09-24  162  
c97c4090ff7229 Bjorn Andersson 2015-09-24  163  	/* Write out the new value */
c97c4090ff7229 Bjorn Andersson 2015-09-24  164  	writel(val, smsm->local_state);
c97c4090ff7229 Bjorn Andersson 2015-09-24  165  	spin_unlock_irqrestore(&smsm->lock, flags);
c97c4090ff7229 Bjorn Andersson 2015-09-24  166  
c97c4090ff7229 Bjorn Andersson 2015-09-24  167  	/* Make sure the value update is ordered before any kicks */
c97c4090ff7229 Bjorn Andersson 2015-09-24  168  	wmb();
c97c4090ff7229 Bjorn Andersson 2015-09-24  169  
c97c4090ff7229 Bjorn Andersson 2015-09-24  170  	/* Iterate over all hosts to check whom wants a kick */
c97c4090ff7229 Bjorn Andersson 2015-09-24  171  	for (host = 0; host < smsm->num_hosts; host++) {
c97c4090ff7229 Bjorn Andersson 2015-09-24  172  		hostp = &smsm->hosts[host];
c97c4090ff7229 Bjorn Andersson 2015-09-24  173  
c97c4090ff7229 Bjorn Andersson 2015-09-24 @174  		val = readl(smsm->subscription + host);
c97c4090ff7229 Bjorn Andersson 2015-09-24  175  		if (val & changes && hostp->ipc_regmap) {
c97c4090ff7229 Bjorn Andersson 2015-09-24  176  			regmap_write(hostp->ipc_regmap,
c97c4090ff7229 Bjorn Andersson 2015-09-24  177  				     hostp->ipc_offset,
c97c4090ff7229 Bjorn Andersson 2015-09-24  178  				     BIT(hostp->ipc_bit));
c97c4090ff7229 Bjorn Andersson 2015-09-24  179  		}
c97c4090ff7229 Bjorn Andersson 2015-09-24  180  	}
c97c4090ff7229 Bjorn Andersson 2015-09-24  181  
c97c4090ff7229 Bjorn Andersson 2015-09-24  182  done:
c97c4090ff7229 Bjorn Andersson 2015-09-24  183  	return 0;
c97c4090ff7229 Bjorn Andersson 2015-09-24  184  }
c97c4090ff7229 Bjorn Andersson 2015-09-24  185  
c97c4090ff7229 Bjorn Andersson 2015-09-24  186  static const struct qcom_smem_state_ops smsm_state_ops = {
c97c4090ff7229 Bjorn Andersson 2015-09-24  187  	.update_bits = smsm_update_bits,
c97c4090ff7229 Bjorn Andersson 2015-09-24  188  };
c97c4090ff7229 Bjorn Andersson 2015-09-24  189  
c97c4090ff7229 Bjorn Andersson 2015-09-24  190  /**
c97c4090ff7229 Bjorn Andersson 2015-09-24  191   * smsm_intr() - cascading IRQ handler for SMSM
c97c4090ff7229 Bjorn Andersson 2015-09-24  192   * @irq:	unused
c97c4090ff7229 Bjorn Andersson 2015-09-24  193   * @data:	entry related to this IRQ
c97c4090ff7229 Bjorn Andersson 2015-09-24  194   *
c97c4090ff7229 Bjorn Andersson 2015-09-24  195   * This function cascades an incoming interrupt from a remote system, based on
c97c4090ff7229 Bjorn Andersson 2015-09-24  196   * the state bits and configuration.
c97c4090ff7229 Bjorn Andersson 2015-09-24  197   */
c97c4090ff7229 Bjorn Andersson 2015-09-24  198  static irqreturn_t smsm_intr(int irq, void *data)
c97c4090ff7229 Bjorn Andersson 2015-09-24  199  {
c97c4090ff7229 Bjorn Andersson 2015-09-24  200  	struct smsm_entry *entry = data;
c97c4090ff7229 Bjorn Andersson 2015-09-24  201  	unsigned i;
c97c4090ff7229 Bjorn Andersson 2015-09-24  202  	int irq_pin;
c97c4090ff7229 Bjorn Andersson 2015-09-24  203  	u32 changed;
c97c4090ff7229 Bjorn Andersson 2015-09-24  204  	u32 val;
c97c4090ff7229 Bjorn Andersson 2015-09-24  205  
c97c4090ff7229 Bjorn Andersson 2015-09-24 @206  	val = readl(entry->remote_state);
c97c4090ff7229 Bjorn Andersson 2015-09-24  207  	changed = val ^ entry->last_value;
c97c4090ff7229 Bjorn Andersson 2015-09-24  208  	entry->last_value = val;
c97c4090ff7229 Bjorn Andersson 2015-09-24  209  
c97c4090ff7229 Bjorn Andersson 2015-09-24  210  	for_each_set_bit(i, entry->irq_enabled, 32) {
c97c4090ff7229 Bjorn Andersson 2015-09-24  211  		if (!(changed & BIT(i)))
c97c4090ff7229 Bjorn Andersson 2015-09-24  212  			continue;
c97c4090ff7229 Bjorn Andersson 2015-09-24  213  
c97c4090ff7229 Bjorn Andersson 2015-09-24  214  		if (val & BIT(i)) {
c97c4090ff7229 Bjorn Andersson 2015-09-24  215  			if (test_bit(i, entry->irq_rising)) {
c97c4090ff7229 Bjorn Andersson 2015-09-24  216  				irq_pin = irq_find_mapping(entry->domain, i);
c97c4090ff7229 Bjorn Andersson 2015-09-24  217  				handle_nested_irq(irq_pin);
c97c4090ff7229 Bjorn Andersson 2015-09-24  218  			}
c97c4090ff7229 Bjorn Andersson 2015-09-24  219  		} else {
c97c4090ff7229 Bjorn Andersson 2015-09-24  220  			if (test_bit(i, entry->irq_falling)) {
c97c4090ff7229 Bjorn Andersson 2015-09-24  221  				irq_pin = irq_find_mapping(entry->domain, i);
c97c4090ff7229 Bjorn Andersson 2015-09-24  222  				handle_nested_irq(irq_pin);
c97c4090ff7229 Bjorn Andersson 2015-09-24  223  			}
c97c4090ff7229 Bjorn Andersson 2015-09-24  224  		}
c97c4090ff7229 Bjorn Andersson 2015-09-24  225  	}
c97c4090ff7229 Bjorn Andersson 2015-09-24  226  
c97c4090ff7229 Bjorn Andersson 2015-09-24  227  	return IRQ_HANDLED;
c97c4090ff7229 Bjorn Andersson 2015-09-24  228  }
c97c4090ff7229 Bjorn Andersson 2015-09-24  229  

:::::: The code at line 152 was first introduced by commit
:::::: c97c4090ff72297a878a37715bd301624b71c885 soc: qcom: smsm: Add driver for Qualcomm SMSM

:::::: TO: Bjorn Andersson <bjorn.andersson@sonymobile.com>
:::::: CC: Andy Gross <agross@codeaurora.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
