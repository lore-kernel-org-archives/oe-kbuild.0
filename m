Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F821514CC
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Mar 2025 01:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742001586; cv=none; b=r0oXLeqLcwQgF6MwSRvUSLSqVAA0Pzhh/0z/HffGu+BkrODZEm6TOiLSDbBrdN2n7dNKwz4QoWUh2KxygS9hxs0E7hIbufS0mK+1CI2gcUk0v1PApuukvWLTWZYP8niKG0RAlfS6SY5Uw3wueL8CJ3u5Lzo5j1hGa86g7bMe19Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742001586; c=relaxed/simple;
	bh=bEG2OTiPSKpKBDjnUH8VZtqDIcLFOItmBj34g2s5M6s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jqd1j/ImCJloeKutO53bAx58z4VUrfj2FN87i12gj/TLBpHIVY+sBiX8PPXeMCd3ApfEeiamxCrlhW6JwvFRwebCh2fvRSXo/+nqmCK9tg7e7wlJ+5Jw6bc6iYVnXoE2jsfQxrqVqjrye9ACQeR2g+8ZnW4UUSxLkG0IZajHRms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ajX9fsE/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ajX9fsE/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742001585; x=1773537585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bEG2OTiPSKpKBDjnUH8VZtqDIcLFOItmBj34g2s5M6s=;
  b=ajX9fsE/emjVOr2IvxdZRVlsZhAETEQ9F4SJZ9e7NlxjxuwMXKvK91mS
   QF1jz2IGi2Dv3bgOvNFSWiuaHY3FNXEtHl4jVob7KvWFkYH03/T3G2Wr8
   gnJ5ZVSbJqhQpQujP3Fm0RFemFdgi1wK6U4V0waUe7n4GmXWIb6NI/bEm
   hmPdaFyZNbbN/y9udo7zAePomxTVJCNUNvv/Ir/aeXliBUvxlZDb9U3T6
   +NWAeRl99QXxJWL810AV9fHjglUxyM+yq1DCMbA2Q+FmQn4TAnhUJZm9p
   /IVzEBx+x+Ell7H7i4gs+pKQHISeN2NR/KkwXF3zGTi8xvfRC4m3PFY9p
   Q==;
X-CSE-ConnectionGUID: lefwKUZfSzOltho0sldXfA==
X-CSE-MsgGUID: LJf66JyuSMCsqWB03alXmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="30754135"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="30754135"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 18:19:44 -0700
X-CSE-ConnectionGUID: k2ntVikERKa7JpGdfb9gLQ==
X-CSE-MsgGUID: F1VLWgSDTtC5atxZYbja/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="126078816"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 14 Mar 2025 18:19:42 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttGBg-000AyV-1m;
	Sat, 15 Mar 2025 01:19:40 +0000
Date: Sat, 15 Mar 2025 09:18:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/crypto/marvell/cesa/tdma.c:222 mv_cesa_dma_add_result_op()
 warn: passing positive error code '(-12)' to 'PTR_ERR'
Message-ID: <202503150902.QGJU3iWt-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Rosen Penev <rosenp@gmail.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

