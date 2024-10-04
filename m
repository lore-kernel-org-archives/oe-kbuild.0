Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920231FAA
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Oct 2024 06:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728022030; cv=none; b=ZXVRAXuT3vmwNOo+NJqiQh51QOSVaW7TBWFoN8PpoUUJ2Hmb5mTY1ofoVAJxs3rkWS57LXMNAVvclEjTBuwmjyrBr+KoNBd7j5BX/40l1naXlh1ScOCxdHsxzeoYm63xrIFBkhvu2KbXJPK/FDWJCvuSolyrC9hJC3aWxCbsEJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728022030; c=relaxed/simple;
	bh=TfFZAEa0HYw2QEIa3iECP0tu/8WD7QS1tKEZ4zN+Qis=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oxuPZ5NhvcwALxGN2QT4HCSFCTL58ax7RQtdCt/QsryxxrEkRn2Qa2TToPUMxbkpb2mkbA+nni2EdHSAfE+o/HBtJfvU6Gile6K5rtNjYw52sD7E58dlndO34CG6dFM6XUc466Qh4KBEU/DbEuzMlJOgpZbBEGflDsRXFxe49wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SUA18prQ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SUA18prQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728022029; x=1759558029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TfFZAEa0HYw2QEIa3iECP0tu/8WD7QS1tKEZ4zN+Qis=;
  b=SUA18prQWomwOB1RO0Nb76qwXPYlB6ii2rxhTtBuC6cwbt067a2wjNKB
   4KCW9S7CzBcAMKgUQrH91xLPG2vSXOKfu3DwNGTu5kVuH7Xy+vgW4NTMM
   ORDWwb38Bd8aM+p9V+QgRqaTZkoL6viHZ+XWDdB0Y8j4nZc/O7YYSf7xi
   M0N0+usmrnHb+2FQfgcj8VJ4NJ93pCfrug+6UvpQR/c2KE2HJh1pXUcEG
   iDsg2L+Jquy8B2W3R9//9T6YoBARWTPy/xU8+ErmKMeXub7lEWF5bTGuk
   u3x1cU3HjXFdWGdbq10a00h7FIWEiTe5M5vi38n9jhZTNyNVzlg84PBdM
   g==;
X-CSE-ConnectionGUID: iin53kAWSgO4BRFWMj1RHw==
X-CSE-MsgGUID: 7FFv1hrcQ+mUnPJvVJk6lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="44701048"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="44701048"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 23:07:08 -0700
X-CSE-ConnectionGUID: ACOk64L9TbCwIJ9oAUOSkw==
X-CSE-MsgGUID: UIRyDnffTQ+wQwPW3niA9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="75039753"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Oct 2024 23:07:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swbSy-0001I8-2w;
	Fri, 04 Oct 2024 06:07:04 +0000
Date: Fri, 4 Oct 2024 14:07:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [chrome-os:chromeos-6.6 28/77] net/mac80211/mlme.c:5096:19-20:
 WARNING opportunity for max()
Message-ID: <202410041340.qC7RiGIi-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   fe003127ffd5de0ced884593048ac096a286bb0d
commit: 6b74ae2b49b1239a3716fb0bcaffc24631849457 [28/77] BACKPORT: wifi: mac80211: clean up connection process
:::::: branch date: 4 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-054-20241003 (https://download.01.org/0day-ci/archive/20241004/202410041340.qC7RiGIi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410041340.qC7RiGIi-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> net/mac80211/mlme.c:5096:19-20: WARNING opportunity for max()

vim +5096 net/mac80211/mlme.c

6b74ae2b49b123 Johannes Berg 2024-01-29  5087  
6b74ae2b49b123 Johannes Berg 2024-01-29  5088  static void
6b74ae2b49b123 Johannes Berg 2024-01-29  5089  ieee80211_determine_our_sta_mode_auth(struct ieee80211_sub_if_data *sdata,
6b74ae2b49b123 Johannes Berg 2024-01-29  5090  				      struct ieee80211_supported_band *sband,
6b74ae2b49b123 Johannes Berg 2024-01-29  5091  				      struct cfg80211_auth_request *req,
6b74ae2b49b123 Johannes Berg 2024-01-29  5092  				      bool wmm_used,
6b74ae2b49b123 Johannes Berg 2024-01-29  5093  				      struct ieee80211_conn_settings *conn)
6b74ae2b49b123 Johannes Berg 2024-01-29  5094  {
6b74ae2b49b123 Johannes Berg 2024-01-29  5095  	ieee80211_determine_our_sta_mode(sdata, sband, NULL, wmm_used,
6b74ae2b49b123 Johannes Berg 2024-01-29 @5096  					 req->link_id > 0 ? req->link_id : 0,
6b74ae2b49b123 Johannes Berg 2024-01-29  5097  					 conn);
cf0b045ebf6bba Johannes Berg 2023-06-18  5098  }
cf0b045ebf6bba Johannes Berg 2023-06-18  5099  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
