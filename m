Received: from mgamail.intel.com (unknown [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65797C
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Jul 2023 01:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690593639; x=1722129639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LzO+hFbtnhY5+GEY0F5De68TRouuH/PSPakrTgMphsI=;
  b=OcVFi5f7p0/CKlF2J0OY1cBjfq5xcCk9VSyJVhoEHApERAyA9BojWlpD
   MUMsFS+Q01174MPqXlW/LFshG4X33OD2G2Ie3TtoJgwU5Ej/QSERudMGF
   b2jwkiEKVGfrY6IIm0/psg492kJJPp6bdPxepL8+PS1rbzvoagb+MF/Mx
   1r6A0jeZPhPjUpKKntgU4/sUfiWCzH9ThgIugjk/BsV0zDukJFrP8WJka
   sBq1T3TNVMMWxcGSlzs8bzzDv3Pvw/n6FPrWH1whfYr8HRWoxWeA2MBpF
   VRW2IUhG53K7+UzInU2gDs7z5QzDIpp3rcpWojdDixTQdipXsxudT8Auf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="366185495"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="366185495"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 18:20:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="851410224"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="851410224"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 28 Jul 2023 18:20:37 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPYdF-0003jL-2S;
	Sat, 29 Jul 2023 01:20:36 +0000
Date: Sat, 29 Jul 2023 09:19:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the
 arguments have the same signedness.
Message-ID: <202307290955.JTEbSvfx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/net/virtio_net.c:1719:25: sparse: sparse: static assertion failed: "clamp() low limit (unsigned int)(rq->min_buf_len) greater than high limit (unsigned int)((1UL << 13) - hdr_len)""
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
[also build test WARNING on linus/master crng-random/master v6.5-rc3 next-20230728]
[cannot apply to next-20230725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Allow-min-max-clamp-if-the-arguments-have-the-same-signedness/20230725-204940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/a09512c8526b46759669d0b879144563%40AcuMS.aculab.com
patch subject: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the arguments have the same signedness.
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: openrisc-randconfig-r081-20230728 (https://download.01.org/0day-ci/archive/20230729/202307290955.JTEbSvfx-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307290955.JTEbSvfx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307290955.JTEbSvfx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/virtio_net.c:1719:25: sparse: sparse: bad integer constant expression
>> drivers/net/virtio_net.c:1719:25: sparse: sparse: static assertion failed: "clamp() low limit (unsigned int)(rq->min_buf_len) greater than high limit (unsigned int)((1UL << 13) - hdr_len)"

vim +1719 drivers/net/virtio_net.c

296f96fcfc160e Rusty Russell      2007-10-22  1707  
d85b758f72b05a Michael S. Tsirkin 2017-03-09  1708  static unsigned int get_mergeable_buf_len(struct receive_queue *rq,
3cc81a9aac4382 Jason Wang         2018-03-02  1709  					  struct ewma_pkt_len *avg_pkt_len,
3cc81a9aac4382 Jason Wang         2018-03-02  1710  					  unsigned int room)
3f2c31d90327f2 Mark McLoughlin    2008-11-16  1711  {
c1ddc42da2b263 Andrew Melnychenko 2022-03-28  1712  	struct virtnet_info *vi = rq->vq->vdev->priv;
c1ddc42da2b263 Andrew Melnychenko 2022-03-28  1713  	const size_t hdr_len = vi->hdr_len;
fbf28d78f54016 Michael Dalton     2014-01-16  1714  	unsigned int len;
fbf28d78f54016 Michael Dalton     2014-01-16  1715  
3cc81a9aac4382 Jason Wang         2018-03-02  1716  	if (room)
3cc81a9aac4382 Jason Wang         2018-03-02  1717  		return PAGE_SIZE - room;
3cc81a9aac4382 Jason Wang         2018-03-02  1718  
5377d75823ff90 Johannes Berg      2015-08-19 @1719  	len = hdr_len +	clamp_t(unsigned int, ewma_pkt_len_read(avg_pkt_len),
f0c3192ceee3c1 Michael S. Tsirkin 2017-06-02  1720  				rq->min_buf_len, PAGE_SIZE - hdr_len);
3cc81a9aac4382 Jason Wang         2018-03-02  1721  
e377fcc8486d40 Michael S. Tsirkin 2017-03-06  1722  	return ALIGN(len, L1_CACHE_BYTES);
fbf28d78f54016 Michael Dalton     2014-01-16  1723  }
fbf28d78f54016 Michael Dalton     2014-01-16  1724  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
