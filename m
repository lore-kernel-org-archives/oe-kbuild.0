Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EA512B80
	for <oe-kbuild@lists.linux.dev>; Fri, 29 Dec 2023 17:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HwDSypgi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703872132; x=1735408132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oIdS3fSeraFDLR02Q+k4bnNOYurIhriGf2LV+DBhQKg=;
  b=HwDSypgiwgTxjmQa6Ufw59UxXVNMfY0f39iehuQXTyvkSsatdR88TQlq
   HIvRpMNHntvUxdIM7LvFCgZhSGIzEiqMBhv8rSsvocNZXE/vcgNBWouod
   xa+EoLDJRp+XiEcolzsDd23zXGReLNstFnYUGxU+hdYy+rVIDOLkQelQS
   f4TYIzuOA1ofCQokSshXDQ4Gm+oETkxUnTB1DjImoE+yo3CTurZHvA2rX
   NVaTUEvKNPjNZ1xk8iLjsewCg9+aGBveomS6sBpFzIVYwHvFDj2CqQEf3
   yMJBY0Qp+0gD6Ati9zqoWqrvLU6bSKmL7vVTWJjMOLA8KWKRReDevX55q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="463076493"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="463076493"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2023 09:48:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="782364137"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="782364137"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 29 Dec 2023 09:48:50 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJGyW-000He7-0Z;
	Fri, 29 Dec 2023 17:48:48 +0000
