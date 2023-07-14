Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3110036D
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Jul 2023 00:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689295352; x=1720831352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y+nR+NAMLLmzOvSgFiRueUD01VhNlTJsnvNbAMw8WtI=;
  b=XmiIJ23KffewQTrvoHTU98nPVa1Xi5zK70QZAZreKme0C7cFMZSnbV4W
   d3dEBvlQoDhsyKMuOmoQiQ3STQl74JJ7Tu6vxvCoXrBziJTXfZvHtcu5g
   cuSTfGOXtF4Gq/z7EC6ebIMQNO2ewSR294zAXaxz6ieWuQe1q1aEBFunm
   lA2ASNkY5XlscUQARXTOmtk9otU15FQiWFOOQDyIczAfR4SoGi+9TAlQw
   HJLMBfMC4WX5DCVJUy1Y/ms1+onuZYaz8G2vtuhKqUbhyCmuO9yKLOEig
   FvUmt8hW3NGyduSjvkLZt56aKEoBj8bJFLe9Hb1xgA6LubCCL6YRDo4zT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="365391166"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="365391166"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 17:42:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="1052857194"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="1052857194"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 13 Jul 2023 17:42:14 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qK6sv-00070t-2y;
	Fri, 14 Jul 2023 00:42:13 +0000
Date: Fri, 14 Jul 2023 08:41:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [krzk-github:n/audio-wsa884x-on-top-of-wip-sm8450-audio-on-next
 38/42] sound/soc/codecs/lpass-tx-macro.c:847 tx_macro_put_dec_enum() error:
 uninitialized symbol 'dmic_clk_reg'.
Message-ID: <202307140850.pbc9EDI4-lkp@intel.com>
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
TO: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux n/audio-wsa884x-on-top-of-wip-sm8450-audio-on-next
head:   e3b5f5398ba6aa06d39089408493667a98fa0a60
commit: 9e9e574223b5ed43d8d8c9ba0faa1546b6d20919 [38/42] ASoC: codecs: tx-macro: correct TX SMIC MUXn widgets on SM8350+
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: m68k-randconfig-m041-20230713 (https://download.01.org/0day-ci/archive/20230714/202307140850.pbc9EDI4-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307140850.pbc9EDI4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307140850.pbc9EDI4-lkp@intel.com/

New smatch warnings:
sound/soc/codecs/lpass-tx-macro.c:847 tx_macro_put_dec_enum() error: uninitialized symbol 'dmic_clk_reg'.

Old smatch warnings:
sound/soc/codecs/lpass-tx-macro.c:851 tx_macro_put_dec_enum() error: uninitialized symbol 'dmic_clk_reg'.

vim +/dmic_clk_reg +847 sound/soc/codecs/lpass-tx-macro.c

9e9e574223b5ed Krzysztof Kozlowski           2023-07-07  795  
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  796  static int tx_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  797  				 struct snd_ctl_elem_value *ucontrol)
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  798  {
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  799  	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  800  	struct snd_soc_component *component = snd_soc_dapm_to_component(widget->dapm);
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  801  	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
9e9e574223b5ed Krzysztof Kozlowski           2023-07-07  802  	unsigned int val;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  803  	u16 mic_sel_reg;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  804  	u16 dmic_clk_reg;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  805  	struct tx_macro *tx = snd_soc_component_get_drvdata(component);
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  806  
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  807  	val = ucontrol->value.enumerated.item[0];
75e5fab7db0cec Ravulapati Vishnu Vardhan Rao 2023-05-11  808  	if (val >= e->items)
75e5fab7db0cec Ravulapati Vishnu Vardhan Rao 2023-05-11  809  		return -EINVAL;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  810  
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  811  	switch (e->reg) {
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  812  	case CDC_TX_INP_MUX_ADC_MUX0_CFG0:
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  813  		mic_sel_reg = CDC_TX0_TX_PATH_CFG0;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  814  		break;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  815  	case CDC_TX_INP_MUX_ADC_MUX1_CFG0:
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  816  		mic_sel_reg = CDC_TX1_TX_PATH_CFG0;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  817  		break;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  818  	case CDC_TX_INP_MUX_ADC_MUX2_CFG0:
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  819  		mic_sel_reg = CDC_TX2_TX_PATH_CFG0;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  820  		break;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  821  	case CDC_TX_INP_MUX_ADC_MUX3_CFG0:
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  822  		mic_sel_reg = CDC_TX3_TX_PATH_CFG0;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  823  		break;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  824  	case CDC_TX_INP_MUX_ADC_MUX4_CFG0:
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  825  		mic_sel_reg = CDC_TX4_TX_PATH_CFG0;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  826  		break;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  827  	case CDC_TX_INP_MUX_ADC_MUX5_CFG0:
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  828  		mic_sel_reg = CDC_TX5_TX_PATH_CFG0;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  829  		break;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  830  	case CDC_TX_INP_MUX_ADC_MUX6_CFG0:
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  831  		mic_sel_reg = CDC_TX6_TX_PATH_CFG0;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  832  		break;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  833  	case CDC_TX_INP_MUX_ADC_MUX7_CFG0:
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  834  		mic_sel_reg = CDC_TX7_TX_PATH_CFG0;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  835  		break;
75e5fab7db0cec Ravulapati Vishnu Vardhan Rao 2023-05-11  836  	default:
75e5fab7db0cec Ravulapati Vishnu Vardhan Rao 2023-05-11  837  		dev_err(component->dev, "Error in configuration!!\n");
75e5fab7db0cec Ravulapati Vishnu Vardhan Rao 2023-05-11  838  		return -EINVAL;
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  839  	}
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  840  
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  841  	if (val != 0) {
9e9e574223b5ed Krzysztof Kozlowski           2023-07-07  842  		if (widget->shift) /* MSM DMIC */
710ccba0cf0e12 Srinivas Kandagatla           2022-11-15  843  			snd_soc_component_write_field(component, mic_sel_reg,
710ccba0cf0e12 Srinivas Kandagatla           2022-11-15  844  						      CDC_TXn_ADC_DMIC_SEL_MASK, 1);
9e9e574223b5ed Krzysztof Kozlowski           2023-07-07  845  		else if (tx->data->ver <= LPASS_VER_9_0_0)
9e9e574223b5ed Krzysztof Kozlowski           2023-07-07  846  			tx_macro_update_smic_sel_v9(component, widget, tx,
9e9e574223b5ed Krzysztof Kozlowski           2023-07-07 @847  						    mic_sel_reg, dmic_clk_reg,
9e9e574223b5ed Krzysztof Kozlowski           2023-07-07  848  						    val);
9e9e574223b5ed Krzysztof Kozlowski           2023-07-07  849  		else
9e9e574223b5ed Krzysztof Kozlowski           2023-07-07  850  			tx_macro_update_smic_sel_v9_2(component, widget, tx,
9e9e574223b5ed Krzysztof Kozlowski           2023-07-07  851  						      mic_sel_reg, dmic_clk_reg,
9e9e574223b5ed Krzysztof Kozlowski           2023-07-07  852  						      val);
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  853  	}
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  854  
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  855  	return snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  856  }
d207bdea0ca9ef Srinivas Kandagatla           2021-02-11  857  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
