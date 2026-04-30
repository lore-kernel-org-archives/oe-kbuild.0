Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AEA402BB3
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Apr 2026 12:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777552778; cv=none; b=IBFct7rr8ymdd40axtn4a8Z4sMtF8Q6P6RKXtUI0uxIjhwR2Se3YKQkaoloL+cNpi+pTyR4P52Fs+eWJQeQ3xumU6X1H8CGCMj8kw1jzh97Hr7uzkOvPrrbcdgvCXp3lu+HxOYAGVfW8BeJoYXPjfYXmjCpc0Q0D5LrIdwBZP+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777552778; c=relaxed/simple;
	bh=QKuBFSY7xhC+jQmhswpG7G4i/RzgzERJpCoHIt7JjO8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NSaDI7ge323QUiLleiADiwuGZiKIYG1caTKFfrCtBF9QcHc/CjnTduSvSjBQ8QJ9QI7EPqz0jQCzNyU1i+6cpWuooIJNlV7HzHfE5rlyyBW8u9zE+QOJlo67hCcNa5CQkqzIn8EG/MVVg1SLz2gaqiMrnAPUiEzs1CybJJEQ8TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NhV12KLc; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NhV12KLc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777552778; x=1809088778;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=QKuBFSY7xhC+jQmhswpG7G4i/RzgzERJpCoHIt7JjO8=;
  b=NhV12KLcdjax0E9coyzWUF7Xq+PNXpIJKRiXkVzoc4VDvaZwgtWzhjlv
   0EK6BSo6mfVx/O794SU+05neF9OW0O1XS9Dfhgcrr9XVlJcuv29BNIHya
   W4cDigbq7ykOLai4nY7wkEjS164nM28X7r2rsSSAvvp/NN45B/fcLIJDd
   69WYNKbPqxtLIJK38F6HkqL9SjsoIJaTCB/rfWoxfMkKzuOCz7nmIvtQM
   UDjG8GfvqueGzrfKNBIiOS999AtvOaihTKnktUkXZql58oceZDsjv7K6J
   22Q4abcqSBxY5ty2mkjIW94qjyftZE5as8WSAznMo/ca9o5lZM7dLvdp9
   w==;
X-CSE-ConnectionGUID: inu9TYg8Quu1nQcZV+SIBQ==
X-CSE-MsgGUID: P72Etyx1SdmyPg3heA5iQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78488226"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="78488226"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 05:39:37 -0700
X-CSE-ConnectionGUID: np0IJRcOQl+qyFIDvtWfKA==
X-CSE-MsgGUID: Jxj6imhxRm6OvYlAN7hksA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="231927755"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 30 Apr 2026 05:39:36 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIQg1-000000004oz-3rz8;
	Thu, 30 Apr 2026 12:39:33 +0000
Date: Thu, 30 Apr 2026 14:39:07 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 13/45]
 auxclock.c:340:31: warning: unused variable 'timex'
Message-ID: <202604301405.2KQQFBii-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Wei=C3=9Fschuh (Schneider Electric)" <thomas.weissschuh@linutro=
nix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/auxclock-nanosleep
head:   e01524186c78f7080eeb4ad11c0eb4fca0edae6c
commit: 056e76f8f2e0c258a8327cc26c922ec1a93319e4 [13/45] fixme test
:::::: branch date: 6 hours ago
:::::: commit date: 2 days ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260=
430/202604301405.2KQQFBii-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260430/202604301405.2KQQFBii-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604301405.2KQQFBii-lkp@intel.com/

All warnings (new ones prefixed by >>):

   auxclock.c: In function 'auxclock_nanosleep':
>> auxclock.c:340:31: warning: unused variable 'timex' [-Wunused-variable]
     340 |         struct __kernel_timex timex =3D {};
         |                               ^~~~~

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
