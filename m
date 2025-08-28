Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D55132C303
	for <oe-kbuild@lists.linux.dev>; Thu, 28 Aug 2025 16:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756400311; cv=none; b=UNrjbMxYBaacLWujBpqq5VkSqXv7Rbe1PBxyN5LC8WLwtAzv4uOemihSf86nRtAyX14J5vIf4cwTgRxlciIJBArt2rK0iGDInfteRaOOosS9G5BZqXXrBHtbswgJpNrEvrxmk3YxT7lVK5im/nHuDqeqXVuNQb0udzMRoa8DqOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756400311; c=relaxed/simple;
	bh=AnVmwkXssYwJVErYySy2sUXv0Y4DGZOSP556aXlr8X4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=elqRAxQX7ypGHsBco/OHRO661jwsWYdIFWC1TyH2F3q9g63smVNWJpiSC83ssffj1yX+oPdiGoGh58Uu5oIB0wCuBG0u3Hr108sI2eJ5WuuJQrvjIzADXwf5udyGruxEkBFYhO6Udv6cjECAHWhysO1GLAUQziWvDwORJziJ+L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kIi9RfN+; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kIi9RfN+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756400310; x=1787936310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AnVmwkXssYwJVErYySy2sUXv0Y4DGZOSP556aXlr8X4=;
  b=kIi9RfN+N63tBhNc776R6pK06inkROp8lrWLptwNk0ZNQi1/mpjTxLpY
   bhppC96SrslAGvQepR2vgyCjqd0QODBt1wv6Tu67s/ajlYg/XGqWychaz
   NcXMXd5ml8xmRgtu3dyJOgmdl5de5RymwpPOYT8DI89OF3lxlgOxLZ7gs
   YvSMy1QXbn1gsvKBbUnshGSfLSV9CZXJkpls988DuMzgzY3sQ9WlkgV+s
   U/bgnHWWzYna39B7UCSXBSmVwbprrqawLBv0TEMKizKhZK0yQUjHcn1qL
   pFHqct4Z4bzWZsu4lVziBIHLTWmpUnTrcoJFl3Oz77NhMfXez8DU7eOkQ
   Q==;
X-CSE-ConnectionGUID: VZ2OeRzPR2i0hqeXQt/0nw==
X-CSE-MsgGUID: S2CQhx3wStaTcBlroh+B6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="69384948"
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; 
   d="scan'208";a="69384948"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 09:58:27 -0700
X-CSE-ConnectionGUID: +YFMH1EIQJm00dFsmKzTCA==
X-CSE-MsgGUID: Ccpfofw7RKWdtk33/Y17mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; 
   d="scan'208";a="174330103"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 28 Aug 2025 09:58:25 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urfx8-000Tqh-1g;
	Thu, 28 Aug 2025 16:58:22 +0000
Date: Fri, 29 Aug 2025 00:58:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next 07/11] virtio_net: Use existing classifier if
 possible
