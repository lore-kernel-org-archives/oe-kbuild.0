Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B244D109
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Feb 2024 10:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708166689; cv=none; b=Am9hgG2cyhD8wIBC3olbv6DL8318fEoYQrfP/TxKiH0zP/9mXCA+c06ZG574PuvyaqMaxEbx2K/MWI7qXpVrVhAIIgcP1yFY3+kUwU6SijRm7d48b1NwppP9+A1+SuOzkJ4h0ltYnhbtFTCqWCoLOQjoqU38r5PTO+3JFA0rODc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708166689; c=relaxed/simple;
	bh=zVryk5P/0CCWaX+ayWBxD2sjqA6pOSkOoYYe2CAQcBA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TDkXFEGyyQXZTv8VgHysrs+3qPCbcwHFI7Naif4h3Bjip1AUx1eH2L9S2Amt+QP6pCHP7mP+nnQfQmKJCNzh8Sayh5F/5vSLIE4TChad5ovdtPTT68QwoNoZMbAkJ2jCglWl15I/XsB5vm2DU0FP4PXywsC5byBBj5G/260lB5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mO+FAj1k; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mO+FAj1k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708166688; x=1739702688;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zVryk5P/0CCWaX+ayWBxD2sjqA6pOSkOoYYe2CAQcBA=;
  b=mO+FAj1kCXCEnaO8qwevoQbhfnJe1zT4VF9uO53Zof8CTwyXBf2cuvgv
   XGYnrVd/ziN1sIqr9kSmA4AZFVKGX1FDebMPXT0dNE071APwEJXT0SRtI
   Tysm6E4GhLlBySYpQq90X2A3nGB317ubnxxqeiVbmXqucaoxLfNddO6su
   jRhMIVgccxctNaviWc7JAT5DEHm0OHbV9/gcCqrnPUjEmpCN/IBRqlz8c
   2c2ITtUvhz2V5z/o1tzm7vFEIdaRdQ2V3kDyZ+D11abRaJN5vz3jjO37p
   6euJ+Fc8nEEMBvsL3324t0JsefktUVaPKyb41zkCVOjNPignj5epDzZ2d
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="2162505"
X-IronPort-AV: E=Sophos;i="6.06,166,1705392000"; 
   d="scan'208";a="2162505"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 02:44:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,166,1705392000"; 
   d="scan'208";a="41548535"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 17 Feb 2024 02:44:46 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbIBR-00023I-2w;
	Sat, 17 Feb 2024 10:44:39 +0000
Date: Sat, 17 Feb 2024 18:43:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 4/6] drm/i915/psr: Silence period and lfps half cycle
Message-ID: <202402171830.n4hwR2iD-lkp@intel.com>
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
In-Reply-To: <20240215104934.2395239-5-jouni.hogander@intel.com>
References: <20240215104934.2395239-5-jouni.hogander@intel.com>
TO: "Jouni Högander" <jouni.hogander@intel.com>
TO: intel-gfx@lists.freedesktop.org
CC: "Jouni Högander" <jouni.hogander@intel.com>

