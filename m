Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1D74D9F9D
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Oct 2026 18:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791224143; cv=none; b=VDVn7og27dVidqDBy3sTay889mavC5zwKl5KrEWEYAGHt+J/79GD2au9UiuygqWRKQiucMIrReTMxJYdOtm21FyueYAV3R0uCpt959yMDGy8G6uoyxjPqGgDarNIlVhNzZY2oywX3a4H0x8/RmjKgfuQOI6hwVS99OuA5r/hxko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791224143; c=relaxed/simple;
	bh=Pf28TdwJzj36yK8WFk0uzhezD0s4SaDWGRQGgiQ7+E8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dhIYVVEUizJ6uuomJJcQ3rH/TOm1vsHwdlHnwQfRUQ89emS77mDnbNO65PiNvQNEvV0bga9TL8q/Mudlg75QIpu/+QJB3DQk89BUtbBcVWXZh3Hs/3x4y+9oDvYWY4HQ/0J1I5HZvoKybdX4oD9PI8/npTwMGrgHQxXhtopEr64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HRpsmT8L; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HRpsmT8L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791224139; x=1822760139;
  h=date:from:to:cc:subject:message-id;
  bh=Pf28TdwJzj36yK8WFk0uzhezD0s4SaDWGRQGgiQ7+E8=;
  b=HRpsmT8LVYzqR3boSXXR7/ax5dkA/taHqU60iVrerh6FAXExsdihrJ72
   fw5MOVk0YyEEPuUN/AwN8itzzdLkoWnB9k+qtLhyxlIm72L3lVkC+LHfr
   YO3Ga681z121kh04IngwkM6XdYq1PQ6zi9gKE3X+V6VhqtTNyxisSEEb6
   JIk5BOU3cdYV4ux9UpD9NtK8c4WLHnOqAkbQWHQC8YMTUu9Cpa76u6I3V
   L3rTjUhCPTZ/c1FCe5f1cMv4R+C+Tk04j3bkb9mksmszz0RC9W03ndrUW
   orV9EErlzeEwlhH7MjF6Tav6W/ILSMhFAmd6IW/sy4VkGAxdEMrmIzmY9
   g==;
X-CSE-ConnectionGUID: 9+i0tpyvSXmtzDMUJ2DG6Q==
X-CSE-MsgGUID: /TbadTBcQa2HIGmNWARosQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="53730"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="53730"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:15:37 -0700
X-CSE-ConnectionGUID: w8IT2NEEQOGrkhM8ZzMCZw==
X-CSE-MsgGUID: U/i/U09/RW+imfra1rJDuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="274680871"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 05 Oct 2026 11:15:36 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDnDp-000000000FT-2DFM;
	Mon, 05 Oct 2026 18:15:33 +0000
Date: Mon, 05 Oct 2026 20:14:58 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/dsa/motorcomm/tc.c:677
 yt921x_acl_rule_ext_parse_flow_entries() warn: missing unwind goto?
