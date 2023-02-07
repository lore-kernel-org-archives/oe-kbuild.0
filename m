Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BFDBD1D
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Feb 2023 05:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675746517; x=1707282517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=axQSxiwpYEB1InWxhJD6pdlqaUR+IzUV66bepRZVkZg=;
  b=KDjlW5Gh2nTDTpYmDfjf21im4D2EFy+IpIPRaJT4uUL8cNNPG0Q9vNV1
   ia4wbQ9o2WZFJPR2IdzdLuMIrd6DoYGQ3L3nqBG9lCaai+C28G5mFuVoa
   PyiCqtg1lbcWd5GPE8UXzJuHJjwarzBZz4U6li8JO21XLp8McF2qPgSr4
   FNjSJ8mAsX0GjzlqJvyEwqYWpMyPA/zB55UZ6tdz/4lEC7eZbECBspYFf
   2/5whno0eSt5yBF2dy+fSRN/x06S3i0utooW27vob5FyC377CfNmL+zCp
   2XQJRUgYPtZuPQnZckSjLQq4L7NCnw6GeXIYms6iVmSgoAnUoJh+bXgr3
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="328045442"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="328045442"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 21:08:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="775395612"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="775395612"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Feb 2023 21:08:35 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPGDb-00036C-0d;
	Tue, 07 Feb 2023 05:08:35 +0000
Date: Tue, 7 Feb 2023 13:08:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [niks:dma_iommu_v5 4/7] drivers/iommu/s390-iommu.c:713
 zpci_get_iommu_ctrs() error: we previously assumed 'zdev' could be null (see
 line 713)
Message-ID: <202302071312.P2C14gaH-lkp@intel.com>
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
TO: Niklas Schnelle <schnelle@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git dma_iommu_v5
head:   1130d11df3ad4a18aada280e80da35911239b4ad
commit: 4dd8a9e92a898af65c84631f354f51a8b9f9ff09 [4/7] s390/pci: Use dma-iommu layer
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: s390-randconfig-m041-20230206 (https://download.01.org/0day-ci/archive/20230207/202302071312.P2C14gaH-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/iommu/s390-iommu.c:713 zpci_get_iommu_ctrs() error: we previously assumed 'zdev' could be null (see line 713)

vim +/zdev +713 drivers/iommu/s390-iommu.c

4dd8a9e92a898a Niklas Schnelle 2022-07-01  710  
4dd8a9e92a898a Niklas Schnelle 2022-07-01  711  struct zpci_iommu_ctrs *zpci_get_iommu_ctrs(struct zpci_dev *zdev)
4dd8a9e92a898a Niklas Schnelle 2022-07-01  712  {
4dd8a9e92a898a Niklas Schnelle 2022-07-01 @713  	if (!zdev && !zdev->s390_domain)
4dd8a9e92a898a Niklas Schnelle 2022-07-01  714  		return NULL;
4dd8a9e92a898a Niklas Schnelle 2022-07-01  715  	return &zdev->s390_domain->ctrs;
4dd8a9e92a898a Niklas Schnelle 2022-07-01  716  }
4dd8a9e92a898a Niklas Schnelle 2022-07-01  717  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
