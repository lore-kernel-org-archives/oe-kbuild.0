Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0128A10FC
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Apr 2023 07:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682407407; x=1713943407;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QLYzZxLjECMhSUvdVleSI/8SV+c8OxFN3Dw850I8C8Q=;
  b=NYiikvcwtSaTQC2SBwz+nREqUjHz4zgC3hqrsFl+23WEyhAYwN2x9SpT
   LfZ5ES8bGAi5SkWol3r6x53AIwjG0SfuHcV0u+w5Sc5J4q90vR3WLJU7p
   Tkv9CJzQz5+yfX2qXAEWkh6pUyMRjZu7zw4287V65J7WtvNbit8zPkMNk
   wqklJ1JJPX+rWMzfQZku1oxMqVy7Y6HEHMH+qm3aFzLdNVrBtzayIHsNv
   NMTXQuLcRSmSlklT35cgDZ7cpl/r5lMiHmHfKgKorIFBjQMMi/33Cju7L
   YUM4w7Y8FMuc8sErE53zS/HzQ2U4+5jcg59ELMjCXPzdaZeqUy8r2Ywcv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="344162703"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="344162703"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 00:23:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="837326041"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="837326041"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 25 Apr 2023 00:23:23 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prD1H-000j9I-05;
	Tue, 25 Apr 2023 07:23:23 +0000
Date: Tue, 25 Apr 2023 15:22:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:pending-fixes 108/225]
 drivers/crypto/intel/qat/qat_common/qat_compression.c:238:24-25: WARNING
 opportunity for kfree_sensitive/kvfree_sensitive (memset at line 237)
Message-ID: <202304251546.WKPAtoi7-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Tom Zanussi <tom.zanussi@linux.intel.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

Hi Tom,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
head:   0a6daccdbdd65cc86e2c4479211cd7f5915c9cd8
commit: a4b16dad46576ce08ecb660fc923d0857dcae107 [108/225] crypto: qat - Move driver to drivers/crypto/intel/qat
:::::: branch date: 19 hours ago
:::::: commit date: 3 weeks ago
config: loongarch-randconfig-c034-20230423 (https://download.01.org/0day-ci/archive/20230425/202304251546.WKPAtoi7-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202304251546.WKPAtoi7-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/crypto/intel/qat/qat_common/qat_compression.c:238:24-25: WARNING opportunity for kfree_sensitive/kvfree_sensitive (memset at line 237)
--
>> drivers/crypto/intel/qat/qat_common/qat_uclo.c:1989:16-17: WARNING opportunity for min()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
