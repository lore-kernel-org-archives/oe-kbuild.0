Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F8EC8E9
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Aug 2024 16:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723393383; cv=none; b=VqqHPrSkfdTJ4U+AUUfT0Ar7p0nsHIC1N3EGRmR0SHnlrqInjH0HzZly1rKCnTvsoHGX0DcFFyE+0kT+e5RMxushIl9R2er1CRBWMz5mUCBdTbaipacK659xMcEacquJXtVs+4GtkNyoN+pm3x5xQPt4uWC9t41q4nSVeTTKGwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723393383; c=relaxed/simple;
	bh=mM0b/SFMYt8U6AUTyQcf4clAvottv1EI1nx2vRWyDDE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pFptiVc4KDurbGXpXo4EXG46A3QEjcR+gq6gdUfZgZ0Q9miJxmVaAjue3iNtkMBxzf7RBGaohbgrgzFYhp9dtlS3tKLuxM3A+wZ1ifaZD2HlHd3e7nRmW9fKhxnPD344B4XuozZ42U7jCqqHQHxn0DfxpXJwxqaRK1D5sg1P/4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OTp90cd+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OTp90cd+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723393381; x=1754929381;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mM0b/SFMYt8U6AUTyQcf4clAvottv1EI1nx2vRWyDDE=;
  b=OTp90cd+ognGP3u80GHGXfbFTZY6Q5aTYKUOjutY8SyAOt3Q3uIrJgmE
   /l8B15+C4ZJdycJrJ6fSilfkm+lMuWyND6jCiGcgw/Aiw9S4uOgF26dCz
   L2Ys2NtgeIj9RZVWbE2GDgYEypYZXxZib13IoY9Ui6lXwvAa5MZl8osQp
   kYueNpl+T7h9TJbTnShjomCkbpYDh8Pjc28HM8F7pXuTDTl2+UrYedog5
   Zdgh7/pujo5Phan4SSmgWJpo9sPeExDnVO4XnmNQWIZ3c34o3ApaFO/g2
   cOH/l/FtzsuG+MMZ9dwKBDmD86DwwTUuOj+zWkpeYHHD09ePV/x5O0/Ff
   g==;
X-CSE-ConnectionGUID: H+9DRRf/QY2lCjIWDrbLOQ==
X-CSE-MsgGUID: 7R5btXWPQMy6D1KAQdTBwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21385289"
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="21385289"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 09:23:00 -0700
X-CSE-ConnectionGUID: EXbKPwRWR3K4Lj56zp4d8g==
X-CSE-MsgGUID: NPDjW9AET76EodAwpJG7mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="62176138"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 11 Aug 2024 09:22:59 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdBLN-000AyN-2Y;
	Sun, 11 Aug 2024 16:22:57 +0000
Date: Mon, 12 Aug 2024 00:22:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next v1 1/2] dpll: add Embedded SYNC feature for a pin
Message-ID: <202408120042.oTNcxcHu-lkp@intel.com>
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
In-Reply-To: <20240808112013.166621-2-arkadiusz.kubalewski@intel.com>
References: <20240808112013.166621-2-arkadiusz.kubalewski@intel.com>
TO: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
TO: netdev@vger.kernel.org
CC: vadim.fedorenko@linux.dev
CC: jiri@resnulli.us
CC: corbet@lwn.net
CC: davem@davemloft.net
CC: edumazet@google.com
CC: kuba@kernel.org
CC: pabeni@redhat.com
CC: donald.hunter@gmail.com
CC: anthony.l.nguyen@intel.com
CC: przemyslaw.kitszel@intel.com
CC: intel-wired-lan@lists.osuosl.org
CC: linux-doc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
CC: Aleksandr Loktionov <aleksandr.loktionov@intel.com>

