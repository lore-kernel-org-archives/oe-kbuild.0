Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68583EB3E
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Dec 2022 18:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670265185; x=1701801185;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2sOPNZHzpbgAY26MWuxTJCr+tsRT/h3nL6VEz3WIKxA=;
  b=VIO5PGK2ALNVoP3KjLCe7mvILm7aHvxyY6SBPxfBwER7sqIe5dXR2LnC
   N3pdf5MKHlJuLYU2cBDVuI+BMYt4ODxRhFU4ZFwjsjsuktw49LhEP+i62
   KvN81x1bxCwae4EsQ+l0/b5+NtjV6vsMqkN2xKWG7r7l25v6ifCPgpoau
   DciBZycDuYQaRGWk9Vd6KdVG8BtSqg3OqecYAo5d27HL8ZQUVMVXnP/ff
   9ToIw/wXZgS+tH8wbWg6akDey5a72Bhg7RGBZLj/1/VpImGo+ltAWYBfr
   WTjY7y5HTOxPOtap1AsP0EaOFxNV9TbsVsYuxUX+oNSWx8C7TgnhI6lrZ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="343444715"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; 
   d="scan'208";a="343444715"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2022 10:33:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="596293341"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; 
   d="scan'208";a="596293341"
Received: from lkp-server01.sh.intel.com (HELO b3c45e08cbc1) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 05 Dec 2022 10:33:02 -0800
Received: from kbuild by b3c45e08cbc1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p2GGz-0000HJ-2W;
	Mon, 05 Dec 2022 18:33:01 +0000
Date: Tue, 6 Dec 2022 02:32:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: block/blk-crypto-sysfs.c:82:33: warning: Parameter 'attr' can be
 declared as pointer to const [constParameter]
Message-ID: <202212060251.W5wPxHY9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: block/blk-crypto-sysfs.c:82:33: warning: Parameter 'attr' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Eric Biggers <ebiggers@google.com>
CC: Jens Axboe <axboe@kernel.dk>
CC: Hannes Reinecke <hare@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   76dcd734eca23168cb008912c0f69ff408905235
commit: 20f01f163203666010ee1560852590a0c0572726 blk-crypto: show crypto capabilities in sysfs
date:   9 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 9 months ago
compiler: mipsel-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 20f01f163203666010ee1560852590a0c0572726
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> block/blk-crypto-sysfs.c:82:33: warning: Parameter 'attr' can be declared as pointer to const [constParameter]
           struct blk_crypto_attr *attr, char *page)
                                   ^

vim +/attr +82 block/blk-crypto-sysfs.c

20f01f163203666 Eric Biggers 2022-01-24  80  
20f01f163203666 Eric Biggers 2022-01-24  81  static ssize_t blk_crypto_mode_show(struct blk_crypto_profile *profile,
20f01f163203666 Eric Biggers 2022-01-24 @82  				    struct blk_crypto_attr *attr, char *page)
20f01f163203666 Eric Biggers 2022-01-24  83  {
20f01f163203666 Eric Biggers 2022-01-24  84  	int mode_num = attr - __blk_crypto_mode_attrs;
20f01f163203666 Eric Biggers 2022-01-24  85  
20f01f163203666 Eric Biggers 2022-01-24  86  	return sysfs_emit(page, "0x%x\n", profile->modes_supported[mode_num]);
20f01f163203666 Eric Biggers 2022-01-24  87  }
20f01f163203666 Eric Biggers 2022-01-24  88  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
