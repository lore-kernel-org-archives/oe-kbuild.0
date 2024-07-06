Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368C481E
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Jul 2024 20:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720297394; cv=none; b=kdJ05fLbtWbxK3AaKT1U746ZX4Yi88uioBGpBF6XgUgrTnZXPMpwYalx5RylSsDKZbifJhS0njFuyctL5ZZZsHUC9yl89Ch3Svs6Sl6ozdPDIy2aAsTTSCXdjEOds0LAPV30CTsUoWjhzJOeTQKiCeMSTNo03LRuJGvSGOF7rVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720297394; c=relaxed/simple;
	bh=izR6x3wjhG8PW+OYsxttO5+gsDbni9twZmJkifaV3h0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TS8KIwKmwMVfsMSL5Ygdcl6hULpE4JOdXrlhYzk4C26twsjLUmzwaAUH7ldrZqhtG528RJJO+ha8GMs52BluBhYNmTuDpyOu6iLzVJ8kJJcBhTDqz9k7XenVFqdljNOLruoKpCBPK/9aXyj6WOLRCp52pvwPgWLZ76UuVEWKrBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TtqY2rCh; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TtqY2rCh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720297392; x=1751833392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=izR6x3wjhG8PW+OYsxttO5+gsDbni9twZmJkifaV3h0=;
  b=TtqY2rCh+Jo6JefsC8NgMh+nNYqXLRPThE8CZDbLZnnntJgARDudA54O
   suXSw4kfda3kXM/3mI1Bgmvh/DbSgMJddKUZT2sg+qSO5xj/Xyo9+DqEK
   RLVygCn99UmPsQasQFikIAFt5iUkk8XNwdC78Z+Ex0kkCdiFxTbmdc2kS
   SS528gk9gKnwENhmcKnAepAyJDKJfGQRpgeKSzR+m7P1f2y+WWe/lNwAS
   Xqsy0dH6Y/savqpBmVTTAB0lgzVEouPiNhIP3bLTbu9TRIH8vG5hsaJCJ
   K1QuWcFgRNNMEoz5E+tG+UArh8bW8VHJrU7yYmbWRTcoCGiZquVhb0+Xe
   g==;
X-CSE-ConnectionGUID: xQNAurUsQyWOeeec7MkhuQ==
X-CSE-MsgGUID: t219lYmJQxS8FZ3NF2O32Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="21357405"
X-IronPort-AV: E=Sophos;i="6.09,188,1716274800"; 
   d="scan'208";a="21357405"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 13:23:12 -0700
X-CSE-ConnectionGUID: RV0Jw5PfQ0qeCrqT0pQaLw==
X-CSE-MsgGUID: iEgVVoh8QKqE2CQ7rC8l4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,188,1716274800"; 
   d="scan'208";a="51970836"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Jul 2024 13:23:11 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQBw4-000UEE-0j;
	Sat, 06 Jul 2024 20:23:08 +0000
Date: Sun, 7 Jul 2024 04:22:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tnguy-next-queue:dev-queue 12/92]
 drivers/net/ethernet/intel/ice/ice_virtchnl_fdir.c:875
 ice_vc_fdir_parse_raw() warn: missing error code 'status'
