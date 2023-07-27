Received: from mgamail.intel.com (unknown [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E838D1C9E4
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Jul 2023 21:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690493725; x=1722029725;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LQ/waZCKknLpli7958GBqQ2Kj6TIouelxOrWl+40xx0=;
  b=QhCMFwEE/bi1D+SppkGD9Fj8+eSBC6Y/+gxU/nC2aaZH7lW88F3SN0hS
   0ruSqwYNFK8CgCwaowRnkTaYJWl2pN1VMhkNeOmGw6e+dQHdbzQ3RjRAn
   CUArEqvXdbJ33IAsCs2GOMFd7IhxBvgW5K53Z5WGVUPlFKDJuvl+nDuh0
   1YBHNfyFzleH5kBgqUKuntbgFzD7EEEuO0Fr+9UleYUeymLh9NyacqR47
   ZwToNynnYjgmijOVFD7y5tjM14/qFuXdp+mNhyd5xb3K5KgLr/jcqEUld
   rRYBgl0k9fR1Y/Rqa+Ga6grhnrqp5fku3Xj8QKxAKX9DLO2D69ZjL0URx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="399375154"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="399375154"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 14:35:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="721024067"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="721024067"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 27 Jul 2023 14:35:22 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qP8dl-0002cT-38;
	Thu, 27 Jul 2023 21:35:21 +0000
Date: Fri, 28 Jul 2023 05:35:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/tegra/dpaux.c:750 drm_dp_aux_attach() error:
 uninitialized symbol 'status'.
Message-ID: <202307280510.HIWfdKAm-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: "Christian König" <christian.koenig@amd.com>
CC: Thierry Reding <treding@nvidia.com>

Hi Christian,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0a8db05b571ad5b8d5c8774a004c0424260a90bd
commit: f75d19827b731c6f24930ef77e5a46cf2242bc68 drm/tegra: Allow compile test on !ARM v2
date:   4 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 4 months ago
config: csky-randconfig-m041-20230727 (https://download.01.org/0day-ci/archive/20230728/202307280510.HIWfdKAm-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307280510.HIWfdKAm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307280510.HIWfdKAm-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/tegra/dpaux.c:750 drm_dp_aux_attach() error: uninitialized symbol 'status'.
drivers/gpu/drm/tegra/dpaux.c:787 drm_dp_aux_detach() error: uninitialized symbol 'status'.

vim +/status +750 drivers/gpu/drm/tegra/dpaux.c

6b6b604215c646 Thierry Reding 2013-11-15  715  
9542c2376efaf5 Thierry Reding 2015-07-08  716  int drm_dp_aux_attach(struct drm_dp_aux *aux, struct tegra_output *output)
6b6b604215c646 Thierry Reding 2013-11-15  717  {
9542c2376efaf5 Thierry Reding 2015-07-08  718  	struct tegra_dpaux *dpaux = to_dpaux(aux);
6b6b604215c646 Thierry Reding 2013-11-15  719  	unsigned long timeout;
6b6b604215c646 Thierry Reding 2013-11-15  720  	int err;
6b6b604215c646 Thierry Reding 2013-11-15  721  
6cba3fe433415b Lyude Paul     2021-04-23  722  	aux->drm_dev = output->connector.dev;
39c17ae60ea9ad Lyude Paul     2021-03-26  723  	err = drm_dp_aux_register(aux);
39c17ae60ea9ad Lyude Paul     2021-03-26  724  	if (err < 0)
39c17ae60ea9ad Lyude Paul     2021-03-26  725  		return err;
39c17ae60ea9ad Lyude Paul     2021-03-26  726  
7c4633861f810f Thierry Reding 2014-04-25  727  	output->connector.polled = DRM_CONNECTOR_POLL_HPD;
6b6b604215c646 Thierry Reding 2013-11-15  728  	dpaux->output = output;
6b6b604215c646 Thierry Reding 2013-11-15  729  
6c79f09fce4dd0 Thierry Reding 2019-06-24  730  	if (output->panel) {
6c79f09fce4dd0 Thierry Reding 2019-06-24  731  		enum drm_connector_status status;
6c79f09fce4dd0 Thierry Reding 2019-06-24  732  
6c79f09fce4dd0 Thierry Reding 2019-06-24  733  		if (dpaux->vdd) {
6b6b604215c646 Thierry Reding 2013-11-15  734  			err = regulator_enable(dpaux->vdd);
6b6b604215c646 Thierry Reding 2013-11-15  735  			if (err < 0)
6b6b604215c646 Thierry Reding 2013-11-15  736  				return err;
6c79f09fce4dd0 Thierry Reding 2019-06-24  737  		}
5e881f6b29fe69 Thierry Reding 2015-08-03  738  
6b6b604215c646 Thierry Reding 2013-11-15  739  		timeout = jiffies + msecs_to_jiffies(250);
6b6b604215c646 Thierry Reding 2013-11-15  740  
6b6b604215c646 Thierry Reding 2013-11-15  741  		while (time_before(jiffies, timeout)) {
9542c2376efaf5 Thierry Reding 2015-07-08  742  			status = drm_dp_aux_detect(aux);
5e881f6b29fe69 Thierry Reding 2015-08-03  743  
5e881f6b29fe69 Thierry Reding 2015-08-03  744  			if (status == connector_status_connected)
5e881f6b29fe69 Thierry Reding 2015-08-03  745  				break;
6b6b604215c646 Thierry Reding 2013-11-15  746  
6b6b604215c646 Thierry Reding 2013-11-15  747  			usleep_range(1000, 2000);
6b6b604215c646 Thierry Reding 2013-11-15  748  		}
6b6b604215c646 Thierry Reding 2013-11-15  749  
5e881f6b29fe69 Thierry Reding 2015-08-03 @750  		if (status != connector_status_connected)
6b6b604215c646 Thierry Reding 2013-11-15  751  			return -ETIMEDOUT;
6b6b604215c646 Thierry Reding 2013-11-15  752  	}
6b6b604215c646 Thierry Reding 2013-11-15  753  
5e881f6b29fe69 Thierry Reding 2015-08-03  754  	enable_irq(dpaux->irq);
5e881f6b29fe69 Thierry Reding 2015-08-03  755  	return 0;
5e881f6b29fe69 Thierry Reding 2015-08-03  756  }
5e881f6b29fe69 Thierry Reding 2015-08-03  757  
9542c2376efaf5 Thierry Reding 2015-07-08  758  int drm_dp_aux_detach(struct drm_dp_aux *aux)
6b6b604215c646 Thierry Reding 2013-11-15  759  {
9542c2376efaf5 Thierry Reding 2015-07-08  760  	struct tegra_dpaux *dpaux = to_dpaux(aux);
6b6b604215c646 Thierry Reding 2013-11-15  761  	unsigned long timeout;
6b6b604215c646 Thierry Reding 2013-11-15  762  	int err;
6b6b604215c646 Thierry Reding 2013-11-15  763  
39c17ae60ea9ad Lyude Paul     2021-03-26  764  	drm_dp_aux_unregister(aux);
9e532b3ad9a7fc Thierry Reding 2015-07-03  765  	disable_irq(dpaux->irq);
9e532b3ad9a7fc Thierry Reding 2015-07-03  766  
6c79f09fce4dd0 Thierry Reding 2019-06-24  767  	if (dpaux->output->panel) {
6c79f09fce4dd0 Thierry Reding 2019-06-24  768  		enum drm_connector_status status;
6c79f09fce4dd0 Thierry Reding 2019-06-24  769  
6c79f09fce4dd0 Thierry Reding 2019-06-24  770  		if (dpaux->vdd) {
6b6b604215c646 Thierry Reding 2013-11-15  771  			err = regulator_disable(dpaux->vdd);
6b6b604215c646 Thierry Reding 2013-11-15  772  			if (err < 0)
6b6b604215c646 Thierry Reding 2013-11-15  773  				return err;
6c79f09fce4dd0 Thierry Reding 2019-06-24  774  		}
5e881f6b29fe69 Thierry Reding 2015-08-03  775  
6b6b604215c646 Thierry Reding 2013-11-15  776  		timeout = jiffies + msecs_to_jiffies(250);
6b6b604215c646 Thierry Reding 2013-11-15  777  
6b6b604215c646 Thierry Reding 2013-11-15  778  		while (time_before(jiffies, timeout)) {
9542c2376efaf5 Thierry Reding 2015-07-08  779  			status = drm_dp_aux_detect(aux);
5e881f6b29fe69 Thierry Reding 2015-08-03  780  
5e881f6b29fe69 Thierry Reding 2015-08-03  781  			if (status == connector_status_disconnected)
5e881f6b29fe69 Thierry Reding 2015-08-03  782  				break;
6b6b604215c646 Thierry Reding 2013-11-15  783  
6b6b604215c646 Thierry Reding 2013-11-15  784  			usleep_range(1000, 2000);
6b6b604215c646 Thierry Reding 2013-11-15  785  		}
6b6b604215c646 Thierry Reding 2013-11-15  786  
5e881f6b29fe69 Thierry Reding 2015-08-03 @787  		if (status != connector_status_disconnected)
6b6b604215c646 Thierry Reding 2013-11-15  788  			return -ETIMEDOUT;
5e881f6b29fe69 Thierry Reding 2015-08-03  789  
5e881f6b29fe69 Thierry Reding 2015-08-03  790  		dpaux->output = NULL;
5e881f6b29fe69 Thierry Reding 2015-08-03  791  	}
5e881f6b29fe69 Thierry Reding 2015-08-03  792  
5e881f6b29fe69 Thierry Reding 2015-08-03  793  	return 0;
6b6b604215c646 Thierry Reding 2013-11-15  794  }
6b6b604215c646 Thierry Reding 2013-11-15  795  

:::::: The code at line 750 was first introduced by commit
:::::: 5e881f6b29fe69726d0aa11f846c438a5cb7ddb0 drm/tegra: dpaux: Support monitor hotplugging

:::::: TO: Thierry Reding <treding@nvidia.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
