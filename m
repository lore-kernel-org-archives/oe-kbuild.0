Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF2E28EC
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Jan 2024 00:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706315213; cv=none; b=FBx2xuEMy91SowZjPPUAYb3mI+9w22PvCC8sBFLi1j3bRKbaFKgVqbsI4vhlJhr/MAl8P7w6n3W+o1eeVS+E5FCdKnHGL6pfOA/pAEhpnnkFLY50j5iCcx8rpfeOH8Tyj/fvlpXkfZ8ZF7kSFNQiBrVxPPyBL4a2hqZdTM/F3Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706315213; c=relaxed/simple;
	bh=LiH3PiUgYmVaAzNbyADmpCCz2LvhlSZW6npjkbedC04=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i01dn2D2Uw02bdvPQ4upv9S6QTrlkTsIOBI/z3e5mx2+pWt8IdR2WcV+1O9c4Rw9lfHlQ/RMopPp7v+BOJWYKb2V2HVsFBOEphrA3CqedzfwKbfKLZsUoXoVkaNRp9Aaakp9LLPcjTrwE67rlhE+m1SsTlrwHMiYxZlNUn/1zG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YO2ldrG9; arc=none smtp.client-ip=192.55.52.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YO2ldrG9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706315211; x=1737851211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LiH3PiUgYmVaAzNbyADmpCCz2LvhlSZW6npjkbedC04=;
  b=YO2ldrG9J/GVjawR03M7Ge1kKnxWKhPKKCTIK9RVYIZBsudw/qVwV+uW
   wUDQbhFAtshl40nG2lMbRXXOra7alAuhI/Y89CcNlN9IEh6RGmJ5FeKzm
   0qqW+PGAt6tNyQLUSt24SiSKccnFDX5GxRVSmplAASTUtbPK/YHYScM3m
   jA00Em+Zq1EgHBx+cSnRdzpnaEh3P28FwRXXERn/fUf8LczQFyhb4BtYM
   926fyDBGULJk+SDpmQ5TjyD67HNBcaO5dOFYIe7uGXt0VZZz/EdmgKiJo
   t+9xbPkb0qU7bkAlZdmZP3fdDEjIwuZ4tJYLzepWUGBRuPZi7dTcE6ouI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="402265065"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="402265065"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 16:26:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="857546762"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="857546762"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 26 Jan 2024 16:26:50 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTWX1-0001UA-2n;
	Sat, 27 Jan 2024 00:26:47 +0000
Date: Sat, 27 Jan 2024 08:25:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/scsi/esp_scsi.c:(.text.esp_setsync+0x198): undefined
 reference to `spi_display_xfer_agreement'
Message-ID: <202401270850.gRZMH8Kj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only scripts/Makefile.* file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Nick Desaulniers <ndesaulniers@google.com>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ecb1b8288dc7ccbdcb3b9df005fa1c0e0c0388a7
commit: 61f2b7c7497ba96cdde5bbaeb9e07f4c48f41f97 Makefile.debug: set -g unconditional on CONFIG_DEBUG_INFO_SPLIT
date:   1 year, 4 months ago
:::::: branch date: 29 hours ago
:::::: commit date: 1 year, 4 months ago
config: mips-randconfig-r005-20220616 (https://download.01.org/0day-ci/archive/20240127/202401270850.gRZMH8Kj-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240127/202401270850.gRZMH8Kj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401270850.gRZMH8Kj-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips64-linux-ld: drivers/scsi/esp_scsi.o: in function `esp_setsync':
>> drivers/scsi/esp_scsi.c:(.text.esp_setsync+0x198): undefined reference to `spi_display_xfer_agreement'
   mips64-linux-ld: drivers/scsi/esp_scsi.o: in function `esp_msgin_extended':
>> drivers/scsi/esp_scsi.c:(.text.esp_msgin_extended+0x120): undefined reference to `spi_populate_sync_msg'
>> mips64-linux-ld: drivers/scsi/esp_scsi.c:(.text.esp_msgin_extended+0x2f4): undefined reference to `spi_populate_sync_msg'
   mips64-linux-ld: drivers/scsi/esp_scsi.o: in function `scsi_esp_register':
>> drivers/scsi/esp_scsi.c:(.text.scsi_esp_register+0x2ac): undefined reference to `scsi_add_host_with_dma'
>> mips64-linux-ld: drivers/scsi/esp_scsi.c:(.text.scsi_esp_register+0x2d0): undefined reference to `scsi_scan_host'
   mips64-linux-ld: drivers/scsi/esp_scsi.o: in function `scsi_esp_unregister':
>> drivers/scsi/esp_scsi.c:(.text.scsi_esp_unregister+0x2c): undefined reference to `scsi_remove_host'
   mips64-linux-ld: drivers/scsi/esp_scsi.o: in function `dev_to_shost':
