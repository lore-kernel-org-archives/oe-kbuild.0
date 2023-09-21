Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC60B641
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Sep 2023 12:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695300056; x=1726836056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zPBeaDaxdZTmIvHmu6sgOSdym4GV7g8JgJxY/9tR31w=;
  b=LwyXgTa+Q41Euc9TgZVv9ksV0lOyoi6LNaHt+x1ggYTSVS21ejHmjgRN
   lizCgqUp0UbyyRF6esBep7AhVu38akzga4yEgK/czXrvEWn9eCY8QwSXa
   0M+oOBkRSRziEQGYgdUFlLZ3+1rMa9J4QkD+Na2xFTJYdvPFjaRPO8hpV
   SxEUv3nx/yw0/BUdDG6q6ZtDr/k7dwG4OmFzyXXhYyYxicaxOrm2jfg10
   MmwNmIhfJkLiEhhSCduDMykMfSlDQjjVMMZjYUHIk5PHdG/dHIF3zpPpn
   AGqhAC3R410XaLQaRfox/wQw6W7MD+i7ThrEoDAdskIcvGNOwdDpHg2vf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="383246054"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="383246054"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 05:40:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="696714365"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="696714365"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 21 Sep 2023 05:40:48 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjIz6-0009yg-08;
	Thu, 21 Sep 2023 12:40:44 +0000
Date: Thu, 21 Sep 2023 20:39:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/scsi/advansys.c:4263:9: sparse: sparse: incorrect type in
 argument 1 (different base types)
Message-ID: <202309212005.Nt7I3aE2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Linus Walleij <linus.walleij@linaro.org>
CC: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   42dc814987c1feb6410904e58cfd4c36c4146150
commit: 437b6b35362b206fdf881fe6dea76720eedb6d25 parisc: Use the generic IO helpers
date:   1 year ago
:::::: branch date: 17 hours ago
:::::: commit date: 1 year ago
config: parisc-randconfig-r113-20230920 (https://download.01.org/0day-ci/archive/20230921/202309212005.Nt7I3aE2-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230921/202309212005.Nt7I3aE2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309212005.Nt7I3aE2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/scsi/advansys.c:4263:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4263:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4263:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4263:9: sparse: sparse: restricted __le32 degrades to integer
>> drivers/scsi/advansys.c:4263:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] value @@     got restricted __le16 [usertype] @@
   drivers/scsi/advansys.c:4263:9: sparse:     expected unsigned short [usertype] value
   drivers/scsi/advansys.c:4263:9: sparse:     got restricted __le16 [usertype]
   drivers/scsi/advansys.c:4263:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4263:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4263:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4263:9: sparse: sparse: restricted __le32 degrades to integer
