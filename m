Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF3C4C98
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 08:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765615944; cv=none; b=PsNsoiIqLgrbQUFod7hq5/AzA3rzAJkOdWXrEWRydxNmkixsVrh1RoNC2IJxuXHHL9Z1WnGd7fojrnQdujaYpH5mAgBeSn/9JMVxghhYkPm0rD7uik82+vmk7KcuL2rttRa8s0qYRX1LWsw4djYRRrrWaWqwBphDV/eDwFLxhsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765615944; c=relaxed/simple;
	bh=uePXPB5qkBHpoomJUJFk2SoUE+yOAV7CEC2cHoyJhnM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LBz/89+J3ZyAufWDudDQ7on+iVMFXeKGHr4NSWSFNZc/1SBf+PcNgua5PBsKdJFtUdGLq/63OcIUgqrVg7Bsi7r+ksJSE9odzVFIEWOrQYTMx0L6ScWe5t+PND4Q/QILoEl0M5lDGIgenrCaPufo7SkgyIw5fdfBAiX7kD+YsyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hONW9Vnw; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hONW9Vnw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765615944; x=1797151944;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uePXPB5qkBHpoomJUJFk2SoUE+yOAV7CEC2cHoyJhnM=;
  b=hONW9VnwVjTKCbBQYeHLfIewcPQ8v3OsUhzcko29nOVbQhge7DWEUWgq
   ZvPP8N3hfEOX4KV2I+AwpedA9Tk7aTqE4N57POh/FC/ilYgzO8NgrS0oz
   tpyvct104cyzUu4OXOGMwa5RQNQAOgC8hKI8hV1Nqm10manjiZD4kAB70
   K4dLzU8/fgTeyTMztFqMaS1YCF0zSwXfspsZaIsyarGpLk5MbKRXka50E
   ieX1XXYPA0yhvDMq0v58yTWRT+5tLCCacNa1P+pSIeAimYwqqVVUpO4y4
   r9EB3IxbZxuRzb4HGcgrFbgaVbbPU/Xb+q2wJ1rDtpE5880UEPm/HZfyy
   A==;
X-CSE-ConnectionGUID: 3solNmKVRl29DLGbyjOEog==
X-CSE-MsgGUID: wbVyvvvsQ/aIyvIzU3AbOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67483088"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="67483088"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 00:52:23 -0800
X-CSE-ConnectionGUID: p6nO8qTDTiCKaTadouO5hA==
X-CSE-MsgGUID: nfTUGjKHSoaoRGl9o4UpRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="196357649"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Dec 2025 00:52:22 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vULMR-000000007NW-2L6k;
	Sat, 13 Dec 2025 08:52:19 +0000
Date: Sat, 13 Dec 2025 16:51:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/hid/hid-haptic.c:187 fill_effect_buf() error: uninitialized
 symbol 'value'.
Message-ID: <202512131647.YlAb6Hdx-lkp@intel.com>
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
TO: Angela Czubak <aczubak@google.com>
CC: Benjamin Tissoires <bentiss@kernel.org>
CC: Jonathan Denose <jdenose@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a859eca0e4cc96f63ff125dbe5388d961558b0e9
commit: 344ff358495706abc7aac1e0c59a5bb16b350307 HID: haptic: initialize haptic device
date:   3 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-141-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131647.YlAb6Hdx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512131647.YlAb6Hdx-lkp@intel.com/

smatch warnings:
drivers/hid/hid-haptic.c:187 fill_effect_buf() error: uninitialized symbol 'value'.

vim +/value +187 drivers/hid/hid-haptic.c

