Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011B2306749
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Jun 2026 09:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781084473; cv=none; b=DaRGHbSj9Ep5kpqhSvuGkXRfyNREfgWA3x2gIVePTYLlYbzQ9R6ykNiIEKR/RAR/CcaPl8/Bx49+k4RUwpOlhgdhZs3rmgTTZ78Gorle5ibNjyl+fTWJ2HkVV2OpARTO1MQwE81E4QjQT+utFxEQ3yjXRxZTAoFWdULJ1llKGaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781084473; c=relaxed/simple;
	bh=L9rT7OiQ4o2g4+WHk4u2Z5W9Hc+cufxfjoemaAnzF1c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gD1ZPBhaSuZ9U5apulurPTgwfHOkGad/Az6GgJkLMQXAF+WaeevD07JABvkLVsK/hS/8D2lIQLwa5QVV31tLoVKuwJbCirA+tFonxlNWTRmk3ziMMNabwhzOI2vqZvvOYX9SRDKq7HOhidnZWnXb2ANhTaZcDFvOadGRowb9zdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KvxS4v6T; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KvxS4v6T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781084471; x=1812620471;
  h=date:from:to:cc:subject:message-id;
  bh=L9rT7OiQ4o2g4+WHk4u2Z5W9Hc+cufxfjoemaAnzF1c=;
  b=KvxS4v6TUwp86htyq/txQvmYjywJujF8fO/2CsCufvb2TkTS58xBj8XT
   YtUrDmhp1cesrzWrso5hMZvapIlV0AWcAWIWGYjn92apkxJPV41VCtac5
   4s78K0jTLgzii+uxCFDqoSxact1cOfxljhxRI/+nKJmaeMCB1wmsnk5FD
   nU+zhkBgbCjZU5UBmIoH01Z4JMR4VV+tvNHSwxLtGqvaXIDiFBa/dGgFf
   YB66pu4Y9JvzlFo7sr2Bbwgc8bB3MvhrUJFLAFFcU6g5vhkoqr8DJolkl
   eb5VX/t2Mo9WTJwCXcN0nTfmmQge1i4FdQkjWF9a3Bucv4m7X7ZTtGRVp
   g==;
X-CSE-ConnectionGUID: Rkvu2YBrTm6EhPXPnVlZ4A==
X-CSE-MsgGUID: AO4VG6T0S4SRfBv1PBrq7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="92438683"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="92438683"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 02:41:10 -0700
X-CSE-ConnectionGUID: FeR/ucGRQWO0gH9eLXuL6g==
X-CSE-MsgGUID: Nl1RM/sVQOSAV3NT+X9apw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="243155987"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Jun 2026 02:41:09 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXFQo-00000000LE4-1MjJ;
	Wed, 10 Jun 2026 09:41:06 +0000
Date: Wed, 10 Jun 2026 17:40:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4283/12670]
 net/mac80211/tests/chan-mode.c:256 test_determine_chan_mode() warn: passing
 freed memory 'elems' (line 252)
