Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5439B2E1726
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Dec 2025 19:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764877595; cv=none; b=V25Ad6m/H1URf/yCw1B3F1NIAfPXYwrhVsEtYpY3SjFiLGmh3VJyToZjgIxphUVj1Le3qUbT3tYFM1Aw14KmOC0Qs3Li9WXBERkxU0FNRSkCglZn1WsaBqSh65HWhl2lmyrpdsoayhc9hI4a/O/hZfgq2rQLg5ahJYYox2sfLfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764877595; c=relaxed/simple;
	bh=EBdbNLtotYFGQaJi1GkHjog3M7BmxGwDCkhRfj1LaBw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dBWCz+vPdhvjSKrimT/t+sW0NA/05GZH6tlBtICrQIBCXkvqBsPQ9Tseygrte0nRJ/VTI1a70Md1DbR20NaJ0g/7Gpnn7ujrZLzONYPtUusDpYH2vMi4WaWf5uiUoRrUJXkUO/t+urhx/KVfEzwheTcplJu90CtPb3g8QAWz2KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jl4pRWBm; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jl4pRWBm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764877593; x=1796413593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EBdbNLtotYFGQaJi1GkHjog3M7BmxGwDCkhRfj1LaBw=;
  b=jl4pRWBm6IvTu/EqcZq+6v7aLeICHX3MYVM2UeIkVoZv+o8lTJw+i2o4
   Mw7e47uJivSIkHsbFqgp9bak2GFL5GvK5dPv8xodCiuhHH+V2AQ5r6CeC
   hsy2CPXrVleToufipC7ffrwRtLn96OdfY0DJDN99YwG/UURAOoNcUFIht
   +2rCv7CuMdn2PZ9GleVHUFf6qKVBbadfujIIL3cO+9+B6pJYOXRYll64u
   02Q7ZIprIIjwBpk2Af6suqlls7yrKwenRmWv2ZnLH87jLztOmxYsKhNro
   sIVWNc3iMOuoA14LT1VEj6aGrkh1ga8vKPly3d0QK3YTHksUdztwDK4bZ
   A==;
X-CSE-ConnectionGUID: o9AiDWdFTZGA7iZx/35byg==
X-CSE-MsgGUID: wWE3j3qFRZCUXS2rMAbcGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66842513"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="66842513"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 11:46:31 -0800
X-CSE-ConnectionGUID: aJrJQ9nhToaeao5zBwXNiQ==
X-CSE-MsgGUID: kr96ei0uRwyCjehGRE9TMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="232405643"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Dec 2025 11:46:29 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRFHW-00000000E8q-45gP;
	Thu, 04 Dec 2025 19:46:26 +0000
Date: Fri, 5 Dec 2025 03:45:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tnguy-next-queue:dev-queue 41/61]
 drivers/net/ethernet/intel/idpf/idpf_ethtool.c:252 idpf_add_flow_steer()
 warn: missing error code 'err'