Message-ID: <202407070634.aTz9Naa1-lkp@intel.com>
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
CC: Intel Wired LAN <intel-wired-lan@lists.osuosl.org>
TO: Junfeng Guo <junfeng.guo@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>
CC: Marcin Szycik <marcin.szycik@linux.intel.com>
CC: Ahmed Zaki <ahmed.zaki@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   d051d5283b530af3f9627c8e600aa581bc6c1958
commit: 23eb6f4d18624231cd3f57f322814591f38b3837 [12/92] ice: enable FDIR filters from raw binary patterns for VFs
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20240706 (https://download.01.org/0day-ci/archive/20240707/202407070634.aTz9Naa1-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407070634.aTz9Naa1-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/intel/ice/ice_virtchnl_fdir.c:875 ice_vc_fdir_parse_raw() warn: missing error code 'status'

vim +/status +875 drivers/net/ethernet/intel/ice/ice_virtchnl_fdir.c

23eb6f4d186242 Junfeng Guo 2024-05-27  820  
23eb6f4d186242 Junfeng Guo 2024-05-27  821  /**
23eb6f4d186242 Junfeng Guo 2024-05-27  822   * ice_vc_fdir_parse_raw
23eb6f4d186242 Junfeng Guo 2024-05-27  823   * @vf: pointer to the VF info
23eb6f4d186242 Junfeng Guo 2024-05-27  824   * @proto: virtchnl protocol headers
23eb6f4d186242 Junfeng Guo 2024-05-27  825   * @conf: FDIR configuration for each filter
23eb6f4d186242 Junfeng Guo 2024-05-27  826   *
23eb6f4d186242 Junfeng Guo 2024-05-27  827   * Parse the virtual channel filter's raw flow and store it in @conf
23eb6f4d186242 Junfeng Guo 2024-05-27  828   *
23eb6f4d186242 Junfeng Guo 2024-05-27  829   * Return: 0 on success, and other on error.
23eb6f4d186242 Junfeng Guo 2024-05-27  830   */
23eb6f4d186242 Junfeng Guo 2024-05-27  831  static int
23eb6f4d186242 Junfeng Guo 2024-05-27  832  ice_vc_fdir_parse_raw(struct ice_vf *vf,
23eb6f4d186242 Junfeng Guo 2024-05-27  833  		      struct virtchnl_proto_hdrs *proto,
23eb6f4d186242 Junfeng Guo 2024-05-27  834  		      struct virtchnl_fdir_fltr_conf *conf)
23eb6f4d186242 Junfeng Guo 2024-05-27  835  {
23eb6f4d186242 Junfeng Guo 2024-05-27  836  	u8 *pkt_buf, *msk_buf __free(kfree);
23eb6f4d186242 Junfeng Guo 2024-05-27  837  	struct ice_parser_result rslt;
23eb6f4d186242 Junfeng Guo 2024-05-27  838  	struct ice_pf *pf = vf->pf;
23eb6f4d186242 Junfeng Guo 2024-05-27  839  	struct ice_parser *psr;
23eb6f4d186242 Junfeng Guo 2024-05-27  840  	int status = -ENOMEM;
23eb6f4d186242 Junfeng Guo 2024-05-27  841  	struct ice_hw *hw;
23eb6f4d186242 Junfeng Guo 2024-05-27  842  	u16 udp_port = 0;
23eb6f4d186242 Junfeng Guo 2024-05-27  843  
23eb6f4d186242 Junfeng Guo 2024-05-27  844  	pkt_buf = kzalloc(proto->raw.pkt_len, GFP_KERNEL);
23eb6f4d186242 Junfeng Guo 2024-05-27  845  	msk_buf = kzalloc(proto->raw.pkt_len, GFP_KERNEL);
23eb6f4d186242 Junfeng Guo 2024-05-27  846  	if (!pkt_buf || !msk_buf)
23eb6f4d186242 Junfeng Guo 2024-05-27  847  		goto err_mem_alloc;
23eb6f4d186242 Junfeng Guo 2024-05-27  848  
23eb6f4d186242 Junfeng Guo 2024-05-27  849  	memcpy(pkt_buf, proto->raw.spec, proto->raw.pkt_len);
23eb6f4d186242 Junfeng Guo 2024-05-27  850  	memcpy(msk_buf, proto->raw.mask, proto->raw.pkt_len);
23eb6f4d186242 Junfeng Guo 2024-05-27  851  
23eb6f4d186242 Junfeng Guo 2024-05-27  852  	hw = &pf->hw;
23eb6f4d186242 Junfeng Guo 2024-05-27  853  
23eb6f4d186242 Junfeng Guo 2024-05-27  854  	/* Get raw profile info via Parser Lib */
23eb6f4d186242 Junfeng Guo 2024-05-27  855  	psr = ice_parser_create(hw);
23eb6f4d186242 Junfeng Guo 2024-05-27  856  	if (IS_ERR(psr)) {
23eb6f4d186242 Junfeng Guo 2024-05-27  857  		status = PTR_ERR(psr);
23eb6f4d186242 Junfeng Guo 2024-05-27  858  		goto err_mem_alloc;
23eb6f4d186242 Junfeng Guo 2024-05-27  859  	}
23eb6f4d186242 Junfeng Guo 2024-05-27  860  
23eb6f4d186242 Junfeng Guo 2024-05-27  861  	ice_parser_dvm_set(psr, ice_is_dvm_ena(hw));
23eb6f4d186242 Junfeng Guo 2024-05-27  862  
23eb6f4d186242 Junfeng Guo 2024-05-27  863  	if (ice_get_open_tunnel_port(hw, &udp_port, TNL_VXLAN))
23eb6f4d186242 Junfeng Guo 2024-05-27  864  		ice_parser_vxlan_tunnel_set(psr, udp_port, true);
23eb6f4d186242 Junfeng Guo 2024-05-27  865  
23eb6f4d186242 Junfeng Guo 2024-05-27  866  	status = ice_parser_run(psr, pkt_buf, proto->raw.pkt_len, &rslt);
23eb6f4d186242 Junfeng Guo 2024-05-27  867  	if (status)
23eb6f4d186242 Junfeng Guo 2024-05-27  868  		goto err_parser_destroy;
23eb6f4d186242 Junfeng Guo 2024-05-27  869  
23eb6f4d186242 Junfeng Guo 2024-05-27  870  	if (hw->debug_mask & ICE_DBG_PARSER)
23eb6f4d186242 Junfeng Guo 2024-05-27  871  		ice_parser_result_dump(hw, &rslt);
23eb6f4d186242 Junfeng Guo 2024-05-27  872  
23eb6f4d186242 Junfeng Guo 2024-05-27  873  	conf->prof = kzalloc(sizeof(*conf->prof), GFP_KERNEL);
23eb6f4d186242 Junfeng Guo 2024-05-27  874  	if (!conf->prof)
23eb6f4d186242 Junfeng Guo 2024-05-27 @875  		goto err_parser_destroy;
23eb6f4d186242 Junfeng Guo 2024-05-27  876  
23eb6f4d186242 Junfeng Guo 2024-05-27  877  	status = ice_parser_profile_init(&rslt, pkt_buf, msk_buf,
23eb6f4d186242 Junfeng Guo 2024-05-27  878  					 proto->raw.pkt_len, ICE_BLK_FD,
23eb6f4d186242 Junfeng Guo 2024-05-27  879  					 conf->prof);
23eb6f4d186242 Junfeng Guo 2024-05-27  880  	if (status)
23eb6f4d186242 Junfeng Guo 2024-05-27  881  		goto err_parser_profile_init;
23eb6f4d186242 Junfeng Guo 2024-05-27  882  
23eb6f4d186242 Junfeng Guo 2024-05-27  883  	if (hw->debug_mask & ICE_DBG_PARSER)
23eb6f4d186242 Junfeng Guo 2024-05-27  884  		ice_parser_profile_dump(hw, conf->prof);
23eb6f4d186242 Junfeng Guo 2024-05-27  885  
23eb6f4d186242 Junfeng Guo 2024-05-27  886  	/* Store raw flow info into @conf */
23eb6f4d186242 Junfeng Guo 2024-05-27  887  	conf->pkt_len = proto->raw.pkt_len;
23eb6f4d186242 Junfeng Guo 2024-05-27  888  	conf->pkt_buf = pkt_buf;
23eb6f4d186242 Junfeng Guo 2024-05-27  889  	conf->parser_ena = true;
23eb6f4d186242 Junfeng Guo 2024-05-27  890  
23eb6f4d186242 Junfeng Guo 2024-05-27  891  	ice_parser_destroy(psr);
23eb6f4d186242 Junfeng Guo 2024-05-27  892  	return 0;
23eb6f4d186242 Junfeng Guo 2024-05-27  893  
23eb6f4d186242 Junfeng Guo 2024-05-27  894  err_parser_profile_init:
23eb6f4d186242 Junfeng Guo 2024-05-27  895  	kfree(conf->prof);
23eb6f4d186242 Junfeng Guo 2024-05-27  896  err_parser_destroy:
23eb6f4d186242 Junfeng Guo 2024-05-27  897  	ice_parser_destroy(psr);
23eb6f4d186242 Junfeng Guo 2024-05-27  898  err_mem_alloc:
23eb6f4d186242 Junfeng Guo 2024-05-27  899  	kfree(pkt_buf);
23eb6f4d186242 Junfeng Guo 2024-05-27  900  	return status;
23eb6f4d186242 Junfeng Guo 2024-05-27  901  }
23eb6f4d186242 Junfeng Guo 2024-05-27  902  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