Message-ID: <202606101714.IyCeUwST-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Marco Elver <elver@google.com>
CC: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
CC: "Harry Yoo (Oracle)" <harry@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   49e02880ec0a8c378e811bc9d85da188d7c6204c
commit: feb662d9168b63e1d4c02671ec96005410c6f3ce [4283/12670] slab: support for compiler-assisted type-based slab cache partitioning
:::::: branch date: 15 hours ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-161-20260610 (https://download.01.org/0day-ci/archive/20260610/202606101714.IyCeUwST-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606101714.IyCeUwST-lkp@intel.com/

smatch warnings:
net/mac80211/tests/chan-mode.c:256 test_determine_chan_mode() warn: passing freed memory 'elems' (line 252)
net/mac80211/tests/chan-mode.c:256 test_determine_chan_mode() warn: passing zero to 'PTR_ERR'

vim +/elems +256 net/mac80211/tests/chan-mode.c

b46524b57afdde Benjamin Berg 2025-02-05  147  
b46524b57afdde Benjamin Berg 2025-02-05  148  static void test_determine_chan_mode(struct kunit *test)
b46524b57afdde Benjamin Berg 2025-02-05  149  {
b46524b57afdde Benjamin Berg 2025-02-05  150  	const struct determine_chan_mode_case *params = test->param_value;
b46524b57afdde Benjamin Berg 2025-02-05  151  	struct t_sdata *t_sdata = T_SDATA(test);
b46524b57afdde Benjamin Berg 2025-02-05  152  	struct ieee80211_conn_settings conn = {
b46524b57afdde Benjamin Berg 2025-02-05  153  		.mode = params->conn_mode,
75575e2d252afb Benjamin Berg 2025-08-26  154  		.bw_limit = params->conn_bw_limit,
b46524b57afdde Benjamin Berg 2025-02-05  155  	};
b46524b57afdde Benjamin Berg 2025-02-05  156  	struct cfg80211_bss cbss = {
b46524b57afdde Benjamin Berg 2025-02-05  157  		.channel = &t_sdata->band_5ghz.channels[0],
b46524b57afdde Benjamin Berg 2025-02-05  158  	};
b46524b57afdde Benjamin Berg 2025-02-05  159  	unsigned long userspace_selectors[BITS_TO_LONGS(128)] = {};
b46524b57afdde Benjamin Berg 2025-02-05  160  	u8 bss_ies[] = {
b46524b57afdde Benjamin Berg 2025-02-05  161  		/* Supported Rates */
b46524b57afdde Benjamin Berg 2025-02-05  162  		WLAN_EID_SUPP_RATES, 0x08,
b46524b57afdde Benjamin Berg 2025-02-05  163  		0x82, 0x84, 0x8b, 0x96, 0xc, 0x12, 0x18, 0x24,
b46524b57afdde Benjamin Berg 2025-02-05  164  		/* Extended Supported Rates */
b46524b57afdde Benjamin Berg 2025-02-05  165  		WLAN_EID_EXT_SUPP_RATES, 0x05,
b46524b57afdde Benjamin Berg 2025-02-05  166  		0x30, 0x48, 0x60, 0x6c, params->extra_supp_rate,
b46524b57afdde Benjamin Berg 2025-02-05  167  		/* HT Capabilities */
b46524b57afdde Benjamin Berg 2025-02-05  168  		WLAN_EID_HT_CAPABILITY, 0x1a,
b46524b57afdde Benjamin Berg 2025-02-05  169  		0x0c, 0x00, 0x1b, 0xff, 0xff, 0x00, 0x00, 0x00,
b46524b57afdde Benjamin Berg 2025-02-05  170  		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01,
b46524b57afdde Benjamin Berg 2025-02-05  171  		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
b46524b57afdde Benjamin Berg 2025-02-05  172  		0x00, 0x00,
b46524b57afdde Benjamin Berg 2025-02-05  173  		/* HT Information (0xff for 1 stream) */
b46524b57afdde Benjamin Berg 2025-02-05  174  		WLAN_EID_HT_OPERATION, 0x16,
b46524b57afdde Benjamin Berg 2025-02-05  175  		0x24, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0x00,
b46524b57afdde Benjamin Berg 2025-02-05  176  		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
b46524b57afdde Benjamin Berg 2025-02-05  177  		0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
b46524b57afdde Benjamin Berg 2025-02-05  178  		/* VHT Capabilities */
b46524b57afdde Benjamin Berg 2025-02-05  179  		WLAN_EID_VHT_CAPABILITY, 0xc,
b46524b57afdde Benjamin Berg 2025-02-05  180  		0x00, 0x00, 0x00, 0x00, 0xff, 0xff, 0x00, 0x00,
b46524b57afdde Benjamin Berg 2025-02-05  181  		0xff, 0xff, 0x00, 0x00,
b46524b57afdde Benjamin Berg 2025-02-05  182  		/* VHT Operation */
b46524b57afdde Benjamin Berg 2025-02-05  183  		WLAN_EID_VHT_OPERATION, 0x05,
b46524b57afdde Benjamin Berg 2025-02-05  184  		0x00, 0x00, 0x00,
b46524b57afdde Benjamin Berg 2025-02-05  185  		params->vht_basic_mcs_1_4_set ?
b46524b57afdde Benjamin Berg 2025-02-05  186  			params->vht_basic_mcs_1_4 :
b46524b57afdde Benjamin Berg 2025-02-05  187  			le16_get_bits(t_sdata->band_5ghz.vht_cap.vht_mcs.rx_mcs_map, 0xff),
b46524b57afdde Benjamin Berg 2025-02-05  188  		params->vht_basic_mcs_5_8_set ?
b46524b57afdde Benjamin Berg 2025-02-05  189  			params->vht_basic_mcs_5_8 :
b46524b57afdde Benjamin Berg 2025-02-05  190  			le16_get_bits(t_sdata->band_5ghz.vht_cap.vht_mcs.rx_mcs_map, 0xff00),
b46524b57afdde Benjamin Berg 2025-02-05  191  		/* HE Capabilities */
b46524b57afdde Benjamin Berg 2025-02-05  192  		WLAN_EID_EXTENSION, 0x16, WLAN_EID_EXT_HE_CAPABILITY,
b46524b57afdde Benjamin Berg 2025-02-05  193  		0x01, 0x78, 0xc8, 0x1a, 0x40, 0x00, 0x00, 0xbf,
b46524b57afdde Benjamin Berg 2025-02-05  194  		0xce, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
b46524b57afdde Benjamin Berg 2025-02-05  195  		0x00, 0xfa, 0xff, 0xfa, 0xff,
b46524b57afdde Benjamin Berg 2025-02-05  196  		/* HE Operation (permit overriding values) */
b46524b57afdde Benjamin Berg 2025-02-05  197  		WLAN_EID_EXTENSION, 0x07, WLAN_EID_EXT_HE_OPERATION,
b46524b57afdde Benjamin Berg 2025-02-05  198  		0xf0, 0x3f, 0x00, 0xb0,
b46524b57afdde Benjamin Berg 2025-02-05  199  		params->he_basic_mcs_1_4_set ? params->he_basic_mcs_1_4 : 0xfc,
b46524b57afdde Benjamin Berg 2025-02-05  200  		params->he_basic_mcs_5_8_set ? params->he_basic_mcs_5_8 : 0xff,
b46524b57afdde Benjamin Berg 2025-02-05  201  		/* EHT Capabilities */
b46524b57afdde Benjamin Berg 2025-02-05  202  		WLAN_EID_EXTENSION, 0x12, WLAN_EID_EXT_EHT_CAPABILITY,
b46524b57afdde Benjamin Berg 2025-02-05  203  		0x07, 0x00, 0x1c, 0x00, 0x00, 0xfe, 0xff, 0xff,
b46524b57afdde Benjamin Berg 2025-02-05  204  		0x7f, 0x01, 0x00, 0x88, 0x88, 0x88, 0x00, 0x00,
b46524b57afdde Benjamin Berg 2025-02-05  205  		0x00,
b46524b57afdde Benjamin Berg 2025-02-05  206  		/* EHT Operation */
75575e2d252afb Benjamin Berg 2025-08-26  207  		WLAN_EID_EXTENSION, 0x0b, WLAN_EID_EXT_EHT_OPERATION,
75575e2d252afb Benjamin Berg 2025-08-26  208  		0x03, params->eht_mcs7_min_nss ? params->eht_mcs7_min_nss : 0x11,
75575e2d252afb Benjamin Berg 2025-08-26  209  		0x00, 0x00, 0x00, params->eht_bw,
75575e2d252afb Benjamin Berg 2025-08-26  210  		params->eht_bw == IEEE80211_EHT_OPER_CHAN_WIDTH_80MHZ ? 42 : 36,
75575e2d252afb Benjamin Berg 2025-08-26  211  		0x00,
75575e2d252afb Benjamin Berg 2025-08-26  212  		u16_get_bits(params->eht_disabled_subchannels, 0xff),
75575e2d252afb Benjamin Berg 2025-08-26  213  		u16_get_bits(params->eht_disabled_subchannels, 0xff00),
b46524b57afdde Benjamin Berg 2025-02-05  214  	};
b46524b57afdde Benjamin Berg 2025-02-05  215  	struct ieee80211_chan_req chanreq = {};
b46524b57afdde Benjamin Berg 2025-02-05  216  	struct cfg80211_chan_def ap_chandef = {};
b46524b57afdde Benjamin Berg 2025-02-05  217  	struct ieee802_11_elems *elems;
b46524b57afdde Benjamin Berg 2025-02-05  218  
75575e2d252afb Benjamin Berg 2025-08-26  219  	/* To force EHT downgrade to HE on punctured 80 MHz downgraded to 40 MHz */
75575e2d252afb Benjamin Berg 2025-08-26  220  	set_bit(IEEE80211_HW_DISALLOW_PUNCTURING, t_sdata->local.hw.flags);
75575e2d252afb Benjamin Berg 2025-08-26  221  
b46524b57afdde Benjamin Berg 2025-02-05  222  	if (params->strict)
b46524b57afdde Benjamin Berg 2025-02-05  223  		set_bit(IEEE80211_HW_STRICT, t_sdata->local.hw.flags);
b46524b57afdde Benjamin Berg 2025-02-05  224  	else
b46524b57afdde Benjamin Berg 2025-02-05  225  		clear_bit(IEEE80211_HW_STRICT, t_sdata->local.hw.flags);
b46524b57afdde Benjamin Berg 2025-02-05  226  
b46524b57afdde Benjamin Berg 2025-02-05  227  	t_sdata->sdata->u.mgd.ht_capa_mask = params->ht_capa_mask;
b46524b57afdde Benjamin Berg 2025-02-05  228  	t_sdata->sdata->u.mgd.vht_capa = params->vht_capa;
b46524b57afdde Benjamin Berg 2025-02-05  229  	t_sdata->sdata->u.mgd.vht_capa_mask = params->vht_capa_mask;
b46524b57afdde Benjamin Berg 2025-02-05  230  
b46524b57afdde Benjamin Berg 2025-02-05  231  	if (params->userspace_selector)
b46524b57afdde Benjamin Berg 2025-02-05  232  		set_bit(params->userspace_selector, userspace_selectors);
b46524b57afdde Benjamin Berg 2025-02-05  233  
b46524b57afdde Benjamin Berg 2025-02-05  234  	rcu_assign_pointer(cbss.ies,
b46524b57afdde Benjamin Berg 2025-02-05  235  			   kunit_kzalloc(test,
b46524b57afdde Benjamin Berg 2025-02-05  236  					 sizeof(cbss) + sizeof(bss_ies),
b46524b57afdde Benjamin Berg 2025-02-05  237  					 GFP_KERNEL));
b46524b57afdde Benjamin Berg 2025-02-05  238  	KUNIT_ASSERT_NOT_NULL(test, rcu_access_pointer(cbss.ies));
b46524b57afdde Benjamin Berg 2025-02-05  239  	((struct cfg80211_bss_ies *)rcu_access_pointer(cbss.ies))->len = sizeof(bss_ies);
b46524b57afdde Benjamin Berg 2025-02-05  240  
b46524b57afdde Benjamin Berg 2025-02-05  241  	memcpy((void *)rcu_access_pointer(cbss.ies)->data, bss_ies,
b46524b57afdde Benjamin Berg 2025-02-05  242  	       sizeof(bss_ies));
b46524b57afdde Benjamin Berg 2025-02-05  243  
b46524b57afdde Benjamin Berg 2025-02-05  244  	rcu_read_lock();
b46524b57afdde Benjamin Berg 2025-02-05  245  	elems = ieee80211_determine_chan_mode(t_sdata->sdata, &conn, &cbss,
b46524b57afdde Benjamin Berg 2025-02-05  246  					      0, &chanreq, &ap_chandef,
b46524b57afdde Benjamin Berg 2025-02-05  247  					      userspace_selectors);
b46524b57afdde Benjamin Berg 2025-02-05  248  	rcu_read_unlock();
b46524b57afdde Benjamin Berg 2025-02-05  249  
b46524b57afdde Benjamin Berg 2025-02-05  250  	/* We do not need elems, free them if they are valid. */
b46524b57afdde Benjamin Berg 2025-02-05  251  	if (!IS_ERR_OR_NULL(elems))
b46524b57afdde Benjamin Berg 2025-02-05 @252  		kfree(elems);
b46524b57afdde Benjamin Berg 2025-02-05  253  
b46524b57afdde Benjamin Berg 2025-02-05  254  	if (params->error) {
b46524b57afdde Benjamin Berg 2025-02-05  255  		KUNIT_ASSERT_TRUE(test, IS_ERR(elems));
b46524b57afdde Benjamin Berg 2025-02-05 @256  		KUNIT_ASSERT_EQ(test, PTR_ERR(elems), -params->error);
b46524b57afdde Benjamin Berg 2025-02-05  257  	} else {
b46524b57afdde Benjamin Berg 2025-02-05  258  		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, elems);
b46524b57afdde Benjamin Berg 2025-02-05  259  		KUNIT_ASSERT_EQ(test, conn.mode, params->expected_mode);
75575e2d252afb Benjamin Berg 2025-08-26  260  		KUNIT_ASSERT_EQ(test, conn.bw_limit, params->expected_bw_limit);
b46524b57afdde Benjamin Berg 2025-02-05  261  	}
b46524b57afdde Benjamin Berg 2025-02-05  262  }
b46524b57afdde Benjamin Berg 2025-02-05  263  

:::::: The code at line 256 was first introduced by commit
:::::: b46524b57afdde8ed9ee9567e78d1293ad0e6ea7 wifi: mac80211: tests: add tests for ieee80211_determine_chan_mode

:::::: TO: Benjamin Berg <benjamin.berg@intel.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
