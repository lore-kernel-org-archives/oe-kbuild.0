Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D632F5A32
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Oct 2025 23:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761780436; cv=none; b=TmmViqmce8gadOcUoKDyvQAV66M/6EaaI1BIN+UexDoWwsQMg4DiXkiu2QUvMAniB+QMFC73q3qcIFiPqhxNrlj/e85Fm/g2i02b6ztSsdEhbbRnZgeTJoyapKIa5Cdo5Qlu03XMPH4ZBlx9Ni+0nPbvFk1kA/eL/3vSrjvWOpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761780436; c=relaxed/simple;
	bh=W3w7pvoA7b/2ggWxSLvcadBwwwSgHmIGm3DE4vUMJqg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aScTdij5msYIFxCRFLPRQJz2ij+WlTq4SpmKiTTd+L1+xV0BHFc97xtzQqXXo09uIciMNqiLq9BmqsJZ7RMHIchcaOfToJ5z2BpvUQU0my4d4jenkcyMBQ8Z/oJLsxFgJVSKlxci/xbydz2bnai41P2fnfBM7mZ4P4PvJJagbu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gb1DYBEH; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gb1DYBEH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761780434; x=1793316434;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=W3w7pvoA7b/2ggWxSLvcadBwwwSgHmIGm3DE4vUMJqg=;
  b=Gb1DYBEHGo5pdZQk5X/MuiYecWEe6wCsADRiq5KSvULZKzQjmpxQIDkp
   4uZnSNHCDzwqr7lLI0ajVbxL5X7MJvRixYsvJMME+Rr+172agRd/FMwXA
   mYA2cCBmr/H7Yzt6HUCL2DyiXez1TUMNqe/lck3Cs5ULa6C2fw+ZjgOt1
   7FmEUNSpuLYQSX5HmgvBVD0dJVfVqHXasHDzQL+gjnV7uGHgITyY/DkWs
   NKuzFnJtPmvvA1OEBghiPOzXdjBos+oZrLMOrr+9e30R4PnrC9iRYPeMO
   iG133xFTwS2gpMcyoOnT+wdrrp1Lwu3wejj7jFItXuBY33rx73W0Mocpt
   Q==;
X-CSE-ConnectionGUID: smGVLxUhTGeT1TADUSDdHw==
X-CSE-MsgGUID: fDkD1PUFR3OoRrQ7ftcJ8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67750016"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67750016"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 16:27:13 -0700
X-CSE-ConnectionGUID: BKLWLwL5TrWaxbfHO8IBTQ==
X-CSE-MsgGUID: Pg31KGZcRq+FGogwDFj+9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="189868610"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 29 Oct 2025 16:27:12 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEFZN-000LGs-0R;
	Wed, 29 Oct 2025 23:27:09 +0000
Date: Thu, 30 Oct 2025 07:26:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: crypto/tcrypt.c:569:9-16: WARNING: Consider using %pe to print
 PTR_ERR()
Message-ID: <202510300734.DSevPoIV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Eric Biggers <ebiggers@google.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

