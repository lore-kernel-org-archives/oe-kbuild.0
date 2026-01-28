Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CE32AF1B
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Jan 2026 01:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769562786; cv=none; b=fMfJicvf6iVX9a3Couh1x2qYOWpbdgLgQk1NEoKkgOzE66oqrQUx4CWMTQRJuBMLycJ/ae0UzeTWAUJIbpwaVSUNC4gvp7oLzTUmeWgfxqcCFq/HOlUK2u1NbTqzH3AFd4QrdHbbdwCEQY8O1YfyvUAze4dnkOpgKQhiTNz4mn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769562786; c=relaxed/simple;
	bh=WLZj3UdyHv6LgSlcl4wOC5xSVV99Hu32884onta6Hgw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ifa4msdOeLy3njmKRHQ+gkXVDMuxyVwGzhzAc2eSH4Gk/nkbt5F6QBN5Xrp2cBkuWts0rnIPcUs2z0m2nXA8slA1LbauT/L3CIKMqd91Jv0Pz6SEYxb2egVXGiwM6gs+ANhU+TfxwAnYqg/MARv7AjhDqYjFYFvSHp52cWckjLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CDIUraib; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CDIUraib"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769562785; x=1801098785;
  h=date:from:to:cc:subject:message-id;
  bh=WLZj3UdyHv6LgSlcl4wOC5xSVV99Hu32884onta6Hgw=;
  b=CDIUraibWJIyeTVN0/JjVN6i3EsfDIo4Jh5CsgCR84zrX4psjqHZbSKF
   6EmKsE5IUAOz3p+CWUyDyeljWNV2jC+llhh62C4PqSAgQ1jf6qBTZFlkQ
   eFApTGFx4RXjyWwW22HjnOnT4X8XkezixeaaRGV4RfRTtJ0zO64VKJv2p
   xVkUd3C8N+PWVCBZH22g4V5UhFm9jgFI69rXlVfGVKStNYRXK1KrNyB5I
   J8YxNS2IAvVaIJopivL7rsM1AT2BwVLi4oVTDBQ8+7Y39CEqj+Md0MySt
   /jaNnBWOjUKnshDlO7PbZQsiCKiJC2WY2LMEnqgRELQ6TFLzW/QJQdo/P
   A==;
X-CSE-ConnectionGUID: 0m2TMZAQRgqh911m4QWHow==
X-CSE-MsgGUID: LT12yyqlRWCtN6Dzp9cj5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70671905"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="70671905"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 17:13:04 -0800
X-CSE-ConnectionGUID: Q3FKYHBoTxCZyZ75JbkYeQ==
X-CSE-MsgGUID: kcvvVhgHT0uUlNhjvqaG7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="208580669"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 Jan 2026 17:13:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vku7A-00000000Z5I-2WpS;
	Wed, 28 Jan 2026 01:13:00 +0000
Date: Wed, 28 Jan 2026 09:12:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [samba-ksmbd:ksmbd-for-next-next 2/2]
 fs/smb/server/connection.c:45 proc_show_clients() warn: '%pI4' can only be
 followed by one of [hnbl], not 'c'
Message-ID: <202601280928.v9b8CZWg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Bahubali B Gumaji <bahubali.bg@samsung.com>
CC: Namjae Jeon <linkinjeon@kernel.org>
CC: Hyunchul Lee <hyc.lee@gmail.com>
CC: "Sang-Soo Lee" <constant.lee@samsung.com>

