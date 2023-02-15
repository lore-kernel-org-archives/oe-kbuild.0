Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D7129A5
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Feb 2023 12:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676465809; x=1708001809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8sWZJkDITMutHz8Ma6opxidF4G7XrNtKUWVqXat1TU4=;
  b=nhs1+R9mFQVpLD6mnD3QmrJCINUrJ343LIHd73p72TUW5IX7hhwVl9w1
   Z5N4/mRLLqB9ub3Jilc1GouUoNbAf8cOye20Hqz9/hgUr1nbpljBstXww
   xWMDpq0+WDhVaisy2j56co+/zGF+MN7aba8gC4A7JgPNbketn3Qw+l1QH
   JzsV3Lxyv1J1CJDFSYp1P4eE5LzZ5lRIRpWwXwK4zK9oiOdvQntwJH0bu
   4wI6N+nt/tMAz1mjEKtBtYLktTdbyKV/qDXs7fD40kwzkbVm9RpxgghCu
   C93hU+8SH0E7B226+MXdAOf5SCukdCXI29CHmzZKeu1jwDz2hdakETLUU
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="329137771"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="329137771"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 04:56:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="843571832"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="843571832"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 15 Feb 2023 04:56:47 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSHL4-0009NJ-1I;
	Wed, 15 Feb 2023 12:56:46 +0000
Date: Wed, 15 Feb 2023 20:55:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 12850/13038] sound/soc/soc-ac97.c:339
 snd_soc_ac97_parse_pinctl() warn: passing zero to 'PTR_ERR'
