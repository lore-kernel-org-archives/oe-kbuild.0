Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8757A16411
	for <oe-kbuild@lists.linux.dev>; Wed, 10 May 2023 18:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683744295; x=1715280295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5k/t/uUID9qBIFLubjyxH7SYK5ZAaHixid4puFRj4WU=;
  b=BE19fo8wPQXwOgQMYjT0BTii0V7fvRRnpIq+104m1yPCDNy0TXgWDfEj
   Awwii/fm/dVgOv+RvOxv68thUoyLmHBOzZr9wPETRYEFviZsAbc6xqANd
   6nnOskmaPX8t8VQFrOmE6+e0e31Rrp+cZTSCiEb0M9YtV3XuzkmhfK1M9
   6CZYxQnNp0DoxezrqPscIn/znDFDJpYRkOR+aKJVEE45625Rgg+yAMbfB
   ojrAZ9JJaAfU/rX6kbPVpS8rrc8bKolEsF+a+z8xsm6p84+6j9/PgFPtW
   SVjkXHpUDndRJ31Ztl8aV3L6MwRa612AoTBIlT38fuc2EnS3zmhJoDszj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="330653952"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="330653952"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 11:44:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="764413795"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="764413795"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 May 2023 11:44:43 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwonr-0003Vg-0n;
	Wed, 10 May 2023 18:44:43 +0000
Date: Thu, 11 May 2023 02:44:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/soc-dapm.c:3768 snd_soc_dapm_new_control_unlocked() warn:
 passing zero to 'dev_err_probe'
