Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7995B299934
	for <oe-kbuild@lists.linux.dev>; Mon, 12 May 2025 20:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747083331; cv=none; b=k9xHk4uwWANwFEE5L5qT8wp9cTQ3HyXXDe0EsDI3+0P4+E/fVXMZcLYhKmdJPJgwciLtMSXQcYwhg98CJcEZ9Ekfd72Uo8ow9qMs+udhn5NajGYbfrwqbrN8HsnaNwO2UDCIyz5lQelGwHvKiIwPkgUkinAN6H/o+A3Yu3Vcs0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747083331; c=relaxed/simple;
	bh=GnwJdlN7WweYskTf7FftLvllf1M5ybOOuDOcN8bxWXo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ioT8et0ORIyeC+VrOQMNI6IclCk+xmayQtClQvIS73nwYQFR8SkwNJ8FmwQaAJfOLPatMnx3r0Sh0xUgfG1u+agv0BG7HWgabUB8uI/rHkYnynp/FH+hBkavBl47kix1eRuilZcpHH7o+gmePTjZwI1L030yDqlkflmYw1HtoKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MVcR/VY0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MVcR/VY0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747083329; x=1778619329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GnwJdlN7WweYskTf7FftLvllf1M5ybOOuDOcN8bxWXo=;
  b=MVcR/VY0AyftzeG+FCNW2XougzLmDb10sw8/QW+5fnjh0IlWzmonoGIh
   xz2A+Rt985Pr2YKzpSxcOVvla35SKpQr7CrMHg/6YkWCONqMtGA/IjkL1
   aJPlAaFMwETOGt7p31XDhkybbN5q+EyZVKvncns00px7ANn+JJv+fcd3d
   rphfTvrxpLdj0WqJW6ALvje/ZCm1PfujcVA1jlJke0jsJwrcRN6xz3qc7
   WPIxKk4p3ujThLIdEvjL8jg0IBVh39gs3nygO3VFpYvSEVffr88zGwKSQ
   jH+pxxpB8ms7JnIjKuNm3mW254XeFiAvqCsXpaWFU8BWq1ovXeIZPAdOU
   w==;
X-CSE-ConnectionGUID: 2PnDOIY1SeKGxZAFhXeVGQ==
X-CSE-MsgGUID: KhctfgbES0m+1e1cVwqVcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="74299857"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="74299857"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 13:55:28 -0700
X-CSE-ConnectionGUID: C/0jYnXVRXeXIcknpFawiw==
X-CSE-MsgGUID: 31iLI24GR8md42DrjoQV/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="137895479"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 May 2025 13:55:18 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEaAx-000FPj-1a;
	Mon, 12 May 2025 20:55:03 +0000
Date: Tue, 13 May 2025 04:54:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [openeuler:OLK-6.6 2220/2220] crypto/gcm.o: warning: objtool:
 crypto_rfc4106_crypt+0x134: unreachable instruction
