Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853DF2E40D
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Apr 2024 18:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712859924; cv=none; b=fk+dsicBdqYNBroxrF+7g0gfY+ABzR+YZCYHK7wkV2fpGlITSgrPHkPlnqikrz0adcGL5t87VFwRmohrI9X0u5TeIC/oR6FEoU8jo4BXMBbF/Ljn6W7t48nqv+uDsucnXzjbAwgVW6hVWU6VKCCIYF1ugALHbbOtq+KYlRqZg9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712859924; c=relaxed/simple;
	bh=ZPtKGfwGvOs/qGxzO9eTMjFEPu1TnivJ6JVJDoIz8do=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fRPweVB0jj0NaoP0BqOZATWBEJ1Z1B9MRlPZRQRvxPw5zlVWK1YCaMOZB/s76ZPP1jbHyUcAOFS+27PBgSwo+Cyvl4Xj7DS4RLZIokl8wOmepBVhu7E7ASfP74YAg6cjl9Z1S5/PkLarAbQp0wrtX/a3KSs2Vi4evM42EjjF0A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QfeWGbI9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QfeWGbI9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712859922; x=1744395922;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZPtKGfwGvOs/qGxzO9eTMjFEPu1TnivJ6JVJDoIz8do=;
  b=QfeWGbI9/YFQDQNbCjp3DFwTkzclNpwBHl3rZiGaogCNobacSSvCHv9x
   5nKbN+ZykYlEA/zJhn/pXW5Et0Lfjm7xSUYvbUiL3J8i9URWJGhzGNPOc
   KYzcYk/o+YJUD+A7w2kyM24g3PuZ8f36B9uerA/0UX2aXdm7T+6Du0g2M
   fwp6DAK4fQhxsrEPogKrN4KuCN+M4dE50TL5olOGjOFN8iZvNd5ekh+3P
   NGiw9QL2tiHLlWKgyRRIEsBWG/maY0hzDGpMxqhs3ys9qezDlsBtqew2t
   Q1wVmzdmvOeY1TuvdKZyPLNaYedP0hh8DoYRN8zJS6ukz+pf72s1nnRqN
   Q==;
X-CSE-ConnectionGUID: wPGSlLZjQWS5BDaDQVZBwA==
X-CSE-MsgGUID: RaC2C8GhRdG2IIJqoR6L9A==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8154543"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8154543"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 11:25:22 -0700
X-CSE-ConnectionGUID: /IRr1oiIRAabf2XZ/gcfmg==
X-CSE-MsgGUID: k1kDrMs3RWCCkOGeeokzVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="25529240"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Apr 2024 11:25:21 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruz6s-0008sb-2s;
	Thu, 11 Apr 2024 18:25:18 +0000
Date: Fri, 12 Apr 2024 02:24:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [opencloudos:next 4787/4792]
 drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf.h: linux/sctp.h is included
 more than once.
Message-ID: <202404120217.hu9eX7F0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: jasperwang@tencent.com
TO: kaixuxia@tencent.com
TO: frankjpliu@tencent.com
TO: kasong@tencent.com
TO: sagazchen@tencent.com
TO: kernelxing@tencent.com
TO: aurelianliu@tencent.com
TO: jason.zeng@intel.com
TO: wu.zheng@intel.com
TO: yingbao.jia@intel.com
TO: pei.p.jia@intel.com

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   5a4887e84d1f38cdaa7d82d911ad735fb06009fe
commit: c783f7daed8739b9497e40656bc220d2d17c9c10 [4787/4792] drivers: add Chengdu BeiZhongWangXin Technology N5/N6 Series Network Card Driver
:::::: branch date: 8 hours ago
:::::: commit date: 10 hours ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404120217.hu9eX7F0-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf.h: linux/sctp.h is included more than once.
--
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c: linux/fs.h is included more than once.

vim +17 drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf.h

     6	
     7	#include <linux/module.h>
     8	#include <linux/pci.h>
     9	#include <linux/aer.h>
    10	#include <linux/netdevice.h>
    11	#include <linux/vmalloc.h>
    12	#include <linux/interrupt.h>
    13	#include <linux/ethtool.h>
    14	#include <linux/if_vlan.h>
    15	#include <linux/ip.h>
    16	#include <linux/tcp.h>
  > 17	#include <linux/sctp.h>
    18	#include <linux/ipv6.h>
    19	#include <linux/kernel.h>
    20	#include <linux/bitops.h>
    21	#include <linux/timer.h>
    22	#include <linux/workqueue.h>
    23	#include <linux/wait.h>
    24	#include <linux/delay.h>
    25	#include <linux/gfp.h>
    26	#include <linux/skbuff.h>
    27	#include <linux/dma-mapping.h>
    28	#include <linux/etherdevice.h>
    29	#include <linux/socket.h>
    30	#include <linux/jiffies.h>
    31	#include <net/ipv6.h>
    32	#include <net/ip6_checksum.h>
    33	#include <net/udp.h>
  > 34	#include <linux/sctp.h>
    35	#include <linux/pci_hotplug.h>
    36	#include <net/pkt_cls.h>
    37	#include <net/tc_act/tc_gact.h>
    38	#include <net/tc_act/tc_mirred.h>
    39	#include <linux/bitmap.h>
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
