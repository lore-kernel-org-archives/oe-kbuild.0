Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742123403E3
	for <oe-kbuild@lists.linux.dev>; Sat, 26 Sep 2026 07:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790406476; cv=none; b=qCvDbwenYZEc+yL4YZ7hju3wvQNtu8Wjo216ikHUrjNTTkGdrABDTjeFTvlznjm1hPjn9vG4umzGnc/4NiaBm7V8AYPjzKFHeSvunxL0ir7DcWBRsWE7Isif6jXG3wI6BznHlcvwqDgkWgQzSoBJk0X2jH/X6c9a9V4aDZqwZIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790406476; c=relaxed/simple;
	bh=qhz98qAvIqAO1o/DLR1YNgnVcG+37qHMn2UZchEwqZk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=glf4t10zhqyZ5+MCfqS/Md1nE7kFBMtGvTowdg7MTeuNbQFLK5ZuVS6A8id/gogkHzrr+lPw65Qp5dM7OZHOaMKeHfiZW6h0eNS1LoyNeLoxU5eCgMIaO/+YQoveYRDHDkfeib9hiyA0zW2mDy4lZ78MN5ARhsw+Xlf0PWE0EHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NlPjXfno; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NlPjXfno"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790406474; x=1821942474;
  h=date:from:to:cc:subject:message-id;
  bh=qhz98qAvIqAO1o/DLR1YNgnVcG+37qHMn2UZchEwqZk=;
  b=NlPjXfnoVlwQbgYxTiKbGq94n0woj0hPLmFMm3uXMcjeUFY6p2pinwFB
   0w3fq3CbsuXtl3V6zmDUHF/BvQ4iPCVUgBPvCkK9nQ4OGjC0JY9ssSL0A
   ujePZjZCeSuytqUfLZVfu0WoKIHD0pS6g+JNGYugFPbCIl4QHI8aJchhV
   zDt6s9Nvc+SZqGfqrt8d3PPdnKq5MQcxXH/KNJG3tCyAYK5wWn1uLjzSB
   uo38a6dTCUkz/iywBAnUGj9yagOG/Eh/qywBN+09eS+ZM+Kxlr4uJOo8k
   qIV8pW8fuvtgWvO7/P3Qi/pxdJ/44rQBwuznFfNiSXw+x3NMMOsTrBuaC
   Q==;
X-CSE-ConnectionGUID: RuEKnsByQaC1SXWEeCLr8w==
X-CSE-MsgGUID: GQvT4LoUSAS6uRpChI774A==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="108676458"
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="108676458"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 00:07:54 -0700
X-CSE-ConnectionGUID: Hy2uEMqYSQWRl1dJGgiXmw==
X-CSE-MsgGUID: RoUu/s2/T7S0JyKdQH1JcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="274089183"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Sep 2026 00:07:53 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAMVi-00000000Lbt-3Jwf;
	Sat, 26 Sep 2026 07:07:50 +0000
Date: Sat, 26 Sep 2026 15:07:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/media/virtio/scatterlist_builder.c:170:8: error:
 assigning to 'void *' from 'const void *' discards qualifiers
Message-ID: <202609261539.n6A9xKeZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/UPDATE-20260925-090140/Brian-Daniels/media-virtio-Add-skeleton-virtio-media-driver/20260917-131917, commit: b0cdb4509d43d497f87cec6d0a7de72db4b2cbc2"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Alexandre Courbot <gnurou@gmail.com>
CC: 0day robot <lkp@intel.com>
CC: Brian Daniels <briandaniels@google.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/UPDATE-20260925-090140/Brian-Daniels/media-virtio-Add-skeleton-virtio-media-driver/20260917-131917
head:   4688a846e2f2860ea38caf221fc8c52c6043000e
commit: b0cdb4509d43d497f87cec6d0a7de72db4b2cbc2 media: virtio: Add scatterlist builder
date:   23 hours ago
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: powerpc64-randconfig-1000-20260926 (https://download.01.org/0day-ci/archive/20260926/202609261539.n6A9xKeZ-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 78ff5215e53a117851dc6e81e793a106f1a79df8)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609261539.n6A9xKeZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609261539.n6A9xKeZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/virtio/scatterlist_builder.c:170:8: error: assigning to 'void *' from 'const void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     170 |         kaddr = pfn_to_kaddr(page_to_pfn(sg_page(sg))) + sg->offset;
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +170 drivers/media/virtio/scatterlist_builder.c

b0cdb4509d43d4 Alexandre Courbot 2026-09-17  142  
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  143  /**
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  144   * scatterlist_builder_retrieve_data() - Retrieve a response written by the
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  145   *                                       device on the shadow buffer.
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  146   * @builder: builder to use.
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  147   * @sg_index: index of the descriptor to read from.
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  148   * @data: destination for the shadowed data.
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  149   *
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  150   * If the shadow buffer is pointed to by the descriptor at index @sg_index of
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  151   * the chain, then ``sg->length`` bytes are copied back from it into @data.
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  152   * Otherwise nothing is done since the device has written into @data directly.
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  153   *
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  154   * @data must have originally been added by scatterlist_builder_add_data() as
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  155   * the same size as passed to scatterlist_builder_add_data() will be copied
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  156   * back.
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  157   */
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  158  int scatterlist_builder_retrieve_data(struct scatterlist_builder *builder,
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  159  				      size_t sg_index, void *data)
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  160  {
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  161  	void *shadow_buf = builder->shadow_buffer;
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  162  	struct scatterlist *sg;
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  163  	void *kaddr;
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  164  
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  165  	/* We can only retrieve from the range of sgs currently set. */
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  166  	if (sg_index >= builder->cur_sg)
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  167  		return -ERANGE;
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  168  
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  169  	sg = builder->sgs[sg_index];
b0cdb4509d43d4 Alexandre Courbot 2026-09-17 @170  	kaddr = pfn_to_kaddr(page_to_pfn(sg_page(sg))) + sg->offset;
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  171  
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  172  	if (kaddr >= shadow_buf &&
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  173  	    kaddr < shadow_buf + VIRTIO_SHADOW_BUF_SIZE) {
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  174  		if (kaddr + sg->length >= shadow_buf + VIRTIO_SHADOW_BUF_SIZE)
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  175  			return -EINVAL;
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  176  
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  177  		memcpy(data, kaddr, sg->length);
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  178  	}
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  179  
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  180  	return 0;
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  181  }
b0cdb4509d43d4 Alexandre Courbot 2026-09-17  182  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
