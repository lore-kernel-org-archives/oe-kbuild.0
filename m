Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E0B2629D
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Mar 2025 19:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742153687; cv=none; b=dTkQbVLhQOyfe5OqZIZC2q9HuxdBy/Pf9FzV6wnK4CVvrAu1WWolSJ3foTKOft2TX5LdsbxJwecpmR51EBnInROvo3ED+8OjQiK+No7DOTdg/nGukeRqSY+h29N1sSQ3i9/6hvMdBh+K3TY6pcGqFkwVUUVcABGfkXukcFATHos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742153687; c=relaxed/simple;
	bh=aYBdW9ZSyOHNX8CjdTXkHvN+1oKH9yL307EgeuWDM8s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IUVrFvcTtqTYnyEwBdMu5/4IBjjetBfrkMK6NNpCcr07BPkndQ1mf6bUtyUmuYMt8kDTf+mD9pF+j3wt93oWt/0BEAqPxqJ0JrKI2MGG7xhdIS3H2iJ5cSfjkP2WJ5b+a0slRq8qM3zwDYTW3Cb/Fii1UFpTvu3B68QR+U6Xk3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eCEBKt2I; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eCEBKt2I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742153685; x=1773689685;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aYBdW9ZSyOHNX8CjdTXkHvN+1oKH9yL307EgeuWDM8s=;
  b=eCEBKt2I5KRLxYIVgdz23eDMN+0GwJ/PqC0KgQv8GIr2zHeajzBUyTgS
   75a/+T0TnwJ2DsnMw8gF0dGdLxO41t9o6HHGD42txSlqjQrGWZdvC5Qs3
   /QssEY/OtGNrYDTYlwYa9bWxwdfd6mT90ZmCIfjvdmj01J7CsJYjHApru
   B/ZOrDNw6kQALEbroPsMFgKL5UhC0VU9e0upM3/PZdklZjbmZx5QysNLj
   oDe8KzaXvOfDpXejwKZ6DVnApdcZkC+O4x+zxUwqCACz7mm76fkK2v0On
   0K4/gXy/aj7dtRSD81WjrnUF97MPuvvjThP6Iwo6Cya3ktXa9IjkUV/mf
   g==;
X-CSE-ConnectionGUID: fwwD0a1pRKqkH2AocaYcLg==
X-CSE-MsgGUID: +r9I+ov0QYikGpDuTs1//A==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="30829760"
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="30829760"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2025 12:34:44 -0700
X-CSE-ConnectionGUID: KeG5OZENQWCyz4x+Zdz7mw==
X-CSE-MsgGUID: ZAXw4hqMSEu6qGqc/2LvVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="121469511"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 16 Mar 2025 12:34:43 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tttkv-000CDP-0O;
	Sun, 16 Mar 2025 19:34:41 +0000
Date: Mon, 17 Mar 2025 03:34:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/5] power: supply: core: add function to get supplies
 from fwnode
Message-ID: <202503170343.AW93SIMu-lkp@intel.com>
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
In-Reply-To: <20250312-batt_ops-v1-2-88e0bb3129fd@google.com>
References: <20250312-batt_ops-v1-2-88e0bb3129fd@google.com>
TO: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Badhri Jagan Sridharan <badhri@google.com>
TO: Sebastian Reichel <sre@kernel.org>
TO: Heikki Krogerus <heikki.krogerus@linux.intel.com>
TO: "Rafael J. Wysocki" <rafael@kernel.org>
TO: Len Brown <len.brown@intel.com>
TO: Pavel Machek <pavel@kernel.org>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-usb@vger.kernel.org
CC: linux-pm@vger.kernel.org
CC: RD Babiera <rdbabiera@google.com>
CC: Kyle Tso <kyletso@google.com>
CC: Amit Sunil Dhamne <amitsd@google.com>

Hi Amit,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 80e54e84911a923c40d7bee33a34c1b4be148d7a]

url:    https://github.com/intel-lab-lkp/linux/commits/Amit-Sunil-Dhamne-via-B4-Relay/dt-bindings-connector-add-fixed-batteries-property/20250313-074635
base:   80e54e84911a923c40d7bee33a34c1b4be148d7a
patch link:    https://lore.kernel.org/r/20250312-batt_ops-v1-2-88e0bb3129fd%40google.com
patch subject: [PATCH 2/5] power: supply: core: add function to get supplies from fwnode
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: riscv-randconfig-r073-20250316 (https://download.01.org/0day-ci/archive/20250317/202503170343.AW93SIMu-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503170343.AW93SIMu-lkp@intel.com/

smatch warnings:
drivers/power/supply/power_supply_core.c:649 power_supply_get_by_fwnode_reference_array() error: uninitialized symbol 'ret'.

vim +/ret +649 drivers/power/supply/power_supply_core.c

0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  600  
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  601  /**
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  602   * power_supply_get_by_fwnode_reference_array() - Returns an array of power
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  603   * supply objects associated with each fwnode reference present in the property
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  604   * @fwnode: Pointer to fwnode to lookup property
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  605   * @property: Name of property holding references
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  606   * @psy: Resulting array of power_supply pointers. To be provided by the caller.
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  607   * @size: size of power_supply pointer array.
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  608   *
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  609   * If power supply was found, it increases reference count for the
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  610   * internal power supply's device. The user should power_supply_put()
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  611   * after usage.
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  612   *
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  613   * Return: On success returns the number of power supply objects filled
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  614   * in the @psy array.
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  615   * -EOVERFLOW when size of @psy array is not suffice.
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  616   * -EINVAL when @psy is NULL or @size is 0.
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  617   * -ENODATA when fwnode does not contain the given property
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  618   */
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  619  int power_supply_get_by_fwnode_reference_array(struct fwnode_handle *fwnode,
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  620  					       const char *property,
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  621  					       struct power_supply **psy,
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  622  					       ssize_t size)
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  623  {
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  624  	int ret, index, count = 0;
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  625  	struct fwnode_reference_args args;
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  626  	struct device *dev;
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  627  
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  628  	if (!psy || !size)
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  629  		return -EINVAL;
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  630  
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  631  	for (index = 0; index < size &&
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  632  	     !(ret = fwnode_property_get_reference_args(fwnode, property, NULL,
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  633  							0, index, &args));
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  634  	     ++index) {
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  635  		dev = class_find_device(&power_supply_class, NULL, args.fwnode,
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  636  					power_supply_match_fwnode);
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  637  		fwnode_handle_put(args.fwnode);
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  638  		if (!dev)
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  639  			continue;
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  640  
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  641  		if (count > size)
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  642  			return -EOVERFLOW;
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  643  
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  644  		psy[count] = dev_get_drvdata(dev);
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  645  		atomic_inc(&psy[count]->use_cnt);
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  646  		++count;
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  647  	}
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  648  
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12 @649  	if (ret != -ENOENT)
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  650  		return ret;
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  651  
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  652  	return index ? count : -ENODATA;
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  653  }
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  654  EXPORT_SYMBOL_GPL(power_supply_get_by_fwnode_reference_array);
0c8087f6d68b4cd Amit Sunil Dhamne 2025-03-12  655  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
