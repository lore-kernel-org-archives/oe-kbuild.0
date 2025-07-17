Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F452BE03E
	for <oe-kbuild@lists.linux.dev>; Thu, 17 Jul 2025 10:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752749426; cv=none; b=fIyNq7AAXHtFY8La6nkWjpdGnU019YkwdajtsHrOVr143kBX+aiMb7FzOnnKgNQeWgtarFqNx2XRXvkhDw1Tm9oG4bIaHbM7ySO4PwkPbOT+aJeKBrs64mzrgm9KVyOZKDgqgw87tRWw666dhsjhltUyYv0G1uFQsGYcH+resYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752749426; c=relaxed/simple;
	bh=doKwT1uXCU6J/wPY1jRFKYLebWjIpdJ6slSifOCHRMw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uy1VfEHGf1equTYAANiC9E7qN3VUjXX2DKQAz5uqPEi3aOuvzSeYPSQUHSQiz5KU2XY1diHkbKcPTeoqbpNeLy4PJIR7QUe80v1BtTb7Hgz7E9XdxQOxIo+GqfzqmlyXI+R3XnH2d5LlgV+7C9fCa0gTyRFgzquoHHVNzMVngX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dvZrzSyk; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dvZrzSyk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752749424; x=1784285424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=doKwT1uXCU6J/wPY1jRFKYLebWjIpdJ6slSifOCHRMw=;
  b=dvZrzSykpl8wNqb3n2gK1+Fxl2zMDbek2HsHoXT4i0h6NQRVJZ+q5rqb
   cvCE+wClFNWoKsXE3Tj1V67KrcWWBq3Zazl1Y25RXCrLAywas3ajtJi2n
   a9OyUoVAvtwHxeVnbZW8LFcwWxZFT7BjOokeF1d4GT0x/41EHHTulZNnX
   QdlAXHir1aeQUZK1IASFwAb8k/ByDS/y+HxewBcb6g6iLWkoYtXkDVznE
   QP7UThjArN3AgZ1wtKayGr11CWlNqD4R0ui2Hb/IpKmHmNYwKc9igqSpR
   inHi/ob8FcOXfCUwNpqgk6yqiEzKznFOH+GfLrq93f1d5W+8yNwa9932m
   g==;
X-CSE-ConnectionGUID: KWy9A60KTQCcn2uVs/dGGQ==
X-CSE-MsgGUID: WvBoDOjkTJ+tNuezx1Nh2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="66088860"
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="66088860"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 03:50:23 -0700
X-CSE-ConnectionGUID: aYNsDDNbQi2fgIziVq4BVw==
X-CSE-MsgGUID: M2QXAbSGSi+4QAHM4qCNGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="157134978"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Jul 2025 03:50:24 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucMBx-000DXl-0Z;
	Thu, 17 Jul 2025 10:50:21 +0000
Date: Thu, 17 Jul 2025 18:49:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 10097/10441] fs/bcachefs/journal_reclaim.c:877
 journal_flush_done() warn: missing error code? 'ret'
Message-ID: <202507171850.10rxb3uq-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e8352908bdcd2d0bcf0aca8c69fae85fd5ea5edb
commit: 0e1d28c378988f28b773807c00e7f3be40f49bf3 [10097/10441] bcachefs: convert journal_reclaim.c to CLASS/guards
:::::: branch date: 23 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250716 (https://download.01.org/0day-ci/archive/20250717/202507171850.10rxb3uq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507171850.10rxb3uq-lkp@intel.com/

smatch warnings:
fs/bcachefs/journal_reclaim.c:877 journal_flush_done() warn: missing error code? 'ret'

vim +/ret +877 fs/bcachefs/journal_reclaim.c

35f5197009cae2 Kent Overstreet 2025-01-25  860  
039fc4c5221f74 Kent Overstreet 2020-05-28  861  static int journal_flush_done(struct journal *j, u64 seq_to_flush,
039fc4c5221f74 Kent Overstreet 2020-05-28  862  			      bool *did_work)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  863  {
35f5197009cae2 Kent Overstreet 2025-01-25  864  	int ret = 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  865  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  866  	ret = bch2_journal_error(j);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  867  	if (ret)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  868  		return ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  869  
0e1d28c378988f Kent Overstreet 2025-07-14  870  	guard(mutex)(&j->reclaim_lock);
000de45996c4b0 Kent Overstreet 2019-01-14  871  
1e690efa72596a Kent Overstreet 2025-02-10  872  	for (int type = JOURNAL_PIN_TYPE_NR - 1;
1e690efa72596a Kent Overstreet 2025-02-10  873  	     type >= 0;
1e690efa72596a Kent Overstreet 2025-02-10  874  	     --type)
1e690efa72596a Kent Overstreet 2025-02-10  875  		if (journal_flush_pins_or_still_flushing(j, seq_to_flush, BIT(type))) {
35f5197009cae2 Kent Overstreet 2025-01-25  876  			*did_work = true;
0e1d28c378988f Kent Overstreet 2025-07-14 @877  			return ret;
35f5197009cae2 Kent Overstreet 2025-01-25  878  		}
000de45996c4b0 Kent Overstreet 2019-01-14  879  
a66ff26b0f3118 Kent Overstreet 2023-12-10  880  	if (seq_to_flush > journal_cur_seq(j))
a66ff26b0f3118 Kent Overstreet 2023-12-10  881  		bch2_journal_entry_close(j);
a66ff26b0f3118 Kent Overstreet 2023-12-10  882  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  883  	/*
1c6fdbd8f2465d Kent Overstreet 2017-03-16  884  	 * If journal replay hasn't completed, the unreplayed journal entries
1c6fdbd8f2465d Kent Overstreet 2017-03-16  885  	 * hold refs on their corresponding sequence numbers
1c6fdbd8f2465d Kent Overstreet 2017-03-16  886  	 */
0e1d28c378988f Kent Overstreet 2025-07-14  887  	guard(spinlock)(&j->lock);
b895c70326aa43 Kent Overstreet 2024-04-30  888  	ret = !test_bit(JOURNAL_replay_done, &j->flags) ||
1c6fdbd8f2465d Kent Overstreet 2017-03-16  889  		journal_last_seq(j) > seq_to_flush ||
f0a3a2ccabc5ae Kent Overstreet 2022-02-28  890  		!fifo_used(&j->pin);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  891  	return ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  892  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  893  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