>> drivers/scsi/advansys.c:4263:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] value @@     got restricted __le16 [usertype] @@
   drivers/scsi/advansys.c:4263:9: sparse:     expected unsigned short [usertype] value
   drivers/scsi/advansys.c:4263:9: sparse:     got restricted __le16 [usertype]
   drivers/scsi/advansys.c:4721:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4721:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4721:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4721:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4721:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] value @@     got restricted __le16 [usertype] @@
   drivers/scsi/advansys.c:4721:9: sparse:     expected unsigned short [usertype] value
   drivers/scsi/advansys.c:4721:9: sparse:     got restricted __le16 [usertype]
   drivers/scsi/advansys.c:4721:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4721:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4721:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4721:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4721:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] value @@     got restricted __le16 [usertype] @@
   drivers/scsi/advansys.c:4721:9: sparse:     expected unsigned short [usertype] value
   drivers/scsi/advansys.c:4721:9: sparse:     got restricted __le16 [usertype]
   drivers/scsi/advansys.c:4735:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4735:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4735:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4735:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4735:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] value @@     got restricted __le16 [usertype] @@
   drivers/scsi/advansys.c:4735:9: sparse:     expected unsigned short [usertype] value
   drivers/scsi/advansys.c:4735:9: sparse:     got restricted __le16 [usertype]
   drivers/scsi/advansys.c:4735:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4735:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4735:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4735:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4735:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] value @@     got restricted __le16 [usertype] @@
   drivers/scsi/advansys.c:4735:9: sparse:     expected unsigned short [usertype] value
   drivers/scsi/advansys.c:4735:9: sparse:     got restricted __le16 [usertype]
   drivers/scsi/advansys.c:5204:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:5204:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:5204:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:5204:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:5204:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] value @@     got restricted __le16 [usertype] @@
   drivers/scsi/advansys.c:5204:9: sparse:     expected unsigned short [usertype] value
   drivers/scsi/advansys.c:5204:9: sparse:     got restricted __le16 [usertype]
   drivers/scsi/advansys.c:5204:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:5204:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:5204:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:5204:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:5204:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] value @@     got restricted __le16 [usertype] @@
   drivers/scsi/advansys.c:5204:9: sparse:     expected unsigned short [usertype] value
   drivers/scsi/advansys.c:5204:9: sparse:     got restricted __le16 [usertype]
   drivers/scsi/advansys.c:5221:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:5221:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:5221:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:5221:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:5221:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] value @@     got restricted __le16 [usertype] @@
   drivers/scsi/advansys.c:5221:9: sparse:     expected unsigned short [usertype] value
   drivers/scsi/advansys.c:5221:9: sparse:     got restricted __le16 [usertype]
   drivers/scsi/advansys.c:5221:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:5221:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:5221:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:5221:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:5221:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] value @@     got restricted __le16 [usertype] @@
   drivers/scsi/advansys.c:5221:9: sparse:     expected unsigned short [usertype] value
   drivers/scsi/advansys.c:5221:9: sparse:     got restricted __le16 [usertype]
   drivers/scsi/advansys.c:5700:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:5700:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:5700:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:5700:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:5700:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] value @@     got restricted __le16 [usertype] @@
   drivers/scsi/advansys.c:5700:9: sparse:     expected unsigned short [usertype] value
   drivers/scsi/advansys.c:5700:9: sparse:     got restricted __le16 [usertype]
   drivers/scsi/advansys.c:5700:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:5700:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:5700:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:5700:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:5700:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] value @@     got restricted __le16 [usertype] @@
   drivers/scsi/advansys.c:5700:9: sparse:     expected unsigned short [usertype] value
   drivers/scsi/advansys.c:5700:9: sparse:     got restricted __le16 [usertype]
   drivers/scsi/advansys.c:5716:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:5716:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:5716:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:5716:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:5716:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] value @@     got restricted __le16 [usertype] @@
   drivers/scsi/advansys.c:5716:9: sparse:     expected unsigned short [usertype] value
   drivers/scsi/advansys.c:5716:9: sparse:     got restricted __le16 [usertype]
   drivers/scsi/advansys.c:5716:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:5716:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:5716:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:5716:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:5716:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] value @@     got restricted __le16 [usertype] @@
   drivers/scsi/advansys.c:5716:9: sparse:     expected unsigned short [usertype] value
   drivers/scsi/advansys.c:5716:9: sparse:     got restricted __le16 [usertype]
   drivers/scsi/advansys.c:6095:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] irq_next_vpa @@     got unsigned int [usertype] @@
   drivers/scsi/advansys.c:6095:31: sparse:     expected restricted __le32 [usertype] irq_next_vpa
   drivers/scsi/advansys.c:6095:31: sparse:     got unsigned int [usertype]
   drivers/scsi/advansys.c:6117:22: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:6130:51: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:7933:31: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] addr @@
   drivers/scsi/advansys.c:7933:31: sparse:     expected unsigned int [usertype] val
   drivers/scsi/advansys.c:7933:31: sparse:     got restricted __le32 [usertype] addr
   drivers/scsi/advansys.c:7933:31: sparse: sparse: cast from restricted __le32
   drivers/scsi/advansys.c:7933:31: sparse: sparse: cast from restricted __le32
   drivers/scsi/advansys.c:7933:31: sparse: sparse: cast from restricted __le32
   drivers/scsi/advansys.c:7933:31: sparse: sparse: cast from restricted __le32
   drivers/scsi/advansys.c:7934:30: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] bytes @@
   drivers/scsi/advansys.c:7934:30: sparse:     expected unsigned int [usertype] val

