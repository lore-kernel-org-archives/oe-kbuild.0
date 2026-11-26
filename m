Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795664689;
	b=oAZeihOX8Js1Bm4J5FhueCzn9SMcemZmiHeNMpOmYdiSmtCSZIB9EkXuce3BHW0xiWWt
	 LZgVOkhwUTmEn5JD58woeQ1Alq2bQxdoen9WwhCziYXnC5rWjPwIjw5TXOZVt/FTzGJn3
	 87VxskYMUk2miy8bqcBvyu9UNWm9rXOR3VHMzO++6glr6jURMFS3KsWXLdeEVHMqiLmWx
	 aNdhWgx3n06fcErqnT6FEwyJEzAPDlJxNfBMpKo0dEvcMiJo95ztpS0YBe2WCvwoMDC/k
	 JwRPw5eyBEK5pApyKGvvCPM7Y2Rsps0+8myeQ/fC1jWj/iRAMp47gTDo7z5OSJ3TSdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795664689;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=yNAtv6/eWnITnjpWhfwJf/fi5yUc2/TwTUK3lujycfk=;
	b=cOaskXeNMjLv9D1C7mnzI/Z+aeBJJVYrgrFuteUAmWyAQaKwpyIbE+ipsre4cMMTl97n
	 Y69jTBJ1i9Irfzls0aQU2+YBg9M+7Qn8rC+u3tllnAmh8illuOcDiI1PAR9QqjsSUTlUY
	 UO2r79II7N1/8kZuHCHZmqARCJ3zBWqs7CMGokFUWL+JZ1Rt38C7OI435+eygxibfzJxX
	 YIRUa235g+gbcd/hd8P78mmogiG5ztGRzsl+ikiXLNr1J1aPfRPHegofVHq5PG1zuMwSh
	 NEIyCiq9M4kUYhH459S7YAMOuVmNcfUXsgG3Rcb13jXipR+2aylkyW4exR1nTVVqHiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AjZR47D7;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D98606A31E
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Nov 2026 03:44:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29D98606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AjZR47D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795664689; x=1827200689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BUpSQcLA40V3U7PmYLKow5ybnqLsY1uKU0OUGMq/9ag=;
  b=AjZR47D7JOrCpcXg7cokl1SRNDMEEhvBd9FoGl1U1Q+/TkUAZoeNK7dI
   EK4Bz1J33AKoxR+aNu8gF8HD9Cpq9JfaQd99WrSTSSwgfQbnkXmpzZCOd
   sp5HN1pphrPuQ5PL44I2LGzJThkMEGuJiPo78wXmS3OEGdi93kqEty2nR
   DshievNLC4h+0UNIDCvJvHkFFztPKiwqQnWC2HZCtwoytSYY+EQT4HBXI
   ouykSNJOVep39FaP0krjf0E5EWPuFy2cneVIjhL3Hf3YgpNZkXnfbKwzZ
   n9TU8RWHHcZw3uuqjEDMD7//IRMvkqSyB+fiYMObEOUaQMUz4laceBZsE
   g==;
X-CSE-ConnectionGUID: 9VCtMIzcTiWjmHBMVzli2Q==
X-CSE-MsgGUID: SMo3mYxnQw+rJzQt08m50w==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4468993"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4468993"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 19:35:48 -0800
X-CSE-ConnectionGUID: +F54L247THiBq61FkCxSAg==
X-CSE-MsgGUID: yxgDM0GyT/qQQgqej5J57Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="13830340"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 25 Nov 2026 19:35:47 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWQGv-00000001TEA-1Jwq;
	Thu, 26 Nov 2026 03:35:45 +0000
Date: Thu, 26 Nov 2026 11:35:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v8 25/27] btrfs: zoned: keep a zone free for relocation
 when allocating data chunks
Message-ID: <20261126112416.SRPV8dq1-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261125102956.266389-26-johannes.thumshirn@wdc.com>
References: <20261125102956.266389-26-johannes.thumshirn@wdc.com>
TO: Johannes Thumshirn <johannes.thumshirn@wdc.com>
TO: linux-btrfs@vger.kernel.org
CC: Damien Le Moal <dlemoal@kernel.org>
CC: Naohiro Aota <naohiro.aota@wdc.com>
CC: Boris Burkov <boris@bur.io>
CC: Filipe Manana <fdmanana@suse.com>
CC: David Sterba <dsterba@suse.com>
CC: Josef Bacik <josef@toxicpanda.com>
CC: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Hi Johannes,

kernel test robot noticed the following build errors:

[auto build test ERROR on kdave/for-next]
[also build test ERROR on btrfs/for-next]
[cannot apply to linux-review/Johannes-Thumshirn/btrfs-zoned-don-t-wait-for-a-zone-finish-after-a-filesystem-error/20261117-195824 linus/master v7.4-rc4 next-20261125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Thumshirn/btrfs-zoned-don-t-wait-for-a-zone-finish-after-a-filesystem-error/20261125-112930
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/20261125102956.266389-26-johannes.thumshirn%40wdc.com
patch subject: [PATCH v8 25/27] btrfs: zoned: keep a zone free for relocation when allocating data chunks
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: i386-buildonly-randconfig-1003-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126112416.SRPV8dq1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126112416.SRPV8dq1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261126112416.SRPV8dq1-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/btrfs/zoned.o: in function `btrfs_zoned_data_chunk_allowed':
>> zoned.c:(.text+0x88f8): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
