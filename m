Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C0A221555
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Feb 2026 07:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769931528; cv=none; b=kHfz7xo+JTWtG3LowBtHHcLKy5P+bR7Q4TNEwr1Ux/WzhnYn0qgRylWbhBn6ZHWCmM6ph30gLvcTcBVQSmV25TA27V54jfO6av+gextkCIX/zFpehKzF10k+46PagMg4f8yHA6O5cXZtIYqOtSlYieiK/YBxcH0iOvmXVzWrZxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769931528; c=relaxed/simple;
	bh=SgUYR2+jKfVRwpS3q9F3QUsDt/GTdD36hRPfL8nhzmc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bR0Imn+xMceawKRHcv/OKgewqK3jc0g6fvYrSVoqrKo38fKPmBHaHHCd9XETbuNqM6nejoyn1u0u2N+94Of56SUhh/MHI6C1jmbbQShBoqnP+ddRlq45Hh7WIPNHl8HRJQmKSiGUQDlafvbTSBcN3gqPgxI6ZYRH/e3/76a4Nbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E8NVOO7X; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E8NVOO7X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769931526; x=1801467526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SgUYR2+jKfVRwpS3q9F3QUsDt/GTdD36hRPfL8nhzmc=;
  b=E8NVOO7XKBBI2aAtJyRg8CZvIQFRd4jDf/jUO6R1l9/rtQchGCQko3K0
   u/zNflNnkCWj8OsHyLRfO/tcNd3YkReBTEHXC+7CKbfMt/vJdjEZCPKc6
   eDonPNZLgDQdx8M2PEE0cGHWA6em1NmqmOvuY1f/4dOjXTnZzahbaHuQa
   d2t3fuRKuaJLcGHoPUULzbS6vip5FJjN/sSahBXX8z2wvLCN0mCmOq96K
   y5PiZZPXTf4NX6kZ6ivrfy50sdsmsDpMnRQojO45ftpnZpnFuzFfpVtDP
   hoExmbXRSZyHlTYxwY/hNFGwPWlpLXNqoF4o2ed0qvgXJMheaWCi/hEMP
   w==;
X-CSE-ConnectionGUID: 01NDj8QpR8iW9eb002CvMg==
X-CSE-MsgGUID: jNi7kAHMTgCuf5us+gxCUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="88698060"
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="88698060"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 23:38:46 -0800
X-CSE-ConnectionGUID: oEyqaezgTjqCzazY50O1kw==
X-CSE-MsgGUID: SL8jjrCeS7GVcMcSUzrh+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="209572945"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 31 Jan 2026 23:38:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmS2c-00000000ee4-00xD;
	Sun, 01 Feb 2026 07:38:42 +0000
Date: Sun, 1 Feb 2026 15:38:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH -next 1/3] cgroup/dmem: fix NULL pointer dereference when
 setting max
Message-ID: <202602011549.IiweIsR6-lkp@intel.com>
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
In-Reply-To: <20260131091202.344788-2-chenridong@huaweicloud.com>
References: <20260131091202.344788-2-chenridong@huaweicloud.com>
TO: Chen Ridong <chenridong@huaweicloud.com>
TO: dev@lankhorst.se
TO: mripard@kernel.org
TO: natalie.vock@gmx.de
TO: tj@kernel.org
TO: hannes@cmpxchg.org
TO: mkoutny@suse.com
CC: cgroups@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: linux-kernel@vger.kernel.org
CC: lujialin4@huawei.com
CC: chenridong@huaweicloud.com

