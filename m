Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7211C201277
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Oct 2024 06:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730185150; cv=none; b=VStYYMi7e1cKpdI3hurDB4OkKHdc9WXD6X9bCn9ohXkZaYUNycdKPQMnagyGdba3YwjNdp7rink2+13JTPtApdVSqscxxkCqD6LqjMxplCj9+aoKe72Xfxp/LQixEZXMBMPQZWP3+WzHSEmTrZM7H5GV2l7GgF0j4g4Hewi+SiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730185150; c=relaxed/simple;
	bh=NtepfLGnDHcJt7d4f/XQEJ/T/2HCKF+eOuD1+LCmt/o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SC6Y3s6lHVmYNF7OXWfEI6nNsdealNfxb84Iw2Zemx5bqAKzm2Byl9O1bo/eb9XemYyahqnzG11UPridHQd1wcY0XhBO2dgOsSa25sLmz0EP5YqjXS7DRHZXPfXNBv5bne0EyOQNQZg+6jbIqXfGfv4macj/NKcRWt2SENiKoYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ei6xqa1K; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ei6xqa1K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730185148; x=1761721148;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NtepfLGnDHcJt7d4f/XQEJ/T/2HCKF+eOuD1+LCmt/o=;
  b=Ei6xqa1KKF/r93pqxcUCFEGwBi/nHeUkuRdSVvANLhO1Fc09waqu1zAj
   g3udRO0S4Z7qQMA/BkcIw0LvkjyEiyP43TN8dkxkzhzQP0GLE6eYYB0T1
   DgFMthm5wfNJzG4EGER+rn+qt9NAnipLrLsNQM5SxyDlJal9GL/SZoGxe
   xVbdSLScH8FUQim4wsc1ZWiEsfpNfXaXWP+athKaLWw6E7AqJUcU2yH/9
   If9Qq6k7LGBMhcGwj6sJB/L85udmV6dWDpjMcIjcZvJAT/9L0p2anslwI
   bs+rTXNIWPerDZdBCwzuW8f3v4+iKcFxsDXkwQAbWHK1H3eieASwE6sy1
   g==;
X-CSE-ConnectionGUID: +rYj4E+CRyWDuGB8eekGYQ==
X-CSE-MsgGUID: Nmhjt14QQsyIL9Hp6rNARw==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="40426371"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="40426371"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 23:59:03 -0700
X-CSE-ConnectionGUID: hJyiKjC8QtS7JcwKncEZBw==
X-CSE-MsgGUID: s8/CY8e2QvOUJ75cILhqWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="82283420"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Oct 2024 23:58:46 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5gBf-000dM2-1L;
	Tue, 29 Oct 2024 06:58:43 +0000
Date: Tue, 29 Oct 2024 14:58:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: net/mac80211/mlme.c:5107:19-20: WARNING opportunity for max()
Message-ID: <202410291412.9yeuLfyD-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Johannes Berg <johannes.berg@intel.com>
CC: Ilan Peer <ilan.peer@intel.com>
CC: Miriam Rachel Korenblit <miriam.rachel.korenblit@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e42b1a9a2557aa94fee47f078633677198386a52
commit: 310c8387c63830bc375827242e0f9fa689f82e21 wifi: mac80211: clean up connection process
date:   9 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 9 months ago
config: openrisc-randconfig-r053-20241029 (https://download.01.org/0day-ci/archive/20241029/202410291412.9yeuLfyD-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410291412.9yeuLfyD-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> net/mac80211/mlme.c:5107:19-20: WARNING opportunity for max()

vim +5107 net/mac80211/mlme.c

bee7f58699a406 net/mac80211/mlme.c          Johannes Berg 2013-02-07  5098  
310c8387c63830 net/mac80211/mlme.c          Johannes Berg 2024-01-29  5099  static void
310c8387c63830 net/mac80211/mlme.c          Johannes Berg 2024-01-29  5100  ieee80211_determine_our_sta_mode_auth(struct ieee80211_sub_if_data *sdata,
310c8387c63830 net/mac80211/mlme.c          Johannes Berg 2024-01-29  5101  				      struct ieee80211_supported_band *sband,
310c8387c63830 net/mac80211/mlme.c          Johannes Berg 2024-01-29  5102  				      struct cfg80211_auth_request *req,
310c8387c63830 net/mac80211/mlme.c          Johannes Berg 2024-01-29  5103  				      bool wmm_used,
310c8387c63830 net/mac80211/mlme.c          Johannes Berg 2024-01-29  5104  				      struct ieee80211_conn_settings *conn)
310c8387c63830 net/mac80211/mlme.c          Johannes Berg 2024-01-29  5105  {
310c8387c63830 net/mac80211/mlme.c          Johannes Berg 2024-01-29  5106  	ieee80211_determine_our_sta_mode(sdata, sband, NULL, wmm_used,
310c8387c63830 net/mac80211/mlme.c          Johannes Berg 2024-01-29 @5107  					 req->link_id > 0 ? req->link_id : 0,
310c8387c63830 net/mac80211/mlme.c          Johannes Berg 2024-01-29  5108  					 conn);
310c8387c63830 net/mac80211/mlme.c          Johannes Berg 2024-01-29  5109  }
f0706e828e96d0 net/mac80211/ieee80211_sta.c Jiri Benc     2007-05-05  5110  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
