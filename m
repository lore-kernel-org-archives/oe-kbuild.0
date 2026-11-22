Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795330320;
	b=e2SrbePq9p2SAg8ewFWPmBMMKWCGqy6gtCkiVGV1dwQbiMM5XKuxRBOq0OTV1uStYXOj
	 EzFFppP5FeWrLJLUM+DazDustMAAzgPBxi8gQCJCy/nTYoYAg+ZE4cV9SJJ9LDHi5JSEJ
	 g8Zhm5WAFg3gPV86XUdpQadGbk9ga/qnNlGRpIqLgYCcrjTvoUMYYJyOriMSGNKG0nb0b
	 yDKTp9uoViIpcx7gcrZ9VOyEI5NjpBl17Iu4UfgGRXuXhpKiHdzzQ6FwObqGY4arzcRDb
	 2CG46NVaB0Pkojbe6RDki5GgZvUf+8tTd0dXp1R7CxyAmokgfUdbRGQ6cevM6FQ94kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795330320;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=7Rw/SPk5GNp6V4StTpPOMwI3UidedzcdKzvqB0VpIF4=;
	b=yIKXUO8GgVlvlRBFhzSg8MApM4ALjPJqJdNaeQXlqoyNj03q80v9xqLjA/VLZNVCUMjx
	 2TAFiUKioiM3Q6IaJ85O0ZLHIlmO59UOlhYwH1TWnsIMmUsRG2sWudV+tJ0JiDhV52G8d
	 xnNpFoD18ngnIboBFp/V2/RE3NTQ3pL8mog7ssq1HMsBA8weKhf0mZJY+W/68BgJTw7kT
	 dl3rYLD/hLA+UlHEnQ6CQN9fqmol3FxnjHWRcI7v3NawD6VMRPZmDEsFEq/GU7pV+xuHO
	 7Xtq11RY1A009/vUQ5i5Sx8+uRIZkng0vf9ilxs5oCNIUtr2QtZ+8ZnoiyxKE0T8OeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gXkZz928;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D24606A320
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Nov 2026 06:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87D24606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gXkZz928
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795330320; x=1826866320;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/nmdPRo3MfZZPzZB/YiLOEo/xNAoticOLxhdWFqUJZ8=;
  b=gXkZz928TWR1qiJMqcIGJOGsg/2B8chtlnaGSEOQcwt1V+KhW9gq8lxu
   UKnHDZOKqwzDHtTRxws0c+fskpoo4M5RefeQ/LtXDIQikvvk0Y+4+p9E9
   73lbrH0UvHMHjGry8Qm2v7JPbzesSt4Jnhjdh4xKnFx2tgjLkxnJCugSm
   vtRfmF/r79+H4Qrgn2uyGIUsvB3kxpawPOF6XWrw2Himv3CEuZM7NuS3O
   7E9khg+WCVCvctgrpmIiAMKTnC6HmL+R8vQ65rjlK7oQsjwJxx0tkzRuv
   M2w1KcjDQihRwf1Ma7DooNsfgJHTz2LE3SeAdEKp98WJF8DsG6/HZnEo4
   Q==;
X-CSE-ConnectionGUID: ShnqJ37IQLmVHRcIXJFzAw==
X-CSE-MsgGUID: 1g/+xxc8TWu+JGat8YNr7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4054303"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4054303"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 22:51:59 -0800
X-CSE-ConnectionGUID: mwZ3XdvSTdaxX+PJ90w/hQ==
X-CSE-MsgGUID: CqTnHTIrT/Gs0Vr3m/qRTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="11358249"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Nov 2026 22:51:58 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xV1QZ-00000001L8s-2rir;
	Sun, 22 Nov 2026 06:51:55 +0000
Date: Sun, 22 Nov 2026 14:51:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 6/8] drm/amd/display: Pick the FreeSync video config for
 the new stream's sink
