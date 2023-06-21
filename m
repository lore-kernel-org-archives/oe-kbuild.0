Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F54168DC
	for <oe-kbuild@lists.linux.dev>; Wed, 21 Jun 2023 14:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687356190; x=1718892190;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QZGASmky5c29JMpDaszdsJwHZRlk/NqdYaOJuj8T6ro=;
  b=QfqWQ6ENOAaYWinoOTR3PkoKqHcnhARW8r0mxDuEO7l0Fwy8wfL/u04M
   d602yei1p6ax8fwFfNYs9n+PGanUcw8lgLTOq3o+YGpw5+LEqfz89Kkal
   KlGV/dZSEXFVOU3OyE9ClHGPPIm2wLQnyFwnlLn6r9R4+8l6XO0cQbfa0
   n9taJW+oHa6R/IevVYzGxdEBy7ybRirPItSZPFLq9I5XUZa7nSWIJBiZq
   O04kd3RPyC7tAVxG8a72SzJIN/TF4g7zn7psQWdtBafMB3AdesjFyMXEF
   OAU1ibW0/QuBWm6gEvMIcBaWP60gnRBMRBR95it56F3feWMXgrEXqqKiK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="349911930"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="349911930"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 07:03:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="784506215"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="784506215"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Jun 2023 07:03:08 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qByQO-0006sN-0c;
	Wed, 21 Jun 2023 14:03:08 +0000
Date: Wed, 21 Jun 2023 22:02:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [l1k:doe 2/10] lib/asn1_encoder.c:345
 asn1_encode_integer_large_positive() error: we previously assumed 'integer'
 could be null (see line 331)
Message-ID: <202306212123.meq6uVfL-lkp@intel.com>
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
TO: Lukas Wunner <lukas@wunner.de>

