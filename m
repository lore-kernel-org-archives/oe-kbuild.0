Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2F035887
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Jan 2024 22:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TaKlG9On"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704492170; x=1736028170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dU9tl7oEYCmbdhcRlsUiYFOygffJ3GlZynt0hSuAwLk=;
  b=TaKlG9On+RERvTF6nxHFRvJgqKxstgoOq7UOoY0q+IhbmpO/iYF5cVO6
   0TaOBUHSR2N6xEZJgOi324/6g2WPzy1YR3ruwEuG2mpC/Ud4SZ2YNUBe8
   R+n/yCbSMz+9FmrzmgkGYGVtwCDWF6xv6rR8U8NloQVGTqvdWHyw56wFe
   +MwKsT4jRNjlFAdbBbSgQFYd44hGaxLq4v4pKTlTY8Ewsi4VMja7wyfi5
   8GwxPhmvz62U3QQycbjsWnV4cKPOt63TSmpfvCZTrhrOUQ0pf/nzZxPgf
   xV65uwhElnqh/K1e08xF8xXZ96PTnnrzChTXXDKmP+viBmXRUIYNfwdeU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="394771773"
X-IronPort-AV: E=Sophos;i="6.04,335,1695711600"; 
   d="scan'208";a="394771773"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 14:02:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="815063472"
X-IronPort-AV: E=Sophos;i="6.04,335,1695711600"; 
   d="scan'208";a="815063472"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 05 Jan 2024 14:02:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLsH8-0001jQ-1N;
	Fri, 05 Jan 2024 22:02:46 +0000
Date: Sat, 6 Jan 2024 06:02:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 2314/12662]
 drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c:575:9-32: duplicated
 argument to & or |