tree:   git://git.samba.org/ksmbd.git ksmbd-for-next-next
head:   71e7b7a9f9433c5c340eeb8cfaa12a72e2369f73
commit: 71e7b7a9f9433c5c340eeb8cfaa12a72e2369f73 [2/2] ksmbd: add procfs interface for runtime monitoring and statistics
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: x86_64-randconfig-161-20260128 (https://download.01.org/0day-ci/archive/20260128/202601280928.v9b8CZWg-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601280928.v9b8CZWg-lkp@intel.com/

smatch warnings:
fs/smb/server/connection.c:45 proc_show_clients() warn: '%pI4' can only be followed by one of [hnbl], not 'c'
fs/smb/server/mgmt/user_session.c:97 show_proc_session() warn: '%pI4' can only be followed by one of [hnbl], not 'c'
fs/smb/server/mgmt/user_session.c:213 show_proc_sessions() warn: '%pI4' can only be followed by one of [hnbl], not 'c'

vim +45 fs/smb/server/connection.c

71e7b7a9f9433c Bahubali B Gumaji 2026-01-27  28  
71e7b7a9f9433c Bahubali B Gumaji 2026-01-27  29  static int proc_show_clients(struct seq_file *m, void *v)
71e7b7a9f9433c Bahubali B Gumaji 2026-01-27  30  {
71e7b7a9f9433c Bahubali B Gumaji 2026-01-27  31  	struct ksmbd_conn *conn;
71e7b7a9f9433c Bahubali B Gumaji 2026-01-27  32  	struct timespec64 now, t;
71e7b7a9f9433c Bahubali B Gumaji 2026-01-27  33  	int i;
71e7b7a9f9433c Bahubali B Gumaji 2026-01-27  34  
71e7b7a9f9433c Bahubali B Gumaji 2026-01-27  35  	seq_printf(m, "#%-20s %-10s %-10s %-10s %-10s %-10s\n",
71e7b7a9f9433c Bahubali B Gumaji 2026-01-27  36  			"<name>", "<dialect>", "<credits>", "<open files>",
71e7b7a9f9433c Bahubali B Gumaji 2026-01-27  37  			"<requests>", "<last active>");
71e7b7a9f9433c Bahubali B Gumaji 2026-01-27  38  
71e7b7a9f9433c Bahubali B Gumaji 2026-01-27  39  	down_read(&conn_list_lock);
71e7b7a9f9433c Bahubali B Gumaji 2026-01-27  40  	hash_for_each(conn_list, i, conn, hlist) {
71e7b7a9f9433c Bahubali B Gumaji 2026-01-27  41  		jiffies_to_timespec64(jiffies - conn->last_active, &t);
71e7b7a9f9433c Bahubali B Gumaji 2026-01-27  42  		ktime_get_real_ts64(&now);
71e7b7a9f9433c Bahubali B Gumaji 2026-01-27  43  		t = timespec64_sub(now, t);
71e7b7a9f9433c Bahubali B Gumaji 2026-01-27  44  		if (conn->inet_addr)
71e7b7a9f9433c Bahubali B Gumaji 2026-01-27 @45  			seq_printf(m, "%-20pI4c", &conn->inet_addr);
71e7b7a9f9433c Bahubali B Gumaji 2026-01-27  46  		else
71e7b7a9f9433c Bahubali B Gumaji 2026-01-27  47  			seq_printf(m, "%-20pI6c", &conn->inet6_addr);
71e7b7a9f9433c Bahubali B Gumaji 2026-01-27  48  		seq_printf(m, "   0x%-10x %-10u %-12d %-10d %ptT\n",
71e7b7a9f9433c Bahubali B Gumaji 2026-01-27  49  			   conn->dialect,
71e7b7a9f9433c Bahubali B Gumaji 2026-01-27  50  			   conn->total_credits,
71e7b7a9f9433c Bahubali B Gumaji 2026-01-27  51  			   atomic_read(&conn->stats.open_files_count),
71e7b7a9f9433c Bahubali B Gumaji 2026-01-27  52  			   atomic_read(&conn->req_running),
71e7b7a9f9433c Bahubali B Gumaji 2026-01-27  53  			   &t);
71e7b7a9f9433c Bahubali B Gumaji 2026-01-27  54  	}
71e7b7a9f9433c Bahubali B Gumaji 2026-01-27  55  	up_read(&conn_list_lock);
71e7b7a9f9433c Bahubali B Gumaji 2026-01-27  56  	return 0;
71e7b7a9f9433c Bahubali B Gumaji 2026-01-27  57  }
71e7b7a9f9433c Bahubali B Gumaji 2026-01-27  58  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