Message-ID: <202305110258.RvRqPDM7-lkp@intel.com>
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
TO: Yang Yingliang <yangyingliang@huawei.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ad2fd53a7870a395b8564697bef6c329d017c6c9
commit: a6b0be65123e1dfbcce6653a82394f989d3372ff ASoC: soc-dapm: Switch to use dev_err_probe() helper
date:   8 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 8 months ago
config: parisc-randconfig-m041-20230509 (https://download.01.org/0day-ci/archive/20230511/202305110258.RvRqPDM7-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305110258.RvRqPDM7-lkp@intel.com/

New smatch warnings:
sound/soc/soc-dapm.c:3768 snd_soc_dapm_new_control_unlocked() warn: passing zero to 'dev_err_probe'

Old smatch warnings:
sound/soc/soc-dapm.c:3774 snd_soc_dapm_new_control_unlocked() warn: passing zero to 'ERR_PTR'

vim +/dev_err_probe +3768 sound/soc/soc-dapm.c

8b37dbd2a18066 Mark Brown             2009-02-28  3625  
02aa78abec6ebe Liam Girdwood          2015-05-25  3626  struct snd_soc_dapm_widget *
02aa78abec6ebe Liam Girdwood          2015-05-25  3627  snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
02aa78abec6ebe Liam Girdwood          2015-05-25  3628  			 const struct snd_soc_dapm_widget *widget)
02aa78abec6ebe Liam Girdwood          2015-05-25  3629  {
a3423b02cf745c Lars-Peter Clausen     2015-08-11  3630  	enum snd_soc_dapm_direction dir;
02aa78abec6ebe Liam Girdwood          2015-05-25  3631  	struct snd_soc_dapm_widget *w;
94f99c875c109e Lars-Peter Clausen     2014-06-16  3632  	const char *prefix;
3caac759681eeb Kuninori Morimoto      2022-09-05  3633  	int ret = -ENOMEM;
2b97eabc09f42d Richard Purdie         2006-10-06  3634  
2b97eabc09f42d Richard Purdie         2006-10-06  3635  	if ((w = dapm_cnew_widget(widget)) == NULL)
3caac759681eeb Kuninori Morimoto      2022-09-05  3636  		goto cnew_failed;
3caac759681eeb Kuninori Morimoto      2022-09-05  3637  
3caac759681eeb Kuninori Morimoto      2022-09-05  3638  	prefix = soc_dapm_prefix(dapm);
3caac759681eeb Kuninori Morimoto      2022-09-05  3639  	if (prefix)
3caac759681eeb Kuninori Morimoto      2022-09-05  3640  		w->name = kasprintf(GFP_KERNEL, "%s %s", prefix, widget->name);
3caac759681eeb Kuninori Morimoto      2022-09-05  3641  	else
3caac759681eeb Kuninori Morimoto      2022-09-05  3642  		w->name = kstrdup_const(widget->name, GFP_KERNEL);
3caac759681eeb Kuninori Morimoto      2022-09-05  3643  	if (!w->name)
3caac759681eeb Kuninori Morimoto      2022-09-05  3644  		goto name_failed;
2b97eabc09f42d Richard Purdie         2006-10-06  3645  
62ea874abc11f0 Mark Brown             2012-01-21  3646  	switch (w->id) {
62ea874abc11f0 Mark Brown             2012-01-21  3647  	case snd_soc_dapm_regulator_supply:
a3cc056b64065e Liam Girdwood          2012-03-09  3648  		w->regulator = devm_regulator_get(dapm->dev, w->name);
a3cc056b64065e Liam Girdwood          2012-03-09  3649  		if (IS_ERR(w->regulator)) {
a3cc056b64065e Liam Girdwood          2012-03-09  3650  			ret = PTR_ERR(w->regulator);
3bbf5d34fd4a0c Charles Keepax         2018-09-05  3651  			goto request_failed;
62ea874abc11f0 Mark Brown             2012-01-21  3652  		}
8784c77a6cb8e0 Mark Brown             2013-01-10  3653  
de9ba98b6d2629 Lars-Peter Clausen     2013-07-29  3654  		if (w->on_val & SND_SOC_DAPM_REGULATOR_BYPASS) {
8784c77a6cb8e0 Mark Brown             2013-01-10  3655  			ret = regulator_allow_bypass(w->regulator, true);
8784c77a6cb8e0 Mark Brown             2013-01-10  3656  			if (ret != 0)
3bbf5d34fd4a0c Charles Keepax         2018-09-05  3657  				dev_warn(dapm->dev,
30686c350628a6 Charles Keepax         2014-02-18  3658  					 "ASoC: Failed to bypass %s: %d\n",
8784c77a6cb8e0 Mark Brown             2013-01-10  3659  					 w->name, ret);
8784c77a6cb8e0 Mark Brown             2013-01-10  3660  		}
62ea874abc11f0 Mark Brown             2012-01-21  3661  		break;
5b2d15bbd1eeb3 Srinivas Kandagatla    2018-03-10  3662  	case snd_soc_dapm_pinctrl:
5b2d15bbd1eeb3 Srinivas Kandagatla    2018-03-10  3663  		w->pinctrl = devm_pinctrl_get(dapm->dev);
a5cd7e9cf587f5 Charles Keepax         2018-08-28  3664  		if (IS_ERR(w->pinctrl)) {
5b2d15bbd1eeb3 Srinivas Kandagatla    2018-03-10  3665  			ret = PTR_ERR(w->pinctrl);
3bbf5d34fd4a0c Charles Keepax         2018-09-05  3666  			goto request_failed;
5b2d15bbd1eeb3 Srinivas Kandagatla    2018-03-10  3667  		}
ec06dc15c358d3 Tzung-Bi Shih          2020-02-19  3668  
ec06dc15c358d3 Tzung-Bi Shih          2020-02-19  3669  		/* set to sleep_state when initializing */
ec06dc15c358d3 Tzung-Bi Shih          2020-02-19  3670  		dapm_pinctrl_event(w, NULL, SND_SOC_DAPM_POST_PMD);
5b2d15bbd1eeb3 Srinivas Kandagatla    2018-03-10  3671  		break;
d7e7eb91551ad9 Ola Lilja              2012-05-24  3672  	case snd_soc_dapm_clock_supply:
695594f1b79d3b Mark Brown             2012-06-04  3673  		w->clk = devm_clk_get(dapm->dev, w->name);
d7e7eb91551ad9 Ola Lilja              2012-05-24  3674  		if (IS_ERR(w->clk)) {
d7e7eb91551ad9 Ola Lilja              2012-05-24  3675  			ret = PTR_ERR(w->clk);
3bbf5d34fd4a0c Charles Keepax         2018-09-05  3676  			goto request_failed;
d7e7eb91551ad9 Ola Lilja              2012-05-24  3677  		}
d7e7eb91551ad9 Ola Lilja              2012-05-24  3678  		break;
62ea874abc11f0 Mark Brown             2012-01-21  3679  	default:
62ea874abc11f0 Mark Brown             2012-01-21  3680  		break;
62ea874abc11f0 Mark Brown             2012-01-21  3681  	}
2b97eabc09f42d Richard Purdie         2006-10-06  3682  
7ca3a18b055ac6 Mark Brown             2011-10-08  3683  	switch (w->id) {
6dd98b0a3e58b7 Lars-Peter Clausen     2014-10-25  3684  	case snd_soc_dapm_mic:
a3423b02cf745c Lars-Peter Clausen     2015-08-11  3685  		w->is_ep = SND_SOC_DAPM_EP_SOURCE;
86d7500326ea71 Lars-Peter Clausen     2014-12-21  3686  		w->power_check = dapm_generic_check_power;
86d7500326ea71 Lars-Peter Clausen     2014-12-21  3687  		break;
6dd98b0a3e58b7 Lars-Peter Clausen     2014-10-25  3688  	case snd_soc_dapm_input:
86d7500326ea71 Lars-Peter Clausen     2014-12-21  3689  		if (!dapm->card->fully_routed)
a3423b02cf745c Lars-Peter Clausen     2015-08-11  3690  			w->is_ep = SND_SOC_DAPM_EP_SOURCE;
7ca3a18b055ac6 Mark Brown             2011-10-08  3691  		w->power_check = dapm_generic_check_power;
7ca3a18b055ac6 Mark Brown             2011-10-08  3692  		break;
6dd98b0a3e58b7 Lars-Peter Clausen     2014-10-25  3693  	case snd_soc_dapm_spk:
6dd98b0a3e58b7 Lars-Peter Clausen     2014-10-25  3694  	case snd_soc_dapm_hp:
a3423b02cf745c Lars-Peter Clausen     2015-08-11  3695  		w->is_ep = SND_SOC_DAPM_EP_SINK;
86d7500326ea71 Lars-Peter Clausen     2014-12-21  3696  		w->power_check = dapm_generic_check_power;
86d7500326ea71 Lars-Peter Clausen     2014-12-21  3697  		break;
6dd98b0a3e58b7 Lars-Peter Clausen     2014-10-25  3698  	case snd_soc_dapm_output:
86d7500326ea71 Lars-Peter Clausen     2014-12-21  3699  		if (!dapm->card->fully_routed)
a3423b02cf745c Lars-Peter Clausen     2015-08-11  3700  			w->is_ep = SND_SOC_DAPM_EP_SINK;
7ca3a18b055ac6 Mark Brown             2011-10-08  3701  		w->power_check = dapm_generic_check_power;
7ca3a18b055ac6 Mark Brown             2011-10-08  3702  		break;
6dd98b0a3e58b7 Lars-Peter Clausen     2014-10-25  3703  	case snd_soc_dapm_vmid:
6dd98b0a3e58b7 Lars-Peter Clausen     2014-10-25  3704  	case snd_soc_dapm_siggen:
a3423b02cf745c Lars-Peter Clausen     2015-08-11  3705  		w->is_ep = SND_SOC_DAPM_EP_SOURCE;
6dd98b0a3e58b7 Lars-Peter Clausen     2014-10-25  3706  		w->power_check = dapm_always_on_check_power;
6dd98b0a3e58b7 Lars-Peter Clausen     2014-10-25  3707  		break;
56b4437f15ed20 Vinod Koul             2015-11-23  3708  	case snd_soc_dapm_sink:
56b4437f15ed20 Vinod Koul             2015-11-23  3709  		w->is_ep = SND_SOC_DAPM_EP_SINK;
56b4437f15ed20 Vinod Koul             2015-11-23  3710  		w->power_check = dapm_always_on_check_power;
56b4437f15ed20 Vinod Koul             2015-11-23  3711  		break;
56b4437f15ed20 Vinod Koul             2015-11-23  3712  
6dd98b0a3e58b7 Lars-Peter Clausen     2014-10-25  3713  	case snd_soc_dapm_mux:
d714f97c5b8c4c Lars-Peter Clausen     2015-05-01  3714  	case snd_soc_dapm_demux:
6dd98b0a3e58b7 Lars-Peter Clausen     2014-10-25  3715  	case snd_soc_dapm_switch:
6dd98b0a3e58b7 Lars-Peter Clausen     2014-10-25  3716  	case snd_soc_dapm_mixer:
6dd98b0a3e58b7 Lars-Peter Clausen     2014-10-25  3717  	case snd_soc_dapm_mixer_named_ctl:
63c69a6e4134a2 Mark Brown             2013-07-18  3718  	case snd_soc_dapm_adc:
63c69a6e4134a2 Mark Brown             2013-07-18  3719  	case snd_soc_dapm_aif_out:
63c69a6e4134a2 Mark Brown             2013-07-18  3720  	case snd_soc_dapm_dac:
63c69a6e4134a2 Mark Brown             2013-07-18  3721  	case snd_soc_dapm_aif_in:
7ca3a18b055ac6 Mark Brown             2011-10-08  3722  	case snd_soc_dapm_pga:
6e3bfcff191ec9 Ranjani Sridharan      2019-03-01  3723  	case snd_soc_dapm_buffer:
6e3bfcff191ec9 Ranjani Sridharan      2019-03-01  3724  	case snd_soc_dapm_scheduler:
6e3bfcff191ec9 Ranjani Sridharan      2019-03-01  3725  	case snd_soc_dapm_effect:
6e3bfcff191ec9 Ranjani Sridharan      2019-03-01  3726  	case snd_soc_dapm_src:
6e3bfcff191ec9 Ranjani Sridharan      2019-03-01  3727  	case snd_soc_dapm_asrc:
6e3bfcff191ec9 Ranjani Sridharan      2019-03-01  3728  	case snd_soc_dapm_encoder:
6e3bfcff191ec9 Ranjani Sridharan      2019-03-01  3729  	case snd_soc_dapm_decoder:
7ca3a18b055ac6 Mark Brown             2011-10-08  3730  	case snd_soc_dapm_out_drv:
7ca3a18b055ac6 Mark Brown             2011-10-08  3731  	case snd_soc_dapm_micbias:
7ca3a18b055ac6 Mark Brown             2011-10-08  3732  	case snd_soc_dapm_line:
c74184ed30ecce Mark Brown             2012-04-04  3733  	case snd_soc_dapm_dai_link:
cdef2ad3ae64cc Lars-Peter Clausen     2014-10-20  3734  	case snd_soc_dapm_dai_out:
cdef2ad3ae64cc Lars-Peter Clausen     2014-10-20  3735  	case snd_soc_dapm_dai_in:
7ca3a18b055ac6 Mark Brown             2011-10-08  3736  		w->power_check = dapm_generic_check_power;
7ca3a18b055ac6 Mark Brown             2011-10-08  3737  		break;
7ca3a18b055ac6 Mark Brown             2011-10-08  3738  	case snd_soc_dapm_supply:
62ea874abc11f0 Mark Brown             2012-01-21  3739  	case snd_soc_dapm_regulator_supply:
5b2d15bbd1eeb3 Srinivas Kandagatla    2018-03-10  3740  	case snd_soc_dapm_pinctrl:
d7e7eb91551ad9 Ola Lilja              2012-05-24  3741  	case snd_soc_dapm_clock_supply:
57295073b6acfd Lars-Peter Clausen     2013-08-05  3742  	case snd_soc_dapm_kcontrol:
6dd98b0a3e58b7 Lars-Peter Clausen     2014-10-25  3743  		w->is_supply = 1;
7ca3a18b055ac6 Mark Brown             2011-10-08  3744  		w->power_check = dapm_supply_check_power;
7ca3a18b055ac6 Mark Brown             2011-10-08  3745  		break;
7ca3a18b055ac6 Mark Brown             2011-10-08  3746  	default:
7ca3a18b055ac6 Mark Brown             2011-10-08  3747  		w->power_check = dapm_always_on_check_power;
7ca3a18b055ac6 Mark Brown             2011-10-08  3748  		break;
7ca3a18b055ac6 Mark Brown             2011-10-08  3749  	}
7ca3a18b055ac6 Mark Brown             2011-10-08  3750  
ce6120cca2589e Liam Girdwood          2010-11-05  3751  	w->dapm = dapm;
2b97eabc09f42d Richard Purdie         2006-10-06  3752  	INIT_LIST_HEAD(&w->list);
db432b414e20b7 Mark Brown             2011-10-03  3753  	INIT_LIST_HEAD(&w->dirty);
14596692631ead Kuninori Morimoto      2020-03-09  3754  	/* see for_each_card_widgets */
92fa12426741d5 Lars-Peter Clausen     2015-05-01  3755  	list_add_tail(&w->list, &dapm->card->widgets);
2b97eabc09f42d Richard Purdie         2006-10-06  3756  
a3423b02cf745c Lars-Peter Clausen     2015-08-11  3757  	snd_soc_dapm_for_each_direction(dir) {
a3423b02cf745c Lars-Peter Clausen     2015-08-11  3758  		INIT_LIST_HEAD(&w->edges[dir]);
a3423b02cf745c Lars-Peter Clausen     2015-08-11  3759  		w->endpoints[dir] = -1;
a3423b02cf745c Lars-Peter Clausen     2015-08-11  3760  	}
92a99ea439c4e2 Lars-Peter Clausen     2014-10-25  3761  
c80460005743c6 Peter Meerwald-Stadler 2016-08-16  3762  	/* machine layer sets up unconnected pins and insertions */
2b97eabc09f42d Richard Purdie         2006-10-06  3763  	w->connected = 1;
5ba06fc969d068 Mark Brown             2012-02-16  3764  	return w;
3bbf5d34fd4a0c Charles Keepax         2018-09-05  3765  
3bbf5d34fd4a0c Charles Keepax         2018-09-05  3766  request_failed:
a6b0be65123e1d Yang Yingliang         2022-09-14  3767  	dev_err_probe(dapm->dev, ret, "ASoC: Failed to request %s\n",
a6b0be65123e1d Yang Yingliang         2022-09-14 @3768  		      w->name);
3caac759681eeb Kuninori Morimoto      2022-09-05  3769  	kfree_const(w->name);
3caac759681eeb Kuninori Morimoto      2022-09-05  3770  name_failed:
45004d66f2a28d Wenwen Wang            2019-07-22  3771  	kfree_const(w->sname);
45004d66f2a28d Wenwen Wang            2019-07-22  3772  	kfree(w);
3caac759681eeb Kuninori Morimoto      2022-09-05  3773  cnew_failed:
3bbf5d34fd4a0c Charles Keepax         2018-09-05  3774  	return ERR_PTR(ret);
2b97eabc09f42d Richard Purdie         2006-10-06  3775  }
2b97eabc09f42d Richard Purdie         2006-10-06  3776  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
