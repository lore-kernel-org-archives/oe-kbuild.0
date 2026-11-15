Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794737156;
	b=I2EMMrBOoA1Ut8+2zjlxHPuB6C2hhi9n0Qb9PPUEk39aGGliAllMWBfFix7NsBiJx1S6
	 jXrPgGh3UUhymnTglg840e4pXVyv19rB7MP72aFBnhEobowYpFyVfaEJxonPF0SK0H6Jc
	 540xGHNRUzJ1BARvYU38l2wgRkiMY9Gnt6UM1pN+/kDmvO6uciD2ShorZdzTiItqHc4vu
	 iJEhab0VFaHvml/2v+I+XRdNjlzrxq69E9Y0N/tK/0M1ncgP7/iwjfZuAlcULHWlyQA5x
	 98RlvqMSe0/IlwBXdVaFE7/Hk+SVWQGqE4LFlF554QNjLv/zXnjZ5lxVJoCYOR1i/OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794737156;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=NBTnEo9mnGPlDFSU1a475vOgxqxL+qSDpuavnbSDqRo=;
	b=nmb0Qegujt5GKxe/0g+8O9SBFR1pCRrqdrA9eFB7fzxaxOqSslP683DAUgTON705rdRj
	 a4YgU5hGIMSyP296ScikhNk7zdJquxm9xtHFtgvXbzlMCF3jd/7ldLwyHfagl2PEtiaH1
	 fPc+tvizJ1OyAHaF7NeKKgv02wRMlQ9EdX+PPmWqjjTl4rdef8TzzGgBt7eWHXeRzcJgT
	 AlRq1TfANFi8DNjYPWnRl3bfbjEWYeCUfGQFHyUem4pg2UEs9ygRQcpu7oPqgTIl7K0TL
	 tbZd5Ph8UQkcLzpWQO7py3OO8nKIEzIoSLc869S1+45hpiD8xWB/qHAy7iC1G74UheQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N9L9I36t;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F93A606A31E
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Nov 2026 10:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F93A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N9L9I36t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794737155; x=1826273155;
  h=date:from:to:cc:subject:message-id;
  bh=yVLcPm6wbx2FPArpm6LAJCMbOJK4P4GqBATlne4B3Hc=;
  b=N9L9I36tCj6j5uZXpgq2m5T6mHSP2W53uy5WewXwhnmKlzzhmokg50rJ
   mwtocRnG9+gp+HpZpYkb77y6sow7qiaGWBzWsd1WO04ccuWvC6tkNhxtt
   gKPEM6NI23f+EOkTOW/hCZpASfNANd/Va2/68MBL9fVVvoBVJUcMumkJF
   TXeTU4xCXys7CFsyU/PWLP1zzmz1VSJq+aTAcjT3A+IqTHsDIv9qsB3vj
   Zz9RgJyIgvoWKmVk6SCpUp4JliPyLfvaL6ULVjbU+Q4DpPdgW3inZUhRy
   4XHOCV3xnYBcS6s7YaCWJ4Z/JOwbfi6+0LS63X2Liv69RNugpXZW5pH4e
   Q==;
X-CSE-ConnectionGUID: WNeUnp01QbSC9kfqjU1y/A==
X-CSE-MsgGUID: mTnW6Za7T9u+GSJQqtxeLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3384671"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3384671"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 02:05:54 -0800
X-CSE-ConnectionGUID: Ywfj/VgsThyPZWmksuPpwA==
X-CSE-MsgGUID: ekAp/HZFSEK5/t20yllang==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9227109"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 15 Nov 2026 02:05:54 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSX7P-0000000028W-19X4;
	Sun, 15 Nov 2026 10:05:51 +0000
Date: Sun, 15 Nov 2026 11:05:35 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: {standard input}: Error: open CFI at the end of file;
 missing .cfi_endproc directive
Message-ID: <202611151052.Mifp7WHU-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit | /zdci/kbuild/indicators/0f/0fc1bd38a19c108395d8338fb034f90c2d3fbe55-reported_build_error_fbc-error"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Marco Elver <elver@google.com>
CC: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
CC: "Harry Yoo (Oracle)" <harry@kernel.org>

Hi Marco,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   23c62304dde29abe92013d85910d03a77dada35d
commit: 0fc1bd38a19c108395d8338fb034f90c2d3fbe55 slab: improve KMALLOC_PARTITION_RANDOM randomness
date:   6 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 6 months ago
config: csky-randconfig-r2103-20261115 (https://download.01.org/0day-ci/archive/20261115/202611151052.Mifp7WHU-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611151052.Mifp7WHU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0fc1bd38a19c ("slab: improve KMALLOC_PARTITION_RANDOM randomness")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611151052.Mifp7WHU-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfs/nfs4namespace.c: In function 'nfs4_replace_transport':
   fs/nfs/nfs4namespace.c:577:1: error: could not split insn
     577 | }
         | ^
   (insn 178 491 855 (set (reg:SI 3 a3 [254])
           (xor:SI (reg:SI 2 a2 [orig:255 random_kmalloc_seed ] [255])
               (const:SI (plus:SI (symbol_ref:SI ("*.LANCHOR0") [flags 0x182])
                       (const_int 4 [0x4]))))) "include/linux/slab.h":698:52 288 {cskyv2_xorsi3}
        (expr_list:REG_DEAD (reg:SI 2 a2 [orig:255 random_kmalloc_seed ] [255])
           (nil)))
   during RTL pass: final
   fs/nfs/nfs4namespace.c:577:1: internal compiler error: in final_scan_insn_1, at final.cc:2812
   0x7fe96478fd64 __libc_start_main
   	???:0
   Please submit a full bug report, with preprocessed source (by using -freport-bug).
   Please include the complete backtrace with any bug report.
   See <https://gcc.gnu.org/bugs/> for instructions.
   Assembler messages:
>> {standard input}: Error: open CFI at the end of file; missing .cfi_endproc directive
--
   fs/nfs/filelayout/filelayout.c: In function 'filelayout_decode_layout.isra':
   fs/nfs/filelayout/filelayout.c:733:1: error: could not split insn
     733 | }
         | ^
   (insn 447 722 1341 (set (reg:SI 3 a3 [328])
           (xor:SI (reg:SI 2 a2 [orig:329 random_kmalloc_seed ] [329])
               (const:SI (plus:SI (symbol_ref:SI ("*.LANCHOR1") [flags 0x182])
                       (const_int 81 [0x51]))))) "include/linux/slab.h":698:52 288 {cskyv2_xorsi3}
        (expr_list:REG_DEAD (reg:SI 2 a2 [orig:329 random_kmalloc_seed ] [329])
           (nil)))
   during RTL pass: final
   fs/nfs/filelayout/filelayout.c:733:1: internal compiler error: in final_scan_insn_1, at final.cc:2812
   0x7fea3cbebd64 __libc_start_main
   	???:0
   Please submit a full bug report, with preprocessed source (by using -freport-bug).
   Please include the complete backtrace with any bug report.
   See <https://gcc.gnu.org/bugs/> for instructions.
   Assembler messages:
>> {standard input}: Error: open CFI at the end of file; missing .cfi_endproc directive

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
