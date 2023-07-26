Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDA01BEEA
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Jul 2023 21:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690406442; x=1721942442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VYRcvzbQ4UZgGAJCLyUMHPxENzjGoZkSQoly77e62pg=;
  b=C/O47YpbFTRekxo2rUqy53khAMxnpBVYlI0u2Uyd3HJqDgtTINr7SV5J
   Mc4+CNc+kFO6YzD6BM9mUOW7bcxZ9XXAI28NWW2a9713zXHBcj1A32L7y
   KId+SNdOLdCrTMhWZPQzulIBc7kTB4qpS9AVbWF/0/sLz3cSa2bXisxkd
   qX2edhM4980eUZOPveP5oCTkYrlUxoS8kvlDRsUCxauMMoZKo0Q6mlFhq
   yaK14HSr451GHdi+RhRk3uXEhU+Xjd4IKpWypt84fV8s4zjLjL2uHBcp0
   eoOKKJMFCkccb2+sX8UyjB0yu7lUT9Vszl1qMufQ1XpaKb3a18bybkzvr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="348412004"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="348412004"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 14:20:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="730009624"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="730009624"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 26 Jul 2023 14:20:40 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOlvz-0001LL-2m;
	Wed, 26 Jul 2023 21:20:39 +0000
Date: Thu, 27 Jul 2023 05:20:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 3/7] soc: qcom: add QCOM PBS driver
Message-ID: <202307270539.1JVFQf6W-lkp@intel.com>
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
[also build test WARNING on lee-leds/for-leds-next linus/master pavel-leds/for-next v6.5-rc3 next-20230726]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anjelique-Melendez/dt-bindings-soc-qcom-Add-qcom-pbs-bindings/20230726-034011
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230725193423.25047-4-quic_amelende%40quicinc.com
patch subject: [PATCH v2 3/7] soc: qcom: add QCOM PBS driver
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: parisc-randconfig-m041-20230726 (https://download.01.org/0day-ci/archive/20230727/202307270539.1JVFQf6W-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307270539.1JVFQf6W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307270539.1JVFQf6W-lkp@intel.com/

smatch warnings:
drivers/soc/qcom/qcom-pbs.c:97 qcom_pbs_wait_for_ack() warn: should this be 'retries == -1'

vim +97 drivers/soc/qcom/qcom-pbs.c

c261225d90e1d3 Anjelique Melendez 2023-07-25   67  
c261225d90e1d3 Anjelique Melendez 2023-07-25   68  static int qcom_pbs_wait_for_ack(struct pbs_dev *pbs, u8 bit_pos)
c261225d90e1d3 Anjelique Melendez 2023-07-25   69  {
c261225d90e1d3 Anjelique Melendez 2023-07-25   70  	u16 retries = 2000, delay = 1000;
c261225d90e1d3 Anjelique Melendez 2023-07-25   71  	int ret;
c261225d90e1d3 Anjelique Melendez 2023-07-25   72  	u8 val;
c261225d90e1d3 Anjelique Melendez 2023-07-25   73  
c261225d90e1d3 Anjelique Melendez 2023-07-25   74  	while (retries--) {
c261225d90e1d3 Anjelique Melendez 2023-07-25   75  		ret = qcom_pbs_read(pbs, PBS_CLIENT_SCRATCH2, &val);
c261225d90e1d3 Anjelique Melendez 2023-07-25   76  		if (ret < 0)
c261225d90e1d3 Anjelique Melendez 2023-07-25   77  			return ret;
c261225d90e1d3 Anjelique Melendez 2023-07-25   78  
c261225d90e1d3 Anjelique Melendez 2023-07-25   79  		if (val == 0xFF) {
c261225d90e1d3 Anjelique Melendez 2023-07-25   80  			/* PBS error - clear SCRATCH2 register */
c261225d90e1d3 Anjelique Melendez 2023-07-25   81  			ret = qcom_pbs_write(pbs, PBS_CLIENT_SCRATCH2, 0);
c261225d90e1d3 Anjelique Melendez 2023-07-25   82  			if (ret < 0)
c261225d90e1d3 Anjelique Melendez 2023-07-25   83  				return ret;
c261225d90e1d3 Anjelique Melendez 2023-07-25   84  
c261225d90e1d3 Anjelique Melendez 2023-07-25   85  			dev_err(pbs->dev, "NACK from PBS for bit %u\n", bit_pos);
c261225d90e1d3 Anjelique Melendez 2023-07-25   86  			return -EINVAL;
c261225d90e1d3 Anjelique Melendez 2023-07-25   87  		}
c261225d90e1d3 Anjelique Melendez 2023-07-25   88  
c261225d90e1d3 Anjelique Melendez 2023-07-25   89  		if (val & BIT(bit_pos)) {
c261225d90e1d3 Anjelique Melendez 2023-07-25   90  			dev_dbg(pbs->dev, "PBS sequence for bit %u executed!\n", bit_pos);
c261225d90e1d3 Anjelique Melendez 2023-07-25   91  			break;
c261225d90e1d3 Anjelique Melendez 2023-07-25   92  		}
c261225d90e1d3 Anjelique Melendez 2023-07-25   93  
c261225d90e1d3 Anjelique Melendez 2023-07-25   94  		usleep_range(delay, delay + 100);
c261225d90e1d3 Anjelique Melendez 2023-07-25   95  	}
c261225d90e1d3 Anjelique Melendez 2023-07-25   96  
c261225d90e1d3 Anjelique Melendez 2023-07-25  @97  	if (!retries) {
c261225d90e1d3 Anjelique Melendez 2023-07-25   98  		dev_err(pbs->dev, "Timeout for PBS ACK/NACK for bit %u\n", bit_pos);
c261225d90e1d3 Anjelique Melendez 2023-07-25   99  		return -ETIMEDOUT;
c261225d90e1d3 Anjelique Melendez 2023-07-25  100  	}
c261225d90e1d3 Anjelique Melendez 2023-07-25  101  
c261225d90e1d3 Anjelique Melendez 2023-07-25  102  	return 0;
c261225d90e1d3 Anjelique Melendez 2023-07-25  103  }
c261225d90e1d3 Anjelique Melendez 2023-07-25  104  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
