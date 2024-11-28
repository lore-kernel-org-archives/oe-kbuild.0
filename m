Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3CD6E2BE
	for <oe-kbuild@lists.linux.dev>; Thu, 28 Nov 2024 17:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732816386; cv=none; b=fUy11jkCm7ltmZRoDYUEDK/f0MHRKI06HOqfFHODmwNWbiwnm1m14+Rpvqn/Akb7qol6V8WA+cyZb8ZlP35bnL+93ZE6ssIVWRaBZUFWgH+1L5GqAVAKfPeWCZBlOgi32LX+DrgWTXB1X+saNKBin+rgciZ3I5bcHf9wkeQcvsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732816386; c=relaxed/simple;
	bh=rOmfSY6xQfjltw5J6aGtcl2QvkCQ03xbWDP1v+VFPKs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SizS8+WI82HEZ7X7pXv8YhQNgHIvT8nhoIVVoogQ0CuGudhnWm8CJ3H/36wU1dMcinMNqgYu8Y5RdU91lqu7pmyfPqRPcfVp1Xkwp7uuVvK62sJ2XEcJ9OizG010+30bW7adAWntu/yR9/8yVkvVHz7EtvSR5Rgoqv80AZv2ZLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I6xjHGaH; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I6xjHGaH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732816384; x=1764352384;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rOmfSY6xQfjltw5J6aGtcl2QvkCQ03xbWDP1v+VFPKs=;
  b=I6xjHGaH5mRbqDfJaNqXVhIjILwNx/MXH+fFm9pRXXiFGWUUGBGWTltU
   2KfyjCNpgOMJR9qYxP7/M2djDTMQNjd9vl6Wr3K6YlBelNkguh+m+75eb
   r0ylcrCsD8k1tApWk3fxezEcUAblpm7jRcBQDI9Cq5JjOoL5U7SW1T8xl
   GLdxetxkVahpUM24UJ11G3B+NznTmWLZMmkVkd/ggeubKNO++C9QpR5OL
   dmdG+ooOe+4RVhRBIO68pb6AwwfqBTkl1EDg4ZfuKwlC02EQrojetXIdk
   BjTeVMe+gXPSOckiTK1rSLQnSMK8KZjnEcTUFuj0ghl1vMAn4E3c51Fh9
   g==;
X-CSE-ConnectionGUID: R4cuds3RSEueK8fdcyhAPg==
X-CSE-MsgGUID: GAa2Fu9rQPWJia2U73UHPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33000475"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="33000475"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 09:53:03 -0800
X-CSE-ConnectionGUID: Gitg+uwqTa654xUf1usZVw==
X-CSE-MsgGUID: CSoTyDcGTxWV61Cn54QBMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="92474795"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Nov 2024 09:53:02 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGihH-0009t9-1T;
	Thu, 28 Nov 2024 17:52:59 +0000
Date: Fri, 29 Nov 2024 01:52:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/i915/display/intel_bios.c:968:6-41: opportunity for
 str_low_high(panel -> vbt . backlight . active_low_pwm)