vim +4263 drivers/scsi/advansys.c

4b47e464510c52 Hannes Reinecke 2015-04-24  4226  
512193588db0d3 Matthew Wilcox  2007-10-02  4227  /*
512193588db0d3 Matthew Wilcox  2007-10-02  4228   * Send an idle command to the chip and wait for completion.
512193588db0d3 Matthew Wilcox  2007-10-02  4229   *
512193588db0d3 Matthew Wilcox  2007-10-02  4230   * Command completion is polled for once per microsecond.
512193588db0d3 Matthew Wilcox  2007-10-02  4231   *
512193588db0d3 Matthew Wilcox  2007-10-02  4232   * The function can be called from anywhere including an interrupt handler.
512193588db0d3 Matthew Wilcox  2007-10-02  4233   * But the function is not re-entrant, so it uses the DvcEnter/LeaveCritical()
512193588db0d3 Matthew Wilcox  2007-10-02  4234   * functions to prevent reentrancy.
512193588db0d3 Matthew Wilcox  2007-10-02  4235   *
512193588db0d3 Matthew Wilcox  2007-10-02  4236   * Return Values:
512193588db0d3 Matthew Wilcox  2007-10-02  4237   *   ADV_TRUE - command completed successfully
512193588db0d3 Matthew Wilcox  2007-10-02  4238   *   ADV_FALSE - command failed
512193588db0d3 Matthew Wilcox  2007-10-02  4239   *   ADV_ERROR - command timed out
512193588db0d3 Matthew Wilcox  2007-10-02  4240   */
512193588db0d3 Matthew Wilcox  2007-10-02  4241  static int
512193588db0d3 Matthew Wilcox  2007-10-02  4242  AdvSendIdleCmd(ADV_DVC_VAR *asc_dvc,
95cfab6c11180f Hannes Reinecke 2015-04-24  4243  	       ushort idle_cmd, u32 idle_cmd_parameter)
512193588db0d3 Matthew Wilcox  2007-10-02  4244  {
95cfab6c11180f Hannes Reinecke 2015-04-24  4245  	int result, i, j;
512193588db0d3 Matthew Wilcox  2007-10-02  4246  	AdvPortAddr iop_base;
512193588db0d3 Matthew Wilcox  2007-10-02  4247  
512193588db0d3 Matthew Wilcox  2007-10-02  4248  	iop_base = asc_dvc->iop_base;
512193588db0d3 Matthew Wilcox  2007-10-02  4249  
512193588db0d3 Matthew Wilcox  2007-10-02  4250  	/*
512193588db0d3 Matthew Wilcox  2007-10-02  4251  	 * Clear the idle command status which is set by the microcode
512193588db0d3 Matthew Wilcox  2007-10-02  4252  	 * to a non-zero value to indicate when the command is completed.
512193588db0d3 Matthew Wilcox  2007-10-02  4253  	 * The non-zero result is one of the IDLE_CMD_STATUS_* values
512193588db0d3 Matthew Wilcox  2007-10-02  4254  	 */
512193588db0d3 Matthew Wilcox  2007-10-02  4255  	AdvWriteWordLram(iop_base, ASC_MC_IDLE_CMD_STATUS, (ushort)0);
512193588db0d3 Matthew Wilcox  2007-10-02  4256  
512193588db0d3 Matthew Wilcox  2007-10-02  4257  	/*
512193588db0d3 Matthew Wilcox  2007-10-02  4258  	 * Write the idle command value after the idle command parameter
512193588db0d3 Matthew Wilcox  2007-10-02  4259  	 * has been written to avoid a race condition. If the order is not
512193588db0d3 Matthew Wilcox  2007-10-02  4260  	 * followed, the microcode may process the idle command before the
512193588db0d3 Matthew Wilcox  2007-10-02  4261  	 * parameters have been written to LRAM.
512193588db0d3 Matthew Wilcox  2007-10-02  4262  	 */
512193588db0d3 Matthew Wilcox  2007-10-02 @4263  	AdvWriteDWordLramNoSwap(iop_base, ASC_MC_IDLE_CMD_PARAMETER,
512193588db0d3 Matthew Wilcox  2007-10-02  4264  				cpu_to_le32(idle_cmd_parameter));
512193588db0d3 Matthew Wilcox  2007-10-02  4265  	AdvWriteWordLram(iop_base, ASC_MC_IDLE_CMD, idle_cmd);
512193588db0d3 Matthew Wilcox  2007-10-02  4266  
512193588db0d3 Matthew Wilcox  2007-10-02  4267  	/*
512193588db0d3 Matthew Wilcox  2007-10-02  4268  	 * Tickle the RISC to tell it to process the idle command.
512193588db0d3 Matthew Wilcox  2007-10-02  4269  	 */
512193588db0d3 Matthew Wilcox  2007-10-02  4270  	AdvWriteByteRegister(iop_base, IOPB_TICKLE, ADV_TICKLE_B);
512193588db0d3 Matthew Wilcox  2007-10-02  4271  	if (asc_dvc->chip_type == ADV_CHIP_ASC3550) {
512193588db0d3 Matthew Wilcox  2007-10-02  4272  		/*
512193588db0d3 Matthew Wilcox  2007-10-02  4273  		 * Clear the tickle value. In the ASC-3550 the RISC flag
512193588db0d3 Matthew Wilcox  2007-10-02  4274  		 * command 'clr_tickle_b' does not work unless the host
512193588db0d3 Matthew Wilcox  2007-10-02  4275  		 * value is cleared.
512193588db0d3 Matthew Wilcox  2007-10-02  4276  		 */
512193588db0d3 Matthew Wilcox  2007-10-02  4277  		AdvWriteByteRegister(iop_base, IOPB_TICKLE, ADV_TICKLE_NOP);
512193588db0d3 Matthew Wilcox  2007-10-02  4278  	}
512193588db0d3 Matthew Wilcox  2007-10-02  4279  
512193588db0d3 Matthew Wilcox  2007-10-02  4280  	/* Wait for up to 100 millisecond for the idle command to timeout. */
512193588db0d3 Matthew Wilcox  2007-10-02  4281  	for (i = 0; i < SCSI_WAIT_100_MSEC; i++) {
512193588db0d3 Matthew Wilcox  2007-10-02  4282  		/* Poll once each microsecond for command completion. */
512193588db0d3 Matthew Wilcox  2007-10-02  4283  		for (j = 0; j < SCSI_US_PER_MSEC; j++) {
512193588db0d3 Matthew Wilcox  2007-10-02  4284  			AdvReadWordLram(iop_base, ASC_MC_IDLE_CMD_STATUS,
512193588db0d3 Matthew Wilcox  2007-10-02  4285  					result);
512193588db0d3 Matthew Wilcox  2007-10-02  4286  			if (result != 0)
512193588db0d3 Matthew Wilcox  2007-10-02  4287  				return result;
512193588db0d3 Matthew Wilcox  2007-10-02  4288  			udelay(1);
512193588db0d3 Matthew Wilcox  2007-10-02  4289  		}
512193588db0d3 Matthew Wilcox  2007-10-02  4290  	}
512193588db0d3 Matthew Wilcox  2007-10-02  4291  
512193588db0d3 Matthew Wilcox  2007-10-02  4292  	BUG();		/* The idle command should never timeout. */
512193588db0d3 Matthew Wilcox  2007-10-02  4293  	return ADV_ERROR;
512193588db0d3 Matthew Wilcox  2007-10-02  4294  }
512193588db0d3 Matthew Wilcox  2007-10-02  4295  

:::::: The code at line 4263 was first introduced by commit
:::::: 512193588db0d38ae6aa78802bb15f3ef3104a00 [SCSI] advansys: Eliminate prototypes

:::::: TO: Matthew Wilcox <matthew@wil.cx>
:::::: CC: James Bottomley <jejb@mulgrave.localdomain>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
