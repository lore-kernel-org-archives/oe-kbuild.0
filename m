Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DBA2343D4
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Mar 2025 18:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741632405; cv=none; b=VnjVdlzYr2RdSkHeM+UVypWAIh2axQlwDSZ3HKqSijhbMDKqgPB7tyWEjN8GdP8tUkyUDsAHZLDir7u/y3N97p/wO8FnFoGJzQbeeO5wlxd/u/cJ0Pxv4iD++oNtaDA8rmydwPwncmcPmPbkQrZ+dSOnkQ2+twlgiaVAgd8dKt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741632405; c=relaxed/simple;
	bh=sbvUvlRdhD0qsCR02cQm2obXvLdle+9JetsfC5t3JeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E7J0LJGYP4ANjYymKoTfBP7ymjmCkULNnRqxXuJ4wqMk6IOA8MLqfQZGtVAPwFaBAisYvTziAA/GcMfqfEkoRxyjZnMGJCAGfVcPR81O4ByIbxPJ0jjyMG9+6zvESVJKa1WpdAz+VupA78Dzj1mn26zrq+IIWBsIJjjeb9oddMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kNpxYJm3; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kNpxYJm3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741632403; x=1773168403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sbvUvlRdhD0qsCR02cQm2obXvLdle+9JetsfC5t3JeQ=;
  b=kNpxYJm3i/8I1lZDUoGY8WiqvlowPXFuXD8OtSDdz47vtilw2gbvLr3q
   FeaQfk2gkQv75URXboHceghYrkEYBu3iOEIVS8gekkYmLub0eBHanosJw
   60FkAEYlw4m9IVZgiZ+jx353YbIJpPE1KrEBiQJcooR/j3SRwObUszLsV
   pv5sU9LJz5M49E/Qunh5pqKyTp/CBLiIjWAhgTJE6g8nW8zVdD+KOvH0W
   vSOugjZDb+SMAkSZ/F+zjMtcxdxIxhgFvxH6cq+NWgh9Jl3NrDxmZuG0z
   77SLt2GNsAZH8E7nov8Kn+xe1txclB/C7Obhi7hxqjeU6sVu5JCrDwbUL
   Q==;
X-CSE-ConnectionGUID: vba9E3jYT4+YP5bjjBCDoQ==
X-CSE-MsgGUID: gzlq66V3TYCB40EWhRj3qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42494057"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; 
   d="scan'208";a="42494057"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 11:46:40 -0700
X-CSE-ConnectionGUID: 0pxfsnSCRhqf8fwNVLC1pQ==
X-CSE-MsgGUID: 2w4Ri351S2WsudXWKZZi4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; 
   d="scan'208";a="120004186"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 10 Mar 2025 11:46:38 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tri96-0005z6-0B;
	Mon, 10 Mar 2025 18:46:36 +0000
Date: Tue, 11 Mar 2025 02:46:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [v3 PATCH 7/8] crypto: scomp - Remove support for most
 non-trivial destination SG lists
Message-ID: <202503110237.GjZvyi0K-lkp@intel.com>
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
In-Reply-To: <205f05023b5ff0d8cf7deb6e0a5fbb4643f02e00.1741488107.git.herbert@gondor.apana.org.au>
References: <205f05023b5ff0d8cf7deb6e0a5fbb4643f02e00.1741488107.git.herbert@gondor.apana.org.au>
TO: Herbert Xu <herbert@gondor.apana.org.au>
TO: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
CC: Yosry Ahmed <yosry.ahmed@linux.dev>
CC: Kanchana P Sridhar <kanchana.p.sridhar@intel.com>
CC: Sergey Senozhatsky <senozhatsky@chromium.org>

Hi Herbert,

kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[cannot apply to linus/master v6.14-rc6 next-20250307]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herbert-Xu/crypto-api-Add-cra_type-destroy-hook/20250309-104526
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/205f05023b5ff0d8cf7deb6e0a5fbb4643f02e00.1741488107.git.herbert%40gondor.apana.org.au
patch subject: [v3 PATCH 7/8] crypto: scomp - Remove support for most non-trivial destination SG lists
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: um-randconfig-r072-20250310 (https://download.01.org/0day-ci/archive/20250311/202503110237.GjZvyi0K-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e15545cad8297ec7555f26e5ae74a9f0511203e7)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503110237.GjZvyi0K-lkp@intel.com/

New smatch warnings:
crypto/scompress.c:180 scomp_acomp_comp_decomp() error: we previously assumed 'req->dst' could be null (see line 174)

Old smatch warnings:
crypto/scompress.c:190 scomp_acomp_comp_decomp() error: uninitialized symbol 'scratch'.

vim +180 crypto/scompress.c

6a8487a1f29fa28 Ard Biesheuvel            2017-07-21  158  
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  159  static int scomp_acomp_comp_decomp(struct acomp_req *req, int dir)
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  160  {
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  161  	struct crypto_acomp *tfm = crypto_acomp_reqtfm(req);
5b855462cc7e3f3 Herbert Xu                2025-03-09  162  	struct crypto_scomp **tfm_ctx = acomp_tfm_ctx(tfm);
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  163  	struct crypto_scomp *scomp = *tfm_ctx;
e77b9947333baa6 Herbert Xu                2025-03-09  164  	struct crypto_acomp_stream *stream;
71052dcf4be70be Sebastian Andrzej Siewior 2019-03-29  165  	struct scomp_scratch *scratch;
5b855462cc7e3f3 Herbert Xu                2025-03-09  166  	unsigned int slen = req->slen;
5b855462cc7e3f3 Herbert Xu                2025-03-09  167  	unsigned int dlen = req->dlen;
77292bb8ca69c80 Barry Song                2024-03-02  168  	void *src, *dst;
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  169  	int ret;
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  170  
5b855462cc7e3f3 Herbert Xu                2025-03-09  171  	if (!req->src || !slen)
71052dcf4be70be Sebastian Andrzej Siewior 2019-03-29  172  		return -EINVAL;
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  173  
5b855462cc7e3f3 Herbert Xu                2025-03-09 @174  	if (req->dst && !dlen)
71052dcf4be70be Sebastian Andrzej Siewior 2019-03-29  175  		return -EINVAL;
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  176  
5b855462cc7e3f3 Herbert Xu                2025-03-09  177  	if (sg_nents(req->dst) > 1)
5b855462cc7e3f3 Herbert Xu                2025-03-09  178  		return -ENOSYS;
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  179  
5b855462cc7e3f3 Herbert Xu                2025-03-09 @180  	if (req->dst->offset >= PAGE_SIZE)
5b855462cc7e3f3 Herbert Xu                2025-03-09  181  		return -ENOSYS;
744e1885922a994 Chengming Zhou            2023-12-27  182  
5b855462cc7e3f3 Herbert Xu                2025-03-09  183  	if (req->dst->offset + dlen > PAGE_SIZE)
5b855462cc7e3f3 Herbert Xu                2025-03-09  184  		dlen = PAGE_SIZE - req->dst->offset;
71052dcf4be70be Sebastian Andrzej Siewior 2019-03-29  185  
5b855462cc7e3f3 Herbert Xu                2025-03-09  186  	if (sg_nents(req->src) == 1 && (!PageHighMem(sg_page(req->src)) ||
5b855462cc7e3f3 Herbert Xu                2025-03-09  187  					req->src->offset + slen <= PAGE_SIZE))
5b855462cc7e3f3 Herbert Xu                2025-03-09  188  		src = kmap_local_page(sg_page(req->src)) + req->src->offset;
5b855462cc7e3f3 Herbert Xu                2025-03-09  189  	else
77292bb8ca69c80 Barry Song                2024-03-02  190  		src = scratch->src;
77292bb8ca69c80 Barry Song                2024-03-02  191  
5b855462cc7e3f3 Herbert Xu                2025-03-09  192  	dst = kmap_local_page(sg_page(req->dst)) + req->dst->offset;
5b855462cc7e3f3 Herbert Xu                2025-03-09  193  
5b855462cc7e3f3 Herbert Xu                2025-03-09  194  	scratch = raw_cpu_ptr(&scomp_scratch);
5b855462cc7e3f3 Herbert Xu                2025-03-09  195  	spin_lock_bh(&scratch->lock);
5b855462cc7e3f3 Herbert Xu                2025-03-09  196  
5b855462cc7e3f3 Herbert Xu                2025-03-09  197  	if (src == scratch->src)
5b855462cc7e3f3 Herbert Xu                2025-03-09  198  		memcpy_from_sglist(src, req->src, 0, req->slen);
77292bb8ca69c80 Barry Song                2024-03-02  199  
e77b9947333baa6 Herbert Xu                2025-03-09  200  	stream = raw_cpu_ptr(crypto_scomp_alg(scomp)->stream);
e77b9947333baa6 Herbert Xu                2025-03-09  201  	spin_lock(&stream->lock);
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  202  	if (dir)
77292bb8ca69c80 Barry Song                2024-03-02  203  		ret = crypto_scomp_compress(scomp, src, req->slen,
e77b9947333baa6 Herbert Xu                2025-03-09  204  					    dst, &req->dlen, stream->ctx);
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  205  	else
77292bb8ca69c80 Barry Song                2024-03-02  206  		ret = crypto_scomp_decompress(scomp, src, req->slen,
e77b9947333baa6 Herbert Xu                2025-03-09  207  					      dst, &req->dlen, stream->ctx);
e77b9947333baa6 Herbert Xu                2025-03-09  208  	spin_unlock(&stream->lock);
5b9b6654797d766 Herbert Xu                2025-03-09  209  	spin_unlock_bh(&scratch->lock);
5b855462cc7e3f3 Herbert Xu                2025-03-09  210  
5b855462cc7e3f3 Herbert Xu                2025-03-09  211  	if (src != scratch->src)
5b855462cc7e3f3 Herbert Xu                2025-03-09  212  		kunmap_local(src);
5b855462cc7e3f3 Herbert Xu                2025-03-09  213  	kunmap_local(dst);
5b855462cc7e3f3 Herbert Xu                2025-03-09  214  	flush_dcache_page(sg_page(req->dst));
5b855462cc7e3f3 Herbert Xu                2025-03-09  215  
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  216  	return ret;
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  217  }
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  218  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
