Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94CA21770B
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Mar 2025 05:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742188416; cv=none; b=gy/kwVJjEDjRkmQcQxsthYkw5uO8Rhy6HP5XhInQ3vBPP/yzjmZTd9pJYurnLdem3caed2zbCKAXuiTWXBQKNzLF613aX4bJcFbdrm2EnT5MEYGaGG8onSVgaj8IgWgzvnufmLVzdg6Jq6H62bAL2qY9HcWSzM8eXm4suXhU8e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742188416; c=relaxed/simple;
	bh=Y77PZkUwZqhYqw0WthDFPNfPyocCoJX4Qy7kPR7CyHs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cmVKz696PSOxg9l9TzM2HSn830nAWTcSW55k68bnS9UaLS71uICSyLHOuF9MaVvYbIhXeBDb9unOx2Vk6Ai4zrcCdJSi0RUr8wdoNK+HzaEoJPw3ob36LfbuJP5SS+Xhx44hQ+0w/+WFq1jYLjS984LnRZ+69aZZCuTudxlxXeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UBT0pTkq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UBT0pTkq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742188414; x=1773724414;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y77PZkUwZqhYqw0WthDFPNfPyocCoJX4Qy7kPR7CyHs=;
  b=UBT0pTkqcQYaIUHSiOOy+Evjnwkqf6r/B53jrn40O98rEBKof4i9cJbW
   Et0VfPgF72gwcmjA0TKi5HQh5jPD3johVH35pcbNm+53OXNHx95VeJiTO
   KvU0VB4q7L96mEWMYdiMvz6sgCZljtXM0KhJLrgQDIo5kWbVBubZYnXUq
   uZWkKTl7fsIwp9kT6txKU4V8GnVGUWA6SfwyxtUAdwTn8FLfQ2O5cPVfF
   +IGqZHEV6DhDpc5dUnapu/+xNHGoCyvcX2zf9GFdTfKnnLynpE/A0Jdbx
   3mG0lGZpmLnZvQkdTRb7B5S+wnoYeEpReTZYaVHRRF0dnbaxn4x6O5JRC
   g==;
X-CSE-ConnectionGUID: UJCcYTzHQyCYeou8npQSUQ==
X-CSE-MsgGUID: zHiuuBdHTf6V35mOMrWAbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="43003562"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="43003562"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2025 22:13:33 -0700
X-CSE-ConnectionGUID: QNYVIh48Tk2ABYVR79YkRw==
X-CSE-MsgGUID: /q6zOmBpRKuYS95o8V2N1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="126019644"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 16 Mar 2025 22:13:31 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tu2n3-000CTH-1f;
	Mon, 17 Mar 2025 05:13:29 +0000
Date: Mon, 17 Mar 2025 13:13:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [herbert-cryptodev-2.6:acomp 113/121] crypto/scompress.c:253
 scomp_acomp_comp_decomp() error: uninitialized symbol 'doff'.