Message-ID: <202302152000.9PrlVuV3-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9d9019bcea1aac7eed64a1a4966282b6b7b141c8
commit: 3ee0d39c50dca18c76941f46a6c57dc9cd2bfb9d [12850/13038] ASoC: soc-ac97: Convert to agnostic GPIO API
:::::: branch date: 9 hours ago
:::::: commit date: 14 hours ago
config: ia64-randconfig-m031-20230212 (https://download.01.org/0day-ci/archive/20230215/202302152000.9PrlVuV3-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302152000.9PrlVuV3-lkp@intel.com/

New smatch warnings:
sound/soc/soc-ac97.c:339 snd_soc_ac97_parse_pinctl() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
sound/soc/soc-ac97.c:344 snd_soc_ac97_parse_pinctl() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +339 sound/soc/soc-ac97.c

336b8423e28517 Lars-Peter Clausen 2014-11-10  297  
336b8423e28517 Lars-Peter Clausen 2014-11-10  298  static int snd_soc_ac97_parse_pinctl(struct device *dev,
336b8423e28517 Lars-Peter Clausen 2014-11-10  299  		struct snd_ac97_reset_cfg *cfg)
336b8423e28517 Lars-Peter Clausen 2014-11-10  300  {
336b8423e28517 Lars-Peter Clausen 2014-11-10  301  	struct pinctrl *p;
336b8423e28517 Lars-Peter Clausen 2014-11-10  302  	struct pinctrl_state *state;
336b8423e28517 Lars-Peter Clausen 2014-11-10  303  
336b8423e28517 Lars-Peter Clausen 2014-11-10  304  	p = devm_pinctrl_get(dev);
336b8423e28517 Lars-Peter Clausen 2014-11-10  305  	if (IS_ERR(p)) {
336b8423e28517 Lars-Peter Clausen 2014-11-10  306  		dev_err(dev, "Failed to get pinctrl\n");
336b8423e28517 Lars-Peter Clausen 2014-11-10  307  		return PTR_ERR(p);
336b8423e28517 Lars-Peter Clausen 2014-11-10  308  	}
336b8423e28517 Lars-Peter Clausen 2014-11-10  309  	cfg->pctl = p;
336b8423e28517 Lars-Peter Clausen 2014-11-10  310  
336b8423e28517 Lars-Peter Clausen 2014-11-10  311  	state = pinctrl_lookup_state(p, "ac97-reset");
336b8423e28517 Lars-Peter Clausen 2014-11-10  312  	if (IS_ERR(state)) {
336b8423e28517 Lars-Peter Clausen 2014-11-10  313  		dev_err(dev, "Can't find pinctrl state ac97-reset\n");
336b8423e28517 Lars-Peter Clausen 2014-11-10  314  		return PTR_ERR(state);
336b8423e28517 Lars-Peter Clausen 2014-11-10  315  	}
336b8423e28517 Lars-Peter Clausen 2014-11-10  316  	cfg->pstate_reset = state;
336b8423e28517 Lars-Peter Clausen 2014-11-10  317  
336b8423e28517 Lars-Peter Clausen 2014-11-10  318  	state = pinctrl_lookup_state(p, "ac97-warm-reset");
336b8423e28517 Lars-Peter Clausen 2014-11-10  319  	if (IS_ERR(state)) {
336b8423e28517 Lars-Peter Clausen 2014-11-10  320  		dev_err(dev, "Can't find pinctrl state ac97-warm-reset\n");
336b8423e28517 Lars-Peter Clausen 2014-11-10  321  		return PTR_ERR(state);
336b8423e28517 Lars-Peter Clausen 2014-11-10  322  	}
336b8423e28517 Lars-Peter Clausen 2014-11-10  323  	cfg->pstate_warm_reset = state;
336b8423e28517 Lars-Peter Clausen 2014-11-10  324  
336b8423e28517 Lars-Peter Clausen 2014-11-10  325  	state = pinctrl_lookup_state(p, "ac97-running");
336b8423e28517 Lars-Peter Clausen 2014-11-10  326  	if (IS_ERR(state)) {
336b8423e28517 Lars-Peter Clausen 2014-11-10  327  		dev_err(dev, "Can't find pinctrl state ac97-running\n");
336b8423e28517 Lars-Peter Clausen 2014-11-10  328  		return PTR_ERR(state);
336b8423e28517 Lars-Peter Clausen 2014-11-10  329  	}
336b8423e28517 Lars-Peter Clausen 2014-11-10  330  	cfg->pstate_run = state;
336b8423e28517 Lars-Peter Clausen 2014-11-10  331  
3ee0d39c50dca1 Andy Shevchenko    2023-02-13  332  	cfg->sync_gpio = devm_gpiod_get_index(dev, "ac97", 0, GPIOD_ASIS);
3ee0d39c50dca1 Andy Shevchenko    2023-02-13  333  	if (IS_ERR(cfg->sync_gpio))
3ee0d39c50dca1 Andy Shevchenko    2023-02-13  334  		return dev_err_probe(dev, PTR_ERR(cfg->sync_gpio), "Can't find ac97-sync gpio\n");
3ee0d39c50dca1 Andy Shevchenko    2023-02-13  335  	gpiod_set_consumer_name(cfg->sync_gpio, "AC97 link sync");
336b8423e28517 Lars-Peter Clausen 2014-11-10  336  
3ee0d39c50dca1 Andy Shevchenko    2023-02-13  337  	cfg->sdata_gpio = devm_gpiod_get_index(dev, "ac97", 1, GPIOD_ASIS);
3ee0d39c50dca1 Andy Shevchenko    2023-02-13  338  	if (IS_ERR(cfg->sdata_gpio))
3ee0d39c50dca1 Andy Shevchenko    2023-02-13 @339  		return dev_err_probe(dev, PTR_ERR(cfg->sync_gpio), "Can't find ac97-sdata gpio\n");
3ee0d39c50dca1 Andy Shevchenko    2023-02-13  340  	gpiod_set_consumer_name(cfg->sdata_gpio, "AC97 link sdata");
336b8423e28517 Lars-Peter Clausen 2014-11-10  341  
3ee0d39c50dca1 Andy Shevchenko    2023-02-13  342  	cfg->reset_gpio = devm_gpiod_get_index(dev, "ac97", 2, GPIOD_ASIS);
3ee0d39c50dca1 Andy Shevchenko    2023-02-13  343  	if (IS_ERR(cfg->reset_gpio))
3ee0d39c50dca1 Andy Shevchenko    2023-02-13  344  		return dev_err_probe(dev, PTR_ERR(cfg->sync_gpio), "Can't find ac97-reset gpio\n");
3ee0d39c50dca1 Andy Shevchenko    2023-02-13  345  	gpiod_set_consumer_name(cfg->reset_gpio, "AC97 link reset");
336b8423e28517 Lars-Peter Clausen 2014-11-10  346  
336b8423e28517 Lars-Peter Clausen 2014-11-10  347  	return 0;
336b8423e28517 Lars-Peter Clausen 2014-11-10  348  }
336b8423e28517 Lars-Peter Clausen 2014-11-10  349  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
