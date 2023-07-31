Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4D71DDC4
	for <oe-kbuild@lists.linux.dev>; Mon, 31 Jul 2023 20:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690836074; x=1722372074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HWpxl7lUGks5CjSNw7ngC1/2NVVmJVhHvR6QNITP07Y=;
  b=hZdD0C82yNU1HJ90IIoq7y5mnauxA8dliWGUtm8J5hF8lKyk747TMbrL
   v311bUdi9lwrUfBu7x5twrz+gc7n7j5nERmpsdBISUigili5i3ji8inkR
   +d+SfJSEH84wF7qlqqEyNH50Y7qAOfQgWrdLN9unCwr6NnQzhAo3cWnVG
   tE2tXtJ8W0Bf69bgjpILTEGYsC3KCjD6ZBYqn2HpYxEhlV2reKGJrpXr4
   oJxaWb3aN5xtaSmf3qQei3uGGE+nKU/QBKR/6IjyhR3vRTBhpGvtVjiBu
   e/iEZRF9rg7wxEdgmDo/GpJ2BQHsNGCt9f5CdNd96BwWnkfgO7M4qi85S
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="435438580"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="435438580"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 13:41:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="818521652"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="818521652"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 31 Jul 2023 13:41:12 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQZhX-0005MV-2q;
	Mon, 31 Jul 2023 20:41:11 +0000
Date: Tue, 1 Aug 2023 04:41:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the
 arguments have the same signedness.
Message-ID: <202308010430.Dga44296-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: fs/nfsd/nfs3proc.c:561:23: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <a09512c8526b46759669d0b879144563@AcuMS.aculab.com>
References: <a09512c8526b46759669d0b879144563@AcuMS.aculab.com>
TO: David Laight <David.Laight@ACULAB.COM>
TO: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
TO: "'Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>
TO: "'Andrew Morton'" <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "'Matthew Wilcox (Oracle)'" <willy@infradead.org>
TO: "'Christoph Hellwig'" <hch@infradead.org>
TO: "'Jason A. Donenfeld'" <Jason@zx2c4.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master]
[cannot apply to next-20230725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Allow-min-max-clamp-if-the-arguments-have-the-same-signedness/20230725-204940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/a09512c8526b46759669d0b879144563%40AcuMS.aculab.com
patch subject: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the arguments have the same signedness.
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: i386-randconfig-i062-20230730 (https://download.01.org/0day-ci/archive/20230801/202308010430.Dga44296-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230801/202308010430.Dga44296-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308010430.Dga44296-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/nfsd/nfs3proc.c:561:23: sparse: sparse: bad integer constant expression
>> fs/nfsd/nfs3proc.c:561:23: sparse: sparse: static assertion failed: "clamp() low limit (u32)(sizeof(__be32) * 2) greater than high limit sendbuf"

vim +561 fs/nfsd/nfs3proc.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  548  
40116ebd0934cc Chuck Lever    2020-11-17  549  static void nfsd3_init_dirlist_pages(struct svc_rqst *rqstp,
40116ebd0934cc Chuck Lever    2020-11-17  550  				     struct nfsd3_readdirres *resp,
53b1119a6e5028 Chuck Lever    2021-12-16  551  				     u32 count)
40116ebd0934cc Chuck Lever    2020-11-17  552  {
7f87fc2d34d475 Chuck Lever    2020-10-22  553  	struct xdr_buf *buf = &resp->dirlist;
7f87fc2d34d475 Chuck Lever    2020-10-22  554  	struct xdr_stream *xdr = &resp->xdr;
640f87c190e0d1 Chuck Lever    2022-09-01  555  	unsigned int sendbuf = min_t(unsigned int, rqstp->rq_res.buflen,
640f87c190e0d1 Chuck Lever    2022-09-01  556  				     svc_max_payload(rqstp));
40116ebd0934cc Chuck Lever    2020-11-17  557  
7f87fc2d34d475 Chuck Lever    2020-10-22  558  	memset(buf, 0, sizeof(*buf));
40116ebd0934cc Chuck Lever    2020-11-17  559  
7f87fc2d34d475 Chuck Lever    2020-10-22  560  	/* Reserve room for the NULL ptr & eof flag (-2 words) */
640f87c190e0d1 Chuck Lever    2022-09-01 @561  	buf->buflen = clamp(count, (u32)(XDR_UNIT * 2), sendbuf);
640f87c190e0d1 Chuck Lever    2022-09-01  562  	buf->buflen -= XDR_UNIT * 2;
7f87fc2d34d475 Chuck Lever    2020-10-22  563  	buf->pages = rqstp->rq_next_page;
53b1119a6e5028 Chuck Lever    2021-12-16  564  	rqstp->rq_next_page += (buf->buflen + PAGE_SIZE - 1) >> PAGE_SHIFT;
7f87fc2d34d475 Chuck Lever    2020-10-22  565  
98124f5bd6c766 Chuck Lever    2022-09-12  566  	xdr_init_encode_pages(xdr, buf, buf->pages,  NULL);
40116ebd0934cc Chuck Lever    2020-11-17  567  }
40116ebd0934cc Chuck Lever    2020-11-17  568  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
