Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCD6318EC0
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Feb 2026 10:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770114530; cv=none; b=DW8HVJWU4DhfLdkf5p7ByqkdphIEDUUC7jTVUVS8XxaOQvKjcpUJ96BN+X5w38lbh1WTYJpBNOAN74eAQtfiD+YULK8FdQaNVqPzsFI4zBt3C7PFzzLAyhi5jA36r/YLIvp5e5FzYtBrsTsUJ9GDm5p+5t3FYSAyzV/CqySEOaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770114530; c=relaxed/simple;
	bh=DiaS5OIifMDB9AIlj99Nwx1+vbPYmqyQvPONdUPNVoo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VSAXhK2pY/YjoaF0ZycrLyUZiLuPFlIaea4PjqBQdbPOzJOgVJeXP4yHlXStCH7kj39NJNdA4IN2lGAb3quH93a249ccVXZeKmA+84CW3Z3+NxRMw70md4kY7tcU4jQTIOEfGnwTFbXHgIrn+8ssQT/0GcSXc63GgERLs9+JApM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c5KkJU6J; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c5KkJU6J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770114529; x=1801650529;
  h=date:from:to:subject:message-id:mime-version;
  bh=DiaS5OIifMDB9AIlj99Nwx1+vbPYmqyQvPONdUPNVoo=;
  b=c5KkJU6JveZn95dgof3LhSfGgyw9xA7ZROF2j5ikbgnrno4ANdUplh7F
   eJf6t+fX2mlmtxxgDeBAvujH2gj16SUALDNyCKNQAoTUC8DJSck9m3TQh
   e0lyxReXuF+iRiGHU6Shqb+XHJAtLl8KcZnsDEIou0mCYPK1d2P4ruLlK
   jT8761gxLy9qFkCsAU1rBO2v3aQs6nrt+p66xfezNQsO3PYtB9s98kAEB
   WJlrwbwGnulV2Ci4L/Cv3Q7JSCFEK4DqjRMsY0TIjV54HNbvk9V6wp6/+
   8zdTIks8L/bAWwR1qsYoJd06SuSRrzPKsRWP4IVykdOz/bjpaDbmnF5IT
   g==;
X-CSE-ConnectionGUID: YFGA8jPvRSesJeF29cLyGA==
X-CSE-MsgGUID: ct2+2TcNSmGqywkpqV6c6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="73877694"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="73877694"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 02:28:48 -0800
X-CSE-ConnectionGUID: +1d2HZb8Si2EWkEg68pmwA==
X-CSE-MsgGUID: lRSw8LkDQuGTwwyZgf2QGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="214769019"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 03 Feb 2026 02:28:47 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnDeH-000000003M1-1Xsf
	for oe-kbuild@lists.linux.dev;
	Tue, 03 Feb 2026 10:28:45 +0000
Date: Tue, 3 Feb 2026 11:28:43 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH] tracing: Fix ftrace event field alignments
Message-ID: <202602031120.ZqAT49M3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260202113024.61d5c1fd@gandalf.local.home>
References: <20260202113024.61d5c1fd@gandalf.local.home>
TO: Steven Rostedt <rostedt@goodmis.org>
TO: LKML <linux-kernel@vger.kernel.org>
TO: Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>

Hi Steven,

kernel test robot noticed the following build warnings:

[auto build test WARNING on trace/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/tracing-Fix-ftrace-event-field-alignments/20260203-003826
base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
patch link:    https://lore.kernel.org/r/20260202113024.61d5c1fd%40gandalf.local.home
patch subject: [PATCH] tracing: Fix ftrace event field alignments
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260203/202602031120.ZqAT49M3-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required after that ';' (ctx:VxV)
#47: FILE: kernel/trace/trace_export.c:18:
+#define ALIGN_STRUCTFIELD(type) ((int)(__alignof__(struct {type b;})))
                                                                  ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