Message-ID: <202611221400.3hrykDft-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261114-amdgpu-modes-four-v1-6-f11e2a6cd407@hsal.es>
References: <20261114-amdgpu-modes-four-v1-6-f11e2a6cd407@hsal.es>
TO: Hugo Sales via B4 Relay <devnull+hugo.hsal.es@kernel.org>
TO: Harry Wentland <harry.wentland@amd.com>
TO: Leo Li <sunpeng.li@amd.com>
TO: Rodrigo Siqueira <siqueira@igalia.com>
TO: Alex Deucher <alexander.deucher@amd.com>
TO: "Christian König" <christian.koenig@amd.com>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Ray Wu <ray.wu@amd.com>
TO: Fangzhi Zuo <jerry.zuo@amd.com>
TO: Roman Li <roman.li@amd.com>
TO: Alex Hung <alex.hung@amd.com>
CC: amd-gfx@lists.freedesktop.org
CC: dri-devel@lists.freedesktop.org
CC: linux-kernel@vger.kernel.org
CC: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
CC: Aurabindo Pillai <aurabindo.pillai@amd.com>
CC: Hugo Sales <hugo@hsal.es>

Hi Hugo,

kernel test robot noticed the following build errors:

[auto build test ERROR on 47df73aa49d1988c8f684b7caf8be6570e966844]

url:    https://github.com/intel-lab-lkp/linux/commits/Hugo-Sales-via-B4-Relay/drm-amd-display-Drop-the-unadvertised-mode-check/20261114-230912
base:   47df73aa49d1988c8f684b7caf8be6570e966844
patch link:    https://lore.kernel.org/r/20261114-amdgpu-modes-four-v1-6-f11e2a6cd407%40hsal.es
patch subject: [PATCH 6/8] drm/amd/display: Pick the FreeSync video config for the new stream's sink
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20261122/202611221400.3hrykDft-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/202611221400.3hrykDft-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611221400.3hrykDft-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0x14 (section: .data) -> ice_adv_lnk_speed_100 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0x30 (section: .data) -> ice_adv_lnk_speed_1000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0x4c (section: .data) -> ice_adv_lnk_speed_2500 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0x68 (section: .data) -> ice_adv_lnk_speed_5000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0x84 (section: .data) -> ice_adv_lnk_speed_10000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0xa0 (section: .data) -> ice_adv_lnk_speed_25000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0xbc (section: .data) -> ice_adv_lnk_speed_40000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0xd8 (section: .data) -> ice_adv_lnk_speed_50000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0xf4 (section: .data) -> ice_adv_lnk_speed_100000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0x110 (section: .data) -> ice_adv_lnk_speed_200000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps+0x14 (section: .data) -> qed_mfw_ext_1g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps+0x30 (section: .data) -> qed_mfw_ext_10g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps+0x4c (section: .data) -> qed_mfw_ext_25g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps+0x68 (section: .data) -> qed_mfw_ext_40g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps+0x84 (section: .data) -> qed_mfw_ext_50g_base_r (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps+0xa0 (section: .data) -> qed_mfw_ext_50g_base_r2 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps+0xbc (section: .data) -> qed_mfw_ext_100g_base_r2 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps+0xd8 (section: .data) -> qed_mfw_ext_100g_base_r4 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_legacy_maps+0x14 (section: .data) -> qed_mfw_legacy_1g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_legacy_maps+0x30 (section: .data) -> qed_mfw_legacy_10g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_legacy_maps+0x4c (section: .data) -> qed_mfw_legacy_20g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_legacy_maps+0x68 (section: .data) -> qed_mfw_legacy_25g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_legacy_maps+0x84 (section: .data) -> qed_mfw_legacy_40g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_legacy_maps+0xa0 (section: .data) -> qed_mfw_legacy_50g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_legacy_maps+0xbc (section: .data) -> qed_mfw_legacy_bb_100g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede: section mismatch in reference: qede_forced_speed_maps+0x14 (section: .data) -> qede_forced_speed_1000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede: section mismatch in reference: qede_forced_speed_maps+0x30 (section: .data) -> qede_forced_speed_10000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede: section mismatch in reference: qede_forced_speed_maps+0x4c (section: .data) -> qede_forced_speed_20000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede: section mismatch in reference: qede_forced_speed_maps+0x68 (section: .data) -> qede_forced_speed_25000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede: section mismatch in reference: qede_forced_speed_maps+0x84 (section: .data) -> qede_forced_speed_40000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede: section mismatch in reference: qede_forced_speed_maps+0xa0 (section: .data) -> qede_forced_speed_50000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede: section mismatch in reference: qede_forced_speed_maps+0xbc (section: .data) -> qede_forced_speed_100000 (section: .init.rodata)
>> ERROR: modpost: "amdgpu_freesync_vid_mode" [drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_test.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