>> drivers/scsi/esp_scsi.c:(.text.dev_to_shost+0x18): undefined reference to `scsi_is_host_device'
   mips64-linux-ld: drivers/scsi/esp_scsi.o: in function `esp_slave_configure':
>> drivers/scsi/esp_scsi.c:(.text.esp_slave_configure+0x4c): undefined reference to `scsi_change_queue_depth'
>> mips64-linux-ld: drivers/scsi/esp_scsi.c:(.text.esp_slave_configure+0x90): undefined reference to `spi_dv_device'
   mips64-linux-ld: drivers/scsi/esp_scsi.o: in function `esp_init':
>> drivers/scsi/esp_scsi.c:(.init.text+0x24): undefined reference to `spi_attach_transport'
   mips64-linux-ld: drivers/scsi/esp_scsi.o: in function `esp_data_bytes_sent':
>> drivers/scsi/esp_scsi.c:(.text.esp_data_bytes_sent+0x284): undefined reference to `scsi_kmap_atomic_sg'
>> mips64-linux-ld: drivers/scsi/esp_scsi.c:(.text.esp_data_bytes_sent+0x2a8): undefined reference to `scsi_kunmap_atomic_sg'
   mips64-linux-ld: drivers/scsi/esp_scsi.o: in function `esp_unmap_dma.isra.0':
>> drivers/scsi/esp_scsi.c:(.text.esp_unmap_dma.isra.0+0x3c): undefined reference to `scsi_dma_unmap'
   mips64-linux-ld: drivers/scsi/esp_scsi.o: in function `esp_reset_cleanup':
>> drivers/scsi/esp_scsi.c:(.text.esp_reset_cleanup+0xe8): undefined reference to `__starget_for_each_device'
>> mips64-linux-ld: drivers/scsi/esp_scsi.c:(.text.esp_reset_cleanup+0x158): undefined reference to `scsi_done'
   mips64-linux-ld: drivers/scsi/esp_scsi.c:(.text.esp_reset_cleanup+0x1ec): undefined reference to `scsi_done'
   mips64-linux-ld: drivers/scsi/esp_scsi.o: in function `esp_eh_abort_handler':
>> drivers/scsi/esp_scsi.c:(.text.esp_eh_abort_handler+0x190): undefined reference to `scsi_done'
   mips64-linux-ld: drivers/scsi/esp_scsi.o: in function `esp_reconnect':
>> drivers/scsi/esp_scsi.c:(.text.esp_reconnect+0xe4): undefined reference to `__scsi_device_lookup_by_target'
   mips64-linux-ld: drivers/scsi/esp_scsi.o: in function `esp_msgin_process':
>> drivers/scsi/esp_scsi.c:(.text.esp_msgin_process+0x290): undefined reference to `spi_populate_sync_msg'
   mips64-linux-ld: drivers/scsi/esp_scsi.o: in function `esp_maybe_execute_command.part.0':
>> drivers/scsi/esp_scsi.c:(.text.esp_maybe_execute_command.part.0+0xd4): undefined reference to `spi_populate_tag_msg'
>> mips64-linux-ld: drivers/scsi/esp_scsi.c:(.text.esp_maybe_execute_command.part.0+0x638): undefined reference to `scsi_dma_map'
   mips64-linux-ld: drivers/scsi/esp_scsi.c:(.text.esp_maybe_execute_command.part.0+0x6c4): undefined reference to `spi_populate_width_msg'
   mips64-linux-ld: drivers/scsi/esp_scsi.c:(.text.esp_maybe_execute_command.part.0+0x728): undefined reference to `spi_populate_sync_msg'
   mips64-linux-ld: drivers/scsi/esp_scsi.o: in function `esp_cmd_is_done':
   drivers/scsi/esp_scsi.c:(.text.esp_cmd_is_done+0x178): undefined reference to `scsi_done'
   mips64-linux-ld: drivers/scsi/esp_scsi.o: in function `esp_process_event':
   drivers/scsi/esp_scsi.c:(.text.esp_process_event+0x884): undefined reference to `scsi_track_queue_full'
   mips64-linux-ld: drivers/scsi/jazz_esp.o: in function `esp_jazz_probe':
   drivers/scsi/jazz_esp.c:(.text.esp_jazz_probe+0x34): undefined reference to `scsi_host_alloc'
   mips64-linux-ld: drivers/scsi/jazz_esp.c:(.text.esp_jazz_probe+0x94): undefined reference to `scsi_host_put'
   mips64-linux-ld: drivers/scsi/jazz_esp.o: in function `esp_jazz_remove':
   drivers/scsi/jazz_esp.c:(.text.esp_jazz_remove+0x5c): undefined reference to `scsi_host_put'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
