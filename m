Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9376163C2
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Mar 2023 10:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678358004; x=1709894004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uSIIT1CzytJT2rPK1XgbvhSPfjeNWyWeIfi8MktdbA0=;
  b=bfMd4dnLaPABTO9bNYd6m9JDSh216L9bS8UaipoFt5cR9nZ41j6lESjU
   B3XnQ5bvaLIrOVCPYCheWF3ltwTXlUDlK6bu+DRT6UqoAmrDfPFWNlvVH
   GuKIsxcRk1VtSkbbX5nTptnqWXvvDo3itnu59rB0CXRVshQfbguWeEAFq
   DojGD5zmv9FKFMzhw9zW3oJblKBt+JzYnb58pf9KIYVwVygp+DAwaodaf
   dKNclho6vo+pfYyi7jqA15Oz1IjMiUFRygqhHeZRbLlP4fHatVhsOMV3n
   duaOXcjez6WhwO6H/IBgLXLd6Pt4o7IZQ3Ag7x45YtBtXWTP2aFWc0BzL
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="320240640"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="320240640"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 02:33:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="707562259"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="707562259"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 09 Mar 2023 02:33:21 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paDaL-0002t7-14;
	Thu, 09 Mar 2023 10:33:21 +0000
Date: Thu, 9 Mar 2023 18:32:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH V2 17/17] block: ublk_drv: apply io_uring FUSED_CMD for
 supporting zero copy
Message-ID: <202303091820.3ZY3kqmx-lkp@intel.com>
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
In-Reply-To: <20230307141520.793891-18-ming.lei@redhat.com>
References: <20230307141520.793891-18-ming.lei@redhat.com>
TO: Ming Lei <ming.lei@redhat.com>
TO: Jens Axboe <axboe@kernel.dk>
TO: io-uring@vger.kernel.org
CC: linux-block@vger.kernel.org
CC: Miklos Szeredi <mszeredi@redhat.com>
CC: ZiyangZhang <ZiyangZhang@linux.alibaba.com>
CC: Xiaoguang Wang <xiaoguang.wang@linux.alibaba.com>
CC: Bernd Schubert <bschubert@ddn.com>
CC: Ming Lei <ming.lei@redhat.com>

Hi Ming,

I love your patch! Perhaps something to improve:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on linus/master v6.3-rc1 next-20230309]
[cannot apply to char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ming-Lei/io_uring-add-IO_URING_F_FUSED-and-prepare-for-supporting-OP_FUSED_CMD/20230307-222928
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230307141520.793891-18-ming.lei%40redhat.com
patch subject: [PATCH V2 17/17] block: ublk_drv: apply io_uring FUSED_CMD for supporting zero copy
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: alpha-randconfig-c041-20230308 (https://download.01.org/0day-ci/archive/20230309/202303091820.3ZY3kqmx-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202303091820.3ZY3kqmx-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/block/ublk_drv.c:78:26-29: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
