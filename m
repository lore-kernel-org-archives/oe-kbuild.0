Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57BB1E9B37
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Jun 2026 05:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781500278; cv=none; b=NY7CShJjXazYPsdkGctiYW8WYNfUZFTbMoi108X+CVsGawZvjvRxxZUPZCjyOniW9re1yjbaVJFwYl35JOuvmknVoIweaocQwZK4tTa5LhNka+ffJV09miGgF88svNjTz8Wkz3WpsvUj2ppKhWbjcWBZIn91l+dUGOV8nogpqD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781500278; c=relaxed/simple;
	bh=qP730tPihwPhWijuxSskW8gopGmdSXdlz4AwEVBdZDc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Wo7bIz6FFlsYpw6On3RJYy3dnpRU+S9wJ0oaLakifCPaEpIHKL+vPM8wGhn7mtUyujuAG+kzIwZi1cE3en7kBLzJ3qEmh3YOLJ7Ct54SKJFsnYbZsGTKZGnyVVGL2Z633np9FZogXFiZDccwtXA2wR0KPA657gmhdM9abakD3Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZD3eV4FY; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZD3eV4FY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781500276; x=1813036276;
  h=date:from:to:cc:subject:message-id;
  bh=qP730tPihwPhWijuxSskW8gopGmdSXdlz4AwEVBdZDc=;
  b=ZD3eV4FYhVg0GKNqDPhSO6Fs4ke7HpKkHgHU4hS0x+EMI+xA9aDt+l4q
   DNqqRbe5x+3kNtWlHipeUDr/e1MjyfWHbWguPG/IFmhTQB36iwbCJPyE6
   yOOnzT1rYeC2sFwwK7jI3CcUFKuXUmbs67zhlm6iBAeFKVmsCl9fIIWNL
   Ocdew/OTBOrD3uS7u4EJcSusn3i6bzIxu7WugYl7kE+3mbmIB0EUW01E0
   iw1Zg6nn9iLrJidthIhMCuA2qgnwIMRkNi2Sm6t3l7O450JWFkExe5umz
   EAiY8RiRbVWvhl8JnnCz0lZP0GgDSlvbHIb4nIBIgXKRKmfKRZ9w+t1Bz
   Q==;
X-CSE-ConnectionGUID: vqkDV9cxTnK5jXODqRlarA==
X-CSE-MsgGUID: asoVOlF5SnGlT5kMIZgvXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82244511"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="82244511"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 22:11:15 -0700
X-CSE-ConnectionGUID: 3P97CTLAQpaFdmhT4ZSbbQ==
X-CSE-MsgGUID: q8YOL+E+SJeCZiep9NH6bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="271050761"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Jun 2026 22:11:14 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYzbL-00000000RVC-1tlP;
	Mon, 15 Jun 2026 05:11:11 +0000
Date: Mon, 15 Jun 2026 13:11:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 12583/13763]
 drivers/net/dsa/yt921x.c:1792 yt921x_acl_rule_ext_parse_flow_entries() warn:
 missing unwind goto?
