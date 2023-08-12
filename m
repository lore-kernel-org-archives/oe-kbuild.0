Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943EE1CCDE
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Aug 2023 12:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691841675; x=1723377675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Tt/YU1K4I2HZxflkw5lElKlpnnW0k5zjtp/4ynSBsg=;
  b=M36FPrqJiu0xDk9wzZaygH1wBHZvffZtS61xPmx/f+gU8LWFa+TSE3Yj
   lJTlnGXVju62lBVxfMc+wH6dwayHDvOWFN8d1DrZEjz81lpx+KsYEMm8j
   GeIeBlND19Jw/15eOg5m9PeAH3Z7ussRa/enYXxg+i5Yjqi4WdeZknLvE
   4FuUizzVKWqZlT4m6mSb0HSM3OEoMda49UOq4l3vO/fjvH3K0QtEY7/+M
   hb/ZsakTHk1n7VudrIYP6KX1aFf8NSWsERrPIkoBjTYp4X07LNAwpsdj9
   EJ7xR/gMS2QMC2A5Xc0w1G9smZMw0qS+LSiqsT/hsDmiiIjnCfNR51s0/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="435715732"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="435715732"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 05:01:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="709805974"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="709805974"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 12 Aug 2023 05:01:13 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUnIu-0008Ya-2Q;
	Sat, 12 Aug 2023 12:01:12 +0000
Date: Sat, 12 Aug 2023 20:00:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 3/7] soc: qcom: add QCOM PBS driver
Message-ID: <202308121941.pc89PrfE-lkp@intel.com>
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
In-Reply-To: <20230725193423.25047-4-quic_amelende@quicinc.com>
References: <20230725193423.25047-4-quic_amelende@quicinc.com>
TO: Anjelique Melendez <quic_amelende@quicinc.com>
TO: pavel@ucw.cz
TO: lee@kernel.org
TO: thierry.reding@gmail.com
TO: robh+dt@kernel.org
TO: krzysztof.kozlowski+dt@linaro.org
TO: conor+dt@kernel.org
TO: agross@kernel.org
TO: andersson@kernel.org
CC: luca.weiss@fairphone.com
CC: konrad.dybcio@linaro.org
CC: u.kleine-koenig@pengutronix.de
CC: quic_subbaram@quicinc.com
CC: linux-leds@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: linux-pwm@vger.kernel.org
CC: Anjelique Melendez <quic_amelende@quicinc.com>

Hi Anjelique,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on lee-leds/for-leds-next linus/master pavel-leds/for-next v6.5-rc5 next-20230809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anjelique-Melendez/dt-bindings-soc-qcom-Add-qcom-pbs-bindings/20230726-034011
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230725193423.25047-4-quic_amelende%40quicinc.com
patch subject: [PATCH v2 3/7] soc: qcom: add QCOM PBS driver
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
config: nios2-randconfig-m031-20230812 (https://download.01.org/0day-ci/archive/20230812/202308121941.pc89PrfE-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308121941.pc89PrfE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308121941.pc89PrfE-lkp@intel.com/

smatch warnings:
drivers/soc/qcom/qcom-pbs.c:97 qcom_pbs_wait_for_ack() warn: should this be 'retries == -1'

vim +97 drivers/soc/qcom/qcom-pbs.c

c261225d90e1d36 Anjelique Melendez 2023-07-25   67  
c261225d90e1d36 Anjelique Melendez 2023-07-25   68  static int qcom_pbs_wait_for_ack(struct pbs_dev *pbs, u8 bit_pos)
c261225d90e1d36 Anjelique Melendez 2023-07-25   69  {
c261225d90e1d36 Anjelique Melendez 2023-07-25   70  	u16 retries = 2000, delay = 1000;
c261225d90e1d36 Anjelique Melendez 2023-07-25   71  	int ret;
c261225d90e1d36 Anjelique Melendez 2023-07-25   72  	u8 val;
c261225d90e1d36 Anjelique Melendez 2023-07-25   73  
c261225d90e1d36 Anjelique Melendez 2023-07-25   74  	while (retries--) {
c261225d90e1d36 Anjelique Melendez 2023-07-25   75  		ret = qcom_pbs_read(pbs, PBS_CLIENT_SCRATCH2, &val);
c261225d90e1d36 Anjelique Melendez 2023-07-25   76  		if (ret < 0)
c261225d90e1d36 Anjelique Melendez 2023-07-25   77  			return ret;
c261225d90e1d36 Anjelique Melendez 2023-07-25   78  
c261225d90e1d36 Anjelique Melendez 2023-07-25   79  		if (val == 0xFF) {
c261225d90e1d36 Anjelique Melendez 2023-07-25   80  			/* PBS error - clear SCRATCH2 register */
c261225d90e1d36 Anjelique Melendez 2023-07-25   81  			ret = qcom_pbs_write(pbs, PBS_CLIENT_SCRATCH2, 0);
c261225d90e1d36 Anjelique Melendez 2023-07-25   82  			if (ret < 0)
c261225d90e1d36 Anjelique Melendez 2023-07-25   83  				return ret;
c261225d90e1d36 Anjelique Melendez 2023-07-25   84  
c261225d90e1d36 Anjelique Melendez 2023-07-25   85  			dev_err(pbs->dev, "NACK from PBS for bit %u\n", bit_pos);
c261225d90e1d36 Anjelique Melendez 2023-07-25   86  			return -EINVAL;
c261225d90e1d36 Anjelique Melendez 2023-07-25   87  		}
c261225d90e1d36 Anjelique Melendez 2023-07-25   88  
c261225d90e1d36 Anjelique Melendez 2023-07-25   89  		if (val & BIT(bit_pos)) {
c261225d90e1d36 Anjelique Melendez 2023-07-25   90  			dev_dbg(pbs->dev, "PBS sequence for bit %u executed!\n", bit_pos);
c261225d90e1d36 Anjelique Melendez 2023-07-25   91  			break;
c261225d90e1d36 Anjelique Melendez 2023-07-25   92  		}
c261225d90e1d36 Anjelique Melendez 2023-07-25   93  
c261225d90e1d36 Anjelique Melendez 2023-07-25   94  		usleep_range(delay, delay + 100);
c261225d90e1d36 Anjelique Melendez 2023-07-25   95  	}
c261225d90e1d36 Anjelique Melendez 2023-07-25   96  
c261225d90e1d36 Anjelique Melendez 2023-07-25  @97  	if (!retries) {
c261225d90e1d36 Anjelique Melendez 2023-07-25   98  		dev_err(pbs->dev, "Timeout for PBS ACK/NACK for bit %u\n", bit_pos);
c261225d90e1d36 Anjelique Melendez 2023-07-25   99  		return -ETIMEDOUT;
c261225d90e1d36 Anjelique Melendez 2023-07-25  100  	}
c261225d90e1d36 Anjelique Melendez 2023-07-25  101  
c261225d90e1d36 Anjelique Melendez 2023-07-25  102  	return 0;
c261225d90e1d36 Anjelique Melendez 2023-07-25  103  }
c261225d90e1d36 Anjelique Melendez 2023-07-25  104  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
