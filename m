Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C971428F3
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Nov 2024 21:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731272990; cv=none; b=i677IEF5sK36O3ID2KhFfA2+a7LXq3KH7mcctvoUIt8QJrvdnzPkFSa2YEkNLDWIK450QlIOoYT7ucKYoBPCNTmh7ANU6Uypi2laE/+r5hG7+Ey729C3rsmUaQwrUd7SYUpH5n4XgrmzpS9E5eAkVpZM6Y3lljCfZExtgR28bMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731272990; c=relaxed/simple;
	bh=jdoVA5QCOmvJdRskpE3kE5LBtImeDX2oWaxA5+w1KFE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K4GIEB+l8GrraUqyUzsbyElJaacUaICGNqdlgCSn8vauWOMrI+JYCTeR8uhmidoFuFJGWDMKc/66weXDPk3vkYIvG3MeWGFtGSPJgHejacjVwk5rfagt6ESkYjV+SmBOtZ/VQp9zS4d2UAjcX468n/7oCLkI/m+hkDt52vi0TQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BZ/J197C; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BZ/J197C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731272988; x=1762808988;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jdoVA5QCOmvJdRskpE3kE5LBtImeDX2oWaxA5+w1KFE=;
  b=BZ/J197C3N7tjmXLne+hOTUEaYmNwnwVXH53z8Hf6mxQOEzSZuFtUu84
   rOZ3ZYaqGVafoAVJRzKwSVpK024NMNBgwOeBeKQvqNx6m8Jpjo9GisFAv
   59xQ6Fdkbv/AB3O1goD0zW7b/1U0q2bpkBYSthPosh79a00HKLiqEkHa/
   Sn3TYL8eshDv2EZuaBxWE6p574lcQvPcpbf9IVqUzmSgqKg8NvPMsRIqz
   3eGkXMyT3fgK7oAtifSfYCjDdzTAh1SkxE+AIVHEUKScljsbLxCBg3ecc
   7Dq9a/29XJBK9k4hZRtDeExVwq7s+FJPfeB3pPzqcf+YNjMXaLIlkXkBV
   g==;
X-CSE-ConnectionGUID: WIFBZKViS0WZwSLzJFX1aw==
X-CSE-MsgGUID: dOeswGSiQFeDtqljqhevbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31241672"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31241672"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 13:09:48 -0800
X-CSE-ConnectionGUID: Li/2NZbrTkeXeVJUT66Nqg==
X-CSE-MsgGUID: oLfZlXqgRf60yIUQrTjScA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,143,1728975600"; 
   d="scan'208";a="87018254"
Received: from lkp-server01.sh.intel.com (HELO 7b17a4138caf) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Nov 2024 13:09:45 -0800
Received: from kbuild by 7b17a4138caf with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAFBn-0000P3-06;
	Sun, 10 Nov 2024 21:09:43 +0000
Date: Mon, 11 Nov 2024 05:09:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/crypto/stm32/stm32-hash.c:732 stm32_hash_dma_send() error:
 uninitialized symbol 'last_word'.