Message-ID: <202411290148.AbWP0D2W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
CC: Jani Nikula <jani.nikula@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b86545e02e8c22fb89218f29d381fa8e8b91d815
commit: 3cf050762534cc268a02793ec00240f81c6e2229 drm/i915/bios: Split VBT data into per-panel vs. global parts
date:   2 years, 6 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 2 years, 6 months ago
config: x86_64-randconfig-103-20241121 (https://download.01.org/0day-ci/archive/20241129/202411290148.AbWP0D2W-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411290148.AbWP0D2W-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_bios.c:968:6-41: opportunity for str_low_high(panel -> vbt . backlight . active_low_pwm)

vim +968 drivers/gpu/drm/i915/display/intel_bios.c

33ef6d4fd8df78 drivers/gpu/drm/i915/display/intel_bios.c Matt Roper            2019-11-15  882  
f00076d2fd3fe2 drivers/gpu/drm/i915/intel_bios.c         Jani Nikula           2013-12-14  883  static void
3cf050762534cc drivers/gpu/drm/i915/display/intel_bios.c Ville Syrjälä         2022-05-10  884  parse_lfp_backlight(struct drm_i915_private *i915,
3cf050762534cc drivers/gpu/drm/i915/display/intel_bios.c Ville Syrjälä         2022-05-10  885  		    struct intel_panel *panel)
f00076d2fd3fe2 drivers/gpu/drm/i915/intel_bios.c         Jani Nikula           2013-12-14  886  {
f00076d2fd3fe2 drivers/gpu/drm/i915/intel_bios.c         Jani Nikula           2013-12-14  887  	const struct bdb_lfp_backlight_data *backlight_data;
f87f6599c8436b drivers/gpu/drm/i915/intel_bios.c         Jani Nikula           2019-05-31  888  	const struct lfp_backlight_data_entry *entry;
3cf050762534cc drivers/gpu/drm/i915/display/intel_bios.c Ville Syrjälä         2022-05-10  889  	int panel_type = panel->vbt.panel_type;
d381baad29b435 drivers/gpu/drm/i915/display/intel_bios.c José Roberto de Souza 2020-10-08  890  	u16 level;
f00076d2fd3fe2 drivers/gpu/drm/i915/intel_bios.c         Jani Nikula           2013-12-14  891  
e163cfb4c96d02 drivers/gpu/drm/i915/display/intel_bios.c Ville Syrjälä         2022-04-06  892  	backlight_data = find_section(i915, BDB_LVDS_BACKLIGHT);
f00076d2fd3fe2 drivers/gpu/drm/i915/intel_bios.c         Jani Nikula           2013-12-14  893  	if (!backlight_data)
f00076d2fd3fe2 drivers/gpu/drm/i915/intel_bios.c         Jani Nikula           2013-12-14  894  		return;
f00076d2fd3fe2 drivers/gpu/drm/i915/intel_bios.c         Jani Nikula           2013-12-14  895  
f00076d2fd3fe2 drivers/gpu/drm/i915/intel_bios.c         Jani Nikula           2013-12-14  896  	if (backlight_data->entry_size != sizeof(backlight_data->data[0])) {
dbd440d8e08879 drivers/gpu/drm/i915/display/intel_bios.c Jani Nikula           2021-03-17  897  		drm_dbg_kms(&i915->drm,
e92cbf38828c86 drivers/gpu/drm/i915/display/intel_bios.c Wambui Karuga         2020-01-21  898  			    "Unsupported backlight data entry size %u\n",
f00076d2fd3fe2 drivers/gpu/drm/i915/intel_bios.c         Jani Nikula           2013-12-14  899  			    backlight_data->entry_size);
f00076d2fd3fe2 drivers/gpu/drm/i915/intel_bios.c         Jani Nikula           2013-12-14  900  		return;
f00076d2fd3fe2 drivers/gpu/drm/i915/intel_bios.c         Jani Nikula           2013-12-14  901  	}
f00076d2fd3fe2 drivers/gpu/drm/i915/intel_bios.c         Jani Nikula           2013-12-14  902  
f00076d2fd3fe2 drivers/gpu/drm/i915/intel_bios.c         Jani Nikula           2013-12-14  903  	entry = &backlight_data->data[panel_type];
f00076d2fd3fe2 drivers/gpu/drm/i915/intel_bios.c         Jani Nikula           2013-12-14  904  
3cf050762534cc drivers/gpu/drm/i915/display/intel_bios.c Ville Syrjälä         2022-05-10  905  	panel->vbt.backlight.present = entry->type == BDB_BACKLIGHT_TYPE_PWM;
3cf050762534cc drivers/gpu/drm/i915/display/intel_bios.c Ville Syrjälä         2022-05-10  906  	if (!panel->vbt.backlight.present) {
dbd440d8e08879 drivers/gpu/drm/i915/display/intel_bios.c Jani Nikula           2021-03-17  907  		drm_dbg_kms(&i915->drm,
e92cbf38828c86 drivers/gpu/drm/i915/display/intel_bios.c Wambui Karuga         2020-01-21  908  			    "PWM backlight not present in VBT (type %u)\n",
39fbc9c8f67659 drivers/gpu/drm/i915/intel_bios.c         Jani Nikula           2014-04-09  909  			    entry->type);
39fbc9c8f67659 drivers/gpu/drm/i915/intel_bios.c         Jani Nikula           2014-04-09  910  		return;
39fbc9c8f67659 drivers/gpu/drm/i915/intel_bios.c         Jani Nikula           2014-04-09  911  	}
39fbc9c8f67659 drivers/gpu/drm/i915/intel_bios.c         Jani Nikula           2014-04-09  912  
3cf050762534cc drivers/gpu/drm/i915/display/intel_bios.c Ville Syrjälä         2022-05-10  913  	panel->vbt.backlight.type = INTEL_BACKLIGHT_DISPLAY_DDI;
d58a3d699797a5 drivers/gpu/drm/i915/display/intel_bios.c Ville Syrjälä         2022-04-05  914  	if (i915->vbt.version >= 191) {
4378daf5d04eed drivers/gpu/drm/i915/display/intel_bios.c Lukasz Majczak        2021-09-30  915  		size_t exp_size;
4378daf5d04eed drivers/gpu/drm/i915/display/intel_bios.c Lukasz Majczak        2021-09-30  916  
d58a3d699797a5 drivers/gpu/drm/i915/display/intel_bios.c Ville Syrjälä         2022-04-05  917  		if (i915->vbt.version >= 236)
4378daf5d04eed drivers/gpu/drm/i915/display/intel_bios.c Lukasz Majczak        2021-09-30  918  			exp_size = sizeof(struct bdb_lfp_backlight_data);
d58a3d699797a5 drivers/gpu/drm/i915/display/intel_bios.c Ville Syrjälä         2022-04-05  919  		else if (i915->vbt.version >= 234)
4378daf5d04eed drivers/gpu/drm/i915/display/intel_bios.c Lukasz Majczak        2021-09-30  920  			exp_size = EXP_BDB_LFP_BL_DATA_SIZE_REV_234;
4378daf5d04eed drivers/gpu/drm/i915/display/intel_bios.c Lukasz Majczak        2021-09-30  921  		else
4378daf5d04eed drivers/gpu/drm/i915/display/intel_bios.c Lukasz Majczak        2021-09-30  922  			exp_size = EXP_BDB_LFP_BL_DATA_SIZE_REV_191;
4378daf5d04eed drivers/gpu/drm/i915/display/intel_bios.c Lukasz Majczak        2021-09-30  923  
4378daf5d04eed drivers/gpu/drm/i915/display/intel_bios.c Lukasz Majczak        2021-09-30  924  		if (get_blocksize(backlight_data) >= exp_size) {
f87f6599c8436b drivers/gpu/drm/i915/intel_bios.c         Jani Nikula           2019-05-31  925  			const struct lfp_backlight_control_method *method;
9a41e17de38e85 drivers/gpu/drm/i915/intel_bios.c         Deepak M              2016-04-26  926  
9a41e17de38e85 drivers/gpu/drm/i915/intel_bios.c         Deepak M              2016-04-26  927  			method = &backlight_data->backlight_control[panel_type];
3cf050762534cc drivers/gpu/drm/i915/display/intel_bios.c Ville Syrjälä         2022-05-10  928  			panel->vbt.backlight.type = method->type;
3cf050762534cc drivers/gpu/drm/i915/display/intel_bios.c Ville Syrjälä         2022-05-10  929  			panel->vbt.backlight.controller = method->controller;
9a41e17de38e85 drivers/gpu/drm/i915/intel_bios.c         Deepak M              2016-04-26  930  		}
4378daf5d04eed drivers/gpu/drm/i915/display/intel_bios.c Lukasz Majczak        2021-09-30  931  	}
9a41e17de38e85 drivers/gpu/drm/i915/intel_bios.c         Deepak M              2016-04-26  932  
3cf050762534cc drivers/gpu/drm/i915/display/intel_bios.c Ville Syrjälä         2022-05-10  933  	panel->vbt.backlight.pwm_freq_hz = entry->pwm_freq_hz;
3cf050762534cc drivers/gpu/drm/i915/display/intel_bios.c Ville Syrjälä         2022-05-10  934  	panel->vbt.backlight.active_low_pwm = entry->active_low_pwm;
d381baad29b435 drivers/gpu/drm/i915/display/intel_bios.c José Roberto de Souza 2020-10-08  935  
d58a3d699797a5 drivers/gpu/drm/i915/display/intel_bios.c Ville Syrjälä         2022-04-05  936  	if (i915->vbt.version >= 234) {
d381baad29b435 drivers/gpu/drm/i915/display/intel_bios.c José Roberto de Souza 2020-10-08  937  		u16 min_level;
d381baad29b435 drivers/gpu/drm/i915/display/intel_bios.c José Roberto de Souza 2020-10-08  938  		bool scale;
d381baad29b435 drivers/gpu/drm/i915/display/intel_bios.c José Roberto de Souza 2020-10-08  939  
d381baad29b435 drivers/gpu/drm/i915/display/intel_bios.c José Roberto de Souza 2020-10-08  940  		level = backlight_data->brightness_level[panel_type].level;
d381baad29b435 drivers/gpu/drm/i915/display/intel_bios.c José Roberto de Souza 2020-10-08  941  		min_level = backlight_data->brightness_min_level[panel_type].level;
d381baad29b435 drivers/gpu/drm/i915/display/intel_bios.c José Roberto de Souza 2020-10-08  942  
d58a3d699797a5 drivers/gpu/drm/i915/display/intel_bios.c Ville Syrjälä         2022-04-05  943  		if (i915->vbt.version >= 236)
d381baad29b435 drivers/gpu/drm/i915/display/intel_bios.c José Roberto de Souza 2020-10-08  944  			scale = backlight_data->brightness_precision_bits[panel_type] == 16;
d381baad29b435 drivers/gpu/drm/i915/display/intel_bios.c José Roberto de Souza 2020-10-08  945  		else
d381baad29b435 drivers/gpu/drm/i915/display/intel_bios.c José Roberto de Souza 2020-10-08  946  			scale = level > 255;
d381baad29b435 drivers/gpu/drm/i915/display/intel_bios.c José Roberto de Souza 2020-10-08  947  
d381baad29b435 drivers/gpu/drm/i915/display/intel_bios.c José Roberto de Souza 2020-10-08  948  		if (scale)
d381baad29b435 drivers/gpu/drm/i915/display/intel_bios.c José Roberto de Souza 2020-10-08  949  			min_level = min_level / 255;
d381baad29b435 drivers/gpu/drm/i915/display/intel_bios.c José Roberto de Souza 2020-10-08  950  
d381baad29b435 drivers/gpu/drm/i915/display/intel_bios.c José Roberto de Souza 2020-10-08  951  		if (min_level > 255) {
dbd440d8e08879 drivers/gpu/drm/i915/display/intel_bios.c Jani Nikula           2021-03-17  952  			drm_warn(&i915->drm, "Brightness min level > 255\n");
d381baad29b435 drivers/gpu/drm/i915/display/intel_bios.c José Roberto de Souza 2020-10-08  953  			level = 255;
d381baad29b435 drivers/gpu/drm/i915/display/intel_bios.c José Roberto de Souza 2020-10-08  954  		}
3cf050762534cc drivers/gpu/drm/i915/display/intel_bios.c Ville Syrjälä         2022-05-10  955  		panel->vbt.backlight.min_brightness = min_level;
84d3d71fe3630c drivers/gpu/drm/i915/display/intel_bios.c Lee Shawn C           2021-09-08  956  
3cf050762534cc drivers/gpu/drm/i915/display/intel_bios.c Ville Syrjälä         2022-05-10  957  		panel->vbt.backlight.brightness_precision_bits =
84d3d71fe3630c drivers/gpu/drm/i915/display/intel_bios.c Lee Shawn C           2021-09-08  958  			backlight_data->brightness_precision_bits[panel_type];
d381baad29b435 drivers/gpu/drm/i915/display/intel_bios.c José Roberto de Souza 2020-10-08  959  	} else {
d381baad29b435 drivers/gpu/drm/i915/display/intel_bios.c José Roberto de Souza 2020-10-08  960  		level = backlight_data->level[panel_type];
3cf050762534cc drivers/gpu/drm/i915/display/intel_bios.c Ville Syrjälä         2022-05-10  961  		panel->vbt.backlight.min_brightness = entry->min_brightness;
d381baad29b435 drivers/gpu/drm/i915/display/intel_bios.c José Roberto de Souza 2020-10-08  962  	}
d381baad29b435 drivers/gpu/drm/i915/display/intel_bios.c José Roberto de Souza 2020-10-08  963  
dbd440d8e08879 drivers/gpu/drm/i915/display/intel_bios.c Jani Nikula           2021-03-17  964  	drm_dbg_kms(&i915->drm,
e92cbf38828c86 drivers/gpu/drm/i915/display/intel_bios.c Wambui Karuga         2020-01-21  965  		    "VBT backlight PWM modulation frequency %u Hz, "
add033793c9efa drivers/gpu/drm/i915/intel_bios.c         Vidya Srinivas        2016-12-08  966  		    "active %s, min brightness %u, level %u, controller %u\n",
3cf050762534cc drivers/gpu/drm/i915/display/intel_bios.c Ville Syrjälä         2022-05-10  967  		    panel->vbt.backlight.pwm_freq_hz,
3cf050762534cc drivers/gpu/drm/i915/display/intel_bios.c Ville Syrjälä         2022-05-10 @968  		    panel->vbt.backlight.active_low_pwm ? "low" : "high",
3cf050762534cc drivers/gpu/drm/i915/display/intel_bios.c Ville Syrjälä         2022-05-10  969  		    panel->vbt.backlight.min_brightness,
d381baad29b435 drivers/gpu/drm/i915/display/intel_bios.c José Roberto de Souza 2020-10-08  970  		    level,
3cf050762534cc drivers/gpu/drm/i915/display/intel_bios.c Ville Syrjälä         2022-05-10  971  		    panel->vbt.backlight.controller);
f00076d2fd3fe2 drivers/gpu/drm/i915/intel_bios.c         Jani Nikula           2013-12-14  972  }
f00076d2fd3fe2 drivers/gpu/drm/i915/intel_bios.c         Jani Nikula           2013-12-14  973  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
