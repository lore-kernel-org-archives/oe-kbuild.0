Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC8C19D8BB
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Jan 2025 06:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735885581; cv=none; b=hXhP6MMNBueb6auAErKvz7LaP8m4iBEWlrq1XvrfgD/KDLMFeLQzXQ5syNh1lIPz8PBxaJ4Ei3b2zr/nhRyUREX6pj2LLJ/4W0ljjf6eACBfO1lYLsllJAG3bzZpmr2TvdqDAawCGxm3ahai6dVQyThNC6OBXWkOcYU0gNuGRXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735885581; c=relaxed/simple;
	bh=GUzAiatBswxizzAa1PuoO0J8SX/62RTgsZA6ZK004D8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MjMMH6GOs9uvB3l/R8SbIU7XAYDXJN6N/QkcI3g1jc2bQsxJOKgyKAdwR/kV0MPxagRd8HGCYX68pMvYEvunftt4JVGvZLWyb9gxFqmUbfH+BLc+J/lZfyBeJ9Eb8evEApzfvQLETxWGaaa5MZem4nikLiDQ7tP7f789tm6PADs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FjcNz1Dj; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FjcNz1Dj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735885579; x=1767421579;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GUzAiatBswxizzAa1PuoO0J8SX/62RTgsZA6ZK004D8=;
  b=FjcNz1Dj7invVtpr1K5hMXYmU2+RNBr6dE14H/b+wcKBeKO5Pc1cgE8K
   0aKdc5Gy9nipYszgT/wsvjvX1MMoIm2Qouo5lhf2cDQpfKYEHdsWvuzMs
   WWW79HXJTZmuFOUuwByIxlCEvpxmPcVBdk1mxWPuQ3TAJdNNNE/CSGLcz
   hTVXv2P0kP2qsYFDWwzibaXbP9RSHDLNWpLoPZFJ/4u2Rgatk2w2EvmDs
   BWem14WismwYnjiRL/5OuSKwPa7zDMS6A9kh8OMHXtGfmAhUT9qhzN2wP
   5jpXKyxYP5K5UmioKYqp1B1++grAFvmpiFif+axodaOiPzzt6xd/jHjCh
   A==;
X-CSE-ConnectionGUID: A6Wwh6XUR4+nDkVBnoOGLQ==
X-CSE-MsgGUID: 3/C5xVhdQF62j5nlo1YV1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="23730521"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="23730521"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 22:26:19 -0800
X-CSE-ConnectionGUID: Cz1C5vmKQ9WfRAlW036CmA==
X-CSE-MsgGUID: eAyM+t/PSF68XxO0dqJjRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="101570029"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 02 Jan 2025 22:26:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTb8R-0009Jh-0C;
	Fri, 03 Jan 2025 06:26:15 +0000
Date: Fri, 3 Jan 2025 14:25:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/display/drm_dp_tunnel.c:1270:26-27: WARNING
 opportunity for min()
Message-ID: <202501031414.VY4poFjN-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Imre Deak <imre.deak@intel.com>
CC: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
CC: Uma Shankar <uma.shankar@intel.com>

