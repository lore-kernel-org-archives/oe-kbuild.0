Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DEE15CD74
	for <oe-kbuild@lists.linux.dev>; Sun, 25 Jan 2026 00:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769300705; cv=none; b=P9Su6CsipwbpctCNsi0jYTY1ubjRqCkUIqemasQvYjmgrbf24LBerqBzg0GpxmeRcW5IIG8Z/IJPRSxtoWD5hsUvkptyk1jgXzjfY/KFs+IiPDqcFna42JVpBGYYSTWzwWSMZCiFlO/FE4uL5epoKJ5pqR8wQF3B9OSCI2CnxlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769300705; c=relaxed/simple;
	bh=jh6hxTU0/vdjnmceU/TwfCuu44+Hldu2iLA3bjUU9HE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=fIrjHPRF2bNx3rCZ6CeCjGj9+l8EFTuil1qe6p07gA7+zK8fOXX57XmEvZeRhSK7KbVaT/zzcDbEg4A/QJD/I6/IlnbwO3uasgmduNPfSXqmTaZnSBzwo9X3l0m8wClh8T7N7eU0JG6lsVeGJj8Gm/MN6ASLrsicooxcQbXNPsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y3JoD757; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y3JoD757"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769300703; x=1800836703;
  h=date:from:to:subject:message-id:mime-version;
  bh=jh6hxTU0/vdjnmceU/TwfCuu44+Hldu2iLA3bjUU9HE=;
  b=Y3JoD757xk/GY1XGG1RjBLC0P9SQaaXa43xof1Uc8GR4e5TgKAY2YQiw
   2vonLwuR5+8vk1XkzeRJUaVjmYoo75Q6ah9olL0ixFiY0TNWOwNoJ0iKL
   Hm/WwZxmXw60ckDYitHSfvaQFuQhmS3bb0QnDGG1LTxSBOcsdG2I+GnbG
   C0usECNVcsYbifpVlEdJZI3lCBOBd5jdlj6oWEO9mnLn4Cgf5Ku4L0ZXe
   T909ORd8w10i400uyO91hHeyJW4+Q23XoiRtJteEWGh4Y81THFo22Nryc
   ghX4161YC3bqgytq2YoBH1b9K8dZRuejpwNVyTWnY6Fq9ay8kGJaJisnS
   g==;
X-CSE-ConnectionGUID: Dw8l1b8TTzOmZHNpXD/yyA==
X-CSE-MsgGUID: +XdI6DndTJ2X79BpK5BVAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="81880698"
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="81880698"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 16:25:02 -0800
X-CSE-ConnectionGUID: 196soP51Trm3pOIKRvLqkw==
X-CSE-MsgGUID: yIKuf9t/RPaUzZTDakTuyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="211812309"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 24 Jan 2026 16:25:01 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjnw2-0000000016P-3th4
	for oe-kbuild@lists.linux.dev;
	Sun, 25 Jan 2026 00:24:58 +0000
Date: Sun, 25 Jan 2026 01:24:08 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: 
 =?us-ascii?Q?[linux-review:Boris-Burkov/btrfs-fix-EEXIST-abort-due-to-?=
 =?us-ascii?Q?non-consecutive-gaps-in-chunk-allocation/20260125-054609?=
 2/3] checkpatch: ERROR:BAD_SIGN_OFF: Unrecognized email address:
 'claude-opus-4-5'
Message-ID: <202601250143.W8W4LQpY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Boris Burkov <boris@bur.io>

tree:   https://github.com/intel-lab-lkp/linux/commits/Boris-Burkov/btrfs-fix-EEXIST-abort-due-to-non-consecutive-gaps-in-chunk-allocation/20260125-054609
head:   c7cf21296f27e740617d389cc1534141a466e8ba
commit: d2167f11b5e5f98e4b65edcec5e26f4d86c2836b [2/3] btrfs: unit tests for pending extent walking functions
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260125/202601250143.W8W4LQpY-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'claude-opus-4-5'
#21: 
Assisted-by: claude-opus-4-5

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
