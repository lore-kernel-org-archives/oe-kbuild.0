Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB47A76410
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 03:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733716566; cv=none; b=lxs+6+3kzKPzNYwBxUOSOeZw6ABRD4r8keRrIxDYyK0zOvP68NmXtTxLy/fYsTfagVBk8L3Ie/h+Lhflunlj8SjlHuRa/UkCBwTrirGhjwYF491YH08HQmd49HAExXbb+1avVXYzIH9ZJCVhAYFsbfMpMs4+lSDRjVgx7ERH65Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733716566; c=relaxed/simple;
	bh=0/19eRdru0ZQrs2mMGLSt5hvUNlPZesZfnUiFKdk/c8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yi/gIOcyQcQrx6jsi8JDjVEfxBmCbElxCKE64TAhzN426vdzBQIXpjCrxBq0GLH5E8XH1X5Bb/iJzl5t4CEnhT34boYmCQxdToLPXbLr4chSIxS2K8MpAGzxfXiuj/o+fmdUzn420YGTMzjuK2pYmZr/vycyh2Op87r0E1hq/2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XEamw6Ed; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XEamw6Ed"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733716565; x=1765252565;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0/19eRdru0ZQrs2mMGLSt5hvUNlPZesZfnUiFKdk/c8=;
  b=XEamw6EdLvNUWP9sKuOBQUz1lbk3KoxF9Q7AB2NwuSxegB+buW2e5OW+
   n0L2/Wmpw3YRHBz7BeFJgRBjt48xQHtkdL1q78RbJLvtakUDv5QoNprOt
   t7d1CaGjlp2t+eFg3hmjgRW6HnbKYVAFwZpsd1wRqQzMc7SvDR2uzo7i/
   QGFz+6CYePrU/c+NfGG18iqScW5/9+DNj4QJFkuzbCJZv+6XPH7i+mf90
   8N3cgvdXIH/+x48LBpth2O/NpoEQcCXnnjVj4cxwLpwIyjJSNl9QDYTgh
   jdEXJYquo75hnwPAvPRD1GYaEpH20Uty6dWlwcBGNHl7yQunihAuFTziT
   Q==;
X-CSE-ConnectionGUID: FvgjbC+6QZOQqbSJnqL12w==
X-CSE-MsgGUID: ZIYu02EUQxKVTV/145yA8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33889955"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="33889955"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 19:56:05 -0800
X-CSE-ConnectionGUID: Www2lysDSuS+lUtKDFZQgw==
X-CSE-MsgGUID: SKkCn2ShRWCYzxy7FN9hDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95297801"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Dec 2024 19:56:03 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKUsK-0003lW-3B;
	Mon, 09 Dec 2024 03:56:00 +0000
Date: Mon, 9 Dec 2024 11:55:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/mellanox/mlx5/core/lib/devcom.c:366
 mlx5_devcom_get_next_peer_data() error: uninitialized symbol 'data'.
