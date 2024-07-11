Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21791158878
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jul 2024 10:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720693797; cv=none; b=ovXKpnGC8cATAY5O1iByTddbPU+ayoUJGv4upbhZCUOH6JrLSFhCj0IxfwEER3lJ8TGTI5/OQZstC+FUDk0tBk1A0UffTeQpql2K48B657HiFEa7A/Y2KpHRTpeBcuwDHybglIz2dLQ9y4f229zUNREimj3u9AB9sHvHy6N+Pm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720693797; c=relaxed/simple;
	bh=tzpXGmd+27jnFnXsKxDdLxqKRek3cPR/UMRRqtw8u4E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Md9zJx5T4+qxjkOVpYYGXKYkSXG9xqBNdyQZSQENBazFDkwtzLjzTMqeZhfBQMvvz+rvTA78I8H3MjMGBtQxLrskBwzv46VPIzYUP46fn1vaOIBTW871oPgqET10iEO3VP+DWY27MAR3B4YH3i9JEuUb1O+RU9Pwh0/iWMQNb0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a9yKmX7X; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a9yKmX7X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720693795; x=1752229795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tzpXGmd+27jnFnXsKxDdLxqKRek3cPR/UMRRqtw8u4E=;
  b=a9yKmX7XhCDk4JyzBNsq1M7+IvsBSGgtyLyxSwbr8xw43knEz8rRrJIW
   sssA5ia8KjR2G3k90wZ9qzLR9chgmCsIBMnd8e9qyxd1rAduvr8QypvVA
   0/3habT9FKD/uR4Fy28rCdGgfqjANK9sAofxb9bAouOKcZqM2zAjM1xpe
   p2roaSz9IF66CRLlRutcStEOIZfLruNjNFWF459gonkEp3bpkWnPf+dcj
   2zo0XlKq0+vAQNIOc1sPkQtsKysCU1J5fQaL1/VYDFkQptcshuVBrR1ML
   ZF0cIKkqgCJC0AU7EMGHUyelYpsb4KaYUodfLtpUtnJ0Y30mr9aINf19J
   Q==;
X-CSE-ConnectionGUID: gHc7w0qlR8WlpQEm+teijQ==
X-CSE-MsgGUID: 0n0t22ZETE6mh4Ri4KKkbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="29467712"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="29467712"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 03:29:21 -0700
X-CSE-ConnectionGUID: /QiLD7c5QnuikIqHnX06QQ==
X-CSE-MsgGUID: cFPSXDXzQ4OsBCVKO3eCDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="86014966"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Jul 2024 03:29:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRr37-000Z9e-1B;
	Thu, 11 Jul 2024 10:29:17 +0000
Date: Thu, 11 Jul 2024 18:29:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [gustavoars:testing/WFAMNAE-next20240621-CbC 1/11]
 arch/powerpc/include/asm/hvcall.h:697:48: warning: structure containing a
 flexible array member is not at the end of another structure
Message-ID: <202407111827.iLqomSUr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only Makefile file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
CC: LKML <linux-kernel@vger.kernel.org>
TO: "Gustavo A. R. Silva" <gustavoars@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/WFAMNAE-next20240621-CbC
head:   30867ef8ad076c11ed274d76f99e8bb0346790af
commit: 18c8dad6dac24de88b5379ad4e367e50d06a96ec [1/11] Makefile: Enable -Wflex-array-member-not-at-end globally
:::::: branch date: 5 hours ago
:::::: commit date: 2 weeks ago
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20240711/202407111827.iLqomSUr-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407111827.iLqomSUr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407111827.iLqomSUr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/kvm_host.h:26,
                    from include/linux/kvm_host.h:45,
                    from arch/powerpc/include/asm/kvm_ppc.h:19,
                    from arch/powerpc/include/asm/dbell.h:17,
                    from arch/powerpc/kernel/asm-offsets.c:36:
>> arch/powerpc/include/asm/hvcall.h:697:48: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
     697 |         struct hv_get_perf_counter_info_params params;
         |                                                ^~~~~~
   include/linux/kvm_host.h:1838:31: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
    1838 |         struct kvm_stats_desc desc;
         |                               ^~~~
