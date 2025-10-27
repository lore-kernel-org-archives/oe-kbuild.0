Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682D8307ADE
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Oct 2025 14:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761574221; cv=none; b=GpSDYo6B7V0TKbS+lYt4gosQ+ACUuzz+SiuAmyWI1VaR9Dwa2WKZqvZbnvLCB50vVXXh52k+wpksIGhMXPZmDuaTHSwVu/QWyAbbrucMyDKlt7E9ooas8lOebYHH/buNRdfSwzSDUCw7orN4d920mTpOUJnWsk0ix823UJw/H70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761574221; c=relaxed/simple;
	bh=KceX0b8jy1+AMafA5W6fgm2Jf+j/Vfz2ylNpMO1/zOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZmGmtJg+5Cr3sEKvGP8C9T88Ggvnw+3CN6AUjXJe7QeZ09/XaKrazzz4mtVGs/Q8S/aUizsZnOdZBrUQvf90E1MLQbKzIti0qReXaEHbyR2cicD4FoGzpyelEhlGyniBpG9smyTDoPGDw8dZ7we+gcr3HfVRMIkQrdSpLeMycuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HVxZlsl9; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HVxZlsl9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761574219; x=1793110219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KceX0b8jy1+AMafA5W6fgm2Jf+j/Vfz2ylNpMO1/zOQ=;
  b=HVxZlsl92C1z2EsfPpFQGkR8PrPDsy8bmCuApVjrWLu1KAYjBLIBj0+b
   Rvq8wN+f8lWnA4TE5H4jFmGbvWW/Gqf1rzZwJ7H4F07RHYzc7fg+d9lki
   PHeZWkYHzbF4ptccFg1HS/PC+YvfvktkcKPAHvhQozv974H9BtYv3Q4d8
   p/H28IW2wMq0FCO6157S4SFU2zQX8D7izy+Xf0xqdYLg0GC3wSqkPPnia
   nM65iKrUssUxurArmt07goSizdV3ffY3ANftq9b1bglVb2cwuPI5xFRTe
   7CUM9qXChMmbz8u0Mx2aFilGsy+g+b9+sIRRG/usLo0JRD24VgtgyE/62
   A==;
X-CSE-ConnectionGUID: Q3e9+LKlSpuJdFem4kTjgw==
X-CSE-MsgGUID: NRtWnqZURyqvflXQXlNCSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74770619"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="74770619"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 07:10:18 -0700
X-CSE-ConnectionGUID: lRlG1BlITymeHwDoN2IjzA==
X-CSE-MsgGUID: iZERgUOtRyOaCGZPXJotQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="189364826"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 27 Oct 2025 07:10:16 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDNvK-000Grh-1R;
	Mon, 27 Oct 2025 14:10:14 +0000
Date: Mon, 27 Oct 2025 22:09:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] PM / devfreq: use _visible attribute to replace
 create/remove_sysfs_files()
Message-ID: <202510272106.x7zgW7pK-lkp@intel.com>
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
In-Reply-To: <20251025135238.3576861-1-zhangpengjie2@huawei.com>
References: <20251025135238.3576861-1-zhangpengjie2@huawei.com>
TO: Pengjie Zhang <zhangpengjie2@huawei.com>
TO: myungjoo.ham@samsung.com
TO: kyungmin.park@samsung.com
TO: cw00.choi@samsung.com
CC: linux-pm@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: zhanjie9@hisilicon.com
CC: zhenglifeng1@huawei.com
CC: lihuisong@huawei.com
CC: yubowen8@huawei.com
CC: linhongye@h-partners.com
CC: linuxarm@huawei.com
CC: jonathan.cameron@huawei.com
CC: zhangpengjie2@huawei.com

Hi Pengjie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on chanwoo/devfreq-testing]
[also build test WARNING on linus/master v6.18-rc3 next-20251027]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pengjie-Zhang/PM-devfreq-use-_visible-attribute-to-replace-create-remove_sysfs_files/20251025-215510
base:   https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git devfreq-testing
patch link:    https://lore.kernel.org/r/20251025135238.3576861-1-zhangpengjie2%40huawei.com
patch subject: [PATCH] PM / devfreq: use _visible attribute to replace create/remove_sysfs_files()
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: loongarch-randconfig-r072-20251026 (https://download.01.org/0day-ci/archive/20251027/202510272106.x7zgW7pK-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510272106.x7zgW7pK-lkp@intel.com/

smatch warnings:
drivers/devfreq/devfreq.c:1927 timer_store() warn: inconsistent returns 'global &devfreq_list_lock'.

vim +1927 drivers/devfreq/devfreq.c

4dc3bab8687f1e Chanwoo Choi  2020-07-02  1873  
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1874  static ssize_t timer_store(struct device *dev, struct device_attribute *attr,
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1875  			      const char *buf, size_t count)
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1876  {
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1877  	struct devfreq *df = to_devfreq(dev);
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1878  	char str_timer[DEVFREQ_NAME_LEN + 1];
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1879  	int timer = -1;
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1880  	int ret = 0, i;
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1881  
88ea5f098ddcf4 Pengjie Zhang 2025-10-25  1882  	mutex_lock(&devfreq_list_lock);
88ea5f098ddcf4 Pengjie Zhang 2025-10-25  1883  	if (!df->governor || !df->profile ||
88ea5f098ddcf4 Pengjie Zhang 2025-10-25  1884  	    !IS_SUPPORTED_ATTR(df->governor->attrs, TIMER)) {
88ea5f098ddcf4 Pengjie Zhang 2025-10-25  1885  		mutex_unlock(&devfreq_list_lock);
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1886  		return -EINVAL;
88ea5f098ddcf4 Pengjie Zhang 2025-10-25  1887  	}
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1888  
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1889  	ret = sscanf(buf, "%16s", str_timer);
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1890  	if (ret != 1)
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1891  		return -EINVAL;
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1892  
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1893  	for (i = 0; i < DEVFREQ_TIMER_NUM; i++) {
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1894  		if (!strncmp(timer_name[i], str_timer, DEVFREQ_NAME_LEN)) {
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1895  			timer = i;
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1896  			break;
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1897  		}
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1898  	}
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1899  
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1900  	if (timer < 0) {
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1901  		ret = -EINVAL;
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1902  		goto out;
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1903  	}
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1904  
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1905  	if (df->profile->timer == timer) {
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1906  		ret = 0;
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1907  		goto out;
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1908  	}
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1909  
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1910  	mutex_lock(&df->lock);
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1911  	df->profile->timer = timer;
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1912  	mutex_unlock(&df->lock);
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1913  
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1914  	ret = df->governor->event_handler(df, DEVFREQ_GOV_STOP, NULL);
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1915  	if (ret) {
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1916  		dev_warn(dev, "%s: Governor %s not stopped(%d)\n",
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1917  			 __func__, df->governor->name, ret);
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1918  		goto out;
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1919  	}
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1920  
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1921  	ret = df->governor->event_handler(df, DEVFREQ_GOV_START, NULL);
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1922  	if (ret)
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1923  		dev_warn(dev, "%s: Governor %s not started(%d)\n",
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1924  			 __func__, df->governor->name, ret);
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1925  out:
88ea5f098ddcf4 Pengjie Zhang 2025-10-25  1926  	mutex_unlock(&devfreq_list_lock);
4dc3bab8687f1e Chanwoo Choi  2020-07-02 @1927  	return ret ? ret : count;
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1928  }
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1929  static DEVICE_ATTR_RW(timer);
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1930  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
