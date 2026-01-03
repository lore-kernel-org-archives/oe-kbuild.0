Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6205513D53C
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Jan 2026 02:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767407835; cv=none; b=L+5TJLbKhc0gHBosKxk8Yk/s7ht8kgePUY1w1g4adEfFkCj++X5h+Oemix/hFErTB7UG7irnPrN+R5cfF03I76yY9TWegjUbSuwDgi+IYmNxW3gj1aQuf9D+nGeHVXJrXYyQbaf0V5QKPWuvaVMw+cXLOIImzLAdiDdt/nO6Pu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767407835; c=relaxed/simple;
	bh=OLMHys6cB3Dg8WMqPUs1PuNBuBIZqUBJ0IMitIR9eKA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QdJ9c47etWWsYMaZlo78/NSKN+LJO8DCGuD7Fg6APtY5x57jn3zdLqwM9/98TywCgDgOaS6JgBTRFwI0JNBtvJ5j+RHVgnhNtMZliskDXZfM9aE/GfrMGna5LEW7gV0pu4lJjFsAHbsXZbYO3Ai+8Lp1ydOc5HqaykFWkc9dUXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UggItDbk; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UggItDbk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767407834; x=1798943834;
  h=date:from:to:subject:message-id:mime-version;
  bh=OLMHys6cB3Dg8WMqPUs1PuNBuBIZqUBJ0IMitIR9eKA=;
  b=UggItDbkLYRen0Hk+JEPJUev2w4vzlBe+JixSIxPe9niuYvOQ7XLmPFb
   lfVCc5elK1B6Mbl68VTHLezD/rgG/iUi9A5Fme2TKXl7z38sH0gQ1vJsC
   UiQu+GFSNf+I7K64Dbp61Y2O4YA12xXvfDphRQeZgNV+DuJMJuDf1CKQp
   Dm9UQZaW/tr5upGxe6gaQfLqXniVAWpTBllJ5cvHoXEljOsZDJmp++4Gk
   Hmvfv7KruDTDNwOOGqUZhNTm/N4yFpe7rE/ykcWxjssxMvnfLc3AQjadj
   YAn/XSARuIeheNNYpr17mWjXy+VXgHdop83migSh6gysTXXEE8FLRjmG1
   A==;
X-CSE-ConnectionGUID: OBHW88LqTN+NeFfNfYL7Bw==
X-CSE-MsgGUID: EwDM8Gu0SBePZOScO8xPUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="80329960"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="80329960"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 18:37:13 -0800
X-CSE-ConnectionGUID: m1yEp4ccQgS5rp8ZKBmvvA==
X-CSE-MsgGUID: irZQzKLcTQKsT0K10W5LxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="206985002"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 02 Jan 2026 18:37:12 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbrVu-000000000ZJ-0lYJ
	for oe-kbuild@lists.linux.dev;
	Sat, 03 Jan 2026 02:37:10 +0000
Date: Sat, 3 Jan 2026 03:36:22 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v1 7/7] Add support for the NFSv4.2 POSIX draft ACL
 attributes
Message-ID: <202601030331.kBvGIn1Z-lkp@intel.com>
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
In-Reply-To: <20260102232934.1560-8-rick.macklem@gmail.com>
References: <20260102232934.1560-8-rick.macklem@gmail.com>
TO: rick.macklem@gmail.com
TO: linux-nfs@vger.kernel.org

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on trondmy-nfs/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/rick-macklem-gmail-com/Add-entries-to-the-predefined-client-operations-enum/20260103-073239
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/20260102232934.1560-8-rick.macklem%40gmail.com
patch subject: [PATCH v1 7/7] Add support for the NFSv4.2 POSIX draft ACL attributes
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260103/202601030331.kBvGIn1Z-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#132: FILE: fs/nfs/nfs42proc.c:1724:
+	switch (status) {
+		case 0:
[...]
+		case -EPFNOSUPPORT:
+		case -EPROTONOSUPPORT:
[...]
+		case -ENOTSUPP:
[...]
+		default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#291: FILE: fs/nfs/nfs42proc.c:1883:
+	switch (status) {
+		case 0:
[...]
+		case -EPFNOSUPPORT:
+		case -EPROTONOSUPPORT:
[...]
+		case -ENOTSUPP:

ERROR:SPACING: space required before the open parenthesis '('
#318: FILE: fs/nfs/nfs42proc.c:1910:
+		switch(type) {

ERROR:SPACING: space required before the open parenthesis '('
#403: FILE: fs/nfs/nfs42xdr.c:1832:
+	switch(tag) {

ERROR:SPACING: space required before the open parenthesis '('
#443: FILE: fs/nfs/nfs42xdr.c:1872:
+	switch(acep->e_tag) {

ERROR:SPACING: space required before the open parenthesis '('
#574: FILE: fs/nfs/nfs42xdr.c:2003:
+	switch(acep->e_tag) {

ERROR:SPACING: space required before the open parenthesis '('
#759: FILE: fs/nfs/nfs42xdr.c:2188:
+	switch(type) {

ERROR:SPACING: space required before the open parenthesis '('
#823: FILE: fs/nfs/nfs42xdr.c:2252:
+	switch(entry->e_tag) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
