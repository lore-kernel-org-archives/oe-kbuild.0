Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8FDFBED
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Jan 2024 11:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RYVsP9uR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704196419; x=1735732419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b9YbjesFhrmRr5ReSaM5u1Vrmx16ElxQrrN5bE9fIP8=;
  b=RYVsP9uRzJwRfSeQu7RywJmZiVS8jh0MhgS+b/PMr8lZk1fwngC8FNf9
   x9uRpNzQGHaVjBTV8LqCe4Jr81ciU7H2/8q82glR8AThqbz+m72tXokrP
   hRwRRWvTbmkfHshfedvRA+0jAcs/dusTgFl5FFBOtCRstCir11CZLpy6Q
   l/Hjnpn4RRjiOFbX5BmfCCS0Sm/9w3NnxTNMbbyCYlVRTRhIEsGxAZ1aw
   wChJTBAIdPrYFIZwB/hARRmcS4RD8Y+vsE+V2dJLuLpKGd+JaEvNu+4oU
   oAE3Z5L3kXmUAUvl2eLnpGy5m4FkQqhpw5txn3DxC1Z2L26v99RvZsYiC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="3708451"
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; 
   d="scan'208";a="3708451"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 03:53:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="813911804"
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; 
   d="scan'208";a="813911804"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 02 Jan 2024 03:53:36 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rKdKw-000LBg-19;
	Tue, 02 Jan 2024 11:53:34 +0000
Date: Tue, 2 Jan 2024 19:53:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: sound/soc/codecs/tas2781-i2c.c:255:26-27: WARNING opportunity for
 min()
Message-ID: <202401021929.eW58tuKw-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Shenghao Ding <13916275206@139.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   610a9b8f49fbcf1100716370d3b5f6f884a2835a
commit: ef3bcde75d06d65f78ba38a30d5a87fb83a5cdae ASoC: tas2781: Add tas2781 driver
date:   7 months ago
:::::: branch date: 2 days ago
:::::: commit date: 7 months ago
config: sparc64-randconfig-r051-20240102 (https://download.01.org/0day-ci/archive/20240102/202401021929.eW58tuKw-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401021929.eW58tuKw-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/soc/codecs/tas2781-i2c.c:255:26-27: WARNING opportunity for min()
   sound/soc/codecs/tas2781-i2c.c:365:14-15: WARNING opportunity for min()

vim +255 sound/soc/codecs/tas2781-i2c.c

ef3bcde75d06d6 Shenghao Ding 2023-06-18  223  
ef3bcde75d06d6 Shenghao Ding 2023-06-18  224  static int tasdevice_create_control(struct tasdevice_priv *tas_priv)
ef3bcde75d06d6 Shenghao Ding 2023-06-18  225  {
ef3bcde75d06d6 Shenghao Ding 2023-06-18  226  	struct snd_kcontrol_new *prof_ctrls;
ef3bcde75d06d6 Shenghao Ding 2023-06-18  227  	int nr_controls = 1;
ef3bcde75d06d6 Shenghao Ding 2023-06-18  228  	int mix_index = 0;
ef3bcde75d06d6 Shenghao Ding 2023-06-18  229  	int ret;
ef3bcde75d06d6 Shenghao Ding 2023-06-18  230  	char *name;
ef3bcde75d06d6 Shenghao Ding 2023-06-18  231  
ef3bcde75d06d6 Shenghao Ding 2023-06-18  232  	prof_ctrls = devm_kcalloc(tas_priv->dev, nr_controls,
ef3bcde75d06d6 Shenghao Ding 2023-06-18  233  		sizeof(prof_ctrls[0]), GFP_KERNEL);
ef3bcde75d06d6 Shenghao Ding 2023-06-18  234  	if (!prof_ctrls) {
ef3bcde75d06d6 Shenghao Ding 2023-06-18  235  		ret = -ENOMEM;
ef3bcde75d06d6 Shenghao Ding 2023-06-18  236  		goto out;
ef3bcde75d06d6 Shenghao Ding 2023-06-18  237  	}
ef3bcde75d06d6 Shenghao Ding 2023-06-18  238  
ef3bcde75d06d6 Shenghao Ding 2023-06-18  239  	/* Create a mixer item for selecting the active profile */
ef3bcde75d06d6 Shenghao Ding 2023-06-18  240  	name = devm_kzalloc(tas_priv->dev, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
ef3bcde75d06d6 Shenghao Ding 2023-06-18  241  		GFP_KERNEL);
ef3bcde75d06d6 Shenghao Ding 2023-06-18  242  	if (!name) {
ef3bcde75d06d6 Shenghao Ding 2023-06-18  243  		ret = -ENOMEM;
ef3bcde75d06d6 Shenghao Ding 2023-06-18  244  		goto out;
ef3bcde75d06d6 Shenghao Ding 2023-06-18  245  	}
ef3bcde75d06d6 Shenghao Ding 2023-06-18  246  	scnprintf(name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN, "Speaker Profile Id");
ef3bcde75d06d6 Shenghao Ding 2023-06-18  247  	prof_ctrls[mix_index].name = name;
ef3bcde75d06d6 Shenghao Ding 2023-06-18  248  	prof_ctrls[mix_index].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
ef3bcde75d06d6 Shenghao Ding 2023-06-18  249  	prof_ctrls[mix_index].info = tasdevice_info_profile;
ef3bcde75d06d6 Shenghao Ding 2023-06-18  250  	prof_ctrls[mix_index].get = tasdevice_get_profile_id;
ef3bcde75d06d6 Shenghao Ding 2023-06-18  251  	prof_ctrls[mix_index].put = tasdevice_set_profile_id;
ef3bcde75d06d6 Shenghao Ding 2023-06-18  252  	mix_index++;
ef3bcde75d06d6 Shenghao Ding 2023-06-18  253  
ef3bcde75d06d6 Shenghao Ding 2023-06-18  254  	ret = snd_soc_add_component_controls(tas_priv->codec,
ef3bcde75d06d6 Shenghao Ding 2023-06-18 @255  		prof_ctrls, nr_controls < mix_index ? nr_controls : mix_index);
ef3bcde75d06d6 Shenghao Ding 2023-06-18  256  
ef3bcde75d06d6 Shenghao Ding 2023-06-18  257  out:
ef3bcde75d06d6 Shenghao Ding 2023-06-18  258  	return ret;
ef3bcde75d06d6 Shenghao Ding 2023-06-18  259  }
ef3bcde75d06d6 Shenghao Ding 2023-06-18  260  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
