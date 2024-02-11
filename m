Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2837E7472
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Feb 2024 05:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707629572; cv=none; b=rHLk4ikzSbwvjb6YUK0hu1DuK5kBdrSsu4O5r+wXPFaFUGiNWAU1Vjw0VBtunoGwdHGuGjkFZboi5rxrbXLiS8XdUAScpnE4MgSnscL7ZEzNcfIZWiWgec00Cc1bQyX/f/DF9W7Ap2G0wlHZkJfhhFdxNwBfNADc+3z//+3bZ10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707629572; c=relaxed/simple;
	bh=MMsg7W7h1UaazMhVyXl6tyqSEo67VA0jjtFkOUkmyUs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tyTdydbr8CwT1ZAW+jpNLZo346KwjxSBhNtR1nWnLSUaeB0ilVxpLXp8Lg3RBQIfV3hEWb9T/xaO2ZVnaz/4Oz9pA9EXydrm6aWGHVXMq9+lMEuQOaHxYhwbusg/AHuw81Wl3ZZ1V3TqopNmVQvntcwtkySHguy6RBdyILWDTG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CHRdVEdv; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CHRdVEdv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707629570; x=1739165570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MMsg7W7h1UaazMhVyXl6tyqSEo67VA0jjtFkOUkmyUs=;
  b=CHRdVEdvazjP0UVG9IRn4ui7BvM0v0Ow05o7hajrOnOO0cop1GfqXdRc
   EQN0Bi2O+IjY0pnbqtf5u5DKKbkrH+gL5yNx0Vj6MI/gN4wPscJ7PtnXD
   WdiBcn4rrijvaX8FcXbd1BSqjpOSFY0zX+L/QshqzEak/aGMeOx7KdF15
   +H2pAHATemafnnCZ9l0bMKC0NGNQx6xVBl7QeESrgG+jF/VgatkvlwLNs
   Cw6DWNS9i/sVwdj0HpIoQrhfqx7XMLPi0gibN6MoKbl+v94Epj55CKGEv
   O7WC6DrCC0ypIueUi357JMzZDs8FSFzo05DteM1kGmTRYsDPOIQI7FWL1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10980"; a="1497757"
X-IronPort-AV: E=Sophos;i="6.05,260,1701158400"; 
   d="scan'208";a="1497757"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 21:32:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,260,1701158400"; 
   d="scan'208";a="7060176"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Feb 2024 21:32:48 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZ2SL-0006Ly-1L;
	Sun, 11 Feb 2024 05:32:45 +0000
Date: Sun, 11 Feb 2024 13:32:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2259/5901] arp_tables.c:(.text+0x1c): relocation
 truncated to fit: R_NIOS2_CALL26 against `xt_find_table'
Message-ID: <202402111317.WPmbzZp3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Florian Westphal <fw@strlen.de>
CC: Phil Sutter <phil@nwl.cc>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   445a555e0623387fa9b94e68e61681717e70200a
commit: 4654467dc7e111e84f43ed1b70322873ae77e7be [2259/5901] netfilter: arptables: allow xtables-nft only builds
:::::: branch date: 2 days ago
:::::: commit date: 13 days ago
config: nios2-randconfig-r052-20240210 (https://download.01.org/0day-ci/archive/20240211/202402111317.WPmbzZp3-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240211/202402111317.WPmbzZp3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402111317.WPmbzZp3-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `arpt_unregister_table_pre_exit':
   arp_tables.c:(.text+0x1c): undefined reference to `xt_find_table'
>> arp_tables.c:(.text+0x1c): relocation truncated to fit: R_NIOS2_CALL26 against `xt_find_table'
   nios2-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `arp_tables_net_exit':
   arp_tables.c:(.text+0x70): undefined reference to `xt_proto_fini'
>> arp_tables.c:(.text+0x70): relocation truncated to fit: R_NIOS2_CALL26 against `xt_proto_fini'
   nios2-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `arp_tables_net_init':
   arp_tables.c:(.text+0x94): undefined reference to `xt_proto_init'
>> arp_tables.c:(.text+0x94): relocation truncated to fit: R_NIOS2_CALL26 against `xt_proto_init'
   nios2-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `mark_source_chains':
   arp_tables.c:(.text+0x49c): undefined reference to `xt_find_jump_offset'