Date: Sat, 30 Dec 2023 01:47:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] [v2] SUNRPC: fix some memleaks in gssx_dec_option_array
Message-ID: <202312300134.FYS1z14n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: net/sunrpc/auth_gss/gss_rpc_xdr.c:301:1: sparse: sparse: unused label 'err'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231226072021.3550114-1-alexious@zju.edu.cn>
References: <20231226072021.3550114-1-alexious@zju.edu.cn>
TO: Zhipeng Lu <alexious@zju.edu.cn>
TO: alexious@zju.edu.cn
CC: Chuck Lever <chuck.lever@oracle.com>
CC: Jeff Layton <jlayton@kernel.org>
CC: Neil Brown <neilb@suse.de>
CC: Olga Kornievskaia <kolga@netapp.com>
CC: Dai Ngo <Dai.Ngo@oracle.com>
CC: Tom Talpey <tom@talpey.com>
CC: Trond Myklebust <trond.myklebust@hammerspace.com>
CC: Anna Schumaker <anna@kernel.org>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: "J. Bruce Fields" <bfields@fieldses.org>
CC: Simo Sorce <simo@redhat.com>
CC: linux-nfs@vger.kernel.org
CC: netdev@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Zhipeng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on trondmy-nfs/linux-next]
[also build test WARNING on linus/master v6.7-rc7 next-20231222]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhipeng-Lu/SUNRPC-fix-some-memleaks-in-gssx_dec_option_array/20231226-152422
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/20231226072021.3550114-1-alexious%40zju.edu.cn
patch subject: [PATCH] [v2] SUNRPC: fix some memleaks in gssx_dec_option_array
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-061-20231229 (https://download.01.org/0day-ci/archive/20231230/202312300134.FYS1z14n-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231230/202312300134.FYS1z14n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312300134.FYS1z14n-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/sunrpc/auth_gss/gss_rpc_xdr.c:301:1: sparse: sparse: unused label 'err'

vim +/err +301 net/sunrpc/auth_gss/gss_rpc_xdr.c

1d658336b05f86 Simo Sorce         2012-05-25  228  
1d658336b05f86 Simo Sorce         2012-05-25  229  static int gssx_dec_option_array(struct xdr_stream *xdr,
1d658336b05f86 Simo Sorce         2012-05-25  230  				 struct gssx_option_array *oa)
1d658336b05f86 Simo Sorce         2012-05-25  231  {
1d658336b05f86 Simo Sorce         2012-05-25  232  	struct svc_cred *creds;
1d658336b05f86 Simo Sorce         2012-05-25  233  	u32 count, i;
1d658336b05f86 Simo Sorce         2012-05-25  234  	__be32 *p;
1d658336b05f86 Simo Sorce         2012-05-25  235  	int err;
1d658336b05f86 Simo Sorce         2012-05-25  236  
1d658336b05f86 Simo Sorce         2012-05-25  237  	p = xdr_inline_decode(xdr, 4);
1d658336b05f86 Simo Sorce         2012-05-25  238  	if (unlikely(p == NULL))
1d658336b05f86 Simo Sorce         2012-05-25  239  		return -ENOSPC;
1d658336b05f86 Simo Sorce         2012-05-25  240  	count = be32_to_cpup(p++);
9fd40c5a66be0b Geert Uytterhoeven 2013-05-06  241  	if (!count)
9fd40c5a66be0b Geert Uytterhoeven 2013-05-06  242  		return 0;
9fd40c5a66be0b Geert Uytterhoeven 2013-05-06  243  
1d658336b05f86 Simo Sorce         2012-05-25  244  	/* we recognize only 1 currently: CREDS_VALUE */
1d658336b05f86 Simo Sorce         2012-05-25  245  	oa->count = 1;
1d658336b05f86 Simo Sorce         2012-05-25  246  
1d658336b05f86 Simo Sorce         2012-05-25  247  	oa->data = kmalloc(sizeof(struct gssx_option), GFP_KERNEL);
1d658336b05f86 Simo Sorce         2012-05-25  248  	if (!oa->data)
1d658336b05f86 Simo Sorce         2012-05-25  249  		return -ENOMEM;
1d658336b05f86 Simo Sorce         2012-05-25  250  
034dd34ff4916e J. Bruce Fields    2017-01-31  251  	creds = kzalloc(sizeof(struct svc_cred), GFP_KERNEL);
1d658336b05f86 Simo Sorce         2012-05-25  252  	if (!creds) {
e7a7aba2f1f9ce Zhipeng Lu         2023-12-26  253  		err = -ENOMEM;
e7a7aba2f1f9ce Zhipeng Lu         2023-12-26  254  		goto free_oa;
1d658336b05f86 Simo Sorce         2012-05-25  255  	}
1d658336b05f86 Simo Sorce         2012-05-25  256  
1d658336b05f86 Simo Sorce         2012-05-25  257  	oa->data[0].option.data = CREDS_VALUE;
1d658336b05f86 Simo Sorce         2012-05-25  258  	oa->data[0].option.len = sizeof(CREDS_VALUE);
1d658336b05f86 Simo Sorce         2012-05-25  259  	oa->data[0].value.data = (void *)creds;
1d658336b05f86 Simo Sorce         2012-05-25  260  	oa->data[0].value.len = 0;
9fd40c5a66be0b Geert Uytterhoeven 2013-05-06  261  
1d658336b05f86 Simo Sorce         2012-05-25  262  	for (i = 0; i < count; i++) {
1d658336b05f86 Simo Sorce         2012-05-25  263  		gssx_buffer dummy = { 0, NULL };
1d658336b05f86 Simo Sorce         2012-05-25  264  		u32 length;
1d658336b05f86 Simo Sorce         2012-05-25  265  
1d658336b05f86 Simo Sorce         2012-05-25  266  		/* option buffer */
1d658336b05f86 Simo Sorce         2012-05-25  267  		p = xdr_inline_decode(xdr, 4);
e7a7aba2f1f9ce Zhipeng Lu         2023-12-26  268  		if (unlikely(p == NULL)) {
e7a7aba2f1f9ce Zhipeng Lu         2023-12-26  269  			err = -ENOSPC;
e7a7aba2f1f9ce Zhipeng Lu         2023-12-26  270  			goto free_creds;
e7a7aba2f1f9ce Zhipeng Lu         2023-12-26  271  		}
1d658336b05f86 Simo Sorce         2012-05-25  272  
1d658336b05f86 Simo Sorce         2012-05-25  273  		length = be32_to_cpup(p);
1d658336b05f86 Simo Sorce         2012-05-25  274  		p = xdr_inline_decode(xdr, length);
e7a7aba2f1f9ce Zhipeng Lu         2023-12-26  275  		if (unlikely(p == NULL)) {
e7a7aba2f1f9ce Zhipeng Lu         2023-12-26  276  			err = -ENOSPC;
e7a7aba2f1f9ce Zhipeng Lu         2023-12-26  277  			goto free_creds;
e7a7aba2f1f9ce Zhipeng Lu         2023-12-26  278  		}
1d658336b05f86 Simo Sorce         2012-05-25  279  
1d658336b05f86 Simo Sorce         2012-05-25  280  		if (length == sizeof(CREDS_VALUE) &&
1d658336b05f86 Simo Sorce         2012-05-25  281  		    memcmp(p, CREDS_VALUE, sizeof(CREDS_VALUE)) == 0) {
1d658336b05f86 Simo Sorce         2012-05-25  282  			/* We have creds here. parse them */
1d658336b05f86 Simo Sorce         2012-05-25  283  			err = gssx_dec_linux_creds(xdr, creds);
1d658336b05f86 Simo Sorce         2012-05-25  284  			if (err)
e7a7aba2f1f9ce Zhipeng Lu         2023-12-26  285  				goto free_creds;
1d658336b05f86 Simo Sorce         2012-05-25  286  			oa->data[0].value.len = 1; /* presence */
1d658336b05f86 Simo Sorce         2012-05-25  287  		} else {
1d658336b05f86 Simo Sorce         2012-05-25  288  			/* consume uninteresting buffer */
1d658336b05f86 Simo Sorce         2012-05-25  289  			err = gssx_dec_buffer(xdr, &dummy);
1d658336b05f86 Simo Sorce         2012-05-25  290  			if (err)
e7a7aba2f1f9ce Zhipeng Lu         2023-12-26  291  				goto free_creds;
1d658336b05f86 Simo Sorce         2012-05-25  292  		}
1d658336b05f86 Simo Sorce         2012-05-25  293  	}
1d658336b05f86 Simo Sorce         2012-05-25  294  	return 0;
e7a7aba2f1f9ce Zhipeng Lu         2023-12-26  295  
e7a7aba2f1f9ce Zhipeng Lu         2023-12-26  296  free_creds:
e7a7aba2f1f9ce Zhipeng Lu         2023-12-26  297  	kfree(creds);
e7a7aba2f1f9ce Zhipeng Lu         2023-12-26  298  free_oa:
e7a7aba2f1f9ce Zhipeng Lu         2023-12-26  299  	kfree(oa->data);
e7a7aba2f1f9ce Zhipeng Lu         2023-12-26  300  	oa->data = NULL;
e7a7aba2f1f9ce Zhipeng Lu         2023-12-26 @301  err:
e7a7aba2f1f9ce Zhipeng Lu         2023-12-26  302  	return err;
1d658336b05f86 Simo Sorce         2012-05-25  303  }
1d658336b05f86 Simo Sorce         2012-05-25  304  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