344ff358495706 Angela Czubak 2025-08-18  140  
344ff358495706 Angela Czubak 2025-08-18  141  static void fill_effect_buf(struct hid_haptic_device *haptic,
344ff358495706 Angela Czubak 2025-08-18  142  			    struct ff_haptic_effect *effect,
344ff358495706 Angela Czubak 2025-08-18  143  			    struct hid_haptic_effect *haptic_effect,
344ff358495706 Angela Czubak 2025-08-18  144  			    int waveform_ordinal)
344ff358495706 Angela Czubak 2025-08-18  145  {
344ff358495706 Angela Czubak 2025-08-18  146  	struct hid_report *rep = haptic->manual_trigger_report;
344ff358495706 Angela Czubak 2025-08-18  147  	struct hid_usage *usage;
344ff358495706 Angela Czubak 2025-08-18  148  	struct hid_field *field;
344ff358495706 Angela Czubak 2025-08-18  149  	s32 value;
344ff358495706 Angela Czubak 2025-08-18  150  	int i, j;
344ff358495706 Angela Czubak 2025-08-18  151  	u8 *buf = haptic_effect->report_buf;
344ff358495706 Angela Czubak 2025-08-18  152  
344ff358495706 Angela Czubak 2025-08-18  153  	mutex_lock(&haptic->manual_trigger_mutex);
344ff358495706 Angela Czubak 2025-08-18  154  	for (i = 0; i < rep->maxfield; i++) {
344ff358495706 Angela Czubak 2025-08-18  155  		field = rep->field[i];
344ff358495706 Angela Czubak 2025-08-18  156  		/* Ignore if report count is out of bounds. */
344ff358495706 Angela Czubak 2025-08-18  157  		if (field->report_count < 1)
344ff358495706 Angela Czubak 2025-08-18  158  			continue;
344ff358495706 Angela Czubak 2025-08-18  159  
344ff358495706 Angela Czubak 2025-08-18  160  		for (j = 0; j < field->maxusage; j++) {
344ff358495706 Angela Czubak 2025-08-18  161  			usage = &field->usage[j];
344ff358495706 Angela Czubak 2025-08-18  162  
344ff358495706 Angela Czubak 2025-08-18  163  			switch (usage->hid) {
344ff358495706 Angela Czubak 2025-08-18  164  			case HID_HP_INTENSITY:
344ff358495706 Angela Czubak 2025-08-18  165  				if (effect->intensity > 100) {
344ff358495706 Angela Czubak 2025-08-18  166  					value = field->logical_maximum;
344ff358495706 Angela Czubak 2025-08-18  167  				} else {
344ff358495706 Angela Czubak 2025-08-18  168  					value = field->logical_minimum +
344ff358495706 Angela Czubak 2025-08-18  169  						effect->intensity *
344ff358495706 Angela Czubak 2025-08-18  170  						(field->logical_maximum -
344ff358495706 Angela Czubak 2025-08-18  171  						 field->logical_minimum) / 100;
344ff358495706 Angela Czubak 2025-08-18  172  				}
344ff358495706 Angela Czubak 2025-08-18  173  				break;
344ff358495706 Angela Czubak 2025-08-18  174  			case HID_HP_REPEATCOUNT:
344ff358495706 Angela Czubak 2025-08-18  175  				value = effect->repeat_count;
344ff358495706 Angela Czubak 2025-08-18  176  				break;
344ff358495706 Angela Czubak 2025-08-18  177  			case HID_HP_RETRIGGERPERIOD:
344ff358495706 Angela Czubak 2025-08-18  178  				value = effect->retrigger_period;
344ff358495706 Angela Czubak 2025-08-18  179  				break;
344ff358495706 Angela Czubak 2025-08-18  180  			case HID_HP_MANUALTRIGGER:
344ff358495706 Angela Czubak 2025-08-18  181  				value = waveform_ordinal;
344ff358495706 Angela Czubak 2025-08-18  182  				break;
344ff358495706 Angela Czubak 2025-08-18  183  			default:
344ff358495706 Angela Czubak 2025-08-18  184  				break;
344ff358495706 Angela Czubak 2025-08-18  185  			}
344ff358495706 Angela Czubak 2025-08-18  186  
344ff358495706 Angela Czubak 2025-08-18 @187  			field->value[j] = value;
344ff358495706 Angela Czubak 2025-08-18  188  		}
344ff358495706 Angela Czubak 2025-08-18  189  	}
344ff358495706 Angela Czubak 2025-08-18  190  
344ff358495706 Angela Czubak 2025-08-18  191  	hid_output_report(rep, buf);
344ff358495706 Angela Czubak 2025-08-18  192  	mutex_unlock(&haptic->manual_trigger_mutex);
344ff358495706 Angela Czubak 2025-08-18  193  }
344ff358495706 Angela Czubak 2025-08-18  194  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
