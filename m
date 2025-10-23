Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2B022068B
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Oct 2025 05:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761196725; cv=none; b=bRD0av1BcovAAtP43KWqrZRV9dTso3mhDOzHwESWno4ITuF3M2Qtxs8/3FxvKInjA7my5v31rp5tKulTx5IBHvFphKHms3cKz12lmCJpIrv6+U7qvScr03m+CoGpg1CI9HGTErTMhBNXgGzsiQ8nzKqKhclANVDRLTSlTAZy5C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761196725; c=relaxed/simple;
	bh=TQun1d6GSIb/DO7cjK9ujuRpe4Mjk+lH/CW9B8aRbZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ukfW25o+se/yAM2QEEl9JnRJjTREiexC+sT/b0U2nSz3BuBNwxint2BvyGEruvWb6JO3Ek8Jt6QJounR6byuPo9NJuZKcu01NO4OedmRnkkBn7+zrh6BAmyoqJOjhlcG/krCc9vh7rOWccLwhZIxR7VXsgsv/mDYh26Fr9zxMuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SEWt4zP9; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SEWt4zP9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761196724; x=1792732724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TQun1d6GSIb/DO7cjK9ujuRpe4Mjk+lH/CW9B8aRbZg=;
  b=SEWt4zP9IlRPw9deLaKE4PS+VYxaWqxFQsk6nuDWiG38PBL1enhYDkyf
   ++zNyUrmYO570V42brzFqPuRFtM6W8Hrm4raGKY6vpmwvtL+AlwYNXhh6
   /6OvCJiB2POEhlN9nqO8gLs9w89wivHFq8NnCWM4+Wdktmnsyi0mrzGRZ
   AnAGjSARrZ6m3/mtPkURyj+VIXi7h+joMvQc8j7X7VCiIPC55WtM9gn42
   c+Lz1ZSgZkkgi56k9pSlzIIyDDa6u8Swmd05EiYF8qyBudbSakg8VK3Ah
   nH5SOJAnY4JZ8u1pNTc9Fc4c4bzgP6akf2L8obeBtHsm4bm6UaDy+5gU3
   Q==;
X-CSE-ConnectionGUID: aD2U7MnERvCZjRfh3rNx6w==
X-CSE-MsgGUID: R8x+Pi/lSqWvqnPTEEkPbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80792765"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="80792765"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 22:18:43 -0700
X-CSE-ConnectionGUID: /xdputIXQO2oprXpK7yvvQ==
X-CSE-MsgGUID: UX+GWG1DQv+CiSMLOArBSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="188460492"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 22 Oct 2025 22:18:42 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBnih-000D3W-33;
	Thu, 23 Oct 2025 05:18:39 +0000
Date: Thu, 23 Oct 2025 13:18:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [l1k:doe 12/12] lib/spdm/req-netlink.c:123 spdm_netlink_sig_event()
 warn: missing unwind goto?
Message-ID: <202510231302.hW7zNvXa-lkp@intel.com>
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
TO: Lukas Wunner <lukas@wunner.de>