Hi Rosen,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b35233e7bfa04045388967d3dc219e80cc88bc74
commit: 66472bb6cecf05ed159fc4105f797d51b3e66f56 crypto: cesa - add COMPILE_TEST
date:   5 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 5 months ago
config: openrisc-randconfig-r072-20250314 (https://download.01.org/0day-ci/archive/20250315/202503150902.QGJU3iWt-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503150902.QGJU3iWt-lkp@intel.com/

smatch warnings:
drivers/crypto/marvell/cesa/tdma.c:222 mv_cesa_dma_add_result_op() warn: passing positive error code '(-12)' to 'PTR_ERR'
drivers/crypto/marvell/cesa/tdma.c:261 mv_cesa_dma_add_op() warn: passing positive error code '(-12)' to 'ERR_CAST'
drivers/crypto/marvell/cesa/tdma.c:289 mv_cesa_dma_add_data_transfer() warn: passing positive error code '(-12)' to 'PTR_ERR'
drivers/crypto/marvell/cesa/tdma.c:315 mv_cesa_dma_add_dummy_end() warn: passing positive error code '(-12)' to 'PTR_ERR'

vim +222 drivers/crypto/marvell/cesa/tdma.c

db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  214  
0c99620f0ac13a5 drivers/crypto/marvell/tdma.c      Romain Perier   2016-10-05  215  int mv_cesa_dma_add_result_op(struct mv_cesa_tdma_chain *chain, dma_addr_t src,
bac8e805a30dc2a drivers/crypto/marvell/tdma.c      Romain Perier   2016-06-21  216  			  u32 size, u32 flags, gfp_t gfp_flags)
bac8e805a30dc2a drivers/crypto/marvell/tdma.c      Romain Perier   2016-06-21  217  {
0c99620f0ac13a5 drivers/crypto/marvell/tdma.c      Romain Perier   2016-10-05  218  	struct mv_cesa_tdma_desc *tdma, *op_desc;
bac8e805a30dc2a drivers/crypto/marvell/tdma.c      Romain Perier   2016-06-21  219  
bac8e805a30dc2a drivers/crypto/marvell/tdma.c      Romain Perier   2016-06-21  220  	tdma = mv_cesa_dma_add_desc(chain, gfp_flags);
bac8e805a30dc2a drivers/crypto/marvell/tdma.c      Romain Perier   2016-06-21  221  	if (IS_ERR(tdma))
bac8e805a30dc2a drivers/crypto/marvell/tdma.c      Romain Perier   2016-06-21 @222  		return PTR_ERR(tdma);
bac8e805a30dc2a drivers/crypto/marvell/tdma.c      Romain Perier   2016-06-21  223  
0c99620f0ac13a5 drivers/crypto/marvell/tdma.c      Romain Perier   2016-10-05  224  	/* We re-use an existing op_desc object to retrieve the context
0c99620f0ac13a5 drivers/crypto/marvell/tdma.c      Romain Perier   2016-10-05  225  	 * and result instead of allocating a new one.
0c99620f0ac13a5 drivers/crypto/marvell/tdma.c      Romain Perier   2016-10-05  226  	 * There is at least one object of this type in a CESA crypto
0c99620f0ac13a5 drivers/crypto/marvell/tdma.c      Romain Perier   2016-10-05  227  	 * req, just pick the first one in the chain.
0c99620f0ac13a5 drivers/crypto/marvell/tdma.c      Romain Perier   2016-10-05  228  	 */
0c99620f0ac13a5 drivers/crypto/marvell/tdma.c      Romain Perier   2016-10-05  229  	for (op_desc = chain->first; op_desc; op_desc = op_desc->next) {
0c99620f0ac13a5 drivers/crypto/marvell/tdma.c      Romain Perier   2016-10-05  230  		u32 type = op_desc->flags & CESA_TDMA_TYPE_MSK;
0c99620f0ac13a5 drivers/crypto/marvell/tdma.c      Romain Perier   2016-10-05  231  
0c99620f0ac13a5 drivers/crypto/marvell/tdma.c      Romain Perier   2016-10-05  232  		if (type == CESA_TDMA_OP)
0c99620f0ac13a5 drivers/crypto/marvell/tdma.c      Romain Perier   2016-10-05  233  			break;
0c99620f0ac13a5 drivers/crypto/marvell/tdma.c      Romain Perier   2016-10-05  234  	}
0c99620f0ac13a5 drivers/crypto/marvell/tdma.c      Romain Perier   2016-10-05  235  
0c99620f0ac13a5 drivers/crypto/marvell/tdma.c      Romain Perier   2016-10-05  236  	if (!op_desc)
0c99620f0ac13a5 drivers/crypto/marvell/tdma.c      Romain Perier   2016-10-05  237  		return -EIO;
bac8e805a30dc2a drivers/crypto/marvell/tdma.c      Romain Perier   2016-06-21  238  
bac8e805a30dc2a drivers/crypto/marvell/tdma.c      Romain Perier   2016-06-21  239  	tdma->byte_cnt = cpu_to_le32(size | BIT(31));
e62291c1d9f4f43 drivers/crypto/marvell/cesa/tdma.c Herbert Xu      2020-07-31  240  	tdma->src_dma = src;
e62291c1d9f4f43 drivers/crypto/marvell/cesa/tdma.c Herbert Xu      2020-07-31  241  	tdma->dst_dma = op_desc->src_dma;
0c99620f0ac13a5 drivers/crypto/marvell/tdma.c      Romain Perier   2016-10-05  242  	tdma->op = op_desc->op;
bac8e805a30dc2a drivers/crypto/marvell/tdma.c      Romain Perier   2016-06-21  243  
bac8e805a30dc2a drivers/crypto/marvell/tdma.c      Romain Perier   2016-06-21  244  	flags &= (CESA_TDMA_DST_IN_SRAM | CESA_TDMA_SRC_IN_SRAM);
0c99620f0ac13a5 drivers/crypto/marvell/tdma.c      Romain Perier   2016-10-05  245  	tdma->flags = flags | CESA_TDMA_RESULT;
bac8e805a30dc2a drivers/crypto/marvell/tdma.c      Romain Perier   2016-06-21  246  	return 0;
bac8e805a30dc2a drivers/crypto/marvell/tdma.c      Romain Perier   2016-06-21  247  }
bac8e805a30dc2a drivers/crypto/marvell/tdma.c      Romain Perier   2016-06-21  248  
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  249  struct mv_cesa_op_ctx *mv_cesa_dma_add_op(struct mv_cesa_tdma_chain *chain,
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  250  					const struct mv_cesa_op_ctx *op_templ,
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  251  					bool skip_ctx,
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  252  					gfp_t flags)
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  253  {
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  254  	struct mv_cesa_tdma_desc *tdma;
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  255  	struct mv_cesa_op_ctx *op;
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  256  	dma_addr_t dma_handle;
6de59d453ae567c drivers/crypto/marvell/tdma.c      Russell King    2015-10-18  257  	unsigned int size;
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  258  
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  259  	tdma = mv_cesa_dma_add_desc(chain, flags);
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  260  	if (IS_ERR(tdma))
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18 @261  		return ERR_CAST(tdma);
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  262  
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  263  	op = dma_pool_alloc(cesa_dev->dma->op_pool, flags, &dma_handle);
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  264  	if (!op)
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  265  		return ERR_PTR(-ENOMEM);
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  266  
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  267  	*op = *op_templ;
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  268  
6de59d453ae567c drivers/crypto/marvell/tdma.c      Russell King    2015-10-18  269  	size = skip_ctx ? sizeof(op->desc) : sizeof(*op);
6de59d453ae567c drivers/crypto/marvell/tdma.c      Russell King    2015-10-18  270  
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  271  	tdma = chain->last;
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  272  	tdma->op = op;
6de59d453ae567c drivers/crypto/marvell/tdma.c      Russell King    2015-10-18  273  	tdma->byte_cnt = cpu_to_le32(size | BIT(31));
ea1f662bde06756 drivers/crypto/marvell/tdma.c      Russell King    2015-10-18  274  	tdma->src = cpu_to_le32(dma_handle);
e62291c1d9f4f43 drivers/crypto/marvell/cesa/tdma.c Herbert Xu      2020-07-31  275  	tdma->dst_dma = CESA_SA_CFG_SRAM_OFFSET;
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  276  	tdma->flags = CESA_TDMA_DST_IN_SRAM | CESA_TDMA_OP;
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  277  
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  278  	return op;
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  279  }
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  280  
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  281  int mv_cesa_dma_add_data_transfer(struct mv_cesa_tdma_chain *chain,
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  282  				  dma_addr_t dst, dma_addr_t src, u32 size,
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  283  				  u32 flags, gfp_t gfp_flags)
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  284  {
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  285  	struct mv_cesa_tdma_desc *tdma;
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  286  
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  287  	tdma = mv_cesa_dma_add_desc(chain, gfp_flags);
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  288  	if (IS_ERR(tdma))
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18 @289  		return PTR_ERR(tdma);
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  290  
6de59d453ae567c drivers/crypto/marvell/tdma.c      Russell King    2015-10-18  291  	tdma->byte_cnt = cpu_to_le32(size | BIT(31));
e62291c1d9f4f43 drivers/crypto/marvell/cesa/tdma.c Herbert Xu      2020-07-31  292  	tdma->src_dma = src;
e62291c1d9f4f43 drivers/crypto/marvell/cesa/tdma.c Herbert Xu      2020-07-31  293  	tdma->dst_dma = dst;
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  294  
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  295  	flags &= (CESA_TDMA_DST_IN_SRAM | CESA_TDMA_SRC_IN_SRAM);
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  296  	tdma->flags = flags | CESA_TDMA_DATA;
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  297  
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  298  	return 0;
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  299  }
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  300  
35622eae188761f drivers/crypto/marvell/tdma.c      Russell King    2015-10-18  301  int mv_cesa_dma_add_dummy_launch(struct mv_cesa_tdma_chain *chain, gfp_t flags)
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  302  {
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  303  	struct mv_cesa_tdma_desc *tdma;
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  304  
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  305  	tdma = mv_cesa_dma_add_desc(chain, flags);
06ec1f82bfa5078 drivers/crypto/marvell/tdma.c      Himanshu Jha    2017-08-27  306  	return PTR_ERR_OR_ZERO(tdma);
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  307  }
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  308  
35622eae188761f drivers/crypto/marvell/tdma.c      Russell King    2015-10-18  309  int mv_cesa_dma_add_dummy_end(struct mv_cesa_tdma_chain *chain, gfp_t flags)
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  310  {
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  311  	struct mv_cesa_tdma_desc *tdma;
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  312  
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  313  	tdma = mv_cesa_dma_add_desc(chain, flags);
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  314  	if (IS_ERR(tdma))
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18 @315  		return PTR_ERR(tdma);
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  316  
6de59d453ae567c drivers/crypto/marvell/tdma.c      Russell King    2015-10-18  317  	tdma->byte_cnt = cpu_to_le32(BIT(31));
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  318  
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  319  	return 0;
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  320  }
db509a45339fd78 drivers/crypto/marvell/tdma.c      Boris Brezillon 2015-06-18  321  

:::::: The code at line 222 was first introduced by commit
:::::: bac8e805a30dc2a29c3fdde9d822e59c75e710d7 crypto: marvell - Copy IV vectors by DMA transfers for acipher requests

:::::: TO: Romain Perier <romain.perier@free-electrons.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
