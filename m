Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EEE156F1
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jun 2023 22:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687817064; x=1719353064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o/OGuVkaeNbFD/GlcTf92g7jwY03zzTY9xXyTUVaTF4=;
  b=EFick+/zs4wSYcgVJBUYO6aZv0rfP6nBFSpGee8JjbryVpL/ivt7GfEW
   ncA05OBrsjAd9AcodMLI3y6nLqp8+Q9/aPHRQRw8ZgDwtUldNpFlpsrT8
   EQcjUt+DQJtdvKSyTk+a+rQUBAHfFteO9+UFFEt0ZNIXVdkG0MmBYd0HT
   PeXi3N1NVCPVo89HnGRSjXSbn7U5KhKvSzORw4VsQhl5Ke5M6l3cHjrPu
   ObE1Gdt2avu6gQLYd5zgXsXi7kNozTXpS4Q5TOZb48U+bWP1AoUIrraWW
   o0a8Urzc/WVqQyV/9cxmuqFFOZnfikpmT1RYpHzBDziXFof5/0CRptSQB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="391815687"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="391815687"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 15:04:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="829388102"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="829388102"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 26 Jun 2023 15:04:22 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDuJq-000Az7-0A;
	Mon, 26 Jun 2023 22:04:22 +0000
Date: Tue, 27 Jun 2023 06:03:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [selinuxproject-selinux:main 1/1] README.orig: warning: ignored by
 one of the .gitignore files
Message-ID: <202306270641.Szkfwh67-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "um arch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Paul Moore <paul@paul-moore.com>

tree:   https://github.com/SELinuxProject/selinux-kernel main
head:   6562f24b062008390199f85e60824e48e2da821e
commit: 6562f24b062008390199f85e60824e48e2da821e [1/1] selinux: add a SELinux specific README.md and SECURITY.md
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: um-defconfig (https://download.01.org/0day-ci/archive/20230627/202306270641.Szkfwh67-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230627/202306270641.Szkfwh67-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306270641.Szkfwh67-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> README.orig: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/run_tags_test.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/config: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/settings: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
