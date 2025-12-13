Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8E52DD5F3
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 11:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765626159; cv=none; b=HzZkP2BhkhNffknj+0RcrqslLtZwcjGgX34/e6PUb0A3WUSHWwheELhMosivo8rB3oIET9wwQ4Y/e1UOgCIr0/5wRA+q0FJCDG4OxgNrw/EnI5ig96UI9+/Vh4Nd6aVxB2ahBBkYfWoJTJmeV01YHEkUeuntFTS6Yzrf3JzhXtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765626159; c=relaxed/simple;
	bh=efk5Ux/0kIdcQOSqDa05oIYKCDgJLHVY/vfgEc0/XG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y7g7hqAQfqy+femucm2scKOeFwD+BvLwebf+QJdbsiOIh/ZIxzCNyPnXjvsK4SaQI76baNgPLRB5Z5js0ZU4t9r63MF/RXU4tQhhJ/+ZozcdaJfEtc5n2kOSS8YjgRbxMqK/7tok8Ik721gFtLmJhVIdB71SXqbyhYrfkTwrCEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TarAzTFW; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TarAzTFW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765626157; x=1797162157;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=efk5Ux/0kIdcQOSqDa05oIYKCDgJLHVY/vfgEc0/XG4=;
  b=TarAzTFWRpPM9yHo/j70z1lfvW/jkEyIBM16wmHRebDJpZpB2me95s28
   22W7qTKUcMi97imnqA5uvrwjPbHV5IXv9Q7Ke177K1VGQ1I94G8Qi+7yr
   o8X7mVabUEZ15ROmLpWOJaA3fVmnDa/snI0GQU6QhZXurMTTonJe1U/1y
   62N/fvU66207QsdGZbVvO8FGIVYUIGLZi1tEJphS/xuJm7vArSBuH0l/b
   3hr3IxBfvI9gbNJr8Bj5akuX2OLkX7NiDSQ97wdW23RUAqotnfzDjNbpr
   uFwitq944+gSg5lzyk1qxM2LFceAcuKgUgfQbobQKMT9u4a/3fppRYCsu
   w==;
X-CSE-ConnectionGUID: cIV+QZgSQJG1Hog3en8FAQ==
X-CSE-MsgGUID: v+L/c04TQAithBOgtv2nSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="66597196"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="66597196"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 03:42:36 -0800
X-CSE-ConnectionGUID: Lzf5rjDBT7ujo5v3ua75Ig==
X-CSE-MsgGUID: 2KrjW+/yRWOILapatXge+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="227960965"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Dec 2025 03:42:34 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUO1A-000000007Yl-1Swk;
	Sat, 13 Dec 2025 11:42:32 +0000
Date: Sat, 13 Dec 2025 19:42:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/codecs/rt1320-sdw.c:1168 rt1320_set_gain_put() error:
 uninitialized symbol 'err'.
Message-ID: <202512131905.Wr8k6Aqa-lkp@intel.com>
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
TO: Shuming Fan <shumingf@realtek.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d9c1cfec01cdbf24bd9322ed555713a20422115
commit: 7bf9e646af9a0ceac57b27e62b71f750af096c2c ASoC: rt1321: Add RT1321 amplifier support
date:   4 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 4 months ago
config: i386-randconfig-r073-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131905.Wr8k6Aqa-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512131905.Wr8k6Aqa-lkp@intel.com/

smatch warnings:
sound/soc/codecs/rt1320-sdw.c:1168 rt1320_set_gain_put() error: uninitialized symbol 'err'.
sound/soc/codecs/rt1320-sdw.c:1169 rt1320_set_gain_put() error: uninitialized symbol 'reg_base'.
sound/soc/codecs/rt1320-sdw.c:1226 rt1320_set_gain_get() error: uninitialized symbol 'regvalue'.

vim +/err +1168 sound/soc/codecs/rt1320-sdw.c

