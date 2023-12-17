Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F76487A1
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Dec 2023 20:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PmxpWIhk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702846069; x=1734382069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SNKqiXI94rOb7HXQRxhLA5rqrQT9zitcysuprpWljX8=;
  b=PmxpWIhkosYnqNRxs/glPV3qTV813y42WJWsVEGdEIa8rNMWIKMBLfqn
   FOU1niH9DRgW10qC/O45XXxb7YntxSxQKCfzinpjCnY7SvwKdMsobSW6m
   vZJ7F/06PxZV+baVGOohNcWivAxm55xXGwr7MuIDHGYUQToqvrFmJrl59
   sXDDfoVmnAmVGh0nlVDRQWirynsGm63Ps1qSwsFKcO7HcDyJM2PKzaHrp
   wKEPLss7jXlEz20EmJzbab8fK2XIx6lpLa+xmz35pE4VGImbcCDYgfs8f
   SeMF4xH+SMIe5Sn3NUGd/MNkY1cIBJGkVUK3UkhV0MHrKDidg5ln3MkuY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="2283678"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="2283678"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 12:47:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="898748135"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="898748135"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 17 Dec 2023 12:47:46 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEy36-0003PY-1s;
	Sun, 17 Dec 2023 20:47:44 +0000
Date: Mon, 18 Dec 2023 04:47:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: htmldocs: ./include/net/cfg80211.h:1191: warning: Excess struct
 member 'elem' description in 'cfg80211_mbssid_elems'
Message-ID: <202312180406.vIuKNmyu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "kernel-doc warning due to __counted_by"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: Johannes Berg <johannes.berg@intel.com>
CC: "Gustavo A. R. Silva" <gustavoars@kernel.org>
CC: Jeff Johnson <quic_jjohnson@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e389834672c723435a44818ed2cabc4dad24429
commit: c14679d7005a4d26289eadb4f5fe499aca78ef7c wifi: cfg80211: Annotate struct cfg80211_mbssid_elems with __counted_by
date:   4 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 4 months ago
reproduce: (https://download.01.org/0day-ci/archive/20231218/202312180406.vIuKNmyu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312180406.vIuKNmyu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/net/cfg80211.h:1191: warning: Excess struct member 'elem' description in 'cfg80211_mbssid_elems'

vim +1191 ./include/net/cfg80211.h

dc1e3cb8da8b41 John Crispin 2021-09-15  1175  
dc1e3cb8da8b41 John Crispin 2021-09-15  1176  /**
dc1e3cb8da8b41 John Crispin 2021-09-15  1177   * struct cfg80211_mbssid_elems - Multiple BSSID elements
dc1e3cb8da8b41 John Crispin 2021-09-15  1178   *
dc1e3cb8da8b41 John Crispin 2021-09-15  1179   * @cnt: Number of elements in array %elems.
dc1e3cb8da8b41 John Crispin 2021-09-15  1180   *
dc1e3cb8da8b41 John Crispin 2021-09-15  1181   * @elem: Array of multiple BSSID element(s) to be added into Beacon frames.
dc1e3cb8da8b41 John Crispin 2021-09-15  1182   * @elem.data: Data for multiple BSSID elements.
dc1e3cb8da8b41 John Crispin 2021-09-15  1183   * @elem.len: Length of data.
dc1e3cb8da8b41 John Crispin 2021-09-15  1184   */
dc1e3cb8da8b41 John Crispin 2021-09-15  1185  struct cfg80211_mbssid_elems {
dc1e3cb8da8b41 John Crispin 2021-09-15  1186  	u8 cnt;
dc1e3cb8da8b41 John Crispin 2021-09-15  1187  	struct {
dc1e3cb8da8b41 John Crispin 2021-09-15  1188  		const u8 *data;
dc1e3cb8da8b41 John Crispin 2021-09-15  1189  		size_t len;
c14679d7005a4d Kees Cook    2023-08-17  1190  	} elem[] __counted_by(cnt);
dc1e3cb8da8b41 John Crispin 2021-09-15 @1191  };
dc1e3cb8da8b41 John Crispin 2021-09-15  1192  

:::::: The code at line 1191 was first introduced by commit
:::::: dc1e3cb8da8b414b37208b2fb6755fef8122504b nl80211: MBSSID and EMA support in AP mode

:::::: TO: John Crispin <john@phrozen.org>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