Message-ID: <202512050309.Jd0nVLZj-lkp@intel.com>
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
CC: Tony Nguyen <anthony.l.nguyen@intel.com>
CC: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
CC: Larysa Zaremba <larysa.zaremba@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   b8ceeacaba537294e383161a87e09b939ecd7d1d
commit: f017eeeb027274f63af4d541a315235abf2bc5e9 [41/61] idpf: refactor idpf to use libie control queues
:::::: branch date: 20 hours ago
:::::: commit date: 26 hours ago
config: s390-randconfig-r072-20251204 (https://download.01.org/0day-ci/archive/20251205/202512050309.Jd0nVLZj-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512050309.Jd0nVLZj-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/intel/idpf/idpf_ethtool.c:252 idpf_add_flow_steer() warn: missing error code 'err'

vim +/err +252 drivers/net/ethernet/intel/idpf/idpf_ethtool.c

ada3e24b84a097 Ahmed Zaki            2025-04-23  156  
ada3e24b84a097 Ahmed Zaki            2025-04-23  157  /**
ada3e24b84a097 Ahmed Zaki            2025-04-23  158   * idpf_add_flow_steer - add a Flow Steering filter
ada3e24b84a097 Ahmed Zaki            2025-04-23  159   * @netdev: network interface device structure
ada3e24b84a097 Ahmed Zaki            2025-04-23  160   * @cmd: command to add Flow Steering filter
ada3e24b84a097 Ahmed Zaki            2025-04-23  161   *
ada3e24b84a097 Ahmed Zaki            2025-04-23  162   * Return: 0 on success and negative values for failure
ada3e24b84a097 Ahmed Zaki            2025-04-23  163   */
ada3e24b84a097 Ahmed Zaki            2025-04-23  164  static int idpf_add_flow_steer(struct net_device *netdev,
ada3e24b84a097 Ahmed Zaki            2025-04-23  165  			       struct ethtool_rxnfc *cmd)
ada3e24b84a097 Ahmed Zaki            2025-04-23  166  {
ada3e24b84a097 Ahmed Zaki            2025-04-23  167  	struct idpf_fsteer_fltr *fltr, *parent = NULL, *f;
ada3e24b84a097 Ahmed Zaki            2025-04-23  168  	struct idpf_netdev_priv *np = netdev_priv(netdev);
ada3e24b84a097 Ahmed Zaki            2025-04-23  169  	struct idpf_vport_user_config_data *user_config;
ada3e24b84a097 Ahmed Zaki            2025-04-23  170  	struct ethtool_rx_flow_spec *fsp = &cmd->fs;
ada3e24b84a097 Ahmed Zaki            2025-04-23  171  	struct virtchnl2_flow_rule_add_del *rule;
ada3e24b84a097 Ahmed Zaki            2025-04-23  172  	struct idpf_vport_config *vport_config;
ada3e24b84a097 Ahmed Zaki            2025-04-23  173  	struct virtchnl2_rule_action_set *acts;
ada3e24b84a097 Ahmed Zaki            2025-04-23  174  	struct virtchnl2_flow_rule_info *info;
ada3e24b84a097 Ahmed Zaki            2025-04-23  175  	struct virtchnl2_proto_hdrs *hdrs;
ada3e24b84a097 Ahmed Zaki            2025-04-23  176  	struct idpf_vport *vport;
ada3e24b84a097 Ahmed Zaki            2025-04-23  177  	u32 flow_type, q_index;
ada3e24b84a097 Ahmed Zaki            2025-04-23  178  	u16 num_rxq;
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  179  	int err = 0;
ada3e24b84a097 Ahmed Zaki            2025-04-23  180  
ada3e24b84a097 Ahmed Zaki            2025-04-23  181  	vport = idpf_netdev_to_vport(netdev);
ada3e24b84a097 Ahmed Zaki            2025-04-23  182  	vport_config = vport->adapter->vport_config[np->vport_idx];
ada3e24b84a097 Ahmed Zaki            2025-04-23  183  	user_config = &vport_config->user_config;
ada3e24b84a097 Ahmed Zaki            2025-04-23  184  	num_rxq = user_config->num_req_rx_qs;
ada3e24b84a097 Ahmed Zaki            2025-04-23  185  
ada3e24b84a097 Ahmed Zaki            2025-04-23  186  	flow_type = fsp->flow_type & ~(FLOW_EXT | FLOW_MAC_EXT | FLOW_RSS);
ada3e24b84a097 Ahmed Zaki            2025-04-23  187  	if (flow_type != fsp->flow_type)
ada3e24b84a097 Ahmed Zaki            2025-04-23  188  		return -EINVAL;
ada3e24b84a097 Ahmed Zaki            2025-04-23  189  
ada3e24b84a097 Ahmed Zaki            2025-04-23  190  	if (!idpf_sideband_action_ena(vport, fsp) ||
ada3e24b84a097 Ahmed Zaki            2025-04-23  191  	    !idpf_sideband_flow_type_ena(vport, flow_type))
ada3e24b84a097 Ahmed Zaki            2025-04-23  192  		return -EOPNOTSUPP;
ada3e24b84a097 Ahmed Zaki            2025-04-23  193  
ada3e24b84a097 Ahmed Zaki            2025-04-23  194  	if (user_config->num_fsteer_fltrs > idpf_fsteer_max_rules(vport))
ada3e24b84a097 Ahmed Zaki            2025-04-23  195  		return -ENOSPC;
ada3e24b84a097 Ahmed Zaki            2025-04-23  196  
ada3e24b84a097 Ahmed Zaki            2025-04-23  197  	q_index = fsp->ring_cookie;
ada3e24b84a097 Ahmed Zaki            2025-04-23  198  	if (q_index >= num_rxq)
ada3e24b84a097 Ahmed Zaki            2025-04-23  199  		return -EINVAL;
ada3e24b84a097 Ahmed Zaki            2025-04-23  200  
ada3e24b84a097 Ahmed Zaki            2025-04-23  201  	rule = kzalloc(struct_size(rule, rule_info, 1), GFP_KERNEL);
ada3e24b84a097 Ahmed Zaki            2025-04-23  202  	if (!rule)
ada3e24b84a097 Ahmed Zaki            2025-04-23  203  		return -ENOMEM;
ada3e24b84a097 Ahmed Zaki            2025-04-23  204  
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  205  	fltr = kzalloc(sizeof(*fltr), GFP_KERNEL);
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  206  	if (!fltr) {
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  207  		err = -ENOMEM;
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  208  		goto out_free_rule;
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  209  	}
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  210  
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  211  	/* detect duplicate entry and reject before adding rules */
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  212  	spin_lock_bh(&vport_config->flow_steer_list_lock);
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  213  	list_for_each_entry(f, &user_config->flow_steer_list, list) {
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  214  		if (f->fs.location == fsp->location) {
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  215  			err = -EEXIST;
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  216  			break;
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  217  		}
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  218  
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  219  		if (f->fs.location > fsp->location)
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  220  			break;
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  221  		parent = f;
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  222  	}
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  223  	spin_unlock_bh(&vport_config->flow_steer_list_lock);
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  224  
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  225  	if (err)
f017eeeb027274 Pavan Kumar Linga     2025-11-17  226  		goto out_free_fltr;
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  227  
ada3e24b84a097 Ahmed Zaki            2025-04-23  228  	rule->vport_id = cpu_to_le32(vport->vport_id);
ada3e24b84a097 Ahmed Zaki            2025-04-23  229  	rule->count = cpu_to_le32(1);
ada3e24b84a097 Ahmed Zaki            2025-04-23  230  	info = &rule->rule_info[0];
ada3e24b84a097 Ahmed Zaki            2025-04-23  231  	info->rule_id = cpu_to_le32(fsp->location);
ada3e24b84a097 Ahmed Zaki            2025-04-23  232  
ada3e24b84a097 Ahmed Zaki            2025-04-23  233  	hdrs = &info->rule_cfg.proto_hdrs;
ada3e24b84a097 Ahmed Zaki            2025-04-23  234  	hdrs->tunnel_level = 0;
ada3e24b84a097 Ahmed Zaki            2025-04-23  235  	hdrs->count = cpu_to_le32(2);
ada3e24b84a097 Ahmed Zaki            2025-04-23  236  
ada3e24b84a097 Ahmed Zaki            2025-04-23  237  	acts = &info->rule_cfg.action_set;
ada3e24b84a097 Ahmed Zaki            2025-04-23  238  	acts->count = cpu_to_le32(1);
ada3e24b84a097 Ahmed Zaki            2025-04-23  239  	acts->actions[0].action_type = cpu_to_le32(VIRTCHNL2_ACTION_QUEUE);
ada3e24b84a097 Ahmed Zaki            2025-04-23  240  	acts->actions[0].act_conf.q_id = cpu_to_le32(q_index);
ada3e24b84a097 Ahmed Zaki            2025-04-23  241  
ada3e24b84a097 Ahmed Zaki            2025-04-23  242  	switch (flow_type) {
ada3e24b84a097 Ahmed Zaki            2025-04-23  243  	case UDP_V4_FLOW:
ada3e24b84a097 Ahmed Zaki            2025-04-23  244  		idpf_fsteer_fill_ipv4(hdrs, fsp);
ada3e24b84a097 Ahmed Zaki            2025-04-23  245  		idpf_fsteer_fill_udp(hdrs, fsp, true);
ada3e24b84a097 Ahmed Zaki            2025-04-23  246  		break;
ada3e24b84a097 Ahmed Zaki            2025-04-23  247  	case TCP_V4_FLOW:
ada3e24b84a097 Ahmed Zaki            2025-04-23  248  		idpf_fsteer_fill_ipv4(hdrs, fsp);
ada3e24b84a097 Ahmed Zaki            2025-04-23  249  		idpf_fsteer_fill_tcp(hdrs, fsp, true);
ada3e24b84a097 Ahmed Zaki            2025-04-23  250  		break;
02cbfba1add5bd Alan Brady            2023-08-07  251  	default:
f017eeeb027274 Pavan Kumar Linga     2025-11-17 @252  		goto out_free_fltr;
ada3e24b84a097 Ahmed Zaki            2025-04-23  253  	}
ada3e24b84a097 Ahmed Zaki            2025-04-23  254  
ada3e24b84a097 Ahmed Zaki            2025-04-23  255  	err = idpf_add_del_fsteer_filters(vport->adapter, rule,
ada3e24b84a097 Ahmed Zaki            2025-04-23  256  					  VIRTCHNL2_OP_ADD_FLOW_RULE);
f017eeeb027274 Pavan Kumar Linga     2025-11-17  257  	if (err || info->status != cpu_to_le32(VIRTCHNL2_FLOW_RULE_SUCCESS)) {
f017eeeb027274 Pavan Kumar Linga     2025-11-17  258  		/* virtchnl2 rule is already consumed */
f017eeeb027274 Pavan Kumar Linga     2025-11-17  259  		kfree(fltr);
f017eeeb027274 Pavan Kumar Linga     2025-11-17  260  		return err;
ada3e24b84a097 Ahmed Zaki            2025-04-23  261  	}
ada3e24b84a097 Ahmed Zaki            2025-04-23  262  
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  263  	/* Save a copy of the user's flow spec so ethtool can later retrieve it */
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  264  	fltr->fs = *fsp;
ada3e24b84a097 Ahmed Zaki            2025-04-23  265  
61022f50353bc8 Sreedevi Joshi        2025-09-30  266  	spin_lock_bh(&vport_config->flow_steer_list_lock);
ada3e24b84a097 Ahmed Zaki            2025-04-23  267  	parent ? list_add(&fltr->list, &parent->list) :
ada3e24b84a097 Ahmed Zaki            2025-04-23  268  		 list_add(&fltr->list, &user_config->flow_steer_list);
ada3e24b84a097 Ahmed Zaki            2025-04-23  269  
ada3e24b84a097 Ahmed Zaki            2025-04-23  270  	user_config->num_fsteer_fltrs++;
61022f50353bc8 Sreedevi Joshi        2025-09-30  271  	spin_unlock_bh(&vport_config->flow_steer_list_lock);
02cbfba1add5bd Alan Brady            2023-08-07  272  
f017eeeb027274 Pavan Kumar Linga     2025-11-17  273  	return 0;
f017eeeb027274 Pavan Kumar Linga     2025-11-17  274  
f017eeeb027274 Pavan Kumar Linga     2025-11-17  275  out_free_fltr:
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  276  	kfree(fltr);
f19069e5da487f Erik Gabriel Carrillo 2025-09-30  277  out_free_rule:
ada3e24b84a097 Ahmed Zaki            2025-04-23  278  	kfree(rule);
ada3e24b84a097 Ahmed Zaki            2025-04-23  279  	return err;
ada3e24b84a097 Ahmed Zaki            2025-04-23  280  }
ada3e24b84a097 Ahmed Zaki            2025-04-23  281  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