Message-ID: <202411110533.d31WG9XI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Maxime Méré" <maxime.mere@foss.st.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a9cda7c0ffedb47b23002e109bd26ab2a2ab99c9
commit: 3525fe475245ec5e8bc119749d31a727bc8f41ab crypto: stm32/hash - add full DMA support for stm32mpx
date:   7 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-r071-20241110 (https://download.01.org/0day-ci/archive/20241111/202411110533.d31WG9XI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411110533.d31WG9XI-lkp@intel.com/

smatch warnings:
drivers/crypto/stm32/stm32-hash.c:732 stm32_hash_dma_send() error: uninitialized symbol 'last_word'.

vim +/last_word +732 drivers/crypto/stm32/stm32-hash.c

8a1012d3f2abce lionel.debieve@st.com 2017-07-13  655  
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  656  static int stm32_hash_dma_send(struct stm32_hash_dev *hdev)
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  657  {
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  658  	struct stm32_hash_request_ctx *rctx = ahash_request_ctx(hdev->req);
c0c5d6428b3888 Herbert Xu            2023-03-11  659  	u32 *buffer = (void *)rctx->state.buffer;
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  660  	struct scatterlist sg[1], *tsg;
a10618f3970628 Thomas Bourgoin       2023-07-13  661  	int err = 0, reg, ncp = 0;
a10618f3970628 Thomas Bourgoin       2023-07-13  662  	unsigned int i, len = 0, bufcnt = 0;
3525fe475245ec Maxime Méré           2024-04-12  663  	bool final = hdev->flags & HASH_FLAGS_FINAL;
a10618f3970628 Thomas Bourgoin       2023-07-13  664  	bool is_last = false;
3525fe475245ec Maxime Méré           2024-04-12  665  	u32 last_word;
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  666  
3525fe475245ec Maxime Méré           2024-04-12  667  	dev_dbg(hdev->dev, "%s total: %d bufcnt: %d final: %d\n",
3525fe475245ec Maxime Méré           2024-04-12  668  		__func__, rctx->total, rctx->state.bufcnt, final);
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  669  
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  670  	if (rctx->nents < 0)
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  671  		return -EINVAL;
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  672  
0e99d38ff6ad4b Thomas Bourgoin       2023-07-13  673  	stm32_hash_write_ctrl(hdev);
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  674  
3525fe475245ec Maxime Méré           2024-04-12  675  	if (hdev->flags & HASH_FLAGS_HMAC && (!(hdev->flags & HASH_FLAGS_HMAC_KEY))) {
3525fe475245ec Maxime Méré           2024-04-12  676  		hdev->flags |= HASH_FLAGS_HMAC_KEY;
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  677  		err = stm32_hash_hmac_dma_send(hdev);
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  678  		if (err != -EINPROGRESS)
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  679  			return err;
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  680  	}
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  681  
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  682  	for_each_sg(rctx->sg, tsg, rctx->nents, i) {
d9c83f71eeceed Thomas Bourgoin       2023-07-13  683  		sg[0] = *tsg;
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  684  		len = sg->length;
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  685  
a10618f3970628 Thomas Bourgoin       2023-07-13  686  		if (sg_is_last(sg) || (bufcnt + sg[0].length) >= rctx->total) {
3525fe475245ec Maxime Méré           2024-04-12  687  			if (!final) {
3525fe475245ec Maxime Méré           2024-04-12  688  				/* Always manually put the last word of a non-final transfer. */
3525fe475245ec Maxime Méré           2024-04-12  689  				len -= sizeof(u32);
3525fe475245ec Maxime Méré           2024-04-12  690  				sg_pcopy_to_buffer(rctx->sg, rctx->nents, &last_word, 4, len);
3525fe475245ec Maxime Méré           2024-04-12  691  				sg->length -= sizeof(u32);
3525fe475245ec Maxime Méré           2024-04-12  692  			} else {
3525fe475245ec Maxime Méré           2024-04-12  693  				/*
3525fe475245ec Maxime Méré           2024-04-12  694  				 * In Multiple DMA mode, DMA must be aborted before the final
3525fe475245ec Maxime Méré           2024-04-12  695  				 * transfer.
3525fe475245ec Maxime Méré           2024-04-12  696  				 */
a10618f3970628 Thomas Bourgoin       2023-07-13  697  				sg->length = rctx->total - bufcnt;
3525fe475245ec Maxime Méré           2024-04-12  698  				if (hdev->dma_mode > 0) {
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  699  					len = (ALIGN(sg->length, 16) - 16);
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  700  
3525fe475245ec Maxime Méré           2024-04-12  701  					ncp = sg_pcopy_to_buffer(rctx->sg, rctx->nents,
3525fe475245ec Maxime Méré           2024-04-12  702  								 rctx->state.buffer,
3525fe475245ec Maxime Méré           2024-04-12  703  								 sg->length - len,
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  704  								 rctx->total - sg->length + len);
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  705  
3525fe475245ec Maxime Méré           2024-04-12  706  					if (!len)
3525fe475245ec Maxime Méré           2024-04-12  707  						break;
3525fe475245ec Maxime Méré           2024-04-12  708  
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  709  					sg->length = len;
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  710  				} else {
3525fe475245ec Maxime Méré           2024-04-12  711  					is_last = true;
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  712  					if (!(IS_ALIGNED(sg->length, sizeof(u32)))) {
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  713  						len = sg->length;
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  714  						sg->length = ALIGN(sg->length,
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  715  								   sizeof(u32));
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  716  					}
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  717  				}
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  718  			}
3525fe475245ec Maxime Méré           2024-04-12  719  		}
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  720  
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  721  		rctx->dma_ct = dma_map_sg(hdev->dev, sg, 1,
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  722  					  DMA_TO_DEVICE);
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  723  		if (rctx->dma_ct == 0) {
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  724  			dev_err(hdev->dev, "dma_map_sg error\n");
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  725  			return -ENOMEM;
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  726  		}
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  727  
a10618f3970628 Thomas Bourgoin       2023-07-13  728  		err = stm32_hash_xmit_dma(hdev, sg, len, !is_last);
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  729  
3525fe475245ec Maxime Méré           2024-04-12  730  		/* The last word of a non final transfer is sent manually. */
3525fe475245ec Maxime Méré           2024-04-12  731  		if (!final) {
3525fe475245ec Maxime Méré           2024-04-12 @732  			stm32_hash_write(hdev, HASH_DIN, last_word);
3525fe475245ec Maxime Méré           2024-04-12  733  			len += sizeof(u32);
3525fe475245ec Maxime Méré           2024-04-12  734  		}
3525fe475245ec Maxime Méré           2024-04-12  735  
3525fe475245ec Maxime Méré           2024-04-12  736  		rctx->total -= len;
3525fe475245ec Maxime Méré           2024-04-12  737  
a10618f3970628 Thomas Bourgoin       2023-07-13  738  		bufcnt += sg[0].length;
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  739  		dma_unmap_sg(hdev->dev, sg, 1, DMA_TO_DEVICE);
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  740  
3525fe475245ec Maxime Méré           2024-04-12  741  		if (err == -ENOMEM || err == -ETIMEDOUT)
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  742  			return err;
a10618f3970628 Thomas Bourgoin       2023-07-13  743  		if (is_last)
a10618f3970628 Thomas Bourgoin       2023-07-13  744  			break;
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  745  	}
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  746  
3525fe475245ec Maxime Méré           2024-04-12  747  	/*
3525fe475245ec Maxime Méré           2024-04-12  748  	 * When the second last block transfer of 4 words is performed by the DMA,
3525fe475245ec Maxime Méré           2024-04-12  749  	 * the software must set the DMA Abort bit (DMAA) to 1 before completing the
3525fe475245ec Maxime Méré           2024-04-12  750  	 * last transfer of 4 words or less.
3525fe475245ec Maxime Méré           2024-04-12  751  	 */
3525fe475245ec Maxime Méré           2024-04-12  752  	if (final) {
3525fe475245ec Maxime Méré           2024-04-12  753  		if (hdev->dma_mode > 0) {
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  754  			if (stm32_hash_wait_busy(hdev))
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  755  				return -ETIMEDOUT;
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  756  			reg = stm32_hash_read(hdev, HASH_CR);
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  757  			reg &= ~HASH_CR_DMAE;
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  758  			reg |= HASH_CR_DMAA;
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  759  			stm32_hash_write(hdev, HASH_CR, reg);
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  760  
532f419cde077f Arnd Bergmann         2017-09-12  761  			if (ncp) {
3525fe475245ec Maxime Méré           2024-04-12  762  				memset(buffer + ncp, 0, 4 - DIV_ROUND_UP(ncp, sizeof(u32)));
532f419cde077f Arnd Bergmann         2017-09-12  763  				writesl(hdev->io_base + HASH_DIN, buffer,
532f419cde077f Arnd Bergmann         2017-09-12  764  					DIV_ROUND_UP(ncp, sizeof(u32)));
532f419cde077f Arnd Bergmann         2017-09-12  765  			}
3525fe475245ec Maxime Méré           2024-04-12  766  
d03d29bd1857b2 Lionel Debieve        2018-01-29  767  			stm32_hash_set_nblw(hdev, ncp);
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  768  			reg = stm32_hash_read(hdev, HASH_STR);
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  769  			reg |= HASH_STR_DCAL;
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  770  			stm32_hash_write(hdev, HASH_STR, reg);
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  771  			err = -EINPROGRESS;
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  772  		}
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  773  
3525fe475245ec Maxime Méré           2024-04-12  774  		/*
3525fe475245ec Maxime Méré           2024-04-12  775  		 * The hash processor needs the key to be loaded a second time in order
3525fe475245ec Maxime Méré           2024-04-12  776  		 * to process the HMAC.
3525fe475245ec Maxime Méré           2024-04-12  777  		 */
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  778  		if (hdev->flags & HASH_FLAGS_HMAC) {
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  779  			if (stm32_hash_wait_busy(hdev))
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  780  				return -ETIMEDOUT;
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  781  			err = stm32_hash_hmac_dma_send(hdev);
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  782  		}
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  783  
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  784  		return err;
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  785  	}
8a1012d3f2abce lionel.debieve@st.com 2017-07-13  786  
3525fe475245ec Maxime Méré           2024-04-12  787  	if (err != -EINPROGRESS)
3525fe475245ec Maxime Méré           2024-04-12  788  		return err;
3525fe475245ec Maxime Méré           2024-04-12  789  
3525fe475245ec Maxime Méré           2024-04-12  790  	return 0;
3525fe475245ec Maxime Méré           2024-04-12  791  }
3525fe475245ec Maxime Méré           2024-04-12  792  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