Hi Jouni,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip drm/drm-next next-20240216]
[cannot apply to drm-intel/for-linux-next-fixes linus/master v6.8-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jouni-H-gander/drm-display-Add-missing-aux-less-alpm-wake-related-bits/20240215-185209
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240215104934.2395239-5-jouni.hogander%40intel.com
patch subject: [PATCH 4/6] drm/i915/psr: Silence period and lfps half cycle
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20240217 (https://download.01.org/0day-ci/archive/20240217/202402171830.n4hwR2iD-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402171830.n4hwR2iD-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/display/intel_psr.c:1253 _lnl_compute_aux_less_alpm_params() error: uninitialized symbol 'silence_period'.

vim +/silence_period +1253 drivers/gpu/drm/i915/display/intel_psr.c

e31171d1611687 Jouni Högander 2024-02-15  1234  
e4870a4a3cd051 Jouni Högander 2024-02-15  1235  static int _lnl_compute_aux_less_alpm_params(struct intel_dp *intel_dp,
e4870a4a3cd051 Jouni Högander 2024-02-15  1236  					     struct intel_crtc_state *crtc_state)
e4870a4a3cd051 Jouni Högander 2024-02-15  1237  {
e4870a4a3cd051 Jouni Högander 2024-02-15  1238  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
410818227325ec Jouni Högander 2024-02-15  1239  	int aux_less_wake_time, aux_less_wake_lines, switch_to_active_lines,
410818227325ec Jouni Högander 2024-02-15  1240  		silence_period, lfps_half_cycle;
e4870a4a3cd051 Jouni Högander 2024-02-15  1241  
e4870a4a3cd051 Jouni Högander 2024-02-15  1242  	aux_less_wake_time =
e4870a4a3cd051 Jouni Högander 2024-02-15  1243  		_lnl_compute_aux_less_wake_time(crtc_state->port_clock / 1000);
e4870a4a3cd051 Jouni Högander 2024-02-15  1244  	aux_less_wake_lines = intel_usecs_to_scanlines(&crtc_state->hw.adjusted_mode,
e4870a4a3cd051 Jouni Högander 2024-02-15  1245  						       aux_less_wake_time);
e4870a4a3cd051 Jouni Högander 2024-02-15  1246  
e31171d1611687 Jouni Högander 2024-02-15  1247  	switch_to_active_lines =
e31171d1611687 Jouni Högander 2024-02-15  1248  		intel_usecs_to_scanlines(
e31171d1611687 Jouni Högander 2024-02-15  1249  			&crtc_state->hw.adjusted_mode,
e31171d1611687 Jouni Högander 2024-02-15  1250  			_lnl_compute_switch_to_active_time(crtc_state->port_clock / 1000));
e31171d1611687 Jouni Högander 2024-02-15  1251  
410818227325ec Jouni Högander 2024-02-15  1252  	if (aux_less_wake_lines > 32 || switch_to_active_lines > 32 ||
410818227325ec Jouni Högander 2024-02-15 @1253  	    silence_period > 256 || silence_period < 0 ||
410818227325ec Jouni Högander 2024-02-15  1254  	    !_lnl_get_silence_period_and_lfps_half_cycle(intel_dp->link_rate,
410818227325ec Jouni Högander 2024-02-15  1255  							 &silence_period,
410818227325ec Jouni Högander 2024-02-15  1256  							 &lfps_half_cycle))
e4870a4a3cd051 Jouni Högander 2024-02-15  1257  		return false;
e4870a4a3cd051 Jouni Högander 2024-02-15  1258  
e31171d1611687 Jouni Högander 2024-02-15  1259  	if (i915->display.params.psr_safest_params) {
e4870a4a3cd051 Jouni Högander 2024-02-15  1260  		aux_less_wake_lines = 32;
e31171d1611687 Jouni Högander 2024-02-15  1261  		switch_to_active_lines = 32;
e31171d1611687 Jouni Högander 2024-02-15  1262  	}
e4870a4a3cd051 Jouni Högander 2024-02-15  1263  
e4870a4a3cd051 Jouni Högander 2024-02-15  1264  	intel_dp->psr.alpm_parameters.aux_less_wake_lines = aux_less_wake_lines;
e31171d1611687 Jouni Högander 2024-02-15  1265  	intel_dp->psr.alpm_parameters.switch_to_active_lines = switch_to_active_lines;
410818227325ec Jouni Högander 2024-02-15  1266  	intel_dp->psr.alpm_parameters.silence_period_sym_clocks = silence_period;
410818227325ec Jouni Högander 2024-02-15  1267  	intel_dp->psr.alpm_parameters.lfps_half_cycle_num_of_syms = lfps_half_cycle;
e4870a4a3cd051 Jouni Högander 2024-02-15  1268  
e4870a4a3cd051 Jouni Högander 2024-02-15  1269  	return true;
e4870a4a3cd051 Jouni Högander 2024-02-15  1270  }
e4870a4a3cd051 Jouni Högander 2024-02-15  1271  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
