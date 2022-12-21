Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A13915A6
	for <oe-kbuild@lists.linux.dev>; Wed, 21 Dec 2022 09:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671613519; x=1703149519;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qRxXOuR1pJ4uLQJRzHt71jc14f1eh3JeuBXirdi3gHo=;
  b=WTc2fzyuvcUXMiBmMFm8lz9hv3gZmJ4oQzGMBOVXIY/TQtdRznG7uy36
   FN/6gA/USizIQmYGrfn1tSkpVR9P0QRw6Ps2RiBS21YBM6ZzmnFOp9Lqh
   2uieZYIU/UF/ExUbLhMg5XQGI03LSjXXwBV91DafkNLa751/IwJpu5wfC
   +2wmyE7DhcmaFrPziniz11NCkCLkq0KfoyNi+b1VY3JeGozvx77eT7gt/
   SSHQqkzBn7XnZikv8dUCtJFGLgMdBCoH3Z71qd2HBm6R8HxMJtv/rrjIh
   BK/5+eSc01yEIAGq4P4j8rPanjjNGHInapm/rg9lUS8GkxwebbtZDt5O5
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="299503370"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; 
   d="scan'208";a="299503370"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2022 01:05:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="719877856"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; 
   d="scan'208";a="719877856"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Dec 2022 01:05:18 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p7v2L-000A9U-15;
	Wed, 21 Dec 2022 09:05:17 +0000
Date: Wed, 21 Dec 2022 17:05:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC bpf-next 5/8] xsk: add check for full support of XDP in bind
Message-ID: <202212211634.55kH6Rvl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <8522db2faf32eb9e37862cd5bd6ba98bec3fa2d8.1671462951.git.lorenzo@kernel.org>
References: <8522db2faf32eb9e37862cd5bd6ba98bec3fa2d8.1671462951.git.lorenzo@kernel.org>
TO: Lorenzo Bianconi <lorenzo@kernel.org>

Hi Lorenzo,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Bianconi/xdp-introduce-xdp-feature-support/20221219-234520
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/8522db2faf32eb9e37862cd5bd6ba98bec3fa2d8.1671462951.git.lorenzo%40kernel.org
patch subject: [RFC bpf-next 5/8] xsk: add check for full support of XDP in bind
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> tools/testing/selftests/bpf/xsk.c: linux/if_link.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
