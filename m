Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A8253A5
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Feb 2023 15:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675785251; x=1707321251;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tImBdtSDA+vvUliD+QvAln+pQYIhSoBrW/znJMcU2TM=;
  b=QuXOxwzJVrR+JbliQc6qXRPYI2xqbzPsmhlAwXPfFquqMiGrAqMY5KC0
   VjXFMXKmPvE4fMn9c1ktca10QmD8TXPRTQ94EJlTdrTdxZMf7kUo9XS6D
   zI1on5CUlolMqUpxYCcwVJ/rFJLoZcqqgJx8XAG5wxqT9hjMEZwAN/Kms
   otZhB2VPZdN+X1wvFP1H3KlX9q5ls7YGyj2oOhGyb6uJz5xeInV8qXtO9
   pRdYjHgDbJSBPOAy7QqYaHoasWEdBYKINk2/k+RtJ0W0XGW8SpE8x+DXs
   QjZZl8TOd1GUd5b4JGi53Es9uPm0S0BDMmB7/M7HwD5XJocQfqgOXKlD0
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="331673445"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="331673445"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 07:54:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="668826244"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="668826244"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 07 Feb 2023 07:54:09 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPQIK-0003fY-1C;
	Tue, 07 Feb 2023 15:54:08 +0000
Date: Tue, 7 Feb 2023 23:53:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/intel/avs/path.c:698 avs_path_pipeline_create() warn:
 passing a valid pointer to 'PTR_ERR'
Message-ID: <202302072321.9jzD8dQ2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Amadeusz Sławiński" <amadeuszx.slawinski@linux.intel.com>
CC: Mark Brown <broonie@kernel.org>
CC: Cezary Rojewski <cezary.rojewski@intel.com>