Message-ID: <202508290032.pVQtEXz0-lkp@intel.com>
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
In-Reply-To: <20250827183852.2471-8-danielj@nvidia.com>
References: <20250827183852.2471-8-danielj@nvidia.com>
TO: Daniel Jurgens <danielj@nvidia.com>
TO: netdev@vger.kernel.org
TO: mst@redhat.com
TO: jasowang@redhat.com
TO: alex.williamson@redhat.com
TO: virtualization@lists.linux.dev
TO: pabeni@redhat.com
CC: parav@nvidia.com
CC: shshitrit@nvidia.com
CC: yohadt@nvidia.com
CC: Daniel Jurgens <danielj@nvidia.com>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Jurgens/virtio-pci-Expose-generic-device-capability-operations/20250828-024128
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250827183852.2471-8-danielj%40nvidia.com
patch subject: [PATCH net-next 07/11] virtio_net: Use existing classifier if possible
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: x86_64-randconfig-r073-20250828 (https://download.01.org/0day-ci/archive/20250829/202508290032.pVQtEXz0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508290032.pVQtEXz0-lkp@intel.com/

New smatch warnings:
drivers/net/virtio_net/virtio_net_ff.c:116 setup_classifier() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/net/virtio_net/virtio_net_ff.c:593 virtnet_ff_cleanup() warn: iterator 'i' not incremented

vim +/i +116 drivers/net/virtio_net/virtio_net_ff.c

3ba935ddde5a89 Daniel Jurgens 2025-08-27  108  
0dc1cf402026bb Daniel Jurgens 2025-08-27  109  static int setup_classifier(struct virtnet_ff *ff,
0dc1cf402026bb Daniel Jurgens 2025-08-27  110  			    struct virtnet_classifier **c)
3ba935ddde5a89 Daniel Jurgens 2025-08-27  111  {
0dc1cf402026bb Daniel Jurgens 2025-08-27  112  	struct virtnet_classifier *tmp;
0dc1cf402026bb Daniel Jurgens 2025-08-27  113  	unsigned long i;
3ba935ddde5a89 Daniel Jurgens 2025-08-27  114  	int err;
3ba935ddde5a89 Daniel Jurgens 2025-08-27  115  
0dc1cf402026bb Daniel Jurgens 2025-08-27 @116  	xa_for_each(&ff->classifiers, i, tmp) {
0dc1cf402026bb Daniel Jurgens 2025-08-27  117  		if ((*c)->size == tmp->size &&
0dc1cf402026bb Daniel Jurgens 2025-08-27  118  		    !memcmp(&tmp->classifier, &(*c)->classifier, tmp->size)) {
0dc1cf402026bb Daniel Jurgens 2025-08-27  119  			refcount_inc(&tmp->refcount);
0dc1cf402026bb Daniel Jurgens 2025-08-27  120  			kfree(*c);
0dc1cf402026bb Daniel Jurgens 2025-08-27  121  			*c = tmp;
0dc1cf402026bb Daniel Jurgens 2025-08-27  122  			goto out;
0dc1cf402026bb Daniel Jurgens 2025-08-27  123  		}
0dc1cf402026bb Daniel Jurgens 2025-08-27  124  	}
0dc1cf402026bb Daniel Jurgens 2025-08-27  125  
0dc1cf402026bb Daniel Jurgens 2025-08-27  126  	err = xa_alloc(&ff->classifiers, &(*c)->id, *c,
3ba935ddde5a89 Daniel Jurgens 2025-08-27  127  		       XA_LIMIT(0, ff->ff_caps->classifiers_limit - 1),
3ba935ddde5a89 Daniel Jurgens 2025-08-27  128  		       GFP_KERNEL);
3ba935ddde5a89 Daniel Jurgens 2025-08-27  129  	if (err)
3ba935ddde5a89 Daniel Jurgens 2025-08-27  130  		return err;
3ba935ddde5a89 Daniel Jurgens 2025-08-27  131  
3ba935ddde5a89 Daniel Jurgens 2025-08-27  132  	err = virtio_device_object_create(ff->vdev,
3ba935ddde5a89 Daniel Jurgens 2025-08-27  133  					  VIRTIO_NET_RESOURCE_OBJ_FF_CLASSIFIER,
0dc1cf402026bb Daniel Jurgens 2025-08-27  134  					  (*c)->id,
0dc1cf402026bb Daniel Jurgens 2025-08-27  135  					  &(*c)->classifier,
0dc1cf402026bb Daniel Jurgens 2025-08-27  136  					  (*c)->size);
3ba935ddde5a89 Daniel Jurgens 2025-08-27  137  	if (err)
3ba935ddde5a89 Daniel Jurgens 2025-08-27  138  		goto err_xarray;
3ba935ddde5a89 Daniel Jurgens 2025-08-27  139  
0dc1cf402026bb Daniel Jurgens 2025-08-27  140  	refcount_set(&(*c)->refcount, 1);
0dc1cf402026bb Daniel Jurgens 2025-08-27  141  out:
3ba935ddde5a89 Daniel Jurgens 2025-08-27  142  	return 0;
3ba935ddde5a89 Daniel Jurgens 2025-08-27  143  
3ba935ddde5a89 Daniel Jurgens 2025-08-27  144  err_xarray:
0dc1cf402026bb Daniel Jurgens 2025-08-27  145  	xa_erase(&ff->classifiers, (*c)->id);
3ba935ddde5a89 Daniel Jurgens 2025-08-27  146  
3ba935ddde5a89 Daniel Jurgens 2025-08-27  147  	return err;
3ba935ddde5a89 Daniel Jurgens 2025-08-27  148  }
3ba935ddde5a89 Daniel Jurgens 2025-08-27  149  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
