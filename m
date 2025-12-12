Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1E22E06EF
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 09:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765532631; cv=none; b=SCaTXPEC2YdvH7E2W+WCHMrAtvYfOu7k19AiJGqyqms8e5QcZwrE/1N0YrE1cNKNLM1UTTJ36cONojmIim5sxQSgukij1dOm9exIFcYTN6jOevpc4IL2Ps0fGZRpBy1/Y1uKD8BOQVWHaypQvWu2KMmX4iB/kaeT0b6cxnQvAPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765532631; c=relaxed/simple;
	bh=00B62pRYSyjjQiylbV7rNNJsudkBfk7gsxv1V5T2Tok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qkdtaDMUKvCIfMiFMwded1JsQfSGBy82QxirhSBEpGEoQ21oDRvP9HRgAkckIYx0UmM08k0mljTkYgqxDjVLMEG8IOm6ml06qxR9Ul0gnLW1diVjRgnpxY7/TgqzRValUSNlec+e2nWMb+fvye35jQkidjkxHYYnr22JV+bMwRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V1SG/wu0; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V1SG/wu0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765532627; x=1797068627;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=00B62pRYSyjjQiylbV7rNNJsudkBfk7gsxv1V5T2Tok=;
  b=V1SG/wu0e6Wa8zWXdnkiBE+fraeJQCbiGy7I5QKqd3y9u0iEe94WrKyT
   kUpBjbRJg9hnV9q8mVaKcDMzqazQymMY1xR6cEKJJ10Q3IBzd3ZrZjw96
   1hyHGeDf1FTILAd6rzNvxLBuNM+d9PJc4oJ2rAD/AONklWZ1TUDd26Bxs
   m72kyulLy7KBsRfnFS9++wcIFnxRXIwlfrCqknGcuL61cYegtkUDGw2aM
   mjKa0DfKnI4x6OqT/t2kvLnUcubvmI/O81Y3R1h4YIK5m4FziyeEcG9/a
   0RmxmjPp/iyiLZb1YI0xzmwIkC8k2uWN6A8iYhJubmdZqtLURG+kpE6QY
   Q==;
X-CSE-ConnectionGUID: 0j5gGipoRIivFdimgWbtNA==
X-CSE-MsgGUID: Lp4VvmV8RFaPGxYYggFGqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71390864"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="71390864"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 01:43:45 -0800
X-CSE-ConnectionGUID: xQWVRLFhSKCwZOsGqnS62g==
X-CSE-MsgGUID: 8kdipEg9SomI5p51ACdoew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="234441078"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Dec 2025 01:43:44 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTzgb-000000005sy-3qJG;
	Fri, 12 Dec 2025 09:43:41 +0000
Date: Fri, 12 Dec 2025 17:43:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/hda/codecs/ca0132.c:2427 dspio_scp() error: we previously
 assumed 'reply_len' could be null (see line 2390)
Message-ID: <202512121726.wCjwtR6C-lkp@intel.com>
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
TO: Takashi Iwai <tiwai@suse.de>
CC: Richard Fitzgerald <rf@opensource.cirrus.com>

