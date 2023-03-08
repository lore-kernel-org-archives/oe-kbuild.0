Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847C97474
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Mar 2023 14:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678285850; x=1709821850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mxz38U8IHST643q0OsSeinVieOr0D0U62Uc85N08faA=;
  b=P+G4QKNJa0guDctgh1/J89SgU6j1/X+ELAWuExyli4cxU4kiVanP3UPB
   Vwu+gXAyg3xMOYyXAwIV8/2Xxmbej7CfFqn+qoEInIJY0jhhkt/IUMbPh
   J/dwReBF7QJkeytwKcf94Pz4bBJNHC6eqPDIPdtxyyZNKOHOH6Ty9Ob/4
   KWpXSu7m+O31PQibhNfS/CCHDZR/4i1ed4c/cBPjZfRszKECyol4WUIjI
   JRGvXqAcYAUlEMd9rRyyjnmrcYNIFULbaMPQo+smVaRTpPAPLPbkvL5a/
   tGHau7fejbqntACDLhn18XOhqO6KQwMsZnuw348QgcsSjQnxz0sDF4FBF
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="422434140"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="422434140"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 06:30:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="800769143"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="800769143"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Mar 2023 06:30:47 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZuoY-0002BF-2M;
	Wed, 08 Mar 2023 14:30:46 +0000
Date: Wed, 8 Mar 2023 22:30:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH v1 2/4] ufs: mcq: Add supporting functions for mcq
 abort
Message-ID: <202303082206.QV12fb7I-lkp@intel.com>
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
In-Reply-To: <b84abc7ea5bddc78ab3c70e9a7b5108a5bc9448f.1678247309.git.quic_nguyenb@quicinc.com>
References: <b84abc7ea5bddc78ab3c70e9a7b5108a5bc9448f.1678247309.git.quic_nguyenb@quicinc.com>
TO: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>