>> arp_tables.c:(.text+0x49c): relocation truncated to fit: R_NIOS2_CALL26 against `xt_find_jump_offset'
   nios2-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `translate_table':
   arp_tables.c:(.text+0x51c): undefined reference to `xt_alloc_entry_offsets'
>> arp_tables.c:(.text+0x51c): relocation truncated to fit: R_NIOS2_CALL26 against `xt_alloc_entry_offsets'
>> nios2-linux-ld: arp_tables.c:(.text+0x59c): undefined reference to `xt_check_entry_offsets'
>> arp_tables.c:(.text+0x59c): relocation truncated to fit: R_NIOS2_CALL26 against `xt_check_entry_offsets'
>> nios2-linux-ld: arp_tables.c:(.text+0x75c): undefined reference to `xt_check_table_hooks'
>> arp_tables.c:(.text+0x75c): relocation truncated to fit: R_NIOS2_CALL26 against `xt_check_table_hooks'
>> nios2-linux-ld: arp_tables.c:(.text+0x7d4): undefined reference to `xt_percpu_counter_alloc'
>> arp_tables.c:(.text+0x7d4): relocation truncated to fit: R_NIOS2_CALL26 against `xt_percpu_counter_alloc'
>> nios2-linux-ld: arp_tables.c:(.text+0x7f4): undefined reference to `xt_request_find_target'
>> arp_tables.c:(.text+0x7f4): relocation truncated to fit: R_NIOS2_CALL26 against `xt_request_find_target'
>> nios2-linux-ld: arp_tables.c:(.text+0x850): undefined reference to `xt_check_target'
>> arp_tables.c:(.text+0x850): relocation truncated to fit: R_NIOS2_CALL26 against `xt_check_target'
>> nios2-linux-ld: arp_tables.c:(.text+0x864): undefined reference to `xt_percpu_counter_free'
   arp_tables.c:(.text+0x864): additional relocation overflows omitted from the output
   nios2-linux-ld: arp_tables.c:(.text+0x8d8): undefined reference to `xt_percpu_counter_free'
   nios2-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `copy_entries_to_user.isra.0':
   arp_tables.c:(.text+0x97c): undefined reference to `xt_recseq'
>> nios2-linux-ld: arp_tables.c:(.text+0x980): undefined reference to `xt_recseq'
   nios2-linux-ld: arp_tables.c:(.text+0x99c): undefined reference to `xt_recseq'
   nios2-linux-ld: arp_tables.c:(.text+0x9a0): undefined reference to `xt_recseq'
>> nios2-linux-ld: arp_tables.c:(.text+0xa80): undefined reference to `xt_target_to_user'
   nios2-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `get_info':
   arp_tables.c:(.text+0xb94): undefined reference to `xt_request_find_table_lock'
>> nios2-linux-ld: arp_tables.c:(.text+0xc50): undefined reference to `xt_table_unlock'
   nios2-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `arpt_do_table':
   arp_tables.c:(.text+0x1018): undefined reference to `xt_recseq'
   nios2-linux-ld: arp_tables.c:(.text+0x101c): undefined reference to `xt_recseq'
   nios2-linux-ld: arp_tables.c:(.text+0x1030): undefined reference to `xt_recseq'
   nios2-linux-ld: arp_tables.c:(.text+0x1034): undefined reference to `xt_recseq'
   nios2-linux-ld: arp_tables.c:(.text+0x1158): undefined reference to `xt_recseq'
   nios2-linux-ld: net/ipv4/netfilter/arp_tables.o:arp_tables.c:(.text+0x115c): more undefined references to `xt_recseq' follow
   nios2-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `arpt_unregister_table':
   arp_tables.c:(.text+0x12e0): undefined reference to `xt_find_table'
