Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124E968B82
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Dec 2023 17:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="arE4tvFt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701798371; x=1733334371;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AgByuS+8aRL/pCRQpCqS+Sdp0hZPaeVEm4kr6lhGl3k=;
  b=arE4tvFtbujRy911SfB39PEJui0V/t3fJWhyO13wEBSbw13w2yq+bnZ6
   yfmXSey12RVuBS+QZVRVVgdZkmC0El3PbepsrRhrhJnBlbJyxdbs/gS2H
   DolXlaq/10259Aer7AkldDefu3CkEY5l9hcTEpOQxLFOL626mnqxsEe6H
   PAckwj7ALXjd/Jso8JU/z2vvr2O48FcpgObhHrqIhZ9Lu42VmLNnVvKhb
   yF7SgvKqfFcQtya9B5EznuexUs3GJ9WJNFVVxtOueqIkS/w8QurQxbUA0
   JFpKodqkzl42nncQWid2zzo95AAOCpSPzHJ6wylx2MS3VzQJsD73gCc2T
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="15478209"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="15478209"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 09:46:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="771003181"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="771003181"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 05 Dec 2023 09:46:08 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAZUk-0009Ta-0R;
	Tue, 05 Dec 2023 17:46:06 +0000
Date: Wed, 6 Dec 2023 01:45:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 5/5] ASoC: codecs: Add WCD939x Codec driver
Message-ID: <202312060127.FLhplIP3-lkp@intel.com>
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
In-Reply-To: <20231201-topic-sm8650-upstream-wcd939x-codec-v2-5-94ed814b25aa@linaro.org>
References: <20231201-topic-sm8650-upstream-wcd939x-codec-v2-5-94ed814b25aa@linaro.org>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
TO: Banajit Goswami <bgoswami@quicinc.com>
TO: Andy Gross <agross@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konrad.dybcio@linaro.org>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Rob Herring <robh+dt@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Jaroslav Kysela <perex@perex.cz>
TO: Takashi Iwai <tiwai@suse.com>
CC: linux-arm-msm@vger.kernel.org
CC: alsa-devel@alsa-project.org
CC: linux-sound@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Neil Armstrong <neil.armstrong@linaro.org>

Hi Neil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.7-rc4 next-20231205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Neil-Armstrong/ASoC-dt-bindings-document-WCD939x-Audio-Codec/20231202-000916
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20231201-topic-sm8650-upstream-wcd939x-codec-v2-5-94ed814b25aa%40linaro.org
patch subject: [PATCH v2 5/5] ASoC: codecs: Add WCD939x Codec driver
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: powerpc64-randconfig-r081-20231204 (https://download.01.org/0day-ci/archive/20231206/202312060127.FLhplIP3-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060127.FLhplIP3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312060127.FLhplIP3-lkp@intel.com/

New smatch warnings:
sound/soc/codecs/wcd939x.c:3168 wcd939x_typec_mux_set() error: 'wcd939x' dereferencing possible ERR_PTR()
sound/soc/codecs/wcd939x.c:3221 wcd939x_swap_gnd_mic() warn: signedness bug returning '(-22)'

Old smatch warnings:
sound/soc/codecs/wcd939x.c:3170 wcd939x_typec_mux_set() error: 'wcd939x' dereferencing possible ERR_PTR()
sound/soc/codecs/wcd939x.c:3173 wcd939x_typec_mux_set() error: 'wcd939x' dereferencing possible ERR_PTR()
sound/soc/codecs/wcd939x.c:3174 wcd939x_typec_mux_set() error: 'wcd939x' dereferencing possible ERR_PTR()
sound/soc/codecs/wcd939x.c:3176 wcd939x_typec_mux_set() error: 'wcd939x' dereferencing possible ERR_PTR()
sound/soc/codecs/wcd939x.c:3177 wcd939x_typec_mux_set() error: 'wcd939x' dereferencing possible ERR_PTR()
sound/soc/codecs/wcd939x.c:3179 wcd939x_typec_mux_set() error: 'wcd939x' dereferencing possible ERR_PTR()

vim +/wcd939x +3168 sound/soc/codecs/wcd939x.c

6c302e2f95b1d1 Neil Armstrong 2023-12-01  3163  
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3164  static int wcd939x_typec_mux_set(struct typec_mux_dev *mux,
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3165  				 struct typec_mux_state *state)
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3166  {
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3167  	struct wcd939x_priv *wcd939x = typec_mux_get_drvdata(mux);
6c302e2f95b1d1 Neil Armstrong 2023-12-01 @3168  	unsigned int previous_mode = wcd939x->typec_mode;
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3169  
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3170  	if (!wcd939x->wcd_mbhc)
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3171  		return -EINVAL;
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3172  
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3173  	if (wcd939x->typec_mode != state->mode) {
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3174  		wcd939x->typec_mode = state->mode;
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3175  
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3176  		if (wcd939x->typec_mode == TYPEC_MODE_AUDIO)
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3177  			return wcd_mbhc_typec_report_plug(wcd939x->wcd_mbhc);
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3178  		else if (previous_mode == TYPEC_MODE_AUDIO)
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3179  			return wcd_mbhc_typec_report_unplug(wcd939x->wcd_mbhc);
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3180  	}
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3181  
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3182  	return 0;
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3183  }
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3184  
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3185  static void wcd939x_dt_parse_micbias_info(struct device *dev, struct wcd939x_priv *wcd)
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3186  {
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3187  	struct device_node *np = dev->of_node;
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3188  	u32 prop_val = 0;
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3189  	int rc = 0;
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3190  
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3191  	rc = of_property_read_u32(np, "qcom,micbias1-microvolt",  &prop_val);
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3192  	if (!rc)
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3193  		wcd->micb1_mv = prop_val / 1000;
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3194  	else
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3195  		dev_info(dev, "%s: Micbias1 DT property not found\n", __func__);
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3196  
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3197  	rc = of_property_read_u32(np, "qcom,micbias2-microvolt",  &prop_val);
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3198  	if (!rc)
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3199  		wcd->micb2_mv = prop_val / 1000;
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3200  	else
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3201  		dev_info(dev, "%s: Micbias2 DT property not found\n", __func__);
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3202  
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3203  	rc = of_property_read_u32(np, "qcom,micbias3-microvolt", &prop_val);
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3204  	if (!rc)
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3205  		wcd->micb3_mv = prop_val / 1000;
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3206  	else
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3207  		dev_info(dev, "%s: Micbias3 DT property not found\n", __func__);
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3208  
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3209  	rc = of_property_read_u32(np, "qcom,micbias4-microvolt",  &prop_val);
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3210  	if (!rc)
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3211  		wcd->micb4_mv = prop_val / 1000;
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3212  	else
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3213  		dev_info(dev, "%s: Micbias4 DT property not found\n", __func__);
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3214  }
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3215  
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3216  static bool wcd939x_swap_gnd_mic(struct snd_soc_component *component, bool active)
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3217  {
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3218  	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3219  
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3220  	if (!wcd939x->typec_analog_mux || !wcd939x->typec_switch)
6c302e2f95b1d1 Neil Armstrong 2023-12-01 @3221  		return -EINVAL;
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3222  
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3223  	/* Report inversion via Type Switch of USBSS */
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3224  	return typec_switch_set(wcd939x->typec_switch,
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3225  				wcd939x->typec_orientation == TYPEC_ORIENTATION_REVERSE ?
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3226  					TYPEC_ORIENTATION_NORMAL : TYPEC_ORIENTATION_REVERSE);
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3227  }
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3228  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
