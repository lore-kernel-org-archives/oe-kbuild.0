Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0ED480605
	for <oe-kbuild@lists.linux.dev>; Thu,  9 May 2024 20:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715286205; cv=none; b=V7+besUi+toYjgCyYSX7pRY2zShstOqCdSUUYxFkf8q9IN9CfVbMFB6ZXWw0kv8+0xwskEWS6q8uqpy06XQaXzMb3bhPeR2Qukj29q5pRUr1sXrEq81phCUPUMWaGmOzwa9o0ZoZ+de215gsQ02AzrtKRAzECaqfjQm66LUSGlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715286205; c=relaxed/simple;
	bh=9tSktc8Jz6GkvQgrh3cRxpPTyfXmdZ24B8/XF7owCj8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fK05xv756TeoP6YN3jgeDTnII//U0CZqbwXnWe3C1UjuzUwG3BFOUe8iPMB2rcUVvL1cvi5Q10xXDgW4x85ChOcJ9SAj/HZcsbqe+Kdr1DWd1vbUDPrk7cg1dQzpvLGxqsYYM1hdWCiVg6L5J++kWWslM2AELeydBH0NLQ8mP5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kC/IbSf7; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kC/IbSf7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715286204; x=1746822204;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9tSktc8Jz6GkvQgrh3cRxpPTyfXmdZ24B8/XF7owCj8=;
  b=kC/IbSf7UTA9B4r/HcQgXO4q98PT+v7TRvQ8lz0/kOyX60NWDWCQx5Zo
   MWCzGUn5OLVaY+dl86r+EIyF2XhwQMujsiY/SlpzAxzHWHHFBx6eroAgW
   Fj7rQAcLt34K7cMBB/Zvnuv2VaehENMqMeYHP02t/26qqHt1anU+DbY1o
   pdqYiMxz5wBLUgzpeL7QHUTFiqSqNu/dWbUv7Ssg1MdXNZDJwE9WWR6F1
   FUqNB3ew7AFkJ3uuWiK33O6skgTbbExLcMU3MwGqzXKXlL+v3xpNCh5I3
   aOCDcvVEAkdgoR1J2+YkMCghjh92AFCtW8/lk/5gM5J7nkupzPcmntDYT
   Q==;
X-CSE-ConnectionGUID: CM7XN0wARjm0kcc89eyJVQ==
X-CSE-MsgGUID: 6Y2RulFLTB+Et091JDeQQg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15045920"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="15045920"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 13:23:23 -0700
X-CSE-ConnectionGUID: 5eNsp5kmRLKxBuYstXEtiQ==
X-CSE-MsgGUID: bZ3wyRlzTyq1enDGXU+NKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="29921673"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 May 2024 13:23:22 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5AIR-0005KB-1l;
	Thu, 09 May 2024 20:23:19 +0000
Date: Fri, 10 May 2024 04:22:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [chrome-os:chromeos-6.6 265/293]
 drivers/hid/i2c-hid/i2c-hid-core.c:178:12-13: WARNING opportunity for min()
Message-ID: <202405100458.FZ6dPcHT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   5d220f942b4447d636ce50c7378fafdc4f3c135c
commit: c09dd0deb97a324865ea2d7123bb294ddf0c9021 [265/293] FROMGIT: HID: i2c-hid: Retry address probe after delay
:::::: branch date: 15 hours ago
:::::: commit date: 34 hours ago
config: x86_64-randconfig-102-20240510 (https://download.01.org/0day-ci/archive/20240510/202405100458.FZ6dPcHT-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202405100458.FZ6dPcHT-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/hid/i2c-hid/i2c-hid-core.c:178:12-13: WARNING opportunity for min()

vim +178 drivers/hid/i2c-hid/i2c-hid-core.c

71af01a8c85ad8 drivers/hid/i2c-hid/i2c-hid.c      HungNien Chen  2016-11-10  162  
c09dd0deb97a32 drivers/hid/i2c-hid/i2c-hid-core.c Kenny Levinsen 2024-04-30  163  static int i2c_hid_probe_address(struct i2c_hid *ihid)
c09dd0deb97a32 drivers/hid/i2c-hid/i2c-hid-core.c Kenny Levinsen 2024-04-30  164  {
c09dd0deb97a32 drivers/hid/i2c-hid/i2c-hid-core.c Kenny Levinsen 2024-04-30  165  	int ret;
c09dd0deb97a32 drivers/hid/i2c-hid/i2c-hid-core.c Kenny Levinsen 2024-04-30  166  
c09dd0deb97a32 drivers/hid/i2c-hid/i2c-hid-core.c Kenny Levinsen 2024-04-30  167  	/*
c09dd0deb97a32 drivers/hid/i2c-hid/i2c-hid-core.c Kenny Levinsen 2024-04-30  168  	 * Some STM-based devices need 400µs after a rising clock edge to wake
c09dd0deb97a32 drivers/hid/i2c-hid/i2c-hid-core.c Kenny Levinsen 2024-04-30  169  	 * from deep sleep, in which case the first read will fail. Try after a
c09dd0deb97a32 drivers/hid/i2c-hid/i2c-hid-core.c Kenny Levinsen 2024-04-30  170  	 * short sleep to see if the device came alive on the bus. Certain
c09dd0deb97a32 drivers/hid/i2c-hid/i2c-hid-core.c Kenny Levinsen 2024-04-30  171  	 * Weida Tech devices also need this.
c09dd0deb97a32 drivers/hid/i2c-hid/i2c-hid-core.c Kenny Levinsen 2024-04-30  172  	 */
c09dd0deb97a32 drivers/hid/i2c-hid/i2c-hid-core.c Kenny Levinsen 2024-04-30  173  	ret = i2c_smbus_read_byte(ihid->client);
c09dd0deb97a32 drivers/hid/i2c-hid/i2c-hid-core.c Kenny Levinsen 2024-04-30  174  	if (ret < 0) {
c09dd0deb97a32 drivers/hid/i2c-hid/i2c-hid-core.c Kenny Levinsen 2024-04-30  175  		usleep_range(400, 500);
c09dd0deb97a32 drivers/hid/i2c-hid/i2c-hid-core.c Kenny Levinsen 2024-04-30  176  		ret = i2c_smbus_read_byte(ihid->client);
c09dd0deb97a32 drivers/hid/i2c-hid/i2c-hid-core.c Kenny Levinsen 2024-04-30  177  	}
c09dd0deb97a32 drivers/hid/i2c-hid/i2c-hid-core.c Kenny Levinsen 2024-04-30 @178  	return ret < 0 ? ret : 0;
c09dd0deb97a32 drivers/hid/i2c-hid/i2c-hid-core.c Kenny Levinsen 2024-04-30  179  }
c09dd0deb97a32 drivers/hid/i2c-hid/i2c-hid-core.c Kenny Levinsen 2024-04-30  180  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
