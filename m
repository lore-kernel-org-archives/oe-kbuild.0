Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3597D2BDC3F
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 23:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765583385; cv=none; b=UIUS5wWEEpvBB07vASgMzVGgA00/9Q5lQ54N0rbaglbrGjXtDbAPKWFe3eKq7DyRzQPGASAzXmKf3gDW/ksPT4Umuao1Ug7KEIdMZi0vKCRIQfSqIfkRe6ZCon8U7YGwTbQTTo5uswBMKrtX6jJw5xmVTZ9K6sYeEJ+6+TFttns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765583385; c=relaxed/simple;
	bh=EjAFz2Q+AnwcST6a9oR0brE/W3riRCIBSJgmsoV3apY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZG8lHXENaP7lxaI7YfHWsjfycHheyctjKAuEm2DCKpemMrnMs+R+Yt5iVXYx6u2Y1LyqkWSItKDwuMdi5HPkm+98KpTNhK+dUhm0iixkXE1Z+JUdKTB13IyrP6Vr46LOTRVCSqbOeiQfZgDq3meVlzvdVnUaTx2vUWI3Ejaoy9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PYIlCT8c; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PYIlCT8c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765583384; x=1797119384;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=EjAFz2Q+AnwcST6a9oR0brE/W3riRCIBSJgmsoV3apY=;
  b=PYIlCT8cM39rJ0hAxKFvVnDzSNIvPwkTuUxYMMsaKEmpVnvYIqKqmGxL
   DjN9OpNhGb2wFMuBJy+1sxJ6d6aoDiKVZ9E7UX6FpFMEmfgR7GZDtj8Yn
   p793G1TMKoYe7LG+svyV5cInACziKcsLKviKIcUDXEK6+sPEsAre65y/u
   8UChcbzHsN6lQ4c3O6bPQ+NegwdrXFcb7KpMWTTpWRLDHh3mMuwCo5SUs
   Z7k7TM+BM9x8TLA59KsniNToVMQycgyeESEc4kLbGZHJg6+TwRokpBJQ1
   6GwKaeg4uYZJnW4m7DUDm9DO1fUhfWh+HvYRm2UL7wo8Le+4/GhGVS/ZO
   w==;
X-CSE-ConnectionGUID: tFqtk39MQgqwqobdK/Q+0Q==
X-CSE-MsgGUID: 9JK1gqoQQ/6zikWQnMcNdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78706061"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="78706061"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 15:49:41 -0800
X-CSE-ConnectionGUID: sjn83XCyRM6VHSK+8J3njQ==
X-CSE-MsgGUID: MLcegOjWSi+GeC+F81JH6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="197108046"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Dec 2025 15:49:40 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUCtG-000000006n5-0hl5;
	Fri, 12 Dec 2025 23:49:38 +0000
Date: Sat, 13 Dec 2025 07:49:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/usb/typec/ucsi/ucsi.c:88 ucsi_sync_control_common() error:
 we previously assumed 'cci' could be null (see line 84)
Message-ID: <202512130701.vmqs7dci-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Dmitry Baryshkov <lumag@kernel.org>
CC: "Łukasz Bartosik" <ukaszb@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: 667ecac55861281c1f5e107c8550ae893b3984f6 usb: typec: ucsi: return CCI and message from sync_control callback
date:   10 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-161-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130701.vmqs7dci-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512130701.vmqs7dci-lkp@intel.com/

New smatch warnings:
drivers/usb/typec/ucsi/ucsi.c:88 ucsi_sync_control_common() error: we previously assumed 'cci' could be null (see line 84)

Old smatch warnings:
drivers/usb/typec/ucsi/ucsi.c:746 ucsi_get_pd_caps() warn: passing zero to 'ERR_PTR'
drivers/usb/typec/ucsi/ucsi.c:1456 ucsi_dr_swap() warn: missing error code 'ret'

vim +/cci +88 drivers/usb/typec/ucsi/ucsi.c