Message-ID: <202505130454.SVIc3A3h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e1106320058bf1d983657f80490249b4f919ebad
commit: 7984eaba9ede77910543832d6e19af3f84f49d7c [2220/2220] LoongArch: Add ORC stack unwinder support
:::::: branch date: 14 hours ago
:::::: commit date: 6 months ago
config: loongarch-randconfig-001-20250512 (https://download.01.org/0day-ci/archive/20250513/202505130454.SVIc3A3h-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505130454.SVIc3A3h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505130454.SVIc3A3h-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from crypto/gcm.c:13:
   include/crypto/scatterwalk.h: In function 'scatterwalk_pagedone':
   include/crypto/scatterwalk.h:76:30: warning: variable 'page' set but not used [-Wunused-but-set-variable]
      76 |                 struct page *page;
         |                              ^~~~
>> crypto/gcm.o: warning: objtool: crypto_rfc4106_crypt+0x134: unreachable instruction
>> crypto/gcm.o: warning: objtool: crypto_gcm_init_common+0xdc: unreachable instruction
--
>> crypto/af_alg.o: warning: objtool: af_alg_pull_tsgl+0x338: unreachable instruction
>> crypto/af_alg.o: warning: objtool: af_alg_sendmsg+0x360: unreachable instruction
--
>> crypto/drbg.o: warning: objtool: drbg_kcapi_sym_ctr+0x68: unreachable instruction
--
   In file included from crypto/essiv.c:36:
   include/crypto/scatterwalk.h: In function 'scatterwalk_pagedone':
   include/crypto/scatterwalk.h:76:30: warning: variable 'page' set but not used [-Wunused-but-set-variable]
      76 |                 struct page *page;
         |                              ^~~~
>> crypto/essiv.o: warning: objtool: essiv_aead_crypt+0x34c: unreachable instruction
--
   In file included from crypto/ccm.c:12:
   include/crypto/scatterwalk.h: In function 'scatterwalk_pagedone':
   include/crypto/scatterwalk.h:76:30: warning: variable 'page' set but not used [-Wunused-but-set-variable]
      76 |                 struct page *page;
         |                              ^~~~
>> crypto/ccm.o: warning: objtool: crypto_rfc4309_crypt+0x144: unreachable instruction
>> crypto/ccm.o: warning: objtool: crypto_ccm_init_crypt+0xe4: unreachable instruction
>> crypto/ccm.o: warning: objtool: crypto_ccm_auth+0xd0: unreachable instruction
--
>> crypto/testmgr.o: warning: objtool: test_akcipher_one+0x334: unreachable instruction
>> crypto/testmgr.o: warning: objtool: build_test_sglist+0x3c8: unreachable instruction
--
>> lib/maple_tree.o: warning: objtool: mas_destroy+0x1770: unreachable instruction
>> lib/maple_tree.o: warning: objtool: mas_spanning_rebalance.isra.0+0x1878: unreachable instruction
>> lib/maple_tree.o: warning: objtool: mas_split.isra.0+0x3fc: unreachable instruction
>> lib/maple_tree.o: warning: objtool: mas_wr_bnode+0x1f40: unreachable instruction
>> lib/maple_tree.o: warning: objtool: mas_store_prealloc+0x62c: unreachable instruction
>> lib/maple_tree.o: warning: objtool: mas_store+0x2ab0: unreachable instruction
>> lib/maple_tree.o: warning: objtool: mas_alloc_cyclic+0xc3c: unreachable instruction
>> lib/maple_tree.o: warning: objtool: mas_store_gfp+0x2ad8: unreachable instruction
>> lib/maple_tree.o: warning: objtool: mas_erase+0x2f74: unreachable instruction
>> lib/maple_tree.o: warning: objtool: mtree_store_range+0x2b38: unreachable instruction
>> lib/maple_tree.o: warning: objtool: mtree_insert_range+0x834: unreachable instruction
>> lib/maple_tree.o: warning: objtool: mtree_alloc_range+0x880: unreachable instruction
>> lib/maple_tree.o: warning: objtool: mtree_alloc_rrange+0x880: unreachable instruction
--
>> lib/scatterlist.o: warning: objtool: sg_init_one+0x7c: unreachable instruction
>> lib/scatterlist.o: warning: objtool: sg_alloc_append_table_from_pages+0x578: unreachable instruction
>> lib/scatterlist.o: warning: objtool: extract_user_to_sg+0x1a0: unreachable instruction
>> lib/scatterlist.o: warning: objtool: sgl_alloc_order+0x16c: unreachable instruction
>> lib/scatterlist.o: warning: objtool: extract_kvec_to_sg.isra.0+0x1b0: unreachable instruction
>> lib/scatterlist.o: warning: objtool: extract_iter_to_sg+0x1e4: unreachable instruction
--
   fs/dcache.o: warning: objtool: d_instantiate_new+0x40: unreachable instruction
>> fs/dcache.o: warning: objtool: d_splice_alias+0x544: unreachable instruction
--
   fs/buffer.o: warning: objtool: block_invalidate_folio+0x9c: unreachable instruction
>> fs/buffer.o: warning: objtool: folio_zero_new_buffers+0x268: unreachable instruction
   fs/buffer.o: warning: objtool: cont_expand_zero+0x204: unreachable instruction
   fs/buffer.o: warning: objtool: end_buffer_async_write+0x158: unreachable instruction
   fs/buffer.o: warning: objtool: end_buffer_async_read+0xf4: unreachable instruction
   fs/buffer.o: warning: objtool: submit_bh_wbc.isra.0+0x54: unreachable instruction
   fs/buffer.o: warning: objtool: __block_write_full_folio+0x46c: unreachable instruction
   fs/buffer.o: warning: objtool: __block_write_begin_int+0xb8: unreachable instruction
--
>> fs/seq_file.o: warning: objtool: seq_escape_mem+0x118: unreachable instruction
>> fs/seq_file.o: warning: objtool: seq_path+0x118: unreachable instruction
>> fs/seq_file.o: warning: objtool: seq_dentry+0x118: unreachable instruction
>> fs/seq_file.o: warning: objtool: seq_hex_dump+0x214: unreachable instruction
>> fs/seq_file.o: warning: objtool: seq_path_root+0x128: unreachable instruction
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