Message-ID: <202610052038.COZDXgYv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Yang <mmyangfl@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/David-Yang/net-dsa-motorcomm-Hoist-type-casting-helper-into-chip-h/20261002-044844
head:   1e2e08a7a9e93cec9030484583b19e0e0401524c
commit: afdf8e0e7687234d925fb2b2a41b08a6d5cf5a5e net: dsa: motorcomm: Split TC module
date:   4 days ago
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: alpha-randconfig-r2200-20261005 (https://download.01.org/0day-ci/archive/20261005/202610052038.COZDXgYv-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610052038.COZDXgYv-lkp@intel.com/

smatch warnings:
drivers/net/dsa/motorcomm/tc.c:677 yt921x_acl_rule_ext_parse_flow_entries() warn: missing unwind goto?

vim +677 drivers/net/dsa/motorcomm/tc.c

afdf8e0e7687234 David Yang 2026-10-02  551  
afdf8e0e7687234 David Yang 2026-10-02  552  static int
afdf8e0e7687234 David Yang 2026-10-02  553  yt921x_acl_rule_ext_parse_flow_entries(struct yt921x_acl_rule_ext *ruleext,
afdf8e0e7687234 David Yang 2026-10-02  554  				       const struct flow_cls_offload *cls)
afdf8e0e7687234 David Yang 2026-10-02  555  {
afdf8e0e7687234 David Yang 2026-10-02  556  	const struct flow_rule *rule = flow_cls_offload_flow_rule(cls);
afdf8e0e7687234 David Yang 2026-10-02  557  	struct yt921x_acl_entry *entries = ruleext->r.entries;
afdf8e0e7687234 David Yang 2026-10-02  558  	struct netlink_ext_ack *extack = cls->common.extack;
afdf8e0e7687234 David Yang 2026-10-02  559  	const struct flow_dissector *dissector;
afdf8e0e7687234 David Yang 2026-10-02  560  	struct yt921x_acl_entry *entry;
afdf8e0e7687234 David Yang 2026-10-02  561  	unsigned int size = 0;
afdf8e0e7687234 David Yang 2026-10-02  562  	bool use_dport;
afdf8e0e7687234 David Yang 2026-10-02  563  	bool use_sport;
afdf8e0e7687234 David Yang 2026-10-02  564  
afdf8e0e7687234 David Yang 2026-10-02  565  	/* Incomplete and probably won't, since it supports custom u32 filters.
afdf8e0e7687234 David Yang 2026-10-02  566  	 * New adapters are welcome.
afdf8e0e7687234 David Yang 2026-10-02  567  	 */
afdf8e0e7687234 David Yang 2026-10-02  568  	dissector = rule->match.dissector;
afdf8e0e7687234 David Yang 2026-10-02  569  	if (dissector->used_keys &
afdf8e0e7687234 David Yang 2026-10-02  570  	    ~(BIT_ULL(FLOW_DISSECTOR_KEY_CONTROL) |
afdf8e0e7687234 David Yang 2026-10-02  571  	      BIT_ULL(FLOW_DISSECTOR_KEY_BASIC) |
afdf8e0e7687234 David Yang 2026-10-02  572  	      BIT_ULL(FLOW_DISSECTOR_KEY_IPV4_ADDRS) |
afdf8e0e7687234 David Yang 2026-10-02  573  	      BIT_ULL(FLOW_DISSECTOR_KEY_IPV6_ADDRS) |
afdf8e0e7687234 David Yang 2026-10-02  574  	      BIT_ULL(FLOW_DISSECTOR_KEY_PORTS) |
afdf8e0e7687234 David Yang 2026-10-02  575  	      BIT_ULL(FLOW_DISSECTOR_KEY_PORTS_RANGE) |
afdf8e0e7687234 David Yang 2026-10-02  576  	      BIT_ULL(FLOW_DISSECTOR_KEY_ETH_ADDRS) |
afdf8e0e7687234 David Yang 2026-10-02  577  	      BIT_ULL(FLOW_DISSECTOR_KEY_IP) |
afdf8e0e7687234 David Yang 2026-10-02  578  	      BIT_ULL(FLOW_DISSECTOR_KEY_TCP))) {
afdf8e0e7687234 David Yang 2026-10-02  579  		NL_SET_ERR_MSG_MOD(extack, "Unsupported keys used");
afdf8e0e7687234 David Yang 2026-10-02  580  		return -EOPNOTSUPP;
afdf8e0e7687234 David Yang 2026-10-02  581  	}
afdf8e0e7687234 David Yang 2026-10-02  582  
afdf8e0e7687234 David Yang 2026-10-02  583  	/* Entries */
afdf8e0e7687234 David Yang 2026-10-02  584  	if (flow_rule_match_key(rule, FLOW_DISSECTOR_KEY_IPV4_ADDRS)) {
afdf8e0e7687234 David Yang 2026-10-02  585  		struct flow_match_ipv4_addrs match;
afdf8e0e7687234 David Yang 2026-10-02  586  
afdf8e0e7687234 David Yang 2026-10-02  587  		flow_rule_match_ipv4_addrs(rule, &match);
afdf8e0e7687234 David Yang 2026-10-02  588  
afdf8e0e7687234 David Yang 2026-10-02  589  		if (match.mask->dst) {
afdf8e0e7687234 David Yang 2026-10-02  590  			entry = yt921x_acl_entries_new(entries, &size,
afdf8e0e7687234 David Yang 2026-10-02  591  						       YT921X_ACL_TYPE_IPV4_DA);
afdf8e0e7687234 David Yang 2026-10-02  592  			if (!entry)
afdf8e0e7687234 David Yang 2026-10-02  593  				goto err;
afdf8e0e7687234 David Yang 2026-10-02  594  
afdf8e0e7687234 David Yang 2026-10-02  595  			entry->key[0] |= ntohl(match.key->dst);
afdf8e0e7687234 David Yang 2026-10-02  596  			entry->mask[0] |= ntohl(match.mask->dst);
afdf8e0e7687234 David Yang 2026-10-02  597  		}
afdf8e0e7687234 David Yang 2026-10-02  598  
afdf8e0e7687234 David Yang 2026-10-02  599  		if (match.mask->src) {
afdf8e0e7687234 David Yang 2026-10-02  600  			entry = yt921x_acl_entries_new(entries, &size,
afdf8e0e7687234 David Yang 2026-10-02  601  						       YT921X_ACL_TYPE_IPV4_SA);
afdf8e0e7687234 David Yang 2026-10-02  602  			if (!entry)
afdf8e0e7687234 David Yang 2026-10-02  603  				goto err;
afdf8e0e7687234 David Yang 2026-10-02  604  
afdf8e0e7687234 David Yang 2026-10-02  605  			entry->key[0] |= ntohl(match.key->src);
afdf8e0e7687234 David Yang 2026-10-02  606  			entry->mask[0] |= ntohl(match.mask->src);
afdf8e0e7687234 David Yang 2026-10-02  607  		}
afdf8e0e7687234 David Yang 2026-10-02  608  	}
afdf8e0e7687234 David Yang 2026-10-02  609  
afdf8e0e7687234 David Yang 2026-10-02  610  	if (flow_rule_match_key(rule, FLOW_DISSECTOR_KEY_IPV6_ADDRS)) {
afdf8e0e7687234 David Yang 2026-10-02  611  		struct flow_match_ipv6_addrs match;
afdf8e0e7687234 David Yang 2026-10-02  612  
afdf8e0e7687234 David Yang 2026-10-02  613  		flow_rule_match_ipv6_addrs(rule, &match);
afdf8e0e7687234 David Yang 2026-10-02  614  
afdf8e0e7687234 David Yang 2026-10-02  615  		for (unsigned int i = 0; i < 4; i++) {
afdf8e0e7687234 David Yang 2026-10-02  616  			if (!match.mask->dst.s6_addr32[i])
afdf8e0e7687234 David Yang 2026-10-02  617  				continue;
afdf8e0e7687234 David Yang 2026-10-02  618  
afdf8e0e7687234 David Yang 2026-10-02  619  			entry = yt921x_acl_entries_new(entries, &size,
afdf8e0e7687234 David Yang 2026-10-02  620  						       YT921X_ACL_TYPE_IPV6_DA0 + i);
afdf8e0e7687234 David Yang 2026-10-02  621  			if (!entry)
afdf8e0e7687234 David Yang 2026-10-02  622  				goto err;
afdf8e0e7687234 David Yang 2026-10-02  623  
afdf8e0e7687234 David Yang 2026-10-02  624  			entry->key[0] |= ntohl(match.key->dst.s6_addr32[i]);
afdf8e0e7687234 David Yang 2026-10-02  625  			entry->mask[0] |= ntohl(match.mask->dst.s6_addr32[i]);
afdf8e0e7687234 David Yang 2026-10-02  626  		}
afdf8e0e7687234 David Yang 2026-10-02  627  
afdf8e0e7687234 David Yang 2026-10-02  628  		for (unsigned int i = 0; i < 4; i++) {
afdf8e0e7687234 David Yang 2026-10-02  629  			if (!match.mask->src.s6_addr32[i])
afdf8e0e7687234 David Yang 2026-10-02  630  				continue;
afdf8e0e7687234 David Yang 2026-10-02  631  
afdf8e0e7687234 David Yang 2026-10-02  632  			entry = yt921x_acl_entries_new(entries, &size,
afdf8e0e7687234 David Yang 2026-10-02  633  						       YT921X_ACL_TYPE_IPV6_SA0 + i);
afdf8e0e7687234 David Yang 2026-10-02  634  			if (!entry)
afdf8e0e7687234 David Yang 2026-10-02  635  				goto err;
afdf8e0e7687234 David Yang 2026-10-02  636  
afdf8e0e7687234 David Yang 2026-10-02  637  			entry->key[0] |= ntohl(match.key->src.s6_addr32[i]);
afdf8e0e7687234 David Yang 2026-10-02  638  			entry->mask[0] |= ntohl(match.mask->src.s6_addr32[i]);
afdf8e0e7687234 David Yang 2026-10-02  639  		}
afdf8e0e7687234 David Yang 2026-10-02  640  	}
afdf8e0e7687234 David Yang 2026-10-02  641  
afdf8e0e7687234 David Yang 2026-10-02  642  	use_dport = false;
afdf8e0e7687234 David Yang 2026-10-02  643  	use_sport = false;
afdf8e0e7687234 David Yang 2026-10-02  644  	if (flow_rule_match_key(rule, FLOW_DISSECTOR_KEY_PORTS)) {
afdf8e0e7687234 David Yang 2026-10-02  645  		struct flow_match_ports match;
afdf8e0e7687234 David Yang 2026-10-02  646  
afdf8e0e7687234 David Yang 2026-10-02  647  		entry = yt921x_acl_entries_new(entries, &size,
afdf8e0e7687234 David Yang 2026-10-02  648  					       YT921X_ACL_TYPE_L4);
afdf8e0e7687234 David Yang 2026-10-02  649  		if (!entry)
afdf8e0e7687234 David Yang 2026-10-02  650  			goto err;
afdf8e0e7687234 David Yang 2026-10-02  651  
afdf8e0e7687234 David Yang 2026-10-02  652  		flow_rule_match_ports(rule, &match);
afdf8e0e7687234 David Yang 2026-10-02  653  
afdf8e0e7687234 David Yang 2026-10-02  654  		use_dport = !!match.mask->dst;
afdf8e0e7687234 David Yang 2026-10-02  655  		use_sport = !!match.mask->src;
afdf8e0e7687234 David Yang 2026-10-02  656  
afdf8e0e7687234 David Yang 2026-10-02  657  		entry->key[0] |= (ntohs(match.key->dst) << 16) |
afdf8e0e7687234 David Yang 2026-10-02  658  				 ntohs(match.key->src);
afdf8e0e7687234 David Yang 2026-10-02  659  		entry->mask[0] |= (ntohs(match.mask->dst) << 16) |
afdf8e0e7687234 David Yang 2026-10-02  660  				  ntohs(match.mask->src);
afdf8e0e7687234 David Yang 2026-10-02  661  	}
afdf8e0e7687234 David Yang 2026-10-02  662  
afdf8e0e7687234 David Yang 2026-10-02  663  	if (flow_rule_match_key(rule, FLOW_DISSECTOR_KEY_PORTS_RANGE)) {
afdf8e0e7687234 David Yang 2026-10-02  664  		struct flow_match_ports_range match;
afdf8e0e7687234 David Yang 2026-10-02  665  
afdf8e0e7687234 David Yang 2026-10-02  666  		entry = yt921x_acl_entries_find(entries, &size,
afdf8e0e7687234 David Yang 2026-10-02  667  						YT921X_ACL_TYPE_L4);
afdf8e0e7687234 David Yang 2026-10-02  668  		if (!entry)
afdf8e0e7687234 David Yang 2026-10-02  669  			goto err;
afdf8e0e7687234 David Yang 2026-10-02  670  
afdf8e0e7687234 David Yang 2026-10-02  671  		flow_rule_match_ports_range(rule, &match);
afdf8e0e7687234 David Yang 2026-10-02  672  
afdf8e0e7687234 David Yang 2026-10-02  673  		if ((use_dport && match.mask->tp.dst) ||
afdf8e0e7687234 David Yang 2026-10-02  674  		    (use_sport && match.mask->tp.src)) {
afdf8e0e7687234 David Yang 2026-10-02  675  			NL_SET_ERR_MSG_MOD(extack,
afdf8e0e7687234 David Yang 2026-10-02  676  					   "Port mask and range are mutually exclusive");
afdf8e0e7687234 David Yang 2026-10-02 @677  			return -EINVAL;
afdf8e0e7687234 David Yang 2026-10-02  678  		}
afdf8e0e7687234 David Yang 2026-10-02  679  
afdf8e0e7687234 David Yang 2026-10-02  680  		if (match.mask->tp.dst) {
afdf8e0e7687234 David Yang 2026-10-02  681  			entry->key[0] |= ntohs(match.key->tp_min.dst) << 16;
afdf8e0e7687234 David Yang 2026-10-02  682  			entry->key[1] |= YT921X_ACL_KEYb_L4_DPORT_RANGE_EN;
afdf8e0e7687234 David Yang 2026-10-02  683  			entry->mask[0] |= ntohs(match.key->tp_max.dst) << 16;
afdf8e0e7687234 David Yang 2026-10-02  684  		}
afdf8e0e7687234 David Yang 2026-10-02  685  
afdf8e0e7687234 David Yang 2026-10-02  686  		if (match.mask->tp.src) {
afdf8e0e7687234 David Yang 2026-10-02  687  			entry->key[0] |= ntohs(match.key->tp_min.src);
afdf8e0e7687234 David Yang 2026-10-02  688  			entry->key[1] |= YT921X_ACL_KEYb_L4_SPORT_RANGE_EN;
afdf8e0e7687234 David Yang 2026-10-02  689  			entry->mask[0] |= ntohs(match.key->tp_max.src);
afdf8e0e7687234 David Yang 2026-10-02  690  		}
afdf8e0e7687234 David Yang 2026-10-02  691  	}
afdf8e0e7687234 David Yang 2026-10-02  692  
afdf8e0e7687234 David Yang 2026-10-02  693  	if (flow_rule_match_key(rule, FLOW_DISSECTOR_KEY_ETH_ADDRS)) {
afdf8e0e7687234 David Yang 2026-10-02  694  		struct flow_match_eth_addrs match;
afdf8e0e7687234 David Yang 2026-10-02  695  		u32 mask;
afdf8e0e7687234 David Yang 2026-10-02  696  
afdf8e0e7687234 David Yang 2026-10-02  697  		flow_rule_match_eth_addrs(rule, &match);
afdf8e0e7687234 David Yang 2026-10-02  698  
afdf8e0e7687234 David Yang 2026-10-02  699  		mask = ethaddr_hi4_to_u32(match.mask->dst);
afdf8e0e7687234 David Yang 2026-10-02  700  		if (mask) {
afdf8e0e7687234 David Yang 2026-10-02  701  			entry = yt921x_acl_entries_new(entries, &size,
afdf8e0e7687234 David Yang 2026-10-02  702  						       YT921X_ACL_TYPE_MAC_DA0);
afdf8e0e7687234 David Yang 2026-10-02  703  			if (!entry)
afdf8e0e7687234 David Yang 2026-10-02  704  				goto err;
afdf8e0e7687234 David Yang 2026-10-02  705  
afdf8e0e7687234 David Yang 2026-10-02  706  			entry->key[0] |= ethaddr_hi4_to_u32(match.key->dst);
afdf8e0e7687234 David Yang 2026-10-02  707  			entry->mask[0] |= mask;
afdf8e0e7687234 David Yang 2026-10-02  708  		}
afdf8e0e7687234 David Yang 2026-10-02  709  
afdf8e0e7687234 David Yang 2026-10-02  710  		mask = ethaddr_hi4_to_u32(match.mask->src);
afdf8e0e7687234 David Yang 2026-10-02  711  		if (mask) {
afdf8e0e7687234 David Yang 2026-10-02  712  			entry = yt921x_acl_entries_new(entries, &size,
afdf8e0e7687234 David Yang 2026-10-02  713  						       YT921X_ACL_TYPE_MAC_SA0);
afdf8e0e7687234 David Yang 2026-10-02  714  			if (!entry)
afdf8e0e7687234 David Yang 2026-10-02  715  				goto err;
afdf8e0e7687234 David Yang 2026-10-02  716  
afdf8e0e7687234 David Yang 2026-10-02  717  			entry->key[0] |= ethaddr_hi4_to_u32(match.key->src);
afdf8e0e7687234 David Yang 2026-10-02  718  			entry->mask[0] |= mask;
afdf8e0e7687234 David Yang 2026-10-02  719  		}
afdf8e0e7687234 David Yang 2026-10-02  720  
afdf8e0e7687234 David Yang 2026-10-02  721  		mask = (ethaddr_lo2_to_u32(match.mask->dst) << 16) |
afdf8e0e7687234 David Yang 2026-10-02  722  		       ethaddr_lo2_to_u32(match.mask->src);
afdf8e0e7687234 David Yang 2026-10-02  723  		if (mask) {
afdf8e0e7687234 David Yang 2026-10-02  724  			entry = yt921x_acl_entries_new(entries, &size,
afdf8e0e7687234 David Yang 2026-10-02  725  						       YT921X_ACL_TYPE_MAC_DA1_SA1);
afdf8e0e7687234 David Yang 2026-10-02  726  			if (!entry)
afdf8e0e7687234 David Yang 2026-10-02  727  				goto err;
afdf8e0e7687234 David Yang 2026-10-02  728  
afdf8e0e7687234 David Yang 2026-10-02  729  			entry->key[0] |= (ethaddr_lo2_to_u32(match.key->dst) << 16) |
afdf8e0e7687234 David Yang 2026-10-02  730  					 ethaddr_lo2_to_u32(match.key->src);
afdf8e0e7687234 David Yang 2026-10-02  731  			entry->mask[0] |= mask;
afdf8e0e7687234 David Yang 2026-10-02  732  		}
afdf8e0e7687234 David Yang 2026-10-02  733  	}
afdf8e0e7687234 David Yang 2026-10-02  734  
afdf8e0e7687234 David Yang 2026-10-02  735  	/* Entries + Misc */
afdf8e0e7687234 David Yang 2026-10-02  736  	if (flow_rule_match_key(rule, FLOW_DISSECTOR_KEY_BASIC)) {
afdf8e0e7687234 David Yang 2026-10-02  737  		struct flow_match_basic match;
afdf8e0e7687234 David Yang 2026-10-02  738  
afdf8e0e7687234 David Yang 2026-10-02  739  		flow_rule_match_basic(rule, &match);
afdf8e0e7687234 David Yang 2026-10-02  740  
afdf8e0e7687234 David Yang 2026-10-02  741  		if (match.mask->n_proto) {
afdf8e0e7687234 David Yang 2026-10-02  742  			enum yt921x_l3_type l3type = YT921X_L3_TYPE_OTHER;
afdf8e0e7687234 David Yang 2026-10-02  743  
afdf8e0e7687234 David Yang 2026-10-02  744  			if (match.mask->n_proto == htons(~0))
afdf8e0e7687234 David Yang 2026-10-02  745  				switch (match.key->n_proto) {
afdf8e0e7687234 David Yang 2026-10-02  746  				case htons(ETH_P_IP):
afdf8e0e7687234 David Yang 2026-10-02  747  					l3type = YT921X_L3_TYPE_IPV4;
afdf8e0e7687234 David Yang 2026-10-02  748  					break;
afdf8e0e7687234 David Yang 2026-10-02  749  				case htons(ETH_P_IPV6):
afdf8e0e7687234 David Yang 2026-10-02  750  					l3type = YT921X_L3_TYPE_IPV6;
afdf8e0e7687234 David Yang 2026-10-02  751  					break;
afdf8e0e7687234 David Yang 2026-10-02  752  				case htons(ETH_P_ARP):
afdf8e0e7687234 David Yang 2026-10-02  753  					l3type = YT921X_L3_TYPE_ARP;
afdf8e0e7687234 David Yang 2026-10-02  754  					break;
afdf8e0e7687234 David Yang 2026-10-02  755  				case htons(ETH_P_LLDP):
afdf8e0e7687234 David Yang 2026-10-02  756  					l3type = YT921X_L3_TYPE_LLDP;
afdf8e0e7687234 David Yang 2026-10-02  757  					break;
afdf8e0e7687234 David Yang 2026-10-02  758  				case htons(ETH_P_PAE):
afdf8e0e7687234 David Yang 2026-10-02  759  					l3type = YT921X_L3_TYPE_PAE;
afdf8e0e7687234 David Yang 2026-10-02  760  					break;
afdf8e0e7687234 David Yang 2026-10-02  761  				case htons(ETH_P_CFM):
afdf8e0e7687234 David Yang 2026-10-02  762  					l3type = YT921X_L3_TYPE_ERP;
afdf8e0e7687234 David Yang 2026-10-02  763  					break;
afdf8e0e7687234 David Yang 2026-10-02  764  				}
afdf8e0e7687234 David Yang 2026-10-02  765  
afdf8e0e7687234 David Yang 2026-10-02  766  			if (l3type != YT921X_L3_TYPE_OTHER) {
afdf8e0e7687234 David Yang 2026-10-02  767  				size = yt921x_acl_entries_set_l3_type(entries,
afdf8e0e7687234 David Yang 2026-10-02  768  								      size,
afdf8e0e7687234 David Yang 2026-10-02  769  								      l3type);
afdf8e0e7687234 David Yang 2026-10-02  770  				if (!size)
afdf8e0e7687234 David Yang 2026-10-02  771  					goto err;
afdf8e0e7687234 David Yang 2026-10-02  772  			} else {
afdf8e0e7687234 David Yang 2026-10-02  773  				entry = yt921x_acl_entries_new(entries, &size,
afdf8e0e7687234 David Yang 2026-10-02  774  							       YT921X_ACL_TYPE_ETHERTYPE);
afdf8e0e7687234 David Yang 2026-10-02  775  				if (!entry)
afdf8e0e7687234 David Yang 2026-10-02  776  					goto err;
afdf8e0e7687234 David Yang 2026-10-02  777  
afdf8e0e7687234 David Yang 2026-10-02  778  				entry->key[0] |= ntohs(match.key->n_proto);
afdf8e0e7687234 David Yang 2026-10-02  779  				entry->mask[0] |= ntohs(match.mask->n_proto);
afdf8e0e7687234 David Yang 2026-10-02  780  			}
afdf8e0e7687234 David Yang 2026-10-02  781  		}
afdf8e0e7687234 David Yang 2026-10-02  782  
afdf8e0e7687234 David Yang 2026-10-02  783  		if (match.mask->ip_proto) {
afdf8e0e7687234 David Yang 2026-10-02  784  			enum yt921x_l4_type l4type = YT921X_L4_TYPE_OTHER;
afdf8e0e7687234 David Yang 2026-10-02  785  
afdf8e0e7687234 David Yang 2026-10-02  786  			if (match.mask->ip_proto == (u8)~0)
afdf8e0e7687234 David Yang 2026-10-02  787  				switch (match.key->ip_proto) {
afdf8e0e7687234 David Yang 2026-10-02  788  				case IPPROTO_TCP:
afdf8e0e7687234 David Yang 2026-10-02  789  					l4type = YT921X_L4_TYPE_TCP;
afdf8e0e7687234 David Yang 2026-10-02  790  					break;
afdf8e0e7687234 David Yang 2026-10-02  791  				case IPPROTO_UDP:
afdf8e0e7687234 David Yang 2026-10-02  792  					l4type = YT921X_L4_TYPE_UDP;
afdf8e0e7687234 David Yang 2026-10-02  793  					break;
afdf8e0e7687234 David Yang 2026-10-02  794  				case IPPROTO_UDPLITE:
afdf8e0e7687234 David Yang 2026-10-02  795  					l4type = YT921X_L4_TYPE_UDPLITE;
afdf8e0e7687234 David Yang 2026-10-02  796  					break;
afdf8e0e7687234 David Yang 2026-10-02  797  				case IPPROTO_ICMP:
afdf8e0e7687234 David Yang 2026-10-02  798  					l4type = YT921X_L4_TYPE_ICMP;
afdf8e0e7687234 David Yang 2026-10-02  799  					break;
afdf8e0e7687234 David Yang 2026-10-02  800  				case IPPROTO_IGMP:
afdf8e0e7687234 David Yang 2026-10-02  801  					l4type = YT921X_L4_TYPE_IGMP;
afdf8e0e7687234 David Yang 2026-10-02  802  					break;
afdf8e0e7687234 David Yang 2026-10-02  803  				}
afdf8e0e7687234 David Yang 2026-10-02  804  
afdf8e0e7687234 David Yang 2026-10-02  805  			if (l4type != YT921X_L4_TYPE_OTHER) {
afdf8e0e7687234 David Yang 2026-10-02  806  				size = yt921x_acl_entries_set_l4_type(entries,
afdf8e0e7687234 David Yang 2026-10-02  807  								      size,
afdf8e0e7687234 David Yang 2026-10-02  808  								      l4type);
afdf8e0e7687234 David Yang 2026-10-02  809  				if (!size)
afdf8e0e7687234 David Yang 2026-10-02  810  					goto err;
afdf8e0e7687234 David Yang 2026-10-02  811  			} else {
afdf8e0e7687234 David Yang 2026-10-02  812  				entry = yt921x_acl_entries_find(entries, &size,
afdf8e0e7687234 David Yang 2026-10-02  813  								YT921X_ACL_TYPE_MISC);
afdf8e0e7687234 David Yang 2026-10-02  814  				if (!entry)
afdf8e0e7687234 David Yang 2026-10-02  815  					goto err;
afdf8e0e7687234 David Yang 2026-10-02  816  
afdf8e0e7687234 David Yang 2026-10-02  817  				entry->key[0] |= YT921X_ACL_BINa_MISC_IP_PROTO(match.key->ip_proto);
afdf8e0e7687234 David Yang 2026-10-02  818  				entry->mask[0] |= YT921X_ACL_BINa_MISC_IP_PROTO(match.mask->ip_proto);
afdf8e0e7687234 David Yang 2026-10-02  819  			}
afdf8e0e7687234 David Yang 2026-10-02  820  		}
afdf8e0e7687234 David Yang 2026-10-02  821  	}
afdf8e0e7687234 David Yang 2026-10-02  822  
afdf8e0e7687234 David Yang 2026-10-02  823  	if (flow_rule_match_key(rule, FLOW_DISSECTOR_KEY_CONTROL)) {
afdf8e0e7687234 David Yang 2026-10-02  824  		u32 supp_flags = FLOW_DIS_IS_FRAGMENT | FLOW_DIS_FIRST_FRAG;
afdf8e0e7687234 David Yang 2026-10-02  825  		struct flow_match_control match;
afdf8e0e7687234 David Yang 2026-10-02  826  
afdf8e0e7687234 David Yang 2026-10-02  827  		flow_rule_match_control(rule, &match);
afdf8e0e7687234 David Yang 2026-10-02  828  		if (!flow_rule_is_supp_control_flags(supp_flags,
afdf8e0e7687234 David Yang 2026-10-02  829  						     match.mask->flags, extack))
afdf8e0e7687234 David Yang 2026-10-02  830  			return -EOPNOTSUPP;
afdf8e0e7687234 David Yang 2026-10-02  831  
afdf8e0e7687234 David Yang 2026-10-02  832  		if (match.mask->flags & FLOW_DIS_IS_FRAGMENT) {
afdf8e0e7687234 David Yang 2026-10-02  833  			bool set = match.key->flags & FLOW_DIS_IS_FRAGMENT;
afdf8e0e7687234 David Yang 2026-10-02  834  
afdf8e0e7687234 David Yang 2026-10-02  835  			size = yt921x_acl_entries_set_is_fragment(entries, size,
afdf8e0e7687234 David Yang 2026-10-02  836  								  set);
afdf8e0e7687234 David Yang 2026-10-02  837  			if (!size)
afdf8e0e7687234 David Yang 2026-10-02  838  				goto err;
afdf8e0e7687234 David Yang 2026-10-02  839  		}
afdf8e0e7687234 David Yang 2026-10-02  840  		if (match.mask->flags & FLOW_DIS_FIRST_FRAG) {
afdf8e0e7687234 David Yang 2026-10-02  841  			bool set = match.key->flags & FLOW_DIS_FIRST_FRAG;
afdf8e0e7687234 David Yang 2026-10-02  842  
afdf8e0e7687234 David Yang 2026-10-02  843  			size = yt921x_acl_entries_set_first_frag(entries, size,
afdf8e0e7687234 David Yang 2026-10-02  844  								 set);
afdf8e0e7687234 David Yang 2026-10-02  845  			if (!size)
afdf8e0e7687234 David Yang 2026-10-02  846  				goto err;
afdf8e0e7687234 David Yang 2026-10-02  847  		}
afdf8e0e7687234 David Yang 2026-10-02  848  	}
afdf8e0e7687234 David Yang 2026-10-02  849  
afdf8e0e7687234 David Yang 2026-10-02  850  	/* Misc only */
afdf8e0e7687234 David Yang 2026-10-02  851  	if (flow_rule_match_key(rule, FLOW_DISSECTOR_KEY_IP)) {
afdf8e0e7687234 David Yang 2026-10-02  852  		struct flow_match_ip match;
afdf8e0e7687234 David Yang 2026-10-02  853  
afdf8e0e7687234 David Yang 2026-10-02  854  		flow_rule_match_ip(rule, &match);
afdf8e0e7687234 David Yang 2026-10-02  855  		if (match.mask->ttl) {
afdf8e0e7687234 David Yang 2026-10-02  856  			NL_SET_ERR_MSG_MOD(extack,
afdf8e0e7687234 David Yang 2026-10-02  857  					   "Matching on TTL not supported");
afdf8e0e7687234 David Yang 2026-10-02  858  			return -EOPNOTSUPP;
afdf8e0e7687234 David Yang 2026-10-02  859  		}
afdf8e0e7687234 David Yang 2026-10-02  860  
afdf8e0e7687234 David Yang 2026-10-02  861  		if (match.mask->tos) {
afdf8e0e7687234 David Yang 2026-10-02  862  			entry = yt921x_acl_entries_find(entries, &size,
afdf8e0e7687234 David Yang 2026-10-02  863  							YT921X_ACL_TYPE_MISC);
afdf8e0e7687234 David Yang 2026-10-02  864  			if (!entry)
afdf8e0e7687234 David Yang 2026-10-02  865  				goto err;
afdf8e0e7687234 David Yang 2026-10-02  866  
afdf8e0e7687234 David Yang 2026-10-02  867  			entry->key[0] |= YT921X_ACL_BINa_MISC_TOS(match.key->tos);
afdf8e0e7687234 David Yang 2026-10-02  868  			entry->mask[0] |= YT921X_ACL_BINa_MISC_TOS(match.mask->tos);
afdf8e0e7687234 David Yang 2026-10-02  869  		}
afdf8e0e7687234 David Yang 2026-10-02  870  	}
afdf8e0e7687234 David Yang 2026-10-02  871  
afdf8e0e7687234 David Yang 2026-10-02  872  	if (flow_rule_match_key(rule, FLOW_DISSECTOR_KEY_TCP)) {
afdf8e0e7687234 David Yang 2026-10-02  873  		struct flow_match_tcp match;
afdf8e0e7687234 David Yang 2026-10-02  874  
afdf8e0e7687234 David Yang 2026-10-02  875  		flow_rule_match_tcp(rule, &match);
afdf8e0e7687234 David Yang 2026-10-02  876  		if (match.mask->flags & htons(~0xff)) {
afdf8e0e7687234 David Yang 2026-10-02  877  			NL_SET_ERR_MSG_MOD(extack, "Unsupported TCP flags");
afdf8e0e7687234 David Yang 2026-10-02  878  			return -EOPNOTSUPP;
afdf8e0e7687234 David Yang 2026-10-02  879  		}
afdf8e0e7687234 David Yang 2026-10-02  880  
afdf8e0e7687234 David Yang 2026-10-02  881  		if (match.mask->flags) {
afdf8e0e7687234 David Yang 2026-10-02  882  			entry = yt921x_acl_entries_find(entries, &size,
afdf8e0e7687234 David Yang 2026-10-02  883  							YT921X_ACL_TYPE_MISC);
afdf8e0e7687234 David Yang 2026-10-02  884  			if (!entry)
afdf8e0e7687234 David Yang 2026-10-02  885  				goto err;
afdf8e0e7687234 David Yang 2026-10-02  886  
afdf8e0e7687234 David Yang 2026-10-02  887  			entry->key[0] |= YT921X_ACL_BINa_MISC_TCP_FLAGS(ntohs(match.key->flags));
afdf8e0e7687234 David Yang 2026-10-02  888  			entry->mask[0] |= YT921X_ACL_BINa_MISC_TCP_FLAGS(ntohs(match.mask->flags));
afdf8e0e7687234 David Yang 2026-10-02  889  		}
afdf8e0e7687234 David Yang 2026-10-02  890  	}
afdf8e0e7687234 David Yang 2026-10-02  891  
afdf8e0e7687234 David Yang 2026-10-02  892  	if (!size) {
afdf8e0e7687234 David Yang 2026-10-02  893  		NL_SET_ERR_MSG_MOD(extack, "Empty rule generated, this should not happen");
afdf8e0e7687234 David Yang 2026-10-02  894  		return -EOPNOTSUPP;
afdf8e0e7687234 David Yang 2026-10-02  895  	}
afdf8e0e7687234 David Yang 2026-10-02  896  
afdf8e0e7687234 David Yang 2026-10-02  897  	ruleext->r.mask = (1 << size) - 1;
afdf8e0e7687234 David Yang 2026-10-02  898  	return 0;
afdf8e0e7687234 David Yang 2026-10-02  899  
afdf8e0e7687234 David Yang 2026-10-02  900  err:
afdf8e0e7687234 David Yang 2026-10-02  901  	NL_SET_ERR_MSG_MOD(extack, "Rule too complex");
afdf8e0e7687234 David Yang 2026-10-02  902  	return -EOPNOTSUPP;
afdf8e0e7687234 David Yang 2026-10-02  903  }
afdf8e0e7687234 David Yang 2026-10-02  904  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
