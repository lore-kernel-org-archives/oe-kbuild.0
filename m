Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A0433CFD
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Jan 2024 18:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706727411; cv=none; b=OOd7Zrnid717mQfjaEEqCmTf8SWH+EcEA1O+rU5NChdNqKrN/M1AuRCxBaPHhNXpvNjQieXClLkpXlzs8NYR09q6TUnwXEPNlh02aZO1X5xXikYXQapPvOWFuJnrmi+6sme1qx0Zvv3/qhy1AVfnw4Tq1ydg2xy89LLtifp/B/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706727411; c=relaxed/simple;
	bh=2KGU2nSz1VjkEw7mFJorUz1EX0aujCxBloax1jvxIig=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OA7wmA7S9oFtYUgLF6Hi/MPdH5nPX+5TcuXUhkywvPzVHfrYODNEXacUsp/LVtMeb3LJhwn094CvZyTdsEjC+ym56Q8g2jbkkHDa8VeZnK8bG/mvA8HSaO/Z+mBiVimI55pxO3xapAKNyzGrFg/gcbsoj9A1w4UdGVeIypemDNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JC7kBKnO; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JC7kBKnO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706727410; x=1738263410;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2KGU2nSz1VjkEw7mFJorUz1EX0aujCxBloax1jvxIig=;
  b=JC7kBKnO9/CCRMKfFoCCmkqxyzLMvmaXs0CkXtyg173E18xfnphHuRdt
   UWG5JDIQuyPUAF8KdElHITsNyQLRhIu6bqDQYhp/a2bNo/wIrj/Y8QveE
   QqHII6c8ktyQkIx0h1aPEhVNxufMsdFlhUmkK13pDcIm8W34nRMWhewho
   097XbaSNpZSLTiwwtS83Vjen9ujDGvniSulc2ktKXg7VPSeN/37J9ifHc
   3Kml6nw9/cUjUbcetJFcluoBt/hAbacXVllZhEMTyKNuUQccxMcGo+emV
   r/To2spzBknEJpjyGFBCWx6lroCW0cbdTNrlSUXnHt7OQcsaVfuI99P1Z
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3558787"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="3558787"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 10:56:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="822675689"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="822675689"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 31 Jan 2024 10:56:47 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVFlN-0001uQ-0r;
	Wed, 31 Jan 2024 18:56:45 +0000
Date: Thu, 1 Feb 2024 02:56:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH 02/15] wifi: mac80211: clean up connection process
Message-ID: <202402010203.oFGFYBYQ-lkp@intel.com>
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
In-Reply-To: <20240129194108.9451722c0110.I3e61f4cfe9da89008e1854160093c76a1e69dc2a@changeid>
References: <20240129194108.9451722c0110.I3e61f4cfe9da89008e1854160093c76a1e69dc2a@changeid>
TO: Johannes Berg <johannes@sipsolutions.net>
TO: linux-wireless@vger.kernel.org
CC: Johannes Berg <johannes.berg@intel.com>
CC: Ilan Peer <ilan.peer@intel.com>
CC: Miriam Rachel Korenblit <miriam.rachel.korenblit@intel.com>

Hi Johannes,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[cannot apply to wireless/main staging/staging-testing staging/staging-next staging/staging-linus linus/master v6.8-rc2 next-20240131]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Berg/wifi-mac80211-clean-up-band-switch-in-duration/20240130-025313
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20240129194108.9451722c0110.I3e61f4cfe9da89008e1854160093c76a1e69dc2a%40changeid
patch subject: [PATCH 02/15] wifi: mac80211: clean up connection process
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-101-20240131 (https://download.01.org/0day-ci/archive/20240201/202402010203.oFGFYBYQ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202402010203.oFGFYBYQ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> net/mac80211/mlme.c:5106:19-20: WARNING opportunity for max()

vim +5106 net/mac80211/mlme.c

bee7f58699a406 net/mac80211/mlme.c          Johannes Berg 2013-02-07  5097  
398baf0587bf42 net/mac80211/mlme.c          Johannes Berg 2024-01-29  5098  static void
398baf0587bf42 net/mac80211/mlme.c          Johannes Berg 2024-01-29  5099  ieee80211_determine_our_sta_mode_auth(struct ieee80211_sub_if_data *sdata,
398baf0587bf42 net/mac80211/mlme.c          Johannes Berg 2024-01-29  5100  				      struct ieee80211_supported_band *sband,
398baf0587bf42 net/mac80211/mlme.c          Johannes Berg 2024-01-29  5101  				      struct cfg80211_auth_request *req,
398baf0587bf42 net/mac80211/mlme.c          Johannes Berg 2024-01-29  5102  				      bool wmm_used,
398baf0587bf42 net/mac80211/mlme.c          Johannes Berg 2024-01-29  5103  				      struct ieee80211_conn_settings *conn)
398baf0587bf42 net/mac80211/mlme.c          Johannes Berg 2024-01-29  5104  {
398baf0587bf42 net/mac80211/mlme.c          Johannes Berg 2024-01-29  5105  	ieee80211_determine_our_sta_mode(sdata, sband, NULL, wmm_used,
398baf0587bf42 net/mac80211/mlme.c          Johannes Berg 2024-01-29 @5106  					 req->link_id > 0 ? req->link_id : 0,
398baf0587bf42 net/mac80211/mlme.c          Johannes Berg 2024-01-29  5107  					 conn);
398baf0587bf42 net/mac80211/mlme.c          Johannes Berg 2024-01-29  5108  }
f0706e828e96d0 net/mac80211/ieee80211_sta.c Jiri Benc     2007-05-05  5109  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
