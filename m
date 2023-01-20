Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3463209
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Jan 2023 21:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674249689; x=1705785689;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yTGM3ibadweRHHxioKWdIBA++6w//bfcHHf5dEE9mzM=;
  b=fwgl8pDYTXL6az/Z6kgj/q6N3t1E8F/HBq6DSg71GdLp2MzLLTtF1Nld
   ltFqxZNu441npRkmd1248NMy78DH/quJP74MSJpm7MyzdB3p9voysvfih
   CUCFJGtIeVJfNP05CrGQchG1iVm2A0/KsfCY45H0z9Ayy79mvkBgQJmDE
   CDY2sAeOaCawV6qdL6InFI0bItOwmmdI3IxYM/2+t+9UzKc2/bIQFP3+o
   gFgadjyw++BZZONnCP/zAZTnI/2V2xCYNQM9msvX7SlFSuo3olmOi23+h
   nPdpL6TQ906uR7e5VV87w+uy+j7Ad5JFs/k0lk5LkYaJhQ0203FuUfIBk
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="305367987"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="305367987"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 13:21:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="989533316"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="989533316"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Jan 2023 13:21:27 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIypC-0002yg-1P;
	Fri, 20 Jan 2023 21:21:26 +0000
Date: Sat, 21 Jan 2023 05:21:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4] ucsi_ccg: Refine the UCSI Interrupt handling
Message-ID: <202301210542.DHRnbwpr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230118061523.1537992-1-haotienh@nvidia.com>
References: <20230118061523.1537992-1-haotienh@nvidia.com>
TO: Haotien Hsu <haotienh@nvidia.com>
TO: Heikki Krogerus <heikki.krogerus@linux.intel.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: "Sing-Han Chen" <singhanc@nvidia.com>
CC: Sanket Goswami <Sanket.Goswami@amd.com>
CC: Wayne Chang <waynec@nvidia.com>
CC: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
CC: Jonathan Hunter <jonathanh@nvidia.com>
CC: linux-usb@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Haotien Hsu <haotienh@nvidia.com>

Hi Haotien,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linus/master v6.2-rc4 next-20230120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haotien-Hsu/ucsi_ccg-Refine-the-UCSI-Interrupt-handling/20230118-143008
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20230118061523.1537992-1-haotienh%40nvidia.com
patch subject: [PATCH v4] ucsi_ccg: Refine the UCSI Interrupt handling
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: ia64-randconfig-m041-20230119 (https://download.01.org/0day-ci/archive/20230121/202301210542.DHRnbwpr-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/usb/typec/ucsi/ucsi_ccg.c:712 ccg_irq_handler() error: uninitialized symbol 'cci'.

vim +/cci +712 drivers/usb/typec/ucsi/ucsi_ccg.c

247c554a14aa16 Ajay Gupta      2018-10-26  678  
247c554a14aa16 Ajay Gupta      2018-10-26  679  static irqreturn_t ccg_irq_handler(int irq, void *data)
247c554a14aa16 Ajay Gupta      2018-10-26  680  {
e32fd989ac1c45 Heikki Krogerus 2019-11-04  681  	u16 reg = CCGX_RAB_UCSI_DATA_BLOCK(UCSI_CCI);
247c554a14aa16 Ajay Gupta      2018-10-26  682  	struct ucsi_ccg *uc = data;
e32fd989ac1c45 Heikki Krogerus 2019-11-04  683  	u8 intr_reg;
e32fd989ac1c45 Heikki Krogerus 2019-11-04  684  	u32 cci;
d0e0298af0ae5b Sing-Han Chen   2023-01-18  685  	int ret = 0;
e32fd989ac1c45 Heikki Krogerus 2019-11-04  686  
e32fd989ac1c45 Heikki Krogerus 2019-11-04  687  	ret = ccg_read(uc, CCGX_RAB_INTR_REG, &intr_reg, sizeof(intr_reg));
e32fd989ac1c45 Heikki Krogerus 2019-11-04  688  	if (ret)
e32fd989ac1c45 Heikki Krogerus 2019-11-04  689  		return ret;
e32fd989ac1c45 Heikki Krogerus 2019-11-04  690  
d0e0298af0ae5b Sing-Han Chen   2023-01-18  691  	if (!intr_reg)
d0e0298af0ae5b Sing-Han Chen   2023-01-18  692  		return IRQ_HANDLED;
d0e0298af0ae5b Sing-Han Chen   2023-01-18  693  	else if (!(intr_reg & UCSI_READ_INT))
d0e0298af0ae5b Sing-Han Chen   2023-01-18  694  		goto err_clear_irq;
d0e0298af0ae5b Sing-Han Chen   2023-01-18  695  
e32fd989ac1c45 Heikki Krogerus 2019-11-04  696  	ret = ccg_read(uc, reg, (void *)&cci, sizeof(cci));
e32fd989ac1c45 Heikki Krogerus 2019-11-04  697  	if (ret)
e32fd989ac1c45 Heikki Krogerus 2019-11-04  698  		goto err_clear_irq;
e32fd989ac1c45 Heikki Krogerus 2019-11-04  699  
e32fd989ac1c45 Heikki Krogerus 2019-11-04  700  	if (UCSI_CCI_CONNECTOR(cci))
e32fd989ac1c45 Heikki Krogerus 2019-11-04  701  		ucsi_connector_change(uc->ucsi, UCSI_CCI_CONNECTOR(cci));
247c554a14aa16 Ajay Gupta      2018-10-26  702  
d0e0298af0ae5b Sing-Han Chen   2023-01-18  703  	/* As per CCGx UCSI interface guide, copy CCI and MESSAGE_IN
d0e0298af0ae5b Sing-Han Chen   2023-01-18  704  	 * to the OpRegion before clear the UCSI interrupt
d0e0298af0ae5b Sing-Han Chen   2023-01-18  705  	 */
d0e0298af0ae5b Sing-Han Chen   2023-01-18  706  	ccg_op_region_update(uc, cci);
e32fd989ac1c45 Heikki Krogerus 2019-11-04  707  
e32fd989ac1c45 Heikki Krogerus 2019-11-04  708  err_clear_irq:
e32fd989ac1c45 Heikki Krogerus 2019-11-04  709  	ccg_write(uc, CCGX_RAB_INTR_REG, &intr_reg, sizeof(intr_reg));
247c554a14aa16 Ajay Gupta      2018-10-26  710  
d0e0298af0ae5b Sing-Han Chen   2023-01-18  711  	if (!ret && test_bit(DEV_CMD_PENDING, &uc->flags) &&
d0e0298af0ae5b Sing-Han Chen   2023-01-18 @712  	    cci & (UCSI_CCI_ACK_COMPLETE | UCSI_CCI_COMMAND_COMPLETE))
d0e0298af0ae5b Sing-Han Chen   2023-01-18  713  		complete(&uc->complete);
d0e0298af0ae5b Sing-Han Chen   2023-01-18  714  
247c554a14aa16 Ajay Gupta      2018-10-26  715  	return IRQ_HANDLED;
247c554a14aa16 Ajay Gupta      2018-10-26  716  }
247c554a14aa16 Ajay Gupta      2018-10-26  717  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