tree:   https://github.com/l1k/linux doe
head:   a80fa5bd85f66ad910329bbe8bbb004f45b2bd68
commit: af175bd2d0ae71f1c4843947e7405ef8c5902ba1 [2/10] lib/asn1_encoder: Add a function to encode many byte integer values.
:::::: branch date: 18 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-m021-20230620 (https://download.01.org/0day-ci/archive/20230621/202306212123.meq6uVfL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306212123.meq6uVfL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306212123.meq6uVfL-lkp@intel.com/

smatch warnings:
lib/asn1_encoder.c:345 asn1_encode_integer_large_positive() error: we previously assumed 'integer' could be null (see line 331)

vim +/integer +345 lib/asn1_encoder.c

b07067627cd5f1 James Bottomley  2021-01-27  317  
af175bd2d0ae71 Jonathan Cameron 2022-09-06  318  unsigned char *
af175bd2d0ae71 Jonathan Cameron 2022-09-06  319  asn1_encode_integer_large_positive(unsigned char *data,
af175bd2d0ae71 Jonathan Cameron 2022-09-06  320  				   const unsigned char *end_data, u32 tag,
af175bd2d0ae71 Jonathan Cameron 2022-09-06  321  				   const unsigned char *integer, int len)
af175bd2d0ae71 Jonathan Cameron 2022-09-06  322  {
af175bd2d0ae71 Jonathan Cameron 2022-09-06  323  	int data_len = end_data - data;
af175bd2d0ae71 Jonathan Cameron 2022-09-06  324  	unsigned char *d = &data[2];
af175bd2d0ae71 Jonathan Cameron 2022-09-06  325  	bool found = false;
af175bd2d0ae71 Jonathan Cameron 2022-09-06  326  	int i;
af175bd2d0ae71 Jonathan Cameron 2022-09-06  327  
af175bd2d0ae71 Jonathan Cameron 2022-09-06  328  	if (WARN(tag > 30, "ASN.1 tag can't be > 30"))
af175bd2d0ae71 Jonathan Cameron 2022-09-06  329  		return ERR_PTR(-EINVAL);
af175bd2d0ae71 Jonathan Cameron 2022-09-06  330  
af175bd2d0ae71 Jonathan Cameron 2022-09-06 @331  	if (!integer && WARN(len > 127, "BUG: recode tag is too big (>127)"))
af175bd2d0ae71 Jonathan Cameron 2022-09-06  332  		return ERR_PTR(-EINVAL);
af175bd2d0ae71 Jonathan Cameron 2022-09-06  333  
af175bd2d0ae71 Jonathan Cameron 2022-09-06  334  	if (IS_ERR(data))
af175bd2d0ae71 Jonathan Cameron 2022-09-06  335  		return data;
af175bd2d0ae71 Jonathan Cameron 2022-09-06  336  
af175bd2d0ae71 Jonathan Cameron 2022-09-06  337  	if (data_len < 3)
af175bd2d0ae71 Jonathan Cameron 2022-09-06  338  		return ERR_PTR(-EINVAL);
af175bd2d0ae71 Jonathan Cameron 2022-09-06  339  
af175bd2d0ae71 Jonathan Cameron 2022-09-06  340  	data[0] = _tagn(UNIV, PRIM, tag);
af175bd2d0ae71 Jonathan Cameron 2022-09-06  341  	/* Leave space for length */
af175bd2d0ae71 Jonathan Cameron 2022-09-06  342  	data_len -= 2;
af175bd2d0ae71 Jonathan Cameron 2022-09-06  343  
af175bd2d0ae71 Jonathan Cameron 2022-09-06  344  	for (i = 0; i < len; i++) {
af175bd2d0ae71 Jonathan Cameron 2022-09-06 @345  		int byte = integer[i];
af175bd2d0ae71 Jonathan Cameron 2022-09-06  346  
af175bd2d0ae71 Jonathan Cameron 2022-09-06  347  		if (!found && byte == 0)
af175bd2d0ae71 Jonathan Cameron 2022-09-06  348  			continue;
af175bd2d0ae71 Jonathan Cameron 2022-09-06  349  
af175bd2d0ae71 Jonathan Cameron 2022-09-06  350  		/*
af175bd2d0ae71 Jonathan Cameron 2022-09-06  351  		 * as per encode_integer
af175bd2d0ae71 Jonathan Cameron 2022-09-06  352  		 */
af175bd2d0ae71 Jonathan Cameron 2022-09-06  353  		if (!found && (byte & 0x80)) {
af175bd2d0ae71 Jonathan Cameron 2022-09-06  354  			*d++ = 0;
af175bd2d0ae71 Jonathan Cameron 2022-09-06  355  			data_len--;
af175bd2d0ae71 Jonathan Cameron 2022-09-06  356  		}
af175bd2d0ae71 Jonathan Cameron 2022-09-06  357  		found = true;
af175bd2d0ae71 Jonathan Cameron 2022-09-06  358  		if (data_len == 0)
af175bd2d0ae71 Jonathan Cameron 2022-09-06  359  			return ERR_PTR(-EINVAL);
af175bd2d0ae71 Jonathan Cameron 2022-09-06  360  
af175bd2d0ae71 Jonathan Cameron 2022-09-06  361  		*d++ = byte;
af175bd2d0ae71 Jonathan Cameron 2022-09-06  362  		data_len--;
af175bd2d0ae71 Jonathan Cameron 2022-09-06  363  	}
af175bd2d0ae71 Jonathan Cameron 2022-09-06  364  
af175bd2d0ae71 Jonathan Cameron 2022-09-06  365  	data[1] = d - data - 2;
af175bd2d0ae71 Jonathan Cameron 2022-09-06  366  
af175bd2d0ae71 Jonathan Cameron 2022-09-06  367  	return d;
af175bd2d0ae71 Jonathan Cameron 2022-09-06  368  }
af175bd2d0ae71 Jonathan Cameron 2022-09-06  369  EXPORT_SYMBOL_GPL(asn1_encode_integer_large_positive);
af175bd2d0ae71 Jonathan Cameron 2022-09-06  370  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