Message-ID: <202412070931.gIXUE178-lkp@intel.com>
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
TO: Wei Yang <richard.weiyang@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f3ddc438a29f78f0642bfcf84407c236a0b2bdc7
commit: 2932fb0a927d30690b8cb70c71d511fd9054bb61 list: leverage list_is_head() for list_entry_is_head()
date:   10 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 10 months ago
config: openrisc-randconfig-r072-20241206 (https://download.01.org/0day-ci/archive/20241207/202412070931.gIXUE178-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412070931.gIXUE178-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/lib/devcom.c:366 mlx5_devcom_get_next_peer_data() error: uninitialized symbol 'data'.
drivers/net/ethernet/mellanox/mlx5/core/lib/devcom.c:395 mlx5_devcom_get_next_peer_data_rcu() error: uninitialized symbol 'data'.

vim +/data +366 drivers/net/ethernet/mellanox/mlx5/core/lib/devcom.c

691c041bf20899f Vlad Buslov    2023-03-31  344  
88d162b479815f5 Roi Dayan      2023-05-04  345  void *mlx5_devcom_get_next_peer_data(struct mlx5_devcom_comp_dev *devcom,
88d162b479815f5 Roi Dayan      2023-05-04  346  				     struct mlx5_devcom_comp_dev **pos)
691c041bf20899f Vlad Buslov    2023-03-31  347  {
88d162b479815f5 Roi Dayan      2023-05-04  348  	struct mlx5_devcom_comp *comp = devcom->comp;
88d162b479815f5 Roi Dayan      2023-05-04  349  	struct mlx5_devcom_comp_dev *tmp;
88d162b479815f5 Roi Dayan      2023-05-04  350  	void *data;
691c041bf20899f Vlad Buslov    2023-03-31  351  
88d162b479815f5 Roi Dayan      2023-05-04  352  	tmp = list_prepare_entry(*pos, &comp->comp_dev_list_head, list);
691c041bf20899f Vlad Buslov    2023-03-31  353  
88d162b479815f5 Roi Dayan      2023-05-04  354  	list_for_each_entry_continue(tmp, &comp->comp_dev_list_head, list) {
88d162b479815f5 Roi Dayan      2023-05-04  355  		if (tmp != devcom) {
88d162b479815f5 Roi Dayan      2023-05-04  356  			data = rcu_dereference_protected(tmp->data, lockdep_is_held(&comp->sem));
88d162b479815f5 Roi Dayan      2023-05-04  357  			if (data)
691c041bf20899f Vlad Buslov    2023-03-31  358  				break;
90ca127c62e9963 Saeed Mahameed 2023-06-02  359  		}
90ca127c62e9963 Saeed Mahameed 2023-06-02  360  	}
90ca127c62e9963 Saeed Mahameed 2023-06-02  361  
88d162b479815f5 Roi Dayan      2023-05-04  362  	if (list_entry_is_head(tmp, &comp->comp_dev_list_head, list))
90ca127c62e9963 Saeed Mahameed 2023-06-02  363  		return NULL;
90ca127c62e9963 Saeed Mahameed 2023-06-02  364  
88d162b479815f5 Roi Dayan      2023-05-04  365  	*pos = tmp;
88d162b479815f5 Roi Dayan      2023-05-04 @366  	return data;
90ca127c62e9963 Saeed Mahameed 2023-06-02  367  }
90ca127c62e9963 Saeed Mahameed 2023-06-02  368  
88d162b479815f5 Roi Dayan      2023-05-04  369  void *mlx5_devcom_get_next_peer_data_rcu(struct mlx5_devcom_comp_dev *devcom,
88d162b479815f5 Roi Dayan      2023-05-04  370  					 struct mlx5_devcom_comp_dev **pos)
90ca127c62e9963 Saeed Mahameed 2023-06-02  371  {
88d162b479815f5 Roi Dayan      2023-05-04  372  	struct mlx5_devcom_comp *comp = devcom->comp;
88d162b479815f5 Roi Dayan      2023-05-04  373  	struct mlx5_devcom_comp_dev *tmp;
88d162b479815f5 Roi Dayan      2023-05-04  374  	void *data;
691c041bf20899f Vlad Buslov    2023-03-31  375  
88d162b479815f5 Roi Dayan      2023-05-04  376  	tmp = list_prepare_entry(*pos, &comp->comp_dev_list_head, list);
90ca127c62e9963 Saeed Mahameed 2023-06-02  377  
88d162b479815f5 Roi Dayan      2023-05-04  378  	list_for_each_entry_continue(tmp, &comp->comp_dev_list_head, list) {
88d162b479815f5 Roi Dayan      2023-05-04  379  		if (tmp != devcom) {
691c041bf20899f Vlad Buslov    2023-03-31  380  			/* This can change concurrently, however 'data' pointer will remain
691c041bf20899f Vlad Buslov    2023-03-31  381  			 * valid for the duration of RCU read section.
691c041bf20899f Vlad Buslov    2023-03-31  382  			 */
e67f928a5204cc5 Shay Drory     2023-02-07  383  			if (!READ_ONCE(comp->ready))
691c041bf20899f Vlad Buslov    2023-03-31  384  				return NULL;
88d162b479815f5 Roi Dayan      2023-05-04  385  			data = rcu_dereference(tmp->data);
88d162b479815f5 Roi Dayan      2023-05-04  386  			if (data)
90ca127c62e9963 Saeed Mahameed 2023-06-02  387  				break;
90ca127c62e9963 Saeed Mahameed 2023-06-02  388  		}
fadd59fc50d0101 Aviv Heller    2018-12-04  389  	}
fadd59fc50d0101 Aviv Heller    2018-12-04  390  
88d162b479815f5 Roi Dayan      2023-05-04  391  	if (list_entry_is_head(tmp, &comp->comp_dev_list_head, list))
90ca127c62e9963 Saeed Mahameed 2023-06-02  392  		return NULL;
fadd59fc50d0101 Aviv Heller    2018-12-04  393  
88d162b479815f5 Roi Dayan      2023-05-04  394  	*pos = tmp;
88d162b479815f5 Roi Dayan      2023-05-04 @395  	return data;
fadd59fc50d0101 Aviv Heller    2018-12-04  396  }
e534552c92a4469 Shay Drory     2023-10-12  397  

:::::: The code at line 366 was first introduced by commit
:::::: 88d162b479815f5d6b6a4ff5fdb07aec9dc6280c net/mlx5: Devcom, Infrastructure changes

:::::: TO: Roi Dayan <roid@nvidia.com>
:::::: CC: Saeed Mahameed <saeedm@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
