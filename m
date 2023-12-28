Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F71D10E4
	for <oe-kbuild@lists.linux.dev>; Thu, 28 Dec 2023 02:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M7qlQ3XT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703729639; x=1735265639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6r7h4Bk98Z1JyNSX2XmZEavi4q8XZZvL5aeimOojhIM=;
  b=M7qlQ3XTHHRl/E/794svF3dVZs2gd6PWMR+q6wyYB2g+/DhWyVsnYwVp
   kZpH4ydG9CgzXQcTcxaQIOliIknmjrw9lktq8brbDd/VycWHfXpy64/km
   2/BbHkeEkI4NtX/wzfxixdp+Bso30TnhsP/0mDvWNBjmtWjmQVaUFcZs5
   itnMXMvdGqOpFyTvgHJIgrBL0KisZ2ZmjIK2XSvF4Gbd8cEvXUu/Wp4+2
   0Amvyu/FSOSAXM923ITRaT47mX3DUDTqfQ2Jgm14BD0u+/uAmdMZ5RLqW
   9ZSzmIWx/eOhn0956KQ6URBYlnATG2r00rrgTBmNz3H4qBnhImiEI0+eQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="399289091"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; 
   d="scan'208";a="399289091"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 18:13:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; 
   d="scan'208";a="20118902"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 27 Dec 2023 18:13:57 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIfuE-000FwH-1m;
	Thu, 28 Dec 2023 02:13:54 +0000
Date: Thu, 28 Dec 2023 10:13:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [dhowells-fs:crypto-krb5 7/21] crypto/krb5/rfc3961_simplified.c:127
 rfc3961_calc_H() warn: use 'gfp' here instead of GFP_KERNEL?
Message-ID: <202312281032.f339mEEs-lkp@intel.com>
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
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git crypto-krb5
head:   ebd44e15422341724b06a3a13590ea80244ebbd6
commit: 214632aabe1103adbf7c0a3810c2afb9dcc09eee [7/21] crypto/krb5: Implement the Kerberos5 rfc3961 key derivation
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: powerpc-randconfig-r071-20231226 (https://download.01.org/0day-ci/archive/20231228/202312281032.f339mEEs-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d3ef86708241a3bee902615c190dead1638c4e09)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312281032.f339mEEs-lkp@intel.com/

smatch warnings:
crypto/krb5/rfc3961_simplified.c:127 rfc3961_calc_H() warn: use 'gfp' here instead of GFP_KERNEL?

vim +/gfp +127 crypto/krb5/rfc3961_simplified.c

214632aabe1103 David Howells 2020-09-03  107  
214632aabe1103 David Howells 2020-09-03  108  /*
214632aabe1103 David Howells 2020-09-03  109   * Calculate an unkeyed basic hash.
214632aabe1103 David Howells 2020-09-03  110   */
214632aabe1103 David Howells 2020-09-03  111  static int rfc3961_calc_H(const struct krb5_enctype *krb5,
214632aabe1103 David Howells 2020-09-03  112  			  const struct krb5_buffer *data,
214632aabe1103 David Howells 2020-09-03  113  			  struct krb5_buffer *digest,
214632aabe1103 David Howells 2020-09-03  114  			  gfp_t gfp)
214632aabe1103 David Howells 2020-09-03  115  {
214632aabe1103 David Howells 2020-09-03  116  	struct crypto_shash *tfm;
214632aabe1103 David Howells 2020-09-03  117  	struct shash_desc *desc;
214632aabe1103 David Howells 2020-09-03  118  	size_t desc_size;
214632aabe1103 David Howells 2020-09-03  119  	int ret = -ENOMEM;
214632aabe1103 David Howells 2020-09-03  120  
214632aabe1103 David Howells 2020-09-03  121  	tfm = crypto_alloc_shash(krb5->hash_name, 0, 0);
214632aabe1103 David Howells 2020-09-03  122  	if (IS_ERR(tfm))
214632aabe1103 David Howells 2020-09-03  123  		return (PTR_ERR(tfm) == -ENOENT) ? -ENOPKG : PTR_ERR(tfm);
214632aabe1103 David Howells 2020-09-03  124  
214632aabe1103 David Howells 2020-09-03  125  	desc_size = crypto_shash_descsize(tfm) + sizeof(*desc);
214632aabe1103 David Howells 2020-09-03  126  
214632aabe1103 David Howells 2020-09-03 @127  	desc = kzalloc(desc_size, GFP_KERNEL);
214632aabe1103 David Howells 2020-09-03  128  	if (!desc)
214632aabe1103 David Howells 2020-09-03  129  		goto error_tfm;
214632aabe1103 David Howells 2020-09-03  130  
214632aabe1103 David Howells 2020-09-03  131  	digest->len = crypto_shash_digestsize(tfm);
214632aabe1103 David Howells 2020-09-03  132  	digest->data = kzalloc(digest->len, gfp);
214632aabe1103 David Howells 2020-09-03  133  	if (!digest->data)
214632aabe1103 David Howells 2020-09-03  134  		goto error_desc;
214632aabe1103 David Howells 2020-09-03  135  
214632aabe1103 David Howells 2020-09-03  136  	desc->tfm = tfm;
214632aabe1103 David Howells 2020-09-03  137  	ret = crypto_shash_init(desc);
214632aabe1103 David Howells 2020-09-03  138  	if (ret < 0)
214632aabe1103 David Howells 2020-09-03  139  		goto error_digest;
214632aabe1103 David Howells 2020-09-03  140  
214632aabe1103 David Howells 2020-09-03  141  	ret = crypto_shash_finup(desc, data->data, data->len, digest->data);
214632aabe1103 David Howells 2020-09-03  142  	if (ret < 0)
214632aabe1103 David Howells 2020-09-03  143  		goto error_digest;
214632aabe1103 David Howells 2020-09-03  144  
214632aabe1103 David Howells 2020-09-03  145  	goto error_desc;
214632aabe1103 David Howells 2020-09-03  146  
214632aabe1103 David Howells 2020-09-03  147  error_digest:
214632aabe1103 David Howells 2020-09-03  148  	kfree_sensitive(digest->data);
214632aabe1103 David Howells 2020-09-03  149  error_desc:
214632aabe1103 David Howells 2020-09-03  150  	kfree_sensitive(desc);
214632aabe1103 David Howells 2020-09-03  151  error_tfm:
214632aabe1103 David Howells 2020-09-03  152  	crypto_free_shash(tfm);
214632aabe1103 David Howells 2020-09-03  153  	return ret;
214632aabe1103 David Howells 2020-09-03  154  }
214632aabe1103 David Howells 2020-09-03  155  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