--
   In file included from include/linux/security.h:35,
                    from include/linux/perf_event.h:62,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:94,
                    from arch/powerpc/kernel/signal_32.c:26:
   include/linux/bpf.h:2002:31: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
    2002 |         struct bpf_prog_array hdr;
         |                               ^~~
   In file included from include/linux/tty_port.h:8,
                    from include/linux/tty.h:11,
                    from arch/powerpc/kernel/signal_32.c:33:
   include/linux/tty_buffer.h:40:27: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
      40 |         struct tty_buffer sentinel;
         |                           ^~~~~~~~
   In file included from arch/powerpc/include/asm/ultravisor-api.h:11,
                    from arch/powerpc/include/asm/asm-prototypes.h:19,
                    from arch/powerpc/kernel/signal_32.c:44:
>> arch/powerpc/include/asm/hvcall.h:697:48: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
     697 |         struct hv_get_perf_counter_info_params params;
         |                                                ^~~~~~
--
   In file included from include/linux/security.h:35,
                    from include/linux/perf_event.h:62,
                    from include/linux/hw_breakpoint.h:5,
                    from arch/powerpc/kernel/process.c:37:
   include/linux/bpf.h:2002:31: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
    2002 |         struct bpf_prog_array hdr;
         |                               ^~~
   In file included from arch/powerpc/include/asm/ultravisor-api.h:11,
                    from arch/powerpc/include/asm/asm-prototypes.h:19,
                    from arch/powerpc/kernel/process.c:61:
>> arch/powerpc/include/asm/hvcall.h:697:48: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
     697 |         struct hv_get_perf_counter_info_params params;
         |                                                ^~~~~~
--
   In file included from arch/powerpc/kernel/sysfs.c:17:
>> arch/powerpc/include/asm/hvcall.h:697:48: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
     697 |         struct hv_get_perf_counter_info_params params;
         |                                                ^~~~~~
--
   In file included from include/linux/tty_port.h:8,
                    from include/linux/tty.h:11,
                    from arch/powerpc/kernel/setup_32.c:14:
   include/linux/tty_buffer.h:40:27: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
      40 |         struct tty_buffer sentinel;
         |                           ^~~~~~~~
   In file included from arch/powerpc/include/asm/ultravisor-api.h:11,
                    from arch/powerpc/include/asm/asm-prototypes.h:19,
                    from arch/powerpc/kernel/setup_32.c:45:
>> arch/powerpc/include/asm/hvcall.h:697:48: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
     697 |         struct hv_get_perf_counter_info_params params;
         |                                                ^~~~~~
--
   In file included from arch/powerpc/include/asm/kvm_host.h:26,
                    from include/linux/kvm_host.h:45,
                    from arch/powerpc/include/asm/kvm_ppc.h:19,
                    from arch/powerpc/include/asm/dbell.h:17,
                    from arch/powerpc/kernel/asm-offsets.c:36:
>> arch/powerpc/include/asm/hvcall.h:697:48: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
     697 |         struct hv_get_perf_counter_info_params params;
         |                                                ^~~~~~
   include/linux/kvm_host.h:1838:31: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
    1838 |         struct kvm_stats_desc desc;
         |                               ^~~~


vim +697 arch/powerpc/include/asm/hvcall.h

59562b5c33d6ff Scott Cheloha 2020-07-27  691  
59562b5c33d6ff Scott Cheloha 2020-07-27  692  #define HGPCI_REQ_BUFFER_SIZE	4096
59562b5c33d6ff Scott Cheloha 2020-07-27  693  #define HGPCI_MAX_DATA_BYTES \
59562b5c33d6ff Scott Cheloha 2020-07-27  694  	(HGPCI_REQ_BUFFER_SIZE - sizeof(struct hv_get_perf_counter_info_params))
59562b5c33d6ff Scott Cheloha 2020-07-27  695  
59562b5c33d6ff Scott Cheloha 2020-07-27  696  struct hv_gpci_request_buffer {
59562b5c33d6ff Scott Cheloha 2020-07-27 @697  	struct hv_get_perf_counter_info_params params;
59562b5c33d6ff Scott Cheloha 2020-07-27  698  	uint8_t bytes[HGPCI_MAX_DATA_BYTES];
59562b5c33d6ff Scott Cheloha 2020-07-27  699  } __packed;
59562b5c33d6ff Scott Cheloha 2020-07-27  700  

:::::: The code at line 697 was first introduced by commit
:::::: 59562b5c33d6ff3685509ed58b2ed3c5b5712704 powerpc/perf: consolidate GPCI hcall structs into asm/hvcall.h

:::::: TO: Scott Cheloha <cheloha@linux.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
