Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E172586CC
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Feb 2025 16:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739206191; cv=none; b=I0OsRNQoskyanBy4z9tAGVaFav71jAlmy/6dRC3VgZMV/aOLdioi3nPZHN5Rrz/sxmCQG1VeBH7p3KNa3v32J4peIFYq0qTPzLcGoV7Xtb86lLl6TFmHpVLeOUfvm6DwobDI9mQ40tCtV0x2/MQk5RUYtdPWyhV2Do6YNG8FXW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739206191; c=relaxed/simple;
	bh=RYFrEhY0IROHvlpYavJHxt7hk8WpQc3yDBT7OPDfwy8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H6EggF8Cy48/Hoos2pf/DEsb3DV9vv3gnHw0zvm0K+vos1DAjOhQ7Y4WZZpA8kbbSYcvBpTP+y+wDJwk95RTe/ULm5w5I4ilEZjIyDFUcNouH8rlbnEu2PlCSfDGf5tFNVXwrXqg0rxLhyjyR9tTWYXnFvWolpiDa9X3Ir3srL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FtIKfWi0; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FtIKfWi0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739206189; x=1770742189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RYFrEhY0IROHvlpYavJHxt7hk8WpQc3yDBT7OPDfwy8=;
  b=FtIKfWi043XYohndt31qUhHcd2QXQoa01eZqPFbB+5Zeewgxnp/Y7stG
   q5B8V8T9y9u6PPZrBYktjlxOZaySzqr2RfxXV+bkqf3UQAL58s7JukR19
   IxVUffIcFBcr3KWKMFMBZiBqW+lohZm0nIYnCqPq/CYB2N/Sekmf5ALgV
   0Sw/gaSAVjvOow4w+cyDBTRcrQ8sTGYFCiDx5GbWMXfuzK8UqXZUyHnaD
   9BBR7dQjJoIQIbthDcywD9+QGUfwoKJBM8I409Dc8gsgeSwoAxzM+M7+c
   IOb+jlH8/N26rIovlV1WrrRajDqUU8kDFze1j8xPI1Jk9Wp8I4b4p83/A
   w==;
X-CSE-ConnectionGUID: Fb9effLNSzewlViWaCVKFA==
X-CSE-MsgGUID: H/sS4EBfTH6XNJP4Wf6SvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39484042"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="39484042"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 08:49:48 -0800
X-CSE-ConnectionGUID: jYzNctw1SyecAKKKMoRHqQ==
X-CSE-MsgGUID: bkZmKgouQUuh/2PyFqF6oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="143114092"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Feb 2025 08:49:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thWye-00134x-0H;
	Mon, 10 Feb 2025 16:49:44 +0000
Date: Tue, 11 Feb 2025 00:48:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v2 13/18] cxl/region: Add function to find a port's
 switch decoder by range
Message-ID: <202502110032.Tt58A4ik-lkp@intel.com>
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
In-Reply-To: <20250207153753.418849-14-rrichter@amd.com>
References: <20250207153753.418849-14-rrichter@amd.com>
TO: Robert Richter <rrichter@amd.com>
TO: Alison Schofield <alison.schofield@intel.com>
TO: Vishal Verma <vishal.l.verma@intel.com>
TO: Ira Weiny <ira.weiny@intel.com>
TO: Dan Williams <dan.j.williams@intel.com>
TO: Jonathan Cameron <Jonathan.Cameron@huawei.com>
TO: Dave Jiang <dave.jiang@intel.com>
TO: Davidlohr Bueso <dave@stgolabs.net>
CC: linux-cxl@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Gregory Price <gourry@gourry.net>
CC: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
CC: Terry Bowman <terry.bowman@amd.com>
CC: Robert Richter <rrichter@amd.com>

Hi Robert,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 5585e342e8d38cc598279bdb87f235f8b954dd5a]

url:    https://github.com/intel-lab-lkp/linux/commits/Robert-Richter/cxl-Remove-else-after-return/20250207-234420
base:   5585e342e8d38cc598279bdb87f235f8b954dd5a
patch link:    https://lore.kernel.org/r/20250207153753.418849-14-rrichter%40amd.com
patch subject: [PATCH v2 13/18] cxl/region: Add function to find a port's switch decoder by range
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-102-20250210 (https://download.01.org/0day-ci/archive/20250211/202502110032.Tt58A4ik-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202502110032.Tt58A4ik-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/cxl/core/region.c:3241:42-45: ERROR: cxld is NULL but dereferenced.
   drivers/cxl/core/region.c:3242:9-18: ERROR: cxld is NULL but dereferenced.
   drivers/cxl/core/region.c:3242:32-41: ERROR: cxld is NULL but dereferenced.

vim +3241 drivers/cxl/core/region.c

f99413f1e5779b Robert Richter 2025-02-07  3222  
47da10f758ff50 Robert Richter 2025-02-07  3223  static struct cxl_root_decoder *
47da10f758ff50 Robert Richter 2025-02-07  3224  cxl_find_root_decoder(struct cxl_endpoint_decoder *cxled)
47da10f758ff50 Robert Richter 2025-02-07  3225  {
47da10f758ff50 Robert Richter 2025-02-07  3226  	struct cxl_memdev *cxlmd = cxled_to_memdev(cxled);
acf31aa5d4914a Robert Richter 2025-02-07  3227  	struct cxl_port *iter = cxled_to_port(cxled);
47da10f758ff50 Robert Richter 2025-02-07  3228  	struct cxl_decoder *cxld = &cxled->cxld;
47da10f758ff50 Robert Richter 2025-02-07  3229  	struct range *hpa = &cxld->hpa_range;
47da10f758ff50 Robert Richter 2025-02-07  3230  
acf31aa5d4914a Robert Richter 2025-02-07  3231  	while (iter && !is_cxl_root(iter))
acf31aa5d4914a Robert Richter 2025-02-07  3232  		iter = to_cxl_port(iter->dev.parent);
acf31aa5d4914a Robert Richter 2025-02-07  3233  
acf31aa5d4914a Robert Richter 2025-02-07  3234  	if (!iter)
acf31aa5d4914a Robert Richter 2025-02-07  3235  		return NULL;
acf31aa5d4914a Robert Richter 2025-02-07  3236  
f99413f1e5779b Robert Richter 2025-02-07  3237  	cxld = cxl_port_find_switch_decoder(iter, hpa);
f99413f1e5779b Robert Richter 2025-02-07  3238  	if (!cxld) {
47da10f758ff50 Robert Richter 2025-02-07  3239  		dev_err(cxlmd->dev.parent,
47da10f758ff50 Robert Richter 2025-02-07  3240  			"%s:%s no CXL window for range %#llx:%#llx\n",
47da10f758ff50 Robert Richter 2025-02-07 @3241  			dev_name(&cxlmd->dev), dev_name(&cxld->dev),
47da10f758ff50 Robert Richter 2025-02-07  3242  			cxld->hpa_range.start, cxld->hpa_range.end);
47da10f758ff50 Robert Richter 2025-02-07  3243  		return NULL;
47da10f758ff50 Robert Richter 2025-02-07  3244  	}
47da10f758ff50 Robert Richter 2025-02-07  3245  
47da10f758ff50 Robert Richter 2025-02-07  3246  
f99413f1e5779b Robert Richter 2025-02-07  3247  
f99413f1e5779b Robert Richter 2025-02-07  3248  	return to_cxl_root_decoder(&cxld->dev);
47da10f758ff50 Robert Richter 2025-02-07  3249  }
47da10f758ff50 Robert Richter 2025-02-07  3250  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