Message-ID: <202401060544.YShBeAss-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Geetha sowjanya <gakula@marvell.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e2425464bc87159274879ab30f9d4fe624b9fcd2
commit: a8d4879d5f1fac060719567d1a8e8f8e68a127fc [2314/12662] octeontx2-pf: TC flower offload support for ICMP type and code
:::::: branch date: 15 hours ago
:::::: commit date: 6 weeks ago
config: arm64-randconfig-r053-20240104 (https://download.01.org/0day-ci/archive/20240106/202401060544.YShBeAss-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401060544.YShBeAss-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c:575:9-32: duplicated argument to & or |
   drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c:575:35-58: duplicated argument to & or |

vim +575 drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c

9b179a960a96d5 Subbaraya Sundeep    2020-11-15  557  
9b179a960a96d5 Subbaraya Sundeep    2020-11-15  558  static void npc_set_features(struct rvu *rvu, int blkaddr, u8 intf)
9b179a960a96d5 Subbaraya Sundeep    2020-11-15  559  {
9b179a960a96d5 Subbaraya Sundeep    2020-11-15  560  	struct npc_mcam *mcam = &rvu->hw->mcam;
9b179a960a96d5 Subbaraya Sundeep    2020-11-15  561  	u64 *features = &mcam->rx_features;
a8d4879d5f1fac Geetha sowjanya      2023-11-22  562  	u64 proto_flags;
b7cf966126eb16 Naveen Mamindlapalli 2021-01-11  563  	int hdr;
9b179a960a96d5 Subbaraya Sundeep    2020-11-15  564  
9b179a960a96d5 Subbaraya Sundeep    2020-11-15  565  	if (is_npc_intf_tx(intf))
9b179a960a96d5 Subbaraya Sundeep    2020-11-15  566  		features = &mcam->tx_features;
9b179a960a96d5 Subbaraya Sundeep    2020-11-15  567  
9b179a960a96d5 Subbaraya Sundeep    2020-11-15  568  	for (hdr = NPC_DMAC; hdr < NPC_HEADER_FIELDS_MAX; hdr++) {
b7cf966126eb16 Naveen Mamindlapalli 2021-01-11  569  		if (npc_check_field(rvu, blkaddr, hdr, intf))
9b179a960a96d5 Subbaraya Sundeep    2020-11-15  570  			*features |= BIT_ULL(hdr);
9b179a960a96d5 Subbaraya Sundeep    2020-11-15  571  	}
9b179a960a96d5 Subbaraya Sundeep    2020-11-15  572  
a8d4879d5f1fac Geetha sowjanya      2023-11-22  573  	proto_flags = BIT_ULL(NPC_SPORT_TCP) | BIT_ULL(NPC_SPORT_UDP) |
9b179a960a96d5 Subbaraya Sundeep    2020-11-15  574  		       BIT_ULL(NPC_DPORT_TCP) | BIT_ULL(NPC_DPORT_UDP) |
a8d4879d5f1fac Geetha sowjanya      2023-11-22 @575  		       BIT_ULL(NPC_SPORT_SCTP) | BIT_ULL(NPC_DPORT_SCTP) |
a8d4879d5f1fac Geetha sowjanya      2023-11-22  576  		       BIT_ULL(NPC_SPORT_SCTP) | BIT_ULL(NPC_DPORT_SCTP) |
a8d4879d5f1fac Geetha sowjanya      2023-11-22  577  		       BIT_ULL(NPC_TYPE_ICMP) | BIT_ULL(NPC_CODE_ICMP);
9b179a960a96d5 Subbaraya Sundeep    2020-11-15  578  
9b179a960a96d5 Subbaraya Sundeep    2020-11-15  579  	/* for tcp/udp/sctp corresponding layer type should be in the key */
a8d4879d5f1fac Geetha sowjanya      2023-11-22  580  	if (*features & proto_flags) {
b7cf966126eb16 Naveen Mamindlapalli 2021-01-11  581  		if (!npc_check_field(rvu, blkaddr, NPC_LD, intf))
a8d4879d5f1fac Geetha sowjanya      2023-11-22  582  			*features &= ~proto_flags;
b7cf966126eb16 Naveen Mamindlapalli 2021-01-11  583  		else
b7cf966126eb16 Naveen Mamindlapalli 2021-01-11  584  			*features |= BIT_ULL(NPC_IPPROTO_TCP) |
b7cf966126eb16 Naveen Mamindlapalli 2021-01-11  585  				     BIT_ULL(NPC_IPPROTO_UDP) |
a8d4879d5f1fac Geetha sowjanya      2023-11-22  586  				     BIT_ULL(NPC_IPPROTO_SCTP) |
a8d4879d5f1fac Geetha sowjanya      2023-11-22  587  				     BIT_ULL(NPC_IPPROTO_ICMP);
b7cf966126eb16 Naveen Mamindlapalli 2021-01-11  588  	}
b7cf966126eb16 Naveen Mamindlapalli 2021-01-11  589  
2b9cef66790209 Naveen Mamindlapalli 2021-03-18  590  	/* for AH/ICMP/ICMPv6/, check if corresponding layer type is present in the key */
2b9cef66790209 Naveen Mamindlapalli 2021-03-18  591  	if (npc_check_field(rvu, blkaddr, NPC_LD, intf)) {
b7cf966126eb16 Naveen Mamindlapalli 2021-01-11  592  		*features |= BIT_ULL(NPC_IPPROTO_AH);
2b9cef66790209 Naveen Mamindlapalli 2021-03-18  593  		*features |= BIT_ULL(NPC_IPPROTO_ICMP);
2b9cef66790209 Naveen Mamindlapalli 2021-03-18  594  		*features |= BIT_ULL(NPC_IPPROTO_ICMP6);
2b9cef66790209 Naveen Mamindlapalli 2021-03-18  595  	}
b7cf966126eb16 Naveen Mamindlapalli 2021-01-11  596  
b7cf966126eb16 Naveen Mamindlapalli 2021-01-11  597  	/* for ESP, check if corresponding layer type is present in the key */
b7cf966126eb16 Naveen Mamindlapalli 2021-01-11  598  	if (npc_check_field(rvu, blkaddr, NPC_LE, intf))
b7cf966126eb16 Naveen Mamindlapalli 2021-01-11  599  		*features |= BIT_ULL(NPC_IPPROTO_ESP);
9b179a960a96d5 Subbaraya Sundeep    2020-11-15  600  
9b179a960a96d5 Subbaraya Sundeep    2020-11-15  601  	/* for vlan corresponding layer type should be in the key */
9b179a960a96d5 Subbaraya Sundeep    2020-11-15  602  	if (*features & BIT_ULL(NPC_OUTER_VID))
b7cf966126eb16 Naveen Mamindlapalli 2021-01-11  603  		if (!npc_check_field(rvu, blkaddr, NPC_LB, intf))
9b179a960a96d5 Subbaraya Sundeep    2020-11-15  604  			*features &= ~BIT_ULL(NPC_OUTER_VID);
dce677da57c0ed Subbaraya Sundeep    2021-08-27  605  
12aa0a3b93f3ad Ratheesh Kannoth     2023-08-09  606  	/* Set SPI flag only if AH/ESP and IPSEC_SPI are in the key */
12aa0a3b93f3ad Ratheesh Kannoth     2023-08-09  607  	if (npc_check_field(rvu, blkaddr, NPC_IPSEC_SPI, intf) &&
12aa0a3b93f3ad Ratheesh Kannoth     2023-08-09  608  	    (*features & (BIT_ULL(NPC_IPPROTO_ESP) | BIT_ULL(NPC_IPPROTO_AH))))
73b4c04e2e9af8 Ratheesh Kannoth     2023-08-01  609  		*features |= BIT_ULL(NPC_IPSEC_SPI);
73b4c04e2e9af8 Ratheesh Kannoth     2023-08-01  610  
dce677da57c0ed Subbaraya Sundeep    2021-08-27  611  	/* for vlan ethertypes corresponding layer type should be in the key */
dce677da57c0ed Subbaraya Sundeep    2021-08-27  612  	if (npc_check_field(rvu, blkaddr, NPC_LB, intf))
dce677da57c0ed Subbaraya Sundeep    2021-08-27  613  		*features |= BIT_ULL(NPC_VLAN_ETYPE_CTAG) |
dce677da57c0ed Subbaraya Sundeep    2021-08-27  614  			     BIT_ULL(NPC_VLAN_ETYPE_STAG);
2cee6401c4eaa5 Suman Ghosh          2022-10-31  615  
2cee6401c4eaa5 Suman Ghosh          2022-10-31  616  	/* for L2M/L2B/L3M/L3B, check if the type is present in the key */
2cee6401c4eaa5 Suman Ghosh          2022-10-31  617  	if (npc_check_field(rvu, blkaddr, NPC_LXMB, intf))
2cee6401c4eaa5 Suman Ghosh          2022-10-31  618  		*features |= BIT_ULL(NPC_LXMB);
a63df366d0915a Hariprasad Kelam     2023-09-21  619  
a63df366d0915a Hariprasad Kelam     2023-09-21  620  	for (hdr = NPC_MPLS1_LBTCBOS; hdr <= NPC_MPLS4_TTL; hdr++) {
a63df366d0915a Hariprasad Kelam     2023-09-21  621  		if (npc_check_field(rvu, blkaddr, hdr, intf))
a63df366d0915a Hariprasad Kelam     2023-09-21  622  			*features |= BIT_ULL(hdr);
a63df366d0915a Hariprasad Kelam     2023-09-21  623  	}
9b179a960a96d5 Subbaraya Sundeep    2020-11-15  624  }
9b179a960a96d5 Subbaraya Sundeep    2020-11-15  625  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