584e8df58942338 Dmitry Baryshkov 2024-06-27  57  
667ecac55861281 Dmitry Baryshkov 2025-01-20  58  int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci,
667ecac55861281 Dmitry Baryshkov 2025-01-20  59  			     void *data, size_t size)
584e8df58942338 Dmitry Baryshkov 2024-06-27  60  {
584e8df58942338 Dmitry Baryshkov 2024-06-27  61  	bool ack = UCSI_COMMAND(command) == UCSI_ACK_CC_CI;
584e8df58942338 Dmitry Baryshkov 2024-06-27  62  	int ret;
584e8df58942338 Dmitry Baryshkov 2024-06-27  63  
584e8df58942338 Dmitry Baryshkov 2024-06-27  64  	if (ack)
584e8df58942338 Dmitry Baryshkov 2024-06-27  65  		set_bit(ACK_PENDING, &ucsi->flags);
584e8df58942338 Dmitry Baryshkov 2024-06-27  66  	else
584e8df58942338 Dmitry Baryshkov 2024-06-27  67  		set_bit(COMMAND_PENDING, &ucsi->flags);
584e8df58942338 Dmitry Baryshkov 2024-06-27  68  
e37b383df91ba9b Łukasz Bartosik  2024-12-03  69  	reinit_completion(&ucsi->complete);
e37b383df91ba9b Łukasz Bartosik  2024-12-03  70  
584e8df58942338 Dmitry Baryshkov 2024-06-27  71  	ret = ucsi->ops->async_control(ucsi, command);
584e8df58942338 Dmitry Baryshkov 2024-06-27  72  	if (ret)
584e8df58942338 Dmitry Baryshkov 2024-06-27  73  		goto out_clear_bit;
584e8df58942338 Dmitry Baryshkov 2024-06-27  74  
584e8df58942338 Dmitry Baryshkov 2024-06-27  75  	if (!wait_for_completion_timeout(&ucsi->complete, 5 * HZ))
584e8df58942338 Dmitry Baryshkov 2024-06-27  76  		ret = -ETIMEDOUT;
584e8df58942338 Dmitry Baryshkov 2024-06-27  77  
584e8df58942338 Dmitry Baryshkov 2024-06-27  78  out_clear_bit:
584e8df58942338 Dmitry Baryshkov 2024-06-27  79  	if (ack)
584e8df58942338 Dmitry Baryshkov 2024-06-27  80  		clear_bit(ACK_PENDING, &ucsi->flags);
584e8df58942338 Dmitry Baryshkov 2024-06-27  81  	else
584e8df58942338 Dmitry Baryshkov 2024-06-27  82  		clear_bit(COMMAND_PENDING, &ucsi->flags);
584e8df58942338 Dmitry Baryshkov 2024-06-27  83  
667ecac55861281 Dmitry Baryshkov 2025-01-20 @84  	if (!ret && cci)
667ecac55861281 Dmitry Baryshkov 2025-01-20  85  		ret = ucsi->ops->read_cci(ucsi, cci);
667ecac55861281 Dmitry Baryshkov 2025-01-20  86  
667ecac55861281 Dmitry Baryshkov 2025-01-20  87  	if (!ret && data &&
667ecac55861281 Dmitry Baryshkov 2025-01-20 @88  	    (*cci & UCSI_CCI_COMMAND_COMPLETE))
667ecac55861281 Dmitry Baryshkov 2025-01-20  89  		ret = ucsi->ops->read_message_in(ucsi, data, size);
667ecac55861281 Dmitry Baryshkov 2025-01-20  90  
584e8df58942338 Dmitry Baryshkov 2024-06-27  91  	return ret;
584e8df58942338 Dmitry Baryshkov 2024-06-27  92  }
584e8df58942338 Dmitry Baryshkov 2024-06-27  93  EXPORT_SYMBOL_GPL(ucsi_sync_control_common);
584e8df58942338 Dmitry Baryshkov 2024-06-27  94  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