Hi Amadeusz,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   05ecb680708a1dbe6554d6fc17e5d9a8a7cb5e6a
commit: 2d3694fdeef599ef5a1352b699bdd493a51ab8cb ALSA: hda: intel-nhlt: Move structs out of #define block
date:   10 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 10 months ago
config: microblaze-randconfig-m041-20230206 (https://download.01.org/0day-ci/archive/20230207/202302072321.9jzD8dQ2-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
sound/soc/intel/avs/path.c:698 avs_path_pipeline_create() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +698 sound/soc/intel/avs/path.c

0ef882074eb1fe Cezary Rojewski 2022-03-31  651  
0ef882074eb1fe Cezary Rojewski 2022-03-31  652  static struct avs_path_pipeline *
0ef882074eb1fe Cezary Rojewski 2022-03-31  653  avs_path_pipeline_create(struct avs_dev *adev, struct avs_path *owner,
0ef882074eb1fe Cezary Rojewski 2022-03-31  654  			 struct avs_tplg_pipeline *template)
0ef882074eb1fe Cezary Rojewski 2022-03-31  655  {
0ef882074eb1fe Cezary Rojewski 2022-03-31  656  	struct avs_path_pipeline *ppl;
0ef882074eb1fe Cezary Rojewski 2022-03-31  657  	struct avs_tplg_pplcfg *cfg = template->cfg;
0ef882074eb1fe Cezary Rojewski 2022-03-31  658  	struct avs_tplg_module *tmod;
0ef882074eb1fe Cezary Rojewski 2022-03-31  659  	int ret, i;
0ef882074eb1fe Cezary Rojewski 2022-03-31  660  
0ef882074eb1fe Cezary Rojewski 2022-03-31  661  	ppl = kzalloc(sizeof(*ppl), GFP_KERNEL);
0ef882074eb1fe Cezary Rojewski 2022-03-31  662  	if (!ppl)
0ef882074eb1fe Cezary Rojewski 2022-03-31  663  		return ERR_PTR(-ENOMEM);
0ef882074eb1fe Cezary Rojewski 2022-03-31  664  
0ef882074eb1fe Cezary Rojewski 2022-03-31  665  	ppl->template = template;
0ef882074eb1fe Cezary Rojewski 2022-03-31  666  	ppl->owner = owner;
0ef882074eb1fe Cezary Rojewski 2022-03-31  667  	INIT_LIST_HEAD(&ppl->binding_list);
0ef882074eb1fe Cezary Rojewski 2022-03-31  668  	INIT_LIST_HEAD(&ppl->mod_list);
0ef882074eb1fe Cezary Rojewski 2022-03-31  669  	INIT_LIST_HEAD(&ppl->node);
0ef882074eb1fe Cezary Rojewski 2022-03-31  670  
0ef882074eb1fe Cezary Rojewski 2022-03-31  671  	ret = avs_dsp_create_pipeline(adev, cfg->req_size, cfg->priority,
0ef882074eb1fe Cezary Rojewski 2022-03-31  672  				      cfg->lp, cfg->attributes,
0ef882074eb1fe Cezary Rojewski 2022-03-31  673  				      &ppl->instance_id);
0ef882074eb1fe Cezary Rojewski 2022-03-31  674  	if (ret) {
0ef882074eb1fe Cezary Rojewski 2022-03-31  675  		dev_err(adev->dev, "error creating pipeline %d\n", ret);
0ef882074eb1fe Cezary Rojewski 2022-03-31  676  		kfree(ppl);
0ef882074eb1fe Cezary Rojewski 2022-03-31  677  		return ERR_PTR(ret);
0ef882074eb1fe Cezary Rojewski 2022-03-31  678  	}
0ef882074eb1fe Cezary Rojewski 2022-03-31  679  
0ef882074eb1fe Cezary Rojewski 2022-03-31  680  	list_for_each_entry(tmod, &template->mod_list, node) {
0ef882074eb1fe Cezary Rojewski 2022-03-31  681  		struct avs_path_module *mod;
0ef882074eb1fe Cezary Rojewski 2022-03-31  682  
0ef882074eb1fe Cezary Rojewski 2022-03-31  683  		mod = avs_path_module_create(adev, ppl, tmod);
0ef882074eb1fe Cezary Rojewski 2022-03-31  684  		if (IS_ERR(mod)) {
0ef882074eb1fe Cezary Rojewski 2022-03-31  685  			ret = PTR_ERR(mod);
0ef882074eb1fe Cezary Rojewski 2022-03-31  686  			dev_err(adev->dev, "error creating module %d\n", ret);
0ef882074eb1fe Cezary Rojewski 2022-03-31  687  			goto init_err;
0ef882074eb1fe Cezary Rojewski 2022-03-31  688  		}
0ef882074eb1fe Cezary Rojewski 2022-03-31  689  
0ef882074eb1fe Cezary Rojewski 2022-03-31  690  		list_add_tail(&mod->node, &ppl->mod_list);
0ef882074eb1fe Cezary Rojewski 2022-03-31  691  	}
0ef882074eb1fe Cezary Rojewski 2022-03-31  692  
0ef882074eb1fe Cezary Rojewski 2022-03-31  693  	for (i = 0; i < template->num_bindings; i++) {
0ef882074eb1fe Cezary Rojewski 2022-03-31  694  		struct avs_path_binding *binding;
0ef882074eb1fe Cezary Rojewski 2022-03-31  695  
0ef882074eb1fe Cezary Rojewski 2022-03-31  696  		binding = avs_path_binding_create(adev, ppl, template->bindings[i]);
0ef882074eb1fe Cezary Rojewski 2022-03-31  697  		if (IS_ERR(binding)) {
0ef882074eb1fe Cezary Rojewski 2022-03-31 @698  			ret = PTR_ERR(binding);
0ef882074eb1fe Cezary Rojewski 2022-03-31  699  			dev_err(adev->dev, "error creating binding %d\n", ret);
0ef882074eb1fe Cezary Rojewski 2022-03-31  700  			goto init_err;
0ef882074eb1fe Cezary Rojewski 2022-03-31  701  		}
0ef882074eb1fe Cezary Rojewski 2022-03-31  702  
0ef882074eb1fe Cezary Rojewski 2022-03-31  703  		list_add_tail(&binding->node, &ppl->binding_list);
0ef882074eb1fe Cezary Rojewski 2022-03-31  704  	}
0ef882074eb1fe Cezary Rojewski 2022-03-31  705  
0ef882074eb1fe Cezary Rojewski 2022-03-31  706  	return ppl;
0ef882074eb1fe Cezary Rojewski 2022-03-31  707  
0ef882074eb1fe Cezary Rojewski 2022-03-31  708  init_err:
0ef882074eb1fe Cezary Rojewski 2022-03-31  709  	avs_path_pipeline_free(adev, ppl);
0ef882074eb1fe Cezary Rojewski 2022-03-31  710  	return ERR_PTR(ret);
0ef882074eb1fe Cezary Rojewski 2022-03-31  711  }
0ef882074eb1fe Cezary Rojewski 2022-03-31  712  

:::::: The code at line 698 was first introduced by commit
:::::: 0ef882074eb1fee25083387ea6bc6669d0e24a85 ASoC: Intel: avs: Path creation and freeing

:::::: TO: Cezary Rojewski <cezary.rojewski@intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