>> nios2-linux-ld: arp_tables.c:(.text+0x12ec): undefined reference to `xt_unregister_table'
   nios2-linux-ld: arp_tables.c:(.text+0x134c): undefined reference to `xt_percpu_counter_free'
   nios2-linux-ld: arp_tables.c:(.text+0x1368): undefined reference to `xt_free_table_info'
   nios2-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `do_arpt_get_ctl':
   arp_tables.c:(.text+0x14e8): undefined reference to `xt_find_table_lock'
   nios2-linux-ld: arp_tables.c:(.text+0x1514): undefined reference to `xt_table_unlock'
   nios2-linux-ld: arp_tables.c:(.text+0x157c): undefined reference to `xt_find_revision'
   nios2-linux-ld: arp_tables.c:(.text+0x15f4): undefined reference to `xt_find_revision'
   nios2-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `__do_replace':
   arp_tables.c:(.text+0x1644): undefined reference to `xt_counters_alloc'
   nios2-linux-ld: arp_tables.c:(.text+0x165c): undefined reference to `xt_request_find_table_lock'
   nios2-linux-ld: arp_tables.c:(.text+0x167c): undefined reference to `xt_table_unlock'
   nios2-linux-ld: arp_tables.c:(.text+0x16d4): undefined reference to `xt_replace_table'
   nios2-linux-ld: arp_tables.c:(.text+0x16e4): undefined reference to `xt_table_unlock'
   nios2-linux-ld: arp_tables.c:(.text+0x17c0): undefined reference to `xt_percpu_counter_free'
   nios2-linux-ld: arp_tables.c:(.text+0x17dc): undefined reference to `xt_free_table_info'
   nios2-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `do_replace.isra.0':
   arp_tables.c:(.text+0x18d8): undefined reference to `xt_alloc_table_info'
   nios2-linux-ld: arp_tables.c:(.text+0x1928): undefined reference to `xt_free_table_info'
   nios2-linux-ld: arp_tables.c:(.text+0x1a44): undefined reference to `xt_percpu_counter_free'
   nios2-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `do_arpt_set_ctl':
   arp_tables.c:(.text+0x1b48): undefined reference to `xt_copy_counters'
   nios2-linux-ld: arp_tables.c:(.text+0x1b64): undefined reference to `xt_find_table_lock'
   nios2-linux-ld: arp_tables.c:(.text+0x1bac): undefined reference to `xt_table_unlock'
   nios2-linux-ld: arp_tables.c:(.text+0x1c14): undefined reference to `xt_recseq'
   nios2-linux-ld: arp_tables.c:(.text+0x1c18): undefined reference to `xt_recseq'
   nios2-linux-ld: arp_tables.c:(.text+0x1c1c): undefined reference to `xt_recseq'
   nios2-linux-ld: arp_tables.c:(.text+0x1c2c): undefined reference to `xt_recseq'
   nios2-linux-ld: arp_tables.c:(.text+0x1cac): undefined reference to `xt_recseq'
   nios2-linux-ld: net/ipv4/netfilter/arp_tables.o:arp_tables.c:(.text+0x1cb0): more undefined references to `xt_recseq' follow
   nios2-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `arpt_register_table':
   arp_tables.c:(.text+0x1d2c): undefined reference to `xt_alloc_table_info'
   nios2-linux-ld: arp_tables.c:(.text+0x1d78): undefined reference to `xt_register_table'
   nios2-linux-ld: arp_tables.c:(.text+0x1da0): undefined reference to `xt_unregister_table'
   nios2-linux-ld: arp_tables.c:(.text+0x1e08): undefined reference to `xt_percpu_counter_free'
   nios2-linux-ld: arp_tables.c:(.text+0x1e24): undefined reference to `xt_free_table_info'
   nios2-linux-ld: arp_tables.c:(.text+0x1ec4): undefined reference to `xt_free_table_info'
   nios2-linux-ld: arp_tables.c:(.text+0x1f28): undefined reference to `xt_percpu_counter_free'
   nios2-linux-ld: arp_tables.c:(.text+0x1f44): undefined reference to `xt_free_table_info'
   nios2-linux-ld: net/ipv4/netfilter/arp_tables.o: in function `arp_tables_init':
   arp_tables.c:(.init.text+0x2c): undefined reference to `xt_register_targets'
   nios2-linux-ld: arp_tables.c:(.init.text+0x58): undefined reference to `xt_unregister_targets'
   nios2-linux-ld: net/ipv4/netfilter/arptable_filter.o: in function `arptable_filter_init':
   arptable_filter.c:(.init.text+0x1c): undefined reference to `xt_register_template'
   nios2-linux-ld: arptable_filter.c:(.init.text+0x38): undefined reference to `xt_hook_ops_alloc'
   nios2-linux-ld: arptable_filter.c:(.init.text+0x54): undefined reference to `xt_unregister_template'
   nios2-linux-ld: arptable_filter.c:(.init.text+0x80): undefined reference to `xt_unregister_template'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