Hi Chen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20260130]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Ridong/cgroup-dmem-fix-NULL-pointer-dereference-when-setting-max/20260131-173002
base:   next-20260130
patch link:    https://lore.kernel.org/r/20260131091202.344788-2-chenridong%40huaweicloud.com
patch subject: [PATCH -next 1/3] cgroup/dmem: fix NULL pointer dereference when setting max
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: x86_64-randconfig-161-20260201 (https://download.01.org/0day-ci/archive/20260201/202602011549.IiweIsR6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602011549.IiweIsR6-lkp@intel.com/

smatch warnings:
kernel/cgroup/dmem.c:703 dmemcg_limit_write() warn: variable dereferenced before check 'options' (see line 696)

vim +/options +703 kernel/cgroup/dmem.c

b168ed458ddecc Maarten Lankhorst 2024-12-04  674  
b168ed458ddecc Maarten Lankhorst 2024-12-04  675  static ssize_t dmemcg_limit_write(struct kernfs_open_file *of,
b168ed458ddecc Maarten Lankhorst 2024-12-04  676  				 char *buf, size_t nbytes, loff_t off,
b168ed458ddecc Maarten Lankhorst 2024-12-04  677  				 void (*apply)(struct dmem_cgroup_pool_state *, u64))
b168ed458ddecc Maarten Lankhorst 2024-12-04  678  {
b168ed458ddecc Maarten Lankhorst 2024-12-04  679  	struct dmemcg_state *dmemcs = css_to_dmemcs(of_css(of));
b168ed458ddecc Maarten Lankhorst 2024-12-04  680  	int err = 0;
b168ed458ddecc Maarten Lankhorst 2024-12-04  681  
b168ed458ddecc Maarten Lankhorst 2024-12-04  682  	while (buf && !err) {
b168ed458ddecc Maarten Lankhorst 2024-12-04  683  		struct dmem_cgroup_pool_state *pool = NULL;
b168ed458ddecc Maarten Lankhorst 2024-12-04  684  		char *options, *region_name;
b168ed458ddecc Maarten Lankhorst 2024-12-04  685  		struct dmem_cgroup_region *region;
b168ed458ddecc Maarten Lankhorst 2024-12-04  686  		u64 new_limit;
b168ed458ddecc Maarten Lankhorst 2024-12-04  687  
b168ed458ddecc Maarten Lankhorst 2024-12-04  688  		options = buf;
b168ed458ddecc Maarten Lankhorst 2024-12-04  689  		buf = strchr(buf, '\n');
b168ed458ddecc Maarten Lankhorst 2024-12-04  690  		if (buf)
b168ed458ddecc Maarten Lankhorst 2024-12-04  691  			*buf++ = '\0';
b168ed458ddecc Maarten Lankhorst 2024-12-04  692  
b168ed458ddecc Maarten Lankhorst 2024-12-04  693  		options = strstrip(options);
b168ed458ddecc Maarten Lankhorst 2024-12-04  694  
b168ed458ddecc Maarten Lankhorst 2024-12-04  695  		/* eat empty lines */
b168ed458ddecc Maarten Lankhorst 2024-12-04 @696  		if (!options[0])
b168ed458ddecc Maarten Lankhorst 2024-12-04  697  			continue;
b168ed458ddecc Maarten Lankhorst 2024-12-04  698  
b168ed458ddecc Maarten Lankhorst 2024-12-04  699  		region_name = strsep(&options, " \t");
b168ed458ddecc Maarten Lankhorst 2024-12-04  700  		if (!region_name[0])
b168ed458ddecc Maarten Lankhorst 2024-12-04  701  			continue;
b168ed458ddecc Maarten Lankhorst 2024-12-04  702  
7b9767ec21ff41 Chen Ridong       2026-01-31 @703  		if (!options || !*options) {
7b9767ec21ff41 Chen Ridong       2026-01-31  704  			err = -EINVAL;
7b9767ec21ff41 Chen Ridong       2026-01-31  705  			goto out_put;
7b9767ec21ff41 Chen Ridong       2026-01-31  706  		}
7b9767ec21ff41 Chen Ridong       2026-01-31  707  
b168ed458ddecc Maarten Lankhorst 2024-12-04  708  		rcu_read_lock();
b168ed458ddecc Maarten Lankhorst 2024-12-04  709  		region = dmemcg_get_region_by_name(region_name);
b168ed458ddecc Maarten Lankhorst 2024-12-04  710  		rcu_read_unlock();
b168ed458ddecc Maarten Lankhorst 2024-12-04  711  
b168ed458ddecc Maarten Lankhorst 2024-12-04  712  		if (!region)
b168ed458ddecc Maarten Lankhorst 2024-12-04  713  			return -EINVAL;
b168ed458ddecc Maarten Lankhorst 2024-12-04  714  
b168ed458ddecc Maarten Lankhorst 2024-12-04  715  		err = dmemcg_parse_limit(options, region, &new_limit);
b168ed458ddecc Maarten Lankhorst 2024-12-04  716  		if (err < 0)
b168ed458ddecc Maarten Lankhorst 2024-12-04  717  			goto out_put;
b168ed458ddecc Maarten Lankhorst 2024-12-04  718  
b168ed458ddecc Maarten Lankhorst 2024-12-04  719  		pool = get_cg_pool_unlocked(dmemcs, region);
b168ed458ddecc Maarten Lankhorst 2024-12-04  720  		if (IS_ERR(pool)) {
b168ed458ddecc Maarten Lankhorst 2024-12-04  721  			err = PTR_ERR(pool);
b168ed458ddecc Maarten Lankhorst 2024-12-04  722  			goto out_put;
b168ed458ddecc Maarten Lankhorst 2024-12-04  723  		}
b168ed458ddecc Maarten Lankhorst 2024-12-04  724  
b168ed458ddecc Maarten Lankhorst 2024-12-04  725  		/* And commit */
b168ed458ddecc Maarten Lankhorst 2024-12-04  726  		apply(pool, new_limit);
b168ed458ddecc Maarten Lankhorst 2024-12-04  727  
b168ed458ddecc Maarten Lankhorst 2024-12-04  728  out_put:
b168ed458ddecc Maarten Lankhorst 2024-12-04  729  		kref_put(&region->ref, dmemcg_free_region);
b168ed458ddecc Maarten Lankhorst 2024-12-04  730  	}
b168ed458ddecc Maarten Lankhorst 2024-12-04  731  
b168ed458ddecc Maarten Lankhorst 2024-12-04  732  
b168ed458ddecc Maarten Lankhorst 2024-12-04  733  	return err ?: nbytes;
b168ed458ddecc Maarten Lankhorst 2024-12-04  734  }
b168ed458ddecc Maarten Lankhorst 2024-12-04  735  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