Hi Arkadiusz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Arkadiusz-Kubalewski/dpll-add-Embedded-SYNC-feature-for-a-pin/20240808-193618
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240808112013.166621-2-arkadiusz.kubalewski%40intel.com
patch subject: [PATCH net-next v1 1/2] dpll: add Embedded SYNC feature for a pin
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: powerpc64-randconfig-r071-20240810 (https://download.01.org/0day-ci/archive/20240812/202408120042.oTNcxcHu-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408120042.oTNcxcHu-lkp@intel.com/

New smatch warnings:
drivers/dpll/dpll_netlink.c:848 dpll_pin_e_sync_set() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/dpll/dpll_netlink.c:631 dpll_pin_available() warn: iterator 'i' not incremented
drivers/dpll/dpll_netlink.c:776 dpll_pin_freq_set() warn: iterator 'i' not incremented
drivers/dpll/dpll_netlink.c:887 dpll_pin_on_pin_state_set() warn: iterator 'i' not incremented
drivers/dpll/dpll_netlink.c:1045 dpll_pin_phase_adj_set() warn: iterator 'i' not incremented
drivers/dpll/dpll_netlink.c:1187 dpll_pin_find() warn: iterator 'i' not incremented
drivers/dpll/dpll_netlink.c:1390 dpll_device_find() warn: iterator 'i' not incremented

vim +/i +848 drivers/dpll/dpll_netlink.c

9d71b54b65b1fb Vadim Fedorenko      2023-09-13  787  
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  788  static int
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  789  dpll_pin_e_sync_set(struct dpll_pin *pin, struct nlattr *a,
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  790  		    struct netlink_ext_ack *extack)
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  791  {
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  792  	u64 esync = nla_get_u64(a), old_esync;
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  793  	struct dpll_pin_ref *ref, *failed;
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  794  	enum dpll_pin_e_sync_pulse pulse;
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  795  	struct dpll_pin_frequency range;
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  796  	const struct dpll_pin_ops *ops;
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  797  	struct dpll_device *dpll;
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  798  	unsigned long i;
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  799  	int ret;
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  800  
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  801  	xa_for_each(&pin->dpll_refs, i, ref) {
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  802  		ops = dpll_pin_ops(ref);
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  803  		if (!ops->e_sync_set ||
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  804  		    !ops->e_sync_get) {
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  805  			NL_SET_ERR_MSG(extack,
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  806  				       "embedded sync feature is not supported by this device");
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  807  			return -EOPNOTSUPP;
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  808  		}
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  809  	}
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  810  	ref = dpll_xa_ref_dpll_first(&pin->dpll_refs);
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  811  	ops = dpll_pin_ops(ref);
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  812  	dpll = ref->dpll;
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  813  	ret = ops->e_sync_get(pin, dpll_pin_on_dpll_priv(dpll, pin), dpll,
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  814  			      dpll_priv(dpll), &old_esync, &range, &pulse, extack);
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  815  	if (ret) {
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  816  		NL_SET_ERR_MSG(extack, "unable to get current embedded sync frequency value");
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  817  		return ret;
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  818  	}
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  819  	if (esync == old_esync)
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  820  		return 0;
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  821  	if (esync > range.max || esync < range.min) {
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  822  		NL_SET_ERR_MSG_ATTR(extack, a,
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  823  				    "requested embedded sync frequency value is not supported by this device");
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  824  		return -EINVAL;
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  825  	}
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  826  
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  827  	xa_for_each(&pin->dpll_refs, i, ref) {
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  828  		void *pin_dpll_priv;
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  829  
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  830  		ops = dpll_pin_ops(ref);
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  831  		dpll = ref->dpll;
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  832  		pin_dpll_priv = dpll_pin_on_dpll_priv(dpll, pin);
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  833  		ret = ops->e_sync_set(pin, pin_dpll_priv, dpll, dpll_priv(dpll),
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  834  				      esync, extack);
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  835  		if (ret) {
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  836  			failed = ref;
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  837  			NL_SET_ERR_MSG_FMT(extack,
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  838  					   "embedded sync frequency set failed for dpll_id:%u",
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  839  					   dpll->id);
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  840  			goto rollback;
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  841  		}
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  842  	}
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  843  	__dpll_pin_change_ntf(pin);
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  844  
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  845  	return 0;
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  846  
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  847  rollback:
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08 @848  	xa_for_each(&pin->dpll_refs, i, ref) {
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  849  		void *pin_dpll_priv;
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  850  
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  851  		if (ref == failed)
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  852  			break;
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  853  		ops = dpll_pin_ops(ref);
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  854  		dpll = ref->dpll;
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  855  		pin_dpll_priv = dpll_pin_on_dpll_priv(dpll, pin);
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  856  		if (ops->e_sync_set(pin, pin_dpll_priv, dpll, dpll_priv(dpll),
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  857  				    old_esync, extack))
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  858  			NL_SET_ERR_MSG(extack, "set embedded sync frequency rollback failed");
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  859  	}
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  860  	return ret;
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  861  }
a728a5dbbaef46 Arkadiusz Kubalewski 2024-08-08  862  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