Message-ID: <202503171349.aZTlTHI8-lkp@intel.com>
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
CC: linux-crypto@vger.kernel.org
TO: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git acomp
head:   2ffb998673ca977108a379721e7e743bdc2b44cd
commit: c89cc6e2c4e5158e16a2d1b8b93a3d7cadd809e6 [113/121] crypto: scomp - Add chaining and virtual address support
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: powerpc64-randconfig-r072-20250317 (https://download.01.org/0day-ci/archive/20250317/202503171349.aZTlTHI8-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503171349.aZTlTHI8-lkp@intel.com/

smatch warnings:
crypto/scompress.c:253 scomp_acomp_comp_decomp() error: uninitialized symbol 'doff'.
crypto/scompress.c:255 scomp_acomp_comp_decomp() error: uninitialized symbol 'dpage'.

vim +/doff +253 crypto/scompress.c

6a8487a1f29fa28 Ard Biesheuvel            2017-07-21  169  
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  170  static int scomp_acomp_comp_decomp(struct acomp_req *req, int dir)
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  171  {
9f944a416617eec Herbert Xu                2025-02-27  172  	struct scomp_scratch *scratch = raw_cpu_ptr(&scomp_scratch);
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  173  	struct crypto_acomp *tfm = crypto_acomp_reqtfm(req);
9f944a416617eec Herbert Xu                2025-02-27  174  	struct crypto_scomp **tfm_ctx = acomp_tfm_ctx(tfm);
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  175  	struct crypto_scomp *scomp = *tfm_ctx;
25f96a0e0e642e9 Herbert Xu                2025-03-04  176  	struct crypto_acomp_stream *stream;
9f944a416617eec Herbert Xu                2025-02-27  177  	unsigned int slen = req->slen;
9f944a416617eec Herbert Xu                2025-02-27  178  	unsigned int dlen = req->dlen;
9f944a416617eec Herbert Xu                2025-02-27  179  	struct page *spage, *dpage;
9f944a416617eec Herbert Xu                2025-02-27  180  	unsigned int soff, doff;
9f944a416617eec Herbert Xu                2025-02-27  181  	unsigned int n;
c89cc6e2c4e5158 Herbert Xu                2025-02-27  182  	const u8 *src;
c89cc6e2c4e5158 Herbert Xu                2025-02-27  183  	u8 *dst;
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  184  	int ret;
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  185  
9f944a416617eec Herbert Xu                2025-02-27  186  	if (!req->src || !slen)
71052dcf4be70be Sebastian Andrzej Siewior 2019-03-29  187  		return -EINVAL;
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  188  
9f944a416617eec Herbert Xu                2025-02-27  189  	if (!req->dst || !dlen)
71052dcf4be70be Sebastian Andrzej Siewior 2019-03-29  190  		return -EINVAL;
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  191  
c89cc6e2c4e5158 Herbert Xu                2025-02-27  192  	if (acomp_request_src_isvirt(req))
c89cc6e2c4e5158 Herbert Xu                2025-02-27  193  		src = req->svirt;
c89cc6e2c4e5158 Herbert Xu                2025-02-27  194  	else {
9f944a416617eec Herbert Xu                2025-02-27  195  		soff = req->src->offset;
9f944a416617eec Herbert Xu                2025-02-27  196  		spage = nth_page(sg_page(req->src), soff / PAGE_SIZE);
9f944a416617eec Herbert Xu                2025-02-27  197  		soff = offset_in_page(soff);
744e1885922a994 Chengming Zhou            2023-12-27  198  
9f944a416617eec Herbert Xu                2025-02-27  199  		n = slen / PAGE_SIZE;
9f944a416617eec Herbert Xu                2025-02-27  200  		n += (offset_in_page(slen) + soff - 1) / PAGE_SIZE;
c89cc6e2c4e5158 Herbert Xu                2025-02-27  201  		if (slen <= req->src->length &&
c89cc6e2c4e5158 Herbert Xu                2025-02-27  202  		    (!PageHighMem(nth_page(spage, n)) ||
9f944a416617eec Herbert Xu                2025-02-27  203  		     size_add(soff, slen) <= PAGE_SIZE))
9f944a416617eec Herbert Xu                2025-02-27  204  			src = kmap_local_page(spage) + soff;
9f944a416617eec Herbert Xu                2025-02-27  205  		else
77292bb8ca69c80 Barry Song                2024-03-02  206  			src = scratch->src;
c89cc6e2c4e5158 Herbert Xu                2025-02-27  207  	}
77292bb8ca69c80 Barry Song                2024-03-02  208  
c89cc6e2c4e5158 Herbert Xu                2025-02-27  209  	if (acomp_request_dst_isvirt(req))
c89cc6e2c4e5158 Herbert Xu                2025-02-27  210  		dst = req->dvirt;
c89cc6e2c4e5158 Herbert Xu                2025-02-27  211  	else {
9f944a416617eec Herbert Xu                2025-02-27  212  		doff = req->dst->offset;
9f944a416617eec Herbert Xu                2025-02-27  213  		dpage = nth_page(sg_page(req->dst), doff / PAGE_SIZE);
9f944a416617eec Herbert Xu                2025-02-27  214  		doff = offset_in_page(doff);
9f944a416617eec Herbert Xu                2025-02-27  215  
9f944a416617eec Herbert Xu                2025-02-27  216  		n = dlen / PAGE_SIZE;
9f944a416617eec Herbert Xu                2025-02-27  217  		n += (offset_in_page(dlen) + doff - 1) / PAGE_SIZE;
c89cc6e2c4e5158 Herbert Xu                2025-02-27  218  		if (dlen <= req->dst->length &&
c89cc6e2c4e5158 Herbert Xu                2025-02-27  219  		    (!PageHighMem(nth_page(dpage, n)) ||
9f944a416617eec Herbert Xu                2025-02-27  220  		     size_add(doff, dlen) <= PAGE_SIZE))
9f944a416617eec Herbert Xu                2025-02-27  221  			dst = kmap_local_page(dpage) + doff;
9f944a416617eec Herbert Xu                2025-02-27  222  		else {
9f944a416617eec Herbert Xu                2025-02-27  223  			if (dlen > SCOMP_SCRATCH_SIZE)
9f944a416617eec Herbert Xu                2025-02-27  224  				dlen = SCOMP_SCRATCH_SIZE;
77292bb8ca69c80 Barry Song                2024-03-02  225  			dst = scratch->dst;
9f944a416617eec Herbert Xu                2025-02-27  226  		}
c89cc6e2c4e5158 Herbert Xu                2025-02-27  227  	}
9f944a416617eec Herbert Xu                2025-02-27  228  
9f944a416617eec Herbert Xu                2025-02-27  229  	spin_lock_bh(&scratch->lock);
9f944a416617eec Herbert Xu                2025-02-27  230  
9f944a416617eec Herbert Xu                2025-02-27  231  	if (src == scratch->src)
c89cc6e2c4e5158 Herbert Xu                2025-02-27  232  		memcpy_from_sglist(scratch->src, req->src, 0, slen);
77292bb8ca69c80 Barry Song                2024-03-02  233  
25f96a0e0e642e9 Herbert Xu                2025-03-04  234  	stream = raw_cpu_ptr(crypto_scomp_alg(scomp)->stream);
25f96a0e0e642e9 Herbert Xu                2025-03-04  235  	spin_lock(&stream->lock);
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  236  	if (dir)
9f944a416617eec Herbert Xu                2025-02-27  237  		ret = crypto_scomp_compress(scomp, src, slen,
9f944a416617eec Herbert Xu                2025-02-27  238  					    dst, &dlen, stream->ctx);
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  239  	else
9f944a416617eec Herbert Xu                2025-02-27  240  		ret = crypto_scomp_decompress(scomp, src, slen,
9f944a416617eec Herbert Xu                2025-02-27  241  					      dst, &dlen, stream->ctx);
9f944a416617eec Herbert Xu                2025-02-27  242  
9f944a416617eec Herbert Xu                2025-02-27  243  	if (dst == scratch->dst)
9f944a416617eec Herbert Xu                2025-02-27  244  		memcpy_to_sglist(req->dst, 0, dst, dlen);
9f944a416617eec Herbert Xu                2025-02-27  245  
25f96a0e0e642e9 Herbert Xu                2025-03-04  246  	spin_unlock(&stream->lock);
9f944a416617eec Herbert Xu                2025-02-27  247  	spin_unlock_bh(&scratch->lock);
9f944a416617eec Herbert Xu                2025-02-27  248  
9f944a416617eec Herbert Xu                2025-02-27  249  	req->dlen = dlen;
77292bb8ca69c80 Barry Song                2024-03-02  250  
c89cc6e2c4e5158 Herbert Xu                2025-02-27  251  	if (!acomp_request_dst_isvirt(req) && dst != scratch->dst) {
9f944a416617eec Herbert Xu                2025-02-27  252  		kunmap_local(dst);
9f944a416617eec Herbert Xu                2025-02-27 @253  		dlen += doff;
9f944a416617eec Herbert Xu                2025-02-27  254  		for (;;) {
9f944a416617eec Herbert Xu                2025-02-27 @255  			flush_dcache_page(dpage);
9f944a416617eec Herbert Xu                2025-02-27  256  			if (dlen <= PAGE_SIZE)
9f944a416617eec Herbert Xu                2025-02-27  257  				break;
9f944a416617eec Herbert Xu                2025-02-27  258  			dlen -= PAGE_SIZE;
9f944a416617eec Herbert Xu                2025-02-27  259  			dpage = nth_page(dpage, 1);
77292bb8ca69c80 Barry Song                2024-03-02  260  		}
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  261  	}
c89cc6e2c4e5158 Herbert Xu                2025-02-27  262  	if (!acomp_request_src_isvirt(req) && src != scratch->src)
9f944a416617eec Herbert Xu                2025-02-27  263  		kunmap_local(src);
9f944a416617eec Herbert Xu                2025-02-27  264  
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  265  	return ret;
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  266  }
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  267  

:::::: The code at line 253 was first introduced by commit
:::::: 9f944a416617eec51a550122bdc52d2e6645cc1d crypto: scomp - Remove support for some non-trivial SG lists

:::::: TO: Herbert Xu <herbert@gondor.apana.org.au>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
