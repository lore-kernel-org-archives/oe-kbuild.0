Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8086C2EB10
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Nov 2024 01:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730683387; cv=none; b=s4M79R/hwK6T81yW9uiYhts8iWwO0rVk1Bl24pvFkuBRCYeVVTHLn/M94W3KmetQJ3GZaW+N4HS0cRoexCAT9OdW75KpxbKjgTlFz5fgIj8gPkhcX9V/N+XmmKRmuse7OfVO7lm42jbehhMxTtD+vaVp2ies4umHhuDV0hfej6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730683387; c=relaxed/simple;
	bh=PacTRNn8lqOmJcoMVYy61TcpSGvUZi4w2wCvNoqz98U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lhJ5RGg3MbOYTxF/0jJ1oA5gst8ay4yvIBCoYAO4lT4ROIJ3l1+kQS4N+RLgyZD4aZXSobhsKszlZHzxnvqTN4D7zvfJX2xqX20VLs/FlxeiFVu3ij+VVMI7OmjE8sBTW2JsP9hNDDZqRNa9LqWQ+Z+FcttVhvyiXp5zdY1T62A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WgSqcREN; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WgSqcREN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730683386; x=1762219386;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PacTRNn8lqOmJcoMVYy61TcpSGvUZi4w2wCvNoqz98U=;
  b=WgSqcRENdJhlzMyMIxVgUVd7AKN81oOnF07hM1XZDBZzuhoccxwY3p9X
   4xepnXBz52h/zFPP8kACloHa/WCEPxISWc2FbaAjQXHTA6OuyVtASgfts
   Ug3zVK243tvLx73uFNS2oA8tQFpjXn6a+GnQBfU7KQPPyKeZWGTHQOreG
   M6oJIWsdWlR1/3Kw3xQmaQs8KEJociNwXnhfIERvCQ51alWNctA23RMQC
   UojK4ojf2IsDwOIbzDmQVc9RKERlw0ZiEz8MvbUvM4JIYqle0+0+WwjMC
   qXBtxmONV7VdzMN8i6kQLqTK2PhcHYZEgCOT56X5RbJ0UeuTd7LudBsaO
   Q==;
X-CSE-ConnectionGUID: OsaLePSORESytzAnNbB5JQ==
X-CSE-MsgGUID: I9tM4rQOSGaIFSlzNbDh0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30143568"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30143568"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 17:23:06 -0800
X-CSE-ConnectionGUID: 0SV2VAuVTpaGDoygPu9n/A==
X-CSE-MsgGUID: 7JjgsQxbRgCddRNigOjgaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="88264629"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 03 Nov 2024 17:23:03 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7lo5-000kLh-21;
	Mon, 04 Nov 2024 01:23:01 +0000
Date: Mon, 4 Nov 2024 09:22:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 13/13] mm: zswap: Compress batching with Intel IAA in
 zswap_store() of large folios.
Message-ID: <202411040859.2z0MfFkR-lkp@intel.com>
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
In-Reply-To: <20241103032111.333282-14-kanchana.p.sridhar@intel.com>
References: <20241103032111.333282-14-kanchana.p.sridhar@intel.com>
TO: Kanchana P Sridhar <kanchana.p.sridhar@intel.com>
TO: linux-kernel@vger.kernel.org
TO: linux-mm@kvack.org
TO: hannes@cmpxchg.org
TO: yosryahmed@google.com
TO: nphamcs@gmail.com
TO: chengming.zhou@linux.dev
TO: usamaarif642@gmail.com
TO: ryan.roberts@arm.com
TO: ying.huang@intel.com
TO: 21cnbao@gmail.com
TO: akpm@linux-foundation.org
TO: linux-crypto@vger.kernel.org
TO: herbert@gondor.apana.org.au
TO: davem@davemloft.net
TO: clabbe@baylibre.com
TO: ardb@kernel.org
TO: ebiggers@google.com
TO: surenb@google.com
TO: kristen.c.accardi@intel.com
TO: zanussi@kernel.org
CC: wajdi.k.feghali@intel.com
CC: vinodh.gopal@intel.com
CC: kanchana.p.sridhar@intel.com

Hi Kanchana,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 5c4cf96cd70230100b5d396d45a5c9a332539d19]

url:    https://github.com/intel-lab-lkp/linux/commits/Kanchana-P-Sridhar/crypto-acomp-Define-two-new-interfaces-for-compress-decompress-batching/20241103-112337
base:   5c4cf96cd70230100b5d396d45a5c9a332539d19
patch link:    https://lore.kernel.org/r/20241103032111.333282-14-kanchana.p.sridhar%40intel.com
patch subject: [PATCH v2 13/13] mm: zswap: Compress batching with Intel IAA in zswap_store() of large folios.
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: x86_64-randconfig-161-20241104 (https://download.01.org/0day-ci/archive/20241104/202411040859.2z0MfFkR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411040859.2z0MfFkR-lkp@intel.com/

smatch warnings:
mm/zswap.c:1788 zswap_store_propagate_errors() warn: variable dereferenced before check 'sbp->entry' (see line 1785)

vim +1788 mm/zswap.c

2b2811178e8555 Seth Jennings      2013-07-10  1761  
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1762  /*
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1763   * Note: If SWAP_CRYPTO_BATCH_SIZE exceeds 256, change the
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1764   * u8 stack variables in the next several functions, to u16.
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1765   */
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1766  
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1767  /*
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1768   * Propagate the "sbp" error condition to other batch elements belonging to
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1769   * the same folio as "sbp".
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1770   */
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1771  static __always_inline void zswap_store_propagate_errors(
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1772  	struct zswap_store_pipeline_state *zst,
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1773  	u8 error_batch_idx)
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1774  {
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1775  	u8 i;
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1776  
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1777  	if (zst->errors[error_batch_idx])
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1778  		return;
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1779  
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1780  	for (i = 0; i < zst->nr_comp_pages; ++i) {
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1781  		struct zswap_store_sub_batch_page *sbp = &zst->sub_batch[i];
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1782  
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1783  		if (sbp->batch_idx == error_batch_idx) {
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1784  			if (!sbp->error) {
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02 @1785  				if (!IS_ERR_VALUE(sbp->entry->handle))
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1786  					zpool_free(zst->pool->zpool, sbp->entry->handle);
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1787  
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02 @1788  				if (sbp->entry) {
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1789  					zswap_entry_cache_free(sbp->entry);
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1790  					sbp->entry = NULL;
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1791  				}
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1792  				sbp->error = -EINVAL;
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1793  			}
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1794  		}
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1795  	}
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1796  
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1797  	/*
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1798  	 * Set zswap status for the folio to "error"
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1799  	 * for use in swap_writepage.
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1800  	 */
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1801  	zst->errors[error_batch_idx] = -EINVAL;
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1802  }
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1803  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