tree:   https://github.com/l1k/linux doe
head:   7505d39770b6e267ed934902a491e499ab4e6153
commit: 7505d39770b6e267ed934902a491e499ab4e6153 [12/12] spdm: Multicast received signatures via netlink
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: loongarch-randconfig-r072-20251019 (https://download.01.org/0day-ci/archive/20251023/202510231302.hW7zNvXa-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510231302.hW7zNvXa-lkp@intel.com/

smatch warnings:
lib/spdm/req-netlink.c:123 spdm_netlink_sig_event() warn: missing unwind goto?

vim +123 lib/spdm/req-netlink.c

7505d39770b6e26 Lukas Wunner 2024-04-11   12  
7505d39770b6e26 Lukas Wunner 2024-04-11   13  int spdm_netlink_sig_event(struct spdm_state *spdm_state,
7505d39770b6e26 Lukas Wunner 2024-04-11   14  			   enum spdm_reqrsp_code rsp_code, u8 slot,
7505d39770b6e26 Lukas Wunner 2024-04-11   15  			   size_t req_nonce_off, size_t rsp_nonce_off,
7505d39770b6e26 Lukas Wunner 2024-04-11   16  			   const char *spdm_context)
7505d39770b6e26 Lukas Wunner 2024-04-11   17  {
7505d39770b6e26 Lukas Wunner 2024-04-11   18  	unsigned int seq, msg_sz, nr_msgs, nr_pages, nr_frags;
7505d39770b6e26 Lukas Wunner 2024-04-11   19  	char *devpath __free(kfree) = NULL;
7505d39770b6e26 Lukas Wunner 2024-04-11   20  	struct sk_buff *msg;
7505d39770b6e26 Lukas Wunner 2024-04-11   21  	struct nlattr *nla;
7505d39770b6e26 Lukas Wunner 2024-04-11   22  	void *hdr, *ptr;
7505d39770b6e26 Lukas Wunner 2024-04-11   23  	int rc, i;
7505d39770b6e26 Lukas Wunner 2024-04-11   24  
7505d39770b6e26 Lukas Wunner 2024-04-11   25  	if (!genl_has_listeners(&spdm_nl_family, &init_net, SPDM_NLGRP_SIG))
7505d39770b6e26 Lukas Wunner 2024-04-11   26  		return 0;
7505d39770b6e26 Lukas Wunner 2024-04-11   27  
7505d39770b6e26 Lukas Wunner 2024-04-11   28  	devpath = kobject_get_path(&spdm_state->dev->kobj, GFP_KERNEL);
7505d39770b6e26 Lukas Wunner 2024-04-11   29  	if (!devpath)
7505d39770b6e26 Lukas Wunner 2024-04-11   30  		return -ENOMEM;
7505d39770b6e26 Lukas Wunner 2024-04-11   31  
7505d39770b6e26 Lukas Wunner 2024-04-11   32  	nr_pages = spdm_state->transcript_max / PAGE_SIZE;
7505d39770b6e26 Lukas Wunner 2024-04-11   33  	nr_msgs = DIV_ROUND_UP(nr_pages, MAX_SKB_FRAGS);
7505d39770b6e26 Lukas Wunner 2024-04-11   34  
7505d39770b6e26 Lukas Wunner 2024-04-11   35  	/* Calculate exact size to avoid reallocation by netlink_trim() */
7505d39770b6e26 Lukas Wunner 2024-04-11   36  	msg_sz = nlmsg_total_size(genlmsg_msg_size(
7505d39770b6e26 Lukas Wunner 2024-04-11   37  			nla_total_size(strlen(devpath)) +
7505d39770b6e26 Lukas Wunner 2024-04-11   38  			nla_total_size(sizeof(u8)) +
7505d39770b6e26 Lukas Wunner 2024-04-11   39  			nla_total_size(sizeof(u8)) +
7505d39770b6e26 Lukas Wunner 2024-04-11   40  			nla_total_size(sizeof(u16)) +
7505d39770b6e26 Lukas Wunner 2024-04-11   41  			nla_total_size(sizeof(u32)) +
7505d39770b6e26 Lukas Wunner 2024-04-11   42  			nla_total_size(sizeof(u32)) +
7505d39770b6e26 Lukas Wunner 2024-04-11   43  			nla_total_size(sizeof(u32)) +
7505d39770b6e26 Lukas Wunner 2024-04-11   44  			nla_total_size(SPDM_COMBINED_PREFIX_SZ) +
7505d39770b6e26 Lukas Wunner 2024-04-11   45  			nla_total_size(0)));
7505d39770b6e26 Lukas Wunner 2024-04-11   46  
7505d39770b6e26 Lukas Wunner 2024-04-11   47  	msg = genlmsg_new(msg_sz, GFP_KERNEL);
7505d39770b6e26 Lukas Wunner 2024-04-11   48  	if (!msg)
7505d39770b6e26 Lukas Wunner 2024-04-11   49  		return -ENOMEM;
7505d39770b6e26 Lukas Wunner 2024-04-11   50  
7505d39770b6e26 Lukas Wunner 2024-04-11   51  	hdr = genlmsg_put(msg, 0, 0, &spdm_nl_family,
7505d39770b6e26 Lukas Wunner 2024-04-11   52  			  nr_msgs > 1 ? NLM_F_MULTI : 0, SPDM_CMD_SIG);
7505d39770b6e26 Lukas Wunner 2024-04-11   53  	if (!hdr) {
7505d39770b6e26 Lukas Wunner 2024-04-11   54  		rc = -EMSGSIZE;
7505d39770b6e26 Lukas Wunner 2024-04-11   55  		goto err_free_msg;
7505d39770b6e26 Lukas Wunner 2024-04-11   56  	}
7505d39770b6e26 Lukas Wunner 2024-04-11   57  
7505d39770b6e26 Lukas Wunner 2024-04-11   58  	if (nla_put_string(msg, SPDM_A_SIG_DEVICE, devpath) ||
7505d39770b6e26 Lukas Wunner 2024-04-11   59  	    nla_put_u8(msg, SPDM_A_SIG_RSP_CODE, rsp_code) ||
7505d39770b6e26 Lukas Wunner 2024-04-11   60  	    nla_put_u8(msg, SPDM_A_SIG_SLOT, slot) ||
7505d39770b6e26 Lukas Wunner 2024-04-11   61  	    nla_put_u16(msg, SPDM_A_SIG_HASH_ALGO,
7505d39770b6e26 Lukas Wunner 2024-04-11   62  			spdm_state->base_hash_alg) ||
7505d39770b6e26 Lukas Wunner 2024-04-11   63  	    nla_put_u32(msg, SPDM_A_SIG_SIG_OFFSET,
7505d39770b6e26 Lukas Wunner 2024-04-11   64  			spdm_state->transcript_end - spdm_state->transcript -
7505d39770b6e26 Lukas Wunner 2024-04-11   65  		        spdm_state->sig_len) ||
7505d39770b6e26 Lukas Wunner 2024-04-11   66  	    nla_put_u32(msg, SPDM_A_SIG_REQ_NONCE_OFFSET, req_nonce_off) ||
7505d39770b6e26 Lukas Wunner 2024-04-11   67  	    nla_put_u32(msg, SPDM_A_SIG_RSP_NONCE_OFFSET, rsp_nonce_off)) {
7505d39770b6e26 Lukas Wunner 2024-04-11   68  		rc = -EMSGSIZE;
7505d39770b6e26 Lukas Wunner 2024-04-11   69  		goto err_cancel_msg;
7505d39770b6e26 Lukas Wunner 2024-04-11   70  	}
7505d39770b6e26 Lukas Wunner 2024-04-11   71  
7505d39770b6e26 Lukas Wunner 2024-04-11   72  	if (spdm_state->version >= 0x12) {
7505d39770b6e26 Lukas Wunner 2024-04-11   73  		nla = nla_reserve(msg, SPDM_A_SIG_COMBINED_SPDM_PREFIX,
7505d39770b6e26 Lukas Wunner 2024-04-11   74  				  SPDM_COMBINED_PREFIX_SZ);
7505d39770b6e26 Lukas Wunner 2024-04-11   75  		if (!nla) {
7505d39770b6e26 Lukas Wunner 2024-04-11   76  			rc = -EMSGSIZE;
7505d39770b6e26 Lukas Wunner 2024-04-11   77  			goto err_cancel_msg;
7505d39770b6e26 Lukas Wunner 2024-04-11   78  		}
7505d39770b6e26 Lukas Wunner 2024-04-11   79  
7505d39770b6e26 Lukas Wunner 2024-04-11   80  		spdm_create_combined_prefix(spdm_state->version, spdm_context,
7505d39770b6e26 Lukas Wunner 2024-04-11   81  					    nla_data(nla));
7505d39770b6e26 Lukas Wunner 2024-04-11   82  	}
7505d39770b6e26 Lukas Wunner 2024-04-11   83  
7505d39770b6e26 Lukas Wunner 2024-04-11   84  	ptr = spdm_state->transcript;
7505d39770b6e26 Lukas Wunner 2024-04-11   85  
7505d39770b6e26 Lukas Wunner 2024-04-11   86  	/* Loop over Netlink messages - break condition is in loop body */
7505d39770b6e26 Lukas Wunner 2024-04-11   87  	for (seq = 1; ; seq++) {
7505d39770b6e26 Lukas Wunner 2024-04-11   88  		nla = nla_reserve(msg, SPDM_A_SIG_TRANSCRIPT, 0);
7505d39770b6e26 Lukas Wunner 2024-04-11   89  		if (!nla) {
7505d39770b6e26 Lukas Wunner 2024-04-11   90  			rc = -EMSGSIZE;
7505d39770b6e26 Lukas Wunner 2024-04-11   91  			goto err_cancel_msg;
7505d39770b6e26 Lukas Wunner 2024-04-11   92  		}
7505d39770b6e26 Lukas Wunner 2024-04-11   93  
7505d39770b6e26 Lukas Wunner 2024-04-11   94  		nr_frags = min(nr_pages, MAX_SKB_FRAGS);
7505d39770b6e26 Lukas Wunner 2024-04-11   95  		nla->nla_len = nr_frags * PAGE_SIZE;
7505d39770b6e26 Lukas Wunner 2024-04-11   96  		nr_pages -= nr_frags;
7505d39770b6e26 Lukas Wunner 2024-04-11   97  
7505d39770b6e26 Lukas Wunner 2024-04-11   98  		/* Loop over fragments of this Netlink message */
7505d39770b6e26 Lukas Wunner 2024-04-11   99  		for (i = 0; i < nr_frags; i++) {
7505d39770b6e26 Lukas Wunner 2024-04-11  100  			struct page *page = vmalloc_to_page(ptr);
7505d39770b6e26 Lukas Wunner 2024-04-11  101  			size_t remainder = spdm_state->transcript_end - ptr;
7505d39770b6e26 Lukas Wunner 2024-04-11  102  			size_t sz = min(remainder, PAGE_SIZE);
7505d39770b6e26 Lukas Wunner 2024-04-11  103  
7505d39770b6e26 Lukas Wunner 2024-04-11  104  			get_page(page);
7505d39770b6e26 Lukas Wunner 2024-04-11  105  			skb_add_rx_frag(msg, i, page, 0, sz, sz);
7505d39770b6e26 Lukas Wunner 2024-04-11  106  			ptr += PAGE_SIZE;
7505d39770b6e26 Lukas Wunner 2024-04-11  107  		}
7505d39770b6e26 Lukas Wunner 2024-04-11  108  
7505d39770b6e26 Lukas Wunner 2024-04-11  109  		genlmsg_end(msg, hdr);
7505d39770b6e26 Lukas Wunner 2024-04-11  110  		rc = genlmsg_multicast(&spdm_nl_family, msg, 0,
7505d39770b6e26 Lukas Wunner 2024-04-11  111  				       SPDM_NLGRP_SIG, GFP_KERNEL);
7505d39770b6e26 Lukas Wunner 2024-04-11  112  		if (rc)
7505d39770b6e26 Lukas Wunner 2024-04-11  113  			return rc;
7505d39770b6e26 Lukas Wunner 2024-04-11  114  
7505d39770b6e26 Lukas Wunner 2024-04-11  115  		if (nr_pages == 0) /* End of loop - entire transcript sent */
7505d39770b6e26 Lukas Wunner 2024-04-11  116  			break;
7505d39770b6e26 Lukas Wunner 2024-04-11  117  
7505d39770b6e26 Lukas Wunner 2024-04-11  118  		/* Start new message for remainder of transcript */
7505d39770b6e26 Lukas Wunner 2024-04-11  119  		msg_sz = nlmsg_total_size(genlmsg_msg_size(nla_total_size(0)));
7505d39770b6e26 Lukas Wunner 2024-04-11  120  
7505d39770b6e26 Lukas Wunner 2024-04-11  121  		msg = genlmsg_new(msg_sz, GFP_KERNEL);
7505d39770b6e26 Lukas Wunner 2024-04-11  122  		if (!msg)
7505d39770b6e26 Lukas Wunner 2024-04-11 @123  			return -ENOMEM;
7505d39770b6e26 Lukas Wunner 2024-04-11  124  
7505d39770b6e26 Lukas Wunner 2024-04-11  125  		hdr = genlmsg_put(msg, 0, seq, &spdm_nl_family,
7505d39770b6e26 Lukas Wunner 2024-04-11  126  				  NLM_F_MULTI, SPDM_CMD_SIG);
7505d39770b6e26 Lukas Wunner 2024-04-11  127  		if (!hdr) {
7505d39770b6e26 Lukas Wunner 2024-04-11  128  			rc = -EMSGSIZE;
7505d39770b6e26 Lukas Wunner 2024-04-11  129  			goto err_free_msg;
7505d39770b6e26 Lukas Wunner 2024-04-11  130  		}
7505d39770b6e26 Lukas Wunner 2024-04-11  131  	}
7505d39770b6e26 Lukas Wunner 2024-04-11  132  
7505d39770b6e26 Lukas Wunner 2024-04-11  133  	return 0;
7505d39770b6e26 Lukas Wunner 2024-04-11  134  
7505d39770b6e26 Lukas Wunner 2024-04-11  135  err_cancel_msg:
7505d39770b6e26 Lukas Wunner 2024-04-11  136  	nlmsg_cancel(msg, hdr);
7505d39770b6e26 Lukas Wunner 2024-04-11  137  err_free_msg:
7505d39770b6e26 Lukas Wunner 2024-04-11  138  	nlmsg_free(msg);
7505d39770b6e26 Lukas Wunner 2024-04-11  139  	return rc;
7505d39770b6e26 Lukas Wunner 2024-04-11  140  }
7505d39770b6e26 Lukas Wunner 2024-04-11  141  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