Message-ID: <202606151204.PAl3ufvh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Yang <mmyangfl@gmail.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c425609d6ac4012c8bbf01ec2e10e801b1923a7b
commit: 8eb9e7520b17abdea1a0308f483990ae019aa1c1 [12583/13763] net: dsa: yt921x: Add ACL support
:::::: branch date: 2 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-r073-20260615 (https://download.01.org/0day-ci/archive/20260615/202606151204.PAl3ufvh-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606151204.PAl3ufvh-lkp@intel.com/

smatch warnings:
drivers/net/dsa/yt921x.c:1792 yt921x_acl_rule_ext_parse_flow_entries() warn: missing unwind goto?

vim +1792 drivers/net/dsa/yt921x.c

8eb9e7520b17ab David Yang 2026-06-06  1666  
8eb9e7520b17ab David Yang 2026-06-06  1667  static int
8eb9e7520b17ab David Yang 2026-06-06  1668  yt921x_acl_rule_ext_parse_flow_entries(struct yt921x_acl_rule_ext *ruleext,
8eb9e7520b17ab David Yang 2026-06-06  1669  				       const struct flow_cls_offload *cls)
8eb9e7520b17ab David Yang 2026-06-06  1670  {
8eb9e7520b17ab David Yang 2026-06-06  1671  	const struct flow_rule *rule = flow_cls_offload_flow_rule(cls);
8eb9e7520b17ab David Yang 2026-06-06  1672  	struct yt921x_acl_entry *entries = ruleext->r.entries;
8eb9e7520b17ab David Yang 2026-06-06  1673  	struct netlink_ext_ack *extack = cls->common.extack;
8eb9e7520b17ab David Yang 2026-06-06  1674  	const struct flow_dissector *dissector;
8eb9e7520b17ab David Yang 2026-06-06  1675  	struct yt921x_acl_entry *entry;
8eb9e7520b17ab David Yang 2026-06-06  1676  	unsigned int size = 0;
8eb9e7520b17ab David Yang 2026-06-06  1677  	bool use_dport;
8eb9e7520b17ab David Yang 2026-06-06  1678  	bool use_sport;
8eb9e7520b17ab David Yang 2026-06-06  1679  
8eb9e7520b17ab David Yang 2026-06-06  1680  	/* Incomplete and probably won't, since it supports custom u32 filters.
8eb9e7520b17ab David Yang 2026-06-06  1681  	 * New adapters are welcome.
8eb9e7520b17ab David Yang 2026-06-06  1682  	 */
8eb9e7520b17ab David Yang 2026-06-06  1683  	dissector = rule->match.dissector;
8eb9e7520b17ab David Yang 2026-06-06  1684  	if (dissector->used_keys &
8eb9e7520b17ab David Yang 2026-06-06  1685  	    ~(BIT_ULL(FLOW_DISSECTOR_KEY_CONTROL) |
8eb9e7520b17ab David Yang 2026-06-06  1686  	      BIT_ULL(FLOW_DISSECTOR_KEY_BASIC) |
8eb9e7520b17ab David Yang 2026-06-06  1687  	      BIT_ULL(FLOW_DISSECTOR_KEY_IPV4_ADDRS) |
8eb9e7520b17ab David Yang 2026-06-06  1688  	      BIT_ULL(FLOW_DISSECTOR_KEY_IPV6_ADDRS) |
8eb9e7520b17ab David Yang 2026-06-06  1689  	      BIT_ULL(FLOW_DISSECTOR_KEY_PORTS) |
8eb9e7520b17ab David Yang 2026-06-06  1690  	      BIT_ULL(FLOW_DISSECTOR_KEY_PORTS_RANGE) |
8eb9e7520b17ab David Yang 2026-06-06  1691  	      BIT_ULL(FLOW_DISSECTOR_KEY_ETH_ADDRS) |
8eb9e7520b17ab David Yang 2026-06-06  1692  	      BIT_ULL(FLOW_DISSECTOR_KEY_IP) |
8eb9e7520b17ab David Yang 2026-06-06  1693  	      BIT_ULL(FLOW_DISSECTOR_KEY_TCP))) {
8eb9e7520b17ab David Yang 2026-06-06  1694  		NL_SET_ERR_MSG_MOD(extack, "Unsupported keys used");
8eb9e7520b17ab David Yang 2026-06-06  1695  		return -EOPNOTSUPP;
8eb9e7520b17ab David Yang 2026-06-06  1696  	}
8eb9e7520b17ab David Yang 2026-06-06  1697  
8eb9e7520b17ab David Yang 2026-06-06  1698  	/* Entries */
8eb9e7520b17ab David Yang 2026-06-06  1699  	if (flow_rule_match_key(rule, FLOW_DISSECTOR_KEY_IPV4_ADDRS)) {
8eb9e7520b17ab David Yang 2026-06-06  1700  		struct flow_match_ipv4_addrs match;
8eb9e7520b17ab David Yang 2026-06-06  1701  
8eb9e7520b17ab David Yang 2026-06-06  1702  		flow_rule_match_ipv4_addrs(rule, &match);
8eb9e7520b17ab David Yang 2026-06-06  1703  
8eb9e7520b17ab David Yang 2026-06-06  1704  		if (match.mask->dst) {
8eb9e7520b17ab David Yang 2026-06-06  1705  			entry = yt921x_acl_entries_new(entries, &size,
8eb9e7520b17ab David Yang 2026-06-06  1706  						       YT921X_ACL_TYPE_IPV4_DA);
8eb9e7520b17ab David Yang 2026-06-06  1707  			if (!entry)
8eb9e7520b17ab David Yang 2026-06-06  1708  				goto err;
8eb9e7520b17ab David Yang 2026-06-06  1709  
8eb9e7520b17ab David Yang 2026-06-06  1710  			entry->key[0] |= ntohl(match.key->dst);
8eb9e7520b17ab David Yang 2026-06-06  1711  			entry->mask[0] |= ntohl(match.mask->dst);
8eb9e7520b17ab David Yang 2026-06-06  1712  		}
8eb9e7520b17ab David Yang 2026-06-06  1713  
8eb9e7520b17ab David Yang 2026-06-06  1714  		if (match.mask->src) {
8eb9e7520b17ab David Yang 2026-06-06  1715  			entry = yt921x_acl_entries_new(entries, &size,
8eb9e7520b17ab David Yang 2026-06-06  1716  						       YT921X_ACL_TYPE_IPV4_SA);
8eb9e7520b17ab David Yang 2026-06-06  1717  			if (!entry)
8eb9e7520b17ab David Yang 2026-06-06  1718  				goto err;
8eb9e7520b17ab David Yang 2026-06-06  1719  
8eb9e7520b17ab David Yang 2026-06-06  1720  			entry->key[0] |= ntohl(match.key->src);
8eb9e7520b17ab David Yang 2026-06-06  1721  			entry->mask[0] |= ntohl(match.mask->src);
8eb9e7520b17ab David Yang 2026-06-06  1722  		}
8eb9e7520b17ab David Yang 2026-06-06  1723  	}
8eb9e7520b17ab David Yang 2026-06-06  1724  
8eb9e7520b17ab David Yang 2026-06-06  1725  	if (flow_rule_match_key(rule, FLOW_DISSECTOR_KEY_IPV6_ADDRS)) {
8eb9e7520b17ab David Yang 2026-06-06  1726  		struct flow_match_ipv6_addrs match;
8eb9e7520b17ab David Yang 2026-06-06  1727  
8eb9e7520b17ab David Yang 2026-06-06  1728  		flow_rule_match_ipv6_addrs(rule, &match);
8eb9e7520b17ab David Yang 2026-06-06  1729  
8eb9e7520b17ab David Yang 2026-06-06  1730  		for (unsigned int i = 0; i < 4; i++) {
8eb9e7520b17ab David Yang 2026-06-06  1731  			if (!match.mask->dst.s6_addr32[i])
8eb9e7520b17ab David Yang 2026-06-06  1732  				continue;
8eb9e7520b17ab David Yang 2026-06-06  1733  
8eb9e7520b17ab David Yang 2026-06-06  1734  			entry = yt921x_acl_entries_new(entries, &size,
8eb9e7520b17ab David Yang 2026-06-06  1735  						       YT921X_ACL_TYPE_IPV6_DA0 + i);
8eb9e7520b17ab David Yang 2026-06-06  1736  			if (!entry)
8eb9e7520b17ab David Yang 2026-06-06  1737  				goto err;
8eb9e7520b17ab David Yang 2026-06-06  1738  
8eb9e7520b17ab David Yang 2026-06-06  1739  			entry->key[0] |= ntohl(match.key->dst.s6_addr32[i]);
8eb9e7520b17ab David Yang 2026-06-06  1740  			entry->mask[0] |= ntohl(match.mask->dst.s6_addr32[i]);
8eb9e7520b17ab David Yang 2026-06-06  1741  		}
8eb9e7520b17ab David Yang 2026-06-06  1742  
8eb9e7520b17ab David Yang 2026-06-06  1743  		for (unsigned int i = 0; i < 4; i++) {
8eb9e7520b17ab David Yang 2026-06-06  1744  			if (!match.mask->src.s6_addr32[i])
8eb9e7520b17ab David Yang 2026-06-06  1745  				continue;
8eb9e7520b17ab David Yang 2026-06-06  1746  
8eb9e7520b17ab David Yang 2026-06-06  1747  			entry = yt921x_acl_entries_new(entries, &size,
8eb9e7520b17ab David Yang 2026-06-06  1748  						       YT921X_ACL_TYPE_IPV6_SA0 + i);
8eb9e7520b17ab David Yang 2026-06-06  1749  			if (!entry)
8eb9e7520b17ab David Yang 2026-06-06  1750  				goto err;
8eb9e7520b17ab David Yang 2026-06-06  1751  
8eb9e7520b17ab David Yang 2026-06-06  1752  			entry->key[0] |= ntohl(match.key->src.s6_addr32[i]);
8eb9e7520b17ab David Yang 2026-06-06  1753  			entry->mask[0] |= ntohl(match.mask->src.s6_addr32[i]);
8eb9e7520b17ab David Yang 2026-06-06  1754  		}
8eb9e7520b17ab David Yang 2026-06-06  1755  	}
8eb9e7520b17ab David Yang 2026-06-06  1756  
8eb9e7520b17ab David Yang 2026-06-06  1757  	use_dport = false;
8eb9e7520b17ab David Yang 2026-06-06  1758  	use_sport = false;
8eb9e7520b17ab David Yang 2026-06-06  1759  	if (flow_rule_match_key(rule, FLOW_DISSECTOR_KEY_PORTS)) {
8eb9e7520b17ab David Yang 2026-06-06  1760  		struct flow_match_ports match;
8eb9e7520b17ab David Yang 2026-06-06  1761  
8eb9e7520b17ab David Yang 2026-06-06  1762  		entry = yt921x_acl_entries_new(entries, &size,
8eb9e7520b17ab David Yang 2026-06-06  1763  					       YT921X_ACL_TYPE_L4);
8eb9e7520b17ab David Yang 2026-06-06  1764  		if (!entry)
8eb9e7520b17ab David Yang 2026-06-06  1765  			goto err;
8eb9e7520b17ab David Yang 2026-06-06  1766  
8eb9e7520b17ab David Yang 2026-06-06  1767  		flow_rule_match_ports(rule, &match);
8eb9e7520b17ab David Yang 2026-06-06  1768  
8eb9e7520b17ab David Yang 2026-06-06  1769  		use_dport = !!match.mask->dst;
8eb9e7520b17ab David Yang 2026-06-06  1770  		use_sport = !!match.mask->src;
8eb9e7520b17ab David Yang 2026-06-06  1771  
8eb9e7520b17ab David Yang 2026-06-06  1772  		entry->key[0] |= (ntohs(match.key->dst) << 16) |
8eb9e7520b17ab David Yang 2026-06-06  1773  				 ntohs(match.key->src);
8eb9e7520b17ab David Yang 2026-06-06  1774  		entry->mask[0] |= (ntohs(match.mask->dst) << 16) |
8eb9e7520b17ab David Yang 2026-06-06  1775  				  ntohs(match.mask->src);
8eb9e7520b17ab David Yang 2026-06-06  1776  	}
8eb9e7520b17ab David Yang 2026-06-06  1777  
8eb9e7520b17ab David Yang 2026-06-06  1778  	if (flow_rule_match_key(rule, FLOW_DISSECTOR_KEY_PORTS_RANGE)) {
8eb9e7520b17ab David Yang 2026-06-06  1779  		struct flow_match_ports_range match;
8eb9e7520b17ab David Yang 2026-06-06  1780  
8eb9e7520b17ab David Yang 2026-06-06  1781  		entry = yt921x_acl_entries_find(entries, &size,
8eb9e7520b17ab David Yang 2026-06-06  1782  						YT921X_ACL_TYPE_L4);
8eb9e7520b17ab David Yang 2026-06-06  1783  		if (!entry)
8eb9e7520b17ab David Yang 2026-06-06  1784  			goto err;
8eb9e7520b17ab David Yang 2026-06-06  1785  
8eb9e7520b17ab David Yang 2026-06-06  1786  		flow_rule_match_ports_range(rule, &match);
8eb9e7520b17ab David Yang 2026-06-06  1787  
8eb9e7520b17ab David Yang 2026-06-06  1788  		if ((use_dport && match.mask->tp.dst) ||
8eb9e7520b17ab David Yang 2026-06-06  1789  		    (use_sport && match.mask->tp.src)) {
8eb9e7520b17ab David Yang 2026-06-06  1790  			NL_SET_ERR_MSG_MOD(extack,
8eb9e7520b17ab David Yang 2026-06-06  1791  					   "Port mask and range are mutually exclusive");
8eb9e7520b17ab David Yang 2026-06-06 @1792  			return -EINVAL;
8eb9e7520b17ab David Yang 2026-06-06  1793  		}
8eb9e7520b17ab David Yang 2026-06-06  1794  
8eb9e7520b17ab David Yang 2026-06-06  1795  		if (match.mask->tp.dst) {
8eb9e7520b17ab David Yang 2026-06-06  1796  			entry->key[0] |= ntohs(match.key->tp_min.dst) << 16;
8eb9e7520b17ab David Yang 2026-06-06  1797  			entry->key[1] |= YT921X_ACL_KEYb_L4_DPORT_RANGE_EN;
8eb9e7520b17ab David Yang 2026-06-06  1798  			entry->mask[0] |= ntohs(match.key->tp_max.dst) << 16;
8eb9e7520b17ab David Yang 2026-06-06  1799  		}
8eb9e7520b17ab David Yang 2026-06-06  1800  
8eb9e7520b17ab David Yang 2026-06-06  1801  		if (match.mask->tp.src) {
8eb9e7520b17ab David Yang 2026-06-06  1802  			entry->key[0] |= ntohs(match.key->tp_min.src);
8eb9e7520b17ab David Yang 2026-06-06  1803  			entry->key[1] |= YT921X_ACL_KEYb_L4_SPORT_RANGE_EN;
8eb9e7520b17ab David Yang 2026-06-06  1804  			entry->mask[0] |= ntohs(match.key->tp_max.src);
8eb9e7520b17ab David Yang 2026-06-06  1805  		}
8eb9e7520b17ab David Yang 2026-06-06  1806  	}
8eb9e7520b17ab David Yang 2026-06-06  1807  
8eb9e7520b17ab David Yang 2026-06-06  1808  	if (flow_rule_match_key(rule, FLOW_DISSECTOR_KEY_ETH_ADDRS)) {
8eb9e7520b17ab David Yang 2026-06-06  1809  		struct flow_match_eth_addrs match;
8eb9e7520b17ab David Yang 2026-06-06  1810  		u32 mask;
8eb9e7520b17ab David Yang 2026-06-06  1811  
8eb9e7520b17ab David Yang 2026-06-06  1812  		flow_rule_match_eth_addrs(rule, &match);
8eb9e7520b17ab David Yang 2026-06-06  1813  
8eb9e7520b17ab David Yang 2026-06-06  1814  		mask = ethaddr_hi4_to_u32(match.mask->dst);
8eb9e7520b17ab David Yang 2026-06-06  1815  		if (mask) {
8eb9e7520b17ab David Yang 2026-06-06  1816  			entry = yt921x_acl_entries_new(entries, &size,
8eb9e7520b17ab David Yang 2026-06-06  1817  						       YT921X_ACL_TYPE_MAC_DA0);
8eb9e7520b17ab David Yang 2026-06-06  1818  			if (!entry)
8eb9e7520b17ab David Yang 2026-06-06  1819  				goto err;
8eb9e7520b17ab David Yang 2026-06-06  1820  
8eb9e7520b17ab David Yang 2026-06-06  1821  			entry->key[0] |= ethaddr_hi4_to_u32(match.key->dst);
8eb9e7520b17ab David Yang 2026-06-06  1822  			entry->mask[0] |= mask;
8eb9e7520b17ab David Yang 2026-06-06  1823  		}
8eb9e7520b17ab David Yang 2026-06-06  1824  
8eb9e7520b17ab David Yang 2026-06-06  1825  		mask = ethaddr_hi4_to_u32(match.mask->src);
8eb9e7520b17ab David Yang 2026-06-06  1826  		if (mask) {
8eb9e7520b17ab David Yang 2026-06-06  1827  			entry = yt921x_acl_entries_new(entries, &size,
8eb9e7520b17ab David Yang 2026-06-06  1828  						       YT921X_ACL_TYPE_MAC_SA0);
8eb9e7520b17ab David Yang 2026-06-06  1829  			if (!entry)
8eb9e7520b17ab David Yang 2026-06-06  1830  				goto err;
8eb9e7520b17ab David Yang 2026-06-06  1831  
8eb9e7520b17ab David Yang 2026-06-06  1832  			entry->key[0] |= ethaddr_hi4_to_u32(match.key->src);
8eb9e7520b17ab David Yang 2026-06-06  1833  			entry->mask[0] |= mask;
8eb9e7520b17ab David Yang 2026-06-06  1834  		}
8eb9e7520b17ab David Yang 2026-06-06  1835  
8eb9e7520b17ab David Yang 2026-06-06  1836  		mask = (ethaddr_lo2_to_u32(match.mask->dst) << 16) |
8eb9e7520b17ab David Yang 2026-06-06  1837  		       ethaddr_lo2_to_u32(match.mask->src);
8eb9e7520b17ab David Yang 2026-06-06  1838  		if (mask) {
8eb9e7520b17ab David Yang 2026-06-06  1839  			entry = yt921x_acl_entries_new(entries, &size,
8eb9e7520b17ab David Yang 2026-06-06  1840  						       YT921X_ACL_TYPE_MAC_DA1_SA1);
8eb9e7520b17ab David Yang 2026-06-06  1841  			if (!entry)
8eb9e7520b17ab David Yang 2026-06-06  1842  				goto err;
8eb9e7520b17ab David Yang 2026-06-06  1843  
8eb9e7520b17ab David Yang 2026-06-06  1844  			entry->key[0] |= (ethaddr_lo2_to_u32(match.key->dst) << 16) |
8eb9e7520b17ab David Yang 2026-06-06  1845  					 ethaddr_lo2_to_u32(match.key->src);
8eb9e7520b17ab David Yang 2026-06-06  1846  			entry->mask[0] |= mask;
8eb9e7520b17ab David Yang 2026-06-06  1847  		}
8eb9e7520b17ab David Yang 2026-06-06  1848  	}
8eb9e7520b17ab David Yang 2026-06-06  1849  
8eb9e7520b17ab David Yang 2026-06-06  1850  	/* Entries + Misc */
8eb9e7520b17ab David Yang 2026-06-06  1851  	if (flow_rule_match_key(rule, FLOW_DISSECTOR_KEY_BASIC)) {
8eb9e7520b17ab David Yang 2026-06-06  1852  		struct flow_match_basic match;
8eb9e7520b17ab David Yang 2026-06-06  1853  
8eb9e7520b17ab David Yang 2026-06-06  1854  		flow_rule_match_basic(rule, &match);
8eb9e7520b17ab David Yang 2026-06-06  1855  
8eb9e7520b17ab David Yang 2026-06-06  1856  		if (match.mask->n_proto) {
8eb9e7520b17ab David Yang 2026-06-06  1857  			enum yt921x_l3_type l3type = YT921X_L3_TYPE_OTHER;
8eb9e7520b17ab David Yang 2026-06-06  1858  
8eb9e7520b17ab David Yang 2026-06-06  1859  			if (match.mask->n_proto == htons(~0))
8eb9e7520b17ab David Yang 2026-06-06  1860  				switch (match.key->n_proto) {
8eb9e7520b17ab David Yang 2026-06-06  1861  				case htons(ETH_P_IP):
8eb9e7520b17ab David Yang 2026-06-06  1862  					l3type = YT921X_L3_TYPE_IPV4;
8eb9e7520b17ab David Yang 2026-06-06  1863  					break;
8eb9e7520b17ab David Yang 2026-06-06  1864  				case htons(ETH_P_IPV6):
8eb9e7520b17ab David Yang 2026-06-06  1865  					l3type = YT921X_L3_TYPE_IPV6;
8eb9e7520b17ab David Yang 2026-06-06  1866  					break;
8eb9e7520b17ab David Yang 2026-06-06  1867  				case htons(ETH_P_ARP):
8eb9e7520b17ab David Yang 2026-06-06  1868  					l3type = YT921X_L3_TYPE_ARP;
8eb9e7520b17ab David Yang 2026-06-06  1869  					break;
8eb9e7520b17ab David Yang 2026-06-06  1870  				case htons(ETH_P_LLDP):
8eb9e7520b17ab David Yang 2026-06-06  1871  					l3type = YT921X_L3_TYPE_LLDP;
8eb9e7520b17ab David Yang 2026-06-06  1872  					break;
8eb9e7520b17ab David Yang 2026-06-06  1873  				case htons(ETH_P_PAE):
8eb9e7520b17ab David Yang 2026-06-06  1874  					l3type = YT921X_L3_TYPE_PAE;
8eb9e7520b17ab David Yang 2026-06-06  1875  					break;
8eb9e7520b17ab David Yang 2026-06-06  1876  				case htons(ETH_P_CFM):
8eb9e7520b17ab David Yang 2026-06-06  1877  					l3type = YT921X_L3_TYPE_ERP;
8eb9e7520b17ab David Yang 2026-06-06  1878  					break;
8eb9e7520b17ab David Yang 2026-06-06  1879  				}
8eb9e7520b17ab David Yang 2026-06-06  1880  
8eb9e7520b17ab David Yang 2026-06-06  1881  			if (l3type != YT921X_L3_TYPE_OTHER) {
8eb9e7520b17ab David Yang 2026-06-06  1882  				size = yt921x_acl_entries_set_l3_type(entries,
8eb9e7520b17ab David Yang 2026-06-06  1883  								      size,
8eb9e7520b17ab David Yang 2026-06-06  1884  								      l3type);
8eb9e7520b17ab David Yang 2026-06-06  1885  				if (!size)
8eb9e7520b17ab David Yang 2026-06-06  1886  					goto err;
8eb9e7520b17ab David Yang 2026-06-06  1887  			} else {
8eb9e7520b17ab David Yang 2026-06-06  1888  				entry = yt921x_acl_entries_new(entries, &size,
8eb9e7520b17ab David Yang 2026-06-06  1889  							       YT921X_ACL_TYPE_ETHERTYPE);
8eb9e7520b17ab David Yang 2026-06-06  1890  				if (!entry)
8eb9e7520b17ab David Yang 2026-06-06  1891  					goto err;
8eb9e7520b17ab David Yang 2026-06-06  1892  
8eb9e7520b17ab David Yang 2026-06-06  1893  				entry->key[0] |= ntohs(match.key->n_proto);
8eb9e7520b17ab David Yang 2026-06-06  1894  				entry->mask[0] |= ntohs(match.mask->n_proto);
8eb9e7520b17ab David Yang 2026-06-06  1895  			}
8eb9e7520b17ab David Yang 2026-06-06  1896  		}
8eb9e7520b17ab David Yang 2026-06-06  1897  
8eb9e7520b17ab David Yang 2026-06-06  1898  		if (match.mask->ip_proto) {
8eb9e7520b17ab David Yang 2026-06-06  1899  			enum yt921x_l4_type l4type = YT921X_L4_TYPE_OTHER;
8eb9e7520b17ab David Yang 2026-06-06  1900  
8eb9e7520b17ab David Yang 2026-06-06  1901  			if (match.mask->ip_proto == (u8)~0)
8eb9e7520b17ab David Yang 2026-06-06  1902  				switch (match.key->ip_proto) {
8eb9e7520b17ab David Yang 2026-06-06  1903  				case IPPROTO_TCP:
8eb9e7520b17ab David Yang 2026-06-06  1904  					l4type = YT921X_L4_TYPE_TCP;
8eb9e7520b17ab David Yang 2026-06-06  1905  					break;
8eb9e7520b17ab David Yang 2026-06-06  1906  				case IPPROTO_UDP:
8eb9e7520b17ab David Yang 2026-06-06  1907  					l4type = YT921X_L4_TYPE_UDP;
8eb9e7520b17ab David Yang 2026-06-06  1908  					break;
8eb9e7520b17ab David Yang 2026-06-06  1909  				case IPPROTO_UDPLITE:
8eb9e7520b17ab David Yang 2026-06-06  1910  					l4type = YT921X_L4_TYPE_UDPLITE;
8eb9e7520b17ab David Yang 2026-06-06  1911  					break;
8eb9e7520b17ab David Yang 2026-06-06  1912  				case IPPROTO_ICMP:
8eb9e7520b17ab David Yang 2026-06-06  1913  					l4type = YT921X_L4_TYPE_ICMP;
8eb9e7520b17ab David Yang 2026-06-06  1914  					break;
8eb9e7520b17ab David Yang 2026-06-06  1915  				case IPPROTO_IGMP:
8eb9e7520b17ab David Yang 2026-06-06  1916  					l4type = YT921X_L4_TYPE_IGMP;
8eb9e7520b17ab David Yang 2026-06-06  1917  					break;
8eb9e7520b17ab David Yang 2026-06-06  1918  				}
8eb9e7520b17ab David Yang 2026-06-06  1919  
8eb9e7520b17ab David Yang 2026-06-06  1920  			if (l4type != YT921X_L4_TYPE_OTHER) {
8eb9e7520b17ab David Yang 2026-06-06  1921  				size = yt921x_acl_entries_set_l4_type(entries,
8eb9e7520b17ab David Yang 2026-06-06  1922  								      size,
8eb9e7520b17ab David Yang 2026-06-06  1923  								      l4type);
8eb9e7520b17ab David Yang 2026-06-06  1924  				if (!size)
8eb9e7520b17ab David Yang 2026-06-06  1925  					goto err;
8eb9e7520b17ab David Yang 2026-06-06  1926  			} else {
8eb9e7520b17ab David Yang 2026-06-06  1927  				entry = yt921x_acl_entries_find(entries, &size,
8eb9e7520b17ab David Yang 2026-06-06  1928  								YT921X_ACL_TYPE_MISC);
8eb9e7520b17ab David Yang 2026-06-06  1929  				if (!entry)
8eb9e7520b17ab David Yang 2026-06-06  1930  					goto err;
8eb9e7520b17ab David Yang 2026-06-06  1931  
8eb9e7520b17ab David Yang 2026-06-06  1932  				entry->key[0] |= YT921X_ACL_BINa_MISC_IP_PROTO(match.key->ip_proto);
8eb9e7520b17ab David Yang 2026-06-06  1933  				entry->mask[0] |= YT921X_ACL_BINa_MISC_IP_PROTO(match.mask->ip_proto);
8eb9e7520b17ab David Yang 2026-06-06  1934  			}
8eb9e7520b17ab David Yang 2026-06-06  1935  		}
8eb9e7520b17ab David Yang 2026-06-06  1936  	}
8eb9e7520b17ab David Yang 2026-06-06  1937  
8eb9e7520b17ab David Yang 2026-06-06  1938  	if (flow_rule_match_key(rule, FLOW_DISSECTOR_KEY_CONTROL)) {
8eb9e7520b17ab David Yang 2026-06-06  1939  		u32 supp_flags = FLOW_DIS_IS_FRAGMENT | FLOW_DIS_FIRST_FRAG;
8eb9e7520b17ab David Yang 2026-06-06  1940  		struct flow_match_control match;
8eb9e7520b17ab David Yang 2026-06-06  1941  
8eb9e7520b17ab David Yang 2026-06-06  1942  		flow_rule_match_control(rule, &match);
8eb9e7520b17ab David Yang 2026-06-06  1943  		if (!flow_rule_is_supp_control_flags(supp_flags,
8eb9e7520b17ab David Yang 2026-06-06  1944  						     match.mask->flags, extack))
8eb9e7520b17ab David Yang 2026-06-06  1945  			return -EOPNOTSUPP;
8eb9e7520b17ab David Yang 2026-06-06  1946  
8eb9e7520b17ab David Yang 2026-06-06  1947  		if (match.mask->flags & FLOW_DIS_IS_FRAGMENT) {
8eb9e7520b17ab David Yang 2026-06-06  1948  			bool set = match.key->flags & FLOW_DIS_IS_FRAGMENT;
8eb9e7520b17ab David Yang 2026-06-06  1949  
8eb9e7520b17ab David Yang 2026-06-06  1950  			size = yt921x_acl_entries_set_is_fragment(entries, size,
8eb9e7520b17ab David Yang 2026-06-06  1951  								  set);
8eb9e7520b17ab David Yang 2026-06-06  1952  			if (!size)
8eb9e7520b17ab David Yang 2026-06-06  1953  				goto err;
8eb9e7520b17ab David Yang 2026-06-06  1954  		}
8eb9e7520b17ab David Yang 2026-06-06  1955  		if (match.mask->flags & FLOW_DIS_FIRST_FRAG) {
8eb9e7520b17ab David Yang 2026-06-06  1956  			bool set = match.key->flags & FLOW_DIS_FIRST_FRAG;
8eb9e7520b17ab David Yang 2026-06-06  1957  
8eb9e7520b17ab David Yang 2026-06-06  1958  			size = yt921x_acl_entries_set_first_frag(entries, size,
8eb9e7520b17ab David Yang 2026-06-06  1959  								 set);
8eb9e7520b17ab David Yang 2026-06-06  1960  			if (!size)
8eb9e7520b17ab David Yang 2026-06-06  1961  				goto err;
8eb9e7520b17ab David Yang 2026-06-06  1962  		}
8eb9e7520b17ab David Yang 2026-06-06  1963  	}
8eb9e7520b17ab David Yang 2026-06-06  1964  
8eb9e7520b17ab David Yang 2026-06-06  1965  	/* Misc only */
8eb9e7520b17ab David Yang 2026-06-06  1966  	if (flow_rule_match_key(rule, FLOW_DISSECTOR_KEY_IP)) {
8eb9e7520b17ab David Yang 2026-06-06  1967  		struct flow_match_ip match;
8eb9e7520b17ab David Yang 2026-06-06  1968  
8eb9e7520b17ab David Yang 2026-06-06  1969  		flow_rule_match_ip(rule, &match);
8eb9e7520b17ab David Yang 2026-06-06  1970  		if (match.mask->ttl) {
8eb9e7520b17ab David Yang 2026-06-06  1971  			NL_SET_ERR_MSG_MOD(extack,
8eb9e7520b17ab David Yang 2026-06-06  1972  					   "Matching on TTL not supported");
8eb9e7520b17ab David Yang 2026-06-06  1973  			return -EOPNOTSUPP;
8eb9e7520b17ab David Yang 2026-06-06  1974  		}
8eb9e7520b17ab David Yang 2026-06-06  1975  
8eb9e7520b17ab David Yang 2026-06-06  1976  		if (match.mask->tos) {
8eb9e7520b17ab David Yang 2026-06-06  1977  			entry = yt921x_acl_entries_find(entries, &size,
8eb9e7520b17ab David Yang 2026-06-06  1978  							YT921X_ACL_TYPE_MISC);
8eb9e7520b17ab David Yang 2026-06-06  1979  			if (!entry)
8eb9e7520b17ab David Yang 2026-06-06  1980  				goto err;
8eb9e7520b17ab David Yang 2026-06-06  1981  
8eb9e7520b17ab David Yang 2026-06-06  1982  			entry->key[0] |= YT921X_ACL_BINa_MISC_TOS(match.key->tos);
8eb9e7520b17ab David Yang 2026-06-06  1983  			entry->mask[0] |= YT921X_ACL_BINa_MISC_TOS(match.mask->tos);
8eb9e7520b17ab David Yang 2026-06-06  1984  		}
8eb9e7520b17ab David Yang 2026-06-06  1985  	}
8eb9e7520b17ab David Yang 2026-06-06  1986  
8eb9e7520b17ab David Yang 2026-06-06  1987  	if (flow_rule_match_key(rule, FLOW_DISSECTOR_KEY_TCP)) {
8eb9e7520b17ab David Yang 2026-06-06  1988  		struct flow_match_tcp match;
8eb9e7520b17ab David Yang 2026-06-06  1989  
8eb9e7520b17ab David Yang 2026-06-06  1990  		flow_rule_match_tcp(rule, &match);
8eb9e7520b17ab David Yang 2026-06-06  1991  		if (match.mask->flags & htons(~0xff)) {
8eb9e7520b17ab David Yang 2026-06-06  1992  			NL_SET_ERR_MSG_MOD(extack, "Unsupported TCP flags");
8eb9e7520b17ab David Yang 2026-06-06  1993  			return -EOPNOTSUPP;
8eb9e7520b17ab David Yang 2026-06-06  1994  		}
8eb9e7520b17ab David Yang 2026-06-06  1995  
8eb9e7520b17ab David Yang 2026-06-06  1996  		if (match.mask->flags) {
8eb9e7520b17ab David Yang 2026-06-06  1997  			entry = yt921x_acl_entries_find(entries, &size,
8eb9e7520b17ab David Yang 2026-06-06  1998  							YT921X_ACL_TYPE_MISC);
8eb9e7520b17ab David Yang 2026-06-06  1999  			if (!entry)
8eb9e7520b17ab David Yang 2026-06-06  2000  				goto err;
8eb9e7520b17ab David Yang 2026-06-06  2001  
8eb9e7520b17ab David Yang 2026-06-06  2002  			entry->key[0] |= YT921X_ACL_BINa_MISC_TCP_FLAGS(ntohs(match.key->flags));
8eb9e7520b17ab David Yang 2026-06-06  2003  			entry->mask[0] |= YT921X_ACL_BINa_MISC_TCP_FLAGS(ntohs(match.mask->flags));
8eb9e7520b17ab David Yang 2026-06-06  2004  		}
8eb9e7520b17ab David Yang 2026-06-06  2005  	}
8eb9e7520b17ab David Yang 2026-06-06  2006  
8eb9e7520b17ab David Yang 2026-06-06  2007  	if (!size) {
8eb9e7520b17ab David Yang 2026-06-06  2008  		NL_SET_ERR_MSG_MOD(extack, "Empty rule generated, this should not happen");
8eb9e7520b17ab David Yang 2026-06-06  2009  		return -EOPNOTSUPP;
8eb9e7520b17ab David Yang 2026-06-06  2010  	}
8eb9e7520b17ab David Yang 2026-06-06  2011  
8eb9e7520b17ab David Yang 2026-06-06  2012  	ruleext->r.mask = (1 << size) - 1;
8eb9e7520b17ab David Yang 2026-06-06  2013  	return 0;
8eb9e7520b17ab David Yang 2026-06-06  2014  
8eb9e7520b17ab David Yang 2026-06-06  2015  err:
8eb9e7520b17ab David Yang 2026-06-06  2016  	NL_SET_ERR_MSG_MOD(extack, "Rule too complex");
8eb9e7520b17ab David Yang 2026-06-06  2017  	return -EOPNOTSUPP;
8eb9e7520b17ab David Yang 2026-06-06  2018  }
8eb9e7520b17ab David Yang 2026-06-06  2019  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