Hi Eric,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6
commit: 3357b6c94569095f87a350bffa5a0a6e0c19c962 crypto: tcrypt - rename CRYPTO_TEST to CRYPTO_BENCHMARK
date:   6 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 6 months ago
config: powerpc-randconfig-r054-20251029 (https://download.01.org/0day-ci/archive/20251030/202510300734.DSevPoIV-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202510300734.DSevPoIV-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> crypto/tcrypt.c:569:9-16: WARNING: Consider using %pe to print PTR_ERR()
   crypto/tcrypt.c:879:15-22: WARNING: Consider using %pe to print PTR_ERR()
   crypto/tcrypt.c:280:9-16: WARNING: Consider using %pe to print PTR_ERR()
   crypto/tcrypt.c:1085:9-16: WARNING: Consider using %pe to print PTR_ERR()
   crypto/tcrypt.c:1317:9-16: WARNING: Consider using %pe to print PTR_ERR()

vim +569 crypto/tcrypt.c

53f52d7aecb4cb Tim Chen               2013-12-11  517  
3e3dc25fe7d5e3 Mark Rustad            2014-07-25  518  static void test_aead_speed(const char *algo, int enc, unsigned int secs,
53f52d7aecb4cb Tim Chen               2013-12-11  519  			    struct aead_speed_template *template,
53f52d7aecb4cb Tim Chen               2013-12-11  520  			    unsigned int tcount, u8 authsize,
53f52d7aecb4cb Tim Chen               2013-12-11  521  			    unsigned int aad_size, u8 *keysize)
53f52d7aecb4cb Tim Chen               2013-12-11  522  {
53f52d7aecb4cb Tim Chen               2013-12-11  523  	unsigned int i, j;
53f52d7aecb4cb Tim Chen               2013-12-11  524  	struct crypto_aead *tfm;
53f52d7aecb4cb Tim Chen               2013-12-11  525  	int ret = -ENOMEM;
53f52d7aecb4cb Tim Chen               2013-12-11  526  	const char *key;
53f52d7aecb4cb Tim Chen               2013-12-11  527  	struct aead_request *req;
53f52d7aecb4cb Tim Chen               2013-12-11  528  	struct scatterlist *sg;
53f52d7aecb4cb Tim Chen               2013-12-11  529  	struct scatterlist *sgout;
53f52d7aecb4cb Tim Chen               2013-12-11  530  	const char *e;
53f52d7aecb4cb Tim Chen               2013-12-11  531  	void *assoc;
96692a7305c498 Cristian Stoica        2015-01-28  532  	char *iv;
53f52d7aecb4cb Tim Chen               2013-12-11  533  	char *xbuf[XBUFSIZE];
53f52d7aecb4cb Tim Chen               2013-12-11  534  	char *xoutbuf[XBUFSIZE];
53f52d7aecb4cb Tim Chen               2013-12-11  535  	char *axbuf[XBUFSIZE];
ad6d66bcac77e5 Ard Biesheuvel         2020-11-20  536  	const int *b_size;
53f52d7aecb4cb Tim Chen               2013-12-11  537  	unsigned int iv_len;
646710419a978c Gilad Ben-Yossef       2017-10-18  538  	struct crypto_wait wait;
53f52d7aecb4cb Tim Chen               2013-12-11  539  
96692a7305c498 Cristian Stoica        2015-01-28  540  	iv = kzalloc(MAX_IVLEN, GFP_KERNEL);
96692a7305c498 Cristian Stoica        2015-01-28  541  	if (!iv)
96692a7305c498 Cristian Stoica        2015-01-28  542  		return;
96692a7305c498 Cristian Stoica        2015-01-28  543  
ac5f863f8c548a Christian Engelmayer   2014-04-21  544  	if (aad_size >= PAGE_SIZE) {
ac5f863f8c548a Christian Engelmayer   2014-04-21  545  		pr_err("associate data length (%u) too big\n", aad_size);
96692a7305c498 Cristian Stoica        2015-01-28  546  		goto out_noxbuf;
ac5f863f8c548a Christian Engelmayer   2014-04-21  547  	}
ac5f863f8c548a Christian Engelmayer   2014-04-21  548  
53f52d7aecb4cb Tim Chen               2013-12-11  549  	if (enc == ENCRYPT)
53f52d7aecb4cb Tim Chen               2013-12-11  550  		e = "encryption";
53f52d7aecb4cb Tim Chen               2013-12-11  551  	else
53f52d7aecb4cb Tim Chen               2013-12-11  552  		e = "decryption";
53f52d7aecb4cb Tim Chen               2013-12-11  553  
53f52d7aecb4cb Tim Chen               2013-12-11  554  	if (testmgr_alloc_buf(xbuf))
53f52d7aecb4cb Tim Chen               2013-12-11  555  		goto out_noxbuf;
53f52d7aecb4cb Tim Chen               2013-12-11  556  	if (testmgr_alloc_buf(axbuf))
53f52d7aecb4cb Tim Chen               2013-12-11  557  		goto out_noaxbuf;
53f52d7aecb4cb Tim Chen               2013-12-11  558  	if (testmgr_alloc_buf(xoutbuf))
53f52d7aecb4cb Tim Chen               2013-12-11  559  		goto out_nooutbuf;
53f52d7aecb4cb Tim Chen               2013-12-11  560  
a3f2185a29df08 Herbert Xu             2015-05-27  561  	sg = kmalloc(sizeof(*sg) * 9 * 2, GFP_KERNEL);
53f52d7aecb4cb Tim Chen               2013-12-11  562  	if (!sg)
53f52d7aecb4cb Tim Chen               2013-12-11  563  		goto out_nosg;
a3f2185a29df08 Herbert Xu             2015-05-27  564  	sgout = &sg[9];
53f52d7aecb4cb Tim Chen               2013-12-11  565  
5e4b8c1fcc7001 Herbert Xu             2015-08-13  566  	tfm = crypto_alloc_aead(algo, 0, 0);
53f52d7aecb4cb Tim Chen               2013-12-11  567  	if (IS_ERR(tfm)) {
53f52d7aecb4cb Tim Chen               2013-12-11  568  		pr_err("alg: aead: Failed to load transform for %s: %ld\n", algo,
53f52d7aecb4cb Tim Chen               2013-12-11 @569  		       PTR_ERR(tfm));
a2ea6ed6a631e2 Christian Engelmayer   2014-04-21  570  		goto out_notfm;
53f52d7aecb4cb Tim Chen               2013-12-11  571  	}
53f52d7aecb4cb Tim Chen               2013-12-11  572  
7b3d52683b3a47 Tianjia Zhang          2021-08-13  573  	ret = crypto_aead_setauthsize(tfm, authsize);
7b3d52683b3a47 Tianjia Zhang          2021-08-13  574  	if (ret) {
7b3d52683b3a47 Tianjia Zhang          2021-08-13  575  		pr_err("alg: aead: Failed to setauthsize for %s: %d\n", algo,
7b3d52683b3a47 Tianjia Zhang          2021-08-13  576  		       ret);
7b3d52683b3a47 Tianjia Zhang          2021-08-13  577  		goto out_noreq;
7b3d52683b3a47 Tianjia Zhang          2021-08-13  578  	}
7b3d52683b3a47 Tianjia Zhang          2021-08-13  579  
646710419a978c Gilad Ben-Yossef       2017-10-18  580  	crypto_init_wait(&wait);
3513828cb8f6db Anirudh Venkataramanan 2022-10-26  581  	pr_info("testing speed of %s (%s) %s\n", algo,
263a8df0d32eca Luca Clementi          2014-06-25  582  		get_driver_name(crypto_aead, tfm), e);
263a8df0d32eca Luca Clementi          2014-06-25  583  
53f52d7aecb4cb Tim Chen               2013-12-11  584  	req = aead_request_alloc(tfm, GFP_KERNEL);
53f52d7aecb4cb Tim Chen               2013-12-11  585  	if (!req) {
53f52d7aecb4cb Tim Chen               2013-12-11  586  		pr_err("alg: aead: Failed to allocate request for %s\n",
53f52d7aecb4cb Tim Chen               2013-12-11  587  		       algo);
6af1f93e2a0192 Christian Engelmayer   2014-04-21  588  		goto out_noreq;
53f52d7aecb4cb Tim Chen               2013-12-11  589  	}
53f52d7aecb4cb Tim Chen               2013-12-11  590  
1425d2d17f7309 Vutla, Lokesh          2015-07-07  591  	aead_request_set_callback(req, CRYPTO_TFM_REQ_MAY_BACKLOG,
646710419a978c Gilad Ben-Yossef       2017-10-18  592  				  crypto_req_done, &wait);
1425d2d17f7309 Vutla, Lokesh          2015-07-07  593  
53f52d7aecb4cb Tim Chen               2013-12-11  594  	i = 0;
53f52d7aecb4cb Tim Chen               2013-12-11  595  	do {
53f52d7aecb4cb Tim Chen               2013-12-11  596  		b_size = aead_sizes;
53f52d7aecb4cb Tim Chen               2013-12-11  597  		do {
ad6d66bcac77e5 Ard Biesheuvel         2020-11-20  598  			u32 bs = round_up(*b_size, crypto_aead_blocksize(tfm));
ad6d66bcac77e5 Ard Biesheuvel         2020-11-20  599  
53f52d7aecb4cb Tim Chen               2013-12-11  600  			assoc = axbuf[0];
53f52d7aecb4cb Tim Chen               2013-12-11  601  			memset(assoc, 0xff, aad_size);
53f52d7aecb4cb Tim Chen               2013-12-11  602  
ad6d66bcac77e5 Ard Biesheuvel         2020-11-20  603  			if ((*keysize + bs) > TVMEMSIZE * PAGE_SIZE) {
53f52d7aecb4cb Tim Chen               2013-12-11  604  				pr_err("template (%u) too big for tvmem (%lu)\n",
ad6d66bcac77e5 Ard Biesheuvel         2020-11-20  605  				       *keysize + bs,
53f52d7aecb4cb Tim Chen               2013-12-11  606  					TVMEMSIZE * PAGE_SIZE);
53f52d7aecb4cb Tim Chen               2013-12-11  607  				goto out;
53f52d7aecb4cb Tim Chen               2013-12-11  608  			}
53f52d7aecb4cb Tim Chen               2013-12-11  609  
53f52d7aecb4cb Tim Chen               2013-12-11  610  			key = tvmem[0];
53f52d7aecb4cb Tim Chen               2013-12-11  611  			for (j = 0; j < tcount; j++) {
53f52d7aecb4cb Tim Chen               2013-12-11  612  				if (template[j].klen == *keysize) {
53f52d7aecb4cb Tim Chen               2013-12-11  613  					key = template[j].key;
53f52d7aecb4cb Tim Chen               2013-12-11  614  					break;
53f52d7aecb4cb Tim Chen               2013-12-11  615  				}
53f52d7aecb4cb Tim Chen               2013-12-11  616  			}
7b3d52683b3a47 Tianjia Zhang          2021-08-13  617  
53f52d7aecb4cb Tim Chen               2013-12-11  618  			ret = crypto_aead_setkey(tfm, key, *keysize);
7b3d52683b3a47 Tianjia Zhang          2021-08-13  619  			if (ret) {
7b3d52683b3a47 Tianjia Zhang          2021-08-13  620  				pr_err("setkey() failed flags=%x: %d\n",
7b3d52683b3a47 Tianjia Zhang          2021-08-13  621  					crypto_aead_get_flags(tfm), ret);
7b3d52683b3a47 Tianjia Zhang          2021-08-13  622  				goto out;
7b3d52683b3a47 Tianjia Zhang          2021-08-13  623  			}
53f52d7aecb4cb Tim Chen               2013-12-11  624  
53f52d7aecb4cb Tim Chen               2013-12-11  625  			iv_len = crypto_aead_ivsize(tfm);
53f52d7aecb4cb Tim Chen               2013-12-11  626  			if (iv_len)
96692a7305c498 Cristian Stoica        2015-01-28  627  				memset(iv, 0xff, iv_len);
53f52d7aecb4cb Tim Chen               2013-12-11  628  
53f52d7aecb4cb Tim Chen               2013-12-11  629  			crypto_aead_clear_flags(tfm, ~0);
837a99f59043c3 Anirudh Venkataramanan 2022-10-26  630  			pr_info("test %u (%d bit key, %d byte blocks): ",
ad6d66bcac77e5 Ard Biesheuvel         2020-11-20  631  				i, *keysize * 8, bs);
53f52d7aecb4cb Tim Chen               2013-12-11  632  
53f52d7aecb4cb Tim Chen               2013-12-11  633  			memset(tvmem[0], 0xff, PAGE_SIZE);
53f52d7aecb4cb Tim Chen               2013-12-11  634  
ad6d66bcac77e5 Ard Biesheuvel         2020-11-20  635  			sg_init_aead(sg, xbuf, bs + (enc ? 0 : authsize),
5601e014fe7229 Tudor Ambarus          2017-11-14  636  				     assoc, aad_size);
53f52d7aecb4cb Tim Chen               2013-12-11  637  
31267270a35594 Herbert Xu             2015-06-17  638  			sg_init_aead(sgout, xoutbuf,
ad6d66bcac77e5 Ard Biesheuvel         2020-11-20  639  				     bs + (enc ? authsize : 0), assoc,
5601e014fe7229 Tudor Ambarus          2017-11-14  640  				     aad_size);
31267270a35594 Herbert Xu             2015-06-17  641  
4431bd49530c73 Gilad Ben-Yossef       2017-12-17  642  			aead_request_set_ad(req, aad_size);
4431bd49530c73 Gilad Ben-Yossef       2017-12-17  643  
4431bd49530c73 Gilad Ben-Yossef       2017-12-17  644  			if (!enc) {
4431bd49530c73 Gilad Ben-Yossef       2017-12-17  645  
4431bd49530c73 Gilad Ben-Yossef       2017-12-17  646  				/*
4431bd49530c73 Gilad Ben-Yossef       2017-12-17  647  				 * For decryption we need a proper auth so
4431bd49530c73 Gilad Ben-Yossef       2017-12-17  648  				 * we do the encryption path once with buffers
4431bd49530c73 Gilad Ben-Yossef       2017-12-17  649  				 * reversed (input <-> output) to calculate it
4431bd49530c73 Gilad Ben-Yossef       2017-12-17  650  				 */
4431bd49530c73 Gilad Ben-Yossef       2017-12-17  651  				aead_request_set_crypt(req, sgout, sg,
ad6d66bcac77e5 Ard Biesheuvel         2020-11-20  652  						       bs, iv);
4431bd49530c73 Gilad Ben-Yossef       2017-12-17  653  				ret = do_one_aead_op(req,
4431bd49530c73 Gilad Ben-Yossef       2017-12-17  654  						     crypto_aead_encrypt(req));
4431bd49530c73 Gilad Ben-Yossef       2017-12-17  655  
4431bd49530c73 Gilad Ben-Yossef       2017-12-17  656  				if (ret) {
129a4dba1b1ba9 Randy Dunlap           2020-07-30  657  					pr_err("calculating auth failed (%d)\n",
4431bd49530c73 Gilad Ben-Yossef       2017-12-17  658  					       ret);
4431bd49530c73 Gilad Ben-Yossef       2017-12-17  659  					break;
4431bd49530c73 Gilad Ben-Yossef       2017-12-17  660  				}
4431bd49530c73 Gilad Ben-Yossef       2017-12-17  661  			}
4431bd49530c73 Gilad Ben-Yossef       2017-12-17  662  
7aacbfcb331cef Robert Baronescu       2017-10-10  663  			aead_request_set_crypt(req, sg, sgout,
ad6d66bcac77e5 Ard Biesheuvel         2020-11-20  664  					       bs + (enc ? 0 : authsize),
7aacbfcb331cef Robert Baronescu       2017-10-10  665  					       iv);
53f52d7aecb4cb Tim Chen               2013-12-11  666  
2af632996b8986 Horia Geantă           2018-07-23  667  			if (secs) {
ad6d66bcac77e5 Ard Biesheuvel         2020-11-20  668  				ret = test_aead_jiffies(req, enc, bs,
3e3dc25fe7d5e3 Mark Rustad            2014-07-25  669  							secs);
2af632996b8986 Horia Geantă           2018-07-23  670  				cond_resched();
2af632996b8986 Horia Geantă           2018-07-23  671  			} else {
ad6d66bcac77e5 Ard Biesheuvel         2020-11-20  672  				ret = test_aead_cycles(req, enc, bs);
2af632996b8986 Horia Geantă           2018-07-23  673  			}
53f52d7aecb4cb Tim Chen               2013-12-11  674  
53f52d7aecb4cb Tim Chen               2013-12-11  675  			if (ret) {
53f52d7aecb4cb Tim Chen               2013-12-11  676  				pr_err("%s() failed return code=%d\n", e, ret);
53f52d7aecb4cb Tim Chen               2013-12-11  677  				break;
53f52d7aecb4cb Tim Chen               2013-12-11  678  			}
53f52d7aecb4cb Tim Chen               2013-12-11  679  			b_size++;
53f52d7aecb4cb Tim Chen               2013-12-11  680  			i++;
53f52d7aecb4cb Tim Chen               2013-12-11  681  		} while (*b_size);
53f52d7aecb4cb Tim Chen               2013-12-11  682  		keysize++;
53f52d7aecb4cb Tim Chen               2013-12-11  683  	} while (*keysize);
53f52d7aecb4cb Tim Chen               2013-12-11  684  
53f52d7aecb4cb Tim Chen               2013-12-11  685  out:
6af1f93e2a0192 Christian Engelmayer   2014-04-21  686  	aead_request_free(req);
6af1f93e2a0192 Christian Engelmayer   2014-04-21  687  out_noreq:
53f52d7aecb4cb Tim Chen               2013-12-11  688  	crypto_free_aead(tfm);
a2ea6ed6a631e2 Christian Engelmayer   2014-04-21  689  out_notfm:
53f52d7aecb4cb Tim Chen               2013-12-11  690  	kfree(sg);
53f52d7aecb4cb Tim Chen               2013-12-11  691  out_nosg:
53f52d7aecb4cb Tim Chen               2013-12-11  692  	testmgr_free_buf(xoutbuf);
53f52d7aecb4cb Tim Chen               2013-12-11  693  out_nooutbuf:
53f52d7aecb4cb Tim Chen               2013-12-11  694  	testmgr_free_buf(axbuf);
53f52d7aecb4cb Tim Chen               2013-12-11  695  out_noaxbuf:
53f52d7aecb4cb Tim Chen               2013-12-11  696  	testmgr_free_buf(xbuf);
53f52d7aecb4cb Tim Chen               2013-12-11  697  out_noxbuf:
96692a7305c498 Cristian Stoica        2015-01-28  698  	kfree(iv);
53f52d7aecb4cb Tim Chen               2013-12-11  699  }
d5dc392742a981 Sebastian Siewior      2008-03-11  700  

:::::: The code at line 569 was first introduced by commit
:::::: 53f52d7aecb4cb3772872c902b73e0c685a56901 crypto: tcrypt - Added speed tests for AEAD crypto alogrithms in tcrypt test suite

:::::: TO: Tim Chen <tim.c.chen@linux.intel.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