Hi Takashi,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: 6014e9021b28e634935c776c0271b5cbcabdc5d6 ALSA: hda: Move codec drivers into sound/hda/codecs directory
date:   5 months ago
:::::: branch date: 30 hours ago
:::::: commit date: 5 months ago
config: alpha-randconfig-r072-20251212 (https://download.01.org/0day-ci/archive/20251212/202512121726.wCjwtR6C-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512121726.wCjwtR6C-lkp@intel.com/

smatch warnings:
sound/hda/codecs/ca0132.c:2427 dspio_scp() error: we previously assumed 'reply_len' could be null (see line 2390)
sound/hda/codecs/ca0132.c:8618 ca0132_download_dsp_images() error: we previously assumed 'fw_entry' could be null (see line 8611)
sound/hda/codecs/ca0132.c:8629 ca0132_download_dsp_images() warn: 'fw_entry' from request_firmware() not released on lines: 8615.
sound/hda/codecs/ca0132.c:8629 ca0132_download_dsp_images() warn: 'fw_entry' from request_firmware() not released on lines: 8615.

vim +/reply_len +2427 sound/hda/codecs/ca0132.c

01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2354  
d5c21b88e8df07 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2355  /**
3531ba21f5520d sound/pci/hda/patch_ca0132.c Pierre-Louis Bossart 2021-03-01  2356   * dspio_scp - Prepare and send the SCP message to DSP
d5c21b88e8df07 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2357   * @codec: the HDA codec
d5c21b88e8df07 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2358   * @mod_id: ID of the DSP module to send the command
4f5c26534d395b sound/pci/hda/patch_ca0132.c Pierre-Louis Bossart 2020-01-13  2359   * @src_id: ID of the source
d5c21b88e8df07 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2360   * @req: ID of request to send to the DSP module
d5c21b88e8df07 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2361   * @dir: SET or GET
d5c21b88e8df07 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2362   * @data: pointer to the data to send with the request, request specific
d5c21b88e8df07 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2363   * @len: length of the data, in bytes
d5c21b88e8df07 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2364   * @reply: point to the buffer to hold data returned for a reply
d5c21b88e8df07 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2365   * @reply_len: length of the reply buffer returned from GET
d5c21b88e8df07 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2366   *
d5c21b88e8df07 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2367   * Returns zero or a negative error code.
d5c21b88e8df07 sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2368   */
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2369  static int dspio_scp(struct hda_codec *codec,
447fd8e9a88e46 sound/pci/hda/patch_ca0132.c Connor McAdams       2018-05-08  2370  		int mod_id, int src_id, int req, int dir, const void *data,
447fd8e9a88e46 sound/pci/hda/patch_ca0132.c Connor McAdams       2018-05-08  2371  		unsigned int len, void *reply, unsigned int *reply_len)
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2372  {
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2373  	int status = 0;
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2374  	struct scp_msg scp_send, scp_reply;
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2375  	unsigned int ret_bytes, send_size, ret_size;
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2376  	unsigned int send_get_flag, reply_resp_flag, reply_error_flag;
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2377  	unsigned int reply_data_size;
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2378  
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2379  	memset(&scp_send, 0, sizeof(scp_send));
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2380  	memset(&scp_reply, 0, sizeof(scp_reply));
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2381  
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2382  	if ((len != 0 && data == NULL) || (len > SCP_MAX_DATA_WORDS))
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2383  		return -EINVAL;
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2384  
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2385  	if (dir == SCP_GET && reply == NULL) {
4e76a8833fac8d sound/pci/hda/patch_ca0132.c Takashi Iwai         2014-02-25  2386  		codec_dbg(codec, "dspio_scp get but has no buffer\n");
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2387  		return -EINVAL;
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2388  	}
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2389  
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20 @2390  	if (reply != NULL && (reply_len == NULL || (*reply_len == 0))) {
4e76a8833fac8d sound/pci/hda/patch_ca0132.c Takashi Iwai         2014-02-25  2391  		codec_dbg(codec, "dspio_scp bad resp buf len parms\n");
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2392  		return -EINVAL;
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2393  	}
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2394  
447fd8e9a88e46 sound/pci/hda/patch_ca0132.c Connor McAdams       2018-05-08  2395  	scp_send.hdr = make_scp_header(mod_id, src_id, (dir == SCP_GET), req,
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2396  				       0, 0, 0, len/sizeof(unsigned int));
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2397  	if (data != NULL && len > 0) {
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2398  		len = min((unsigned int)(sizeof(scp_send.data)), len);
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2399  		memcpy(scp_send.data, data, len);
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2400  	}
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2401  
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2402  	ret_bytes = 0;
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2403  	send_size = sizeof(unsigned int) + len;
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2404  	status = dspio_send_scp_message(codec, (unsigned char *)&scp_send,
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2405  					send_size, (unsigned char *)&scp_reply,
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2406  					sizeof(scp_reply), &ret_bytes);
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2407  
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2408  	if (status < 0) {
4e76a8833fac8d sound/pci/hda/patch_ca0132.c Takashi Iwai         2014-02-25  2409  		codec_dbg(codec, "dspio_scp: send scp msg failed\n");
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2410  		return status;
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2411  	}
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2412  
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2413  	/* extract send and reply headers members */
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2414  	extract_scp_header(scp_send.hdr, NULL, NULL, &send_get_flag,
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2415  			   NULL, NULL, NULL, NULL, NULL);
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2416  	extract_scp_header(scp_reply.hdr, NULL, NULL, NULL, NULL, NULL,
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2417  			   &reply_resp_flag, &reply_error_flag,
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2418  			   &reply_data_size);
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2419  
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2420  	if (!send_get_flag)
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2421  		return 0;
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2422  
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2423  	if (reply_resp_flag && !reply_error_flag) {
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2424  		ret_size = (ret_bytes - sizeof(scp_reply.hdr))
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2425  					/ sizeof(unsigned int);
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2426  
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20 @2427  		if (*reply_len < ret_size*sizeof(unsigned int)) {
4e76a8833fac8d sound/pci/hda/patch_ca0132.c Takashi Iwai         2014-02-25  2428  			codec_dbg(codec, "reply too long for buf\n");
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2429  			return -EINVAL;
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2430  		} else if (ret_size != reply_data_size) {
4e76a8833fac8d sound/pci/hda/patch_ca0132.c Takashi Iwai         2014-02-25  2431  			codec_dbg(codec, "RetLen and HdrLen .NE.\n");
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2432  			return -EINVAL;
46a049dae771b9 sound/pci/hda/patch_ca0132.c Arnd Bergmann        2017-01-11  2433  		} else if (!reply) {
46a049dae771b9 sound/pci/hda/patch_ca0132.c Arnd Bergmann        2017-01-11  2434  			codec_dbg(codec, "NULL reply\n");
46a049dae771b9 sound/pci/hda/patch_ca0132.c Arnd Bergmann        2017-01-11  2435  			return -EINVAL;
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2436  		} else {
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2437  			*reply_len = ret_size*sizeof(unsigned int);
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2438  			memcpy(reply, scp_reply.data, *reply_len);
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2439  		}
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2440  	} else {
4e76a8833fac8d sound/pci/hda/patch_ca0132.c Takashi Iwai         2014-02-25  2441  		codec_dbg(codec, "reply ill-formed or errflag set\n");
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2442  		return -EIO;
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2443  	}
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2444  
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2445  	return status;
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2446  }
01ef7dbffb411d sound/pci/hda/patch_ca0132.c Ian Minett           2012-09-20  2447  

:::::: The code at line 2427 was first introduced by commit
:::::: 01ef7dbffb411d9d78d1150b268d9c757f9f2f93 ALSA: hda - Update CA0132 codec to load DSP firmware binary

:::::: TO: Ian Minett <ian_minett@creativelabs.com>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