Hi Bao,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on jejb-scsi/for-next]
[also build test WARNING on mkp-scsi/for-next linus/master v6.3-rc1 next-20230308]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bao-D-Nguyen/ufs-mcq-Use-ufshcd_mcq_poll_cqe_lock-in-mcq-mode/20230308-120557
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git for-next
patch link:    https://lore.kernel.org/r/b84abc7ea5bddc78ab3c70e9a7b5108a5bc9448f.1678247309.git.quic_nguyenb%40quicinc.com
patch subject: [RFC PATCH v1 2/4] ufs: mcq: Add supporting functions for mcq abort
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: parisc-randconfig-s041-20230305 (https://download.01.org/0day-ci/archive/20230308/202303082206.QV12fb7I-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/8c2bc056d01ccc83b8fe6d797c549e3181b396a2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bao-D-Nguyen/ufs-mcq-Use-ufshcd_mcq_poll_cqe_lock-in-mcq-mode/20230308-120557
        git checkout 8c2bc056d01ccc83b8fe6d797c549e3181b396a2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=parisc SHELL=/bin/bash drivers/ufs/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303082206.QV12fb7I-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: cast to restricted __le64
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: cast from restricted __le32
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: restricted __le64 degrades to integer
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: restricted __le32 degrades to integer
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: cast to restricted __le64
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: cast to restricted __le64
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: cast from restricted __le32
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: restricted __le64 degrades to integer
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: restricted __le32 degrades to integer
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: cast to restricted __le64
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: cast to restricted __le64
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: cast from restricted __le32
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: restricted __le64 degrades to integer
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: restricted __le32 degrades to integer
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: cast to restricted __le64
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: cast to restricted __le64
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: cast from restricted __le32
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: restricted __le64 degrades to integer
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: restricted __le32 degrades to integer
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: cast to restricted __le64
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: cast to restricted __le64
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: cast from restricted __le32
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: restricted __le64 degrades to integer
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: restricted __le32 degrades to integer
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: cast to restricted __le64
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: cast to restricted __le64
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: cast from restricted __le32
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: restricted __le64 degrades to integer
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: restricted __le32 degrades to integer
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: cast to restricted __le64
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: cast to restricted __le64
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: cast from restricted __le32
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: restricted __le64 degrades to integer
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: restricted __le32 degrades to integer
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: cast to restricted __le64
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: cast to restricted __le64
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: cast from restricted __le32
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: restricted __le64 degrades to integer
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: restricted __le32 degrades to integer
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: cast to restricted __le64
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: cast to restricted __le64
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: cast from restricted __le32
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: restricted __le64 degrades to integer
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: restricted __le32 degrades to integer
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: cast to restricted __le64
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: cast to restricted __le64
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: cast from restricted __le32
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: restricted __le64 degrades to integer
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: restricted __le32 degrades to integer
>> drivers/ufs/core/ufs-mcq.c:546:16: sparse: sparse: cast to restricted __le64
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: cast to restricted __le64
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: cast from restricted __le32
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: restricted __le64 degrades to integer
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: restricted __le32 degrades to integer
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: cast to restricted __le64
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: cast to restricted __le64
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: cast from restricted __le32
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: restricted __le64 degrades to integer
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: restricted __le32 degrades to integer
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: cast to restricted __le64
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: cast to restricted __le64
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: cast from restricted __le32
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: restricted __le64 degrades to integer
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: restricted __le32 degrades to integer
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: cast to restricted __le64
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: cast to restricted __le64
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: cast from restricted __le32
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: restricted __le64 degrades to integer
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: restricted __le32 degrades to integer
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: cast to restricted __le64
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: cast to restricted __le64
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: cast from restricted __le32
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: restricted __le64 degrades to integer
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: restricted __le32 degrades to integer
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: cast to restricted __le64
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: cast to restricted __le64
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: cast from restricted __le32
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: restricted __le64 degrades to integer
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: restricted __le32 degrades to integer
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: cast to restricted __le64
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: cast to restricted __le64
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: cast from restricted __le32
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: restricted __le64 degrades to integer
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: restricted __le32 degrades to integer
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: cast to restricted __le64
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: cast to restricted __le64
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: cast from restricted __le32
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: restricted __le64 degrades to integer
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: restricted __le32 degrades to integer
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: cast to restricted __le64
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: cast to restricted __le64
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: cast from restricted __le32
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: restricted __le64 degrades to integer
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: restricted __le32 degrades to integer
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: cast to restricted __le64
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: cast to restricted __le64
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: cast from restricted __le32
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: restricted __le64 degrades to integer
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: restricted __le32 degrades to integer
   drivers/ufs/core/ufs-mcq.c:597:25: sparse: sparse: too many warnings

vim +546 drivers/ufs/core/ufs-mcq.c

8c2bc056d01ccc Bao D. Nguyen 2023-03-07  538  
8c2bc056d01ccc Bao D. Nguyen 2023-03-07  539  static u64 ufshcd_mcq_get_cmd_desc_addr(struct ufs_hba *hba,
8c2bc056d01ccc Bao D. Nguyen 2023-03-07  540  					int task_tag)
8c2bc056d01ccc Bao D. Nguyen 2023-03-07  541  {
8c2bc056d01ccc Bao D. Nguyen 2023-03-07  542  	struct ufshcd_lrb *lrbp = &hba->lrb[task_tag];
8c2bc056d01ccc Bao D. Nguyen 2023-03-07  543  	__le32 hi = lrbp->utr_descriptor_ptr->command_desc_base_addr_hi;
8c2bc056d01ccc Bao D. Nguyen 2023-03-07  544  	__le32 lo = lrbp->utr_descriptor_ptr->command_desc_base_addr_lo;
8c2bc056d01ccc Bao D. Nguyen 2023-03-07  545  
8c2bc056d01ccc Bao D. Nguyen 2023-03-07 @546  	return le64_to_cpu((__le64)hi << 32 | lo);
8c2bc056d01ccc Bao D. Nguyen 2023-03-07  547  }
8c2bc056d01ccc Bao D. Nguyen 2023-03-07  548  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