Hi Imre,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
commit: 91888b5b1ad2fda3f4c6b8de5dd42dbe8b90ac2c drm/i915/dp: Add support for DP tunnel BW allocation
date:   10 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-102-20241229 (https://download.01.org/0day-ci/archive/20250103/202501031414.VY4poFjN-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202501031414.VY4poFjN-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/display/drm_dp_tunnel.c:1270:26-27: WARNING opportunity for min()
--
>> drivers/gpu/drm/display/drm_dp_tunnel.c:1128:2-3: Unneeded semicolon

vim +1270 drivers/gpu/drm/display/drm_dp_tunnel.c

295654f7e554a9 Imre Deak 2024-02-26  1071  
295654f7e554a9 Imre Deak 2024-02-26  1072  static int allocate_tunnel_bw(struct drm_dp_tunnel *tunnel, int bw)
295654f7e554a9 Imre Deak 2024-02-26  1073  {
295654f7e554a9 Imre Deak 2024-02-26  1074  	struct drm_dp_tunnel_mgr *mgr = tunnel->group->mgr;
295654f7e554a9 Imre Deak 2024-02-26  1075  	int request_bw = DIV_ROUND_UP(bw, tunnel->bw_granularity);
295654f7e554a9 Imre Deak 2024-02-26  1076  	DEFINE_WAIT_FUNC(wait, woken_wake_function);
295654f7e554a9 Imre Deak 2024-02-26  1077  	long timeout;
295654f7e554a9 Imre Deak 2024-02-26  1078  	int err;
295654f7e554a9 Imre Deak 2024-02-26  1079  
295654f7e554a9 Imre Deak 2024-02-26  1080  	if (bw < 0) {
295654f7e554a9 Imre Deak 2024-02-26  1081  		err = -EINVAL;
295654f7e554a9 Imre Deak 2024-02-26  1082  		goto out;
295654f7e554a9 Imre Deak 2024-02-26  1083  	}
295654f7e554a9 Imre Deak 2024-02-26  1084  
295654f7e554a9 Imre Deak 2024-02-26  1085  	if (request_bw * tunnel->bw_granularity == tunnel->allocated_bw)
295654f7e554a9 Imre Deak 2024-02-26  1086  		return 0;
295654f7e554a9 Imre Deak 2024-02-26  1087  
295654f7e554a9 Imre Deak 2024-02-26  1088  	/* Atomic check should prevent the following. */
295654f7e554a9 Imre Deak 2024-02-26  1089  	if (drm_WARN_ON(mgr->dev, request_bw > MAX_DP_REQUEST_BW)) {
295654f7e554a9 Imre Deak 2024-02-26  1090  		err = -EINVAL;
295654f7e554a9 Imre Deak 2024-02-26  1091  		goto out;
295654f7e554a9 Imre Deak 2024-02-26  1092  	}
295654f7e554a9 Imre Deak 2024-02-26  1093  
295654f7e554a9 Imre Deak 2024-02-26  1094  	err = clear_bw_req_state(tunnel->aux);
295654f7e554a9 Imre Deak 2024-02-26  1095  	if (err)
295654f7e554a9 Imre Deak 2024-02-26  1096  		goto out;
295654f7e554a9 Imre Deak 2024-02-26  1097  
295654f7e554a9 Imre Deak 2024-02-26  1098  	if (drm_dp_dpcd_writeb(tunnel->aux, DP_REQUEST_BW, request_bw) < 0) {
295654f7e554a9 Imre Deak 2024-02-26  1099  		err = -EIO;
295654f7e554a9 Imre Deak 2024-02-26  1100  		goto out;
295654f7e554a9 Imre Deak 2024-02-26  1101  	}
295654f7e554a9 Imre Deak 2024-02-26  1102  
295654f7e554a9 Imre Deak 2024-02-26  1103  	timeout = msecs_to_jiffies(3000);
295654f7e554a9 Imre Deak 2024-02-26  1104  	add_wait_queue(&mgr->bw_req_queue, &wait);
295654f7e554a9 Imre Deak 2024-02-26  1105  
295654f7e554a9 Imre Deak 2024-02-26  1106  	for (;;) {
295654f7e554a9 Imre Deak 2024-02-26  1107  		bool status_changed;
295654f7e554a9 Imre Deak 2024-02-26  1108  
295654f7e554a9 Imre Deak 2024-02-26  1109  		err = bw_req_complete(tunnel->aux, &status_changed);
295654f7e554a9 Imre Deak 2024-02-26  1110  		if (err != -EAGAIN)
295654f7e554a9 Imre Deak 2024-02-26  1111  			break;
295654f7e554a9 Imre Deak 2024-02-26  1112  
295654f7e554a9 Imre Deak 2024-02-26  1113  		if (status_changed) {
295654f7e554a9 Imre Deak 2024-02-26  1114  			struct drm_dp_tunnel_regs regs;
295654f7e554a9 Imre Deak 2024-02-26  1115  
295654f7e554a9 Imre Deak 2024-02-26  1116  			err = read_and_verify_tunnel_regs(tunnel, &regs,
295654f7e554a9 Imre Deak 2024-02-26  1117  							  ALLOW_ALLOCATED_BW_CHANGE);
295654f7e554a9 Imre Deak 2024-02-26  1118  			if (err)
295654f7e554a9 Imre Deak 2024-02-26  1119  				break;
295654f7e554a9 Imre Deak 2024-02-26  1120  		}
295654f7e554a9 Imre Deak 2024-02-26  1121  
295654f7e554a9 Imre Deak 2024-02-26  1122  		if (!timeout) {
295654f7e554a9 Imre Deak 2024-02-26  1123  			err = -ETIMEDOUT;
295654f7e554a9 Imre Deak 2024-02-26  1124  			break;
295654f7e554a9 Imre Deak 2024-02-26  1125  		}
295654f7e554a9 Imre Deak 2024-02-26  1126  
295654f7e554a9 Imre Deak 2024-02-26  1127  		timeout = wait_woken(&wait, TASK_UNINTERRUPTIBLE, timeout);
295654f7e554a9 Imre Deak 2024-02-26 @1128  	};
295654f7e554a9 Imre Deak 2024-02-26  1129  
295654f7e554a9 Imre Deak 2024-02-26  1130  	remove_wait_queue(&mgr->bw_req_queue, &wait);
295654f7e554a9 Imre Deak 2024-02-26  1131  
295654f7e554a9 Imre Deak 2024-02-26  1132  	if (err)
295654f7e554a9 Imre Deak 2024-02-26  1133  		goto out;
295654f7e554a9 Imre Deak 2024-02-26  1134  
295654f7e554a9 Imre Deak 2024-02-26  1135  	tunnel->allocated_bw = request_bw * tunnel->bw_granularity;
295654f7e554a9 Imre Deak 2024-02-26  1136  
295654f7e554a9 Imre Deak 2024-02-26  1137  out:
295654f7e554a9 Imre Deak 2024-02-26  1138  	tun_dbg_stat(tunnel, err, "Allocating %d/%d Mb/s for tunnel: Group alloc:%d/%d Mb/s",
295654f7e554a9 Imre Deak 2024-02-26  1139  		     DPTUN_BW_ARG(request_bw * tunnel->bw_granularity),
295654f7e554a9 Imre Deak 2024-02-26  1140  		     DPTUN_BW_ARG(get_max_tunnel_bw(tunnel)),
295654f7e554a9 Imre Deak 2024-02-26  1141  		     DPTUN_BW_ARG(group_allocated_bw(tunnel->group)),
295654f7e554a9 Imre Deak 2024-02-26  1142  		     DPTUN_BW_ARG(tunnel->group->available_bw));
295654f7e554a9 Imre Deak 2024-02-26  1143  
295654f7e554a9 Imre Deak 2024-02-26  1144  	if (err == -EIO)
295654f7e554a9 Imre Deak 2024-02-26  1145  		drm_dp_tunnel_set_io_error(tunnel);
295654f7e554a9 Imre Deak 2024-02-26  1146  
295654f7e554a9 Imre Deak 2024-02-26  1147  	return err;
295654f7e554a9 Imre Deak 2024-02-26  1148  }
295654f7e554a9 Imre Deak 2024-02-26  1149  
295654f7e554a9 Imre Deak 2024-02-26  1150  /**
295654f7e554a9 Imre Deak 2024-02-26  1151   * drm_dp_tunnel_alloc_bw - Allocate BW for a DP tunnel
295654f7e554a9 Imre Deak 2024-02-26  1152   * @tunnel: Tunnel object
295654f7e554a9 Imre Deak 2024-02-26  1153   * @bw: BW in kB/s units
295654f7e554a9 Imre Deak 2024-02-26  1154   *
295654f7e554a9 Imre Deak 2024-02-26  1155   * Allocate @bw kB/s for @tunnel. The allocated BW must be freed after use by
295654f7e554a9 Imre Deak 2024-02-26  1156   * calling this function for the same tunnel setting @bw to 0.
295654f7e554a9 Imre Deak 2024-02-26  1157   *
295654f7e554a9 Imre Deak 2024-02-26  1158   * Returns 0 in case of success, a negative error code otherwise.
295654f7e554a9 Imre Deak 2024-02-26  1159   */
295654f7e554a9 Imre Deak 2024-02-26  1160  int drm_dp_tunnel_alloc_bw(struct drm_dp_tunnel *tunnel, int bw)
295654f7e554a9 Imre Deak 2024-02-26  1161  {
295654f7e554a9 Imre Deak 2024-02-26  1162  	int err;
295654f7e554a9 Imre Deak 2024-02-26  1163  
295654f7e554a9 Imre Deak 2024-02-26  1164  	err = check_tunnel(tunnel);
295654f7e554a9 Imre Deak 2024-02-26  1165  	if (err)
295654f7e554a9 Imre Deak 2024-02-26  1166  		return err;
295654f7e554a9 Imre Deak 2024-02-26  1167  
295654f7e554a9 Imre Deak 2024-02-26  1168  	return allocate_tunnel_bw(tunnel, bw);
295654f7e554a9 Imre Deak 2024-02-26  1169  }
295654f7e554a9 Imre Deak 2024-02-26  1170  EXPORT_SYMBOL(drm_dp_tunnel_alloc_bw);
295654f7e554a9 Imre Deak 2024-02-26  1171  
295654f7e554a9 Imre Deak 2024-02-26  1172  /**
295654f7e554a9 Imre Deak 2024-02-26  1173   * drm_dp_tunnel_atomic_get_allocated_bw - Get the BW allocated for a DP tunnel
295654f7e554a9 Imre Deak 2024-02-26  1174   * @tunnel: Tunnel object
295654f7e554a9 Imre Deak 2024-02-26  1175   *
295654f7e554a9 Imre Deak 2024-02-26  1176   * Get the current BW allocated for @tunnel. After the tunnel is created /
295654f7e554a9 Imre Deak 2024-02-26  1177   * resumed and the BW allocation mode is enabled for it, the allocation
295654f7e554a9 Imre Deak 2024-02-26  1178   * becomes determined only after the first allocation request by the driver
295654f7e554a9 Imre Deak 2024-02-26  1179   * calling drm_dp_tunnel_alloc_bw().
295654f7e554a9 Imre Deak 2024-02-26  1180   *
295654f7e554a9 Imre Deak 2024-02-26  1181   * Return the BW allocated for the tunnel, or -1 if the allocation is
295654f7e554a9 Imre Deak 2024-02-26  1182   * undetermined.
295654f7e554a9 Imre Deak 2024-02-26  1183   */
295654f7e554a9 Imre Deak 2024-02-26  1184  int drm_dp_tunnel_get_allocated_bw(struct drm_dp_tunnel *tunnel)
295654f7e554a9 Imre Deak 2024-02-26  1185  {
295654f7e554a9 Imre Deak 2024-02-26  1186  	return tunnel->allocated_bw;
295654f7e554a9 Imre Deak 2024-02-26  1187  }
295654f7e554a9 Imre Deak 2024-02-26  1188  EXPORT_SYMBOL(drm_dp_tunnel_get_allocated_bw);
295654f7e554a9 Imre Deak 2024-02-26  1189  
295654f7e554a9 Imre Deak 2024-02-26  1190  /*
295654f7e554a9 Imre Deak 2024-02-26  1191   * Return 0 if the status hasn't changed, 1 if the status has changed, a
295654f7e554a9 Imre Deak 2024-02-26  1192   * negative error code in case of an I/O failure.
295654f7e554a9 Imre Deak 2024-02-26  1193   */
295654f7e554a9 Imre Deak 2024-02-26  1194  static int check_and_clear_status_change(struct drm_dp_tunnel *tunnel)
295654f7e554a9 Imre Deak 2024-02-26  1195  {
295654f7e554a9 Imre Deak 2024-02-26  1196  	u8 mask = DP_BW_ALLOCATION_CAPABILITY_CHANGED | DP_ESTIMATED_BW_CHANGED;
295654f7e554a9 Imre Deak 2024-02-26  1197  	u8 val;
295654f7e554a9 Imre Deak 2024-02-26  1198  
295654f7e554a9 Imre Deak 2024-02-26  1199  	if (drm_dp_dpcd_readb(tunnel->aux, DP_TUNNELING_STATUS, &val) < 0)
295654f7e554a9 Imre Deak 2024-02-26  1200  		goto out_err;
295654f7e554a9 Imre Deak 2024-02-26  1201  
295654f7e554a9 Imre Deak 2024-02-26  1202  	val &= mask;
295654f7e554a9 Imre Deak 2024-02-26  1203  
295654f7e554a9 Imre Deak 2024-02-26  1204  	if (val) {
295654f7e554a9 Imre Deak 2024-02-26  1205  		if (drm_dp_dpcd_writeb(tunnel->aux, DP_TUNNELING_STATUS, val) < 0)
295654f7e554a9 Imre Deak 2024-02-26  1206  			goto out_err;
295654f7e554a9 Imre Deak 2024-02-26  1207  
295654f7e554a9 Imre Deak 2024-02-26  1208  		return 1;
295654f7e554a9 Imre Deak 2024-02-26  1209  	}
295654f7e554a9 Imre Deak 2024-02-26  1210  
295654f7e554a9 Imre Deak 2024-02-26  1211  	if (!drm_dp_tunnel_bw_alloc_is_enabled(tunnel))
295654f7e554a9 Imre Deak 2024-02-26  1212  		return 0;
295654f7e554a9 Imre Deak 2024-02-26  1213  
295654f7e554a9 Imre Deak 2024-02-26  1214  	/*
295654f7e554a9 Imre Deak 2024-02-26  1215  	 * Check for estimated BW changes explicitly to account for lost
295654f7e554a9 Imre Deak 2024-02-26  1216  	 * BW change notifications.
295654f7e554a9 Imre Deak 2024-02-26  1217  	 */
295654f7e554a9 Imre Deak 2024-02-26  1218  	if (drm_dp_dpcd_readb(tunnel->aux, DP_ESTIMATED_BW, &val) < 0)
295654f7e554a9 Imre Deak 2024-02-26  1219  		goto out_err;
295654f7e554a9 Imre Deak 2024-02-26  1220  
295654f7e554a9 Imre Deak 2024-02-26  1221  	if (val * tunnel->bw_granularity != tunnel->estimated_bw)
295654f7e554a9 Imre Deak 2024-02-26  1222  		return 1;
295654f7e554a9 Imre Deak 2024-02-26  1223  
295654f7e554a9 Imre Deak 2024-02-26  1224  	return 0;
295654f7e554a9 Imre Deak 2024-02-26  1225  
295654f7e554a9 Imre Deak 2024-02-26  1226  out_err:
295654f7e554a9 Imre Deak 2024-02-26  1227  	drm_dp_tunnel_set_io_error(tunnel);
295654f7e554a9 Imre Deak 2024-02-26  1228  
295654f7e554a9 Imre Deak 2024-02-26  1229  	return -EIO;
295654f7e554a9 Imre Deak 2024-02-26  1230  }
295654f7e554a9 Imre Deak 2024-02-26  1231  
295654f7e554a9 Imre Deak 2024-02-26  1232  /**
295654f7e554a9 Imre Deak 2024-02-26  1233   * drm_dp_tunnel_update_state - Update DP tunnel SW state with the HW state
295654f7e554a9 Imre Deak 2024-02-26  1234   * @tunnel: Tunnel object
295654f7e554a9 Imre Deak 2024-02-26  1235   *
295654f7e554a9 Imre Deak 2024-02-26  1236   * Update the SW state of @tunnel with the HW state.
295654f7e554a9 Imre Deak 2024-02-26  1237   *
295654f7e554a9 Imre Deak 2024-02-26  1238   * Returns 0 if the state has not changed, 1 if it has changed and got updated
295654f7e554a9 Imre Deak 2024-02-26  1239   * successfully and a negative error code otherwise.
295654f7e554a9 Imre Deak 2024-02-26  1240   */
295654f7e554a9 Imre Deak 2024-02-26  1241  int drm_dp_tunnel_update_state(struct drm_dp_tunnel *tunnel)
295654f7e554a9 Imre Deak 2024-02-26  1242  {
295654f7e554a9 Imre Deak 2024-02-26  1243  	struct drm_dp_tunnel_regs regs;
295654f7e554a9 Imre Deak 2024-02-26  1244  	bool changed = false;
295654f7e554a9 Imre Deak 2024-02-26  1245  	int ret;
295654f7e554a9 Imre Deak 2024-02-26  1246  
295654f7e554a9 Imre Deak 2024-02-26  1247  	ret = check_tunnel(tunnel);
295654f7e554a9 Imre Deak 2024-02-26  1248  	if (ret < 0)
295654f7e554a9 Imre Deak 2024-02-26  1249  		return ret;
295654f7e554a9 Imre Deak 2024-02-26  1250  
295654f7e554a9 Imre Deak 2024-02-26  1251  	ret = check_and_clear_status_change(tunnel);
295654f7e554a9 Imre Deak 2024-02-26  1252  	if (ret < 0)
295654f7e554a9 Imre Deak 2024-02-26  1253  		goto out;
295654f7e554a9 Imre Deak 2024-02-26  1254  
295654f7e554a9 Imre Deak 2024-02-26  1255  	if (!ret)
295654f7e554a9 Imre Deak 2024-02-26  1256  		return 0;
295654f7e554a9 Imre Deak 2024-02-26  1257  
295654f7e554a9 Imre Deak 2024-02-26  1258  	ret = read_and_verify_tunnel_regs(tunnel, &regs, 0);
295654f7e554a9 Imre Deak 2024-02-26  1259  	if (ret)
295654f7e554a9 Imre Deak 2024-02-26  1260  		goto out;
295654f7e554a9 Imre Deak 2024-02-26  1261  
295654f7e554a9 Imre Deak 2024-02-26  1262  	if (update_dprx_caps(tunnel, &regs))
295654f7e554a9 Imre Deak 2024-02-26  1263  		changed = true;
295654f7e554a9 Imre Deak 2024-02-26  1264  
295654f7e554a9 Imre Deak 2024-02-26  1265  	ret = update_group_available_bw(tunnel, &regs);
295654f7e554a9 Imre Deak 2024-02-26  1266  	if (ret == 1)
295654f7e554a9 Imre Deak 2024-02-26  1267  		changed = true;
295654f7e554a9 Imre Deak 2024-02-26  1268  
295654f7e554a9 Imre Deak 2024-02-26  1269  out:
295654f7e554a9 Imre Deak 2024-02-26 @1270  	tun_dbg_stat(tunnel, ret < 0 ? ret : 0,
295654f7e554a9 Imre Deak 2024-02-26  1271  		     "State update: Changed:%s DPRX:%dx%d Tunnel alloc:%d/%d Group alloc:%d/%d Mb/s",
295654f7e554a9 Imre Deak 2024-02-26  1272  		     str_yes_no(changed),
295654f7e554a9 Imre Deak 2024-02-26  1273  		     tunnel->max_dprx_rate / 100, tunnel->max_dprx_lane_count,
295654f7e554a9 Imre Deak 2024-02-26  1274  		     DPTUN_BW_ARG(tunnel->allocated_bw),
295654f7e554a9 Imre Deak 2024-02-26  1275  		     DPTUN_BW_ARG(get_max_tunnel_bw(tunnel)),
295654f7e554a9 Imre Deak 2024-02-26  1276  		     DPTUN_BW_ARG(group_allocated_bw(tunnel->group)),
295654f7e554a9 Imre Deak 2024-02-26  1277  		     DPTUN_BW_ARG(tunnel->group->available_bw));
295654f7e554a9 Imre Deak 2024-02-26  1278  
295654f7e554a9 Imre Deak 2024-02-26  1279  	if (ret < 0)
295654f7e554a9 Imre Deak 2024-02-26  1280  		return ret;
295654f7e554a9 Imre Deak 2024-02-26  1281  
295654f7e554a9 Imre Deak 2024-02-26  1282  	if (changed)
295654f7e554a9 Imre Deak 2024-02-26  1283  		return 1;
295654f7e554a9 Imre Deak 2024-02-26  1284  
295654f7e554a9 Imre Deak 2024-02-26  1285  	return 0;
295654f7e554a9 Imre Deak 2024-02-26  1286  }
295654f7e554a9 Imre Deak 2024-02-26  1287  EXPORT_SYMBOL(drm_dp_tunnel_update_state);
295654f7e554a9 Imre Deak 2024-02-26  1288  

:::::: The code at line 1270 was first introduced by commit
:::::: 295654f7e554a9f089bdab0b2bb9a9aad7c402c0 drm/dp: Add support for DP tunneling

:::::: TO: Imre Deak <imre.deak@intel.com>
:::::: CC: Imre Deak <imre.deak@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