bad0a07a7e61a5 Shuming Fan 2024-05-21  1072  
bad0a07a7e61a5 Shuming Fan 2024-05-21  1073  static int rt1320_set_gain_put(struct snd_kcontrol *kcontrol,
bad0a07a7e61a5 Shuming Fan 2024-05-21  1074  		struct snd_ctl_elem_value *ucontrol)
bad0a07a7e61a5 Shuming Fan 2024-05-21  1075  {
bad0a07a7e61a5 Shuming Fan 2024-05-21  1076  	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
bad0a07a7e61a5 Shuming Fan 2024-05-21  1077  	struct soc_mixer_control *mc =
bad0a07a7e61a5 Shuming Fan 2024-05-21  1078  		(struct soc_mixer_control *)kcontrol->private_value;
bad0a07a7e61a5 Shuming Fan 2024-05-21  1079  	struct rt1320_sdw_priv *rt1320 = snd_soc_component_get_drvdata(component);
f465d10cd73188 Shuming Fan 2024-09-02  1080  	unsigned int gain_l_val, gain_r_val;
bad0a07a7e61a5 Shuming Fan 2024-05-21  1081  	unsigned int lvalue, rvalue;
bad0a07a7e61a5 Shuming Fan 2024-05-21  1082  	const unsigned int interval_offset = 0xc0;
20079dd9b36448 Shuming Fan 2024-10-25  1083  	unsigned int changed = 0, reg_base;
20079dd9b36448 Shuming Fan 2024-10-25  1084  	struct rt_sdca_dmic_kctrl_priv *p;
20079dd9b36448 Shuming Fan 2024-10-25  1085  	unsigned int regvalue[4], gain_val[4], i;
20079dd9b36448 Shuming Fan 2024-10-25  1086  	int err;
20079dd9b36448 Shuming Fan 2024-10-25  1087  
20079dd9b36448 Shuming Fan 2024-10-25  1088  	if (strstr(ucontrol->id.name, "FU Capture Volume"))
20079dd9b36448 Shuming Fan 2024-10-25  1089  		goto _dmic_vol_;
bad0a07a7e61a5 Shuming Fan 2024-05-21  1090  
bad0a07a7e61a5 Shuming Fan 2024-05-21  1091  	regmap_read(rt1320->mbq_regmap, mc->reg, &lvalue);
bad0a07a7e61a5 Shuming Fan 2024-05-21  1092  	regmap_read(rt1320->mbq_regmap, mc->rreg, &rvalue);
bad0a07a7e61a5 Shuming Fan 2024-05-21  1093  
bad0a07a7e61a5 Shuming Fan 2024-05-21  1094  	/* L Channel */
bad0a07a7e61a5 Shuming Fan 2024-05-21  1095  	gain_l_val = ucontrol->value.integer.value[0];
bad0a07a7e61a5 Shuming Fan 2024-05-21  1096  	if (gain_l_val > mc->max)
bad0a07a7e61a5 Shuming Fan 2024-05-21  1097  		gain_l_val = mc->max;
bad0a07a7e61a5 Shuming Fan 2024-05-21  1098  	gain_l_val = 0 - ((mc->max - gain_l_val) * interval_offset);
bad0a07a7e61a5 Shuming Fan 2024-05-21  1099  	gain_l_val &= 0xffff;
bad0a07a7e61a5 Shuming Fan 2024-05-21  1100  
bad0a07a7e61a5 Shuming Fan 2024-05-21  1101  	/* R Channel */
bad0a07a7e61a5 Shuming Fan 2024-05-21  1102  	gain_r_val = ucontrol->value.integer.value[1];
bad0a07a7e61a5 Shuming Fan 2024-05-21  1103  	if (gain_r_val > mc->max)
bad0a07a7e61a5 Shuming Fan 2024-05-21  1104  		gain_r_val = mc->max;
bad0a07a7e61a5 Shuming Fan 2024-05-21  1105  	gain_r_val = 0 - ((mc->max - gain_r_val) * interval_offset);
bad0a07a7e61a5 Shuming Fan 2024-05-21  1106  	gain_r_val &= 0xffff;
bad0a07a7e61a5 Shuming Fan 2024-05-21  1107  
bad0a07a7e61a5 Shuming Fan 2024-05-21  1108  	if (lvalue == gain_l_val && rvalue == gain_r_val)
bad0a07a7e61a5 Shuming Fan 2024-05-21  1109  		return 0;
bad0a07a7e61a5 Shuming Fan 2024-05-21  1110  
bad0a07a7e61a5 Shuming Fan 2024-05-21  1111  	/* Lch*/
bad0a07a7e61a5 Shuming Fan 2024-05-21  1112  	regmap_write(rt1320->mbq_regmap, mc->reg, gain_l_val);
bad0a07a7e61a5 Shuming Fan 2024-05-21  1113  	/* Rch */
bad0a07a7e61a5 Shuming Fan 2024-05-21  1114  	regmap_write(rt1320->mbq_regmap, mc->rreg, gain_r_val);
20079dd9b36448 Shuming Fan 2024-10-25  1115  	goto _done_;
20079dd9b36448 Shuming Fan 2024-10-25  1116  
20079dd9b36448 Shuming Fan 2024-10-25  1117  _dmic_vol_:
20079dd9b36448 Shuming Fan 2024-10-25  1118  	p = (struct rt_sdca_dmic_kctrl_priv *)kcontrol->private_value;
20079dd9b36448 Shuming Fan 2024-10-25  1119  
20079dd9b36448 Shuming Fan 2024-10-25  1120  	/* check all channels */
20079dd9b36448 Shuming Fan 2024-10-25  1121  	for (i = 0; i < p->count; i++) {
7bf9e646af9a0c Shuming Fan 2025-08-14  1122  		switch (rt1320->dev_id) {
7bf9e646af9a0c Shuming Fan 2025-08-14  1123  		case RT1320_DEV_ID:
20079dd9b36448 Shuming Fan 2024-10-25  1124  			if (i < 2) {
20079dd9b36448 Shuming Fan 2024-10-25  1125  				reg_base = SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU113, RT1320_SDCA_CTL_FU_VOLUME, CH_01);
20079dd9b36448 Shuming Fan 2024-10-25  1126  				regmap_read(rt1320->mbq_regmap, reg_base + i, &regvalue[i]);
20079dd9b36448 Shuming Fan 2024-10-25  1127  			} else {
20079dd9b36448 Shuming Fan 2024-10-25  1128  				reg_base = SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU14, RT1320_SDCA_CTL_FU_VOLUME, CH_01);
20079dd9b36448 Shuming Fan 2024-10-25  1129  				regmap_read(rt1320->mbq_regmap, reg_base + i - 2, &regvalue[i]);
20079dd9b36448 Shuming Fan 2024-10-25  1130  			}
7bf9e646af9a0c Shuming Fan 2025-08-14  1131  			break;
7bf9e646af9a0c Shuming Fan 2025-08-14  1132  		case RT1321_DEV_ID:
7bf9e646af9a0c Shuming Fan 2025-08-14  1133  			reg_base = SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU113, RT1320_SDCA_CTL_FU_VOLUME, CH_01);
7bf9e646af9a0c Shuming Fan 2025-08-14  1134  			regmap_read(rt1320->mbq_regmap, reg_base + i, &regvalue[i]);
7bf9e646af9a0c Shuming Fan 2025-08-14  1135  			break;
7bf9e646af9a0c Shuming Fan 2025-08-14  1136  		}
20079dd9b36448 Shuming Fan 2024-10-25  1137  
20079dd9b36448 Shuming Fan 2024-10-25  1138  		gain_val[i] = ucontrol->value.integer.value[i];
20079dd9b36448 Shuming Fan 2024-10-25  1139  		if (gain_val[i] > p->max)
20079dd9b36448 Shuming Fan 2024-10-25  1140  			gain_val[i] = p->max;
20079dd9b36448 Shuming Fan 2024-10-25  1141  
20079dd9b36448 Shuming Fan 2024-10-25  1142  		gain_val[i] = 0x1e00 - ((p->max - gain_val[i]) * interval_offset);
20079dd9b36448 Shuming Fan 2024-10-25  1143  		gain_val[i] &= 0xffff;
20079dd9b36448 Shuming Fan 2024-10-25  1144  		if (regvalue[i] != gain_val[i])
20079dd9b36448 Shuming Fan 2024-10-25  1145  			changed = 1;
20079dd9b36448 Shuming Fan 2024-10-25  1146  	}
20079dd9b36448 Shuming Fan 2024-10-25  1147  
20079dd9b36448 Shuming Fan 2024-10-25  1148  	if (!changed)
20079dd9b36448 Shuming Fan 2024-10-25  1149  		return 0;
20079dd9b36448 Shuming Fan 2024-10-25  1150  
20079dd9b36448 Shuming Fan 2024-10-25  1151  	for (i = 0; i < p->count; i++) {
7bf9e646af9a0c Shuming Fan 2025-08-14  1152  		switch (rt1320->dev_id) {
7bf9e646af9a0c Shuming Fan 2025-08-14  1153  		case RT1320_DEV_ID:
20079dd9b36448 Shuming Fan 2024-10-25  1154  			if (i < 2) {
20079dd9b36448 Shuming Fan 2024-10-25  1155  				reg_base = SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU113, RT1320_SDCA_CTL_FU_VOLUME, CH_01);
20079dd9b36448 Shuming Fan 2024-10-25  1156  				err = regmap_write(rt1320->mbq_regmap, reg_base + i, gain_val[i]);
20079dd9b36448 Shuming Fan 2024-10-25  1157  			} else {
20079dd9b36448 Shuming Fan 2024-10-25  1158  				reg_base = SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU14, RT1320_SDCA_CTL_FU_VOLUME, CH_01);
20079dd9b36448 Shuming Fan 2024-10-25  1159  				err = regmap_write(rt1320->mbq_regmap, reg_base + i - 2, gain_val[i]);
20079dd9b36448 Shuming Fan 2024-10-25  1160  			}
7bf9e646af9a0c Shuming Fan 2025-08-14  1161  			break;
7bf9e646af9a0c Shuming Fan 2025-08-14  1162  		case RT1321_DEV_ID:
7bf9e646af9a0c Shuming Fan 2025-08-14  1163  			reg_base = SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU113, RT1320_SDCA_CTL_FU_VOLUME, CH_01);
7bf9e646af9a0c Shuming Fan 2025-08-14  1164  			err = regmap_write(rt1320->mbq_regmap, reg_base + i, gain_val[i]);
7bf9e646af9a0c Shuming Fan 2025-08-14  1165  			break;
7bf9e646af9a0c Shuming Fan 2025-08-14  1166  		}
20079dd9b36448 Shuming Fan 2024-10-25  1167  
20079dd9b36448 Shuming Fan 2024-10-25 @1168  		if (err < 0)
20079dd9b36448 Shuming Fan 2024-10-25 @1169  			dev_err(&rt1320->sdw_slave->dev, "0x%08x can't be set\n", reg_base + i);
20079dd9b36448 Shuming Fan 2024-10-25  1170  	}
bad0a07a7e61a5 Shuming Fan 2024-05-21  1171  
20079dd9b36448 Shuming Fan 2024-10-25  1172  _done_:
bad0a07a7e61a5 Shuming Fan 2024-05-21  1173  	return 1;
bad0a07a7e61a5 Shuming Fan 2024-05-21  1174  }
bad0a07a7e61a5 Shuming Fan 2024-05-21  1175  
bad0a07a7e61a5 Shuming Fan 2024-05-21  1176  static int rt1320_set_gain_get(struct snd_kcontrol *kcontrol,
bad0a07a7e61a5 Shuming Fan 2024-05-21  1177  		struct snd_ctl_elem_value *ucontrol)
bad0a07a7e61a5 Shuming Fan 2024-05-21  1178  {
bad0a07a7e61a5 Shuming Fan 2024-05-21  1179  	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
bad0a07a7e61a5 Shuming Fan 2024-05-21  1180  	struct rt1320_sdw_priv *rt1320 = snd_soc_component_get_drvdata(component);
bad0a07a7e61a5 Shuming Fan 2024-05-21  1181  	struct soc_mixer_control *mc =
bad0a07a7e61a5 Shuming Fan 2024-05-21  1182  		(struct soc_mixer_control *)kcontrol->private_value;
bad0a07a7e61a5 Shuming Fan 2024-05-21  1183  	unsigned int read_l, read_r, ctl_l = 0, ctl_r = 0;
bad0a07a7e61a5 Shuming Fan 2024-05-21  1184  	const unsigned int interval_offset = 0xc0;
20079dd9b36448 Shuming Fan 2024-10-25  1185  	unsigned int reg_base, regvalue, ctl, i;
20079dd9b36448 Shuming Fan 2024-10-25  1186  	struct rt_sdca_dmic_kctrl_priv *p;
20079dd9b36448 Shuming Fan 2024-10-25  1187  
20079dd9b36448 Shuming Fan 2024-10-25  1188  	if (strstr(ucontrol->id.name, "FU Capture Volume"))
20079dd9b36448 Shuming Fan 2024-10-25  1189  		goto _dmic_vol_;
bad0a07a7e61a5 Shuming Fan 2024-05-21  1190  
bad0a07a7e61a5 Shuming Fan 2024-05-21  1191  	regmap_read(rt1320->mbq_regmap, mc->reg, &read_l);
bad0a07a7e61a5 Shuming Fan 2024-05-21  1192  	regmap_read(rt1320->mbq_regmap, mc->rreg, &read_r);
bad0a07a7e61a5 Shuming Fan 2024-05-21  1193  
bad0a07a7e61a5 Shuming Fan 2024-05-21  1194  	ctl_l = mc->max - (((0 - read_l) & 0xffff) / interval_offset);
bad0a07a7e61a5 Shuming Fan 2024-05-21  1195  
bad0a07a7e61a5 Shuming Fan 2024-05-21  1196  	if (read_l != read_r)
bad0a07a7e61a5 Shuming Fan 2024-05-21  1197  		ctl_r = mc->max - (((0 - read_r) & 0xffff) / interval_offset);
bad0a07a7e61a5 Shuming Fan 2024-05-21  1198  	else
bad0a07a7e61a5 Shuming Fan 2024-05-21  1199  		ctl_r = ctl_l;
bad0a07a7e61a5 Shuming Fan 2024-05-21  1200  
bad0a07a7e61a5 Shuming Fan 2024-05-21  1201  	ucontrol->value.integer.value[0] = ctl_l;
bad0a07a7e61a5 Shuming Fan 2024-05-21  1202  	ucontrol->value.integer.value[1] = ctl_r;
20079dd9b36448 Shuming Fan 2024-10-25  1203  	goto _done_;
20079dd9b36448 Shuming Fan 2024-10-25  1204  
20079dd9b36448 Shuming Fan 2024-10-25  1205  _dmic_vol_:
20079dd9b36448 Shuming Fan 2024-10-25  1206  	p = (struct rt_sdca_dmic_kctrl_priv *)kcontrol->private_value;
20079dd9b36448 Shuming Fan 2024-10-25  1207  
20079dd9b36448 Shuming Fan 2024-10-25  1208  	/* check all channels */
20079dd9b36448 Shuming Fan 2024-10-25  1209  	for (i = 0; i < p->count; i++) {
7bf9e646af9a0c Shuming Fan 2025-08-14  1210  		switch (rt1320->dev_id) {
7bf9e646af9a0c Shuming Fan 2025-08-14  1211  		case RT1320_DEV_ID:
20079dd9b36448 Shuming Fan 2024-10-25  1212  			if (i < 2) {
20079dd9b36448 Shuming Fan 2024-10-25  1213  				reg_base = SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU113, RT1320_SDCA_CTL_FU_VOLUME, CH_01);
20079dd9b36448 Shuming Fan 2024-10-25  1214  				regmap_read(rt1320->mbq_regmap, reg_base + i, &regvalue);
20079dd9b36448 Shuming Fan 2024-10-25  1215  			} else {
20079dd9b36448 Shuming Fan 2024-10-25  1216  				reg_base = SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU14, RT1320_SDCA_CTL_FU_VOLUME, CH_01);
20079dd9b36448 Shuming Fan 2024-10-25  1217  				regmap_read(rt1320->mbq_regmap, reg_base + i - 2, &regvalue);
20079dd9b36448 Shuming Fan 2024-10-25  1218  			}
7bf9e646af9a0c Shuming Fan 2025-08-14  1219  			break;
7bf9e646af9a0c Shuming Fan 2025-08-14  1220  		case RT1321_DEV_ID:
7bf9e646af9a0c Shuming Fan 2025-08-14  1221  			reg_base = SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU113, RT1320_SDCA_CTL_FU_VOLUME, CH_01);
7bf9e646af9a0c Shuming Fan 2025-08-14  1222  			regmap_read(rt1320->mbq_regmap, reg_base + i, &regvalue);
7bf9e646af9a0c Shuming Fan 2025-08-14  1223  			break;
7bf9e646af9a0c Shuming Fan 2025-08-14  1224  		}
20079dd9b36448 Shuming Fan 2024-10-25  1225  
20079dd9b36448 Shuming Fan 2024-10-25 @1226  		ctl = p->max - (((0x1e00 - regvalue) & 0xffff) / interval_offset);
20079dd9b36448 Shuming Fan 2024-10-25  1227  		ucontrol->value.integer.value[i] = ctl;
20079dd9b36448 Shuming Fan 2024-10-25  1228  	}
20079dd9b36448 Shuming Fan 2024-10-25  1229  _done_:
20079dd9b36448 Shuming Fan 2024-10-25  1230  	return 0;
20079dd9b36448 Shuming Fan 2024-10-25  1231  }
20079dd9b36448 Shuming Fan 2024-10-25  1232  

:::::: The code at line 1168 was first introduced by commit
:::::: 20079dd9b364483db613186b289fe372bddf41b5 ASoC: rt1320: add mic function

:::::: TO: Shuming Fan <shumingf@realtek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
